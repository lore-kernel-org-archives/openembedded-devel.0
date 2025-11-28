Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A686CD116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 08:37:08 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11683.1764319024214088519
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 00:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Vpk1tdQG;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42bb288c219so1448604f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 00:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764319022; x=1764923822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zVdtYqcIL+5oLQ3JUeN8nRT/VBNwMufv+eYWxSxsN3c=;
        b=Vpk1tdQGcSGiF9++yXSV5WU4AqDG7Mu3Uainzc+2Nsi7+V9pwDMz0u3SKE7g+AQFJh
         J+WnMynzgxmVSs0rJsNZ3yjs90psKvzkdcZExZJMrMN6cGStQQXAhRrGTuPmBBGw7hyu
         iz+zJnSBFlpcH67nBxKfKRjRCmO/x4+bNd4lY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764319022; x=1764923822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVdtYqcIL+5oLQ3JUeN8nRT/VBNwMufv+eYWxSxsN3c=;
        b=hKdpg1WldLFllGpxpQ6QXqYvmzNqqJJy7nXfBsm5cGsrNawIgh8mnA5aR9K+n+CB61
         EBSGnq95NeMaDtXjI3JPeHwv526C0Z02cIlH6ywF+VGCMfr0kyPj6fNyHyMZUyiCk4Pt
         IUmpeUlopG/HZz0Lu/Erh9dXM09aeabjH41cKIaryMMtat/c4lstNJgpvwzlFUbCYWwX
         a4IznvQfzePKZeU99BzUHo2mhxXGElyNOo9cGFXdv/HGciBDEFTGKK5s3j1DS1H6zPqo
         EL9pyEAWJfz7kL8yxxHRA0w0E1wQw7tzHkRt+v7e60lMtgSra6epLRxoQ2gQfdISxYr8
         Nwwg==
X-Gm-Message-State: AOJu0YwHurmMZJ/5dTP7CdOqidDSX6v0Iui7BCvlGWi6cvmimcjAceu/
	cVH61Nhf4s/gElgrUsj3fvOwytu8//2myAZkyOP9Qsx3IfWZ6gEo5dnaO2PX/P6nZGv4Cbqk0aP
	ktpH8
X-Gm-Gg: ASbGncs+AfoVUr4cHV7iFE8Su5lQJrUo53C6QSJivOEdZU65X7suh/DKwwZGfjbYbnk
	wwHi56cB/TvtguMSoclzN7k18kaLEBxEvLXsjbXp+Pbo7lnvSsSK4Cz6/Wbn6XRpS4yB1q60dY2
	lgSA/3sTuvIaBtBuoyNaddTmFTnlIE1x04NkFa3MWk48+X22j3q0Qdjg5yCDlgyz5sAk5+3U1tx
	uGqsCDXDHqJojjBA4NMLRuXL+QjktAQAvzBOcGnwKGne6Iylx/pJbwGehP/eu3+RGh27bSZbb+F
	6AhpbKG/B48+KSYziIuAV3Q7LYq85P6cpR5OkQ1mvb78kb81wvaAsol3A1RNPH+nUJKpk/yemS/
	sSF0MxcAJV4pVPO5cRHK8CBIWbDONZOws7DMqBDeKG3HVypl0G+yzyfz9p5/GX/ucejZo+vsM2Z
	CCaqWkNxi6OwbO3Z5VrN1y53/7
X-Google-Smtp-Source: AGHT+IE11gcMLfFuUlM58HF5krDEKzLPGBPYij++jDfFXrG6twopuK+rioSFILF0XZ+DakpBmpaXVg==
X-Received: by 2002:a5d:5e01:0:b0:42b:3131:5435 with SMTP id ffacd0b85a97d-42cc1ac9de0mr27772244f8f.2.1764319021879;
        Fri, 28 Nov 2025 00:37:01 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1cab9af3sm8332395f8f.41.2025.11.28.00.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:37:01 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] colortail: Add recipe
Date: Fri, 28 Nov 2025 10:36:58 +0200
Message-ID: <20251128083658.1285605-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 08:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122118

Colortails is like the tail command line utility but with colors.
Add recipe for the latest release 0.3.5:

- Print error messages to stderr
- Fix memory leaks and Valgrind warnings
- Improve detection of file truncation due to log rotation
- Fix ./autogen.sh on macOS
- Avoid emitting excessive color sequences
- Output ansi reset code when the program is interrupted

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-extended/colortail/colortail_0.3.5.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-oe/recipes-extended/colortail/colortail_0.3.5.bb

diff --git a/meta-oe/recipes-extended/colortail/colortail_0.3.5.bb b/meta-oe/recipes-extended/colortail/colortail_0.3.5.bb
new file mode 100644
index 0000000000..bf31ee9882
--- /dev/null
+++ b/meta-oe/recipes-extended/colortail/colortail_0.3.5.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Like the tail command line utility but with colors"
+DESCRIPTION = "Colortail - like tail but with color highlighting configured via patterns"
+HOMEPAGE = "https://github.com/joakim666/colortail"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "git://github.com/joakim666/colortail.git;branch=master;protocol=https"
+SRCREV = "653bbbe3292759f5fb5ae9f769f131c1a320965d"
+
+inherit autotools pkgconfig
-- 
2.47.3


