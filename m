Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550BAC36010
	for <webhook@archiver.kernel.org>; Sat,  5 Apr 2025 20:14:26 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.13539.1743884064583111212
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Apr 2025 13:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bo54bu24;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so5066614a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 13:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743884062; x=1744488862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDUVXcRC4/+vzn/5+/HTIUmy+jNgg2KI12opfHrLjbY=;
        b=bo54bu24RimzDIBm5Q00R/8KbxanY47Dd2tJ2CHIVk/EY0lyeVfufup+ZLh7nOk3JH
         SOWotGr6JdG3+NHL8kw34ByWY8WZk2j4Up0Z7tn6PFwJSyZgZfCkaqPM+Eh3KFotNzC2
         jomy/tvL1b+hXKDLidMeW14dLYzVqIFADCLM2x8ZYHwNQWqKAVvcl25SlzNpAPEyqgJa
         NUkbaxACLyAHDxaxx4jDRk9sz6/kSezWdHcmypdDUb3Qwfo4zdetv4CEuLfGp+TLQnBJ
         5P3VSH0epC+DwdSO6IIPnyYoyISpnNaBtjjslHxMLx27fmE90Vjicb1mWGN3kqRKm4gi
         ZQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743884062; x=1744488862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDUVXcRC4/+vzn/5+/HTIUmy+jNgg2KI12opfHrLjbY=;
        b=vDzeaUB7mKaDJvy593RexBjOcfTzV6Ubfm1TqxVZ1gR8KvG23l2mo1+YepcY5pAnz3
         wygrc+6uv34Jfc3w2z37Ckoihvf0uSv30JkObvrU6AUyIu3KxTlOXQnTSNCG56YbDUqt
         JfqFdBYGqGjhoN0NR3e5Qy8iFFzApFebD/nv0dxVHft30BSDqbFHB6L7lhAdQEs9gpFS
         sCPvC3Lk+q6KT25SX3bCb6ETlom4FBp/V77iHJ384sBb32bwLZ4L/CsjlaAVdKJjhIOR
         l2MOHMVzvE4IhIOkDQ3kOddKEa3n40UyfZEGe8nvtA3+AQHWYRU+zjlUDTVLOnGemPGa
         rcyg==
X-Gm-Message-State: AOJu0YxxbOncxbDxqn5OLMIzC4XqNXaNajwE4W/qUHwqGnOnjqJWgvWn
	H7C+BQjODYAabAvjkmYnwe9kl3NiHRDp6PwW5PTNxnl7lKd0GTTwyRr9Jzhq
X-Gm-Gg: ASbGncuAubVr9CcBfLZWls9B7FcAnGOXKEIU+JEIYombrFxF0qo8ACzrcT7ng8W2ysR
	Lt/Lus3phXBMyqXYliwXiaSe9fwYxZ40waiIUyIqYZPqJHB6h9TVePc+q3fs1b4SCx/Qa5zl/D0
	dnA5aV46+SmcqQ2xYj1vcI+NE64XJFXxO4yQR4DF5uj8MxafYSgbBsIhga+HjUOVNew1ZrXBaIF
	yk1US9TvS7wW0mrNE6Wet9b6M32CeO24nCR4jAWxNrs3i/EB6JYh0GKHDvgUCbd+DiYsq1ZMPS9
	PRGIen7O2ksQvHaq8yy3Ynwd52N122cor/O612H98HxRdLVwwlzmRzEfydn2JuQLAnJzfEKp9oo
	7vf4DoxTU4Q5YtxJKmm1+FPRY/E7jDi2nEg==
X-Google-Smtp-Source: AGHT+IHU/nZOg+fTZfzKlTBhP61eIJa1vgepka4MKsFla0tcw1vm3E780aa48Mbrcqu0JpbIvj87EA==
X-Received: by 2002:a17:907:9693:b0:ac3:3e43:3b2b with SMTP id a640c23a62f3a-ac7d1878c0amr785778166b.18.1743884062108;
        Sat, 05 Apr 2025 13:14:22 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013ebbdsm473166166b.93.2025.04.05.13.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 13:14:21 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-sentry-sdk: upgrade 1.45.0 -> 1.45.1
Date: Sat,  5 Apr 2025 20:14:02 +0000
Message-ID: <20250405201402.2733841-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250405201402.2733841-1-t.f.g.geelen@gmail.com>
References: <20250405201402.2733841-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 20:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116601

---
 ...hon3-sentry-sdk_1.45.0.bb => python3-sentry-sdk_1.45.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.45.0.bb => python3-sentry-sdk_1.45.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.45.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.45.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.45.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.45.1.bb
index c3e53b5183..10fdbce139 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.45.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.45.1.bb
@@ -15,8 +15,8 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "509aa9678c0512344ca886281766c2e538682f8acfa50fd8d405f8c417ad0625"
+SRC_URI[sha256sum] = "a16c997c0f4e3df63c0fc5e4207ccb1ab37900433e0f72fef88315d317829a26"
 
-PYPI_PACKAGE = "sentry-sdk"
+PYPI_PACKAGE = "sentry_sdk"
 
 inherit pypi setuptools3
-- 
2.43.0


