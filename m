Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A2ACD1288
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 14:31:48 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6544.1762612304760343796
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 06:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VaWw08le;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so8464445e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 06:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762612303; x=1763217103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5LwgbqZEhOC0881zIDWqaH61g4z3K1hDdVnEx+pzFQ=;
        b=VaWw08leENqIDx/X4TjYOBXxmJ1QJ90YP7pC18U6BPjLriA1SiMN/TkTrpQW3TFd/E
         jdBXtUdtq4CkvIqZ0crRyiFtf4lCvXm6DM4B0JDe41+bwpBh9QYBgM3k/498MuR3GNXm
         xtH3WdMIy3VExj5LDyaePxRVb+h6nQRH5MUPH4/+4X1bP1c75WP/iRJ+/z8RQO3fKXoT
         6R6yzdLfN3YYVhcXHxuYOUQr3OdCw3kE92XQfDdI6uHFDkWo5s7eK1r2DoD8Q6On8ocv
         lsCDWYT/j7LtDcpm9WSk8GxtXtu2bGjhDbXAs/PzDijajxrOJDvVjxfIwmMVRqjWSSDT
         Zzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762612303; x=1763217103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X5LwgbqZEhOC0881zIDWqaH61g4z3K1hDdVnEx+pzFQ=;
        b=e3Z6V/3GrdJJ+FEuxWa68vWXo8hsOXj7m7+BjdQzE7gUy3S7XYLFjgXwWI9wxdGGp0
         yGGVHMnftcHxeGu42qm9vTrqnYkdNwvDBARXHQgEmBqbZKi41jmXdjPecuHgz1FTAMJs
         00fnWYgc0wYuJ3xFYl5zxzNfK1BOJxKuC34lPAnITbLygTN85yf8whOog7wESkHjLN4b
         rl5jQukUcLdDjU3jGdxHQunODHtimBY0HtaZMTZInuyjzTY7UJ8BdhliyjDFijf3spE9
         A8qiZIQMEdfF8bCIThPzZrRjbMij8Pvbr3DZeFqMB9fqQq0K9L49AKwTAdHbYgjOr//0
         MKbg==
X-Gm-Message-State: AOJu0YxhbPWmtoNfoPPzVHE9ZJtwEAlmjGibTtaA/PKpvHekiL5/rSpC
	ecTbllbCANTJlh9MM8CsQoOyoSzeKjmBX/uspgKK3cnjP7BfutxK4rnHJ6rs6tYJ
X-Gm-Gg: ASbGncsrW65cZYS3IJlspoKgUtsX+6dLBSRZR6EUdFIjTWSY2fxLFIbrlgBj0d0jMBn
	6QtAVc3KrA71MU6TftmQ23KAZ6cKV6/98gwR13SJCBjBQfMysHV1xW+2aFkKbNrMKRRv7cDz+DP
	gslVJy8JuHnN6HlGxybLGxPE8r9uhP0OANj0Pb2uqkRDU3mAsZ/1WwOyZrWVbanP3mUDVAVnRyd
	DtZb8mfDcIHpXZhY6vP4lEZkPKAibmVBpYu5SQnfNKMJfbu+YCWPEoQo7PJgB3npcqNMoBiEGCC
	IFZIcEzj4fYvdqmZFcjMeLZbm7N9PJf0qFiEIM0yHCqgXWhnDEHW2/YgKCdisj/PVId6+XCYWcx
	fLSXD7n6MpLTFJ8C0rUNwkMk/jIaeLWAXI6wko0QQD0rQiRTm44LdGofjdjECrGZ04pILw0nsoQ
	==
X-Google-Smtp-Source: AGHT+IEy364UriLuDsGIE397HhpMj2T47OWM4/pgrciCEnoYEaG2bDnypSVxHJ1RTJf55zHxXmdCUg==
X-Received: by 2002:a05:600c:45c7:b0:477:3012:d285 with SMTP id 5b1f17b1804b1-4777322d972mr17921865e9.3.1762612303034;
        Sat, 08 Nov 2025 06:31:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b322d533dsm1012211f8f.0.2025.11.08.06.31.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 06:31:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/5] ncftp: correct SRC_URI
Date: Sat,  8 Nov 2025 15:31:38 +0100
Message-ID: <20251108143141.3117797-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108143141.3117797-1-skandigraun@gmail.com>
References: <20251108143141.3117797-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 14:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121390

The used version was moved to another folder - and was also repackaged
with gzip compression.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
index 6b62e135d6..c97fbdfe66 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
@@ -5,14 +5,14 @@ LICENSE = "ClArtistic"
 LIC_FILES_CHKSUM = "file://ncftp/cmds.c;beginline=3;endline=4;md5=9c2390809f71465aa7ff76e03dc14d91"
 DEPENDS = "ncurses"
 
-SRC_URI = "https://www.ncftp.com/public_ftp/ncftp/${BP}-src.tar.xz \
+SRC_URI = "https://www.ncftp.com/public_ftp/ncftp/older_versions/${BP}-src.tar.gz \
            file://ncftp-configure-use-BUILD_CC-for-ccdv.patch \
            file://unistd.patch \
            file://0001-Forward-port-defining-PREFIX_BINDIR-to-use-new-autoc.patch \
            file://0001-ncftp-3.2.7-fix-gcc14.patch \
            file://0002-ncftp-3.2.7-fix-clang.patch \
            "
-SRC_URI[sha256sum] = "d41c5c4d6614a8eae2ed4e4d7ada6b6d3afcc9fb65a4ed9b8711344bef24f7e8"
+SRC_URI[sha256sum] = "dbde0d3b4d28ba3a445621e10deaee57a6ba3ced277cc9dbce4052bcddf6cb2a"
 
 # Doesn't use automake
 inherit autotools-brokensep pkgconfig

