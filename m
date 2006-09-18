Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <leoncamel@gmail.com>) id 1GPDPh-000656-Em
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Sep 2006 09:19:33 +0200
Received: by nf-out-0910.google.com with SMTP id l23so3000519nfc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2006 00:15:33 -0700 (PDT)
Received: by 10.48.210.20 with SMTP id i20mr16567653nfg;
	Mon, 18 Sep 2006 00:15:33 -0700 (PDT)
Received: by 10.48.215.2 with HTTP; Mon, 18 Sep 2006 00:15:31 -0700 (PDT)
Message-ID: <ad39a30f0609180015wc6ba838vff48fef6d7d41f7d@mail.gmail.com>
Date: Mon, 18 Sep 2006 15:15:31 +0800
From: "Leon Zhang" <leoncamel@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.8
Subject: opie-freetype issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Sep 2006 07:19:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Dear all.

      hey, I am trying to fix the bug about opie-freetype. I found that the
current package can't install anything into "tmp/work/armv5te-linux/opie-
freetype-1.2.2-r0/install/". So, I write a patch which add "do_install"
function to install something into the directory. Here is the patch,

============================================================
--- packages/opie-freetype/opie-freetype.inc
a267aa16819e3160b8aca21e71fbf96494a2af34
+++ packages/opie-freetype/opie-freetype.inc
13950b3a59934d606aa73d29d0cd21b9e03137f5
@@ -11,4 +11,11 @@ inherit opie

 inherit opie

+
+do_install () {
+       install -d ${D}${palmtopdir}/bin/
+       install -d ${D}${palmtopdir}/lib/
+       oe_libinstall -so libfreetypefactory ${D}${palmtopdir}/lib
+}
+
 EXTRA_QMAKEVARS_POST += "INCLUDEPATH+=${STAGING_INCDIR}/freetype2"

------------------------------------------------------------------------

and then, i tried to rebuild the *opie-freetype*.:

------------------------------------------------------------------------
leon@build-server:~/oe/test.dev$ bitbake opie-freetype -c rebuild
NOTE: Using cache in '/home/leon/oe/test.dev/tmp/cache'
NOTE: Handling BitBake files: / (3987/3987) [100 %]
NOTE: Parsing finished. 3847 cached, 0 parsed, 140 skipped, 0 masked.

NOTE: build 200609181513: started

OE Build Configuration:
BB_VERSION     = "1.6.1"
OE_REVISION    = "ddfe4434adf5911bc0607ac50123d539b22ff997"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "paraphone-xscale"
DISTRO         = "paraphone-gen"
DISTRO_VERSION = ".dev-snapshot-20060918"
TARGET_FPU     = "soft"

NOTE: package opie-freetype-1.2.2: started
NOTE: package opie-freetype-1.2.2-r0: task do_rebuild: started
NOTE: package opie-freetype-1.2.2-r0: task do_clean: started
NOTE: removing /home/leon/oe/test.dev/tmp/work/armv5te-linux/opie-
freetype-1.2.2-r0
NOTE: removing /home/leon/oe/test.dev/tmp/stamps/armv5te-linux/opie-
freetype-1.2.2-r0.*
NOTE: package opie-freetype-1.2.2-r0: task do_clean: completed
NOTE: package opie-freetype-1.2.2-r0: task do_fetch: started
NOTE: package opie-freetype-1.2.2-r0: task do_fetch: completed
NOTE: package opie-freetype-1.2.2-r0: task do_unpack: started
NOTE: Unpacking
/home/leon/sources/opie.freetype_anoncvs.handhelds.org_v1_2_2_.tar.gz to
/home/leon/oe/test.dev/tmp/work/armv5te-linux/opie-freetype-1.2.2-r0/
NOTE: package opie-freetype-1.2.2-r0: task do_unpack: completed
NOTE: package opie-freetype-1.2.2-r0: task do_patch: started
NOTE: package opie-freetype-1.2.2-r0: task do_patch: completed
NOTE: package opie-freetype-1.2.2-r0: task do_configure: started
NOTE: package opie-freetype-1.2.2-r0: task do_configure: completed
NOTE: package opie-freetype-1.2.2-r0: task do_compile: started
NOTE: package opie-freetype-1.2.2-r0: task do_compile: completed
NOTE: package opie-freetype-1.2.2-r0: task do_install: started
NOTE: package opie-freetype-1.2.2-r0: task do_install: completed
NOTE: package opie-freetype-1.2.2-r0: task do_package: started
NOTE: Not creating empty archive for opie-freetype-dbg-1.2.2-r0
Packaged contents of opie-freetype into
/home/leon/oe/test.dev/tmp/deploy/ipk/libfreetypefactory1_1.2.2-r0_armv5te.ipk
NOTE: Not creating empty archive for opie-freetype-doc-1.2.2-r0
NOTE: Not creating empty archive for opie-freetype-dev-1.2.2-r0
NOTE: Not creating empty archive for opie-freetype-locale-1.2.2-r0
NOTE: Not creating empty archive for opie-freetype-dbg-1.2.2-r0
./
./opt/
./opt/QtPalmtop/
./opt/QtPalmtop/bin/
./opt/QtPalmtop/lib/
./opt/QtPalmtop/lib/libfreetypefactory.so
./opt/QtPalmtop/lib/libfreetypefactory.so.1
./opt/QtPalmtop/lib/libfreetypefactory.so.1.0
./opt/QtPalmtop/lib/libfreetypefactory.so.1.0.1
./opt/QtPalmtop/lib/.debug/
./opt/QtPalmtop/lib/.debug/libfreetypefactory.so.1.0.1
NOTE: Not creating empty archive for opie-freetype-doc-1.2.2-r0
NOTE: Not creating empty archive for opie-freetype-dev-1.2.2-r0
NOTE: Not creating empty archive for opie-freetype-locale-1.2.2-r0
NOTE: package opie-freetype-1.2.2-r0: task do_package: completed
NOTE: package opie-freetype-1.2.2-r0: task do_opie_install: started
NOTE: Section='Fontfactories', bindir='/plugins/fontfactories',
desktopdir='None', name='freetypefactory', type='plugin'
NOTE: package opie-freetype-1.2.2-r0: task do_opie_install: completed
NOTE: package opie-freetype-1.2.2-r0: task do_populate_staging: started
NOTE: package opie-freetype-1.2.2-r0: task do_populate_staging: completed
NOTE: package opie-freetype-1.2.2-r0: task do_build: started
NOTE: package opie-freetype-1.2.2-r0: task do_build: completed
NOTE: package opie-freetype-1.2.2-r0: task do_rebuild: completed
NOTE: package opie-freetype-1.2.2: completed
NOTE: build 200609181513: completed
Build statistics:
  Attempted builds: 1
leon@build-server:~/oe/test.dev$


Hmm, I don't know why, it pakcaged contents into *libfreetypefactory*
instead of *opie-freetype*. So, why ?

