Return-Path: <thilo.cestonaro@ts.fujitsu.com>
Received: from dgate10.ts.fujitsu.com (dgate10.ts.fujitsu.com [80.70.172.49])
	by mail.openembedded.org (Postfix) with ESMTP id 780AB6A99C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 07:33:57 +0000 (UTC)
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:Content-Type;
	b=gSUInbVS6/2w9otsm9yGC24i9bVmbfV5yfz52eknYkt3Si+DsoBVLX84
	x+/30YeT+o418QPuxzVNzOTyJD6Ey6kSut6m1UusL1e286SOL563rCSQh
	rK7PdzBRxy4eswsuMuJJ6OchO4bBiABGIMoj8e/9AUpaOvn/jS9YAO1/j
	9SMGvn9KsmkQUKK3BdroS0QYWZSq1Dcz4uPvr/o7U+6IaLspg82WpABw3
	Q31Y2Xi/5Z1bU80sahTXST7nf332v;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=@ts.fujitsu.com; q=dns/txt;
	s=s1536b; t=1371713639; x=1403249639;
	h=message-id:date:from:mime-version:to:subject;
	bh=fzD3lrp9YB7P70HaJQf+mxkq8x3JXaXPPsreIaU66dw=;
	b=ROEkiyNPzdE+plcU37i8pCGk2h7Xl3f+kJhIj6iQVC5w0hOjVNDOuL0x
	SiUPxdsAT3wJFgdL/5sScoKmx9PV+UeYqQ0Ryj584HGRYVXRpfeFO3ZPv
	Y4iQLC240CllmMslZAuk/pXuJncorDbjOv7kgJJYvQGbBkgSyR0WjkBm3
	98vP30RKL4snpkdWNXfCUGpBKEJ1rCmD1kPMsfjpN4UXZg8ygSscP7f1L
	1qpsxuDjxOMd05qO0QsogUASrvu4h;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.87,903,1363129200"; 
	d="gz'50?scan'50,208,50";a="150523078"
Received: from unknown (HELO abgdgate60u.abg.fsc.net) ([172.25.138.90])
	by dgate10u.abg.fsc.net with ESMTP; 20 Jun 2013 09:33:56 +0200
X-IronPort-AV: E=Sophos;i="4.87,903,1363129200"; 
	d="gz'50?scan'50,208,50";a="62616160"
Received: from unknown (HELO [192.168.0.34]) ([172.25.162.11])
	by abgdgate60u.abg.fsc.net with ESMTP; 20 Jun 2013 09:33:56 +0200
Message-ID: <51C2B063.1050804@ts.fujitsu.com>
Date: Thu, 20 Jun 2013 09:33:55 +0200
From: Cestonaro Thilo <thilo.cestonaro@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130529 Thunderbird/17.0.6
MIME-Version: 1.0
To: Openembedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: chromium 29.0.1518.2 for armv7a
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
X-List-Received-Date: Thu, 20 Jun 2013 07:33:58 -0000
X-Groupsio-MsgNum: 45168
Content-Type: multipart/mixed; boundary="------------020808010104000102050606"

--------------020808010104000102050606
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hey,

I'm trying to compile chromium from meta-browser for a armv7a SoC.
But it always failed with following error[1]. I fixed this bug with the 
appended patch and I had to remove
the extra cflag "-Wno-error=unused-local-typedefs" from the recipe to 
get it to compile.
But can someone have a look at the patch and tell why the hell this 
compiles and the original code not, please?

However the real problem[2] is, that whenever I try to start chromium on 
the armv7a machine, it segills right away. Even --help brings the sigill :/.
I've no idea how to fix such a problem; any comments?

Thx.

Greetings
Thilo


