Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Pcm5A-0000J1-98
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 22:48:48 +0100
Received: by fxm17 with SMTP id 17so19643255fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 13:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=AiYA7DumNGAqdoA2iF2gbLuN9MpE8ax6WG1STSO5Rfg=;
	b=tWUYwzpbH5m/dpl8Cm8DdTPnk060JoRyw13x2GV3VIHOCizD9vkX0NEgjkCDYoBxRy
	mJDD2MwF36+qNmiT5Qz6kqbysLmxFWc/bs4yTDQXI3A/Hp9nMFI8CFyZ9UudFeiy0rDG
	92pm7vZZE34GyDEAOOwQNKB7ieriZ23IqLLx8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=In+Py66KgefflzwotnQTjX+4sv5SR5R740ZpiTG1vXYDLPLsSvb6L0aVSdW1+HLw8F
	AR2eCU73F2DWguautCc/nQ8sc1JVHM0IgIX690axALSyjS9gKzGYLk9D7ozTFzN739qa
	qoPMi8DdRQz5oGQJz+MGN20WPFkbhB+jJnf8I=
Received: by 10.223.102.79 with SMTP id f15mr121237fao.134.1294782497267;
	Tue, 11 Jan 2011 13:48:17 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id a6sm1123314fak.1.2011.01.11.13.48.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 13:48:16 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pcm4c-0002ZL-6R; Tue, 11 Jan 2011 22:48:14 +0100
Date: Tue, 11 Jan 2011 22:48:14 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110111214814.GH6584@mx.loc>
References: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
	<1294318110-23521-3-git-send-email-obi@opendreambox.org>
	<4D2CBE1D.9030303@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4D2CBE1D.9030303@opendreambox.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 3/4] unpack.py: add SRC_URI parameter unpack=<bool> (default: true)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jan 2011 21:48:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 11, 2011 at 09:31:25PM +0100, Andreas Oberritter wrote:
>Ping.
>
>On 01/06/2011 01:48 PM, Andreas Oberritter wrote:
>> * This allows to download compressed files without extracting them
>> * Use case: gcj requires ecj.jar, which must be downloaded separately
>>   and put into the gcc source directory before configure gets executed.
>> 
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> CC: Chris Larson <chris_larson@mentor.com>
>> ---
>>  classes/base.bbclass                      |    3 +-
>>  docs/usermanual/reference/var_src_uri.xml |   13 ++++-
>>  lib/oe/unpack.py                          |   81 +++++++++++++++++------------
>>  3 files changed, 61 insertions(+), 36 deletions(-)
>> 
>> diff --git a/classes/base.bbclass b/classes/base.bbclass
>> index c76b77d..25d72d4 100644
>> --- a/classes/base.bbclass
>> +++ b/classes/base.bbclass
>> @@ -190,12 +190,11 @@ def oe_unpack(d, local, urldata):
>>          bb.mkdirhier(destdir)
>>      else:
>>          destdir = workdir
>> -    dos = urldata.parm.get("dos")
>>  
>>      bb.note("Unpacking %s to %s/" % (base_path_out(local, d),
>>                                       base_path_out(destdir, d)))
>>      try:
>> -        unpack_file(local, destdir, env={"PATH": d.getVar("PATH", True)}, dos=dos)
>> +        unpack_file(local, destdir, urldata.parm, env={"PATH": d.getVar("PATH", True)})
>>      except UnpackError, exc:
>>          bb.fatal(str(exc))
>>  
>> diff --git a/docs/usermanual/reference/var_src_uri.xml b/docs/usermanual/reference/var_src_uri.xml
>> index 706452f..521c7d5 100644
>> --- a/docs/usermanual/reference/var_src_uri.xml
>> +++ b/docs/usermanual/reference/var_src_uri.xml
>> @@ -91,7 +91,8 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
>>    it is unpacked into the work directory, <command>${WORKDIR}</command>. The
>>    unpacker recognises several archive and compression types and for these it
>>    will decompress any compressed files and extract all of the files from
>> -  archives into the work directory. The supported types are:</para>
>> +  archives into the work directory, unless the option <command>unpack=no</command>
>> +  is set for the given file. The supported types are:</para>
>>  
>>    <variablelist>
>>      <varlistentry>
>> @@ -192,6 +193,16 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
>>            md5sum option provided.</para>
>>          </listitem>
>>        </varlistentry>
>> +
>> +      <varlistentry>
>> +        <term>unpack={yes|no}</term>
>> +
>> +        <listitem>
>> +          <para>If set to 'yes' (default) and the source file is an archive,
>> +          then the archive will be decompressed and unpacked into the ${WORKDIR}.
>> +	  Otherwise, the archive will be copied into the ${WORKDIR}.</para>

mixed tab and spaces for indentation.

>> +        </listitem>
>> +      </varlistentry>
>>      </variablelist>
>>  
>>      <para>Related variables:</para>
>> diff --git a/lib/oe/unpack.py b/lib/oe/unpack.py
>> index e4fe5d8..8e8bf36 100644
>> --- a/lib/oe/unpack.py
>> +++ b/lib/oe/unpack.py
>> @@ -47,47 +47,62 @@ def subprocess_setup():
>>      # non-Python subprocesses expect.
>>      signal.signal(signal.SIGPIPE, signal.SIG_DFL)
>>  
>> -def unpack_file(file, destdir, dos=False, env=None):
>> +def unpack_file(file, destdir, parameters, env=None):
>>      import subprocess, shutil
>>  
>> +    try:
>> +        dos = to_boolean(parameters.get("dos"), False)

