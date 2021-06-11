Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web11.3788.1623382539876919943
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=O4ESPMzH;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623382538; i=@fujitsu.com;
	bh=8cq4ILvKDnLcN3atyoY8cfX0aSA9pDMR9yA7PneyxRM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=O4ESPMzHFam6UODLGq251efZsEHrkRGopXohG3GIJc/kL0VpFxUHA4aN6K+gQq6MP
	 oSZzaT0krR48r5NHJAuhiHyoii7/cRCVc1ZdPhov/L7iFSGbB5/tmfdpoUlC1cQTVA
	 HZc6grGBFrCaEAeVVcWYrg4Grz96Ts3psm1gXX6RQUsCAUJNEIEacKjYY+kqvWSKjE
	 B58hzJ/V+h8fq/1X0szlbWJyrl5fcUMPPdXQjWzsgx9qQ/dGpGJuEnI9/lW3+EftyD
	 2+opnoH1UM+xh0PgFWE2zuyPLp9dQSB9nKwPmVQRQoi1SyDGXvT08O4lN7HZ7ABas1
	 /FR7/OMxHbJ8Q==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id E9/C5-64908-90AD2C06; Fri, 11 Jun 2021 03:35:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1eW8dSj
  B4Px1CYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPDnbuMBYc4K9YdncnewPiCo4uRi0NIYDaT
  xJJpM5khnBOMEnOWnWTrYuTkYBPQkeh40c0CYosI6Essnb2HGcQWFnCSOPbxDCuIzSKgKjH1S
  jeYzSvgLtG69iWYLSGgIDHl4XtmiLigxMmZT8DmMAtISBx88YIZokZRYvvOMywQdoXEjBnb2C
  Yw8sxC0jILScsCRqZVjBZJRZnpGSW5iZk5uoYGBrqGhka6hpYWuobGBnqJVbpJeqmluuWpxSW
  6hnqJ5cV6xZW5yTkpenmpJZsYgYGUUnCsaQfjydcf9A4xSnIwKYny5hw8lCDEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgvfeDaCcYFFqempFWmYOMKhh0hIcPEoivKcuAqV5iwsSc4sz0yFSpxgVp
  cR574P0CYAkMkrz4NpgkXSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvBZApPJl5JXDTXw
  EtZgJazKwBtrgkESEl1cBUcuLXiUA2Nf1fDsXSah7bzvfKME0w2LRtps2HA0GfDjzlvLVg/vf
  Y4nadH7dfSD134Q45f7Rx3vJjbzcZp7Ywfzr5dv7KW0zqb8+e4KgM1D0m8yrM4NKTF0aGVXPD
  vsx7afS/52VEjXt6rF/nKp0j0uIv1h08/uD7GRENkU2h3q4CC+ULdNbLRj8L2/vq2IoJ+8pf+
  qcHKRrsnrjdhSd5hXBH/Wfv8/ltoVFr+ALUOlPy/U2qt7G+sr2edz7v4JE3Zj4+Umua756Vy1
  gXUn/w5Eyz9zZPWt2iNSqvLLzqVM6U8mLVsiDBdTs8ul7K6W7VFb4dtvm55LxtgsbtM9dmL+n
  gqLi+6sDMI3Y6F3I6lViKMxINtZiLihMBcMKAyB8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-291.messagelabs.com!1623382537!39523!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12671 invoked from network); 11 Jun 2021 03:35:37 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-9.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jun 2021 03:35:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15B3ZXUp004292
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 04:35:37 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 11 Jun 2021 04:35:32 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] cryptsetup: upgrade 2.3.5 -> 2.3.6
Date: Fri, 11 Jun 2021 11:35:24 +0800
Message-ID: <1623382524-47075-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.3.5.bb => cryptsetup_2.3.6.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.5.bb => cryptsetup_2.3.6.bb} (96%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
similarity index 96%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
index 0da9a26e83..562ac83fb1 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
@@ -21,8 +21,8 @@ RDEPENDS_${PN} = " \
 "
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[md5sum] = "408620e0df577ec04108ec0bc2b91dee"
-SRC_URI[sha256sum] = "ced9946f444d132536daf92fc8aca4277638a3c2d96e20540b2bae4d36fd70c1"
+SRC_URI[md5sum] = "504d1ab22cbc4d1a59a8d8c7ee5ed3bf"
+SRC_URI[sha256sum] = "b296b7a21ea576c2b180611ccb19d06aec8dddaedf7c704b0c6a81210c25635f"
 
 inherit autotools gettext pkgconfig
 
-- 
2.25.1

