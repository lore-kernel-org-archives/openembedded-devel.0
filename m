Return-Path: <eric.meyers15310@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC43AEEA848
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:29:36 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52189.1770920967578662942
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FnaFVCA/;
 spf=pass (domain: gmail.com, ip: 209.85.167.196, mailfrom: eric.meyers15310@gmail.com)
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-45f126d47b8so54357b6e.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 10:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770920966; x=1771525766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcZ/rXa6njnCPo6RmLMMoiSsMkRca9kCExjZLaeitxg=;
        b=FnaFVCA/eZ0pVhen/Txe6CGcIf+KWl7Fpvg4Cj8j5ldvqCnkSQDCVJK+baRlHsxh9O
         Gm1+cFg7Ym7Ew9GgKNK0Mtar2QFRDmy21lqJeR2pMdcw7cgb7X3XTSreLwG3c4LJSZmq
         1n2e7TLfNmZ854qCfk7fbU9XexhXuPYSpKb1tY3UbMkRqYxV3T/pYy1PMoMQkajTn7El
         LRu7sJbNz7j0wWrbPHmaFBKSY8ttxwqJXg+iUmq+75PYa4QyvbqCs205OK7sHgPOhQdN
         7Qhgx4dPGwGwK2Hk/KIMIvGiiA1C+dR6SqvtbuPLcDB41uHXBWyj6jnYQvsJobGep1+t
         VFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770920966; x=1771525766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcZ/rXa6njnCPo6RmLMMoiSsMkRca9kCExjZLaeitxg=;
        b=UT69AyhV2KLOkPDbrROWKUrIplCzSe0S93db7Rj+AL7S3he+F0YzTFyAeZ0ktfhAP4
         oxNhTfoebQA58XYGuY5P+NzvO3cSW69sy/kwdB6DNC39+g+LPkCJyMuHpkBFniOfc6eY
         xw+JHOo32d9CA85R60jb9oytQ04GNa7EscMP2DmiyoNgLMZtZTdoHGG7mbxVuiIhlah5
         H0004Glc/90byyy0DDVppRnYROcAV0ETA3Ki5eE8QRZXnCHwB9ofmW7QKZiO0YLuIcJ3
         1/HFENehnTnnPjlUHF9QB+jj6DkUEUyGmxI+ZIj9I0r2OQbVwBvDGDKW7bKERNzRsIld
         PhLw==
X-Gm-Message-State: AOJu0YxLHfU+FtPCNPXZvx1GpJ15mfRf1jfdq0hGlVaK79GHuIAOVIiu
	QNc4CTFZvl+NK1cbAvT+0XF9wUkwuulxs/G5EA6lMVEURIWrPQx3aC38iC3TUG9v
X-Gm-Gg: AZuq6aKQ2D3MKLpahkPm0ZapJ0nn89HlDrMUw82T72zg5oKjyaAnvtkjiOfGHjH9SD4
	El9oxlJTOhk8OpN+jVzONapZI1hlB80mv6u2G45OLKCwg3S/Da3ft+DSQF9hUG5dF/yDwN1dscX
	3U1uXwiTp/uFs4526BUR/XPlPvR2aB1/BQwxz/eOEWX8RZ7UJ/b9Dzyp5aMvHaROrFNoXMA2WsE
	Xv664XaXbuhtf3xZMn0b6lqGSXLYULePrOGePdDCuOO1gmbzPYu8VmimO2pbpaReUWB3fqUh6zr
	hFwIb8Ud3MrPeoho+iRfDeF0dh4YZ833wRw9BKI3c/TOWbpn02ZthAe3hJihXzT8rtxsdWCYxsQ
	hSMc7TIEyqvYoqqukq204pKJr5IQBBUs4nKq3oe4grcIvQ7hC1y/33qcGZ1/KSQOFpL3Ww5SpQC
	CTs5XdUhuVIR8EoIk3jT9jb8XfDwRJ+uba0WUp2yHRz9friGLzMLm+g5VD2iDCDoH4AaO3DQ3Md
	9Cf/OhdOcPBg5SD5/HvOWU=
X-Received: by 2002:a05:6808:c188:b0:453:315b:4f5c with SMTP id 5614622812f47-4637b8f2c19mr2084197b6e.56.1770920966569;
        Thu, 12 Feb 2026 10:29:26 -0800 (PST)
Received: from ACT-L-SWD024.yourbase.domain.local (c-73-168-239-54.hsd1.il.comcast.net. [73.168.239.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46386f95d5asm1192536b6e.0.2026.02.12.10.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 10:29:26 -0800 (PST)
From: Eric Meyers <eric.meyers15310@gmail.com>
X-Google-Original-From: Eric Meyers <eric.meyers@arthrex.com>
To: openembedded-devel@lists.openembedded.org
Cc: Eric Meyers <eric.meyers@arthrex.com>
Subject: [meta-oe][PATCH v2] redis: Remove debug paths to avoid TMPDIR [buildpaths] errors
Date: Thu, 12 Feb 2026 12:29:29 -0600
Message-Id: <20260212182929.8047-1-eric.meyers@arthrex.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 18:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124360

Takes similar approach to valkey recipe seen here:

https://github.com/openembedded/meta-openembedded/commit/1b820b98afd55c881822beb9057162dc67ecb386

Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
---
 meta-oe/recipes-extended/redis/redis_7.2.12.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
index 8abf758930..589ffd6fb2 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
@@ -52,6 +52,11 @@ do_compile:prepend() {
 }
 
 do_install() {
+    # Remove debug paths to avoid TMPDIR [buildpaths] errors
+    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-benchmark
+    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-server
+    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-cli
+
     export PREFIX=${D}/${prefix}
     oe_runmake install
     install -d ${D}/${sysconfdir}/redis
@@ -71,6 +76,8 @@ do_install() {
     fi
 }
 
+INSANE_SKIP:${PN} += "already-stripped"
+
 CONFFILES:${PN} = "${sysconfdir}/redis/redis.conf"
 
 INITSCRIPT_NAME = "redis-server"

