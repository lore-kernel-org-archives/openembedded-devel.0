Received: from [128.222.32.20] (helo=mexforward.lss.emc.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Lin_Lynn@emc.com>) id 1MIKeM-0005Tv-3J
	for openembedded-devel@openembedded.org; Sun, 21 Jun 2009 12:51:50 +0200
Received: from hop04-l1d11-si02.isus.emc.com (HOP04-L1D11-SI02.isus.emc.com
	[10.254.111.55])
	by mexforward.lss.emc.com (Switch-3.3.2/Switch-3.1.7) with ESMTP id
	n5LAevg6020239
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 21 Jun 2009 06:40:57 -0400
Received: from mailhub.lss.emc.com (nagas.lss.emc.com [10.254.144.15]) by
	hop04-l1d11-si02.isus.emc.com (Tablus Interceptor) for
	<openembedded-devel@openembedded.org>;
	Sun, 21 Jun 2009 06:40:55 -0400
Received: from corpussmtp2.corp.emc.com (corpussmtp2.corp.emc.com
	[128.221.14.146])
	by mailhub.lss.emc.com (Switch-3.3.2mp/Switch-3.3.2mp) with ESMTP id
	n5LAesqR025288 for <openembedded-devel@openembedded.org>;
	Sun, 21 Jun 2009 06:40:55 -0400
Received: from CORPUSMX100C.corp.emc.com ([128.222.76.57]) by
	corpussmtp2.corp.emc.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 21 Jun 2009 06:40:54 -0400
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Sun, 21 Jun 2009 06:32:32 -0400
Message-ID: <065E68EB87448440A3E75B4DBB5E871C26C83A@CORPUSMX100C.corp.emc.com>
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Thread-Topic: [PATCH] update IMAGE_ROOTFS variable to fix inconsistent
	IMAGE_ROOTFS variable content in apt-native package
Thread-Index: AcnyW5WfzkLOwmZgR1yyv8rJEM+GpA==
From: <Lin_Lynn@emc.com>
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 21 Jun 2009 10:40:54.0562 (UTC)
	FILETIME=[C0FF0020:01C9F25C]
X-EMM-EM: Active
Subject: [PATCH] update IMAGE_ROOTFS variable to fix inconsistent IMAGE_ROOTFS variable content in apt-native package
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
X-List-Received-Date: Sun, 21 Jun 2009 10:51:50 -0000
X-Groupsio-MsgNum: 11475
Content-class: urn:content-classes:message
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C9F25B.AE715464"

------_=_NextPart_001_01C9F25B.AE715464
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From 5f5d0a311692a114360b7bd3037534a5ec839f33 Mon Sep 17 00:00:00 2001
From: Lynn Lin <Lin_Lynn@emc.com>
Date: Sun, 21 Jun 2009 18:15:06 +0800
Subject: [PATCH] update IMAGE_ROOTFS variable to fix inconsistent =
IMAGE_ROOTFS variable content in apt-native package
http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?id=3D2343808f7=
386cbd4c7b43f1b24e65e173f5ddf15
This commit change IMAGE_ROOTFS from "${TMPDIR}/rootfs" to =
"${TMPDIR}/rootfs/${PN},so it cause
that it expand IMAGE_ROOTFS to ${TMPDIR}/rootfs/apt-native in =
apt.conf.sample,however rootfs_deb.class use
apt.conf.sample to generate apt-rootfs.conf ,here IMAGE_ROOTFS is =
different from that in apt-native package
---
 classes/rootfs_deb.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)
