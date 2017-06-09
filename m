Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 38305782B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 14:34:04 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id i7so33837427ioe.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jun 2017 07:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=dhgEFg17in2gqwtRzgwa9l7DOkl2QG6Vxvj9uxI0YLg=;
	b=Hk8imsKYZ2DzxjbOyOFdcqDVsr4rso4Hqzes6QxQEOBBjwIEW/LjDEW1rw7RgMhKnF
	Wvylh4vjacyoSR6mm+LDCzocnSa1DlLIfIJ4z90gSyLIhZT/0jZYFZRjuRTt0N5TNM/P
	oYhdWtnzo09uyq1ERiNeyGBZyCf6WooQW2WnpGrHJK+oE8B0pcT9Kv7bFTH0FVEv/oGK
	GHtrYjPTc/oY0GlpbwuTWWfEG50qDBYTj/ErrGUhriIV00k1C8xpazkU4sVbSqYZ8fq0
	UHuV+J55IXwTcuCr1I8lPIrVKOjTpabAwjrMIOVfK2NVS5ZeHePy/IVHqKsX55/k4wiR
	V6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=dhgEFg17in2gqwtRzgwa9l7DOkl2QG6Vxvj9uxI0YLg=;
	b=M9MVq9qR65bQjUoM8mo5MadC6XIC8ldzTM3oCoEFpisgLE3ae34JPasXXplY+5Ffke
	Y/z5nHGi8xuy/qCgFNHxtUoJGb7/ncgmvSD+7cJHBJSGk78a18W0Zmh7Vq1ENOiCJeVV
	sfVK3W+9T5jGapfmSAnIYmnGm5VV5x8/MzujJ3Da2IASnP38o2n1ttfMJDAJV2qHAo9G
	WEDrnrpNN1Vi584YDoKNtzCD50/vvqyRSZsAUQJHmArv9OkF3IaK+45uZ5bEe4/2DNL5
	asgykpiZVpB00+VZWfOZhQ23YyFYCziqbaDj64obNgAiE/+d1KLfFRS7GAcKroRdDnhY
	GZBQ==
X-Gm-Message-State: AODbwcDzxvJeWP6mmr8UaZ2KnMHSyAB27C/EzbO4tI0XgG6YjqtwaFiS
	6LIfCY7uzTxUkjvH
X-Received: by 10.107.170.103 with SMTP id t100mr34096231ioe.187.1497018845589;
	Fri, 09 Jun 2017 07:34:05 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C0DE.dip0.t-ipconnect.de. [93.232.192.222])
	by smtp.gmail.com with ESMTPSA id e31sm513468ioi.51.2017.06.09.07.34.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 07:34:04 -0700 (PDT)
Message-ID: <1497018842.30163.203.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 09 Jun 2017 16:34:02 +0200
In-Reply-To: <CAMKF1srK2nyrbJ8P_jzgAwHabhvMKWswxvAHm79xc+cEyaG0sA@mail.gmail.com>
References: <20170605172321.12557-1-acfoltzer@galois.com>
	<8806ffa9be8f4516b3f29cc1be0ceaf3@XBOX02.axis.com>
	<1496997797.30163.181.camel@intel.com>
	<CAMKF1srK2nyrbJ8P_jzgAwHabhvMKWswxvAHm79xc+cEyaG0sA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
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
X-List-Received-Date: Fri, 09 Jun 2017 14:34:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-09 at 13:24 +0000, Khem Raj wrote:
> 
> On Fri, Jun 9, 2017 at 1:43 AM Patrick Ohly <patrick.ohly@intel.com>
> wrote:
> 
>         On Wed, 2017-06-07 at 21:44 +0000, Peter Kjellerstedt wrote:
>         > My guess is that the problem stems from the fact that
>         security_flags.inc
>         > adds -pie (which is a linker flag) to SECURITY_CFLAGS rather
>         than
>         > SECURITY_LDFLAGS...
>         
>         I think I've seen that cause problems elsewhere when the
>         CFLAGS came
>         after -shared, because then the compiler ended up trying to
>         produce a
>         pie executable instead of a shared library.
>         
>         Perhaps we should finally address that in security_flags.inc
>         instead of
>         working around it?
> 
> 
> This patch is removing -pie from compiler and linker flags which does
> not result in intended behavior for executable when linked they will
> not be using -pie

The patch had some syntax errors (fixed version below), but it had the
code which adds -pie to TARGET_LDFLAGS when it is in SECURITY_CFLAGS, so
conceptually the flag shouldn't get lost entirely.

Are you saying that one cannot rely on TARGET_LDFLAGS being used during
linking?

I've tested with m4, and it seems to work okay:

$ grep -w -e -pie tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/temp/log.do_compile
x86_64-refkit-linux-gcc  -m64 -march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2 --sysroot=/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/recipe-sysroot   -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0=/usr/src/debug/m4/1.4.18-r0 -fdebug-prefix-map=/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/recipe-sysroot-native= -fdebug-prefix-map=/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/recipe-sysroot=  -fstack-protector-strong -fpie -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -pie -fstack-protector-strong -Wl,-z,relro,-z,now -o m4 m4.o builtin.o debug.o eval.o format.o freeze.o input.o macro.o output.o path.o symtab.o ../lib/libm4.a    

$ file tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/packages-split/m4/usr/bin/m4 
tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/packages-split/m4/usr/bin/m4: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=f10d0a26299dcb8c5bd0f1c82ed492aea2d8f0ac, stripped

I assume "ELF 64-bit LSB shared object" instead of "ELF 64-bit LSB
executable" means "pie executable"?

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index e162abeb3d9..b1781ceab42 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -12,6 +12,9 @@ lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE
 # Error on use of format strings that represent possible security problems
 SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
 
+# For history reasons and simplicity, -pie is listed here as part of CFLAGS.
+# In practice, it ends up getting used as part of LDFLAGS, as it should
+# be because it is a linker flag.
 SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 
@@ -94,8 +97,8 @@ SECURITY_STRINGFORMAT_pn-busybox = ""
 SECURITY_STRINGFORMAT_pn-gcc = ""
 SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
 
-TARGET_CFLAGS_append_class-target = " ${SECURITY_CFLAGS}"
-TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
+TARGET_CFLAGS_append_class-target = " ${@ oe.utils.str_filter_out('-pie', '${SECURITY_CFLAGS}', d) }"
+TARGET_LDFLAGS_append_class-target = " ${@ oe.utils.str_filter('-pie', '${SECURITY_CFLAGS}', d) } ${SECURITY_LDFLAGS}"
 
 SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




