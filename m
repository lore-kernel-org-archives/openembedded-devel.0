Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id D76AD606D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 17:58:55 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id o63so166049468vkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 10:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=2NWtwTQfompbDX7ws8eFvKQtgCiJpBZsDlUg4r0kXUU=;
	b=L0V++abr69funBHLXcs12FfACRuWX85DRF9BmwO9xl6J849qXXUfWaceN456mJlo8D
	uveGGwf8C4xPoXl/oLTQ3X+chK9ri57/wP2qIrU48fSp6JF9oOBFEChW+DpAbm88nY/a
	RA2YloBNKkWFZIgsvM9yUwUue2o8lfsIIfGBqGSmz8uOFiwtZ/Z/MTiyVHDSnaV3V2ie
	h4wOCQRgz640/cjAO5XBGn9eDW8Pt6mT4La0bPiKEL47LtOAbZeG5yWJz8t85LECjErn
	5ckwVsGvZm+IREZQ34qEH34GLs5Qrl7xeXwHYbWMCWZPbqmhyPfKM5XybTLOxHjcE6ip
	HyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=2NWtwTQfompbDX7ws8eFvKQtgCiJpBZsDlUg4r0kXUU=;
	b=ZOZ0Z9zn+FmL8v2J3D7rkiI/SrBPidAvdIv173TZ4bPiWJgBlTlU5a4HK6+9b2iQaI
	mvOkv0rQ/goGkVweBj95R3mXUvsHbQLLZohoeKHqBRKA1nD1mqg6Kp3FrlfAkJjAfQsa
	eLvdf45dJsqdC4GX7m8Hxt3+1QVWhN51ciXC7JlkeW2Ji5Qwet8u8eiH3JTm3nn5CdEM
	Kbun0/fZT701BY+LgWP0/QQoVOlz2hsZV5gqcyEW/dNGfNkT2PTDreOjJAJbuUmO9xGS
	ZMO9LNLcHinJiPiCbx7Lf3EOdEqgyUpNzyNikPyCvisxXeS7VIWalOgW/mS7w0MsSxv8
	3YAA==
X-Gm-Message-State: ALyK8tLq9sZenSbf2Wpzzd2KwyolnYXDTesHL8+Mm/kYC8ar3CztVaQ1uBBqAdjKPYmdz9wz4ExLokLJN8bb9g==
X-Received: by 10.159.54.143 with SMTP id p15mr11637874uap.148.1468605535843; 
	Fri, 15 Jul 2016 10:58:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.51.77 with HTTP; Fri, 15 Jul 2016 10:58:55 -0700 (PDT)
In-Reply-To: <loom.20160711T131713-153@post.gmane.org>
References: <20160622163845.29573-1-danismostlikely@gmail.com>
	<loom.20160711T131713-153@post.gmane.org>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Fri, 15 Jul 2016 11:58:55 -0600
Message-ID: <CACS+7ZQ_GxdipW4exewtzfyK2nrDFR2=jHJ83d_Ze=__8rrdQQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] openjdk-8: make GCC6 happy
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
X-List-Received-Date: Fri, 15 Jul 2016 17:58:56 -0000
Content-Type: text/plain; charset=UTF-8

On 11 July 2016 at 05:29, Patrick Ohly <patrick.ohly@intel.com> wrote:
> Dan McGregor <danismostlikely <at> gmail.com> writes:
>> From: Daniel McGregor <daniel.mcgregor <at> vecima.com>
>>
>> GCC 6 sets the default C++ standard to C++14 and introduces dead store
>> elimination by default. OpenJDK 8 is not ready for either of these
>> changes, so set the C++ standard back to gnu++98 and disable dead
>> store elimination.
>>
>> Switched to using --with-extra-cflags, cxxflags, and ldflags. The added
>> patch fixes building when using those flags, and are needed to get
>> CFLAGS into the JDK build in the native case.
>
> Has anyone tested this on a host system where gcc is still 4.x, like 4.9.2
> on Debian Wheezy?
>
> I'm finding that -fno-lifetime-dse is also getting passed to the gcc used
> for compiling native binaries (obviously in openjdk-8-native, but also for
> some helper executables in openjdk-8). This then breaks the compilation
> because older gcc rejects that flag.
>
> I've briefly toyed with the patch below which worked for openjdk-8-native,
> but not for openjdk-8. I'm just going to work around it by staying on gcc
> 5.x and clearing these extra flags.
>
> I'm not familiar enough with the openjdk-8 build process to propose a better
> solution, but perhaps someone else has an idea?
>
> diff --git a/meta-java/recipes-core/openjdk/openjdk-8-common.inc
> b/meta-java/recipes-core/openjdk/openjdk-8-common.inc
> index dd3d397..060d828 100644
> --- a/meta-java/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/meta-java/recipes-core/openjdk/openjdk-8-common.inc
> @@ -237,6 +237,25 @@ EXTRA_OECONF_append = "\
>          --with-update-version=${OPENJDK_UPDATE_VERSION} \
>  "
>
> -CFLAGS_append = " -fno-lifetime-dse -fno-delete-null-pointer-checks"
> -CXXFLAGS_append = " -fno-lifetime-dse -fno-delete-null-pointer-checks"
> +# GCC 6 sets the default C++ standard to C++14 and introduces dead store
> +# elimination by default. OpenJDK 8 is not ready for either of these
> +# changes.
> +FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> +
> +# All supported cross compilers support the compiler flags that were
> +# added to make compilation with gcc6 work. But the host compiler for
> +# native compilation is a different story: it may be too old (for example,
> +# gcc 4.9.2 on Debian Wheezy). In that case we need to check what the
> +# version is and unset the flags when gcc is not yet GCC 6.
> +python () {
> +    if d.getVar('PN', True).endswith('-native'):
> +        import re, subprocess
> +        version = subprocess.check_output(d.expand('${CC}
> --version').split()).decode('utf-8')
> +        m = re.search(r'^gcc.* (\d+)(\.\d+)*$', version, re.MULTILINE)

This regex doesn't work in the cross case because the version string
doesn't start with "gcc". It starts with '<target-triple>-gcc', so
that should be checked instead.

I'll fiddle with this patch some more. It looks like a good short-term
solution to building OpenJDK on GCC 4 hosts.

For my own use case, we build in a lxc container based on Poky's
build-appliance, so host compiler is whatever we set it to.

> +        if m and int(m.group(1)) < 6:
> +            d.setVar('FLAGS_GCC6', '')
> +}
> +
> +CFLAGS_append = " ${FLAGS_GCC6}"
> +CXXFLAGS_append = " ${FLAGS_GCC6}"
>  CXX_append = " -std=gnu++98"
>
> Bye, Patrick
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

