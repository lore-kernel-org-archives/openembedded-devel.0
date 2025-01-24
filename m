Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38D9C02182
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 00:48:38 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.1344.1737679708687601984
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 16:48:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IJI3JKZ7;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216426b0865so25238135ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 16:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737679708; x=1738284508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r1XjTUixg94mlLCAaqMPqQfwFTQw+CcKn2t7aSmsWqI=;
        b=IJI3JKZ7hG8h5dI5yEJj3ma1/eB4Z1HX14BozrPu/V8oIXyAI+s06z+eshM5h+eUDk
         K84KVkDltAgUYoq5XBPILc8R0SnMgDECC8Xuz9tMwMMypCnmqpRTlN0rimLPGDPi4Tli
         drmOG+VOlZ8ftX77K4oP2Qc/z9pSNpkvYQDuAdMKFHAPkux574SF/hjE7xkrsngK2YSu
         4iPaH98jfA2VQJCzBCFXCy0ljI65CJh/aCAFu/jV26oW/PsshOpjBYDl+EQ+UgJj3q61
         cR/F62+zWD2+YjIeXn8xCen05mmnexoSJzN9pj4LEGCSpmnqdo+WrIt3A3nf2o2YXqp8
         q6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737679708; x=1738284508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1XjTUixg94mlLCAaqMPqQfwFTQw+CcKn2t7aSmsWqI=;
        b=uX/WS2D90U3PsP7UgkCbFlK2NOFHrBQibjJ4xe84tikBzXyJG7xU+3lSRcwwbQOdO7
         e1qLE09iezKgw1KsNQt5YvivekhjgCP1Y7DUZgZ+hj+dJDSgKu7EECSX3sx652yPKKKY
         X5l2+npZxX5SUIgn5jrjZI8qrLxoqhWxLT8kYK6wnaiZz05UvZxWbAAq4pQ1P2jrP0Yq
         mRNU8L2wII2z4GKCxhS1lZntbmSD802iMcWdVzb1TjxhM3I1PLY7NBb5ONa4r+kI3kH/
         VAPEhd6iWr9DHeDMfUgF9ph9FHeiACdFRAXdnebh8coOrhhVH2rrTRkcWgSbk6eoRiF0
         xGvg==
X-Gm-Message-State: AOJu0YyGAbPoUk8FINflONiCiIIA9JWiDr9Mru4ifzzCGODvCrIAvT0E
	g54hLzg76tY1jCROk1Y40dB/HX4soTTv7UFlnv45JCAJWFAU81vsorqartIR
X-Gm-Gg: ASbGncvkcwG9SObV+uLwIK+Zo+V+9hZTvUhahwK7ymdTrKHqxm83PCQMbbQdllX7yCF
	KmsxxsA7YHdESOGMM84IX4hx92eFuyX5QVuNq4h4UZ+hNSQ26Dj1UuM5RP5/h9JaZnCkTqpSThE
	SVQHP7+ry879ydSaY50aaQNxr6VUwZCDb82TTb7rUiRnBdnDO8jViQZyIZdZuRXW3e6RkxVsnBU
	B9//+jzvBDSDxTpYIRzdE9rwiTiiAcwI0/WFQ4QlTE4ySu1H7Jrc0y+i3QAzsVBxUhRAAUh
X-Google-Smtp-Source: AGHT+IHWjWEgVYeBBrM7rElgvRWAh9EAZWW7wyp2b9jOvMWcmFk4AjDNhSiwzOMfSDvX+qAqhqlLGg==
X-Received: by 2002:a05:6a20:748b:b0:1e0:da90:5f1f with SMTP id adf61e73a8af0-1eb21485391mr38426732637.16.1737679707786;
        Thu, 23 Jan 2025 16:48:27 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::d2e2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac48fe53bddsm475599a12.25.2025.01.23.16.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 16:48:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/5] syslog-ng: Remove references to ACLOCALEXTRAPATH
Date: Thu, 23 Jan 2025 16:48:21 -0800
Message-ID: <20250124004825.3525640-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 00:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115040

ACLOCALEXTRAPATH is gone in core with commit 878e1517d4890b31332a506ce903d57e1d7dff87

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb
index 588a38126b..7ad7ddf381 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb
@@ -68,7 +68,7 @@ do_configure:prepend() {
 	olddir=$(pwd)
 	cd ${AUTOTOOLS_SCRIPT_PATH}
 
-	ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} -I ${S}/m4 ${ACLOCALEXTRAPATH} || die "extra autoreconf execution failed."
+	ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} -I ${S}/m4 || die "extra autoreconf execution failed."
 
 	cd $olddir
 }

