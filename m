Return-Path: <athoik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0FAD977E33
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 21:11:50 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p17so60004wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 14:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+yAsfImcbOSYKUN+dK1/LOrVg1wTkwq2pImQtQIcdAk=;
	b=XgYxPW2pCPHEU1WPmtMn297xnR/mRzpSQbIK6FMV1Ndef3hur2gjpXI7LOuzgWl1NU
	KSHulVNNLuz3xekrjfRkJzbdTyJyGPFzX8DHtgDuuCXXiNQF8rF8m+iNjN7FeLPCd8/v
	ZMCTqphzc2RgT483ADcBG/dq5UEmevx+Swws2AWb+4uux0MDtGlq1mE3xSoOBKpT/whG
	I1AE0OIbGsR3gRjfDulneSMuHqjdUg4Kwx002sBvW577v+Z/Hl/qBoQcrIsyV3p3om5M
	kujbsmrwsxQ8CyH9KQLMATPUrSc1oDUNu8PZlNlrraFpVs7hA44UOqwfZ4cAsuETq7V9
	Hn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+yAsfImcbOSYKUN+dK1/LOrVg1wTkwq2pImQtQIcdAk=;
	b=Him6jkCyj29Y4EDuZhSS4vhfKCWIaUsBffGWy5OReM5utl0qefZSEeHqXvtcnTFzQo
	G4iX4BM8UXM2WxuodqHPS6c757h5o44oDrzSSZwfa9lBIOUJ2nKnXc8UxONE7dQDlcHv
	VlCvm5E30AOMkEMsVDNfIAG/i2ElmIGqfuwelp9gRIBTjNyCV9RFkbqEAewPAHA/WkU1
	/6X36vbchgG6YlnfbuyH8Wi2rwARYPAY7QbOT04tg/K1dYKm2oF7zlz1/AYud96SBXG6
	rCVHNYy8D+B7UJz1BjJMWxw8AjRROipjNFcCemAqnY1Agv46u2pjIhEktDrSKqOm1HaD
	h1QA==
X-Gm-Message-State: AHPjjUhGmL1hkylbUmRlbfrx9Wj0kSAVv9QVVYqDvfjQu5yxf9r0zZgu
	adbHNiwSp6Ni0eIa
X-Google-Smtp-Source: ADKCNb47MgNjUWoj5/c0pG3XILRJMjWlAMRzYcjTSYcfdeMd3IsicTEVdqD03DVyTRmYJHbnS9neOg==
X-Received: by 10.28.159.6 with SMTP id i6mr745201wme.119.1504732311398;
	Wed, 06 Sep 2017 14:11:51 -0700 (PDT)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	g13sm1154104wrg.63.2017.09.06.14.11.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Sep 2017 14:11:50 -0700 (PDT)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Sep 2017 00:16:42 +0300
Message-Id: <1504732602-19896-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [meta-oe][PATCH] vsftpd: link with wrap when tcp-wrappers configured
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2017 21:11:51 -0000

By default we do not build vsftpd with tcp-wrappers, so we should not include lib wrap.
Make lib wrap optional depending on tcp-wrappers PACKAGECONFIG.

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
index e524614..7a20356 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
@@ -37,6 +37,7 @@ PACKAGECONFIG[tcp-wrappers] = ",,tcp-wrappers"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-listfile', '', d)}"
 PAMLIB = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '-L${STAGING_BASELIBDIR} -lpam', '', d)}"
+WRAPLIB = "${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', '-lwrap', '', d)}"
 NOPAM_SRC ="${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://nopam-with-tcp_wrappers.patch', 'file://nopam.patch', d)}"
 
 inherit update-rc.d useradd systemd
@@ -54,7 +55,7 @@ do_configure() {
 }
 
 do_compile() {
-   oe_runmake "LIBS=-L${STAGING_LIBDIR} -lcrypt -lcap ${PAMLIB} -lwrap"
+   oe_runmake "LIBS=-L${STAGING_LIBDIR} -lcrypt -lcap ${PAMLIB} ${WRAPLIB}"
 }
 
 do_install() {
-- 
2.1.4


