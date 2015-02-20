Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id C360073335
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 15:30:25 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id l18so13781638wgh.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sMd+oIMdNvM2EvjQIaILnYRH10NKfhIhClZkxJ5iVPo=;
	b=Po5sKoaVh5m1b6/iLmjPfyTe58FvoeC9jPRfpWRcSnuNBvJaLBRcZPLkuL9GeyzM32
	UYQzJtvNtQYOHA9SJOfV959+5S+N1s2zEBUuP61fyjNYQ5ehN647vZZt0u2+2259e+G7
	XopGF9Tqp+BwDlAyNVGgXgeRK5/EKk6ZBUg4mgTdnCyezOW9oN/uXhuDQFzqPf9lLPk9
	PjTDngCHl3j3D23XiK5B7GRd/4JhPR7YaXUDykrnXoGVcfSTCtAsQal18PFUPRs6g6Ws
	K/UxhvAYQQ7lbesy2iOjKUgoH3Oi9VB6w3YAd0+0/5UBfYJ2ifI/s+8CfW/dPwCccAMx
	Zpqw==
X-Received: by 10.194.48.74 with SMTP id j10mr20611256wjn.38.1424446227080;
	Fri, 20 Feb 2015 07:30:27 -0800 (PST)
Received: from localhost.localdomain (ip-84-119-96-251.unity-media.net.
	[84.119.96.251]) by mx.google.com with ESMTPSA id
	lg18sm2808307wic.23.2015.02.20.07.30.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Feb 2015 07:30:26 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Feb 2015 16:29:13 +0100
Message-Id: <1424446153-36118-1-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][PATCH v3] stunnel: Update to version 5.10
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
X-List-Received-Date: Fri, 20 Feb 2015 15:30:31 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/meta-networking/recipes-support/stunnel/stunnel_5.10.bb
index 74f2234..5753198 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.10.bb
@@ -2,16 +2,19 @@ SUMMARY = "Program for providing universal TLS/SSL tunneling service"
 DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
 SECTION = "net"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f41ebed8571077706fee0b860c4d6666"
+LIC_FILES_CHKSUM = "file://COPYING;md5=866cdc7459d91e092b174388fab8d283"
 DEPENDS = "openssl zlib tcp-wrappers"
 
 RDEPENDS_${PN} += "perl"
 
-SRC_URI = "https://www.stunnel.org/downloads/archive/4.x/${BP}.tar.gz"
+SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "ac4c4a30bd7a55b6687cbd62d864054c"
-SRC_URI[sha256sum] = "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec8d2778a01c871293"
+SRC_URI[md5sum] = "a0edda805eb7d6ea600a230fb0979ea1"
+SRC_URI[sha256sum] = "032bfc1854f8a0b9e452343c36ec6b52c7e0daef0863423c6b13a61a7c92eb23"
 
 inherit autotools
 
 EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
-- 
1.9.3