dict().get defaults to None. (None,'',u'',False) is False, so passing in
a default of False to to_boolean -- which will return False "if not
string" (and should
if not string or not isinstance(string, basestring):
	return False
, as a sidenote)
is superfluous.

>> +    except ValueError, exc:

I think the more modern for is to use 'as'

>> +        bb.fatal("Invalid value for 'dos' parameter for %s: %s" %
>> +                 (filename, parameters.get("dos")))

I would have let to_boolean raise this through, but as you prefer.
>> +
>> +    try:
>> +        unpack = to_boolean(parameters.get("unpack"), True)
>> +    except ValueError, exc:
>> +        bb.fatal("Invalid value for 'unpack' parameter for %s: %s" %
>> +                 (filename, parameters.get("unpack")))

ditto.
>> +
>>      dest = os.path.join(destdir, os.path.basename(file))
>>      if os.path.exists(dest):
>>          if os.path.samefile(file, dest):
>>              return True
>>  
>>      cmd = None
>> -    if file.endswith('.tar'):
>> -        cmd = 'tar x --no-same-owner -f %s' % file
>> -    elif file.endswith('.tgz') or file.endswith('.tar.gz') or file.endswith('.tar.Z'):
>> -        cmd = 'tar xz --no-same-owner -f %s' % file
>> -    elif file.endswith('.tbz') or file.endswith('.tbz2') or file.endswith('.tar.bz2'):
>> -        cmd = 'bzip2 -dc %s | tar x --no-same-owner -f -' % file
>> -    elif file.endswith('.gz') or file.endswith('.Z') or file.endswith('.z'):
>> -        root, ext = os.path.splitext(file)
>> -        cmd = 'gzip -dc %s > %s' % (file, os.path.basename(root))
>> -    elif file.endswith('.bz2'):
>> -        root, ext = os.path.splitext(file)
>> -        cmd = 'bzip2 -dc %s > %s' % (file, os.path.basename(root))
>> -    elif file.endswith('.tar.xz'):
>> -        cmd = 'xz -dc %s | tar x --no-same-owner -f -' % file
>> -    elif file.endswith('.xz'):
>> -        root, ext = os.path.splitext(file)
>> -        cmd = 'xz -dc %s > %s' % (file, os.path.basename(root))
>> -    elif file.endswith('.tar.lz'):
>> -        cmd = 'lzip -dc %s | tar x --no-same-owner -f -' % file
>> -    elif file.endswith('.lz'):
>> -        root, ext = os.path.splitext(file)
>> -        cmd = 'lzip -dc %s > %s' % (file, os.path.basename(root))
>> -    elif file.endswith('.zip') or file.endswith('.jar'):
>> -        cmd = 'unzip -q -o'
>> -        if dos:
>> -            cmd = '%s -a' % cmd
>> -        cmd = "%s '%s'" % (cmd, file)
>> -    elif os.path.isdir(file):
>> -        shutil.rmtree(dest, True)
>> -        shutil.copytree(file, dest, True)
>> -    else:
>> -        shutil.copy2(file, dest)
>> +    if unpack:
>> +        if file.endswith('.tar'):
>> +            cmd = 'tar x --no-same-owner -f %s' % file
>> +        elif file.endswith('.tgz') or file.endswith('.tar.gz') or file.endswith('.tar.Z'):
>> +            cmd = 'tar xz --no-same-owner -f %s' % file
>> +        elif file.endswith('.tbz') or file.endswith('.tbz2') or file.endswith('.tar.bz2'):
>> +            cmd = 'bzip2 -dc %s | tar x --no-same-owner -f -' % file
>> +        elif file.endswith('.gz') or file.endswith('.Z') or file.endswith('.z'):
>> +            root, ext = os.path.splitext(file)
>> +            cmd = 'gzip -dc %s > %s' % (file, os.path.basename(root))
>> +        elif file.endswith('.bz2'):
>> +            root, ext = os.path.splitext(file)
>> +            cmd = 'bzip2 -dc %s > %s' % (file, os.path.basename(root))
>> +        elif file.endswith('.tar.xz'):
>> +            cmd = 'xz -dc %s | tar x --no-same-owner -f -' % file
>> +        elif file.endswith('.xz'):
>> +            root, ext = os.path.splitext(file)
>> +            cmd = 'xz -dc %s > %s' % (file, os.path.basename(root))
>> +        elif file.endswith('.tar.lz'):
>> +            cmd = 'lzip -dc %s | tar x --no-same-owner -f -' % file
>> +        elif file.endswith('.lz'):
>> +            root, ext = os.path.splitext(file)
>> +            cmd = 'lzip -dc %s > %s' % (file, os.path.basename(root))
>> +        elif file.endswith('.zip') or file.endswith('.jar'):
>> +            cmd = 'unzip -q -o'
>> +            if dos:
>> +                cmd = '%s -a' % cmd
>> +            cmd = "%s '%s'" % (cmd, file)
>> +
>> +    if not unpack or not cmd:
>> +        if os.path.isdir(file):
>> +            shutil.rmtree(dest, True)
>> +            shutil.copytree(file, dest, True)
>> +        else:
>> +            shutil.copy2(file, dest)

Don't know offhand but
- bb.utils.remove(dest, True)
or equivalent facility (or wrapper) in lib/oe?
>>  
>>      if not cmd:
>>          return

Thanks && cheers,


