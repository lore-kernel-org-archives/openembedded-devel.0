Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DCDE69162
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 19:41:54 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87250.1766432510001813885
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 11:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V/S7iKuF;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477a1c28778so49584345e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 11:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766432508; x=1767037308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCIhvKYBBEQERuLxhjCETndSRf85W15NyANLi0hSW+k=;
        b=V/S7iKuFJAsM2ipnvbHjaZ42xzxWONgzTbn527bz45xar3EZUYKXeZlEEUx2LR+qOR
         mpvL8q6VUtDdcK6hnrAtTnxMXZj+HbF/nTaq2skxFsgHN4pRNfVbR4DyMvzN8gEYErqG
         /V1IXL6GiL1MHJsLNyTY52nsXAMVjAsaymIF9opTP71wUroHrBJPf9/L87dAsSB6dbeY
         aShSKYOJl6aRVlG8Z4CAnzMiXGmzQDLdVyaGLBZ/WtaAAwnMXlUUaK4JPVA4/3G4F8bG
         9wWIo8nmrcn2dHI9UGNxmvcgQQtlBLLYS4l+podVnloHiBVxub29HDwTHc0C33iDY0NR
         g8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766432508; x=1767037308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wCIhvKYBBEQERuLxhjCETndSRf85W15NyANLi0hSW+k=;
        b=sXRFxNNVOLsMdNS0r05/QTNJIiWPAj5gO38bSQXXK8N2lTblHRQt/DK1dGOYC4eDhT
         7yZ0vkuSoJOXSHlsRToLAs0kKMoJCgLi56RFjXnkF5v28RoYpVqYyiDEOUM5t6ylGK8h
         OK9vIxXzTe31YRAEqbsP2SvR4g43VxQDh+T3n+k41MybxoodXiG4oYWz52opuU/0Z+2P
         idhDDO0GR01O2nlzQa4FHAUVfNjRNIZt8JpO54dlTf8XwUMamgk04NvHOggCcfdUAFm9
         DJ1ABqnOjlPIR2GNxrO9GdbLlr5LckfV9445xZcufPPTqd+X1iy+MxLcTYMYp7eRYSO/
         u3UQ==
X-Gm-Message-State: AOJu0YwmCO7tyM0/OHaRoVjqw60kmLbXdln/clL5I67xM/Z1tkNarwtu
	t5fWRzQWxlCayrwcQGFnoWLPO4vp0D3UUgFFF/MaGvsai8RJoH4n+FVQX6KCjw==
X-Gm-Gg: AY/fxX6QL/NSIHUDJ7njEloIG9+OFHrcPyfVa3atxOkJctwog5Po3n42SrrcoqoYbVF
	p2LOojz/V49yL2untgObU5TlRpjek72JgPkrE/mSCpE9fmqx2k/vWo7xYZ6Mvuh1cnAnCqbPNTO
	/BIVYEbAZyJMgF3i6qptDHuaedlnJkkTEyGmxAd63t0E9Vag/YbouYk+d4H9wvgcYVr3VamaxUe
	mYw6Xkv0np4v3DGJkmLQwSfHzKs+U+c6dDmID3YllBa/quLO30TUVQ6IjJ9VbJOqrSFmrWmtop8
	hTXvphMX1gYoEZJ2T5bVc/d+1RjKhxsQjOHMsLQhwflWhTN0lFExrRAvx/hD4TxaOW6JIOqQC8h
	nKC5SrdZQq0qYZpCi7NTR6/8e3gmcruORkZ+b+OCSIg3LL7nVTfvlaOB5PL978dWN37nE7olrwd
	ZZOGuaJfZV
X-Google-Smtp-Source: AGHT+IFWJP2Uz4mN2WrKfiR5OlT9+ETfNT2ag1RnTtoEXQCaSKBFlqttW+vA6438DiHnwMWhaFrniQ==
X-Received: by 2002:a05:600c:4709:b0:477:9aeb:6a8f with SMTP id 5b1f17b1804b1-47d220b7f4dmr89133905e9.9.1766432508336;
        Mon, 22 Dec 2025 11:41:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm24064349f8f.27.2025.12.22.11.41.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 11:41:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/4] ptest-packagelist.inc: sort packages alphabetically
Date: Mon, 22 Dec 2025 20:41:43 +0100
Message-ID: <20251222194143.1725064-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222194143.1725064-1-skandigraun@gmail.com>
References: <20251222194143.1725064-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 19:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122803

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 4381f6c2b2..1f21db7ae1 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -9,6 +9,7 @@
 PTESTS_FAST_META_OE = "\
     asio \
     audiofile \
+    cjson \
     cli11 \
     cmocka \
     cunit \
@@ -29,6 +30,7 @@ PTESTS_FAST_META_OE = "\
     libjcat \
     libio-pty-perl \
     libmanette \
+    libplist \
     librelp \
     libssh \
     libteam \
@@ -51,14 +53,12 @@ PTESTS_FAST_META_OE = "\
     pv \
     sdbus-c++ \
     tomlplusplus \
+    uriparser \
     utf8proc \
     uthash \
     xmlsec1 \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'xrdp', '', d)} \
     zeromq \
-    cjson \
-    libplist \
-    uriparser \
 "
 PTESTS_FAST_META_OE:append:x86 = " mcelog"
 PTESTS_FAST_META_OE:append:x86-64 = " mcelog"
@@ -72,8 +72,8 @@ PTESTS_SLOW_META_OE = "\
     fftw \
     libusb-compat \
     mariadb \
-    rocksdb \
     re2 \
+    rocksdb \
 "
 PTESTS_SLOW_META_OE:append:x86 = " kernel-selftest"
 PTESTS_SLOW_META_OE:append:x86-64 = " kernel-selftest"

