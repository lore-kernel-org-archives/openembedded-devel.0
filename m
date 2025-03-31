Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B12C36017
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:37 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.3932.1743454894683095178
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KBB5hMzU;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so9153983a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454893; x=1744059693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHw6laaQwOxxpNWpmcLzmlte1Gv0X4A2rwDqGdhw/YY=;
        b=KBB5hMzUc/tYVZUCcnIjjmwvT7SdPWCv+a39L6jlWIpF8a4GlFZBwsgIZy8IC/V1uB
         pI1yRpE0ms52DV/RRpp/Zs84OtBAF6CNk4gFUetgxm6y/D4aqRkbvjUT5T7a7LXtbgtZ
         geqfjghAMGIqxBXtRZfAOW929jHgiCPjiu4CtiG/JmldOxclbK/++nXWARQfaYB8Udgh
         tT+NOkEnuuQKvabQ4ByLmyHr1RkHdR1q86EAC4yGBxXHLT8VKavqlCZh/atFBCNoWbuz
         YIhWqt/3sC4HkuZGSn7qRrS0WStGr6dUl0aMR1iKnkpUsin+UYMosJfrMJuaIlKxjMsC
         RPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454893; x=1744059693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHw6laaQwOxxpNWpmcLzmlte1Gv0X4A2rwDqGdhw/YY=;
        b=MR7hR6VtLyYhZji9+vU8ABO/CKtaQywNk7Zw50y6PGqk4lfXH2A73ncCcpSQ3tyh9a
         N8OhmkAExyFRiXYRwGYx19Sr2Jdi31sH9dD5UcbqeoA4htYytKhwJsHDJ9TyGFGPxzH6
         z/dVFPiOoyqd6NEopXDbCcZ4Q+0fTC4tD4V2aEkHtNvwQwt1krN0dRHwYGkn5JWNR0uM
         GZ9q7FAKXrFaJppbVz/SUnRD7McqBk41e7J1AI0rYt7mIpijR7mxszUY3ebhntf5syyl
         wFJ68FNxJ1zSbyRQfdvH24OXuatCUakTqGZ0wxJXFQdb35kHKDKJruNZuEqo6pq0T9n6
         aknA==
X-Gm-Message-State: AOJu0YzcPzvu/oz4xHvIhBhvKXtqHJYfr2ejyVyhq8ss6eSsdWTcqL8P
	M9JCDQ90lQPwz1GUU1nNJ3vuz+Ai2NjILWBWZzfgx635UZqoCeGGdbMgSVo0
X-Gm-Gg: ASbGncvV+tv6lyGgLITProSZ/uAJ2+rGtgaR7pWXTd2Odupr4qezYSoUmKluDOQtz+8
	bda9fRlC3y/iALd57+sgpop9l102FXr6St9p54q0gmQS2nb6q9hRKaslR2GKp3UFgoi0PXLHRmO
	9MoiacXX6de1BRb2E5lOgLvX/ufsYvhLnufcUYTZ2HRSm5YYql5Jh4OW1i5wy0q4IZiBAq0opWB
	ZcGKgBbYjZ6IkqFA240MZmPM/Ikvm51q6Mp6kDoRLoWF+UArIjGB4SsKEfsieZr2YYsbAaoLzZc
	PqlgiBTKckRhUwxq7tXm1rzyinps7BnCIlvEu3n87wGYQJ1+zAciWF3mThftAeF2fMeFJ/LeAG+
	wAg==
X-Google-Smtp-Source: AGHT+IFXh1mZPW9bhedayxVmn/ne0mWJqnlOOLXU2MlU5ylCmUusCo0y7VgSo8A68YeXyNTErd79hg==
X-Received: by 2002:a05:6402:2714:b0:5ec:92c3:58c5 with SMTP id 4fb4d7f45d1cf-5edfdc0184dmr6839315a12.29.1743454892867;
        Mon, 31 Mar 2025 14:01:32 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5edc17df8d5sm6106347a12.65.2025.03.31.14.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:32 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 19/21] fwknop: Specify target locations of gpg and wget
Date: Mon, 31 Mar 2025 23:00:59 +0200
Message-ID: <20250331210101.3460858-19-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116455

From: Khem Raj <raj.khem@gmail.com>

This fixes emitting buildpaths into binary and also
fixes the issue where these tools wont exist on
the paths they were found on build machine

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb b/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
index a1f56cdf16..7a8cfe192a 100644
--- a/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
+++ b/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
@@ -14,7 +14,9 @@ SRC_URI[sha256sum] = "f6c09bec97ed8e474a98ae14f9f53e1bcdda33393f20667b6af3fb6bb8
 
 DEPENDS = "libpcap gpgme"
 
-EXTRA_OECONF = " --with-iptables=${sbindir}/iptables"
+EXTRA_OECONF = "--with-iptables=${sbindir}/iptables \
+                --with-gpg=${bindir}/gpg \
+                --with-wget=${base_bindir}/wget"
 
 do_configure:prepend () {
 	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/config

