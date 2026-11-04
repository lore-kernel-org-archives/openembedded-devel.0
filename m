Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8755.1793798257651704797
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 05:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ckO+WsdB;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 12C5EC8F46F
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Nov 2026 13:18:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1916D60770
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Nov 2026 13:17:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32D03103283F6;
	Wed,  4 Nov 2026 14:17:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793798250; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=QaEfPUlPw4tuF8a6gAw3PK8SVO2dBUTcRbpyZhp0VCg=;
	b=ckO+WsdBy+7K27IN6VzbFW+Qrza5O50J16qoo54uMrn1KrRs0hCDzp9ovx9uxDHMUQ4gko
	B7xnc9rOTyGUQZmeyS1Mtq5teUfTQfWx6MNUdQjJf955K1H+pKlKnMYvdaCP3BxeNITv8w
	0gWmi9ds5bmBev7zgygpOXdXVkzYsM3nbO0vHDkLqdqwOr5fSW8+49n6EUnL9u2m+1/P04
	ucTXV5E9jv8dduKAejiEG8uWr5RfEjLsXBJTnrWTbOOVKfnuj4xUwy0tlGZcVVO8XDmQz2
	zsXpTa9UbNqk3S8OAp0eqoMhSFUCxoinvOuMExyE7tPrXKiuqcG+UkImiUpMRw==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [meta-networking][scarthgap][PATCH] ntpsec: fix CVE-2026-121506
Date: Wed,  4 Nov 2026 14:17:17 +0100
Message-ID: <20261104131717.1347063-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 13:25:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131844

This vulnerability, marked as High [1], was fixed upstream [2] since
v1.2.5 (tag NTPsec_1_2_5).

Backport the fix to ntpsec v1.2.2a.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-121506
[2] https://security-tracker.debian.org/tracker/CVE-2026-121506

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../ntpsec/ntpsec/CVE-2026-121506.patch       | 52 +++++++++++++++++++
 .../recipes-support/ntpsec/ntpsec_1.2.2a.bb   |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntpsec/ntpsec/CVE-202=
6-121506.patch

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec/CVE-2026-12150=
6.patch b/meta-networking/recipes-support/ntpsec/ntpsec/CVE-2026-121506.p=
atch
new file mode 100644
index 0000000000..cee46825de
--- /dev/null
+++ b/meta-networking/recipes-support/ntpsec/ntpsec/CVE-2026-121506.patch
@@ -0,0 +1,52 @@
+From dfd436ee883e9df7c170b5d8e62f534a09f54be2 Mon Sep 17 00:00:00 2001
+From: Hal Murray <halmurray@sonic.net>
+Date: Thu, 1 May 2025 22:32:56 -0700
+Subject: [PATCH] Add length checks to fix fuzzer 393742176
+
+Also fix nonce length checking.
+
+CVE: CVE-2026-121506
+
+Upstream-Status: Backport [https://gitlab.com/NTPsec/ntpsec/-/commit/0a3=
6941e499d533dfbc3fb6b1fcd8c367679d719]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ ntpd/nts_extens.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/ntpd/nts_extens.c b/ntpd/nts_extens.c
+index 553b61b25..5442dbf1a 100644
+--- a/ntpd/nts_extens.c
++++ b/ntpd/nts_extens.c
+@@ -405,14 +405,18 @@ bool extens_client_recv(struct peer *peer, uint8_t=
 *pkt, int lng) {
+ 			break;
+ 		    case NTS_AEEF:
+ 			adlength =3D buf.next-NTP_EX_HDR_LNG-pkt;  /* backup over header */
++			if (NTP_EX_U16_LNG*2 > length)
++				return false;        /* garbage packet */
+ 			noncelen =3D next_uint16(&buf);
+ 			outlen =3D next_uint16(&buf);
+ 			if (noncelen&3 || outlen&3)
+-				return false;                 /* else round up */
++				return false;        /* else round up */
+ 			nonce =3D buf.next;
+ 			ciphertext =3D nonce+noncelen;
+ 			plaintext =3D ciphertext+CMAC_LENGTH;
+-			outlen =3D buf.left-NONCE_LENGTH-CMAC_LENGTH;
++			if (noncelen+CMAC_LENGTH > length)
++				return false;        /* garbage packet */
++			outlen =3D buf.left-noncelen-CMAC_LENGTH;
+ 			//      printf("ECRa: %lu, %d\n", (long unsigned)outlen, noncelen);
+ 			ok =3D AES_SIV_Decrypt(wire_ctx,
+ 					     plaintext, &outlen,
+@@ -424,8 +428,8 @@ bool extens_client_recv(struct peer *peer, uint8_t *=
pkt, int lng) {
+ 			if (!ok)
+ 				return false;
+ 			/* setup to process encrypted headers */
+-			buf.next +=3D NONCE_LENGTH+CMAC_LENGTH;
+-			buf.left -=3D NONCE_LENGTH+CMAC_LENGTH;
++			buf.next +=3D noncelen+CMAC_LENGTH;
++			buf.left -=3D noncelen+CMAC_LENGTH;
+ 			sawAEEF =3D true;
+ 			break;
+ 		    default:
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb b/me=
ta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
index 4b6125b4c5..4e039a9fd2 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
@@ -15,6 +15,7 @@ DEPENDS +=3D "bison-native \
 SRC_URI =3D "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
            file://volatiles.ntpsec \
            file://0001-wscript-Add-BISONFLAGS-support.patch \
+           file://CVE-2026-121506.patch \
            "
=20
 SRC_URI[sha256sum] =3D "e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2aea1=
18a62f0a3226950e"
--=20
2.55.0

