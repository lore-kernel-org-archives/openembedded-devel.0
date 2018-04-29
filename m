Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id B97B06075D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 16:54:42 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id s2-v6so8400927qti.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 09:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UEZ2uUBPNm3+TQaPM2LU66SMitQGE2tSeVWqfhHAtsE=;
	b=cQfTiufBLCz7b3hBmxq4LBSwbyLaPp81WovqM7g2XrLKYTbpf8pV/FCu7sUfgXv+Bd
	H7LaHtoeDLJm1qpNB8qHGIB9MlCwlFhu/KLYJ4KWq0Uu1QF/ZFoYtW1jlKnin9RsowSZ
	fy75a5uXTBXjy0DTbVsGy/jtz8KwF67Bfx1rnbWTVggQVK6RMOURBgFcnW84pX3BKTpI
	Lt37kw6kjgzO2G3LrsSqHoRI4HHFCny9mr7DXEVaFpkDA4oP9bD3yjkOTwv1ZupMfM1s
	qAgh6bNdXpGpSi9VBpAIG23BsWxdAj/XGRnDXtQGf2KxC6vY6uhjYPYhp4bFVowkCNng
	cwEQ==
X-Gm-Message-State: ALQs6tCf27K5QcViZv18y9c2GoRMCk4jv1T7ABpYJMu96eXQ83DiTWMj
	fI3Nq+WpBa+GkMNeVHW7kUTUvLwX
X-Google-Smtp-Source: AB8JxZqerEv/4tY0JwCMDcAKh7D9QUv4DWtBT3aKiFRua6OuwvGhu6n1YIXKxV3O5W5GqTEDz5Lo4Q==
X-Received: by 2002:a0c:d0b2:: with SMTP id
	z47-v6mr8695709qvg.207.1525020883182; 
	Sun, 29 Apr 2018 09:54:43 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	k46-v6sm5122820qta.65.2018.04.29.09.54.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Apr 2018 09:54:42 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:54:24 -0400
Message-Id: <1525020865-2432-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH 1/2] nginx: update stable version to 1.14.0
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
X-List-Received-Date: Sun, 29 Apr 2018 16:54:42 -0000

License-Update: Update license file for latest copyright date

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb
deleted file mode 100644
index 85ad29b..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
-
-SRC_URI[md5sum] = "4d2fc76211435f029271f1cf6d7eeae3"
-SRC_URI[sha256sum] = "305f379da1d5fb5aefa79e45c829852ca6983c7cd2a79328f8e084a324cf0416"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb
new file mode 100644
index 0000000..de22960
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.14.0.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
+
+SRC_URI[md5sum] = "2d856aca3dfe1d32e3c9f8c4cac0cc95"
+SRC_URI[sha256sum] = "5d15becbf69aba1fe33f8d416d97edd95ea8919ea9ac519eff9bafebb6022cb5"
-- 
2.7.4


