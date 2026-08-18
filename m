Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B0DC5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:01:38 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2319.1787029298058557577
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B4+A//5h;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e88b60121so3198604a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029297; x=1787634097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FgtSQaPURqIaKD3KXtM+DIy/YKOvS11B+T3TzesXF34=;
        b=B4+A//5hgXIkKfmGADkcrvBuACAIdgqKaDfKAd59RgmNRwQ6Uvc+3VcMj+XumFIo4Z
         /SkGgpdPfkY3gR4SmgbtEPlNTBRSZbPma4Wqty+Pb0U8KNgfdmPae1DjiSnKyOGZonYw
         vFDqsSPNXufX7ZuUii1eQImkul9qgLUWMeu+V/Co6x9KPJQkPcSWjypdEdHRCDBD/REA
         HZKI3JzOrnRARly4ZSTbL6BO7//84YTaQhnQcYRYP0q499x0mpFDFxqY5a0y3HQjYJkc
         nspRu0owzJRWm3hzOz9KERWYwNOJLruZatgnJ5Ez+oRWxqpFQCb1Ab+AQFaRO1eXtxFp
         DZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029297; x=1787634097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgtSQaPURqIaKD3KXtM+DIy/YKOvS11B+T3TzesXF34=;
        b=GsTcKU9txFFii5+bb+/B3cqhSLpZVc3ClghHxDkL3YsDe59CVqtz8VethEQCmI1zry
         oj/ihESVLIqSpYHPgsjQWvtdlA4QE5h2kaNQ1udVjUDJUVLbY4UOyoDPl5/s85XAApeH
         o2cBRS7XiwYbdMfDj3bKk7uICthn3Rk5f/plOIGtEYIcMaLt31GA1TIn+VNOG+lmI9wT
         m4leQps4AAkL/FtXmcIUjd8NogyB9KDKAbMOjn2rupDSB5fp9f92Tgk/0Wu1vafVHrnC
         5IRsoC5nYmXc13F7swCPWWtD8nhDxjl3IlYYqmzD86Mgu3x3Hm5CUePZb2wUNemhLtOx
         IVWw==
X-Gm-Message-State: AOJu0Yx8IzrRvRlCE7aIExvSnEweILasBizGOOux87wTxiqeFJbdPRkY
	jrA1DqtBY1SyHmlBN7Ug3rFn+J8feyNZbCybVLpO3S9vwSl4CSI0EcjkYmY9/cmv
X-Gm-Gg: AR+sD114c5t9bS+6h6C1mjaWuDKyvfz8nhJqj1Zp8Xfagvzjy17daymBMLAJwjqD1sJ
	jQZ9RNwbaU5eIDbvmpx/1mI++CvoCpl4pU1HyhVmfi3qFqVv3eBNpYZt8V8Rri/FH7VMZ96sOFX
	gqlKD5spiIkXSAbpt6Cdw19IH7Tv3yFhJfUbfyu9hXXK8GyU59DvBWtlOqXB3zmTeVOtUix6cd5
	EF+z/PqLI1Rc2esNT7i0fk7DbfO4WUC/yzxtwJNwfwOWg1meqpt6uxA2LGlbWK7l1e4kAMtdgs+
	rUNs7EGzNoxvovh4rcrUTo5D6r2Qd9JpeWTwZYVAc/WdKHL+KUcpRU+MeYIZFv+j1J3B33Vc72R
	Ot77KHPIKTqPQyYD1M4ERYaJyvbB6FUDek1Qu77OJ5QxO6yDiU1BFp4YGdF1Q4EF/Q3KcAOtw2x
	mezSyEH8UGMQ6qbMIbQP49WtDtRibrmD3ywx6y3kBdt0bh8QL8ZhNCmf6WwJVrkkzD39kNNqr5R
	g==
X-Received: by 2002:a17:90a:d00f:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-3933b8725b5mr31668604a91.13.1787029297298;
        Mon, 17 Aug 2026 22:01:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:01:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 1/27] file-roller: upgrade 44.5 -> 44.7
Date: Tue, 18 Aug 2026 17:00:56 +1200
Message-ID: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129200

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also add UPSTREAM_CHECK variables to check for new releases.
Fixes:
$ devtool latest-version file-roller
...
INFO: Current version: 44.5
INFO: Latest version:

Release Notes:
https://gitlab.gnome.org/GNOME/file-roller/-/blob/44.7/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../file-roller/{file-roller_44.5.bb => file-roller_44.7.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_44.5.bb => file-roller_44.7.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_44.7.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_44.7.bb
index f0f74f5561..c1ffe242cd 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_44.7.bb
@@ -16,7 +16,10 @@ DEPENDS = " \
 
 inherit gnomebase gsettings itstool gobject-introspection gnome-help gettext upstream-version-is-even mime-xdg gtk-icon-cache features_check
 
-SRC_URI[archive.sha256sum] = "dfaf4bb989c0b8986be8bdae9fffeab8d0f30669ae3a627e8c3df94f23888339"
+SRC_URI[archive.sha256sum] = "67cada96a2409c859f378e82fbe868b0e9c00a69e6b7b885d542c64ea2a1297d"
+
+UPSTREAM_CHECK_URI = "https://gitlab.gnome.org/GNOME/file-roller/-/tags"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 

