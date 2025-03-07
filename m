Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7471C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:24:20 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.15333.1741364653157390667
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 08:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=m7XtH1Bb;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaec111762bso381366566b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 08:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741364651; x=1741969451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjhotQM7epMKu5cyj+93Lb0k2dZsADDMo68lJXOFAjA=;
        b=m7XtH1BbnS2cqhSPkjbOo9lvE4st9gCnFqStAZNHqsx0BAGEU+HPjz9xyEMMUVYn4c
         MlN3Io9waqP+aRZQ7AY76gA6bkvaT0bY9L7lJAuMbZ3Ev+yfQfd+jEzYgDvrGJwhmHoZ
         g77hn8K0bKmpng44RW31tm41SVv/hnTCa5+sI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364651; x=1741969451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjhotQM7epMKu5cyj+93Lb0k2dZsADDMo68lJXOFAjA=;
        b=SxmFdtVIPjIR6UNLWh9VkH7wxNEiE6oYu8jsDK9rXXO61D7GBXNCTwc6VhxP3+byPh
         CNrsRrDr2kQtpaz5IbPA1Se2cqfzaKUUkL+RFqNb80zlJpKsYJO+l2aXny3Ntwweph9T
         Jymv86/xGbRrLTe103g7ku0iWR+aJ5Xa3u71OeiLRrlZcdwL2Qosqm2hWfS1fhUUtp5u
         K256svZPJp8MQEQeHx2RjgxJLF+iGkJD65yUN7jWwSbIsUVNdWPSza+JOHrXlMPNb9Di
         3vo+SSS9we+fxFY/PK4UYq0sS4pGgku7L/BWDbJFs0Mfn/iY+qszm+O4UVTH2JPz7kze
         jIrQ==
X-Gm-Message-State: AOJu0YxWUb+Zg84/hAME9ywyzq256VhXDxxK0zvjKHEPbxXWjqjp1CLP
	+hux3RN2rYBq+tRm0xy6mwB2RYHnZ0nFQSL1Ho/KDIpvxcqSeQhAD7H21n4rZ6Y3IknF1jbcUqd
	v
X-Gm-Gg: ASbGnctej2pG+aKObY8T1ZYpgxYmPh4djSuFvosahnWHd9ZsDCsPeyHRhuD9aUy3TC3
	/K8UWciWu/8iGoySdrpUQU7XkKGgNNdsMk+j8z4Q79lFWTUDnfRYvROSg+r4l+X5k0WP8IWV4X9
	GdUbt3+RkAD7cLnAz1M19miDEIuJjPH9o64Y1rO5uuR6+E8YgL7dDvOM6sKVpXjgoVKNKESXQ9N
	azECmlkelouq2Uq6RP9HifS9YOCoPk+Cjy5A/NC+lR+kCy/S//uv7QITfinXgzqXtnJXEHOF8IA
	y9p9kIkOyt2ir/+8+5Cpty535hhLjMyVyTYdoBjuTKfzoK5XvSfu/pCqB+8=
X-Google-Smtp-Source: AGHT+IFFJH9yeqwUHP1uU6Pzd9cR2enWRKBtTNyPzvHjWcmH+Di1DY3AiDG1PvjtD3UMwsl+VR5egg==
X-Received: by 2002:a17:906:f590:b0:ab8:c215:fd27 with SMTP id a640c23a62f3a-ac252a9e65bmr355732366b.14.1741364651297;
        Fri, 07 Mar 2025 08:24:11 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239438f9bsm300831966b.11.2025.03.07.08.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:24:11 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-pycurl: Upgrade 7.45.4 -> 7.45.6
Date: Fri,  7 Mar 2025 18:24:07 +0200
Message-Id: <20250307162408.966423-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250307162408.966423-1-leon.anavi@konsulko.com>
References: <20250307162408.966423-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 16:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115791

Upgrade to release 7.45.6:

- Update the wheels to incorporate libcurl 8.12.1 for security
  fixes, as well as enable some additional libraries in wheel
  builds.
- The previous release was accidentally built without CA bundle
  autodetection in Linux wheels - this restores that behavior
  (no changes to macOS or Linux).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pycurl_7.45.4.bb => python3-pycurl_7.45.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.45.4.bb => python3-pycurl_7.45.6.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.45.4.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.45.6.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.45.4.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.45.6.bb
index 240b78fb4a..0bba73a660 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.45.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.45.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING-MIT;md5=be42e1b1e58c8d59c2901fd747bfc55d \
                     "
 
-SRC_URI[sha256sum] = "32c8e237069273f4260b6ae13d1e0f99daae938977016021565dc6e11050e803"
+SRC_URI[sha256sum] = "2b73e66b22719ea48ac08a93fc88e57ef36d46d03cb09d972063c9aa86bb74e6"
 
 DEPENDS = "curl"
 
-- 
2.39.5


