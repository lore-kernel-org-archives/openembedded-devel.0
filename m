Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Pcksr-0007Oi-9C
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 21:32:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 902BD314CCBF;
	Tue, 11 Jan 2011 21:31:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 0i39Bu-Mjkef; Tue, 11 Jan 2011 21:31:27 +0100 (CET)
Received: from [172.22.22.61] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 52EFD314CC72;
	Tue, 11 Jan 2011 21:31:27 +0100 (CET)
Message-ID: <4D2CBE1D.9030303@opendreambox.org>
Date: Tue, 11 Jan 2011 21:31:25 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101210 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
	<1294318110-23521-3-git-send-email-obi@opendreambox.org>
In-Reply-To: <1294318110-23521-3-git-send-email-obi@opendreambox.org>
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
X-List-Received-Date: Tue, 11 Jan 2011 20:32:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ping.

On 01/06/2011 01:48 PM, Andreas Oberritter wrote:
> * This allows to download compressed files without extracting them
> * Use case: gcj requires ecj.jar, which must be downloaded separately
>   and put into the gcc source directory before configure gets executed.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Chris Larson <chris_larson@mentor.com>
> ---
>  classes/base.bbclass                      |    3 +-
>  docs/usermanual/reference/var_src_uri.xml |   13 ++++-
>  lib/oe/unpack.py                          |   81 +++++++++++++++++------------
>  3 files changed, 61 insertions(+), 36 deletions(-)
> 
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index c76b77d..25d72d4 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -190,12 +190,11 @@ def oe_unpack(d, local, urldata):
>          bb.mkdirhier(destdir)
>      else:
>          destdir = workdir
> -    dos = urldata.parm.get("dos")
>  
>      bb.note("Unpacking %s to %s/" % (base_path_out(local, d),
>                                       base_path_out(destdir, d)))
>      try:
> -        unpack_file(local, destdir, env={"PATH": d.getVar("PATH", True)}, dos=dos)
> +        unpack_file(local, destdir, urldata.parm, env={"PATH": d.getVar("PATH", True)})
>      except UnpackError, exc:
>          bb.fatal(str(exc))
>  
> diff --git a/docs/usermanual/reference/var_src_uri.xml b/docs/usermanual/reference/var_src_uri.xml
> index 706452f..521c7d5 100644
> --- a/docs/usermanual/reference/var_src_uri.xml
> +++ b/docs/usermanual/reference/var_src_uri.xml
> @@ -91,7 +91,8 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
>    it is unpacked into the work directory, <command>${WORKDIR}</command>. The
>    unpacker recognises several archive and compression types and for these it
>    will decompress any compressed files and extract all of the files from
> -  archives into the work directory. The supported types are:</para>
> +  archives into the work directory, unless the option <command>unpack=no</command>
> +  is set for the given file. The supported types are:</para>
>  
>    <variablelist>
>      <varlistentry>
> @@ -192,6 +193,16 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
>            md5sum option provided.</para>
>          </listitem>
>        </varlistentry>
> +
> +      <varlistentry>
> +        <term>unpack={yes|no}</term>
> +
> +        <listitem>
> +          <para>If set to 'yes' (default) and the source file is an archive,
> +          then the archive will be decompressed and unpacked into the ${WORKDIR}.
> +	  Otherwise, the archive will be copied into the ${WORKDIR}.</para>
> +        </listitem>
> +      </varlistentry>
>      </variablelist>
>  
>      <para>Related variables:</para>
> diff --git a/lib/oe/unpack.py b/lib/oe/unpack.py
> index e4fe5d8..8e8bf36 100644
> --- a/lib/oe/unpack.py
> +++ b/lib/oe/unpack.py
> @@ -47,47 +47,62 @@ def subprocess_setup():
>      # non-Python subprocesses expect.
>      signal.signal(signal.SIGPIPE, signal.SIG_DFL)
>  
> -def unpack_file(file, destdir, dos=False, env=None):
> +def unpack_file(file, destdir, parameters, env=None):
>      import subprocess, shutil
>  
> +    try:
> +        dos = to_boolean(parameters.get("dos"), False)
> +    except ValueError, exc:
> +        bb.fatal("Invalid value for 'dos' parameter for %s: %s" %
> +                 (filename, parameters.get("dos")))
> +
> +    try:
> +        unpack = to_boolean(parameters.get("unpack"), True)
> +    except ValueError, exc:
> +        bb.fatal("Invalid value for 'unpack' parameter for %s: %s" %
> +                 (filename, parameters.get("unpack")))
> +
>      dest = os.path.join(destdir, os.path.basename(file))
>      if os.path.exists(dest):
>          if os.path.samefile(file, dest):
>              return True
>  
>      cmd = None
> -    if file.endswith('.tar'):
> -        cmd = 'tar x --no-same-owner -f %s' % file
> -    elif file.endswith('.tgz') or file.endswith('.tar.gz') or file.endswith('.tar.Z'):
> -        cmd = 'tar xz --no-same-owner -f %s' % file
> -    elif file.endswith('.tbz') or file.endswith('.tbz2') or file.endswith('.tar.bz2'):
> -        cmd = 'bzip2 -dc %s | tar x --no-same-owner -f -' % file
> -    elif file.endswith('.gz') or file.endswith('.Z') or file.endswith('.z'):
> -        root, ext = os.path.splitext(file)
> -        cmd = 'gzip -dc %s > %s' % (file, os.path.basename(root))
> -    elif file.endswith('.bz2'):
> -        root, ext = os.path.splitext(file)
> -        cmd = 'bzip2 -dc %s > %s' % (file, os.path.basename(root))
> -    elif file.endswith('.tar.xz'):
> -        cmd = 'xz -dc %s | tar x --no-same-owner -f -' % file
> -    elif file.endswith('.xz'):
> -        root, ext = os.path.splitext(file)
> -        cmd = 'xz -dc %s > %s' % (file, os.path.basename(root))
> -    elif file.endswith('.tar.lz'):
> -        cmd = 'lzip -dc %s | tar x --no-same-owner -f -' % file
> -    elif file.endswith('.lz'):
> -        root, ext = os.path.splitext(file)
> -        cmd = 'lzip -dc %s > %s' % (file, os.path.basename(root))
> -    elif file.endswith('.zip') or file.endswith('.jar'):
> -        cmd = 'unzip -q -o'
> -        if dos:
> -            cmd = '%s -a' % cmd
> -        cmd = "%s '%s'" % (cmd, file)
> -    elif os.path.isdir(file):
> -        shutil.rmtree(dest, True)
> -        shutil.copytree(file, dest, True)
> -    else:
> -        shutil.copy2(file, dest)
> +    if unpack:
> +        if file.endswith('.tar'):
> +            cmd = 'tar x --no-same-owner -f %s' % file
> +        elif file.endswith('.tgz') or file.endswith('.tar.gz') or file.endswith('.tar.Z'):
> +            cmd = 'tar xz --no-same-owner -f %s' % file
> +        elif file.endswith('.tbz') or file.endswith('.tbz2') or file.endswith('.tar.bz2'):
> +            cmd = 'bzip2 -dc %s | tar x --no-same-owner -f -' % file
> +        elif file.endswith('.gz') or file.endswith('.Z') or file.endswith('.z'):
> +            root, ext = os.path.splitext(file)
> +            cmd = 'gzip -dc %s > %s' % (file, os.path.basename(root))
> +        elif file.endswith('.bz2'):
> +            root, ext = os.path.splitext(file)
> +            cmd = 'bzip2 -dc %s > %s' % (file, os.path.basename(root))
> +        elif file.endswith('.tar.xz'):
> +            cmd = 'xz -dc %s | tar x --no-same-owner -f -' % file
> +        elif file.endswith('.xz'):
> +            root, ext = os.path.splitext(file)
> +            cmd = 'xz -dc %s > %s' % (file, os.path.basename(root))
> +        elif file.endswith('.tar.lz'):
> +            cmd = 'lzip -dc %s | tar x --no-same-owner -f -' % file
> +        elif file.endswith('.lz'):
> +            root, ext = os.path.splitext(file)
> +            cmd = 'lzip -dc %s > %s' % (file, os.path.basename(root))
> +        elif file.endswith('.zip') or file.endswith('.jar'):
> +            cmd = 'unzip -q -o'
> +            if dos:
> +                cmd = '%s -a' % cmd
> +            cmd = "%s '%s'" % (cmd, file)
> +
> +    if not unpack or not cmd:
> +        if os.path.isdir(file):
> +            shutil.rmtree(dest, True)
> +            shutil.copytree(file, dest, True)
> +        else:
> +            shutil.copy2(file, dest)
>  
>      if not cmd:
>          return



