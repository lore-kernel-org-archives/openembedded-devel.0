Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4C42C745F1;
	Fri, 20 Apr 2018 12:03:23 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id m26-v6so4478354wrb.3;
	Fri, 20 Apr 2018 05:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rIRHX65qb0L/FnSJ8R04WTv5IqGB8aREvIDmyGSNGvM=;
	b=TYLREVImUp8T7yDha5wnCb++xAr6ze+gMdmTc8WUN3U2ttPGt69+0ZAuFHfOnQSu+h
	V1E1OXJnER1cslfWef7mFqUuy/6LFggA/AM0tiVNiNOvYDL4jy5vzHVPYRl4VOrUNS1y
	1BQle4qFRWX49ouj7E5HEoHZDTchNi0W91smEMqecuAiJQOHA19hzJeZmsbIPw4F8JOe
	fJkAHCPDiajrrlNhrWUKCSP6Cbe/JNE8ejfNe+F0qXYu2E6LosenQeezGKB6F6GKTjK2
	vzHBUKKZYFtScwiBe08yY5U3OGHvc8ghXkew5sK7VPKHW3XUjumGnSI2Tfydqc+m1CWI
	C3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rIRHX65qb0L/FnSJ8R04WTv5IqGB8aREvIDmyGSNGvM=;
	b=qth7MkYRezwoOmyTxP9z2kCw7b42cUTpXxDPAC8j9LcA5/r1RIo+eNLqtd1p+qtjpJ
	gj3s7gCDsWx/xI/EMODGemMOA2RaIlsXeWqEhKU6uRa+84pCEl0jMMSZd7Jy4JzNen2H
	DLdQH7VLA4iYTZx5IEYsh/em09sJVwbl5UmAZ0zH6Zr0/ZLTNsxYAfbHFSBaMsB2/kJo
	EwjSdFniCKHEdoB3HFE4JofjX7d1CyVcdvujn0je/Iydr4JDIqj3KWKhxO1mRJxFZVAY
	Q3H5eEXIMFd+1BCgt3mc8cOEpZSP0z6cC16yQEVUY1zh60Y/l1yK6bZvq1j24e+rrmE5
	jg9A==
X-Gm-Message-State: ALQs6tBjfXUv63N7gmHgCmtqmyk40Q4/iELVvMAggvzBQ3g0/MvRpTqa
	pmGIq3BPAt2A3CocA7m6kTfV8cOJPFvH9Jv0CPSZsQ==
X-Google-Smtp-Source: AIpwx4/BuVHjj03HL5DyRaWG4B101WpEUmPofMkVMPGHR4UeHx4WjwMRdFkMbSRilAdLare/icChnPURz/GF13AJI0Q=
X-Received: by 10.28.15.15 with SMTP id 15mr1809094wmp.60.1524225803420; Fri,
	20 Apr 2018 05:03:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Fri, 20 Apr 2018 05:03:22 -0700 (PDT)
In-Reply-To: <20180419134508.AA894232AEA@git.openembedded.org>
References: <152414550828.29269.11674339610003737461@git.openembedded.org>
	<20180419134508.AA894232AEA@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 20 Apr 2018 14:03:22 +0200
Message-ID: <CA+chaQeDsfMhA8BEDdLDVVTWONf0+3hkyPTLa+hGU0P+_i8NLA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Ola x Nilsson <ola.x.nilsson@axis.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 05/06: package.bbclass: Include dbgsrc for static libs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Apr 2018 12:03:23 -0000
Content-Type: text/plain; charset="UTF-8"

I haven't dig around this much, but some of my builds are now failing with:

