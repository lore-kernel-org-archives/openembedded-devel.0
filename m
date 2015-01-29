Return-Path: <hugo.saldanha@aker.com.br>
X-Greylist: delayed 603 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 Jan 2015 20:17:57 UTC
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id 3E6FA6012B
	for <openembedded-devel@openembedded.org>;
	Thu, 29 Jan 2015 20:17:56 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Thu, 29 Jan 2015 18:17:49 -0200
	(envelope-from hugo.saldanha@aker.com.br)
Received: from saldanha.aker.com.br (10.4.3.1) by mail.aker.com.br (10.0.0.20)
	with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Thu, 29 Jan 2015 18:07:23 -0200
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: openembedded-devel@openembedded.org
Date: Thu, 29 Jan 2015 18:09:10 -0200
Message-ID: <1422562150-955-1-git-send-email-hugo.saldanha@aker.com.br>
X-Mailer: git-send-email 2.2.2
MIME-Version: 1.0
X-AkerSMTPGW-ServerID: 51f68171b98dfe728ef69b3fd9ed422989bd9b1e
X-AkerSMTPGW-MessageID: 1d7c799fd40aa0e97c8e22430a8a39c50201aa12-10o
Subject: [meta-networking][PATCH] crda: upgrade to 3.13
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
X-List-Received-Date: Thu, 29 Jan 2015 20:18:06 -0000
Content-Type: text/plain

CRDA has been relicensed under the copyleft-next license.
Regulatory bins license remains ISC.

There is an new internal library called libreg.so which was
placed in the same directory of the regulatory bin. The call
to make was adjusted accordingly.

Remove version 1.1.3.

Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
---
 meta-networking/licenses/copyleft-next-0.3.0       | 219 +++++++++++++++++++++
 ...STDIR-support-in-install-libreg-rules-in-.patch |  33 ++++
 ...e-linking-order-to-avoid-compilation-erro.patch |  49 +++++
 .../do-not-run-ldconfig-if-destdir-is-set.patch    |  16 ++
 .../fix-linking-of-libraries-used-by-reglib.patch  |  45 +++++
 .../recipes-connectivity/crda/crda_1.1.3.bb        |  38 ----
 .../recipes-connectivity/crda/crda_3.13.bb         |  43 ++++
 7 files changed, 405 insertions(+), 38 deletions(-)
 create mode 100644 meta-networking/licenses/copyleft-next-0.3.0
 create mode 100644 meta-networking/recipes-connectivity/crda/crda-3.13/crda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch
 create mode 100644 meta-networking/recipes-connectivity/crda/crda-3.13/crda-Fix-the-linking-order-to-avoid-compilation-erro.patch
 create mode 100644 meta-networking/recipes-connectivity/crda/crda-3.13/do-not-run-ldconfig-if-destdir-is-set.patch
 create mode 100644 meta-networking/recipes-connectivity/crda/crda-3.13/fix-linking-of-libraries-used-by-reglib.patch
 delete mode 100644 meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
 create mode 100644 meta-networking/recipes-connectivity/crda/crda_3.13.bb

