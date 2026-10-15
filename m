Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7658ECC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:49 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32841.1792043080374866963
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AAPz9C3z;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e946155442so10723445ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043080; x=1792647880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mW+LoniTCzW7aiiRq9s8iP9NX/H3QVJLMlsKCSNCor0=;
        b=AAPz9C3zQ8FdSeIPl0+49s/Jg4faiOg0Zpd9Jqe1K8W7H5x83E8M9wwZVqEukTeBk7
         7HPLfGS1sl8CtbZA+xNy0aetr+0IBfuQAgRwcC+rexfnB7bzdLgq/qK5fOqtqVVIZKWs
         JjwEUyL8XMzZuRP/aBPqXd1Og5nnkuO8enycLJtVOnGeZkIcOpLQKfdgFGz0qzTaNhHv
         ppe7jewKOSjlSa7mGi2212ysMsYMbvqEAgtoKyiIY0kHK2hYFV3wtpMgkuFCn4Aujn6f
         +5LWoA89V5SsldxiQDhesD6F2/hYR0iR7Dp2QS+kkZpFXqWCZFf9jT6RA/AsjIuH6CnB
         QSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043080; x=1792647880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mW+LoniTCzW7aiiRq9s8iP9NX/H3QVJLMlsKCSNCor0=;
        b=Rll42gvvkOXR51fF7cpexTKRvyUBy0oV/JXfSCkFC8xZkSBJq8/pRTlI4siFg6wrCC
         FLRCELLZhiuThK8NkPsM+RWKmnJiA0JzVBpMrytigOOFlHnCwyWQctety3y96xEHyaKC
         XA9ph5fA+pUBMFHe0/9306kPgKsEmX2vx94tZOiayc2DRLf6GER0LrMwqh5wGfS2jZK9
         2CNBXvLESJHaEG814tkELLpWQdIB9zVVKnZqkMIL2kxnnfo+rocsDBEEwA9dbqrJINvf
         bzUIRco5SU6FVUylLkRJ86NObzDCovynMBNFhHGa9sYrTtxlR7C10souTQ/GseXXAtrP
         Boog==
X-Gm-Message-State: AFq9FYLtMkYwwdlVXzoRUMgqsHQm4TFhbRsiACZAvsuUPiQYqT1eqBZu
	loaV1t1X+SfIqonUE9icvY0BnHY3uJjA2O21WEkEeahVruhi3SLcQo4tCjrk2Q==
X-Gm-Gg: AYBFou2Md6BIQu/8vgZbw2JtoZjvcxFr824jkNPu4FHbV7PM+kb9cRnXDtuuML1Zmd+
	NMu4NeG30CYsg+wdJN/oQnRjw66mEJRlwY83BpCIjjoRYMrdf44NdzexT64MpO/OyaPfjcw43vV
	HpcTv7Piq4XiEomcDaZsO6FCWkMDmsV4fcEBo3t1JCvT1utzjVLm6O8303H/Bul1D2RQocg9xSE
	R2OoChNpiG3xQVI2vOqyc8JpYKY8Ndqnc97jOgv0BlimMwQYT5l89+DNH0tPJz7Y4siXwsLEKeO
	25a6EpcWEDWDuZ6oatOGzSzjqDUIvedyi9CnpITu3hkVhgM3f7bcF2ACSqLW7bnQaYPFp3u7agB
	4PJndTtUqFDhbO/IC3fL496iv0fi1wdyu5IxqDAioLKNt1Mnx9FnpEWY9N8L+mxj1ntFFJ3LsSZ
	ENrTAKVa9iZftnZ1ag7PqonWfEiSi4SPuHNMld5JSNzhuKjw/i9ACClRxhxf7gfw6eCn47uqCuI
	vqbnDq7EMRDEJ43hFfqU10=
X-Received: by 2002:a17:902:e74d:b0:2dd:9b53:f9ba with SMTP id d9443c01a7336-2e84280a4f8mr155463525ad.1.1792043079757;
        Wed, 14 Oct 2026 22:44:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 51/82] python3-zeroconf: upgrade 0.151.3 -> 0.151.5
Date: Thu, 15 Oct 2026 18:41:39 +1300
Message-ID: <15b8501f248d1812df71b88778eb28038c24d8c3.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130971

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/python-zeroconf/python-zeroconf/releases/tag/0.151.4
https://github.com/python-zeroconf/python-zeroconf/releases/tag/0.151.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 92fff734092811bbca94ddfa3847a49ef5bea427)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...{python3-zeroconf_0.151.3.bb => python3-zeroconf_0.151.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.151.3.bb => python3-zeroconf_0.151.5.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.151.3.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.151.5.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.151.3.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.151.5.bb
index beadc0b3ed..4111f49a11 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.151.3.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.151.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ede793c8b5508eab1acfad7c0c4e335"
 
-SRC_URI[sha256sum] = "ce6c548e665759b6150cef4db9ab9d7bdd89857e90c513abd6b7340bdd7dbd6a"
+SRC_URI[sha256sum] = "28c2ec9d772007eedf11b41a9c9fd3d5c684c17b00721ff8f1ee31b20ad286a1"
 
 SRC_URI += "file://run-ptest"
 

