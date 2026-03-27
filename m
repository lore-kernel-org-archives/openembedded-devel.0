Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2411910BA457
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 09:09:52 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67856.1774602588358389770
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 02:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TtwBqoMB;
 spf=pass (domain: mvista.com, ip: 74.125.82.178, mailfrom: vanusuri@mvista.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c18771d837so159456eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 02:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774602587; x=1775207387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f4kkGJ36B3ixSn9PPGRDp9UkFT70O5K3aNTbLVP5p1Y=;
        b=TtwBqoMBugQewFPIRHVPfNQbCHTEx/ppPohO5wne4WnEsSIQdNXdV5IqvqZ0+TFe7N
         8AKz5vM0j0NXBKX1QE/5zZLibXkUh8Fhg6pxo0PL8ju3VkV23lnI6uhhJF+tZ5Iy0SXg
         GrY1cG6t+0PL9a9h1QaBLsK6o//yapFHWhxTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602587; x=1775207387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4kkGJ36B3ixSn9PPGRDp9UkFT70O5K3aNTbLVP5p1Y=;
        b=J/K/vCEcb/pLxy5rhyKvYZnsOk33iXvbnL+rnsOfw+8f2z1Sgxy9yXIbAX6sWbgF6x
         C7H7dpwEy6mPYAsbI3Q3n06HF1CcwjZ+ctib6Kmut51SeIelj1ei0GzrfJCMkH1s/fYI
         pzglMEHM+MftoTUwkIDmmlW23DwXsVKsXnSzUi6sOLiUj8aaQq67QRKGWYDyWWi1Zqel
         tyFhd2dURn4zq3gl1daJnqWFoRQ43iTZIY07QwGDObgnJbWT2/xTh+sPAWN6AoitFil3
         UHvehYQt7plUQRmip/9sRXOSIPLaEg3vZugdS0WiNFKbQ+TJgJpgZAGOCTWaDqiyga6u
         P+jA==
X-Gm-Message-State: AOJu0YxVE45vzwg5cR03ynsN24lsO7Zq1G3XgZgFlvkfMIyyYT6JWqXq
	M8YwWATCe7wzFN3xSTXAw6jBA00kk5vkBfy6koy8BQJ7h+1UgHFZDrGWfuEjmkRa9zvddQuxM1P
	amkdD0Xo=
X-Gm-Gg: ATEYQzylpKb0oBKMF5Z/LKVW++XRfCVO0AE5l8XDWzOjEU5R4g01qOk97OFJXnhV6+X
	8GzTxHsorLuk06u1KC+ol13BeXcRQe81EL5BbH1nCqgj/Nq8YFQcCXhvQkOVCt30U9ZFNyDZYbt
	1Wi1A5KU/3eIFAAoaqcbWuGgztvk1nq5LATukEk9hXzOfsRb+4lGnxq4ovH5S5emZidQav9P235
	/6G0j8q+pknJhEhOnS/oAeh9eUaGhqhoFWiaGn8Yphm/bcgZhtAhK7APBsQmZy4d71O021oUONX
	7EBsgtx/i1bx3cwLRTP6NE4J8Ks3N3aPJKLD4Scd/NZSRpvqflWZ4XSOoMJgbh3hRiMF7uJewjL
	eI1WdLYV5a5tGwlmnKaRc04MG1J70nT1e3//7Tzg86VBUpXWzashg9uScRKamXCKDFKSM/yx3To
	Qh4zpp8Pb9soLabcw7xszghntFWgbDHkSy80Kh2McwUQ0MPzw=
X-Received: by 2002:a05:7301:1010:b0:2ba:9cc4:aebb with SMTP id 5a478bee46e88-2c186eb44c9mr596450eec.10.1774602587117;
        Fri, 27 Mar 2026 02:09:47 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2406:7400:54:2bec:d873:3467:d1cb:22ab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec258c6sm4906284eec.4.2026.03.27.02.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:09:46 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][patch 1/3] libssh: Fix CVE-2026-0964
Date: Fri, 27 Mar 2026 14:39:18 +0530
Message-ID: <20260327090921.114180-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 09:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125781

Pick commits according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-0964
[2] https://www.libssh.org/security/advisories/CVE-2026-0964.txt

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libssh/libssh/CVE-2026-0964.patch         | 46 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0964.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0964.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0964.patch
new file mode 100644
index 0000000000..947c73451f
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0964.patch
@@ -0,0 +1,46 @@
+From a5e4b12090b0c939d85af4f29280e40c5b6600aa Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Mon, 22 Dec 2025 19:16:44 +0100
+Subject: [PATCH] CVE-2026-0964 scp: Reject invalid paths received through scp
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit daa80818f89347b4d80b0c5b80659f9a9e55e8cc)
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=a5e4b12090b0c939d85af4f29280e40c5b6600aa]
+CVE: CVE-2026-0964
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/scp.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/src/scp.c b/src/scp.c
+index 103822ce..09dc1a1b 100644
+--- a/src/scp.c
++++ b/src/scp.c
+@@ -848,6 +848,22 @@ int ssh_scp_pull_request(ssh_scp scp)
+         size = strtoull(tmp, NULL, 10);
+         p++;
+         name = strdup(p);
++	/* Catch invalid name:
++	 * - empty ones
++	 * - containing any forward slash -- directory traversal handled
++	 *   differently
++	 * - special names "." and ".." referring to the current and parent
++	 *   directories -- they are not expected either
++	 */
++	if (name == NULL || name[0] == '\0' || strchr(name, '/') ||
++	    strcmp(name, ".") == 0 || strcmp(name, "..") == 0) {
++	    ssh_set_error(scp->session,
++			  SSH_FATAL,
++			  "Received invalid filename: %s",
++			  name == NULL ? "<NULL>" : name);
++	    SAFE_FREE(name);
++	    goto error;
++	}
+         SAFE_FREE(scp->request_name);
+         scp->request_name = name;
+         if (buffer[0] == 'C') {
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 614b656216..d37fccf26c 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-8277-4.patch \
            file://CVE-2026-3731-1.patch \
            file://CVE-2026-3731-2.patch \
+           file://CVE-2026-0964.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.43.0


