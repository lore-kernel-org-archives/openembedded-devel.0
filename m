Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id BF33871951
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 17:32:06 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id m47so2187847iti.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jun 2017 10:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=SEUQw/RFp5JuHgLKJ56kPPu01usS7D2DpbJyY17BBAY=;
	b=YH56TfoRqoqnNHhxqoh6XUqetqCpTN30tWwyuyk+C2QGTSMxLX9KbwmyGkeTMD7/PT
	YrFG+zZ9LK9L2FIakLPKRNO2Y3mW/O0XzQ14xNKuMwAy/2i1t5sKezENB4QNYCXum2cJ
	eQ7yOLapljNLhzC0AAT0EONa1JI3cxI7xgY3lIWmqaczC8wjGkQw3jfE56D8GAHvoHUa
	wj6ncvyr/luQVFBhlZ7SvgobjnENyv+SZ1bWzhxiaVDeqnZFiUMCtmrBqVleUXN8KzuO
	QiojaHDx/JQ4AP7F8schKjTvDAE7LSE0jtH+XBooTPTCfeqqNTgE8M8BEDIojEqUfmFn
	bRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=SEUQw/RFp5JuHgLKJ56kPPu01usS7D2DpbJyY17BBAY=;
	b=WCz9hyIw5eHd1Gm8xJ1uXXC20/3qaTdKLXamJk8M2Mx6SINZv5Kci7F5Mw1tBbehq4
	L1syoWfGRONfko1wDVRDS3h14gwfYQqrNnXfYV2u9K8B4wN2C0tv2ePmcYIWZ5ZaNxeB
	qpL/WUc4jxUn2c9jGmVaENp6/erYcMDcGicsrDZD6u7dZ0pjuzBjtbc7IwzQoBW7LY20
	5/jUrGCrqHm4rMR9ITzi/IFPoJECLMNTzg4QwCPGurK98IQgaQ41l1bojn5i95F2rOxZ
	To+UjgrBom2oSVN5NdyulNL7FHvaBis+PNKXDXL06b6Ijb74fRp0HbQG/lTgjDu/3NNr
	E8Sg==
X-Gm-Message-State: AODbwcAG2JH6bSMXTtCY5uT0hsha9lHVTnbfHfRcVCi6bmrhB4h1dz9+
	3KaKsvXzsGMR6XNd
X-Received: by 10.36.123.5 with SMTP id q5mr699555itc.16.1497029528200;
	Fri, 09 Jun 2017 10:32:08 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C0DE.dip0.t-ipconnect.de. [93.232.192.222])
	by smtp.gmail.com with ESMTPSA id w70sm131267itb.18.2017.06.09.10.32.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 10:32:06 -0700 (PDT)
Message-ID: <1497029524.30163.219.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 09 Jun 2017 19:32:04 +0200
In-Reply-To: <1497018842.30163.203.camel@intel.com>
References: <20170605172321.12557-1-acfoltzer@galois.com>
	<8806ffa9be8f4516b3f29cc1be0ceaf3@XBOX02.axis.com>
	<1496997797.30163.181.camel@intel.com>
	<CAMKF1srK2nyrbJ8P_jzgAwHabhvMKWswxvAHm79xc+cEyaG0sA@mail.gmail.com>
	<1497018842.30163.203.camel@intel.com>
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
X-List-Received-Date: Fri, 09 Jun 2017 17:32:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-09 at 16:34 +0200, Patrick Ohly wrote:
> On Fri, 2017-06-09 at 13:24 +0000, Khem Raj wrote:
> > 
> > On Fri, Jun 9, 2017 at 1:43 AM Patrick Ohly <patrick.ohly@intel.com>
> > wrote:
> > 
> >         On Wed, 2017-06-07 at 21:44 +0000, Peter Kjellerstedt wrote:
> >         > My guess is that the problem stems from the fact that
> >         security_flags.inc
> >         > adds -pie (which is a linker flag) to SECURITY_CFLAGS rather
> >         than
> >         > SECURITY_LDFLAGS...
> >         
> >         I think I've seen that cause problems elsewhere when the
> >         CFLAGS came
> >         after -shared, because then the compiler ended up trying to
> >         produce a
> >         pie executable instead of a shared library.
> >         
> >         Perhaps we should finally address that in security_flags.inc
> >         instead of
> >         working around it?
> > 
> > 
> > This patch is removing -pie from compiler and linker flags which does
> > not result in intended behavior for executable when linked they will
> > not be using -pie
> 
> The patch had some syntax errors (fixed version below), but it had the
> code which adds -pie to TARGET_LDFLAGS when it is in SECURITY_CFLAGS, so
> conceptually the flag shouldn't get lost entirely.
> 
> Are you saying that one cannot rely on TARGET_LDFLAGS being used during
> linking?
> 
> I've tested with m4, and it seems to work okay:
> 
> $ grep -w -e -pie tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/temp/log.do_compile
> x86_64-refkit-linux-gcc  -m64 -march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2 --sysroot=/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/recipe-sysroot   -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0=/usr/src/debug/m4/1.4.18-r0 -fdebug-prefix-map=/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/recipe-sysroot-native= -fdebug-prefix-map=/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/recipe-sysroot=  -fstack-protector-strong -fpie -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -pie -fstack-protector-strong -Wl,-z,relro,-z,now -o m4 m4.o builtin.o debug.o eval.o format.o freeze.o input.o macro.o output.o path.o symtab.o ../lib/libm4.a    
> 
> $ file tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/packages-split/m4/usr/bin/m4 
> tmp-glibc/work/corei7-64-refkit-linux/m4/1.4.18-r0/packages-split/m4/usr/bin/m4: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=f10d0a26299dcb8c5bd0f1c82ed492aea2d8f0ac, stripped
> 
> I assume "ELF 64-bit LSB shared object" instead of "ELF 64-bit LSB
> executable" means "pie executable"?

While I don't think my patch caused -pie to get lost, unfortunately I
now know that it still doesn't go into the right place in all cases. For
example, ncurses puts LDFLAGS after -shared, thus triggering the "main
undefined" error.

The TOOLCHAIN_OPTIONS that Khem mentioned get appended directly after
the command, so that seems like a better place for -pie than LDFLAGS.
It's still a bit odd to pass a linker flag to all compiler invocations,
including those that do not link, but it might be a pragmatic solution
that is better than what we have now.

However, my patch below now causes /usr/lib/libstdc++.a-gdb.py to be
built for gcc-runtime, which triggers an error:

ERROR: gcc-runtime-6.3.0-r0 do_package: QA Issue: gcc-runtime:
Files/directories were installed but not shipped in any package:
  /usr/lib/libstdc++.a-gdb.py

That file is not present at all without the patch. If anyone has a clue
about what might be causing that, I'm all ears...

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




