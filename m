Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7B06474637
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2018 14:09:52 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id d24-v6so843902iob.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2018 07:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/9WIsrsLPXwiVwsx2DBTOxnxlIsZQjrzadrZXO369so=;
	b=IkMCBeHq0nB4cEab+ATVHT9lsEa1nMIxJCywvMqJ4iAiuvF7Gn0gYAW8Ok+5Fvi5Yr
	lheyN+3zpxTyEHN2mQKzLsGa3100B/47ZIOcd8ny57A4aJHf2Ciniu0k3zRdRUGBDCHa
	zHSaEul7NK67zx6oj7nDIpnk0c7z1Id1kgjOEHDmndn3ahhvVsI9zbIxEDfUJS3lk0K/
	e93AaOgKyAxll5gocnZbNWUW23/yyUJDYY4mZxXFKOPmjqMkoSmSp7z9G4CEGbefOgRM
	Z1VYoaHdzEbjQYa9ITlvxLoHZQNLFMhbIRysXW4iIAulIWG/Ay8YP58rK9pAiiv6dlf4
	055w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/9WIsrsLPXwiVwsx2DBTOxnxlIsZQjrzadrZXO369so=;
	b=WGUl+S1nUsgXIY67kiCytFuJ4qQZC9+qxqqWzKUaZPYKGCzRZ7mxJWJl466GTwvXVV
	eXvzgjboVCDhjBlNclEKtYjcLrEW+tCXAlNjpDBig7kiCexmK9Lx8AS8fDp/Zn8CQ/DT
	hXhLnrE8/eVwj6hAszI22IHcWnft2IwzqVNYm4ANv0PU6LkOv90h4u8oxxDAjoskAdHF
	f6x0zslLyO6aTLaw0Z5j4fE3UyN6o4vhzb0Xco/WpQp0zkkcgzupSdQS4HoOT+GaKegk
	hwouruDNEdrQVTCdj35EehiwvL+VGMJrl/mJ9KEGmlEv2C0KrXtCWoUCuHjmjAPaCrJd
	sOAg==
X-Gm-Message-State: ALQs6tAfgrr/Y27dzljoLR+qIbthKRyFm8yvIiPJeg/dXeGQYwXuwu3Z
	vzYfr1ORXh7azthHoJ9IUhg0Y3uS1zQTFefAro2Bdg==
X-Google-Smtp-Source: AB8JxZo/BL0DhT3t+VArGOP++039d5AHAmbnYyJEZMT0S9IhmA4LbKIHWf9b55JMuY9PDvvU9NU48izeASLCwW5bDpg=
X-Received: by 2002:a6b:a08f:: with SMTP id
	j137-v6mr11420089ioe.23.1524233393235; 
	Fri, 20 Apr 2018 07:09:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Fri, 20 Apr 2018 07:09:32 -0700 (PDT)
In-Reply-To: <CA+chaQeDsfMhA8BEDdLDVVTWONf0+3hkyPTLa+hGU0P+_i8NLA@mail.gmail.com>
References: <152414550828.29269.11674339610003737461@git.openembedded.org>
	<20180419134508.AA894232AEA@git.openembedded.org>
	<CA+chaQeDsfMhA8BEDdLDVVTWONf0+3hkyPTLa+hGU0P+_i8NLA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Apr 2018 15:09:32 +0100
Message-ID: <CAJTo0Lb1-83fmnZbJxAzaiRMVDKB=A4-3xFKeqYn7A6za2fqMQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Ola x Nilsson <ola.x.nilsson@axis.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
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
X-List-Received-Date: Fri, 20 Apr 2018 14:09:52 -0000
Content-Type: text/plain; charset="UTF-8"

FWIW, libsdl2 builds fine for me with current sumo branch.

Ross

