Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8717.1792580484033023444
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=G6Z7uzEN;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e10a70540so337470f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580482; x=1793185282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RX7Y6C+cOwbyxsIth0U4QVGq+Q1LKyHH6D0+iDtnPp0=;
        b=G6Z7uzEN16v6ddHC+wK9aWHSGrA14DEQ6mLviPkvCAv86Cty+ZnLgx2jugaSzYiTbG
         pocDdUxG16/aPZED5BRo0zQiE9VkVlz+qbk5C9fY8ZMsGRM+yq91Jq2YZ3cPSRoY3ags
         xjblT+T/V3DOmz9iMgBMv9p7/MuiyMk3bjsyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580482; x=1793185282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RX7Y6C+cOwbyxsIth0U4QVGq+Q1LKyHH6D0+iDtnPp0=;
        b=q1kuuQGXrD12uAlfeNaxFdmayYv398htXWLdptcJIk4aHnvEzj+aRFAIRuDZzORkap
         05mKz3YurY2YwYOWkylGE6Gr8esR0ZBAHnzcPZ7/xNA+FgFYDQzEblP2fEgcRuB3a3Bh
         ZUlQjaK+NozIYTq3JG3LMJmdfY2nb7OR2GU2J9/Gs7pDUFOE7VGxApKu/Giqs+uKoFTp
         CShuMsqthWrnMI3C8Kgs9YC9RDuS0gUOFdxP6CUzTchSs3xVKPZ4IwvlBURTdiHOSWJk
         iEmcm5dz058h8yMfcynf3wGhYYQwwyzr9m6E46aOVI7LLpXSLlDVV/wR0vSP6AE1mUDx
         O+SQ==
X-Gm-Message-State: AFq9FYKQLoL82LpEjDbz0XjVk2UvA/jqhjwhq+2L3514E5PfCsYBzkaT
	JxdOhGt1/SKRvLXGQFH5IWigJAEIWhuPzHdVfnMJqbHz37w/6Z0I0eo/5Kdje9o1hFHsvVrnpz/
	ZKIvd
X-Gm-Gg: AYBFou22rUE1ETWBAwmKx+JPekw3aTQhl2PF317tgNp94RWbjadqMie2H5SqxXMHhTj
	I1H8VhJ7tdXSchP3NsYg4NGP6ORscWFE8w7pgqqWFGOTM1yo2h8PyvXU8AMfdny2QF8EIBrTZpB
	+w1HcpWrmguPNBJ8tWLgoOmfaYsAmQZ0t461aHs9z0kVzP4r1o7H2GgXmQoXj5CM8PGFauNxJE1
	5LRCao2bCIK0xtnGX1Cv9QKsJanxdhPM8By7Owy7gddl6iEGLdUwicwAnr7RQTB2rRl1K2Qvf6v
	uwBZVh4C8TjMuq16up1vPm/2MoKR/Ta8W5vip/vrtrIq+7IKlek9E7HhS+5pPoNaPjBjX60pmQX
	Xa6PdebvhxKPjriryTvCtUiiyAXNB2UM36Pq0sfuV/pV3NQYDLf4K/f+exQa11rXSWtb5fbVRkv
	pG2Hg5PEh/ryHZUW1Qq5Z5gdKiKD5sCOZZ+kfqHgVK9SRZaNkMT9KEXX3hAvaGvxqsXxLDGA6Nr
	yTmEN/U34XxKkwIXkCZ6Gimmd1mDb7R70tqvOgM3gITyLvUvY6YdqZuMlcuJLzCeESmUmj5PTLR
	A7VHIj/5qSxtEb8pZk8gRo2eLLnhN5+OROvyBiEEGVuDr55orFyRStgcngtiJy7UfjOOIzM5W/c
	pnwDl
X-Received: by 2002:a05:6000:611:b0:48e:476:99fb with SMTP id ffacd0b85a97d-48e264a7333mr3123988f8f.22.1792580480713;
        Wed, 21 Oct 2026 04:01:20 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:19 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/36] python3-executing: Upgrade 2.2.1 -> 2.3.0
Date: Wed, 21 Oct 2026 14:00:31 +0300
Message-ID: <20261021110103.1943456-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131266
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.3.0:

- remove tox from release script
- formatting

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-executing_2.2.1.bb => python3-executing_2.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-executing_2.2.1.bb => python3-executing_2.3.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-executing_2.2.1.bb b/meta-python/recipes-devtools/python/python3-executing_2.3.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-executing_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-executing_2.3.0.bb
index 79c0e922ce..a9b1c36e70 100644
--- a/meta-python/recipes-devtools/python/python3-executing_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-executing_2.3.0.bb
@@ -8,4 +8,4 @@ inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "3632cc370565f6648cc328b32435bd120a1e4ebb20c77e3fdde9a13cd1e533c4"
+SRC_URI[sha256sum] = "15919cb5d667e5cb4e099511971d00d659573fff2dd5c4e6cd8b71636c7858d2"
-- 
2.47.3