1:
--------------------------------------------------------------------
+ cd /home/cestonarot/Projects/utc_soc/chromium/29/chromium-29.0.1518.2
+ do_compile
+ ninja -C 
/home/cestonarot/Projects/utc_soc/chromium/29/chromium-29.0.1518.2/out/Release 
chrome
ninja: Entering directory 
`/home/cestonarot/Projects/utc_soc/chromium/29/chromium-29.0.1518.2/out/Release'
[1/4] CC 
obj/third_party/webrtc/modules/audio_processing/ns/audio_processing_neon.nsx_core_neon.o
FAILED: arm-magna-linux-gnueabi-gcc  -march=armv7-a 
-fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon 
-mtune=cortex-a8 -mthumb-interwork -mno-thumb 
--sysroot=/home/cestonarot/Projects/utc_soc/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/dm814x-evm 
-MMD -MF 
obj/third_party/webrtc/modules/audio_processing/ns/audio_processing_neon.nsx_core_neon.o.d 
'-DWEBRTC_SVNREVISION="Unavailable(issue687)"' -D_FILE_OFFSET_BITS=64 
-DUSE_LINUX_BREAKPAD -DNO_TCMALLOC -DDISABLE_NACL -DCHROMIUM_BUILD 
-DUSE_DEFAULT_RENDER_THEME=1 -DUSE_LIBJPEG_TURBO=1 -DUSE_NSS=1 
-DUSE_X11=1 -DENABLE_ONE_CLICK_SIGNIN -DGTK_DISABLE_SINGLE_INCLUDES=1 
-DENABLE_REMOTING=1 -DENABLE_WEBRTC=1 -DUSE_PROPRIETARY_CODECS 
-DENABLE_PEPPER_CDMS -DENABLE_CONFIGURATION_POLICY -DENABLE_INPUT_SPEECH 
-DENABLE_NOTIFICATIONS -DENABLE_GPU=1 -DENABLE_EGLIMAGE=1 
-DENABLE_TASK_MANAGER=1 -DENABLE_EXTENSIONS=1 
-DENABLE_PLUGIN_INSTALLATION=1 -DENABLE_PLUGINS=1 
-DENABLE_SESSION_SERVICE=1 -DENABLE_THEMES=1 -DENABLE_BACKGROUND=1 
-DENABLE_AUTOMATION=1 -DENABLE_GOOGLE_NOW=1 
-DENABLE_LANGUAGE_DETECTION=1 -DENABLE_PRINTING=1 
-DENABLE_CAPTIVE_PORTAL_DETECTION=1 -DENABLE_MANAGED_USERS=1 
-DWEBRTC_CHROMIUM_BUILD -DWEBRTC_ARCH_ARM -DWEBRTC_ARCH_ARM_V7 
-DWEBRTC_ARCH_ARM_NEON -DWEBRTC_LINUX -D__STDC_CONSTANT_MACROS 
-D__STDC_FORMAT_MACROS -DNDEBUG -DNVALGRIND 
-DDYNAMIC_ANNOTATIONS_ENABLED=0 -D_FORTIFY_SOURCE=2 
-I../../third_party/webrtc -I../../third_party -I../.. 
-I../../third_party/webrtc/common_audio/resampler/include 
-I../../third_party/webrtc/common_audio/signal_processing/include 
-I../../third_party/webrtc/common_audio/vad/include -fstack-protector 
--param=ssp-buffer-size=4 -Werror -pthread -fno-exceptions 
-fno-strict-aliasing -Wall -Wno-unused-parameter 
-Wno-missing-field-initializers -fvisibility=hidden -pipe -fPIC 
-mfpu=neon -flax-vector-conversions -march=armv7-a -mtune=cortex-a8 
-mfpu=neon -mfloat-abi=softfp -mthumb -O2 -fno-ident -fdata-sections 
-ffunction-sections   -c 
../../third_party/webrtc/modules/audio_processing/ns/nsx_core_neon.c -o 
obj/third_party/webrtc/modules/audio_processing/ns/audio_processing_neon.nsx_core_neon.o
{standard input}: Assembler messages:
{standard input}:274: Error: ']' expected -- `vld1.16 {d22},[r9:64]'
ninja: build stopped: subcommand failed.
--------------------------------------------------------------------

2:
--------------------------------------------------------------------
bash-4.2$ /usr/bin/gdb /usr/bin/chrome/chrome
GNU gdb (GDB) 7.3.1
Copyright (C) 2011 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later 
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "arm-magna-linux-gnueabi".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /usr/bin/chrome/chrome...done.
(gdb) run
Starting program: /usr/bin/chrome/chrome
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread library, 
thread debugging will not be available.

Program received signal SIGILL, Illegal instruction.
0x41b09ecc in 
___ZNSt6vectorISbItN4base20string16_char_traitsESaItEESaIS3_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS3_S5_EEjRKS3__veneer 
()
(gdb) bt full
#0  0x41b09ecc in 
___ZNSt6vectorISbItN4base20string16_char_traitsESaItEESaIS3_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS3_S5_EEjRKS3__veneer 
()
No symbol table info available.
#1  0x4298c190 in __libc_csu_init (argc=1, argv=0xbe8eeb34, 
envp=0xbe8eeb3c) at elf-init.c:124
         i = <optimized out>
#2  0x4483553c in __libc_start_main () from /lib/libc.so.6
No symbol table info available.
#3  0x40318944 in _start ()
No symbol table info available.
(gdb)
--------------------------------------------------------------------



--------------020808010104000102050606
Content-Type: application/gzip;
 name="fix-armv7a-compile.patch.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="fix-armv7a-compile.patch.gz"

H4sICIp9wVEAA2ZpeC1hcm12N2EtY29tcGlsZS5wYXRjaAClkF1PgzAUhq/lV5wrA+GrLWyDLSaL
X1dqjNvihTENQlESVhDK1H9vKUznnEvMSBPavqfveZ+TZGkK9k3UVBC54iWrElpGlfhw39hTJWJ3
WSRNzmo3apKsoGVVxKyuM/7s8lqudxoXFaOcFdyJ4elAA8227YNTHBGEPRsNbRwCxmOfjHHo+EFI
RsgPRmAigpBmmubBabcaef7Y95zBYEQCLxwEfaPpFKQeWEMw298IplMNNGg/14XXJuKCslrojuMY
3XXGBR5SAQnLRXTapOlD8DjRzE1JLMvJRvG7392pHfpTwb+UuGi4OM9WtD3DCaySpqSc1nioryVj
ohCIh2V2k3jEChQCrBEWZRIJBnnx3NFkOQMJlC3l7ZpUFaoYsoneUxj3F6d38zM6u72i14srmaFd
d7PLua7Qra94FmBf5rA7K+njkS7usslzlXaVJ1htjr+nhh4N6yeh0Y9Recj3m7Wb0h57qe5wha+n
3aDbx/VLxdtZekTvLXsM+B+GvwtjqyHa2/ATzpdhGeIDAAA=

--------------020808010104000102050606--