On 20 April 2018 at 13:03, Martin Jansa <martin.jansa@gmail.com> wrote:
> I haven't dig around this much, but some of my builds are now failing with:
>
> ERROR: libsdl2-webos-2.0.4-86-r22 do_package: dwarfsrcfiles failed with
> exit code 1 (cmd was 'dwarfsrcfiles' 'libsdl2-webos/2.0.4-86-r22/
> package/usr/lib/libSDL2main.a'):
> dwarfsrcfiles: libsdl2-webos/2.0.4-86-r22/package/usr/lib/libSDL2main.a:
> not a valid ELF file
> ERROR: libsdl2-webos-2.0.4-86-r22 do_package: Function failed:
> split_and_strip_files
>
> It's different version of libsdl2 than what's in oe-core now and the recipe
> for it might be a bit broken.
>
> $ file package/usr/lib/libSDL2main.a
> package/usr/lib/libSDL2main.a: current ar archive
>
> $ recipe-sysroot-native/usr/bin/dwarfsrcfiles package/usr/lib/libSDL2main.a
> dwarfsrcfiles: package/usr/lib/libSDL2main.a: not a valid ELF file
>
> $ ar x ../package/usr/lib/libSDL2main.a
>
> contains only:
> SDL_dummy_main.lo
>
> Should we try a bit harder to check if the .a contains static library? In
> the meantime I'll check what's going on in libsdl2-webos build and if the
> same happens in oe-core libsdl2.
>
> Regards,
>
> On Thu, Apr 19, 2018 at 3:45 PM, <git@git.openembedded.org> wrote:
>
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a commit to branch master
>> in repository openembedded-core.
>>
>> commit eefa5ba35663fabe1f3f8cf7f1ff126d51240613
>> Author: Ola x Nilsson <ola.x.nilsson@axis.com>
>> AuthorDate: Thu Apr 19 13:17:30 2018 +0200
>>
>>     package.bbclass: Include dbgsrc for static libs
>>
>>     The debugsource must be added from the package providing the static
>>     lib, because any package using that lib does not have access to the
>>     source code.
>>
>>     Fixes [YOCTO #12558]
>>
>>     Signed-off-by: Ola x Nilsson <olani@axis.com>
>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/classes/package.bbclass | 44 ++++++++++++++++++++++++++++++
>> ++------------
>>  1 file changed, 32 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 7978307..fff7ceb 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -344,6 +344,20 @@ def parse_debugsources_from_dwarfs
>> rcfiles_output(dwarfsrcfiles_output):
>>
>>      return debugfiles.keys()
>>
>> +def append_source_info(file, sourcefile, d):
>> +    cmd = "'dwarfsrcfiles' '%s'" % (file)
>> +    (retval, output) = oe.utils.getstatusoutput(cmd)
>> +    # 255 means a specific file wasn't fully parsed to get the debug file
>> list, which is not a fatal failure
>> +    if retval != 0 and retval != 255:
>> +        bb.fatal("dwarfsrcfiles failed with exit code %s (cmd was %s)%s"
>> % (retval, cmd, ":\n%s" % output if output else ""))
>> +
>> +    debugsources = parse_debugsources_from_dwarfsrcfiles_output(output)
>> +    # filenames are null-separated - this is an artefact of the previous
>> use
>> +    # of rpm's debugedit, which was writing them out that way, and the
>> code elsewhere
>> +    # is still assuming that.
>> +    debuglistoutput = '\0'.join(debugsources) + '\0'
>> +    open(sourcefile, 'a').write(debuglistoutput)
>> +
>>
>>  def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
>>      # Function to split a single file into two components, one is the
>> stripped
>> @@ -369,18 +383,7 @@ def splitdebuginfo(file, debugfile, debugsrcdir,
>> sourcefile, d):
>>
>>      # We need to extract the debug src information here...
>>      if debugsrcdir:
>> -        cmd = "'dwarfsrcfiles' '%s'" % (file)
>> -        (retval, output) = oe.utils.getstatusoutput(cmd)
>> -        # 255 means a specific file wasn't fully parsed to get the debug
>> file list, which is not a fatal failure
>> -        if retval != 0 and retval != 255:
>> -            bb.fatal("dwarfsrcfiles failed with exit code %s (cmd was
>> %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
>> -
>> -        debugsources = parse_debugsources_from_dwarfs
>> rcfiles_output(output)
>> -        # filenames are null-separated - this is an artefact of the
>> previous use
>> -        # of rpm's debugedit, which was writing them out that way, and
>> the code elsewhere
>> -        # is still assuming that.
>> -        debuglistoutput = '\0'.join(debugsources) + '\0'
>> -        open(sourcefile, 'a').write(debuglistoutput)
>> +        append_source_info(file, sourcefile, d)
>>
>>      bb.utils.mkdirhier(os.path.dirname(debugfile))
>>
>> @@ -936,6 +939,15 @@ python split_and_strip_files () {
>>                  type |= 8
>>          return type
>>
>> +    def isStaticLib(path):
>> +        if path.endswith('.a') and not os.path.islink(path):
>> +            with open(path, 'rb') as fh:
>> +                # The magic must include the first slash to avoid
>> +                # matching golang static libraries
>> +                magic = b'!<arch>\x0a/'
>> +                start = fh.read(len(magic))
>> +                return start == magic
>> +        return False
>>
>>      #
>>      # First lets figure out all of the files we may have to process ...
>> do this only once!
>> @@ -943,6 +955,7 @@ python split_and_strip_files () {
>>      elffiles = {}
>>      symlinks = {}
>>      kernmods = []
>> +    staticlibs = []
>>      inodes = {}
>>      libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir"))
>>      baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir"))
>> @@ -955,6 +968,9 @@ python split_and_strip_files () {
>>                  if file.endswith(".ko") and file.find("/lib/modules/") !=
>> -1:
>>                      kernmods.append(file)
>>                      continue
>> +                if isStaticLib(file):
>> +                    staticlibs.append(file)
>> +                    continue
>>
>>                  # Skip debug files
>>                  if debugappend and file.endswith(debugappend):
>> @@ -1033,6 +1049,10 @@ python split_and_strip_files () {
>>              # Only store off the hard link reference if we successfully
>> split!
>>              splitdebuginfo(file, fpath, debugsrcdir, sourcefile, d)
>>
>> +        if debugsrcdir:
>> +            for file in staticlibs:
>> +                append_source_info(file, sourcefile, d)
>> +
>>          # Hardlink our debug symbols to the other hardlink copies
>>          for ref in inodes:
>>              if len(inodes[ref]) == 1:
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

