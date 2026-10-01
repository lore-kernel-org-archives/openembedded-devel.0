Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA593CA5FD2
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:03:47 +0000 (UTC)
Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3432.1790823826493680218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BglchpRi;
 spf=pass (domain: gmail.com, ip: 74.125.228.38, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88272e1d069so2981254b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823826; x=1791428626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IyfMsYR8SgyTAhR7rsx9DZ3IE/jvcvv0sEke5ufCSsc=;
        b=BglchpRie2WhJBshYfQ9/Lwiq1BKEiUFL+8KFFRkzhjSwEOhYcAK/b513n4OX935D7
         Z9/m2Z/nKtRLsLBIruJuj49D280pZTSpidH18PjdbpOVb38bGcQ3Oc32CurNDC7Jise4
         HGhZ+sbFaumhoB49W5Xb8Gp+5CU7uqXYDYbVX/ajYm2yysbn4p94HgDqXWY/h0U7W3wo
         2Ys5KHLOcsquGPxziKGdtf2PnEkfR0HUtr0Z+kbBZSU9jo9plc1DkPV0C+DmHvytCoas
         j/Yet2gP/mC/AU9ox6y0Do+bakppFWAYcv213ld4Nujd1MKY11Rj0jmBjQiXBWYwQpWi
         X2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823826; x=1791428626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IyfMsYR8SgyTAhR7rsx9DZ3IE/jvcvv0sEke5ufCSsc=;
        b=g8kzrpdiolpEhB77ESzcnw5JhpZ+XW/LiYdpCLnGUbMLQ679aLAWAUDHMbOG8UyXG5
         X2KDbI/7qY3yiO0tHi6ElOtz/9qiGFle3zHsY0mhuxB1QiiGmeSP+rBBWS7CfVIkBHeL
         kHYCn1H5pYZ4TOjtEo91Dpsj+pBZLmXEqRRT0Os/ySyUT1H2P7N3b5nkVSw/SAiAozAp
         OM3zVw/nZ5PSzEAn/GJezbj30/1lAU1akbXa4o4omzSkweIBBt+RuB9DWNrsuUJQeURe
         UINDy8vYg039AsE5t7wk5GxOp6WgtSfasGVzNNSTttVpmvc2vpD6G9kr6oD70IUiDOrK
         wIpQ==
X-Gm-Message-State: AFuF++n/24ObbOFwM8Rd7Skivfsdw2zbxO2zQq6eJYH1O5Yt2Ng8VgzC
	x0vOdaGZ2GqvDAn+yumssGhwYo2ZHIe5lxKLBKikPIeM1EPmyHp0ZoSzoZVg3Q==
X-Gm-Gg: AYBFou3RyVvzumeDfyxlqbXp+l7sI3GSzNhVNnHR1yZpRqsHr7fjyu3FC6P29p3lg0r
	G5fH43fMErXPt/5TZZ4ZUZVsvNaIez0zsOKBiQqpEAaTiBMATV6o6NL8ISy9TGtN38yQ7/4ROjp
	SG3sfA3BTBCxj2NrK8TiYpOk8mUT34OC9QwnZeWKOmWzkhAZknaoYogpCag1HQUK1jZ6ygKaAWQ
	o5w7jo44pbMc+J298QeM9/vfYGmfOaqGKFRX/ro3EYw+qMXqr32WT1BaEW4Ha0Upj/2RlYoZW27
	iykYPg/Ogxz/Es9fcePdA7tnd8ZeLoDdTzN0hN5Xv1MdUtJ6Nt3F2Ao7jarxOwgZhgc87GHGiO3
	NVylR5PeyMvR2CmtZnzGV59AGaHmwEaNY7/8duzWN0vpXnAaZHnEnndDp23WtRiJSkMq9jwW892
	11h3LNU+SEnZCKOhyWb6uQIYpA7AYr5s1pNiU/qXc1EN3FwVVyWBoZ0YXPNXrncHAp5eYUhV+oS
	Q+C6lvelqumiwE4bkYydcM=
X-Received: by 2002:a05:6a00:9084:b0:878:34d7:697b with SMTP id d2e1a72fcca58-8874cebda9fmr2326823b3a.41.1790823825784;
        Wed, 30 Sep 2026 20:03:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:03:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 5/17] wireplumber: upgrade 0.5.17 -> 0.5.18
Date: Thu,  1 Oct 2026 16:03:17 +1300
Message-ID: <20261001030331.1581021-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130554

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.freedesktop.org/pipewire/wireplumber/-/blob/0.5.18/NEWS.rst?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{wireplumber_0.5.17.bb => wireplumber_0.5.18.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.17.bb => wireplumber_0.5.18.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.17.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.18.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.17.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.18.bb
index bfe8137b0a..0442c0861d 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.17.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.18.bb
@@ -10,7 +10,7 @@ DEPENDS = "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data", "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
 
-SRCREV = "11e501181fb87dc8e72e55156d672109fbad2434"
+SRCREV = "81606cbb32d29df20147d1b68b662c1082654d81"
 SRC_URI = " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=master;protocol=https;tag=${PV} \
     file://run-ptest \

