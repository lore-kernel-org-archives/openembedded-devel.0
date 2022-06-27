Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932D8C43334
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 06:59:46 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.39408.1656313177517494175
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jun 2022 23:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AlhrOyC7;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656313175; i=@fujitsu.com;
	bh=WhgATnNZVR24URjk986283C5hQSAxmUbh5lQgoVSvdA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AlhrOyC7dRpEAfLe3whBu3H3MqZoCUMCkV5D8h76M+2Sawoext9rM4dOsvFFgKFCp
	 k+OncKYpL3+l3TXglkO+d8LHxVvZJTsNyrc6Pzkx/wefOMGT161AX7Fxyg/0A883cZ
	 8DFs002ew/Q5DIhi5Noe8IW7L10Epql4XMMxsvgM9A8TJbCnL6q0TQDUX4VCERvB3O
	 njuzm+OsZJVAMk6mCaAmzwGcg+6+YMPod5f2E9gGhUkiV1o2r6anySDRClg8rtdI3/
	 lLJ11dWryv29CeS6W6eD/Wo2xjf1qRuaFH4DH1VMF/l1KcRXhBrvk4wGIRfZ/yk9wU
	 RWlNkrscA0Ubg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSTc8dGe
  SwaK1whYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bffY2sBU85K6Z3zWRpYGzn7GLk4hASeMIo
  8XfKDlYI5zqTxNG2Y8wQzh5GiWUXjzF2MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgI/H15hKwehYBVYkXF+ezgNi8Ak4Sb6/vA6uXEFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  gBVaMoMftyMwuEXSExY8Y2NghbTeLquU3MExj5ZyFpn4WkfQEj0ypGq6SizPSMktzEzBxdQwM
  DXUNDU11jXUNLS73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMCwTClmPr6D
  cUrfT71DjJIcTEqivKfUdiYJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuC1CgHKCRalpqdWpGXmA
  GMEJi3BwaMkwtvmDZTmLS5IzC3OTIdInWJUlBLn3R0ElBAASWSU5sG1weLyEqOslDAvIwMDgx
  BPQWpRbmYJqvwrRnEORiVhXjaQ7TyZeSVw018BLWYCWuw3cQfI4pJEhJRUA5OmwpNtkp1+xWH
  rWIVVlZSmNUzz55ogNu9aFs8mj92G9hp2E505BMIcuUMSbjPpPFRve6rydPOdKN7JT1ncI+Zv
  3ua5W1846Iv/hM/txpV1Vp0rPp7rPOvCrODEvmvZznPTl7h4zL5s/9HFtOziu/Jtcwz+B8/b1
  DybpVnEsXuenXujUFyQc2Hn8kNzp+2aLMow4dR+s7r3sz+Gzn+iPCXjuJD2hnvW3isbc1df/7
  HicYH/+R0bvrWGfHE/8vtWO+u6c9qs09kOFh13+3DSfm/UtNqrc319XudPnHKcpfdNHnPDfql
  tF9QD7nRHVlrfD5D/u7iLd1OqTLXNIfPrrxr/hulIyeVIFr24+97ifZgSS3FGoqEWc1FxIgCW
  OjzpRgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-591.messagelabs.com!1656313175!239527!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12386 invoked from network); 27 Jun 2022 06:59:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jun 2022 06:59:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D7D581000CC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:59:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D33B71000C0
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:59:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 27 Jun 2022 07:59:33 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-commander: upgrade 1.14.2 -> 1.14.3
Date: Mon, 27 Jun 2022 14:59:16 +0800
Message-ID: <1656313160-23805-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jun 2022 06:59:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97590

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-commander_1.14.2.bb => gnome-commander_1.14.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-commander/{gnome-commander_1.14.2.bb => gnome-commander_1.14.3.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.2.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.3.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.2.bb
rename to meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.3.bb
index c67242299..b16400cf3 100644
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.3.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
 inherit gnomebase itstool gettext gnome-help features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "1378efd24f8af18a09031d83d918f9662a3f5eba5a6f9df9fc55870f2e6f0ee9"
+SRC_URI[archive.sha256sum] = "78d8dce70fb922b2909cf767783053b0811213a4d6a49b3875510cf3a84efd7b"
 
 PACKAGECONFIG ??= "exiv2 taglib libgsf poppler"
 PACKAGECONFIG[exiv2] = "--with-exiv2,--without-exiv2,exiv2"
-- 
2.25.1


