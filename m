Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 33CDB7546A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 20:09:53 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id u62-v6so10376348qkf.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 13:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rOB8zYPlgIa0WiE/lor9a0NecDaZ48mv2Gxtecv1ES0=;
	b=VWRMpGZ0NdYkkVmqaPxuQA/Hdpd5CxYh8mD3SS2P3RJIIua69RMxWZ1m0icCDU1K4y
	7eBHZtgSuLNAKHp0j+1cKNCpuDRk4e5TgMXN7AoYXst6D6zuSPdMVjgS786OFivyiFfL
	c5ReqAWCRYnKBfiYVhseXOp7OWA/vUJtLWyH8QEHgBMautkNQd7hInBbLwZe30AOQ4EB
	cjwwUjNgFHoR0JAXGsysk4T/SzO31e0vXOtuqa5S1VRnwZ45bPDqQSlBAt8uuVF4H06d
	KEL+cStr9U2E0nKIciBuRKAUua/vRmmDsc+Kku+ua42U+1NLIXPadU7HX+wbusZ3AF3z
	sB/w==
X-Gm-Message-State: APt69E14sRtrS1+pTQ0kvxVMiRQ1zpm5O68Uz5YWze+4KtLzcZ3HlagE
	qwKqmIUdS5GEsC4zx85tOepzQlsI
X-Google-Smtp-Source: AAOMgpfeYqQF4GDFzq9zIYBa49IBA0jGYemKv3j92WabmjTWKUg+x3LtaJ8MaCL2LZcl3FVP23du9w==
X-Received: by 2002:a37:5a47:: with SMTP id
	o68-v6mr19797570qkb.226.1531166993798; 
	Mon, 09 Jul 2018 13:09:53 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	h22-v6sm10017368qkj.84.2018.07.09.13.09.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 13:09:53 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 16:09:46 -0400
Message-Id: <1531166986-7172-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531166986-7172-1-git-send-email-derek@asterius.io>
References: <1531166986-7172-1-git-send-email-derek@asterius.io>
Subject: [meta-webserver][PATCH 2/2] nginx: remove the 1.13 recipe in favor of the new dev branch of 1.5.x
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
X-List-Received-Date: Mon, 09 Jul 2018 20:09:53 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.13.12.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.15.1.bb  | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.13.12.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.15.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.13.12.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.13.12.bb
deleted file mode 100644
index e629380..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.13.12.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.14.x branch is the current stable branch, the recommended default
-# 1.13.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
-
-SRC_URI[md5sum] = "20871b2cf21a16dbfb83078b4dc2dde0"
-SRC_URI[sha256sum] = "fb92f5602cdb8d3ab1ad47dbeca151b185d62eedb67d347bbe9d79c1438c85de"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.15.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.15.1.bb
new file mode 100644
index 0000000..0f1ba8f
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.15.1.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.14.x branch is the current stable branch, the recommended default
+# 1.15.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
+
+SRC_URI[md5sum] = "2dd5a265c54a76b699443931d80a61b9"
+SRC_URI[sha256sum] = "c7206858d7f832b8ef73a45c9b8f8e436bcb1ee88db2bc85b8e438ecec9d5460"
-- 
2.7.4


