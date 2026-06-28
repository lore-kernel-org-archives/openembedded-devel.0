Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA34C43327
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:38 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75150.1782663755792365048
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bWL3ZeL8;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30ec1ddd510so579328eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663755; x=1783268555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdiD7O6sHWQ79dqyKdgqIcE5GGrhGj2/TmzjEpi1B8A=;
        b=bWL3ZeL8nzF/FOP1Pn6IHtQbVhmKrXcaTMQ5oqVN6XCYqc7QduB8Xr8jS1kaH+/EAc
         zJUq9PO6+BotGrxc2/N33aAHCHyfzHK7Xawh/sxgulrd9p0C/nFLMxkCahTfYaZ0I0Oz
         1tSSmyLmRaQaQ8+OL9MHLIwDoXdirId/NbPCrIMqMjkrTqd1Pz4NndW9nU+b/rljY9mX
         UgBqrUuecWvYFjh1yhua3elhTjwuqjbNu3ad/6zOKDdhBrBMqBWZwP7KGJ/6osNyzAD7
         ODTg9Q9yYGok+BE5T4yfGMOyJ2WhEzBW/totHJufzqk4DyqsPUXpnixImJ06nvIVF86S
         4aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663755; x=1783268555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vdiD7O6sHWQ79dqyKdgqIcE5GGrhGj2/TmzjEpi1B8A=;
        b=dmD0MtOtC31MXUEzHd+nmXeM8nNGKyitzp+FnyOcduV3k23e6+EZIb0ehraQ1o2b5z
         PAmaPm2A8XNHTy/eBgT/yyZZCpcrmKhBLlm/h6yLcrpl/C/fZGb8ZzGfq4OCWjDdjcLR
         bDxJV/fHs48G2hMcdLuo79KPCCXHdvAGjH6JHkO3/63n7twAIZQmbI/Nd/NJUrHMGQQE
         /q7/2zMxO53YlMwrTCuvFDcPBJQLqqpPnJ1PGeOfnpr/zJfxFLfbPKV4KXWgBU+KNM3Q
         819kubO6IAsT4ggIUyRvS/5E2KFHx+VhL5PiROjhVXBGEQkMzGiLH+zSQTShxXu+2IxH
         +oQA==
X-Gm-Message-State: AOJu0YzL5noyYgnBHBTlHIWXP3znvogTYtjFeUEdVZiJ7NCEBHU8lZKC
	jDpX0ZqWhmDkymoE1isL8coKEnaBDPEvmuxIZUPgKNuAEyHbm9C2glbjGV6bJMD4oc1QaA==
X-Gm-Gg: AfdE7ckZVBXKkL0WZMcCT1qDXa5yqMp6ggwlmGOrSXpjGShY8xXjC+maISSAUqwgHOT
	yBeLf85MPb1bfHIuklFtYlyinfX6ETciIXJELRsswCOFg15K0ZaGwYHvh0otwYG1DgnK03zOfnO
	rb3Lrmj2dMG2F/E8GPSnMcwAicpVV0gFv2UeHrCGaoDsDz0HhUcotnBfjZ6Wn2ZaHBdn1E0+U7y
	8yUqnCC2C+G7iSWcdpZn+rgUF9zBy1CMmGqA2J2c2AS62BAYH30AzPNpn3+Lx5Ub7HxEOohcUk0
	LIllC6l5Nm34qvcv1VykQo5X1NhwDitWiAVdUOYrL9TLzHogxtkVkQSuJBkltnVGIKq7dgTzD9P
	PpJIKv61PnUj3I+zXVYmBhTZJ0k9qHiev4LmrKB1KvMTswR/JMCk9qaTutFcnOYrqOBnFzWy9n/
	LeR8jxiZSXuduLkNTumGFvelzmu0gu1LTHGLHs4aRrLfBpDEGzwzboIad5v6QP4uYDuNfeLeCwN
	TeULH0tYLN9sQGjhxNyqTOYofmtKZPgQ1Vw+PjV7ki4yQp2hV+wwaKh8QCgwKzMEzE7t4eh/K4c
	Wgd61b4v1v2XwZhg5S0BnELv7k8+Ug==
X-Received: by 2002:a05:7300:6143:b0:30c:f84c:b295 with SMTP id 5a478bee46e88-30cf84cbf91mr5566036eec.24.1782663754904;
        Sun, 28 Jun 2026 09:22:34 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 109/128] mbuffer: build in-tree so mkversion.sh is found
Date: Sun, 28 Jun 2026 09:22:03 -0700
Message-ID: <20260628162222.4081517-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127919

mbuffer's Makefile invokes 'bash mkversion.sh' with no path
which only works in the source tree so set B = S.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/mbuffer/mbuffer_20260511.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/mbuffer/mbuffer_20260511.bb b/meta-oe/recipes-support/mbuffer/mbuffer_20260511.bb
index aef96f59db..1a498286ed 100644
--- a/meta-oe/recipes-support/mbuffer/mbuffer_20260511.bb
+++ b/meta-oe/recipes-support/mbuffer/mbuffer_20260511.bb
@@ -14,6 +14,11 @@ SRC_URI[sha256sum] = "13bab36f39408f7a08fb368913290ad0f117c934bab602094e18fcc123
 
 inherit autotools
 
+# mbuffer's Makefile generates version.h by invoking "bash mkversion.sh"
+# with no path, which only works when building in the source tree (the
+# script is not found via VPATH in a separate build dir).
+B = "${S}"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[md5] = "--enable-md5,--disable-md5,openssl"
 

