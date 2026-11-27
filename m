Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8091.1795739737404475519
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=p1QsWARB;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso15985359eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739737; x=1796344537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7J3kjRM3qB7jxobt5Avi/g381tXp4pIXCAD2dRkYkf8=;
        b=p1QsWARB7xmuTPaguJitgbZBLhW+IJ6llcdmh8JUeCcjVm7msciKHkjma1BdaR4JGV
         Svmn8qzmCPOn/PVIOgJhmKm1EHgqnup6a19uVc2mQfk5VJfQXYoEajLj+1tOYEqiIg4K
         cthE7APrWjS4AjmHkMXYFuuYPRmy9fzxJzgK6nf1GGyw86DGJmXiHGXV7E2icN2JFX8l
         K+b0RnhlWfZ6IZPXhlhMm7JjajQ1R7jHxTSFWnjnImK/Cg3dCT1AxrzUcbfyes7JzVDz
         0pNaY0mDtlZ3PrGG7H0BeZHlgjAw9nmQdTRQp+t8E5NxtRtsFicewsHoGRiTrUn+2mnd
         KN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739737; x=1796344537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7J3kjRM3qB7jxobt5Avi/g381tXp4pIXCAD2dRkYkf8=;
        b=fWa2+Zc/76iz6zLISpIELeqD7qlNYAGbJ5lrK2H4g8fD2OF2Vc5w003rWOlNEaYOQV
         n5zlN1GIGFatZKwqnVLjOFQDkOtLEAFicrRT/7740l6CdJNWf7GwKNag631HCDJbJzZS
         Oqac5JvuTbfVaGm7b4q3ZOiUUS3fgJhksHX/bvWQz7xgEevC4A2Zs9pHZjMMjizTAv2G
         wl7lY5L+eeNxvbSwG60PxaHPgHtEUOmER2iK4to0G6nLYQaIvQSLbgwn6KWY8hnjDkwa
         26dz+gM0Dinkb7rlpOylx9bjgeTdGk9l5eNv6jUZyaoOUTUE+/FDDDcrCLf9UrxKRBGS
         bmrw==
X-Gm-Message-State: APuU4Z8zXam2kMY5mxaRE+fbtEABTjZvdXMUuKnRWHdLg+Tm/498fRsP
	Y4r4oAhDXoDSemKs6oPWtUSfbCUv7CayP1T3nPiK3SFz5f1HJTkjbgxReV2ihB09
X-Gm-Gg: AZFdTZeBFuCB8DKWcQosETZNWofJGO/hCbVOV4z3orzStIiO4z1H1NhOc2EC6CuIGvT
	MAVDbQzvZDVN0+h8SRFfyO69WRjmqVfOOaANhSRmv64OyNjwSaYaS473+p7eKIZX41saeYfKmOr
	uou+82N8XHCjIw8va7+7VXRzs1ZbuVZy3MkjzW1GSvKBIMp9x1n6dwHz60Ws2zTAauxJShOgETo
	85dmWcUTn0MIdY/L0ykbHOBDXJ6vW3JdSnc7jqFJZNufMSzoesIx2HRba2DjKWE0jKHa6UF+HNa
	aJObQJdzRixZtghcDlcYWk+jNn/cTOj0Qc/fAsxkX1BtsR2GzOmFK233ZiaqccxCrT5ZP0w+5t1
	wg9A1wH9d2gbFd5/4KABR4NxaK9wsfSdPZBVFc99wO46CCc6rKeA2LycLbMIcbh5lMHoryhjeXk
	6cIqSf5GNcJbYHUsH+uAK7YzA0Ig56rjXVfSbu6eLUVWcul+DXYxSF5ItfxzQJ+0WqYeziT5TFc
	JfZPJuPFPfwikyZTmjeF7IIf/xm9AbSIh4YFzvnS/u+UqEUE3tl5ERK2sEEIThsdrd8UTtsWJi/
	pdwNZ/q12uKYbGvvXXmrnSqAZi8YWLYwwVDwGeWTfQDVR2w2VR3YZp2Iba8ZJcqbqy8owrB8yUj
	Q5ydOzd08tsU1oKlLeiFAdUK/a/EKtS8DCLbb6JqL9LCol6znWSt/9pCrkSsIXW2PNWiDdnvCSP
	O9dnP2r2AdQF1uImF5WtVo8xXdhorwDXpz/djwTQlnEf3YFt9HangQL/DmQYf//FaiwB4H9Nc/N
	ZA5qccZWj5Fmn53GuWGa4YC16CN6EFSgJECltGoDWQmifRZRznQJctVPqXe8rtrhFYQmaAGjUQa
	KlpB
X-Received: by 2002:a05:7300:f797:b0:386:95e7:848c with SMTP id 5a478bee46e88-38695e79009mr20235293eec.7.1795739736731;
        Thu, 26 Nov 2026 16:35:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 63/69] lvgl-demo-fb: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:19 -0800
Message-ID: <20261127003425.2166632-64-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133163
Content-Type: text/plain; charset="utf-8"

The demo repository stopped tagging at v9.2.2, while PV follows the
bundled lvgl release, so the recipe was marked UPSTREAM_VERSION_UNKNOWN.
Track new commits on the release/v9.6 branch the recipe fetches instead;
lvgl releases are tracked by the lvgl recipe.

This replaces the upstream check settings from commit 11d7a35275
("lvgl-demo-fb: Update to 9.6.0").

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.6.0.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.6.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.6.0.bb
index 1389fa958a..c56ae6cb63 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.6.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.6.0.bb
@@ -17,12 +17,7 @@ SRC_URI = "\
 SRCREV_demo = "0728bc4eff0ff85ef787db3f557a654c5c7c9c41"
 SRCREV_lvgl = "80ca777e37a2b176770726a02e07a6fb79ef0b39"
 SRCREV_FORMAT = "demo_lvgl"
-# The version check runs against the first SRC_URI (the demo repo), whose tags
-# are "vX.Y.Z" but top out at v9.2.2 -- below PV 9.5.0+git, which follows the
-# bundled lvgl release. Regex is correct; marked unknown until the demo repo
-# tags a >=9.5.0 release.
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 inherit cmake pkgconfig
 