ERROR: libsdl2-webos-2.0.4-86-r22 do_package: dwarfsrcfiles failed with
exit code 1 (cmd was 'dwarfsrcfiles' 'libsdl2-webos/2.0.4-86-r22/
package/usr/lib/libSDL2main.a'):
dwarfsrcfiles: libsdl2-webos/2.0.4-86-r22/package/usr/lib/libSDL2main.a:
not a valid ELF file
ERROR: libsdl2-webos-2.0.4-86-r22 do_package: Function failed:
split_and_strip_files

It's different version of libsdl2 than what's in oe-core now and the recipe
for it might be a bit broken.

$ file package/usr/lib/libSDL2main.a
package/usr/lib/libSDL2main.a: current ar archive

$ recipe-sysroot-native/usr/bin/dwarfsrcfiles package/usr/lib/libSDL2main.a
dwarfsrcfiles: package/usr/lib/libSDL2main.a: not a valid ELF file

$ ar x ../package/usr/lib/libSDL2main.a

contains only:
SDL_dummy_main.lo

Should we try a bit harder to check if the .a contains static library? In
the meantime I'll check what's going on in libsdl2-webos build and if the
same happens in oe-core libsdl2.

Regards,

On Thu, Apr 19, 2018 at 3:45 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>
> commit eefa5ba35663fabe1f3f8cf7f1ff126d51240613
> Author: Ola x Nilsson <ola.x.nilsson@axis.com>
> AuthorDate: Thu Apr 19 13:17:30 2018 +0200
>
>     package.bbclass: Include dbgsrc for static libs
>
>     The debugsource must be added from the package providing the static
>     lib, because any package using that lib does not have access to the
>     source code.
>
>     Fixes [YOCTO #12558]
>
>     Signed-off-by: Ola x Nilsson <olani@axis.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/package.bbclass | 44 ++++++++++++++++++++++++++++++
> ++------------
>  1 file changed, 32 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 7978307..fff7ceb 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -344,6 +344,20 @@ def parse_debugsources_from_dwarfs
> rcfiles_output(dwarfsrcfiles_output):
>
>      return debugfiles.keys()
>
> +def append_source_info(file, sourcefile, d):
> +    cmd = "'dwarfsrcfiles' '%s'" % (file)
> +    (retval, output) = oe.utils.getstatusoutput(cmd)
> +    # 255 means a specific file wasn't fully parsed to get the debug file
> list, which is not a fatal failure
> +    if retval != 0 and retval != 255:
> +        bb.fatal("dwarfsrcfiles failed with exit code %s (cmd was %s)%s"
> % (retval, cmd, ":\n%s" % output if output else ""))
> +
> +    debugsources = parse_debugsources_from_dwarfsrcfiles_output(output)
> +    # filenames are null-separated - this is an artefact of the previous
> use
> +    # of rpm's debugedit, which was writing them out that way, and the
> code elsewhere
> +    # is still assuming that.
> +    debuglistoutput = '\0'.join(debugsources) + '\0'
> +    open(sourcefile, 'a').write(debuglistoutput)
> +
>
>  def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
>      # Function to split a single file into two components, one is the
> stripped
> @@ -369,18 +383,7 @@ def splitdebuginfo(file, debugfile, debugsrcdir,
> sourcefile, d):
>
>      # We need to extract the debug src information here...
>      if debugsrcdir:
> -        cmd = "'dwarfsrcfiles' '%s'" % (file)
> -        (retval, output) = oe.utils.getstatusoutput(cmd)
> -        # 255 means a specific file wasn't fully parsed to get the debug
> file list, which is not a fatal failure
> -        if retval != 0 and retval != 255:
> -            bb.fatal("dwarfsrcfiles failed with exit code %s (cmd was
> %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
> -
> -        debugsources = parse_debugsources_from_dwarfs
> rcfiles_output(output)
> -        # filenames are null-separated - this is an artefact of the
> previous use
> -        # of rpm's debugedit, which was writing them out that way, and
> the code elsewhere
> -        # is still assuming that.
> -        debuglistoutput = '\0'.join(debugsources) + '\0'
> -        open(sourcefile, 'a').write(debuglistoutput)
> +        append_source_info(file, sourcefile, d)
>
>      bb.utils.mkdirhier(os.path.dirname(debugfile))
>
> @@ -936,6 +939,15 @@ python split_and_strip_files () {
>                  type |= 8
>          return type
>
> +    def isStaticLib(path):
> +        if path.endswith('.a') and not os.path.islink(path):
> +            with open(path, 'rb') as fh:
> +                # The magic must include the first slash to avoid
> +                # matching golang static libraries
> +                magic = b'!<arch>\x0a/'
> +                start = fh.read(len(magic))
> +                return start == magic
> +        return False
>
>      #
>      # First lets figure out all of the files we may have to process ...
> do this only once!
> @@ -943,6 +955,7 @@ python split_and_strip_files () {
>      elffiles = {}
>      symlinks = {}
>      kernmods = []
> +    staticlibs = []
>      inodes = {}
>      libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir"))
>      baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir"))
> @@ -955,6 +968,9 @@ python split_and_strip_files () {
>                  if file.endswith(".ko") and file.find("/lib/modules/") !=
> -1:
>                      kernmods.append(file)
>                      continue
> +                if isStaticLib(file):
> +                    staticlibs.append(file)
> +                    continue
>
>                  # Skip debug files
>                  if debugappend and file.endswith(debugappend):
> @@ -1033,6 +1049,10 @@ python split_and_strip_files () {
>              # Only store off the hard link reference if we successfully
> split!
>              splitdebuginfo(file, fpath, debugsrcdir, sourcefile, d)
>
> +        if debugsrcdir:
> +            for file in staticlibs:
> +                append_source_info(file, sourcefile, d)
> +
>          # Hardlink our debug symbols to the other hardlink copies
>          for ref in inodes:
>              if len(inodes[ref]) == 1:
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

