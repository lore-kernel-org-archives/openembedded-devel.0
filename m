Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1218CEC0467
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 09:20:17 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14354.1772529610394228832
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Mar 2026 01:20:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L8szZBXe;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-824b05d2786so4423083b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 01:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529609; x=1773134409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdme63zalnNIMZYrWs8BSddTpUME8w7Ar+3NNn8Oymg=;
        b=L8szZBXeJ3bRaXMyLlJV8Uez4x/s8Vj+GjwjyjLGsuQqqWXg9wujJsQ59t7hl9lTh3
         TE5SkJH5zjtCnHOOLcmlyRSOdFW2uF114OVuPfyHbHDwShz5imAZLh6wIWol2JLt5/uW
         2qOnCsEJMVrxUDXgXBHz7dCFahiocxV8m3IB/ldPfPza8VbSwRoGOw1Dt5UNFYuodudy
         9CxrqR+QUHBWsT2kULlZgEFuKkuNjaPzBAgv/FMf6zGmGYhu2M9jeIkL9aBPBvpqS2cf
         xnwuUbJ6DRh1ziCYvn6Csi0jeuivfp1TAMLqrudB6scs/plc3mtOeBB7MhvM1enZewIp
         H5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529609; x=1773134409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cdme63zalnNIMZYrWs8BSddTpUME8w7Ar+3NNn8Oymg=;
        b=RZSjuynQxLomut1HNd1sdbhojqxmyX6HrerXv7u7i0pDD/Jsx2xVZ5ezYIgtr8Oc/0
         5GWU9kCfbDVHDNbjNQkFmk8nw5bZHt/bw4p28krlEZnshirdUhkcfEk+RQTb/eENYrpg
         GCq0daCuZpqTnozURBIkiAkNzrusCLp5jfHOiyL7ueMVv81ClCP4TIF4uGng1UZOMDh1
         81YXVS5eQHK/BGvabIR8Krp4/yjkpq1QfJwyB8ApzC/s+rUZbdQCXHattp3rNyaLLMoC
         CjmF6xzNVjaBX/Xyb+oqMjI0WRyQovPEailvkr1EaV+Gpcn1w/SbGjKoltDi/rLQKdlc
         TV+Q==
X-Gm-Message-State: AOJu0YzkC+pQEpLDrUF8OgmZ/WDWhAShxcR5EA2AQyr1y7YuW8x/ggcc
	jUCABNMNkiYq2fgUU7VxQ9fAUA6FdREVUVuTZ1OoHSA29wS7FsyJudSaYJWseg==
X-Gm-Gg: ATEYQzxC2LIG7WU2ctCs+G1stlYzypG7Hj6+qlVQrfysRmbyM0mBjDJta+oThY1DJoa
	tWkS4SH6/ZGpdyMvq8bv8FlrwaQ4rJGv3HZWmZ6nouvBrG0buIDQt2lVIkGq4jw+xjbXMBHFvX7
	fBYBb5oGcz23S9NfzcM+YB2gsgE3SbWJtmVF+BXEWZOM8DxiRGiSoVpGP+aYe15ChaC7gesfyJ9
	R/cIEMAFxzG4VFj23gI5+fkJPlmuZUv/5LFDPRuFtcPvesxgJ9Vi83wyyO3I67eWUaX7u96DOVz
	5TD9ZkQvXaeOraogySr1D4v8VHwQbhSYR08D6AhQOT+F6zrDbqPjoHtXuyeFCLhWbCmqWFtRWeB
	CLteQBxoEGGPqOr/cN4xO2xX8VUP2LrNoO1n5goAAWAJoERqIeTM5tobh3RSVm5HS/uJNcyLWL8
	qd14TqFkwCDapWxYagJYwB9zuIPNxwQYxS+w==
X-Received: by 2002:a05:6a00:9283:b0:824:a635:4181 with SMTP id d2e1a72fcca58-8274d972aaamr16821917b3a.15.1772529609389;
        Tue, 03 Mar 2026 01:20:09 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a05e831sm15677859b3a.58.2026.03.03.01.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:20:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 3/3] python3-flask: Upgrade 3.1.2 -> 3.1.3
Date: Tue,  3 Mar 2026 22:19:41 +1300
Message-ID: <20260303091948.3532301-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303091948.3532301-1-ankur.tyagi85@gmail.com>
References: <20260303091948.3532301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 09:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124829

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.1.3:

- The session is marked as accessed for operations that only access
  the keys but not the values, such as in and len.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0badc6de53e06045d943143ef70773d6959f1a08)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-flask_3.1.2.bb => python3-flask_3.1.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask_3.1.2.bb => python3-flask_3.1.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.1.2.bb b/meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask_3.1.2.bb
rename to meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
index de4a558bff..a24aae9e4e 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
@@ -1,12 +1,12 @@
 SUMMARY = "A microframework based on Werkzeug, Jinja2 and good intentions"
 DESCRIPTION = "\
 Flask is a microframework for Python based on Werkzeug, Jinja 2 and good \
-intentions. And before you ask: It’s BSD licensed!"
+intentions. And before you ask: It is BSD licensed!"
 HOMEPAGE = "https://github.com/pallets/flask"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "bf656c15c80190ed628ad08cdfd3aaa35beb087855e2f494910aa3774cc4fd87"
+SRC_URI[sha256sum] = "0ef0e52b8a9cd932855379197dd8f94047b359ca0a78695144304cb45f87c9eb"
 
 inherit pypi python_flit_core ptest-python-pytest
 

