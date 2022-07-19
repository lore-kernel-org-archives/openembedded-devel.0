Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B844C3F2D4
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 06:13:47 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.37560.1658211217133098044
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 23:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FxoDB61/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658211215; i=@fujitsu.com;
	bh=1YRq19NJJgA9QM8ER28YjbS8XFgVKfqpn6bcxQrA/1Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FxoDB61/7oFwCNSz1f+jKhLsIaRdkDh6Dm37Py7ZiGN0PGGkTy0VpJQH6CZP64K4t
	 ESnA5qQo6jL/dKY9VsS1NW3NELt6d3sFruDwqg8aQ+o/AYrZ5E9wjEM84ZFBzWJjgS
	 FuQ4IJLsToYHTJdlSKVFKTf3t+B0EiN8TFdccKpWUzY5gbMfMG0lKy7Fp2k4iReqyF
	 EMqbFOFUTN6rPD07jbIJ3ojxwmuuSu30ZTCUWnnO4/MstIqAoERFO1nTTO1gNm/0U2
	 mcYzspy/BtHXwCTMV1lY/ms2+uq5jvmvuGTmQxZB/UE/I8ECyKGV1tf3Q5Gno63xw1
	 80NF6Oq2pr1Wg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpNvnfS3
  J4M8hc4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePO5GmMBVc5KibOnMXWwPiTvYuRi0NI4CGj
  xNs5RxghnCtMEhuXNLFCOHsYJR69m8bUxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAo8St6a9YQGwWAVWJzS/mMILYvEDxd1ePgc2REFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjKDH7cjMLhF0hMWPGNjYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRqukosz0jJLcxMwcXUM
  DA11DQ1NdYyNdQxO9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9vNSSTYzAsEwpVuDb
  wdi86qfeIUZJDiYlUd6pmteShPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwXvAEygkWpaanVqRl5
  gBjBCYtwcGjJMKb5gyU5i0uSMwtzkyHSJ1itOf4++nvXmaOqbP/7WfmWA4mZ35tO8AsxJKXn5
  cqJc5b6AXUJgDSllGaBzcUFtOXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzMoBM4cnMK4H
  b/QroLCagsyY5XQE5qyQRISXVwDQ5XDPDYLrssasZ21oFns5foqxd9tSgkuHoEpEpBclz+P/q
  PtI3K52oe1XHXbBj4Vuz1Zd77XTSEpoWxM7r8ayLPuip+mrulV3rrxS73nnGuEGLu+B24R6mj
  5Uffe4LdeUu8uJ7kvhu2qQLRT9sg3vzs6pmBxxI2H5CwHHW7ZnK1dtDGo+8FmtWcPDSnPEpNT
  KMm5cpNX/W4mC/R+EM/mEBjcdPXjwcqZuSns/9NqBv//KwQ62CF7nVj25kzkjy1i2Q5hQOZkp
  9/t7t8uM/O519ezLOCbyVUb9fv33O5gJJx8y67b8Df3rsniFx5/Y/rlMPZ4kFruNt3cQ+1a+z
  Rr5Ks2/+zKTn63K1PBPNlFiKMxINtZiLihMB60t552QDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1658211214!228819!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20513 invoked from network); 19 Jul 2022 06:13:34 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jul 2022 06:13:34 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9B1601AC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:13:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 9001B1A3
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:13:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Jul 2022 07:13:33 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gegl: upgrade 0.4.36 -> 0.4.38
Date: Tue, 19 Jul 2022 14:13:16 +0800
Message-ID: <1658211200-2891-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Jul 2022 06:13:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97886

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.36.bb => gegl_0.4.38.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.36.bb => gegl_0.4.38.bb} (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.38.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.38.bb
index 913957c3a9..5415658094 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.38.bb
@@ -22,7 +22,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "6fd58a0cdcc7702258adaeffb573a389228ae8f0eff47578efda2309b61b2ca6"
+SRC_URI[sha256sum] = "e4a33c8430a5042fba8439b595348e71870f0d95fbf885ff553f9020c1bed750"
 
 PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native = "libpng librsvg"
-- 
2.25.1


