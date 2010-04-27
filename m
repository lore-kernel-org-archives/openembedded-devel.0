Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O6s0z-0006Cd-9j
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 23:08:22 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O6rxQ-00061R-59 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 14:04:40 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 27 Apr 2010 14:04:39 -0700
Received: from 172.30.80.244 ([172.30.80.244]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 27 Apr 2010 21:04:39 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	27 Apr 2010 14:04:30 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1272401386.3865.719.camel@trini-m4400>
References: <1272401386.3865.719.camel@trini-m4400>
Organization: Mentor Graphics Corporation
Date: Tue, 27 Apr 2010 14:04:30 -0700
Message-ID: <1272402270.3865.734.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 27 Apr 2010 21:04:39.0909 (UTC)
	FILETIME=[404C4150:01CAE64D]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] Remove scsi headers from linux-libc-headers
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
X-List-Received-Date: Tue, 27 Apr 2010 21:08:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

linux-libc-headers: Go and delete include/scsi when it exists

With 2.6.31, the kernel started exporting SCSI headers again and in
particular scsi/scsi.h.  After talking with Christoph Hellwig and James
Bottemley (scsi maintainer), the really big deal is scsi.h (the others
may or may not be clean enough, but do not conflict.

Removing this from the kernel, rather than trying to clean it up to be
userland parseable is the right way to go.

Signed-off-by: Tom Rini <tom_rini@mentor.com>

diff --git
a/recipes/linux-libc-headers/linux-libc-headers-2.6.31/scsi-use-__u8.patch =
b/recipes/linux-libc-headers/linux-libc-headers-2.6.31/scsi-use-__u8.patch
deleted file mode 100644
index b754879..0000000
---
a/recipes/linux-libc-headers/linux-libc-headers-2.6.31/scsi-use-__u8.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-This patch is from=20
-http://patchwork.kernel.org/patch/38102/
-It seems its still under discussion and it will involve glibc to get it
fixed correctly.
-for now OE uses scsi headers from kernel and not from glibc.
-
--Khem
-
-Index: linux-2.6.31/include/scsi/scsi.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- linux-2.6.31.orig/include/scsi/scsi.h	2010-03-11 19:44:49.134590561
-0800
-+++ linux-2.6.31/include/scsi/scsi.h	2010-03-11 19:45:12.744466326
-0800
-@@ -142,10 +142,10 @@ struct scsi_cmnd;
-=20
- /* defined in T10 SCSI Primary Commands-2 (SPC2) */
- struct scsi_varlen_cdb_hdr {
--	u8 opcode;        /* opcode always =3D=3D VARIABLE_LENGTH_CMD */
--	u8 control;
--	u8 misc[5];
--	u8 additional_cdb_length;         /* total cdb length - 8 */
-+	__u8 opcode;        /* opcode always =3D=3D VARIABLE_LENGTH_CMD */
-+	__u8 control;
-+	__u8 misc[5];
-+	__u8 additional_cdb_length;         /* total cdb length - 8 */
- 	__be16 service_action;
- 	/* service specific data follows */
- };
diff --git
a/recipes/linux-libc-headers/linux-libc-headers-2.6.32/scsi-use-__u8.patch =
b/recipes/linux-libc-headers/linux-libc-headers-2.6.32/scsi-use-__u8.patch
deleted file mode 100644
index b754879..0000000
---
a/recipes/linux-libc-headers/linux-libc-headers-2.6.32/scsi-use-__u8.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-This patch is from=20
-http://patchwork.kernel.org/patch/38102/
-It seems its still under discussion and it will involve glibc to get it
fixed correctly.
-for now OE uses scsi headers from kernel and not from glibc.
-
--Khem
-
-Index: linux-2.6.31/include/scsi/scsi.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- linux-2.6.31.orig/include/scsi/scsi.h	2010-03-11 19:44:49.134590561
-0800
-+++ linux-2.6.31/include/scsi/scsi.h	2010-03-11 19:45:12.744466326
-0800
-@@ -142,10 +142,10 @@ struct scsi_cmnd;
-=20
- /* defined in T10 SCSI Primary Commands-2 (SPC2) */
- struct scsi_varlen_cdb_hdr {
--	u8 opcode;        /* opcode always =3D=3D VARIABLE_LENGTH_CMD */
--	u8 control;
--	u8 misc[5];
--	u8 additional_cdb_length;         /* total cdb length - 8 */
-+	__u8 opcode;        /* opcode always =3D=3D VARIABLE_LENGTH_CMD */
-+	__u8 control;
-+	__u8 misc[5];
-+	__u8 additional_cdb_length;         /* total cdb length - 8 */
- 	__be16 service_action;
- 	/* service specific data follows */
- };
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
index 2e4041f..953b065 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
@@ -2,13 +2,12 @@ require linux-libc-headers.inc
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
 DEPENDS +=3D "unifdef-native"
-PR =3D "r3"
+PR =3D "r4"
=20
 DEFAULT_PREFERENCE =3D "-1"
=20
 SRC_URI =3D
"${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \

file://0001-implement-TIF_RESTORE_SIGMASK-support-and-enable-the.patch;patc=
h=3D1 \
-           file://scsi-use-__u8.patch;patch=3D1 \
 	  "
 S =3D "${WORKDIR}/linux-${PV}"
=20
@@ -44,6 +43,7 @@ do_compile () {
 do_install() {
 	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_prefix} ARCH=3D
$ARCH
+	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
 }
=20
 SRC_URI[md5sum] =3D "84c077a37684e4cbfa67b18154390d8a"
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
index d82a749..f1c371d 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
@@ -2,13 +2,12 @@ require linux-libc-headers.inc
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
 DEPENDS +=3D "unifdef-native"
-PR =3D "r3"
+PR =3D "r4"
=20
 DEFAULT_PREFERENCE =3D "-1"
=20
 SRC_URI =3D
"${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 	   file://export_sa_family_t.patch;patch=3D1 \
-           file://scsi-use-__u8.patch;patch=3D1 \
 	  "
 S =3D "${WORKDIR}/linux-${PV}"
=20
@@ -44,6 +43,7 @@ do_compile () {
 do_install() {
 	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_prefix} ARCH=3D
$ARCH
+	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
 }
=20
 SRC_URI[md5sum] =3D "260551284ac224c3a43c4adac7df4879"


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


