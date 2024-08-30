Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C08CA0EDF
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 03:58:45 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.5223.1724990319195080959
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Aug 2024 20:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T+EvwGqp;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20227ba378eso12032485ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 20:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724990318; x=1725595118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fK0YtYkpUf0vNmjhkwyFFlQfIuyk5+MsEohASgucC9o=;
        b=T+EvwGqpQ+3WQ6i9rn+i/cyAlW1IgoAUGPlVBPPczz+dta+jmQSNtLy1Ri2yaibx4B
         gUjBnUlhmxv0cOmOfMVX0bIvPqgV6/ojXg9aV81KsR4TbgM7NKUd7ePvEtdcN5NrOdJY
         /4V0f2b8qv42roW19bncgW7vr3RG7q5whtbE29d1byaaNffVdvnOP1xEHKM5dLD3jpbS
         d0Gfk4lohctFy5gcdJVj0l/4Ykmf6mjWn02WGg7BIwJOefsn5qGRuxi+OzcNO5ZDGTQc
         WZ0KaNBey+B0X/ucGXdMbddcGeH+gyvEiVv0w8cEecLsK6Tzg2cXSAusP64mP6ZiuC58
         mOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724990318; x=1725595118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fK0YtYkpUf0vNmjhkwyFFlQfIuyk5+MsEohASgucC9o=;
        b=lyhuVDLwXt/9Fk51MGK2Jy0IRmSenFybZhaZ0tTp9odS4JYnxd1lQS7ymq8gsi/Tpy
         LTfJPYYplePHzuZJ2kMwGMATvs/uQGniaSk3pHIK2FFolW/vez+wLqm8sLHEnkTXv6FH
         1j3+EbAK1BYVR6H+dO/24lE7WrWunL4HlyVD0woi9yPaSyEAycwjgbhoxo6HUu1VJ007
         D2xlPDp7NqsGn+ve6o/1Ks8R4g5Sj4RaBOKIGzvwqg4Q0QaPoaDM8OESKD7TriOIkiCT
         pmuY2VtYZ66j1Whj7CfPKkX+lQQOW+HMP4znUuSF3xKfNfSpf4PE1kp4oxRWb0U+wA8d
         eBNQ==
X-Gm-Message-State: AOJu0Yy3+MbkT+aSvNM9QKA4ZwQVWdJysebwijgk41tzMP9JWTODzDLt
	RP0u/EcbAtD6DhCtzBk4qID9cOI9iqcdMMrRuM9q5Qmt0Y218dsb1UgIAXD/
X-Google-Smtp-Source: AGHT+IFJIqyfCeXGjhkfvUgopDFja9DEwF2YuH6/m+vtRq3RC68wRFhUZgjU81M7EOAbDv3xHnQtUA==
X-Received: by 2002:a17:903:1c3:b0:1f7:1b08:dda9 with SMTP id d9443c01a7336-2050c2060c2mr66885455ad.8.1724990318321;
        Thu, 29 Aug 2024 20:58:38 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2052919afb2sm2705035ad.3.2024.08.29.20.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 20:58:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 7/8] vlc: Disable recipe
Date: Thu, 29 Aug 2024 20:58:26 -0700
Message-ID: <20240830035827.406391-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830035827.406391-1-raj.khem@gmail.com>
References: <20240830035827.406391-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 03:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112046

OE-core has moved to ffmpeg7, vlc3 needs to be ported to work
with this version and vlc4 is not released yet.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb               | 1 -
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.21.bb            | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 672c8abc9a..618eaa68d1 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -51,7 +51,6 @@ RDEPENDS:packagegroup-meta-multimedia = "\
     openal-soft \
     opusfile \
     opus-tools \
-    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", bb.utils.contains("DISTRO_FEATURES", "x11", "vlc", "", d), "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "sox streamripper", "", d)} \
     tinyalsa \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 i686 x86-64", "x265", "", d), "", d)} \
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.21.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.21.bb
index 6406343c8d..2d2ecc63b9 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.21.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.21.bb
@@ -132,3 +132,5 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN} = "dev-so"
 
 EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"
+
+SKIP_RECIPE[vlc] = "requires porting to ffmpeg >= 7 as of ffmpeg >= 5 it requires extensive changes disabling VAAPI (only supported with vlc >= 4)"

