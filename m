Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1434778757
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 22:45:59 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id z12so22912394wrg.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 14:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ej6ukPtyrLSnES2FAkXKK1IEtpGsDWjCYbZnHxE2R1A=;
	b=twD/o4G/iRqBh5faM7RNDf1AduHOy4eYuIl1vKxg2aziueina0RGQyk62BK/6nm/m/
	ERyIIZ6tn+TwLqBLK6v0Pr6LElg5ey1WReeFczqw753XYErby6fzzj9NWXlDS7ZWDQFG
	pgF6P9u0uyMn6Pt2QdKeWz3KneLWYHuu6Qk5aeWXVavXZzhnae+qc8bZk3+tUDsZks1/
	w8srIuW1nt8qNl7Vzdf1zNV8ZbgBy6y3H82PFSep6MKs5hj76Y0wOVimUbHsCXI83Oxi
	yOHj1E/3Js/HpGKXZuh03GxN7vlqxHns+mwQ4hVUAaYekto92TO95T3kyS7JU/myIOFW
	3sNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ej6ukPtyrLSnES2FAkXKK1IEtpGsDWjCYbZnHxE2R1A=;
	b=EOPVwGpcjRRiXFNldHC07cvjTyECLRflaJKruE8iFs39S2CjwP26z/+TlXkrS0+CcQ
	3rYZYf1Difik//NOJ3D2AFiHiRDq/BcYgPM02cEIXgEfdiHNPhGExV7i+SN87RM0VIyC
	31/bK9V/RJunj5/sUrwNU4KfjbpBnGE9Sxl9Zjd7P/IcaReLIbV7D5sr1ohxXyRXvdZz
	dATH+pAHxJmCRrz3NZUgPst7y4lrDxeg6tDzIfsICoFuuuuFLrVJeIaU1I9lK733US7H
	NlLJPx7OxLeZmyc9g/Wq7KI4oNoXtYqYD9HoXDIzfPMjytaUWlHm3dTlQqefoyiXKeOG
	pBKw==
X-Gm-Message-State: APf1xPBwxtBvVQULLhGOWI2lQ5ClF3dgT58s3nXunlxGLe1eppWdIy4m
	JsEHHGB6MKCzSzC7+B/qG3/uOhrJ6MtLjEP4dXTEng==
X-Google-Smtp-Source: AH8x227DMfPLlkaMqK1TuC8sET6QfSzW0hyBn2TEKvDRWf0t+2oomoGumIrTDZWZBz+ya+0ysdaSt66rQIr9RHnv9WE=
X-Received: by 10.223.147.227 with SMTP id 90mr10643609wrp.230.1519683695983; 
	Mon, 26 Feb 2018 14:21:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Mon, 26 Feb 2018 14:21:35 -0800 (PST)
In-Reply-To: <20180226215718.GK2786@denix.org>
References: <20180226215718.GK2786@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Feb 2018 23:21:35 +0100
Message-ID: <CA+chaQfbv6=ZQBzZRs4q5h0GbnHkpOs_QQ1chYGoN+wPUnOerg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] qtwebengine/chromium/v8 requires lib32 version of host C++ headers (libc++-dev:i386)
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
X-List-Received-Date: Mon, 26 Feb 2018 22:46:00 -0000
Content-Type: text/plain; charset="UTF-8"

See
http://lists.openembedded.org/pipermail/openembedded-devel/2017-August/114417.html

There was no update on multilib issue since then and many requests to get
5.9 merged, so after couple weeks or months after this e-mail I've merged
upgrade to 5.9 with this new requirement documented in commit message.

On Mon, Feb 26, 2018 at 10:57 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> I've got this error below on one of my build machines, and on close
> inspection, it looks like qtwebengine/chromium/v8 requires host side C++
> headers in 32-bit besides normal 64-bit version, i.e. libc++-dev:i386 or
> lib32stdc++-dev.
>
> How can we check for this and/or document this requirement?
>
> Logs (notice hosttools/g++ and -m32):
>
> FAILED: v8_snapshot/obj/v8/mkpeephole/bytecodes.o
> .../tmp-glibc/hosttools/g++ -MMD -MF v8_snapshot/obj/v8/mkpeephole/bytecodes.o.d
> -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1
> -DUSE_OZONE=1 -DNO_TCMALLOC -DDISABLE_NACL -DENABLE_TASK_MANAGER=1
> -DENABLE_THEMES=1 -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD
> -DSAFE_BROWSING_DB_LOCAL -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED
> -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0
> -DV8_I18N_SUPPORT -DV8_TARGET_ARCH_ARM -DCAN_USE_ARMV7_INSTRUCTIONS
> -DCAN_USE_VFP3_INSTRUCTIONS -DCAN_USE_VFP32DREGS -DCAN_USE_NEON
> -DUSE_EABI_HARDFLOAT=1 -Iv8_snapshot/gen -I../../../../git/src/3rdparty/chromium
> -I../../../../git/src/3rdparty/chromium/v8/include
> -Iv8_snapshot/gen/v8/include -I../../../../git/src/3rdparty/chromium/v8
> -fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector
> -funwind-tables -fPIC -pipe -pthread -m32 -msse2 -mfpmath=sse -mmmx -g0
> -fvisibility=hidden -Wno-unused-local-ty
>  pedefs -Wno-maybe-uninitialized -Wno-missing-field-initializers
> -Wno-unused-parameter -O3 -fno-ident -fdata-sections -ffunction-sections
> -fno-threadsafe-statics -fvisibility-inlines-hidden -std=gnu++11
> -fno-delete-null-pointer-checks -fno-rtti -fno-exceptions -Wno-deprecated
> -Wno-narrowing -c ../../../../git/src/3rdparty/
> chromium/v8/src/interpreter/bytecodes.cc -o v8_snapshot/obj/v8/mkpeephole/
> bytecodes.o
> In file included from ../../../../git/src/3rdparty/
> chromium/v8/src/interpreter/bytecodes.h:8:0,
>                  from ../../../../git/src/3rdparty/
> chromium/v8/src/interpreter/bytecodes.cc:5:
> /usr/include/c++/5/cstdint:38:28: fatal error: bits/c++config.h: No such
> file or directory
> compilation terminated.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

