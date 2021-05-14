Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web10.3457.1620958563054106934
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 19:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nugGahbH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620958561; i=@fujitsu.com;
	bh=LFw5fYoWX4T1Zn/bIwm8pINjTPOgeEV5v1Hm5uNa8Y8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nugGahbHbWys1SnOrhpkTL+b2QayLaM+WbN+Yws2gvPhQEcA1dHpidNOrBO7tydbo
	 S5ukZ5KNuin3BiUDF98ettoBwtfCGua1/4TUnWwsS+Ns+T5PQOKzgg5Q5jdbzSudxq
	 dri5Uh76+4r1y4eeOP67nONO3cbiuZUxNXY1tOA3tT0LTZEAlbU9iP0cpYZz8VYHIo
	 cSLtRo4enymprlqFkxkqgH5OzBMDSMDKoJTuRGrPXGvgkdrx4EeFpffVkoylcLe1iQ
	 jQRoWr+LciS4mjC5ODPAk6hyAM8ugp2ErmTXTYAE3xYbNvVpP0LZDW2j+z2zqN7dSA
	 c2pYXYtoYXVPw==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 49/FD-38619-06DDD906; Fri, 14 May 2021 02:16:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MxRTfh7tw
  Eg2kPJS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owLs++yF+xhr3j8dDNzA+Mlti5GLg4hgdlM
  EvO2/2OFcHYzSmxfMpepi5GTg01AV+Lc47XsILaIgL7E0tl7mEFsYQF7iZ/Tb7GB2CwCqhJH9
  kxlAbF5BTwkjs9bABaXEFCQmPLwPTNEXFDi5MwnYDXMAhISB1+8AIpzANUoSsyeLg9RXiExY8
  Y2tgmMPLOQdMxC0rGAkWkVo2VSUWZ6RkluYmaOrqGBga6hobGuua6RqZFeYpVukl5qqW5yal5
  JUSJQVi+xvFivuDI3OSdFLy+1ZBMjMJBSCtn/7GC8/vqD3iFGSQ4mJVHek56zE4T4kvJTKjMS
  izPii0pzUosPMcpwcChJ8LrfmZsgJFiUmp5akZaZAwxqmLQEB4+SCK89SJq3uCAxtzgzHSJ1i
  jGc483aJYuYOd6CybZ7d4FkO5icueDgamaOWWDyfvshIPkARAqx5OXnpUqJ87aCjBMAGZdRmg
  e3DBa1lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80qBTOHJzCuBu+kV0LlMQOfemD4L5Ny
  SRISUVAPTgdxH0h6Ks7Qihc0fvrpQpFXx8P+hpOXfi+Sdv2a1h0j+vbWjqPXTut/ysSk5hRbB
  Gs8VWP22XFkc8pb7Z3/ERaVPIW8uPj7yzGDXpDntf/a/Px0gYfGGg6fYdY1h0fJJC67Jf9y6w
  uDD/iP3Wh1/eRWsvsr/6ZXOmbp/ywXqjbU/WghoHOUTdJz4wWny+9tPrnO9vXVcQvzfFTb29t
  76B8na20v/f3DoCFUxXrL5ebdv6oWMvLPNqQ4fQ14rXu/WvPaNt1fx49M5/OJaa6QurXpvIdJ
  Ysdbqz64Vyle9cnxVhCy2aZ4ULrkecHDT9smiQj8CN4XU3va6WlLafcv8ZfdrhYCP6vyfJqbW
  r+/sU2Ipzkg01GIuKk4EANdcPXVVAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-238.messagelabs.com!1620958559!45090!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14343 invoked from network); 14 May 2021 02:16:00 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-22.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 02:16:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E2FxtO011165
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 03:15:59 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 03:15:57 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libjcat: upgrade 0.1.6 -> 0.1.7
Date: Fri, 14 May 2021 10:15:47 +0800
Message-ID: <1620958547-16462-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libjcat/{libjcat_0.1.6.bb => libjcat_0.1.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.1.6.bb => libjcat_0.1.7.bb} (94%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.6.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.7.bb
similarity index 94%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.1.6.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.1.7.bb
index bbfba55a3d..b857cc5bd3 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.6.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     git://github.com/hughsie/libjcat.git \
     file://run-ptest \
 "
-SRCREV = "c4f032468c56a5750e1e15b01fa31539b5c7ae51"
+SRCREV = "e5307885528cf07058be073d0621624749cc10df"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome vala
-- 
2.25.1

