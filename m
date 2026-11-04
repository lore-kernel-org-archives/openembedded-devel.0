Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8229.1793796024097918743
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 04:40:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ej03QJTc;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so4478265e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 04:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796022; x=1794400822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/m6G0LzteCf7ob3KrvQX4gSZ3n9CRX7fwjr3zPI/GoE=;
        b=Ej03QJTcVL1GpnZ2qgvCLbsuN6BIYhCRLaPOjknW4mb6wOfgHjSrrb4El5ZSg+DeDC
         CLueh8WpDewbwCElsRG3Rcsf+yNPmGDHioIz6s1vDfOcPp35q23BFppR1KMVak0qT95i
         BeoZ8en9NxUmggEF2QQsRBLKiNomuaPNhuSo+Cz5mF0UZXNdvdjgLcZZiH/gqi83HII/
         MRwdjSA2nLTmM7sC8Pjq4YP03h9KL2cAn2X9u9Cu7vrGBt5VAqrPP7HaUxEEfpcDZmiU
         ePyvULmuSY7nzKgq/jOcViACeLTI09oNxcYeqyfsJWm28bUo56UGtnVL8CWkRfPiba7t
         XbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796022; x=1794400822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/m6G0LzteCf7ob3KrvQX4gSZ3n9CRX7fwjr3zPI/GoE=;
        b=eMJDO4Rn55LReB+XV6oZ/EkK/9ePt1OCVhm+/yg3oHvfoGzxBz3HbEpkpKVQMYoumw
         FXCtMukjO1Uqa5FrbmF6y4nF5Ln/LBggcLtdvYIy16MXs1XDEyUZTEXLE/D0/hywndAJ
         ZoRmgCUmsbcBLKUc7Ff7HJZ6DYaKEVJTMr3IQjg4XBK8UxqJliNV/Ke4EoEn4GLOtF1H
         NBk+vybTPw0qb33b1VoUn6CdzCEW0Nzued3nAMBhT/g6Qro7F4IPd4csqJkk7l+NzL06
         G9HdeumbRmG/f2116ziRxExsVbal4J4jnR56zFxXWxVt3g8FuyMNlOLjR4IPkHqW8FYP
         wd3g==
X-Gm-Message-State: APuU4Z/9KYjb0lx5UvKkKxHMGBqH5dZ9EalGRO7S+FVPlz1ODTRy2J85
	d0o8LoOCLFjlOeXF9+hwtawvyiCcz92K/jewFzzr7+wg3w6AlvFlAuoGLrov8ViQ
X-Gm-Gg: AYBFou0N5mLRCgLjYHdSQiIG5QEnzxwGO8aQEfTiu3LsMZ7mGmdsXSNHseBQRt6WZjx
	XfTNe6r50re82a5/ey1KgAj4dAiAuPQjnmWFFEb3iFTR1V3ECGpHiAC+RafZkTa1AenMNH938by
	B0VFtyiVeHZgu3/YGav1y6AtDsh6BarbZMlM5p1/Vnx4wACzSZEOVjy8DOixsjgkKFH87K6xemW
	pXpYcxKF2UEFimGKrPqDw9IVI6Q0kMvGdtrp88TW9JFA8mhxeZGJr3ZhkgBsNoFx17tt+kjOprU
	L9iUHURmHMV2/uuGvUPLHGYA8z5bEHYoHELkatfl99Nr8vJcA72+ICifWuWXnMKG4mADxE3Fjn5
	ia91U8gzXpSF4p7+0tDwLxPaxyYwGHRksqYNEUVmK2fav9AnV27R8hVOGQW1mef3GSvBcGCN0gE
	9VjOwIf6JYONhU6blvxG63i8RDlcIcS6xPZ9WgZDgrI3r9B77wP32YjU/GFC0U7CW4hfTTNk9Fw
	L+v9i7iJ2meoqEdX+2IJbSpxovHZNVx9iZbyH+9++gJ80T+paBcW+UV/rhNeGrPcWcU36L58xpi
	QJfBnN5MkA+OEeZ65kz7HlpvMIuyqu7FULeTb2DERhhqg21tae8CIj1AKzqmvnzQJMoQKgYSCbe
	1T2l6lv25+XmHwGI/kKWYR93EchKRYSb1
X-Received: by 2002:a05:600c:a4c:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4ac17d16ba4mr359642355e9.9.1793796022116;
        Wed, 04 Nov 2026 04:40:22 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.212.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab010a66sm186745455e9.13.2026.11.04.04.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:40:21 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] ctags: set CLEANBROKEN
Date: Wed,  4 Nov 2026 13:40:17 +0100
Message-ID: <20261104124017.889577-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 12:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131843
Content-Type: text/plain; charset="utf-8"

From: Martin Jansa <martin.jansa@gmail.com>

Tries to call sphinx-build during clean in docs directory and fails when
not installed on host nor included in HOSTTOOLS

Fixes do_configure failure when re-executed in existing WORKDIR

...
rm -f ./*.gcov
make[2]: Entering directory '/OE/tmp/work/x86_64-linux/ctags-native/6.2.20261011.0/sources/ctags-6.2.20261011.0/docs'
/bin/sh: 1: sphinx-build: not found
make[2]: Leaving directory '/OE/tmp/work/x86_64-linux/ctags-native/6.2.20261011.0/sources/ctags-6.2.20261011.0/docs'
make[2]: *** [Makefile:20: clean] Error 127
make[1]: *** [Makefile:8218: clean-local] Error 2
make[1]: Leaving directory '/OE/tmp/work/x86_64-linux/ctags-native/6.2.20261011.0/sources/ctags-6.2.20261011.0'
make: *** [Makefile:7175: clean-recursive] Error 1
ERROR: oe_runmake failed
WARNING: exit code 1 from a shell command.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
index e2f6b309ef..b419a158c0 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
@@ -33,3 +33,6 @@ PACKAGECONFIG[yaml] = "--enable-yaml,--disable-yaml,libyaml"
 PACKAGECONFIG[manpages] = ",,python3-docutils-native"
 
 BBCLASSEXTEND = "native"
+
+# calls sphinx-build during clean
+CLEANBROKEN = "1"
