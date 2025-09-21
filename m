Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1306CAC59A
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 19:46:23 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.35828.1758483980310522471
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 12:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nWznPctS;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b04770a25f2so606052866b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 12:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758483978; x=1759088778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X7BYVB3YPHuwIbWeQkLF9aMz0tpkSuEpdwp2ROLTtLk=;
        b=nWznPctS3nua8op54PNW5YpZXhIJVS9dov4P61+rjxFDU2+vk4I7CV5F+hPWFQ57bg
         2JvT+XVEY/TIkzmgtgyzLrR+0EF4TzrXhEHfF2d+k3WQeYOvPiPTCaqbbofmQKkoB9XY
         WGrus/rj1vsDCyG8OB1MVP7fnma6mWIoWG7z0b7wIvP9R+8Hbox24nQaw9FCdkFeC6rV
         VDmXlPXHdO+wBqYG9zAYt3RYxjt7QmCM8f6gqe0nQqCl46BvpGmjmeDM9HPip/9stZcI
         Vyr90AaftqZeuQA4JG8C+jaZ+IefBU3q8O+8MJRoyHW9HJAAYCdZQ7yGhjC7nMPjaCPI
         viuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758483978; x=1759088778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7BYVB3YPHuwIbWeQkLF9aMz0tpkSuEpdwp2ROLTtLk=;
        b=Rlwo8HNXFudQFirwZvg92tkGdAIIkHKO0k/xWxiXMb+60ygoN03A7rDyGL/xqjmS7+
         zSIzxPY18N62pLNg5Sdbq8yD1hzWVIjENXtNsKwYEugRxru/W5pvpvz5iSq2nLRr/0Ux
         bysanT4/+WEVPTZWMDfAB7cXX6oY0oXj9GPoHjV9LRiuG6lrZHYZ9OKcyiBw7qhRTU+/
         tv7Aj9j4DcgzRImwjwiOKKt+93B8NUmE6Fk86sQIe7B9BJhSWccU5GpP/LmiCPFgbqT5
         1zP0K7yiHZ4w4HRlj7/LrQ1N5CQp7G+VfMDf8dG4ifOfad8jmhPaJCsveEB7Lf+m77gV
         6jRg==
X-Gm-Message-State: AOJu0YwBjsF9A1PmQY/gSoG/bGRONJOBDP5UE23cgwM/pQ1mDi5Iwf+N
	TFS2EQkhWMFLxBn1HMq+v04wVNNxgB1jG2L3SrBRBpXzjuwA/BGxPnB/W309gjN6
X-Gm-Gg: ASbGncvpRElMC81tnPRkWjyHWR7kGXy01bant5izEHJ2wzYwfPIQhiKlJI8tRMjd8ns
	VVYvBroxLea7QAIxR15V3tygN7IHinVobqRxAy90JNlDjnT2omyRWJk/cjUKnya/ribPigeWc3v
	q9x7CGxXxIu6Vp2x5ikyKvfHtcPOekmSQEE8kAECZ1ynky0FKHrK+5gRcknSWucC912Fnj7IJlB
	98C2shdInwzUVTwOAuyFY7jaHR8llypHRmAvQWdN6hG0B2H5aHxmou4Jj6bvya6+E7asliTXMO7
	JrX5ysusDdGTKT2L/Lxe/hPelkyklSGJDvRQ0LEffg9tk3Lu0ufnFPwY5hBO20vVXWKL14z44Db
	KtA3nFYJHPHf+sfUr+aTRPlPMFOHE2kbDbH+zNfjcw2B21WnMxzmc/KNaAaEh7QiR0fZoMQa7aq
	XVHQOW2kgD2gcc3/b4ZnsHPB5DjPSHiiV8fvtvX58aPR8=
X-Google-Smtp-Source: AGHT+IF9+ogqYpMtYffEFpPZ0rJN2Zjxd2brIdeBSoO6/bU+drknDTIHtTH87nOwK1dfA5fMTeo/4A==
X-Received: by 2002:a17:907:97c7:b0:b04:8358:26fe with SMTP id a640c23a62f3a-b24f32c9141mr1086742266b.34.1758483978126;
        Sun, 21 Sep 2025 12:46:18 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b29abf51da3sm315549566b.75.2025.09.21.12.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 12:46:17 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/5] python3-aiohue: 4.7.4 -> 4.7.5
Date: Sun, 21 Sep 2025 21:45:59 +0200
Message-ID: <20250921194602.1207268-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 19:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119633

---
 .../python/{python3-aiohue_4.7.4.bb => python3-aiohue_4.7.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.7.4.bb => python3-aiohue_4.7.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.7.4.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.7.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.7.4.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.7.5.bb
index 45d23408a1..23354152be 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.7.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "0764d934c0d198e450364bc47e87025108aef07b5280602890e9be2972d85a91"
+SRC_URI[sha256sum] = "77d7ee467c41bb0c3e00f4e2e533ba65f58a29147ed7df407f84cd4595d2d20c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


