Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BBFC25B4E
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 16:01:40 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.18829.1674576090993865916
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jan 2023 08:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=snrpuAL7;
 spf=pass (domain: konsulko.com, ip: 209.85.208.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f44.google.com with SMTP id v10so18757459edi.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 08:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLNbd3I73CNNkMueXVvvKpkGkuXlwgRtZ8tEGxwivOs=;
        b=snrpuAL7LlMSJkwKHLzYkCmJmpjKNT6McTysoKeOj+09p7YZe9zbfGDk0gO52XN8oG
         LR5neVx2q/c8ATI3PXVUsp7X7d6QFWJ3vncV2LNTOqF8TanK9ob0KHSRLNLQwCo1YlZr
         S4ML8vdso9MXk5siTrIW+90MDF9VJ6KylYXMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLNbd3I73CNNkMueXVvvKpkGkuXlwgRtZ8tEGxwivOs=;
        b=cuSAxyHR3pK4gKEJlCCVIrKKbINFnGKPcDXWsZT5/CDeLodzAu/ESS3JnjCKmNDvQh
         I/C8ese48flPHa2+EUSiDv0cg7pWP/gnYJoBYyTAJQw/JkkkwvmiiY5BkjpV8cUsz3q5
         xLzZ+oWKltVy5rzsdYmFewvJfil1khSICA0YqLmfIr707pK1657W/iJEJ8zkRNRofUcX
         Zl47R6aW9p7+RjV/Q/eZALVSZ0+RqYeyFwCC+v0D6HMC0xMkPiTDu4e0Kc4vRR6W5kNz
         MwyvrCT2Mv3EtPuAmM2Lwwl0/jcX5BQZ2+abxpDokaSsq4D5LKb0SD0WXo3wO91J+qd4
         F9FQ==
X-Gm-Message-State: AFqh2kr6DWUyxFbNREzqNqV7yyQBytrbjGEBL8BV1+YAqPFdg7P3dZg/
	OhpK9ZAbi15AY3XdYEZfsEv7iWbvWiSKLShDIzQ=
X-Google-Smtp-Source: AMrXdXtRbNolwBZtS14cOZQwTwSa663pzlaYiXjeyUuojTu94G/+wS2baL+um78JcPGDjGW4CNGUcg==
X-Received: by 2002:aa7:dd44:0:b0:49e:689:f003 with SMTP id o4-20020aa7dd44000000b0049e0689f003mr27727513edw.10.1674576089043;
        Tue, 24 Jan 2023 08:01:29 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id c3-20020a056402120300b0048ec121a52fsm1194750edw.46.2023.01.24.08.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 08:01:28 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-nocaselist: Upgrade 1.0.6 -> 1.1.0
Date: Tue, 24 Jan 2023 18:01:18 +0200
Message-Id: <20230124160119.377481-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 16:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100725

Upgrade to release 1.1.0:

- The default casefolding method on Python 3 was changed from
  str.lower() to str.casefold(). This changes the matching of the
  case-insensitive values. This shold normally be an improvement,
  but in case you find that you are negatively affected by this
  change, you can go back to the str.lower() method by overriding
  the NocaseDict.__casefold__() method with a method that calls
  str.lower().
- Added support for Python 3.11.
- Changed the default casefolding method on Python 3 to be
  str.casefold() in order to improve Unicode support. On Python 2,
  it remains str.lower(). Added support for user-defined
  casefolding.
- Added support for storing None as a value in a NocaseList.
  Previously, that was rejected with AttributeError since the
  casefold method was attempted to be called on the None value.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-nocaselist_1.0.6.bb => python3-nocaselist_1.1.0.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocaselist_1.0.6.bb => python3-nocaselist_1.1.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.6.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.1.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-nocaselist_1.0.6.bb
rename to meta-python/recipes-devtools/python/python3-nocaselist_1.1.0.bb
index 9e6842961..4b93ca98f 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.1.0.bb
@@ -3,6 +3,10 @@ HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "48f067f8cb841245f34d03120bc1ba9900f13b19cb51bcc6c7bee017f7c874da"
+SRC_URI[sha256sum] = "a99384abc700c409e9def7143763e18dfad332fdff7e30fae1f6d1a30b372772"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+	${PYTHON_PN}-six \
+"
-- 
2.30.2


