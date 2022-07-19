Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39965CCA481
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 06:13:47 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.37686.1658211222511287760
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 23:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OZlm8EKQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658211220; i=@fujitsu.com;
	bh=kqjF3XTHLeHvD+bVvng8FHdLrQ21G29tWzqGKfYtv8g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OZlm8EKQ64RZBJzdHVKxK918QDz9OpmXw2/8dA8AmcmSqZlmbWtWtKc8VrYu7/IgV
	 WiAc3mfMWwhOl6CkcVkP0qzAznpeOhXxtcxsPzA6oKBrYawZPLfTL3fYMRd4ojloCC
	 hA3vbS9ISemZA9X18XAwDfRorlIImUa3okUp+QXoQmNdoKpg1hh1dYPg0DqPIr5gKg
	 5+ACoDGHi7dcP1+jgbHJr5+GknW+yEmzpu126qbE2M1EQFKKTKOUM5w2+JWl4NV0jd
	 TuhryZqy+iyEoJusZG51ddmfxGMqR6pdCR80fZYEzeDBYGvAUc6pkzQ6EJhYoWNijm
	 mvy6FEcU5HQdg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqDvF+1q
  SwYH3XBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bTX18YCzZwVWze18zSwLiKs4uRi0NI4Amj
  xP7ehywQznUmiYerDzNDOHsYJT4dXwqU4eRgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBVYvn0CWwgNouAqsTkkw1g9bwCjhJNMzrAbAkBBYkpD9+D9XIKOEm0T/vOCGILAdU8eH
  WPGaJeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSExY8Y2NghbTeLquU3MExgFZyFpn4WkfQE
  j0ypGq6SizPSMktzEzBxdQwMDXUNDU10zXUMzS73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK
  3OScFL281JJNjMAwTilmW7mDcWXfT71DjJIcTEqivFM1ryUJ8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuC94AmUEyxKTU+tSMvMAcYUTFqCg0dJhDfNGSjNW1yQmFucmQ6ROsWoyzHza9sBZiGWvP
  y8VClx3kIvoCIBkKKM0jy4EbD4vsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmJcBZApPZl4
  J3KZXQEcwAR0xyekKyBEliQgpqQamli+7fQLTjyc3XW0+rJttzlJyR2vig5Rzz689z3y5YkXo
  yj6t17yuOuZZL1jZa/aueib7/tGGT7OcrANUrj5IW7gySvXHD9+UCzke/dd+vi9MbumSfyu+d
  g5jlPM53Zabj67+Dt93TZvz+B6O6XwlTt5X3DYbz1/J/9FFfCLz3H3XTt+/dmnRyaxtKfoO24
  p6mw1XX7+TqL3391eJCXWzXYJ65+uZimj8UQ25yq7p0coZsNT91H7OwLmfFZ8nT0oJ2CBparb
  20fFpX590TOxcdb3jDddi9oYL28QEtF76PuB7abCGde2yF2JxJfNOBDXOrp5x/3D0/lWCPF/3
  8B5tin+iza461URm92/TC5qxt5RYijMSDbWYi4oTAaKfgVNqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1658211219!308242!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11681 invoked from network); 19 Jul 2022 06:13:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jul 2022 06:13:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C7C3C100195
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:13:39 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BB9EC100191
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:13:39 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Jul 2022 07:13:38 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libadwaita: upgrade 1.1.2 -> 1.1.3
Date: Tue, 19 Jul 2022 14:13:18 +0800
Message-ID: <1658211200-2891-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658211200-2891-1-git-send-email-wangmy@fujitsu.com>
References: <1658211200-2891-1-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97888

Changelog:
===========
- AdwLeaflet
  - Fix a broken link in docs
- AdwPreferencesGroup
  - Fix accessibility labels
- AdwToast
  - Fix the example in docs
- Stylesheet
  - Add missing borders in high contrast version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.1.2.bb => libadwaita_1.1.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.1.2.bb => libadwaita_1.1.3.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.2.bb b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.3.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.2.bb
rename to meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.3.bb
index 3ae740ee2b..eaec983ade 100644
--- a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.2.bb
+++ b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.3.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala features_check
 
-SRC_URI[archive.sha256sum] = "2b5ca4104c21a36e31f900ef117ab887dd9d471f6a65d2ba374ce0339314219f"
+SRC_URI[archive.sha256sum] = "9b92be6007da1bf75131a2d5e697f0ff985bccf82380d298d46f013675aa4197"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.25.1


