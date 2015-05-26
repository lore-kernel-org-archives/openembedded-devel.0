Return-Path: <prvs=58117e38b=brandon.carpenter@pnnl.gov>
X-Greylist: delayed 3605 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 May 2015 21:06:34 UTC
Received: from Emailgw01.pnnl.gov (emailgw01.pnnl.gov [192.101.109.61])
	by mail.openembedded.org (Postfix) with ESMTP id 161857566F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 21:06:34 +0000 (UTC)
Received: from deluxe.pnl.gov (HELO [130.20.187.155]) ([130.20.187.155])
	by Emailgw01.pnnl.gov with ESMTP; 26 May 2015 13:06:15 -0700
Message-ID: <5564D236.3070702@pnnl.gov>
Date: Tue, 26 May 2015 13:06:14 -0700
From: Brandon Carpenter <brandon.carpenter@pnnl.gov>
Organization: Pacific Northwest National Laboratory
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python] sitecustomize module breaks non-interactive scripts
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 May 2015 21:06:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I'm helping someone setup a BeagleBone Black with Angstrom Linux based 
on OpemEmbedded and we've run into an issue executing virtualenv with 
Python 2.7. I've narrowed the problem down to 
/usr/lib/python2.7/sitecustomize.py. This script, which is executed 
during early Python initialization, imports the readline module and, in 
the process, prints some escape characters to stdout. When the output of 
a script is piped to another process, those unexpected escape characters 
are the first to be read.

As an example, executing

     python2 -c 'pass' | python2 -c 'print 
repr(__import__("sys").stdin.read())'

prints '\x1b[?1034h' when '' (the empty string) is expected.

For virtualenv, you end up with the following error when it tries to 
pipe sys.prefix from one python instance to another:

> New python executable in env/bin/python
> ERROR: The executable env/bin/python is not functioning
> ERROR: It thinks sys.prefix is 
> u'/home/user/volttron/\x1b[?1034h/home/user/volttron/testenv' (should 
> be u'/home/user/volttron/testenv')
> ERROR: virtualenv is not compatible with this system or executable

I have thought of a few solutions to the issue I wanted to bring to the 
developers attention:

1. Move sitecustomize.py to sitesetup.py (or something else) and add 
/etc/profile.d/pythonsetup.sh to set the PYTHONSETUP environment 
variable to that script.

This, IMHO, is probably the best solution as the PYTHONSETUP script is 
only executed in interactive mode. It also makes it trivial users to 
disable, by unsetting the environment variable, or override/extend, by 
setting the environment variable to their desired script.

2. Provide an environment variable, like DISABLE_SITE_READLINE, to 
prevent readline configuration in sitecustomize.py.

This is my least favorite solution because Python remains broken by 
default and someone has to know about the environment variable to fix it.

3. Use some magic in the sitecustomize script to make it all work as 
expected.

This would be a good compromise as it moves the readline configuration 
to the PYTHONSETUP execution phase, while still implementing it in 
sitecustomize.py and allowing user PYTHONSETUP scripts. Here is the 
suggested sitecustomize.py:

> # OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer 
> <mlauer@vanille-media.de>
> # GPLv2 or later
> # Version: 20081123
> # Features:
> # * set proper default encoding
> # * enable readline completion in the interactive interpreter
> # * load command line history on startup
> # * save command line history on exit
>
>
> '''Use readline to make the interactive interpreter more friendly.
>
> The readline module should only be imported in interactive mode because
> it has side-effects which may interfere with the output of scripts. But
> because sitecustomize is executed at such an early stage of Python
> initialization it cannot determine if Python is executed interactively.
> Therefore, this script injects itself as the PYTHONSETUP script where
> interactivity can be determined. The PYTHONSETUP environment is first
> saved in the environment so it can later be restored. Then, PYTHONSETUP
> is set to this script. After executing this script as the PYTHONSETUP
> script, the original PYTHONSETUP, script is restored and, if set, is
> exectuted.
> '''
>
>
> def main():
>     '''This function wraps up the script to keep the environment clean.'''
>
>     import os
>
>     def __exithandler():
>         try:
>             readline.write_history_file( "%s/.python-history" % 
> os.getenv( "HOME", "/tmp" ) )
>         except IOError:
>             pass
>
>     def __registerExitHandler():
>         import atexit
>         atexit.register( __exithandler )
>
>     def __enableReadlineSupport():
>         readline.set_history_length( 1000 )
>         readline.parse_and_bind( "tab: complete" )
>         try:
>             readline.read_history_file( "%s/.python-history" % 
> os.getenv( "HOME", "/tmp" ) )
>         except IOError:
>             pass
>
>     def __enableDefaultEncoding():
>         import sys
>         try:
>             sys.setdefaultencoding( "utf8" )
>         except LookupError:
>             pass
>
>     def __execPythonStartup():
>         try:
>             filename = os.environ.pop('__PYTHONSTARTUP__')
>         except KeyError:
>             os.environ.pop('PYTHONSTARTUP', None)
>         else:
>             os.environ['PYTHONSTARTUP'] = filename
>             if filename:
>                 execfile(filename)
>
>     def __savePythonStartup():
>         try:
>             os.environ['__PYTHONSTARTUP__'] = os.environ['PYTHONSTARTUP']
>         except KeyError:
>             pass
>         os.environ['PYTHONSTARTUP'] = __file__
>
>
>     if __name__ == '__main__':
>         # Executing as PYTHONSETUP script
>         try:
>             import rlcompleter, readline
>         except ImportError:
>             pass
>         else:
>             __registerExitHandler()
>             __enableReadlineSupport()
>         __execPythonStartup()
>     else:
>         # Executing as sitecustomize
>         __enableDefaultEncoding()
>         __savePythonStartup()
>
> main()
> del main

I can post the above script as a patch, if desired.

Are there other suggestions/solutions?

Thank you,

Brandon

