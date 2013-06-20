Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 21E5D6A99C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 07:37:34 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id p10so5971294pdj.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 00:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=ctoyUSQHLYt+bPSNn3WZ/bEKVvo2raIYAq6tKAualSU=;
	b=GSNHsRgsNAqo4RUkPpjGXXE1L/aHzq/KSBERCfa2oUwrfjWSKUAVukd3ROA1FURohD
	bLHAbhM/orAhAT0+aeJKsqLalAy2RBGTyi0irVALv74sx10CjjZMr3MMzjZKKfSXOkj/
	795Zv3vhG1wIyj+anr2yp+SXsbP1M4TX1VWVf4REpcGBo3sEvmg2ztC+Vj9olfE/9KWx
	Cr0C+sTOpCzkK9lFeCDQE04zOYuUcWK1KfhpOgRKRJ0DpWTyOOXpjijYi37qm5ksOyWN
	ZNBQjytWGHHkk+vamkjMj9OKgeZikc2rG7JyYXZMCSOVfXPGGlmyk9IuLXV1SOQfq4OY
	QCRw==
X-Received: by 10.68.213.42 with SMTP id np10mr6344315pbc.37.1371713855232;
	Thu, 20 Jun 2013 00:37:35 -0700 (PDT)
Received: from bjupudi-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id z5sm26708242pbk.0.2013.06.20.00.37.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 00:37:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51C2B063.1050804@ts.fujitsu.com>
Date: Thu, 20 Jun 2013 00:37:32 -0700
Message-Id: <6339585B-94AE-44CA-B029-011D77E86461@gmail.com>
References: <51C2B063.1050804@ts.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1508)
Subject: Re: chromium 29.0.1518.2 for armv7a
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jun 2013 07:37:34 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jun 20, 2013, at 12:33 AM, Cestonaro Thilo =
<thilo.cestonaro@ts.fujitsu.com> wrote:

> Hey,
>=20
> I'm trying to compile chromium from meta-browser for a armv7a SoC.
> But it always failed with following error[1]. I fixed this bug with =
the appended patch and I had to remove
> the extra cflag "-Wno-error=3Dunused-local-typedefs" from the recipe =
to get it to compile.

hmm, which version of gcc are you using ? I use gcc 4.8 here and it =
compiles fine and also runs fine.

