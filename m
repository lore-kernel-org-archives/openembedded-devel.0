Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBB7D3C55C
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:27:03 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15652.1765373216730860242
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:26:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kz4zh1bs;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso8782184b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373216; x=1765978016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGXI7butE2xkNWG197QiMA9YS8nXPjzD7e+QnlAiG0E=;
        b=Kz4zh1bso6osEzxwXFoNbzVwVPFOA1sZkRklYw68TXz+WTDZ/DOSL9yyDTfmz9m7Vd
         7L0WLJVuXH9nmU1DrGFWirR5GKFOkHMRg8KxekRYhxhNUB6iRLOrqX+vqItSbJnTwi6I
         bzG9UZWKdFCPxa9jYKPRbIWbDxPiYV8gG4k7eSzMQiZU+Lhk0bA4+Y3FF5TuuDvjhTY7
         9hhDQf978qAEAIDLMEgvzbQdJJ7VwGWJzEZmWa7/BCcLhahLx82cZBm/gCXUz7Oo22HA
         XQ25gwa/qq/nDr7OXaj/2HBdUq3F9+ai3U1d0XOMl+LWm5MhRs0V/j20PR7Y8ZUXSixx
         GYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373216; x=1765978016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OGXI7butE2xkNWG197QiMA9YS8nXPjzD7e+QnlAiG0E=;
        b=QJzW26kFMX8NTEpUCD+rl6lwebi7jvWJ+HkOAmXO4lEZcMRS6kZSKLsNpg7vtknx/r
         AEthNO4mTp+qd4mKamvRhnuh5ShXoZRhAsyZ5BZaAnun9l39ZQ2LfsEr3nv/V8eTUqEX
         Migj1Lf+gX8LpPeD9MHMW3AfTRpSe8jett0BUOTn8Zj+JLLzudR8SbADLAFK7oX1Dhp4
         HJwA5GH01RqHVJApoPsMlHZHVZAZy0pN4DSS221FXbWBoEv/L5helOFr8V7YxNmq6VSZ
         C98HKl96VbfnFixir2J6IK/2LyiLl/J5C4iea9N7iWAhOA+CZx14eqM6Bky1dt6dt4U7
         cTzg==
X-Gm-Message-State: AOJu0YyhrBPnYPf5j5jlVHnxmQ2SVq+2tZNcOyz30D8CAnQgP83cfaxl
	JQJk6BHIAmqUxjA1u+e7qOdf36uyIKaHKjIbdmnREUjakt/z43FwEr0KATsyXA==
X-Gm-Gg: ASbGnctk4uymeGowpZFqytWvAsQdCVTmdr5PzMoB/iIyMH2BcFCZl03LJDeH2jw0cMv
	00rdzY+ZJrdKdGvJlKiLjcXdjN1+y6PlnOGSU1+/dpjcDmgYecbTAE9qUIfdYkbZMjD+5n8MSol
	0+Hr1E3BF7BUw6bJFC3X3U4n0IufAqlRjwTqrMlUV0+i2P2AUd3lcggLL/Y5BfvE7AVDvePJcHW
	KqTX5ysroxU3vuBEuReIIXNUz1Exnn082V7gzi/6cXeYhRlQiQV5ocdNs+q+Kjj72/t+IrC+Glh
	FbdgOTL8e2+R6eBYEygVxCvzhfFEkXK59A8vxOAmxcm+LBdUEQGOYf5N1uCyA8PXNuIr/INBCwE
	ZOVKrYAU6YvhWSQIWZlRjDWpvcUlOiMvYG7aCOHoX+lGvzLksmJJFg3zr6OMYozK/yAJv2p0Fux
	Ub4yMaE1iQZvtsBhKQrlcY6U8=
X-Google-Smtp-Source: AGHT+IGap89QT8aoGTERqlCy/KSN5LQXu6mXkDKW8CMJo49jayp4EacFaxYxidAAw+oMidyAtZ35SA==
X-Received: by 2002:a05:6a21:32a0:b0:342:352c:77e5 with SMTP id adf61e73a8af0-366e2994d31mr2235398637.54.1765373215845;
        Wed, 10 Dec 2025 05:26:55 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f20bsm182972465ad.46.2025.12.10.05.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:26:55 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 29/43] syslog-ng: switch to libpcre2
Date: Wed, 10 Dec 2025 18:56:35 +0530
Message-ID: <20251210132641.323679-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
References: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122533

From: Hongxu Jia <hongxu.jia@windriver.com>

The syslog-ng used pcre2 instead of pcre since 2023 [1]

[1] https://github.com/syslog-ng/syslog-ng/commit/cb6de08dc9078644d48ca536b5660e406b1a50d6

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c1735e638af0de53e00c8403532a4463e4b3a110)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
index cfc376ded1..3d8570122b 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
@@ -13,7 +13,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=924958cefc9f7de3e0b818832b8a1cec"
 
 # util-linux added to get libuuid
-DEPENDS = "libpcre flex glib-2.0 openssl util-linux bison-native curl json-c"
+DEPENDS = "libpcre2 flex glib-2.0 openssl util-linux bison-native curl json-c"
 
 SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
            file://syslog-ng.conf.systemd \

