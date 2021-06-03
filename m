Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web12.5773.1622714293388895016
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 02:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=a4OzK8Aw;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622714290; i=@fujitsu.com;
	bh=U9g2JHQuv4fcNId03QU2Znc/vltAzDoW3sZREXjDhQw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=a4OzK8AwJBWCHKkeLCOX+gOz1pRBALxEoSXEZil0msfsOMzirsTXE4MYluvy97kQ5
	 Y7B4StceXZBSq/eVWBz39oOdDvGr7GziwqQcewySpMY7hH+8E44UoXs+H8c/gkhy71
	 c5/cQ8/aqskxXlU0aPLTdyMVdPrQ4d+AqRGFHz8As4XwbPwuDiYzXJJCfaVP5U+AGO
	 nX0/orx/hH/cIl15jJ8m+Q/BpKuql1Zd6UaBDbBLPgqI7rVc0BCq+jy/FcH36k5O3p
	 zhrRg1skguANm1f7iFItqjxdcByJxVN+W3nOlQ2gFXkHDn6RxUehKfh3qP/DC/E+Vr
	 C4Ux81UtocV0Q==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 63/7C-19780-2B7A8B06; Thu, 03 Jun 2021 09:58:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRqrtp+Y4
  Eg/PzeSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozO2bvZCk5zVbz/N5mpgfEMZxcjF4eQwCwm
  iaurfjBCOLsZJRqWnGTpYuTkYBPQlTj3eC07iC0ioC+xdPYeZhBbWMBb4l//MrA4i4CKxKrTD
  WwgNq+Au8Sbxp9MILaEgILElIfvmSHighInZz4Bm8ksICFx8MULoDgHUI2ixOzp8hDlFRIzZm
  xjm8DIMwtJxywkHQsYmVYxWiQVZaZnlOQmZuboGhoY6BoaGusa6Zoa6iVW6SbqpZbqJqfmlRQ
  lAiX1EsuL9Yorc5NzUvTyUks2MQLDKKWQyXgH47XXH/QOMUpyMCmJ8t5p35EgxJeUn1KZkVic
  EV9UmpNafIhRhoNDSYLXchlQTrAoNT21Ii0zBxjSMGkJDh4lEd4pi4HSvMUFibnFmekQqVOMu
  hyrDkxfxSzEkpeflyolzlsFMkMApCijNA9uBCy+LjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYF
  QS5vUCmcKTmVcCt+kV0BFMQEcIeG0DOaIkESEl1cCUtXn9Eq/Vv10Uzc3+TZ4tpp/ekf3pbIn
  e2cLjS1ckGD00UOCsfmAR9GvShnTb4/UJEpO+2/SFZu64G81axFRnOTMuQ/Lk0aT/8n90Dorc
  aFjVE3ZSVsWWR7pMaD7Ll3dTlL8zXv8tf+RCdu2Ukif3b/zasl9zyoTuHWosf0+7a6qaHGrPU
  7rG/HTeXblFZb2X3z3j0DSZ9F7b+p/whP35fsf7DG8mVWYFb5r6jC96S8QXmWhLPsmmQEO/tm
  2bsnLbzt2czS5wd3Xp/ntBtVfmBNUtchZl2HuPoXtNp/huvY9nLIK5XYOLhDrT5zyZ8+yYkl+
  XgsLfW+qy96bLXFes/sJotfBk6sNgP667//qUWIozEg21mIuKEwGezKApKgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-232.messagelabs.com!1622714289!23319!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26455 invoked from network); 3 Jun 2021 09:58:10 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-3.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2021 09:58:10 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1539w8TV015904
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Jun 2021 10:58:08 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 10:58:06 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] opensaf: upgrade 5.21.03 -> 5.21.06
Date: Fri, 4 Jun 2021 02:57:57 +0800
Message-ID: <1622746677-4323-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../opensaf/{opensaf_5.21.03.bb => opensaf_5.21.06.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.21.03.bb => opensaf_5.21.06.bb} (96%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.21.03.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.21.06.bb
similarity index 96%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.21.03.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.21.06.bb
index 118c5fea30..a971677203 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.21.03.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.21.06.bb
@@ -29,8 +29,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Fix-build-with-fno-common.patch \
            file://0001-Use-correct-printf-format-for-__fsblkcnt_t.patch \
            "
-SRC_URI[md5sum] = "0433650ba9c25f2cf36145e11bf96a2a"
-SRC_URI[sha256sum] = "ed40386852e34bbec0ca7e9534ce315b93a17b587614c8118aea1ecd082e1723"
+SRC_URI[md5sum] = "a60775787ba520a0b1031fcd42e0d65b"
+SRC_URI[sha256sum] = "d29d124506e4b084285d27c8742c7bca66de80be6a0ba9de8e37835ccaa8ee57"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/opensaf/files/releases"
 
-- 
2.25.1

