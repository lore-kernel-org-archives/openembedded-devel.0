Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489A8CCFA1A
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:57 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27216.1762704050477658264
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HxUqL2XE;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47777000dadso5251885e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704049; x=1763308849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pURnAyw5V7FO/q8otuFifsqdO/uC8OpYpPBMn2rjruo=;
        b=HxUqL2XEeR/z241trIhTutuHbc8WvjbFBMnKLkyt7cRfXbM2RhbA8zF5sqQsJMJBKu
         GdVOqtwjOkw2jPoBk98PrBkfTku1b7dVmsXDOuzsoeAek7iCYO1h3jzOuiCm8dqhOZc4
         EDG/WFA2WKQfiyMYDB8/StT6dAG79Z+QkWjdHfL2Xbknrxk14L3AKXwOdxkpFkIDJFK2
         dotfZ1bT6mBYzhg9cJYvmdSXcY8lNI3he14LEykk6Cw8OBYuXS5cnm8YtO1dtak9n3WH
         dVKAOxfkxKuRgFWc4JwLf6GCFP1Ax9/IgFko9zsfiiPi1HhjQKWnOuqQbQk43Is1u2Rc
         4JqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704049; x=1763308849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pURnAyw5V7FO/q8otuFifsqdO/uC8OpYpPBMn2rjruo=;
        b=hqw1s9l2aX+GKwbVtH3VNHO5mZ7Pls5syi5DKjtv64Wd5L12rp8IdvZAaPZV1qThZm
         0O2bIfUvQZoDcKbZph7RGwO1Yd+n3X38NWXOT/JCJf0juQONXkNbBuwlpQBQsjNAlrHt
         mVvdeh2/PdTYLhrXnaUQ46xb4n0LnZLSD18tcngZvl8YCwVoO4A3Jry97ZbyWdtJKq+m
         kP6lB+cgTHIsEAKJoOoVGyl3Yh/5JjjsFESsbqAmEnHsr9k00pjHH7cEiMm8403jVQ9i
         bdTMy3QhY9nhdc/ssoyVSLTfPb6FRHwf74XUytrFFbr6z6IXS0cYGfmbeqXfOYC6+gt5
         9Vrw==
X-Gm-Message-State: AOJu0YzjItGg8QWaNkn+qSJ84OHLMeCPhuTtaCOCPQR7hNhBfTsFCYiE
	TE2klM2jjkIJXuGWMOD5Ew1Q9osc3dcemBPRMSJBo6FpkxKsIkrCPRyOcSUEaSO5
X-Gm-Gg: ASbGncu7XgIBrViAEMxpsBz+nROfAKYpbRShefyA5oXQJPmXuOWrbcHSptRg6PUIUSd
	2Yp4VNEJyOIcTuEXAz5tRpFpbCG+W3Fn5re2N9FzN5ywV2tlQ3hTKgBHDUjC3ofQ82E1Y/aNeza
	fycZ8F32I3KgncvKMFUcLpRqFix4J1hMCDLBCY7XZE9titFlFJp1h7oHZhTUS5hSuMmL4ehpKEJ
	PdLmD/xDbGh/QWlrbcdtOmibxsXj1yVk+yA0NFV0nazQ25ht+mFdOTV6jKivsN+Hsp8TomeZ9TW
	VwEGTzYeY/IbuCRd6SQm4EmtvQyEqUtRLdHMiEhFmQlOHhPgB03OkGpzpdZOpl8iV/JWCYvVYTw
	dPMB1JI7y9/a6g48tmRXBnpUxHPbeIwqZNxlJSMA9T/35BQNIi3n5OefiqQ6+4qHZW3bTfsEMAQ
	==
X-Google-Smtp-Source: AGHT+IFFZDm6DqWjrk7hFUdyFf3PAIn9CKSyxY3TBrEwYul5iGpWES2rGkYV1gM+E/t6o2DP92QyfA==
X-Received: by 2002:a05:600c:3588:b0:477:7af8:c893 with SMTP id 5b1f17b1804b1-4777af8c976mr16429345e9.15.1762704048774;
        Sun, 09 Nov 2025 08:00:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 24/27] ncftp: fix SRC_URI
Date: Sun,  9 Nov 2025 17:00:16 +0100
Message-ID: <20251109160020.2522353-24-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121440

The downloaded tarball was moved to a new folder, causing
fetching failures.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
index 15bb00a3af..508a94ed2d 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
@@ -5,12 +5,12 @@ LICENSE = "ClArtistic"
 LIC_FILES_CHKSUM = "file://ncftp/cmds.c;beginline=3;endline=4;md5=9c2390809f71465aa7ff76e03dc14d91"
 DEPENDS = "ncurses"
 
-SRC_URI = "https://www.ncftp.com/public_ftp/ncftp/${BP}-src.tar.xz \
+SRC_URI = "https://www.ncftp.com/public_ftp/ncftp/older_versions/${BP}-src.tar.gz \
            file://ncftp-configure-use-BUILD_CC-for-ccdv.patch \
            file://unistd.patch \
            file://0001-Forward-port-defining-PREFIX_BINDIR-to-use-new-autoc.patch \
            "
-SRC_URI[sha256sum] = "d41c5c4d6614a8eae2ed4e4d7ada6b6d3afcc9fb65a4ed9b8711344bef24f7e8"
+SRC_URI[sha256sum] = "dbde0d3b4d28ba3a445621e10deaee57a6ba3ced277cc9dbce4052bcddf6cb2a"
 
 inherit autotools-brokensep pkgconfig
 

