Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32772.1793879747076378597
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WZCdIcFL;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so15100575e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879745; x=1794484545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GtRxujiQ2jnmOpaM07r8twslMR6lnTaMYrVgLwu6U0s=;
        b=WZCdIcFLra4qE6ky0Ca0zFNwYxJvtuZNyAqV8HY4iAfo4W8A9SOyoXSyhRyFDjF7vX
         2bA+RMPWi0gqT/k+81kOb0iqucFYkY3e/sVO8Y4oQTShqM4ugewUCI3Rlbc0RdL6+JRU
         sDpJbhVRcjsA5ID3rFWIr2xy7FFT8Sl+gPZko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879745; x=1794484545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GtRxujiQ2jnmOpaM07r8twslMR6lnTaMYrVgLwu6U0s=;
        b=RYesYzEkfZud/Kr4vUal70sy9B5jTpYlRu0QX93AXJZ/cAWL9mhjYp5MpMRk3omCWN
         WlW9o+Yw/xg03MNstoQgLVCV6ovv3gx6f3W8hvMJ6CDuXFuWdvI3pQz63+CoCyhYqca/
         k4lbTZFIsmFxv1zXzcz7II/oJkHh72JfT3GBnVZ7DtKUlNJtS2Oa+ZRNplbJ3s3smIJT
         9YuBAZks+4lV2k9/RB5fegv34zMj4o2D2agnqFB1LHNeEwasAdhh4vWgHvl9Pfuxc7fA
         Qo9yzMwwnvjfGXkKUlkzoooKOWzSsT3lYPtWjg1zZv13OpChr53eDlAVle0B1RK6mTBy
         hcQQ==
X-Gm-Message-State: APuU4Z/qhXoa728y/WoYuFf3l1C2D66zlXEYDQvNmFuhh3iRKy3q6i7I
	6sXmCsBdf22WgkxjkI+aqgyWSYuNXyqcKhgHNtQAm/icqLXfK3AkaTaRelSLGrAKLrw+UZqfCXn
	74Hri
X-Gm-Gg: AYBFou38QFRMaYWpSde+cHJqL8OzE1XZi65FYWRWnGt7Wd4cmgT5dggRSr7iojh5ksn
	Z6qXPXBuuq7jb6Qvdg9TpRmyFL9s/d38MML2FBUCKzgPO74lyPI1gdI19N9NRtgZbA3dalDZ6uy
	jT4xVUHc8aSBoGW1DM1KOZcMuYQmDUhnHaObaqVF7AFeOARUbdeJon8STaCfTNb9qSO2E+rd8/g
	C4Fuqbq9EzFvSyQVRO0iVqeRB68GUY7OX0GwMTRl3QBDQF+amg7be/vWOsrA9yhtxZKl++chD0j
	PJEonkyeoyrBXVx6QB18VMw3LyYPaBctrGtrTgWU5wuufPRtkkxwL6CRej8SVUj03J36+zCj0DX
	shZGUC775hScXK8L2tJaDkuHpSftDqtdXhuWONe7YwqZJ9vnoT963P51SFzf6ORsfuIRndt+qbq
	cHOYpmcb3ctZXWPhvJcueoKveN1xiaje0Wa+EcH0l3ZqnubHFfHkWZx24sfJ/FIX7xHVfHz2qIl
	+Ytlqc/dIq4VMT/dcw5U2VgdxZobfFMf2MSMjoiDHLiSlkAGxU57i2cB6VhA2ECwniyWYRexdty
	5/RdYUHO8ZzGx0CQk074I+TOKEEt6ES5PVLiWJw/wzeyQcB5UxfkeZgDB/CKVnjbAUaPuyMWgOr
	uGSRpomUvCVfvaHHxYb3ge/4VgbujhyTJsw55ojHazY4CbClDLY8ddPM=
X-Received: by 2002:a05:600c:3f14:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4ac14ec873emr404864275e9.4.1793879745355;
        Thu, 05 Nov 2026 03:55:45 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:44 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 18/19] python3-ujson: Upgrade 6.0.0 -> 6.1.0
Date: Thu,  5 Nov 2026 13:55:25 +0200
Message-ID: <20261105115526.634289-18-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131918
Content-Type: text/plain; charset="utf-8"

Upgrade to release 6.1.0:

- No functional changes, only in binary wheels released to PyPI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-ujson_6.0.0.bb => python3-ujson_6.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_6.0.0.bb => python3-ujson_6.1.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_6.0.0.bb b/meta-python/recipes-devtools/python/python3-ujson_6.1.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ujson_6.0.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_6.1.0.bb
index ece408e60d..f163be2db0 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_6.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_6.1.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause AND TCL"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1e3768cfe2662fa77c49c9c2d3804d87"
 
-SRC_URI[sha256sum] = "80e23393feb707582e0ad495c397a4477b646d08094d2df64f7316f9fafd8aae"
+SRC_URI[sha256sum] = "aef7ea4cd9e2e9f8a35c4538a9780d58c80d76c5da66a8dad269b4cc6d930c29"
 
 CVE_PRODUCT = "ultrajson:ultrajson ultrajson_project:ultrajson"
 
-- 
2.47.3

