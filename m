Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E8A6B72EAD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 16:54:43 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id b131so5132633qkg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 09:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Zcx4/CpZBoz1/hVwj0gMXkA4kYXfXMuJIG13/Urnat4=;
	b=TMhOVE5xeh9d1mSUizkMqQC6Ml8k0RL+dCNYtE2XkyMNmSb000U5FSpku6OS9SSA/p
	/RE0ogZf0V4W9gnjFiQCsb1gFMmu+d97/cejSI64O5Abr18W6AkuGdupQAEyu+VCZtvg
	b1xVV44gCabRsTNebPtDcziwvQbVPXs2IpA/hTMbc85xSdbeGT6reFEBEZ56eiiSq5WR
	TqnwYM62jARNkIrw5xvtCkqY68/zV+4/21o5anErVDhPSdnegNZ0Fa2EBJ2H71GRbSeE
	9CQ0Oz8bZrp7nG7hfmHCwaejyQ+pKaNH5h3h5cTWE28HFQLkvkUAar0iv684naL2qvBR
	uCNQ==
X-Gm-Message-State: ALQs6tD7Bmz98CaSqL/X8qXdn4jrAbPT6pMcZcwuM17jI+W6mTblyjkG
	5/PwdN9woTgFT77gq0EYb86OrMLn
X-Google-Smtp-Source: AB8JxZonBmK4M11pZpiLCHWil0ChMYBTZ+NXpHcwCFBA5TtRXja41TPLN8Jjj3PK6SwdJ0FBe5h9JA==
X-Received: by 10.55.106.132 with SMTP id f126mr8357823qkc.45.1525020884342;
	Sun, 29 Apr 2018 09:54:44 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	k46-v6sm5122820qta.65.2018.04.29.09.54.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Apr 2018 09:54:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:54:25 -0400
Message-Id: <1525020865-2432-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1525020865-2432-1-git-send-email-derek@asterius.io>
References: <1525020865-2432-1-git-send-email-derek@asterius.io>
Subject: [meta-webserver][PATCH 2/2] nginx: update latest development version to 1.13.12
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
X-List-Received-Date: Sun, 29 Apr 2018 16:54:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.13.12.bb | 10 ++++++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.13.9.bb  | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.13.12.bb
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.13.9.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.13.12.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.13.12.bb
new file mode 100644
index 0000000..e629380
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.13.12.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.14.x branch is the current stable branch, the recommended default
+# 1.13.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
+
+SRC_URI[md5sum] = "20871b2cf21a16dbfb83078b4dc2dde0"
+SRC_URI[sha256sum] = "fb92f5602cdb8d3ab1ad47dbeca151b185d62eedb67d347bbe9d79c1438c85de"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.13.9.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.13.9.bb
deleted file mode 100644
index 9234794..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.13.9.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.12.x branch is the current stable branch, the recommended default
-# 1.13.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
-
-SRC_URI[md5sum] = "dcd482dd98d2022659212f183e8fe81b"
-SRC_URI[sha256sum] = "5faea18857516fe68d30be39c3032bd22ed9cf85e1a6fdf32e3721d96ff7fa42"
-- 
2.7.4