> But can someone have a look at the patch and tell why the hell this =
compiles and the original code not, please?
>=20
> However the real problem[2] is, that whenever I try to start chromium =
on the armv7a machine, it segills right away. Even --help brings the =
sigill :/.
> I've no idea how to fix such a problem; any comments?
>=20
> Thx.
>=20
> Greetings
> Thilo
>=20
>=20
> 1:
> --------------------------------------------------------------------
> + cd =
/home/cestonarot/Projects/utc_soc/chromium/29/chromium-29.0.1518.2
> + do_compile
> + ninja -C =
/home/cestonarot/Projects/utc_soc/chromium/29/chromium-29.0.1518.2/out/Rel=
ease chrome
> ninja: Entering directory =
`/home/cestonarot/Projects/utc_soc/chromium/29/chromium-29.0.1518.2/out/Re=
lease'
> [1/4] CC =
obj/third_party/webrtc/modules/audio_processing/ns/audio_processing_neon.n=
sx_core_neon.o
> FAILED: arm-magna-linux-gnueabi-gcc  -march=3Darmv7-a =
-fno-tree-vectorize      -mthumb-interwork -mfloat-abi=3Dsoftfp =
-mfpu=3Dneon -mtune=3Dcortex-a8 -mthumb-interwork -mno-thumb =
--sysroot=3D/home/cestonarot/Projects/utc_soc/setup-scripts/build/tmp-angs=
trom_2010_x-eglibc/sysroots/dm814x-evm -MMD -MF =
obj/third_party/webrtc/modules/audio_processing/ns/audio_processing_neon.n=
sx_core_neon.o.d '-DWEBRTC_SVNREVISION=3D"Unavailable(issue687)"' =
-D_FILE_OFFSET_BITS=3D64 -DUSE_LINUX_BREAKPAD -DNO_TCMALLOC =
-DDISABLE_NACL -DCHROMIUM_BUILD -DUSE_DEFAULT_RENDER_THEME=3D1 =
-DUSE_LIBJPEG_TURBO=3D1 -DUSE_NSS=3D1 -DUSE_X11=3D1 =
-DENABLE_ONE_CLICK_SIGNIN -DGTK_DISABLE_SINGLE_INCLUDES=3D1 =
-DENABLE_REMOTING=3D1 -DENABLE_WEBRTC=3D1 -DUSE_PROPRIETARY_CODECS =
-DENABLE_PEPPER_CDMS -DENABLE_CONFIGURATION_POLICY -DENABLE_INPUT_SPEECH =
-DENABLE_NOTIFICATIONS -DENABLE_GPU=3D1 -DENABLE_EGLIMAGE=3D1 =
-DENABLE_TASK_MANAGER=3D1 -DENABLE_EXTENSIONS=3D1 =
-DENABLE_PLUGIN_INSTALLATION=3D1 -DENABLE_PLUGINS=3D1 =
-DENABLE_SESSION_SERVICE=3D1 -DENABLE_THEMES=3D1 -DENABLE_BACKGROUND=3D1 =
-DENABLE_AUTOMATION=3D1 -DENABLE_GOOGLE_NOW=3D1 =
-DENABLE_LANGUAGE_DETECTION=3D1 -DENABLE_PRINTING=3D1 =
-DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 -DENABLE_MANAGED_USERS=3D1 =
-DWEBRTC_CHROMIUM_BUILD -DWEBRTC_ARCH_ARM -DWEBRTC_ARCH_ARM_V7 =
-DWEBRTC_ARCH_ARM_NEON -DWEBRTC_LINUX -D__STDC_CONSTANT_MACROS =
-D__STDC_FORMAT_MACROS -DNDEBUG -DNVALGRIND =
-DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -D_FORTIFY_SOURCE=3D2 =
-I../../third_party/webrtc -I../../third_party -I../.. =
-I../../third_party/webrtc/common_audio/resampler/include =
-I../../third_party/webrtc/common_audio/signal_processing/include =
-I../../third_party/webrtc/common_audio/vad/include -fstack-protector =
--param=3Dssp-buffer-size=3D4 -Werror -pthread -fno-exceptions =
-fno-strict-aliasing -Wall -Wno-unused-parameter =
-Wno-missing-field-initializers -fvisibility=3Dhidden -pipe -fPIC =
-mfpu=3Dneon -flax-vector-conversions -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb -O2 -fno-ident -fdata-sections =
-ffunction-sections   -c =
../../third_party/webrtc/modules/audio_processing/ns/nsx_core_neon.c -o =
obj/third_party/webrtc/modules/audio_processing/ns/audio_processing_neon.n=
sx_core_neon.o
> {standard input}: Assembler messages:
> {standard input}:274: Error: ']' expected -- `vld1.16 {d22},[r9:64]'
> ninja: build stopped: subcommand failed.
> --------------------------------------------------------------------
>=20
> 2:
> --------------------------------------------------------------------
> bash-4.2$ /usr/bin/gdb /usr/bin/chrome/chrome
> GNU gdb (GDB) 7.3.1
> Copyright (C) 2011 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later =
<http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show =
copying"
> and "show warranty" for details.
> This GDB was configured as "arm-magna-linux-gnueabi".
> For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>...
> Reading symbols from /usr/bin/chrome/chrome...done.
> (gdb) run
> Starting program: /usr/bin/chrome/chrome
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
> warning: Unable to find libthread_db matching inferior's thread =
library, thread debugging will not be available.
>=20
> Program received signal SIGILL, Illegal instruction.
> 0x41b09ecc in =
___ZNSt6vectorISbItN4base20string16_char_traitsESaItEESaIS3_EE14_M_fill_in=
sertEN9__gnu_cxx17__normal_iteratorIPS3_S5_EEjRKS3__veneer ()
> (gdb) bt full
> #0  0x41b09ecc in =
___ZNSt6vectorISbItN4base20string16_char_traitsESaItEESaIS3_EE14_M_fill_in=
sertEN9__gnu_cxx17__normal_iteratorIPS3_S5_EEjRKS3__veneer ()
> No symbol table info available.
> #1  0x4298c190 in __libc_csu_init (argc=3D1, argv=3D0xbe8eeb34, =
envp=3D0xbe8eeb3c) at elf-init.c:124
>        i =3D <optimized out>
> #2  0x4483553c in __libc_start_main () from /lib/libc.so.6
> No symbol table info available.
> #3  0x40318944 in _start ()
> No symbol table info available.
> (gdb)
> --------------------------------------------------------------------
>=20
>=20
> =
<fix-armv7a-compile.patch.gz>_____________________________________________=
__
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


