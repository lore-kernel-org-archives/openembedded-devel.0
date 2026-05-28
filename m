Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BC6CD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 05:14:07 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1398.1779929696749893512
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 17:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cultA7aJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.170, mailfrom: qili00001@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5945b781ddfso1092280e0c.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 17:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779929696; x=1780534496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PF5SFNEm5OgnAsihIniDJUMV/G7CZs8jbztaCLuB1sI=;
        b=cultA7aJmcb02rKihdQ+98Jq6esHj5sAasRtWpzv3IU/olQcHIi7ewjaOcUivLY1c6
         7AilXjqAjAcT43CR0ndDr+uVXk+ORKS1jxBzcayCFhzdMX9p+GdS9LPU5+/tFJawGi23
         xg1rfSCay+1gygPeUyWaqazFJ57eSaqEwAbkAOF5gyw87MdrA7QBUNZfdoV3yr/s+jAy
         a953b9i0WlYL0f6BzWcixKmUTPV5XP16p0F/c6GXZI4yY/pRwQDJNHA8UTTjLIsLkKXv
         vvlftX48kmYQncwCetg7uxg8zM4fLregFEqC8K45aoGspYgab99nmJ1jZo8Kz3U+EtPx
         6rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779929696; x=1780534496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PF5SFNEm5OgnAsihIniDJUMV/G7CZs8jbztaCLuB1sI=;
        b=NdtQAxb3165EviDx/CwP5vPjKCrOltkgX5EiJPailLZcpzrjieKUR3RJ/q1rkb8j9H
         GeC2jXBoOZhAffx70bjM0/YQ7hlk6gCifdz3mIogd4ewK4zhQI+bYIMZCU9CGFOy11EO
         M7ZWtuqYDzOX5wOrMpj+kw9ga4GOFJJuLSu1yfj8HWCEI/9sR2NqzMPULFVMGR3GJhZy
         T/nZGdP6DnCPtvHUvWnExXhPS3+QpfsuDKH4f7xQp8iW4JhOb0eqQhGOt2vilF0/zOaY
         /+yqqh1EoxzVAgf9nP0jx29+g7TSualhEF/vdeRBqfKERqQXNSCuaU5VKjnWPg+E0xaf
         kzCQ==
X-Gm-Message-State: AOJu0Yz82WxKZwJJL4Q1iH7WzwAhs//Za1LkDN3Ep2d/93yIlIjd/of7
	1SMcnMNMk2McdSbtG+yclkgy2CpV64D3EuoQcXefhS5kWOybVSg3FMcMzNLnw4boEYw=
X-Gm-Gg: Acq92OFPY5yYiG7gbLW1Ms1Dhoymy4muuqB0/imXold9yZq4y4fcPimPORdmN2jTTAP
	u9fIem3kZsQJb1JuXYVEIW7cX8a7MCvY7Yxz3GymLQMXRTflED1vQRzZ5PHA6IGCs+zb4q97vAv
	+OPScLUYky8yTUlTkJSlVtoZAPxb3cG5rnG81F9Ry/AYLamaF6buo7TvlwjwDiv0BHIjlx5CAug
	nJE3SUmqnMrfICvjHycL6TGYqWYcePsbDwI6pLVCnkLkJU1/nIXO9puB1XCqpupYKsy0iYCtxUu
	TSdoJG3Jrgq5EaXI4rHYmtDMASHtIYP4+tIdtY9uqTZb6gQ2I82kPseqKXT2gX0tkHog0vqX22q
	PVIiwIm7VwY56kcPS6ulHqhkNMHwDD+84cPRQObXssGZDdiZHSthRFEmjTR91L5JSuWexbW7HCE
	WZgJlHkoHkMuzkEryngtee0FqyOkPaFGRBQBaJlYWdIJA5aDgt+nuMxK8=
X-Received: by 2002:a17:90b:54c6:b0:35f:c5b8:ef6d with SMTP id 98e67ed59e1d1-36a6ba28e46mr17464655a91.3.1779929287969;
        Wed, 27 May 2026 17:48:07 -0700 (PDT)
Received: from VIC-PC (host.vinno.com. [222.92.99.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b90be0f51sm104510a91.9.2026.05.27.17.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 17:48:07 -0700 (PDT)
From: Qliangw <qili00001@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Qliangw <qili00001@gmail.com>
Subject: [meta-oe][PATCH] libuio: fix FILE descriptor leak
Date: Thu, 28 May 2026 08:47:53 +0800
Message-ID: <20260528004753.1193-1-qili00001@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 05:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127271

The function uio_line_from_file() fails to close the FILE pointer
when fgets() returns NULL, causing a file descriptor leak.

This can be triggered when reading from /sys files that return
empty content, leading to resource exhaustion over time.

Fix this by using goto-based error handling to ensure fclose()
is called on all exit paths.

Signed-off-by: Qliangw <qili00001@gmail.com>
---
 ...ix-fclose-leak-in-uio_line_from_file.patch | 31 +++++++++++++++++++
 .../libuio/libuio_0.2.1.bbappend              |  3 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libuio/libuio/fix-fclose-leak-in-uio_line_from_file.patch
 create mode 100644 meta-oe/recipes-extended/libuio/libuio_0.2.1.bbappend

diff --git a/meta-oe/recipes-extended/libuio/libuio/fix-fclose-leak-in-uio_line_from_file.patch b/meta-oe/recipes-extended/libuio/libuio/fix-fclose-leak-in-uio_line_from_file.patch
new file mode 100644
index 0000000000..b5c984c23d
--- /dev/null
+++ b/meta-oe/recipes-extended/libuio/libuio/fix-fclose-leak-in-uio_line_from_file.patch
@@ -0,0 +1,31 @@
+From: Qliangw <qili00001@gmail.com>
+Subject: [PATCH] Fix FILE descriptor leak in uio_line_from_file()
+
+The function uio_line_from_file() fails to close the FILE pointer
+when fgets() returns NULL, causing a file descriptor leak.
+
+Upstream-Status: Pending
+Signed-off-by: Qliangw <qili00001@gmail.com>
+
+--- a/src/uio_line_from_file.c
++++ b/src/uio_line_from_file.c
+@@ -28,14 +28,17 @@
+ {
+ 	char *s;
+ 	int i;
++	int ret = 0;
+ 	memset(linebuf, 0, UIO_MAX_NAME_SIZE);
+ 	FILE* file = fopen(filename,"r");
+ 	if (!file) return -1;
+ 	s = fgets(linebuf,UIO_MAX_NAME_SIZE,file);
+-	if (!s) return -2;
++	if (!s) { ret = -2; goto out; }
+ 	for (i=0; (*s)&&(i<UIO_MAX_NAME_SIZE); i++) {
+ 		if (*s == '\n') *s = 0;
+ 		s++;
+ 	}
+-	return 0;
++out:
++	fclose(file);
++	return ret;
+ }
diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bbappend b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bbappend
new file mode 100644
index 0000000000..d0e0dbb9a8
--- /dev/null
+++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://fix-fclose-leak-in-uio_line_from_file.patch"
-- 
2.53.0.windows.2


