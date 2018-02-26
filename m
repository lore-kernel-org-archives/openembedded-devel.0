Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2E7E278704
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 00:08:11 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id w142so5327101qkb.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 16:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0zEbXDaA/Srhst/S/qajl5jgBHIyhGP/86kE9CZqFFo=;
	b=kskqHnp8BirllDeqtUSfwO3LjzPk3L7+KTTzyGR5REOTos3JxYX+gxUQ4pubvjRIgi
	G0gY5m3HAfGve7lvnPMiGjuZ53mMY15cH5ddrxjsZ+xrmznDCS25GhSUmibuM18u8kdv
	6yfRKoMmnGouNrGa78hfXyQXs3J7S7s+D5ThwRXGFgo6Tkr1yC06xsERKYuM3Hv0TqmN
	8H1c2TZVlRx4ZiwbM9TlwCfbwcRbshoye6vVWnAL8zUPP4GyWYbSTNOUURmX7r0eGxHN
	KvDTmHyBPK/44LL8y54lPHfNshVAjgvDsJ5rRGj2MjnogIzOx8d+AS1nH5LdJTwobBjn
	b3zQ==
X-Gm-Message-State: APf1xPC9+MP5SNuOguvXwJqk3PDB5rnLy5XSuyD2M5cDaPabQDhaO5Rx
	8pu6831PvR+Ix4jKieIX3BvIHfth
X-Google-Smtp-Source: AG47ELsrPEQ1SwNvbapv1QZN25ypRIQF72YJmOwg44ydJMrgoTy2EiOpROd2XhVlXnPHE2C0kI768A==
X-Received: by 10.55.52.84 with SMTP id b81mr13909128qka.135.1519603692774;
	Sun, 25 Feb 2018 16:08:12 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	e21sm4073094qka.11.2018.02.25.16.08.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 16:08:12 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 19:08:01 -0500
Message-Id: <1519603681-3337-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update development version to 1.13.9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Feb 2018 00:08:12 -0000

Update license checksum for copyright changes

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.13.8.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.13.9.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.13.8.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.13.9.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.13.8.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.13.8.bb
deleted file mode 100644
index 2589097..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.13.8.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.12.x branch is the current stable branch, the recommended default
-# 1.13.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
-
-SRC_URI[md5sum] = "df4be9294365782dc1349ca33ce8c4ac"
-SRC_URI[sha256sum] = "8410b6c31ff59a763abf7e5a5316e7629f5a5033c95a3a0ebde727f9ec8464c5"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.13.9.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.13.9.bb
new file mode 100644
index 0000000..9234794
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.13.9.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.12.x branch is the current stable branch, the recommended default
+# 1.13.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
+
+SRC_URI[md5sum] = "dcd482dd98d2022659212f183e8fe81b"
+SRC_URI[sha256sum] = "5faea18857516fe68d30be39c3032bd22ed9cf85e1a6fdf32e3721d96ff7fa42"
-- 
2.7.4