diff --git a/meta-networking/licenses/copyleft-next-0.3.0 b/meta-networking/licenses/copyleft-next-0.3.0
new file mode 100644
index 0000000..a66d5bf
--- /dev/null
+++ b/meta-networking/licenses/copyleft-next-0.3.0
@@ -0,0 +1,219 @@
+                   copyleft-next 0.3.0 ("this License")
+                         Release date: 2013-05-16
+
+1. License Grants; No Trademark License
+
+   Subject to the terms of this License, I grant You:
+
+   a) A non-exclusive, worldwide, perpetual, royalty-free, irrevocable
+      copyright license, to reproduce, Distribute, prepare derivative works
+      of, publicly perform and publicly display My Work.
+
+   b) A non-exclusive, worldwide, perpetual, royalty-free, irrevocable
+      patent license under Licensed Patents to make, have made, use, sell,
+      offer for sale, and import Covered Works.
+
+   This License does not grant any rights in My name, trademarks, service
+   marks, or logos.
+
+2. Distribution: General Conditions
+
+   You may Distribute Covered Works, provided that You (i) inform
+   recipients how they can obtain a copy of this License; (ii) satisfy the
+   applicable conditions of sections 3 through 6; and (iii) preserve all
+   Legal Notices contained in My Work (to the extent they remain
+   pertinent). "Legal Notices" means copyright notices, license notices,
+   license texts, and author attributions, but does not include logos,
+   other graphical images, trademarks or trademark legends.
+
+3. Conditions for Distributing Derived Works; Outbound GPL Compatibility
+
+   If You Distribute a Derived Work, You must license the entire Derived
+   Work as a whole under this License, with prominent notice of such
+   licensing. This condition may not be avoided through such means as
+   separate Distribution of portions of the Derived Work. You may
+   additionally license the Derived Work under the GPL, so that the
+   recipient may further Distribute the Derived Work under either this
+   License or the GPL.
+
+4. Condition Against Further Restrictions; Inbound License Compatibility
+
+   When Distributing a Covered Work, You may not impose further
+   restrictions on the exercise of rights in the Covered Work granted under
+   this License. This condition is not excused merely because such
+   restrictions result from Your compliance with conditions or obligations
+   extrinsic to this License (such as a court order or an agreement with a
+   third party).
+
+   However, You may Distribute a Covered Work incorporating material
+   governed by a license that is both OSI-Approved and FSF-Free as of the
+   release date of this License, provided that Your Distribution complies
+   with such other license.
+
+5. Conditions for Distributing Object Code
+
+   You may Distribute an Object Code form of a Covered Work, provided that
+   you accompany the Object Code with a URL through which the Corresponding
+   Source is made available, at no charge, by some standard or customary
+   means of providing network access to source code.
+
+   If you Distribute the Object Code in a physical product or tangible
+   storage medium ("Product"), the Corresponding Source must be available
+   through such URL for two years from the date of Your most recent
+   Distribution of the Object Code in the Product. However, if the Product
+   itself contains or is accompanied by the Corresponding Source (made
+   available in a customarily accessible manner), You need not also comply
+   with the first paragraph of this section.
+
+   Each recipient of the Covered Work from You is an intended third-party
+   beneficiary of this License solely as to this section 5, with the right
+   to enforce its terms.
+
+6. Symmetrical Licensing Condition for Upstream Contributions
+
+   If You Distribute a work to Me specifically for inclusion in or
+   modification of a Covered Work (a "Patch"), and no explicit licensing
+   terms apply to the Patch, You license the Patch under this License, to
+   the extent of Your copyright in the Patch. This condition does not
+   negate the other conditions of this License, if applicable to the Patch.
+
+7. Nullification of Copyleft/Proprietary Dual Licensing
+
+   If I offer to license, for a fee, a Covered Work under terms other than
+   a license that is OSI-Approved or FSF-Free as of the release date of this
+   License or a numbered version of copyleft-next released by the
+   Copyleft-Next Project, then the license I grant You under section 1 is no
+   longer subject to the conditions in sections 2 through 5.
+
+8. Copyleft Sunset
+
+   The conditions in sections 2 through 5 no longer apply once fifteen
+   years have elapsed from the date of My first Distribution of My Work
+   under this License.
+
+9. Pass-Through
+
+   When You Distribute a Covered Work, the recipient automatically receives
+   a license to My Work from Me, subject to the terms of this License.
+
+10. Termination
+
+    Your license grants under section 1 are automatically terminated if You
+
+    a) fail to comply with the conditions of this License, unless You cure
+       such noncompliance within thirty days after becoming aware of it, or
+
+    b) initiate a patent infringement litigation claim (excluding
+       declaratory judgment actions, counterclaims, and cross-claims)
+       alleging that any part of My Work directly or indirectly infringes
+       any patent.
+
+    Termination of Your license grants extends to all copies of Covered
+    Works You subsequently obtain. Termination does not terminate the
+    rights of those who have received copies or rights from You subject to
+    this License.
+
+    To the extent permission to make copies of a Covered Work is necessary
+    merely for running it, such permission is not terminable.
+
+11. Later License Versions
+
+    The Copyleft-Next Project may release new versions of copyleft-next,
+    designated by a distinguishing version number ("Later Versions").
+    Unless I explicitly remove the option of Distributing Covered Works
+    under Later Versions, You may Distribute Covered Works under any Later
+    Version.
+
+** 12. No Warranty                                                       **
+**                                                                       **
+**     My Work is provided "as-is", without warranty. You bear the risk  **
+**     of using it. To the extent permitted by applicable law, each      **
+**     Distributor of My Work excludes the implied warranties of title,  **
+**     merchantability, fitness for a particular purpose and             **
+**     non-infringement.                                                 **
+
+** 13. Limitation of Liability                                           **
+**                                                                       **
+**     To the extent permitted by applicable law, in no event will any   **
+**     Distributor of My Work be liable to You for any damages           **
+**     whatsoever, whether direct, indirect, special, incidental, or     **
+**     consequential damages, whether arising under contract, tort       **
+**     (including negligence), or otherwise, even where the Distributor  **
+**     knew or should have known about the possibility of such damages.  **
+
+14. Severability
+
+    The invalidity or unenforceability of any provision of this License
+    does not affect the validity or enforceability of the remainder of
+    this License. Such provision is to be reformed to the minimum extent
+    necessary to make it valid and enforceable.
+
+15. Definitions
+
+    "Copyleft-Next Project" means the project that maintains the source
+    code repository at <https://gitorious.org/copyleft-next/> as of the
+    release date of this License.
+
+    "Corresponding Source" of a Covered Work in Object Code form means (i)
+    the Source Code form of the Covered Work; (ii) all scripts,
+    instructions and similar information that are reasonably necessary for
+    a skilled developer to generate such Object Code from the Source Code
+    provided under (i); and (iii) a list clearly identifying all Separate
+    Works (other than those provided in compliance with (ii)) that were
+    specifically used in building and (if applicable) installing the
+    Covered Work (for example, a specified proprietary compiler including
+    its version number). Corresponding Source must be machine-readable.
+
+    "Covered Work" means My Work or a Derived Work.
+
+    "Derived Work" means a work of authorship that copies from, modifies,
+    adapts, is based on, is a derivative work of, transforms, translates or
+    contains all or part of My Work, such that copyright permission is
+    required. The following are not Derived Works: (i) Mere Aggregation;
+    (ii) a mere reproduction of My Work; and (iii) if My Work fails to
+    explicitly state an expectation otherwise, a work that merely makes
+    reference to My Work.
+
+    "Distribute" means to distribute, transfer or make a copy available to
+    someone else, such that copyright permission is required.
+
+    "Distributor" means Me and anyone else who Distributes a Covered Work.
+
+    "FSF-Free" means classified as 'free' by the Free Software Foundation.
+
+    "GPL" means a version of the GNU General Public License or the GNU
+    Affero General Public License.
+
+    "I"/"Me"/"My" refers to the individual or legal entity that places My
+    Work under this License. "You"/"Your" refers to the individual or legal
+    entity exercising rights in My Work under this License. A legal entity
+    includes each entity that controls, is controlled by, or is under
+    common control with such legal entity. "Control" means (a) the power to
+    direct the actions of such legal entity, whether by contract or
+    otherwise, or (b) ownership of more than fifty percent of the
+    outstanding shares or beneficial ownership of such legal entity.
+
+    "Licensed Patents" means all patent claims licensable royalty-free by
+    Me, now or in the future, that are necessarily infringed by making,
+    using, or selling My Work, and excludes claims that would be infringed
+    only as a consequence of further modification of My Work.
+
+    "Mere Aggregation" means an aggregation of a Covered Work with a
+    Separate Work.
+
+    "My Work" means the particular work of authorship I license to You
+    under this License.
+
+    "Object Code" means any form of a work that is not Source Code.
+
+    "OSI-Approved" means approved as 'Open Source' by the Open Source
+    Initiative.
+
+    "Separate Work" means a work that is separate from and independent of a
+    particular Covered Work and is not by its nature an extension or
+    enhancement of the Covered Work, and/or a runtime library, standard
+    library or similar component that is used to generate an Object Code
+    form of a Covered Work.
+
+    "Source Code" means the preferred form of a work for making
+    modifications to it.
diff --git a/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch b/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch
new file mode 100644
index 0000000..e03c3c9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch
@@ -0,0 +1,33 @@
+From: "John W. Linville" <linville@tuxdriver.com>
+Date: Fri, 14 Feb 2014 13:58:44 -0500
+Subject: [PATCH] crda: Add DESTDIR support in install-libreg* rules in Makefile
+Origin: https://git.kernel.org/?p=linux/kernel/git/mcgrof/crda.git/commit?id=2cabb2588da56735369131b709f191453c080be0
+
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Luis R. Rodriguez <mcgrof@do-not-panic.com>
+---
+ Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 0b2f0d7..1f25509 100644
+--- a/Makefile
++++ b/Makefile
+@@ -120,13 +120,13 @@ $(LIBREG): regdb.h reglib.h reglib.c
+ 
+ install-libreg-headers:
+ 	$(NQ) '  INSTALL  libreg-headers'
+-	$(Q)mkdir -p $(INCLUDE_DIR)
+-	$(Q)cp *.h $(INCLUDE_DIR)/
++	$(Q)mkdir -p $(DESTDIR)/$(INCLUDE_DIR)
++	$(Q)cp *.h $(DESTDIR)/$(INCLUDE_DIR)/
+ 
+ install-libreg:
+ 	$(NQ) '  INSTALL  libreg'
+-	$(Q)mkdir -p $(LIBDIR)
+-	$(Q)cp $(LIBREG) $(LIBDIR)/
++	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
++	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
+ 	$(Q)ldconfig
+ 
+ %.o: %.c regdb.h $(LIBREG)
diff --git a/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Fix-the-linking-order-to-avoid-compilation-erro.patch b/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Fix-the-linking-order-to-avoid-compilation-erro.patch
new file mode 100644
index 0000000..50db97e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Fix-the-linking-order-to-avoid-compilation-erro.patch
@@ -0,0 +1,49 @@
+From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
+Date: Mon, 16 Dec 2013 21:57:39 +0530
+Subject: [PATCH] crda: Fix the linking order to avoid compilation error
+Origin: https://git.kernel.org/?p=linux/kernel/git/mcgrof/crda.git/commit?id=fefefdb2c52c8fbedbb339b4badb8226cad7e7e0
+
+While linking the crda.o and libreg.so, first put crda.o
+and then -lreg. This fixed the below error:
+
+  GEN  keys-gcrypt.c
+  Trusted pubkeys: pubkeys/linville.key.pub.pem
+  CC   libreg.so
+  CC   crda.o
+  LD   crda
+crda.o: In function `main':
+crda/crda.c:196: undefined reference to `reglib_get_rd_alpha2'
+collect2: ld returned 1 exit status
+make: *** [crda] Error 1
+
+Note: This still doesn't fix the below error (will send another mail)
+
+  CHK  /usr/lib/crda/regulatory.bin
+Database signature verification failed.
+Invalid or empty regulatory file, note: a binary regulatory file should be used.
+make: *** [verify] Error 234
+
+Signed-off-by: Luis R. Rodriguez <mcgrof@do-not-panic.com>
+Signed-off-by: Chaitanya T K <chaitanya.mgit@gmail.com>
+---
+ Makefile | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 4a351c6..0b2f0d7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -28,10 +28,11 @@ RUNTIME_PUBKEY_DIR?=/etc/wireless-regdb/pubkeys
+ CFLAGS += -O2 -fpic
+ CFLAGS += -std=gnu99 -Wall -Werror -pedantic
+ CFLAGS += -Wall -g
+-LDLIBS += -lm
+ LDLIBREG += -lreg
++LDLIBS += $(LDLIBREG)
++LDLIBS += -lm
+ LIBREG += libreg.so
+-LDFLAGS += -L ./ $(LDLIBREG)
++LDFLAGS += -L ./
+ 
+ all: all_noverify verify
+ 
diff --git a/meta-networking/recipes-connectivity/crda/crda-3.13/do-not-run-ldconfig-if-destdir-is-set.patch b/meta-networking/recipes-connectivity/crda/crda-3.13/do-not-run-ldconfig-if-destdir-is-set.patch
new file mode 100644
index 0000000..a23f865
--- /dev/null
+++ b/meta-networking/recipes-connectivity/crda/crda-3.13/do-not-run-ldconfig-if-destdir-is-set.patch
@@ -0,0 +1,16 @@
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Sat, 23 Aug 2014 11:13:44 -0700
+Subject: Do not run ldconfig if DESTDIR is set
+
+--- a/Makefile
++++ b/Makefile
+@@ -132,7 +132,9 @@ install-libreg:
+ 	$(NQ) '  INSTALL  libreg'
+ 	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
+ 	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
++ifndef DESTDIR
+ 	$(Q)ldconfig
++endif
+ 
+ %.o: %.c regdb.h $(LIBREG)
+ 	$(NQ) '  CC  ' $@
diff --git a/meta-networking/recipes-connectivity/crda/crda-3.13/fix-linking-of-libraries-used-by-reglib.patch b/meta-networking/recipes-connectivity/crda/crda-3.13/fix-linking-of-libraries-used-by-reglib.patch
new file mode 100644
index 0000000..164475e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/crda/crda-3.13/fix-linking-of-libraries-used-by-reglib.patch
@@ -0,0 +1,45 @@
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Sat, 23 Aug 2014 11:27:10 -0700
+Subject: Fix linking of libraries used by libreg
+
+The math and crypto libraries are called by and need to be linked to
+libreg.so, not to the executables.
+
+--- a/Makefile
++++ b/Makefile
+@@ -30,7 +30,7 @@ CFLAGS += -std=gnu99 -Wall -Werror -peda
+ CFLAGS += -Wall -g
+ LDLIBREG += -lreg
+ LDLIBS += $(LDLIBREG)
+-LDLIBS += -lm
++LIBREGLDLIBS += -lm
+ LIBREG += libreg.so
+ LDFLAGS += -L ./
+ 
+@@ -40,7 +40,7 @@ all_noverify: $(LIBREG) crda intersect r
+ 
+ ifeq ($(USE_OPENSSL),1)
+ CFLAGS += -DUSE_OPENSSL -DPUBKEY_DIR=\"$(RUNTIME_PUBKEY_DIR)\" `pkg-config --cflags openssl`
+-LDLIBS += `pkg-config --libs openssl`
++LIBREGLDLIBS += `pkg-config --libs openssl`
+ 
+ ifeq ($(RUNTIME_PUBKEY_ONLY),1)
+ CFLAGS += -DRUNTIME_PUBKEY_ONLY
+@@ -51,7 +51,7 @@ endif
+ 
+ else
+ CFLAGS += -DUSE_GCRYPT
+-LDLIBS += -lgcrypt
++LIBREGLDLIBS += -lgcrypt
+ 
+ $(LIBREG): keys-gcrypt.c
+ 
+@@ -121,7 +121,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(
+ 
+ $(LIBREG): regdb.h reglib.h reglib.c
+ 	$(NQ) '  CC  ' $@
+-	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $^
++	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $^ $(LIBREGLDLIBS)
+ 
+ install-libreg-headers:
+ 	$(NQ) '  INSTALL  libreg-headers'
diff --git a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
deleted file mode 100644
index 0bb8998..0000000
--- a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "Wireless Central Regulatory Domain Agent"
-HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
-
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
-
-
-DEPENDS = "python-m2crypto-native python-native libgcrypt libnl"
-
-SRC_URI = "http://wireless.kernel.org/download/crda/${BP}.tar.bz2;name=crda \
-           http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2013.01.11-regulatory.bin;name=bin \
-"
-SRC_URI[crda.md5sum] = "29579185e06a75675507527243d28e5c"
-SRC_URI[crda.sha256sum] = "aa8a7fe92f0765986c421a5b6768a185375ac210393df0605ee132f6754825f0"
-SRC_URI[bin.md5sum] = "e0c8a5ca63fb8bf803213f9a0c90b50b"
-SRC_URI[bin.sha256sum] = "b1ee0b20c123c612dfdb6851ab42c01666f66fb583e0e590942f19bb54cf84be"
-
-inherit python-dir pythonnative
-# Recursive make problem
-EXTRA_OEMAKE = "MAKEFLAGS= DESTDIR=${D}"
-
-do_compile() {
-    oe_runmake all_noverify
-}
-
-do_install() {
-    oe_runmake SBINDIR=${sbindir}/ install
-
-    install -d ${D}${libdir}/crda/
-
-    install -m 0644 ${WORKDIR}/2013.01.11-regulatory.bin ${D}${libdir}/crda/regulatory.bin
-}
-
-
-RDEPENDS_${PN} = "udev"
-FILES_${PN} += "${libdir}crda/regulatory.bin \
-                ${base_libdir}/udev/rules.d/85-regulatory.rules \
-"
diff --git a/meta-networking/recipes-connectivity/crda/crda_3.13.bb b/meta-networking/recipes-connectivity/crda/crda_3.13.bb
new file mode 100644
index 0000000..2ccced4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/crda/crda_3.13.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Wireless Central Regulatory Domain Agent"
+HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
+
+LICENSE = "copyleft-next-0.3.0 & ISC"
+LIC_FILES_CHKSUM = "file://copyleft-next-0.3.0;md5=8743a2c359037d4d329a31e79eabeffe \
+                    file://${WORKDIR}/wireless-regdb-2014.11.18/LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
+
+DEPENDS = "python-m2crypto-native python-native"
+
+SRC_URI = "https://www.kernel.org/pub/software/network/crda/${BP}.tar.xz;name=crda \
+           https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2014.11.18.tar.xz;name=bin \
+           file://crda-Fix-the-linking-order-to-avoid-compilation-erro.patch \
+           file://crda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch \
+           file://do-not-run-ldconfig-if-destdir-is-set.patch \
+           file://fix-linking-of-libraries-used-by-reglib.patch \
+"
+SRC_URI[crda.md5sum] = "66b1b0417c1ad19f0009a5c0c0c1aebc"
+SRC_URI[crda.sha256sum] = "2f85da7ab0170b140d6ed62596c8f268d4a7dedecf84cac7182ada979742ff59"
+
+SRC_URI[bin.md5sum] = "d750c402c5510add7380edcb1d9b75b2"
+SRC_URI[bin.sha256sum] = "eab6b50f30748a8b0065ba38cf3df05aac161a5861ae0a6c3cfd01d38a71c9dd"
+
+inherit python-dir pythonnative
+# Recursive make problem
+EXTRA_OEMAKE = "MAKEFLAGS= DESTDIR=${D} LIBDIR=${libdir}/crda LDLIBREG='-Wl,-rpath,${libdir}/crda -lreg'"
+
+do_compile() {
+    oe_runmake all_noverify
+}
+
+do_install() {
+    oe_runmake SBINDIR=${sbindir}/ install
+
+    install -d ${D}${libdir}/crda/
+
+    install -m 0644 ${WORKDIR}/wireless-regdb-2014.11.18/regulatory.bin ${D}${libdir}/crda/regulatory.bin
+}
+
+
+RDEPENDS_${PN} = "udev libgcrypt libnl"
+FILES_${PN} += "${libdir}crda/regulatory.bin \
+                ${base_libdir}/udev/rules.d/85-regulatory.rules \
+"
-- 
2.2.2



