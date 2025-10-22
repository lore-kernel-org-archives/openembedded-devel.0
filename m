Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA029CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 23:26:57 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.8317.1761175611044024619
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 16:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G5U3BR0M;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33bda2306c5so178328a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 16:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761175610; x=1761780410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l3oCf1g5b75t9uxvX/VUzohWuNyHpByymS30jiBLCPw=;
        b=G5U3BR0MH4XrFQvppbe29BBZTVk0pIunBWoTlnj3Hu9L4YwjPV3+LrHrrjoO9m5doc
         RfK3GneujD8sSFVNKvOty7zQ3/KSXMEjEZd2xcHwT2XkMKQ1T0exU1HmO6QbNwT1/nKq
         wCqyEXYZGOp/BBJ1iRESMZdDfPvJXswgflHdTokoSkjJvEeXXHG5GxwqYtsf3NbNeIhw
         81JSc6DjQbPNwqkmkdTKlMlju3OTH++ueWN0LJi9HxE1x3F67kyFr2wnnA6JkY8Qp+z1
         gRo95hAHCMxYYBneb8Pdp52zkpptC0dPIsGqBgcKBJ4ou7VDcrWkw8lpq9B52OCkDyS7
         y9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175610; x=1761780410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3oCf1g5b75t9uxvX/VUzohWuNyHpByymS30jiBLCPw=;
        b=sj7LaqMpCj/iArF1wD2KOnuHpiSvAYoD3g/UGzK/0o/YAGbeD2TfV3cmuRbqV1xic4
         OGF4m0K6fy3haduUTdoNrQcdOmfUpluzNphz93z/0elNFeTVMp41NzVJyDtedZCczb0B
         6dMrCOHdVfYz+JWZ4rOn9MSG2VMcFbOYRgpU+hoteB94WWZIQZNe58RUjZpRWdH4ffPS
         /X8dCPGAREZHcIZJ1WzXwqnRaYRFaXl4C81HOClHVZxGJN1KOUWUTbgFBylLj+PG/PSY
         VL3xxyhPX5I3BAJzUtk8sW73Efr9nm8oKifFiFd9JBsKtF8SLwCyyvpCsePh22FWsZcS
         Svtg==
X-Gm-Message-State: AOJu0YzCXv3kdH1eiqcfhXPgz2gbgSSJqVe+otxl7CkCS9kzFVMWfrQp
	E/fOsY0RvA2mrx9jdRPCrWOXXTPSL4fX/V0Btl8eIDL+uqP+ZNNSaRcyb59n9Q==
X-Gm-Gg: ASbGncv+xClw0qYEXi5pqhq1evLCiErmZGwRwqnAAdQSqGlbIZYiRx6aLcAMK2aBI7h
	+mj2bql9DfAtjCl/kZI0zGEUcDNwdkSL2kmGPEQZ1P8zuXsmztqpXyGB/HOma9nG1vteNebRazY
	S0sK1ZFD35GcbVkQeobq4gYM/LBRQB1VFLu+4ULX13TDgA1yRzwBVPO3g7QLiwPu/1NlLSpfxl4
	1PtzM4ZjrTEihy5UZzg9WtpiigOru+sWys3fx1Pldgtxuwwu6TVoa2JAD0ukbHnv+eTqKM01Ion
	quOkRKZ9pK75JraM4YjU6eip0SHbI+kENeeHpkoOEHtV6mNB+EHjKHvhRFzWa9qdCwAJPpDEmUH
	SUH0o/d7aXuMWsI1Y8Ed2zKv2GDE9RytQAa1XeT4dBgsS41dz2cPj4SJ6BwrOrDy1PWJUMYiIZj
	trtrzJwUGAc4RM3AB2P4w1vyLICV2i0Z437qI=
X-Google-Smtp-Source: AGHT+IG3bXFy/RRqh5SGLkyFhIbc0hqtWA6AtE8wTRXJLPGFyvaycYGhYJJxRPY9ohq0YtsjI3jnkg==
X-Received: by 2002:a17:90b:2411:b0:33e:2d0f:4791 with SMTP id 98e67ed59e1d1-33e2d0f588cmr3108278a91.13.1761175610169;
        Wed, 22 Oct 2025 16:26:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb01919aasm331129a91.17.2025.10.22.16.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:26:49 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH v2 0/8] python3-django CVE fixes
Date: Thu, 23 Oct 2025 12:26:23 +1300
Message-ID: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 23:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120901

changes in v2
- renamed CVE-2025-26699.patch and removed CVE tag because it is not a CVE fix
  but fixes a regression caused by CVE fix

Ankur Tyagi (7):
  python-django: fix 4.2.20 regression
  python3-django: patch CVE-2025-32873
  python3-django: patch CVE-2025-48432
  python3-django: patch CVE-2025-57833
  python3-django: patch CVE-2025-59681
  python3-django: patch CVE-2025-59682
  python3-django: upgrade 5.0.11 -> 5.0.14

Soumya Sambu (1):
  python3-django: upgrade 4.2.18 -> 4.2.20

 .../CVE-2025-32873.patch                      |  86 +++++++
 .../CVE-2025-48432-1.patch                    | 166 +++++++++++++
 .../CVE-2025-48432-2.patch                    | 225 ++++++++++++++++++
 .../CVE-2025-48432-3.patch                    | 165 +++++++++++++
 .../CVE-2025-48432-4.patch                    | 193 +++++++++++++++
 .../CVE-2025-48432-5.patch                    |  76 ++++++
 .../CVE-2025-48432-6.patch                    | 167 +++++++++++++
 .../CVE-2025-57833.patch                      |  83 +++++++
 .../CVE-2025-59681.patch                      | 174 ++++++++++++++
 .../CVE-2025-59682.patch                      |  72 ++++++
 ...ntroduced-when-fixing-CVE-2025-26699.patch | 102 ++++++++
 .../python/python3-django_4.2.18.bb           |  14 --
 .../python/python3-django_4.2.20.bb           |  28 +++
 ...ngo_5.0.11.bb => python3-django_5.0.14.bb} |   2 +-
 14 files changed, 1538 insertions(+), 15 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-32873.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-4.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-5.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-6.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-57833.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-59681.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-59682.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/fix-regression-introduced-when-fixing-CVE-2025-26699.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_4.2.18.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_4.2.20.bb
 rename meta-python/recipes-devtools/python/{python3-django_5.0.11.bb => python3-django_5.0.14.bb} (56%)


