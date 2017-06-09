Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id C500178295
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:24:57 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id v104so33078011wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jun 2017 06:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=e6dyAtVHVctwG4vUHFPyawdgQqJDLYlgT+GhCJ46z9U=;
	b=Jir0jxJSyYINBUBtySOlVZ/IxU5BP7wKTMd4YZxvGyvtfSLc5vmkMdfcK9O/U+Dhy+
	to0nuw+d2pTu5es3eqLr1xxcfSAkgdNEF+JaDub2m1IS1oyEzls6s3LutbxsxdpvauMl
	AExTvJ5kgZ4oH50LtDeAwPJp1xDi77wlnYHd5oAZb+VAo4S48EKk5CqB1AbTySgkYMP+
	EdusuJmgyoJzrZNDDqhRnXqV12IXkFGRdpfSLMK4B3s5m5V3BgLSOHYkCxEXUPyYR92f
	Y+zRFhNy+2dB2TVixXjSATuAyGbRT/iquhdV75S7XyhxDglneTrjLbHPDM+Y75lCU0+W
	Llow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e6dyAtVHVctwG4vUHFPyawdgQqJDLYlgT+GhCJ46z9U=;
	b=triHmV744AUQ87NRFn8GEtC+p9gJrlVXHbi6ltPKvSZ6iIIHMf9FuD0cwEWSKFpIMl
	LwYrybYSXUlqTOqc8jwheFm0VZLg7x0qM/9Wie3Dcsgt/xBizvk2fYg0ukPcCP7x4yfR
	hShOypWNOM7guzkkY8gE1Z29urFCWMLlLhfj6ivUKBaAP1E+hUWjc7WEPWerG8EDHLVN
	yXEFBSJ2SGC723tiQ43gjJo5NLT/EaPDGVK5sY0xuuGxOgl3eFQSl5BzG+R365DnQfBA
	ETToMp4V4kJMvo6KBBhaUGMfVX9cB+JvhSacWg61W8wZWjL+0JC4/ucAAL7Mbq+vsdSD
	s2Cw==
X-Gm-Message-State: AODbwcDW3kJwmXax5SGuStJrjGiFTPN2fUuK+tbMtEpekx6Ev1KGbeS1
	1tD/ATggTeLp+XTK6ujVopvmuDPQdg==
X-Received: by 10.80.143.227 with SMTP id y90mr33599349edy.131.1497014698148; 
	Fri, 09 Jun 2017 06:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20170605172321.12557-1-acfoltzer@galois.com>
	<8806ffa9be8f4516b3f29cc1be0ceaf3@XBOX02.axis.com>
	<1496997797.30163.181.camel@intel.com>
In-Reply-To: <1496997797.30163.181.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 09 Jun 2017 13:24:47 +0000
Message-ID: <CAMKF1srK2nyrbJ8P_jzgAwHabhvMKWswxvAHm79xc+cEyaG0sA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: -pie in SECURITY_CFLAGS (was: Re: [meta-oe][PATCH 1/3] meson: update Meson devtool to 0.40.1)
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
X-List-Received-Date: Fri, 09 Jun 2017 13:24:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 9, 2017 at 1:43 AM Patrick Ohly <patrick.ohly@intel.com> wrote:

> On Wed, 2017-06-07 at 21:44 +0000, Peter Kjellerstedt wrote:
> > My guess is that the problem stems from the fact that security_flags.inc
> > adds -pie (which is a linker flag) to SECURITY_CFLAGS rather than
> > SECURITY_LDFLAGS...
>
> I think I've seen that cause problems elsewhere when the CFLAGS came
> after -shared, because then the compiler ended up trying to produce a
> pie executable instead of a shared library.
>
> Perhaps we should finally address that in security_flags.inc instead of
> working around it?


This patch is removing -pie from compiler and linker flags which does not
result in intended behavior for executable when linked they will not be
using -pie

Libtool adds -shared automatically for shared libraries so we have to
either insert pie before that which means make it part of TOOLCHAIN_OPTIONS
variable but that might have more unintended consequences especially for
external toolchains

>
>
> Here's an untested patch which puts -pie where it belongs in the final
> variables, without changing the pie/no pie API:
>
> diff --git a/meta/conf/distro/include/security_flags.inc
> b/meta/conf/distro/include/security_flags.inc
> index e162abeb3d9..b7b19355806 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -12,6 +12,9 @@ lcl_maybe_fortify =
> "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE
>  # Error on use of format strings that represent possible security problems
>  SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security
> -Werror=format-security"
>
> +# For history reasons and simplicity, -pie is listed here as part of
> CFLAGS.
> +# In practice, it ends up getting used as part of LDFLAGS, as it should
> +# be because it is a linker flag.
>  SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie
> ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>  SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify}
> ${SECURITY_STRINGFORMAT}"
>
> @@ -94,8 +97,8 @@ SECURITY_STRINGFORMAT_pn-busybox = ""
>  SECURITY_STRINGFORMAT_pn-gcc = ""
>  SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
>
> -TARGET_CFLAGS_append_class-target = " ${SECURITY_CFLAGS}"
> -TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
> +TARGET_CFLAGS_append_class-target = " ${@ oe.utils.filter_out('-pie',
> '${SECURITY_CFLAGS}') }"
> +TARGET_LDFLAGS_append_class-target = " ${@ oe.utils.filter('-pie',
> '${SECURITY_CFLAGS}') } ${SECURITY_

LDFLAGS}"
>
>  SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
>  SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

