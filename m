Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SUH1V-0003nE-7v
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 14:38:41 +0200
Received: by yhjj56 with SMTP id j56so5499688yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 05:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=6FBdjLzj/XUGolvbQYPml3pSoaXjADD3k17sUMSPcPk=;
	b=DugBdea+EwA3fHts/Q0mFey5A3Bl4EjC/c2iU8UqROdTKX+Qr/3lBifjLv4G88t68k
	51qwVUlRf/V7rfb9KKKs7X4lYZSDkCl/RiGksHk+A4IwmJgy71brThELdXPVr+2Xygki
	dpfDkntpkBMBon11m4dzUlg/mkFYnyE2Sh8Vc5bjyF1iX/Ba4/qnPJZpptQtu/ixMAbi
	LxaTG/Hoo2SLS0U5TSGvf6TfYjn2Zcnl29+Ii2LmdBs8LZO+R4pznUpmcizFQstEd6QW
	UZCrr6++iXZ8xtstNdq/MNBMiKFjMtzg7bW4ynaBeCR1kXxKoIspiVdrrndzbNrfO7Xn
	f7+g==
MIME-Version: 1.0
Received: by 10.50.193.234 with SMTP id hr10mr2116422igc.14.1337084920460;
	Tue, 15 May 2012 05:28:40 -0700 (PDT)
Received: by 10.42.170.195 with HTTP; Tue, 15 May 2012 05:28:40 -0700 (PDT)
Date: Tue, 15 May 2012 14:28:40 +0200
Message-ID: <CALbNGRQ-sLsjDS9VV2TJ3JOzLzFhrXfCcMH2uxVJR1JboueLAg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-chromium] chromium build fails
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
X-List-Received-Date: Tue, 15 May 2012 12:38:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

with the latest layer master heads I get the following error on
building chromium:

  g++ '-D_FILE_OFFSET_BITS=64' '-DNO_TCMALLOC' '-DDISABLE_NACL'
'-DCHROMIUM_BUILD' '-DUSE_NSS=1' '-DTOOLKIT_USES_GTK=1'
'-DGTK_DISABLE_SINGLE_INCLUDES=1' '-DWEBUI_TASK_MANAGER=1'
'-DENABLE_REMOTING=1' '-DENABLE_WEBRTC=1' '-DENABLE_P2P_APIS=1'
'-DUSE_PROPRIETARY_CODECS' '-DENABLE_CONFIGURATION_POLICY'
'-DENABLE_INPUT_SPEECH' '-DENABLE_NOTIFICATIONS' '-DENABLE_GPU=1'
'-DENABLE_EGLIMAGE=1' '-DUSE_SKIA=1'
'-DENABLE_REGISTER_PROTOCOL_HANDLER=1' '-DENABLE_WEB_INTENTS=1'
'-DENABLE_PLUGIN_INSTALLATION=1' '-DENABLE_DEBUGGER_SUPPORT'
'-DV8_TARGET_ARCH_ARM' '-DUSE_EABI_HARDFLOAT=0' '-DNDEBUG'
'-DNVALGRIND' '-DDYNAMIC_ANNOTATIONS_ENABLED=0' -Iv8/src  -pthread
-fno-exceptions -fno-strict-aliasing -Wno-unused-parameter
-Wno-missing-field-initializers -fvisibility=hidden -pipe -fPIC
-Wno-format -Wno-unused-result -m32 -fno-ident -fdata-sections
-ffunction-sections -fERROR: Function failed: do_compile (see
/home/andreas/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/chromium-19.0.1049.3-r0/temp/log.do_compile.19214
for further information)
data-sections -ffunction-sections -fomit-frame-pointer -O3 -fno-rtti
-fno-threadsafe-statics -fvisibility-inlines-hidden -Wno-deprecated
-MMD -MF out/Release/.deps/out/Release/obj.host/v8_base/v8/src/accessors.o.d.raw
 -c -o out/Release/obj.host/v8_base/v8/src/accessors.o
v8/src/accessors.cc
In file included from /usr/include/features.h:387:0,
                 from /usr/include/stdio.h:28,
                 from v8/src/../include/v8stdint.h:34,
                 from v8/src/../include/v8.h:41,
                 from v8/src/v8.h:52,
                 from v8/src/accessors.cc:28:
/usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
file or directory
compilation terminated.
  g++ '-D_FILE_OFFSET_BITS=64' '-DNO_TCMALLOC' '-DDISABLE_NACL'
'-DCHROMIUM_BUILD' '-DUSE_NSS=1' '-DTOOLKIT_USES_GTK=1'
'-DGTK_DISABLE_SINGLE_INCLUDES=1' '-DWEBUI_TASK_MANAGER=1'
'-DENABLE_REMOTING=1' '-DENABLE_WEBRTC=1' '-DENABLE_P2P_APIS=1'
'-DUSE_PROPRIETARY_CODECS' '-DENABLE_CONFIGURATION_POLICY'
'-DENABLE_INPUT_SPEECH' '-DENABLE_NOTIFICATIONS' '-DENABLE_GPU=1'
'-DENABLE_EGLIMAGE=1' '-DUSE_SKIA=1'
'-DENABLE_REGISTER_PROTOCOL_HANDLER=1' '-DENABLE_WEB_INTENTS=1'
'-DENABLE_PLUGIN_INSTALLATION=1' '-DENABLE_DEBUGGER_SUPPORT'
'-DV8_TARGET_ARCH_ARM' '-DUSE_EABI_HARDFLOAT=0' '-DNDEBUG'
'-DNVALGRIND' '-DDYNAMIC_ANNOTATIONS_ENABLED=0' -Iv8/src  -pthread
-fno-exceptions -fno-strict-aliasing -Wno-unused-parameter
-Wno-missing-field-initializers -fvisibility=hidden -pipe -fPIC
-Wno-format -Wno-unused-result -m32 -fno-ident -fdata-sections
-ffunction-sections -fdata-sections -ffunction-sections
-fomit-frame-pointer -O3 -fno-rtti -fno-threadsafe-statics
-fvisibility-inlines-hidden -Wno-deprecated -MMD -MF
out/Release/.deps/out/Release/obj.host/v8_base/v8/src/allocation.o.d.raw
 -c -o out/Release/obj.host/v8_base/v8/src/allocation.o
v8/src/allocation.cc
make: *** [out/Release/obj.host/v8_base/v8/src/accessors.o] Error 1
make: *** Waiting for unfinished jobs....
In file included from /usr/include/features.h:387:0,
                 from /usr/include/stdio.h:28,
                 from v8/src/../include/v8stdint.h:34,
                 from v8/src/globals.h:60,
                 from v8/src/allocation.h:31,
                 from v8/src/allocation.cc:28:
/usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
file or directory
compilation terminated.

I grepped in sysroot /usr/include: There is no hit for stubs-32.h.
Seems there are some includes of my host to blame...

Andreas


