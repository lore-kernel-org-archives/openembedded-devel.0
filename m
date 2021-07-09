Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web09.5354.1625794658654756416
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jul 2021 18:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DZ2mpro5;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625794656; i=@fujitsu.com;
	bh=7dws6bfBigZx1AhCgUIdHHpYLYuzZlWuzC9EG9Tiy2M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DZ2mpro5L2Ct5Ov3xeEkbe6TCXoOvLT6WsMIFIKtdx0O/Pr+npsX20BJVwJWT10CZ
	 wQH2Ke1kUuHYcVkSHFuyvd2MYAFemUxl7geGqcZNLXy071pX3giPBngDjDkR2MvSx1
	 v1jk2W/13iN10DtJnnbyhwo03JXo/3lzuG2hh22pQwpxj18wZAa9AA53a4JwNCouCM
	 rxc/mIpSqH2ZMD82zQMo5IcssTl3w76HBZiTwRpaPN0jlXA6qkxHG7dYrFmcKvPukf
	 9t1F6Z+AadUzWsnCog6xP3AON8Y60p/2sf6HIqR2SWJ5oo7BX/NtwoEdSKWv6pPels
	 dL9kxCl3bM0Ew==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 7E/A2-07211-F58A7E06; Fri, 09 Jul 2021 01:37:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxVTd+xfM
  Eg/4tshYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b/i81MBe/4K/ZttWpg/MnbxcjFISQwi0ni
  fss5dgjnOKPE3J3PmLoYOTnYBHQkOl50s4DYIgL6Ektn72EGsYUFvCS6D7WB2SwCKhJHFx5iB
  bF5BdwlNr2aCxaXEFCQmPLwPTNEXFDi5MwnYHOYBSQkDr54AVWjKLF95xkWCLtCYsaMbWwTGH
  lmIWmZhaRlASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0NjXUNdU0O9xCrdRL3UUt3k1LySokSgpF5
  iebFecWVuck6KXl5qySZGYBilFDIa72A8+PqD3iFGSQ4mJVFerRnPE4T4kvJTKjMSizPii0pz
  UosPMcpwcChJ8B5ZApQTLEpNT61Iy8wBhjRMWoKDR0mEl3MRUJq3uCAxtzgzHSJ1ilGXY/Pcp
  YuYhVjy8vNSpcR5g5cBFQmAFGWU5sGNgMXXJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvD
  rLgabwZOaVwG16BXQEE9ARDIefghxRkoiQkmpgEt964Fcwn5WB+e8/KpKiVVeOFWjr3VTePnP
  vqzoPhR/dzT9e3DATSyj7dOdV8EG3DIV/htwG/LU1dZZqij3d6eta55nk5/2YnL1ruo38lgK9
  d7//um6ee826+gzb62fenxWy216dqllvvZEjeknMMsY911fFRMqFBy54I8XccpG1lXmZ2o/Fi
  zfEpJi1C3OKLVx6dfLjNWFy/a0ZH4I7J385lBXxTuknn7PSlzU+9tFiW3b8Ovz/VV3FUvdH+z
  b89YlhiZtkJ2fsfk/UPW5KVaAXV0/E4leHs4JbEiecznB8MdHkAGdUENPi5QsrzGtNIvPbm3R
  11cTzN+UYC+S/Uv7W9KmGb6rem6p4xTolluKMREMt5qLiRADoz0V5KgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-228.messagelabs.com!1625794654!464960!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19143 invoked from network); 9 Jul 2021 01:37:35 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-2.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jul 2021 01:37:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1691bY1a023831
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jul 2021 02:37:34 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 9 Jul 2021 02:37:32 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] strongswan: upgrade 5.9.2 -> 5.9.3
Date: Fri, 9 Jul 2021 09:37:26 +0800
Message-ID: <1625794646-29581-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

- Added AES_ECB, SHA-3 and SHAKE-256 support to wolfssl plugin.

- Added AES_CCM and SHA-3 signature support to openssl plugin.

- The x509 and openssl plugins now consider the authorityKeyIdentifier, if
  available, before verifying signatures, which avoids unnecessary signature
  verifications after a CA key rollover if both certificates are loaded.

- The pkcs11 plugin better handles optional attributes like CKA_TRUSTED, which
  previously depended on a version check.

- charon-nm now supports using SANs as client identities, not only full DNs.

- charon-tkm now handles IKE encryption.

- A MOBIKE update is sent again if a a change in the NAT mappings is detected
  but the endpoints stay the same.

- Converted most of the test case scenarios to the vici interface

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../strongswan/{strongswan_5.9.2.bb => strongswan_5.9.3.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.2.bb => strongswan_5.9.3.bb} (97%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.2.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.3.bb
similarity index 97%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.2.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.3.bb
index c178b4cdac..8a704f6dc4 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.2.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.3.bb
@@ -12,8 +12,7 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            "
 
-SRC_URI[md5sum] = "8918e6675e1be3784817641f07eadeb8"
-SRC_URI[sha256sum] = "61c72f741edb2c1295a7b7ccce0317a104b3f9d39efd04c52cd05b01b55ab063"
+SRC_URI[sha256sum] = "9325ab56a0a4e97e379401e1d942ce3e0d8b6372291350ab2caae0755862c6f7"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1

