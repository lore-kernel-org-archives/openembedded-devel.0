Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F08ECAAD3
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 05:08:09 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.6745.1663218488132713681
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 22:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HBW/gZ3P;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663218486; i=@fujitsu.com;
	bh=Vii33zAXQhnUA+aZYvu/IeJIZuB/jg0EZqf5VdmE6Bs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=HBW/gZ3PPAqCZ9TKIqdCiF4cmFLcGGHf8Ne5+c0NESu3vngY+HpJoJbP0Yp9WQgG7
	 y5SW7PyozuCSvf9bEW3i0EHZ2MlZsGzJ1xy+4XyU3F0WrJsAeBHFg9aTvbpKi/rVZ6
	 2SImT1X4hIKx+eOZ1YBVeNzbGuXABdNdpbQsAEgsqo0ZIEclBu5yJiqlspV5AJkFtw
	 mFeFp0OUd38TNpGfNfd5js3OLOd4Ad2iAedn9H9YbCm453qP/83/YV0vsmDwUP2+bm
	 m7RsgucJx0+mkvsrnnRV827UR4NlEWrE+7GGphYT4GnL6MYpsWPDd9+eboN1aff2dY
	 oSaerCzIokIqQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxSdd0s1K
  yQcdrKYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP9/+tsBSvYKu6fX8fcwHiOtYuRi0NI4Amj
  RNf8X+xdjJxAznUmidd/QiASexklDh/fxgqSYBPQkNg99TIziC0ioC+xdPYeMJtZQE3i6MufY
  LawgInE9p/9YINYBFQlrh/oA4vzCrhI3FzxlwnElhBQkJjy8D1UXFDi5MwnLBBzJCQOvnjBDF
  GjJPH20h5GCLtConH6IaheNYmr5zYxT2Dkn4WkfRaS9gWMTKsYbZKKMtMzSnITM3N0DQ0MdA0
  NTXUtLYGUpV5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgYKYUJ5fvYNy+
  75feIUZJDiYlUV4mOaVkIb6k/JTKjMTijPii0pzU4kOMMhwcShK86xYB5QSLUtNTK9Iyc4BRA
  pOW4OBREuGdsgIozVtckJhbnJkOkTrFqCglzrt5PVBCACSRUZoH1waLzEuMslLCvIwMDAxCPA
  WpRbmZJajyrxjFORiVhHkvbwCawpOZVwI3/RXQYiagxUbW8iCLSxIRUlINTFvvhsQcO7nu+4x
  d/VGPS6p31Ysc4Szxkt9sWvIzQvfP7V38PULlPu5rmeubGg5cdeqzzk+b0TNj18nV92PTdK8r
  qMWIfdL8cXDzdoMXdfmHdzlovT2odEmga0XEgsp+UZ/1IszS31+f6SjIKGg0qCn++uvCKemlX
  H1LeQqXBatWNuns+DG1xlDnmnGv+bPtp6PM64y3rZ2lxNfkb3DgpJz3BfdbnL4MlQ8+chZdao
  nrOLKzhqlDsl8oPkQxTE7c9a2xRdRjhtM/nINXdPkzPWW7NiGrblfZEaHVbMmPRXQc125aa1j
  3TkbU9eO50jzba88Zjx4MmsDIXvft2vbyFM4bHx2/fwqbumG2jWqZEktxRqKhFnNRcSIAg3VI
  +UcDAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-13.tower-728.messagelabs.com!1663218485!106266!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30823 invoked from network); 15 Sep 2022 05:08:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Sep 2022 05:08:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D0BAB1000CD
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 06:08:04 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C43C51000C2
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 06:08:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 15 Sep 2022 06:08:03 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [PATCH] exiv2: Fix buildpaths warning.
Date: Thu, 15 Sep 2022 13:07:52 +0800
Message-ID: <1663218472-5849-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Sep 2022 05:08:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98813

Remove the build path from file exiv2Config.cmake.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 31afe78e45..1380638ba7 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -21,3 +21,10 @@ SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.pat
 S = "${WORKDIR}/${BPN}-${PV}-Source"
 
 inherit cmake gettext
+
+do_install:append:class-target() {
+    # reproducibility: remove build host path
+    sed -i ${D}${libdir}/cmake/exiv2/exiv2Config.cmake \
+        -e 's:${STAGING_DIR_HOST}::g'
+}
+
-- 
2.25.1


