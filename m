Received: from [64.233.182.186] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1GatIA-0000ba-ES
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Oct 2006 14:16:02 +0200
Received: by nf-out-0910.google.com with SMTP id l23so1413901nfc
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2006 05:08:53 -0700 (PDT)
Received: by 10.48.254.10 with SMTP id b10mr151599nfi;
	Fri, 20 Oct 2006 05:08:53 -0700 (PDT)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id m16sm1320344nfc.2006.10.20.05.08.52;
	Fri, 20 Oct 2006 05:08:52 -0700 (PDT)
Date: Fri, 20 Oct 2006 15:08:51 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1187003130.20061020150851@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1Gat5Z-0000PW-3y@linuxtogo.org>
References: <E1Gat5Z-0000PW-3y@linuxtogo.org>
MIME-Version: 1.0
Subject: [oe-commits] org.oe.dev qemu: sync with poky, remove obsolete ones
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2006 12:16:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

The same type of question which occurs on list/IRC oftentimes now -
is it so unavoidable to remove just everything? What about the last
release version? It may contain known defficiencies for *some* archs
and configs, but it is still the last release version, not a random
snapshot which doesn't have obvious issues from the first look.



This is a forwarded message
From: mickeyl commit <openembedded-commits@lists.openembedded.org>
To: openembedded-commits@lists.openembedded.org
Date: Friday, October 20, 2006, 3:03:01 PM
Subject: [oe-commits] org.oe.dev qemu: sync with poky, remove obsolete ones

===8<==============Original message text===============
qemu: sync with poky, remove obsolete ones

Author: mickeyl@openembedded.org
Branch: org.openembedded.dev
Revision: ef3a5a7f82bd855166d146d4aa03631509d0afb6
ViewMTN: http://monotone.openembedded.org/revision.psp?id=ef3a5a7f82bd855166d146d4aa03631509d0afb6
Files:
1
packages/qemu/qemu-0.8.0
packages/qemu/qemu-0.8.0/arm_nptl.patch
packages/qemu/qemu-0.8.2
packages/qemu/qemu-0.8.2/arm_nptl.patch
packages/qemu/qemu-native_0.7.0.bb
packages/qemu/qemu-native_0.8.0.bb
packages/qemu/qemu-native_0.8.1.bb
packages/qemu/qemu-native_0.8.2.bb
packages/qemu/qemu_0.7.0.bb
packages/qemu/qemu_0.8.0.bb
packages/qemu/qemu_0.8.1.bb
packages/qemu/qemu_0.8.2.bb
packages/qemu/qemu-native.inc
packages/qemu/qemu-native_cvs.bb
packages/qemu/qemu_cvs.bb
Diffs:

#
# mt diff -r6c3c55a664b5e9996db5827d3e56aea5673fa0f5 -ref3a5a7f82bd855166d146d4aa03631509d0afb6
#
# 
# 
# delete "packages/qemu/qemu-0.8.0"
# 
# delete "packages/qemu/qemu-0.8.0/arm_nptl.patch"
# 
# delete "packages/qemu/qemu-0.8.2"
# 
# delete "packages/qemu/qemu-0.8.2/arm_nptl.patch"
# 
# delete "packages/qemu/qemu-native_0.7.0.bb"
# 
# delete "packages/qemu/qemu-native_0.8.0.bb"
# 
# delete "packages/qemu/qemu-native_0.8.1.bb"
# 
# delete "packages/qemu/qemu-native_0.8.2.bb"
# 
# delete "packages/qemu/qemu_0.7.0.bb"
# 
# delete "packages/qemu/qemu_0.8.0.bb"
# 
# delete "packages/qemu/qemu_0.8.1.bb"
# 
# delete "packages/qemu/qemu_0.8.2.bb"
# 
# patch "packages/qemu/qemu-native.inc"
#  from [1183567ede18baef9b3ea697040518af3900b919]
#    to [45385004225050f680ebab17b44abe8bb01242d7]
# 
# patch "packages/qemu/qemu-native_cvs.bb"
#  from [3ed461e231101677152430f28fd51441c9e7b8d1]
#    to [9120879a03dd31057f86891f767b181bf39ebd00]
# 
# patch "packages/qemu/qemu_cvs.bb"
#  from [c0743c6a5a5a5e933018c6befe679569aa30706d]
#    to [0dcf7b709ec1721d01b7d6c187dfd969f8cde228]
# 
============================================================
--- packages/qemu/qemu-native.inc       1183567ede18baef9b3ea697040518af3900b919
+++ packages/qemu/qemu-native.inc       45385004225050f680ebab17b44abe8bb01242d7
@@ -11,5 +11,6 @@ python __anonymous() {
         data.setVar('EXTRA_OECONF', oldOeConf + " --cc=gcc-3.4", d)
     elif len(which(path, 'gcc-3.3')) != 0:
         data.setVar('EXTRA_OECONF', oldOeConf + " --cc=gcc-3.3", d)
-
+    elif len(which(path, 'gcc-3.3.6')) != 0:
+        data.setVar('EXTRA_OECONF', oldOeConf + " --cc=gcc-3.3.6", d)
 }
============================================================
--- packages/qemu/qemu-native_cvs.bb    3ed461e231101677152430f28fd51441c9e7b8d1
+++ packages/qemu/qemu-native_cvs.bb    9120879a03dd31057f86891f767b181bf39ebd00
@@ -1,3 +1,4 @@ inherit native
 require qemu_cvs.bb
 inherit native
+# prefix = "${STAGING_DIR}/${BUILD_SYS}"
+inherit qemu-native.inc
-require qemu-native.inc
============================================================
--- packages/qemu/qemu_cvs.bb   c0743c6a5a5a5e933018c6befe679569aa30706d
+++ packages/qemu/qemu_cvs.bb   0dcf7b709ec1721d01b7d6c187dfd969f8cde228
@@ -1,10 +1,17 @@ PV = "0.8.2+cvs${SRCDATE}"
 LICENSE = "GPL"
 PV = "0.8.2+cvs${SRCDATE}"
+PR = "r1"
 
 SRC_URI = "cvs://anonymous@cvs.savannah.nongnu.org/sources/qemu;method=pserver;rsh=ssh;module=qemu \
-           file://configure.patch;patch=1 \
+           file://configure.patch;patch=1    \
+           file://qemu-sdl-cursor.patch;patch=1    \
+          file://arm_nptl.patch;patch=1     \
           file://pl110_rgb-r0.patch;patch=1 \
-          file://arm_nptl.patch;patch=1"
+          file://qemu-pci-irq-sharing.patch;patch=1 \
+          file://compiler.patch;patch=1 \
+          file://qemu-usb-wacom-0.8.2.patch;patch=1 \
+           file://qemu-usb-wacom-pressure.patch;patch=1 \
+          file://qemu-usb-wacom-buttons.patch;patch=1"
 
 S = "${WORKDIR}/qemu"
 



_______________________________________________
Openembedded-commits mailing list
Openembedded-commits@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

===8<===========End of original message text===========



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



