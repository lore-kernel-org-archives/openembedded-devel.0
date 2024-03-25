Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A2DC54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:27:11 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.52043.1711373224779582559
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 06:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=krIgPnih;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: jhatnedap@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-366ad40144fso11450525ab.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711373224; x=1711978024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kZqIDi13K9eaLyiQ/5P2Qt9Zc4uHX9/OoWPCdn7MfqM=;
        b=krIgPnih9c7QeXjwlYy6h6VUOy7VFAV8o35NAReOVX7eWuah50rEsFVLEPp6NDvK85
         uLustx/t8FZHcZ3s4SAKd52Kq/b8BZSFBIiTOdxXrSBX/w37EYRke5xd+svBtGExb3fO
         qifiCFvqNnz+OtCNMjLXxz6OzXwm913VgKWVTZDpKnBh6SCMnwvuyKBgfpnzLAmM2kVT
         Ew6mKKB58+u/SSwsPMaCE73Qg3NhKm3K+wBP/c7LgyFq0spDfWvejD25mMqiQu+8ZayH
         SstS+iI+L8gV/vh8B1MSW5CnA8ZFsJLkKZciKzS9lvH8XELXMPesoNoDXlw0XBMOjwPU
         +k+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711373224; x=1711978024;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZqIDi13K9eaLyiQ/5P2Qt9Zc4uHX9/OoWPCdn7MfqM=;
        b=bUkO9mQyCyCbMBbebwULuRUVfmX83EdBMkcLoTFhR7vzMkLB/rBui72Rwvq5EB2Ddm
         6dzIRgCGofMrujOuXBLZFw0NHTBbOCVUfFl4lqt7sykdgppa1R6MyZoYaSNTC4h3XaJD
         7+Q39WmnIrsZB+KNWKAsqibz0ylGcNJNNYweG8UprrHdnaTYUGsWdN4y1XhMErc4iNdd
         j0fFnkpYcMp6jrhqHcgijNEFd+0/s59kEdgRgXk8/UruvFLmsx4hiDOlJFxbYU7KDoBP
         liflst+gIu9y0xPrbJQ+mAOvIOWuO1jo21q3X9o6LUE+oH1GmkDEVHaRMhHRSvY0aYWP
         7F8Q==
X-Gm-Message-State: AOJu0YxBzhQWobGudBNVIBSZL0ZNCFPwhWmolTUBBnx43z0lfFJSSkvD
	zAajKXPdaHirLrri4U1iOfZeUpcjI2Il7UzDSbYXnP8s5ug3NgOU55yVjBVs
X-Google-Smtp-Source: AGHT+IHfVZSZgQyLsBzHWbmmIkcbeS0wf1uawKYbmf3RQwdCIvYaCk2bOvZ15ze685zD23tpu/wx+w==
X-Received: by 2002:a05:6e02:690:b0:368:873d:339d with SMTP id o16-20020a056e02069000b00368873d339dmr3980630ils.11.1711373224022;
        Mon, 25 Mar 2024 06:27:04 -0700 (PDT)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id q4-20020a056e02106400b0036862333c77sm2390379ilj.33.2024.03.25.06.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 06:27:03 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-devel@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [meta-java][PATCH 2/7] icedtea: Update URL for source downloads
Date: Mon, 25 Mar 2024 14:25:57 +0100
Message-ID: <20240325132603.2477-2-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20240325132603.2477-1-jermain.horsman@nedap.com>
References: <20240325132603.2477-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 13:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109580

From: Jermain Horsman <jermain.horsman@nedap.com>

The old icedtea.classpath.org URL does not work anymore,
update this to the icedtea.wildebeest.org URL used for other
download sources.

Also update both to use https.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 recipes-core/icedtea/openjdk-7-release-03b147.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index 16bf592..379fd9e 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -7,10 +7,10 @@ FILESPATH =. "${FILE_DIRNAME}/openjdk-7-03b147:"
 # Force arm mode for now
 ARM_INSTRUCTION_SET:armv4t = "ARM"
 
-ICEDTEA_URI = "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
+ICEDTEA_URI = "https://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
 
 ICEDTEA_PREFIX = "icedtea7-forest-2.1"
-ICEDTEA_HG_URL = "http://icedtea.classpath.org/hg/release/${ICEDTEA_PREFIX}"
+ICEDTEA_HG_URL = "https://icedtea.wildebeest.org/hg/release/${ICEDTEA_PREFIX}"
 
 OPENJDK_CHANGESET = "22cc03983e20"
 OPENJDK_FILE_UPSTREAM = "${OPENJDK_CHANGESET}.tar.bz2"
-- 
2.43.0.windows.1


