Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1Q09Hz-0004GM-Dc
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 10:14:39 +0100
Received: by vxd7 with SMTP id 7so2398733vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 02:12:54 -0700 (PDT)
Received: by 10.52.173.209 with SMTP id bm17mr1376498vdc.105.1300353174186;
	Thu, 17 Mar 2011 02:12:54 -0700 (PDT)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.220.180.141 with HTTP; Thu, 17 Mar 2011 02:12:34 -0700 (PDT)
X-Originating-IP: [78.106.51.57]
In-Reply-To: <1300303278-6308-1-git-send-email-raj.khem@gmail.com>
References: <1300303278-6308-1-git-send-email-raj.khem@gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Thu, 17 Mar 2011 12:12:34 +0300
X-Google-Sender-Auth: 9Ixb-k5Pnzunp-xKpMy3Rpny_k8
Message-ID: <AANLkTimXEEcwSzF0Yfw-ghkK00DTt-Y6TazK4VZXQf=2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gcc-4.5: Fix segfault in dwarf2out
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
X-List-Received-Date: Thu, 17 Mar 2011 09:14:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/3/16 Khem Raj <raj.khem@gmail.com>:
> Currently following fails
>
> rm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon
> -mfloat-abi=softfp -mthumb-interwork -mno-thumb
> --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi
> -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./..
> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
> -pipe -g -MT coding.lo -MD -MP -MF .deps/coding.Tpo -c coding.c -o
> coding.o
>
> coding.c: In function 'asn1_length_der':
> coding.c:101:1: internal compiler error: in
> dwarf2out_frame_debug_expr, at dwarf2out.c:2221
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <http://gcc.gnu.org/bugs.html> for instructions.
> {standard input}: Assembler messages:

My tonights build still have alike error but for akita and libgcrypt_1.4.1.

Build Configuration:
BB_VERSION        = "1.13.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "103126a"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "akita"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v20110317"
TARGET_FPU        = "soft"

| sexp.c: In function '_gcry_sexp_length':
| sexp.c:492:1: internal compiler error: in
dwarf2out_frame_debug_expr, at dwarf2out.c:2221
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| make[2]: *** [libgcrypt_la-sexp.lo] Error 1

NOTE: package libgcrypt-1.4.1-r0: task do_compile: Failed

Full build log is available here:
http://jay-home.ath.cx/testbuilder/logs/B.master.angstrom-2010.x.akita.c.log

-- 
Yury Bushmelev