diff --git a/classes/rootfs_deb.bbclass b/classes/rootfs_deb.bbclass
index 8222066..dc2b2cb 100644
--- a/classes/rootfs_deb.bbclass
+++ b/classes/rootfs_deb.bbclass
@@ -44,6 +44,8 @@ fakeroot rootfs_deb_do_rootfs () {
=20
  cat "${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample" \
   | sed -e 's#Architecture ".*";#Architecture "${DPKG_ARCH}";#' \
+         | sed -e 's#status ".*";#status =
"${IMAGE_ROOTFS}/var/dpkg/status";#' \=20
+  | sed -e 's#DPkg::Options {".*"};#DPkg::Options =
{"--root=3D${IMAGE_ROOTFS}";"--admindir=3D${IMAGE_ROOTFS}/var/dpkg";"--fo=
rce-all";"--no-debsig"};#' \
   > "${STAGING_ETCDIR_NATIVE}/apt/apt-rootfs.conf"
=20
  export APT_CONFIG=3D"${STAGING_ETCDIR_NATIVE}/apt/apt-rootfs.conf"
--=20
1.6.0.4

------_=_NextPart_001_01C9F25B.AE715464
Content-Type: application/octet-stream;
	name="0001-update-IMAGE_ROOTFS-variable-to-fix-inconsistent-IMA.patch"
Content-Transfer-Encoding: base64
Content-Description: 0001-update-IMAGE_ROOTFS-variable-to-fix-inconsistent-IMA.patch
Content-Disposition: attachment;
	filename="0001-update-IMAGE_ROOTFS-variable-to-fix-inconsistent-IMA.patch"

RnJvbSA1ZjVkMGEzMTE2OTJhMTE0MzYwYjdiZDMwMzc1MzRhNWVjODM5ZjMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMeW5uIExpbiA8TGluX0x5bm5AZW1jLmNvbT4KRGF0ZTogU3Vu
LCAyMSBKdW4gMjAwOSAxODoxNTowNiArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIHVwZGF0ZSBJTUFH
RV9ST09URlMgdmFyaWFibGUgdG8gZml4IGluY29uc2lzdGVudCBJTUFHRV9ST09URlMgdmFyaWFi
bGUgY29udGVudCBpbiBhcHQtbmF0aXZlIHBhY2thZ2UKCmh0dHA6Ly9jZ2l0Lm9wZW5lbWJlZGRl
ZC5uZXQvY2dpdC5jZ2kvb3BlbmVtYmVkZGVkL2NvbW1pdC8/aWQ9MjM0MzgwOGY3Mzg2Y2JkNGM3
YjQzZjFiMjRlNjVlMTczZjVkZGYxNQpUaGlzIGNvbW1pdCBjaGFuZ2UgSU1BR0VfUk9PVEZTIGZy
b20gIiR7VE1QRElSfS9yb290ZnMiIHRvICIke1RNUERJUn0vcm9vdGZzLyR7UE59LHNvIGl0IGNh
dXNlCnRoYXQgaXQgZXhwYW5kIElNQUdFX1JPT1RGUyB0byAke1RNUERJUn0vcm9vdGZzL2FwdC1u
YXRpdmUgaW4gYXB0LmNvbmYuc2FtcGxlLGhvd2V2ZXIgcm9vdGZzX2RlYi5jbGFzcyB1c2UKYXB0
LmNvbmYuc2FtcGxlIHRvIGdlbmVyYXRlIGFwdC1yb290ZnMuY29uZiAsaGVyZSBJTUFHRV9ST09U
RlMgaXMgZGlmZmVyZW50IGZyb20gdGhhdCBpbiBhcHQtbmF0aXZlIHBhY2thZ2UKLS0tCiBjbGFz
c2VzL3Jvb3Rmc19kZWIuYmJjbGFzcyB8ICAgIDIgKysKIDEgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NsYXNzZXMvcm9vdGZzX2Rl
Yi5iYmNsYXNzIGIvY2xhc3Nlcy9yb290ZnNfZGViLmJiY2xhc3MKaW5kZXggODIyMjA2Ni4uZGMy
YjJjYiAxMDA2NDQKLS0tIGEvY2xhc3Nlcy9yb290ZnNfZGViLmJiY2xhc3MKKysrIGIvY2xhc3Nl
cy9yb290ZnNfZGViLmJiY2xhc3MKQEAgLTQ0LDYgKzQ0LDggQEAgZmFrZXJvb3Qgcm9vdGZzX2Rl
Yl9kb19yb290ZnMgKCkgewogCiAJY2F0ICIke1NUQUdJTkdfRVRDRElSX05BVElWRX0vYXB0L2Fw
dC5jb25mLnNhbXBsZSIgXAogCQl8IHNlZCAtZSAncyNBcmNoaXRlY3R1cmUgIi4qIjsjQXJjaGl0
ZWN0dXJlICIke0RQS0dfQVJDSH0iOyMnIFwKKwkgICAgICAgIHwgc2VkIC1lICdzI3N0YXR1cyAi
LioiOyNzdGF0dXMgIiR7SU1BR0VfUk9PVEZTfS92YXIvZHBrZy9zdGF0dXMiOyMnIFwgCisJCXwg
c2VkIC1lICdzI0RQa2c6Ok9wdGlvbnMgeyIuKiJ9OyNEUGtnOjpPcHRpb25zIHsiLS1yb290PSR7
SU1BR0VfUk9PVEZTfSI7Ii0tYWRtaW5kaXI9JHtJTUFHRV9ST09URlN9L3Zhci9kcGtnIjsiLS1m
b3JjZS1hbGwiOyItLW5vLWRlYnNpZyJ9OyMnIFwKIAkJPiAiJHtTVEFHSU5HX0VUQ0RJUl9OQVRJ
VkV9L2FwdC9hcHQtcm9vdGZzLmNvbmYiCiAKIAlleHBvcnQgQVBUX0NPTkZJRz0iJHtTVEFHSU5H
X0VUQ0RJUl9OQVRJVkV9L2FwdC9hcHQtcm9vdGZzLmNvbmYiCi0tIAoxLjYuMC40Cgo=

------_=_NextPart_001_01C9F25B.AE715464--
