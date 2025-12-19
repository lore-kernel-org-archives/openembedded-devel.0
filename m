Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA9AD711D5
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 01:30:35 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7878.1766107826806159843
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 17:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DP7iBMIR;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-640c9c85255so1252579d50.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 17:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766107826; x=1766712626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aH/nmWSl1b4VfLhxy47wrxtse7/XFqPVjr/SqUbAGus=;
        b=DP7iBMIRNdSqQ7VGCf9EtodmQ+uHy35u2SsC0sf9FbN9v6CjWj9Q8B9VRo2d3N4DH3
         ieFwTe+XOQClGglyxAbaBYLK5iBO+R7iOEVX0PLLQjnR8XCTUAf9iDr2t3WCZaRwOM93
         zmHHUjmhPp3apT8VWMjgA/C3J9/3jdV2UtjjG8EOUBs8bmpoOKeseWNrejT3qS3uF6vW
         uBBJEGa5uC4hxS+InMdafNrv2nso9qfuowlgU1XGMyoBBNCtCyFUDbAjuo/KZGRxoDbU
         lt/jzSWEnlZKJ/Xr2L3aTBgJyegca6IJipPrZ2VF5UI8pHX7m/FiL0SPfmhbDzWZ3l4G
         JbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766107826; x=1766712626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aH/nmWSl1b4VfLhxy47wrxtse7/XFqPVjr/SqUbAGus=;
        b=ZZyNTrnbH+g4+nf4gYD8IbS6k+8W6L72tWLcKEuxeFva/MO1qn/vC2H13do6HvFJuV
         NwqDq8N/IV3TNrIUXfjO66kv2/YKn4V2ujg555R+l64yAdY5w88UkvG/7Z2FayL/Fw0n
         p0cmuZ/ug9IV4E55HzUYa943LzSrLtelYeWFl56nnfYiH09HK11ePKdLKuej5luQ5tRU
         Y5nN5pHk6t9A7lMRvaVt8WAZYjmTVD1z0txHG+jvKfJDDPaCtyWVBKUxksRWyBgK+yfh
         vnHghhIx3+QkNm3o1voqB8l1lMrHTukvx3p2yrTmIMvXJsFO7Cq3yyDMVJpZV+gqvFPn
         GVug==
X-Gm-Message-State: AOJu0YzyDt1NCjwJ5BG1jQc9ZrH7EF5QnQ5aOeJdWXSCKctdeHWcU+po
	OQv1mVkqvKHIp8wgUqi7GLBX5FV/biGD7lSF+//MpSy63F3Q3+mKO97618qR6Rz+
X-Gm-Gg: AY/fxX6gz8lputGgJScLQWbT6qlqwouEO6S1wplL7PTGT1j65P/G7T53xf4cc5idYJ0
	zjV2tDick5QBnOygxyB1TF3jFFGWhfWbE2iYDIKBKFKJ9hfOqnOvFkyKAsrbOcj1OUJzYZs5dGZ
	b5BlHGweMVwBFDFy5rEI2E9dq8otJddFoHsuE33pA1aMkoRLuQUBeEbBKpgJGtlOTBuPPxhyp90
	HfTuocHUFFvc1JB8MHL2uco6jQOzArB1AYTRKEtpR4fWAb8PdTB05ZaejNp5vRe5HHIF5TShC/T
	eVPcexY247ZxmL4goTjf8Xgu4U8b5cRf5s1tZfx5WlOhfu+S/xujMoWIzfJziL3kHDY7f22M/oG
	DW+QX+/FQipHuUQWPeGq8AVa8s1SELmnI45Rls32WorlMA06UBO8MXt7r49Ks3EYFLpMF2aer60
	Kc0lr9BjaeIl6gmdyw3EV1mkUcNIzcPrgtfizrqbYWxfhZDg2VWqjh/YIOpqPdPHFcrs9OxPyzk
	rrt1KXjLjY/GQkhhoImMqHnSzj2+naZo+sK
X-Google-Smtp-Source: AGHT+IHILdbxVm4TG8t0J9KlplAgvmHsXF3cmfnSylzleJ3/EQ1KQNyXOvp6JDSsc/+Vub4RYrvnmA==
X-Received: by 2002:a05:690e:1486:b0:645:443d:10a8 with SMTP id 956f58d0204a3-6466a8bfa9amr1097986d50.75.1766107825511;
        Thu, 18 Dec 2025 17:30:25 -0800 (PST)
Received: from localhost.localdomain ([71.3.192.67])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a8bcee0sm511296d50.6.2025.12.18.17.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 17:30:25 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.5.0 -> 8.5.1
Date: Thu, 18 Dec 2025 20:30:09 -0500
Message-ID: <20251219013009.1028317-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Dec 2025 01:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122772

This is a security release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.0.bb => php_8.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.0.bb => php_8.5.1.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.0.bb b/meta-oe/recipes-devtools/php/php_8.5.1.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.0.bb
rename to meta-oe/recipes-devtools/php/php_8.5.1.bb
index 6db7ee7c82..c3abf58ad5 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.0.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.1.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "cd16cb045b34a6cec6a83008e1b335f365c7a832fcc483df82308664c6d021f9"
+SRC_URI[sha256sum] = "55f428c426e7241752ea9afff160bb64c32a9321cbd6d17d1c145b8df8823737"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


