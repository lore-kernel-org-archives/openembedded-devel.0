Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5250CC19F2D
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 18:29:09 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.337.1659551343874829568
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 11:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=aRxMxLBP;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id bk11so12662070wrb.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GD/nhbGSSeFwvIHbicWPSgXDAeNAyj4G/Kh+XuEY6ks=;
        b=aRxMxLBP85VAIiZgoOgS3Vd+Ij+BD5fmTItQ436rcRfoXiBRn8G4rGQODczSooPjki
         MEmxB07OxyredyRNwWMrU1c4G8wPhGIPiiUF8MmRZxuWxm5DXKLbK81CUDlejOE4asbl
         9pXmYKF7+xeZKyVVddyw7OVn9IUdy8XXQNyw0M1Wx6G5ZA8d+AzaDWkebmdHJDQhSb73
         I+IpVuTIXmn3o1cjUpAj664d53pul9IC5L3tTweK3Ngk2l98TyWzyXm8Dvw0YVmjfRKl
         7hBqEzr1V1yNl3qdZqxNmc7ViA2hUsSEta6blRGEurwK74T035BiBuRsZBTITdr2I8be
         mMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GD/nhbGSSeFwvIHbicWPSgXDAeNAyj4G/Kh+XuEY6ks=;
        b=7VdD97G5VhQiPe5caLvLQUvYpdjsnjN2VwxYpBhb6oa3B7Q3BiwkWn/kg7LvatyM4Z
         EoUy7C7m5RXKITAjuKOJipC/lLc8MVHlpvI6H1pRz6P08w95pRdsID6MCrmujjOl20OT
         1zNLUnTpGcBv4jzpAWpvo3qjFkyy4OgJkV8PwFkTELKG3CsiLxcwVXmPiTuMH++Ugr7l
         H0OXEQe4SdFvmmoILlDzvOs/BA/BwWQCev3QibSWnjknIYMY+B9g9CVajgUCruKQx787
         lBlho3jfs1KjizIla0cMYVQ/irSGJps3o78UZXnfSbT3NXzsB4oTOfnwnNDZ2nuSdrfS
         lC9A==
X-Gm-Message-State: ACgBeo1IVHKCSMhT3H3SatGdpPvwrAjosrzfA0F9r5UBAYXMEj98RiRr
	815QZgp03EJBYdA12vs/EVZoJw==
X-Google-Smtp-Source: 
 AA6agR5id/X3zjCqyfR1jchcABP/f7Ktaei1UAFYjuv1dKANemTqlWbfiPFW9SHPmtqkTHqtQVDeaQ==
X-Received: by 2002:a5d:5986:0:b0:220:73d5:1f01 with SMTP id
 n6-20020a5d5986000000b0022073d51f01mr5275862wri.417.1659551342249;
        Wed, 03 Aug 2022 11:29:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4a53:da6b:7724:118e])
        by smtp.gmail.com with ESMTPSA id
 x4-20020a5d4444000000b00220606afdf4sm2730280wrr.43.2022.08.03.11.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 11:29:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 3/3] python3-matplotlib: bump to 3.5.2
Date: Wed,  3 Aug 2022 20:28:55 +0200
Message-Id: <20220803182855.104135-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220803182855.104135-1-brgl@bgdev.pl>
References: <20220803182855.104135-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Aug 2022 18:29:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98113

There's a bug in 3.5.1 that makes importing matplotlib impossible in
some environments:

>>> import matplotlib
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.10/site-packages/matplotlib/__init__.py", line 895, in <module>
    defaultParams = rcsetup.defaultParams = {
  File "/usr/lib/python3.10/site-packages/matplotlib/__init__.py", line 898, in <dictcomp>
    rcParamsDefault[key]),
  File "/usr/lib/python3.10/site-packages/matplotlib/__init__.py", line 674, in __getitem__
    return dict.__getitem__(self, key)
KeyError: 'webagg.port'

This is fixed in 3.5.2.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 ...{python3-matplotlib_3.5.1.bb => python3-matplotlib_3.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.5.1.bb => python3-matplotlib_3.5.2.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.2.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.5.2.bb
index e3e5d85eb..eaa144719 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.2.bb
@@ -21,7 +21,7 @@ DEPENDS = "\
     python3-certifi-native \
 "
 
-SRC_URI[sha256sum] = "b2e9810e09c3a47b73ce9cab5a72243a1258f61e7900969097a817232246ce1c"
+SRC_URI[sha256sum] = "48cf850ce14fa18067f2d9e0d646763681948487a8080ec0af2686468b4607a2"
 
 inherit pypi setuptools3 pkgconfig
 
-- 
2.34.1


