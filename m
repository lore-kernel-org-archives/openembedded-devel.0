Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id EB40C60797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:34:15 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id o67so28816710qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 07:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=uTwLwBKwSCSvp46fTdwsWB4J7TwWy0bWBWk/ZV6KpKs=;
	b=RMVGM4KwQVHaPTMcFypIa98cwzE52eFTdmchfKnE082R/XGhGpEZoRWLmDM6QymtWf
	W7t2it2pZKoH6dXwiA/F/XJJoHfwO/IHoJxqCkuON4USoDy2qgRxh1CHWtahd+DtHlr4
	QGTsYMt6ZfzuHZvhyyniDQC8THpJg5imNXuim6awDhDhVve/oCq3CnkTrOYnn7gZZqNj
	kkH0kIoIT+FRz/W8C+jH0vEjYEZ4jtP0wh/VkY+2JM1aeC5t1+IkJe2HbqPHQFaYB1Jh
	gXp93Q7Y9oead8G1hdLFD3YWTzAbwqpzcRuBNOiRIVzl2f7NXAxIGyVUxOqtKMc98VwQ
	ouIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=uTwLwBKwSCSvp46fTdwsWB4J7TwWy0bWBWk/ZV6KpKs=;
	b=a4cHxF6A3TLXdYR1aNl7W/mlUHWdZ+b5+h4tYoDmn6S8ZBlJOkLXsoqlMbBX5ocjdg
	YJmEn4VJncSIrA8Uy4d/02gjy8eeyHFo9wHrGxyDeiyVjhP7DxQqQWtmcLsIFjW5ZccN
	n08ndWP0VPg1juarIXL2zVxv9gjEjADnkOyR0dZJ2EPWRUPHFgNlkZjsDtXIzp+xhXv2
	H8UMoY4OugTy1bKsUCOub4qv81FC1BwIv+x48BJkpY8ybwkgd+MZjJ2HuIULMUUofPe/
	3aD809DSevUDFNXYD2GyCcrbPGLdde3yiBA8XKsx0UDqRCKwQoMLS1lJCyo8fRwQhAcV
	HNMQ==
X-Gm-Message-State: ALyK8tJrUsKCxfUECI5Nwde54FPnfwhD4K1+t3v7Vlhu1Qi8ioV40Me1YMDhBob81BxZSTW2FB8xDw6vxj4HwQ==
X-Received: by 10.55.178.195 with SMTP id b186mr24064080qkf.81.1468247656053; 
	Mon, 11 Jul 2016 07:34:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Mon, 11 Jul 2016 07:33:46 -0700 (PDT)
In-Reply-To: <loom.20160711T131713-153@post.gmane.org>
References: <20160622163845.29573-1-danismostlikely@gmail.com>
	<loom.20160711T131713-153@post.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jul 2016 07:33:46 -0700
Message-ID: <CAMKF1soG_dmoqDtjGqM+=trw9OLfJs54m6Z85N+A-8QVEHmAgg@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Jul 2016 14:34:19 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 11, 2016 at 4:29 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
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
> +        if m and int(m.group(1)) < 6:
> +            d.setVar('FLAGS_GCC6', '')
> +}
> +
> +CFLAGS_append = " ${FLAGS_GCC6}"
> +CXXFLAGS_append = " ${FLAGS_GCC6}"
>  CXX_append = " -std=gnu++98"

I can see this needed in several other cases too. May be this should be made
a common utility

>
> Bye, Patrick
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

