Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 28DC86B338
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:29 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so214471eak.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=lbSWv4jo2Aur/1EtZZHg3Ghw5o7oIokHlBSqVhT//ew=;
	b=xRHbZ+sWVCRBIyUf1q9Z0bxmKaUJf6bz0TSABARNsYW8CX9p22w5JSIzanpJYFrDit
	ZGsVAn+nCkrcVDJ9AiacONgi9kpG37NIfpQlxKO685Tu/tdYhDTb3PhTQ4lOYOjlw9yC
	tFGKsGNm6hNIA6pTYQjcvH+ncqLVgG3FWc7RcOHPzyH+2YUp41kg6BzUepq0tplMKvo2
	LOM0R2lM+NUbPKkCbh+bwyHCBlznVHoktB1ps+WBPwy5xDR3VUwWfWWMaYpdMflKFEDM
	F0UVUfm4vc62kY4EiMU8xLIWY3A/+cAp6OlDWP2LID98nPvp9M0VGtuT1X7tCyEYk1z6
	sehQ==
X-Received: by 10.14.173.130 with SMTP id v2mr37721767eel.29.1374669689626;
	Wed, 24 Jul 2013 05:41:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a4sm65931368eez.0.2013.07.24.05.41.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:09 +0200
Message-Id: <d8a4abe46ca4fed388fb27a5386dc1c79116e0a2.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 25/29] openldap: add dependency on util-linux
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2013 12:41:29 -0000

* openldap-slapd was sometime depending on util-linux-libuuid
  add dependency to explicitly enable it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.23.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
index 1121008..a565e89 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
@@ -20,6 +20,8 @@ SRC_URI += "file://initscript"
 SRC_URI[md5sum] = "90150b8c0d0192e10b30157e68844ddf"
 SRC_URI[sha256sum] = "5a5ede91d5e8ab3c7f637620aa29a3b96eb34318a8b26c8eef2d2c789fc055e3"
 
+DEPENDS = "util-linux"
+
 PR = "r1"
 # The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
 # installing .so and executables, this fails in cross compilation
-- 
1.8.3.2


