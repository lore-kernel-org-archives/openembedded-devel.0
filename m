Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id E1C1A60797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 12:05:09 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id f93so1301949lfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 05:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ziZhjkKQzeI970UvV3xBlUHvuqpurkGpl6TXoWxht/s=;
	b=dcOg5+T6n2O7enNMWtyzny+KPmGG7EKVS0gSsdFnJIh8L/wAEJoNIw0f/LyNPdx8vt
	52oM2w8ZnN+jsdzqzlx0fDGXLk9b9jd0Jl/hlF/0MkmK8ADQKYDovcvFpJOXK2sqIx5N
	XIqGrewQNohiEp12SqmU1KkWTx1e4m7OfS6G8OMMR3OGYhN0/lrNDvcNjngEWdNGlZ6R
	XsqwFwQhQQ6am6etnV+4+hBCmO58vu9ju16hCEmc4/JVIMEbTLiqWSZjWzsGp9BCSvPo
	lTAsb/d8zaaX22to1HfzYgwJ5Ovr26X7GYRB3w5nVWLV+9yr8DIvghM7MHQDt0Nf0fY/
	xV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ziZhjkKQzeI970UvV3xBlUHvuqpurkGpl6TXoWxht/s=;
	b=XF9gbr/sWqWfo4rHZ+lR2sj2q++QGsDTLFSWJCmIKgePUjNoatmLgOB8116q0v1MPc
	h/usKIb9ieour/4qtijq0r5fhRE9o2CXCxhOeOXVgz1I3tPQqXNwm83rH0KmZUX3bdPX
	4wZWmRj5VFw42PJgOAZAbmkzfVqtXhj7+G3VXTCdM+lp8ogTERusidDIH4Bxny5KJJ+E
	Y7rcvag7zzV8J1XI2zrrBwkYat/N8a1AeXYq8CfI3Qy8IHJyOIPvnYc8MC70FSHkxZ6+
	7zk3nSS9Dode775Rvf0OzUs1LfXtf+i3sYdTF6RcjJBQbGyVvqMb9fT0JZyQQFpz12mY
	2rJw==
X-Gm-Message-State: ALyK8tKiDHBm/uV/mPwfkT6+cLKuZwluuO3Ideq438niGP8HKmYowKXC/nWHmUlJRxDhHjg3HNf76udCx0AxiA==
X-Received: by 10.25.169.195 with SMTP id s186mr4679885lfe.84.1468238708895;
	Mon, 11 Jul 2016 05:05:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.7.8 with HTTP; Mon, 11 Jul 2016 05:04:39 -0700 (PDT)
X-Originating-IP: [177.100.227.79]
In-Reply-To: <loom.20160711T131713-153@post.gmane.org>
References: <20160622163845.29573-1-danismostlikely@gmail.com>
	<loom.20160711T131713-153@post.gmane.org>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Mon, 11 Jul 2016 09:04:39 -0300
Message-ID: <CAAPZna0PPMMoO-caWAg8Ssp=1CX+Pbb6TgpQU7hXkEJCCY0TZA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Mon, 11 Jul 2016 12:05:11 -0000
Content-Type: text/plain; charset=UTF-8

Hi Patrick,

Yes, same problem here. I'm using Debian Jessie with GCC 4.9.2.

On Mon, Jul 11, 2016 at 8:29 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> Dan McGregor <danismostlikely <at> gmail.com> writes:
> > From: Daniel McGregor <daniel.mcgregor <at> vecima.com>
> >
> > GCC 6 sets the default C++ standard to C++14 and introduces dead store
> > elimination by default. OpenJDK 8 is not ready for either of these
> > changes, so set the C++ standard back to gnu++98 and disable dead
> > store elimination.
> >
> > Switched to using --with-extra-cflags, cxxflags, and ldflags. The added
> > patch fixes building when using those flags, and are needed to get
> > CFLAGS into the JDK build in the native case.
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
> I'm not familiar enough with the openjdk-8 build process to propose a
> better
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
>
> Bye, Patrick
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

