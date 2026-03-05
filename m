Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B8AF47CCD
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 20:18:07 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53709.1772741879277929419
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 12:17:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NR8JjCYW;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso72706905e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 12:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772741878; x=1773346678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpXwzlQmRUHQU0SDSm14H1qfl1b54pguyUXaIkcUXn4=;
        b=NR8JjCYWroO685fDxA39eLmepfOk6J64YibntidcmEEFFX3VGc18hDSH9z/hg6FGW/
         bnwFoISbliuz//uWeU00URpLzK2LB6SldDGrTxSKcl+KgFxAoulSJq8nylncWpb71kQi
         syejobDlSDASxCISPu1+2MCTGGHWTbrKbPLVtE3zvsiMgdw/6xsCjXBgVCYYQpRUcfzu
         nM8fojqYjhqOVaoNJxSq7bxPtwf4xvyQYWh4Jof+W9lTa6nHbXBvchoTMPwvAQFIuWuE
         5z5S/hcJfYVJzfvACXT4aOsjLYrezBPxbC59gT1G+gd4mjTxhooNfAbBmxXi3c26Yz1i
         F04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772741878; x=1773346678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wpXwzlQmRUHQU0SDSm14H1qfl1b54pguyUXaIkcUXn4=;
        b=e6x//cVuIeg3mdsDNeGTx7d0yDHCR6le1tqLy1PuYjxt54r21cElPW9krCq5er+1fa
         0Q8Nsm6b9+fNQHlDqqdeN8S6umvSqDo9XB3lBVJrXbu1vg/u8bW376/PX19KkBTSCXyi
         CIu+tXXim34Qfd50I3CDMnaUPd7XGp5xn0Nk6lwt8tfau4I0Ls2zpS9Ez/1B19yDfg3U
         fxj6nYEDaPpICNy5INf/e7s5GzEFWg8Iot6JljucyMVRahHCgTqOTh+Ins7XRoT8f91A
         3bjBJbNyD0OZuXzawdzfPiQUy1HE0LaMnAwGzOcDSzWgA1AG3H3ODmHRTk5LptOzODq/
         +nKg==
X-Gm-Message-State: AOJu0Yz1CcXPYQMfDcxL3MJh0l5fA13jaX6PRbg4uGaYv1Ave0uZmr11
	Bh4XWacQQpj4ash3QJifQqW4/D2Y3XsOTcjKFdxkK7VHshhstKMQrni6Kgz+fQ==
X-Gm-Gg: ATEYQzztYZSwrIR5ajzh4EkPRzR6ZEohNOxP5lAB1eYGW4fnrAWrqxZDKnQyd+yOL/9
	8Zml/8OFdue+puXi/UUPw2q2JSi1DezoDFmbsZ26YG5uOwZ6x479rKbV8L1gnd8LXv3XZVLEzSc
	COd/zyM/lYlnIHNf5lBM6lP+8QcUpJio0lXH2ZODTem9Gb/F5zzcWMc25YtW8wVl0bOIfR4UfVZ
	RyVuv3FPNFSrZTa8NZD1jLZkTUViNt5f3aYJHmBz1GujzS9Cd4yLGnwF70E5j73/mHcJLwp0ZfH
	fU4lIIlwZEKghyXuZ2F5A9LA3zWDwvtN8N8Kx9TYpoX9THQXY61N4E5c+aJEOA4eQssz1jKZi1W
	+yfHvv6xbA6S+d/R3i0PzrVSY27TwwKkhB4p8uAbdTZSfg/PwUijUHBaIMCEi6OzwNyyNiq8vSW
	xlyXGyAWT+wBxNpYqd17DJ
X-Received: by 2002:a05:600c:4e41:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-48523606f13mr12139635e9.35.1772741877431;
        Thu, 05 Mar 2026 12:17:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm120009585e9.9.2026.03.05.12.17.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 12:17:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/3] ngtcp2: add recipe
Date: Thu,  5 Mar 2026 21:17:50 +0100
Message-ID: <20260305201754.151603-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305201754.151603-1-skandigraun@gmail.com>
References: <20260305201754.151603-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 20:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124895

ngtcp2 project is an effort to implement IETF QUIC protocol

It is a dependency of the new Samba recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-protocols/ngtcp2/ngtcp2_1.21.0.bb | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.21.0.bb

diff --git a/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.21.0.bb b/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.21.0.bb
new file mode 100644
index 0000000000..f71de5aa07
--- /dev/null
+++ b/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.21.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "ngtcp2 project is an effort to implement IETF QUIC protocol"
+HOMEPAGE = "https://nghttp2.org/ngtcp2"
+BUGTRACKER = "https://github.com/ngtcp2/ngtcp2/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=de0966c8ff4f62661a3da92967a75434"
+
+SRC_URI = "gitsm://github.com/ngtcp2/ngtcp2;protocol=https;branch=main;tag=v${PV};name=ngtcp2"
+SRCREV = "9e32add590fc74707b62f61aa5e0aa5c6f8a2c60"
+
+DEPENDS = "brotli libev nghttp3"
+
+inherit cmake
+
+PACKAGECONFIG ?= "shared gnutls"
+
+PACKAGECONFIG[static] = "-DENABLE_STATIC_LIB=ON, -DENABLE_STATIC_LIB=OFF"
+PACKAGECONFIG[shared] = "-DENABLE_SHARED_LIB=ON, -DENABLE_SHARED_LIB=OFF"
+PACKAGECONFIG[build-lib-only] = "-DENABLE_LIB_ONLY=ON, -DENABLE_LIB_ONLY=OFF"
+PACKAGECONFIG[openssl] = "-DENABLE_OPENSSL=ON, -DENABLE_OPENSSL=OFF, openssl"
+PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON, -DENABLE_GNUTLS=OFF, gnutls"

