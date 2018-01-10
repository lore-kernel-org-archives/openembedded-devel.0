Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E8B5B7883F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 21:16:57 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id u76so1012961qku.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 13:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=V0mcISZihIViW9TvPsw6jm04N+aaAX3543fHaK6ErnM=;
	b=EABth5kOTroUn3qh/J0jnijLx0iBJ9rZJH0kMp440xCGZ+lznXzEfzpuyYJY6jE3jr
	S80A40Ulv691aSZ806MbRKp2Uxpf70jX2jJM4igHp1U2nFVbTSxui+dZapRVc3IHhY/d
	7up7NewiZlKtZm/qLzY0pe3C/Q8dgxAdyKRbCvLkpMTZ211rR0jIzKNntBm8103Luz/o
	pXMLclf13MDqoGrTeM1g8GEMK/n6RKbYVXlGqFPIw/l20uu2UpmJGSfCNfcqu0A2VpfZ
	aTFFtWE2eKCbhCMgZwwGwFZPLz74jceWCRbwF+S0omw2EYqoqr4p/ibLkDOggyJ5KGyw
	z9yQ==
X-Gm-Message-State: AKwxytcv5P14G+7Z8n4/mI2BbjUIeWVmiEOD5MfdkSXYsBf+5QJrqsQZ
	jrBOEzGN7mBlwoNSju9wR49fS50e
X-Google-Smtp-Source: ACJfBoscf3QlywnRf+jtyt4NOCKBg2uo6n00T/K63ImXPTUjCcREGDae9XurwdwPtvN03hTNkjjv4g==
X-Received: by 10.200.64.219 with SMTP id f27mr4004678qtm.227.1515619018627;
	Wed, 10 Jan 2018 13:16:58 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	w73sm11505095qkb.70.2018.01.10.13.16.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jan 2018 13:16:58 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jan 2018 16:16:52 -0500
Message-Id: <1515619012-8188-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-django: update to version 1.11.9
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
X-List-Received-Date: Wed, 10 Jan 2018 21:16:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-django.inc                 | 4 ++--
 .../python/{python-django_1.11.8.bb => python-django_1.11.9.bb}       | 0
 .../python/{python3-django_1.11.8.bb => python3-django_1.11.9.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-django_1.11.8.bb => python-django_1.11.9.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-django_1.11.8.bb => python3-django_1.11.9.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index fec5379..8fff75d 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.djangoproject.com/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[md5sum] = "e8b68d44b87a3de36e13547ec2722af2"
-SRC_URI[sha256sum] = "fed3e79bb5a3a8d5eb054c7a1ec1de229ef3f43335a67821cc3e489e9582f711"
+SRC_URI[md5sum] = "08ad028fc50ee961dea35e1e1f657b65"
+SRC_URI[sha256sum] = "353d129f22e1d24980d6061666f435781141c2dfd852f14ffc8a670175821034"
 
 PYPI_PACKAGE = "Django"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-django_1.11.8.bb b/meta-python/recipes-devtools/python/python-django_1.11.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-django_1.11.8.bb
rename to meta-python/recipes-devtools/python/python-django_1.11.9.bb
diff --git a/meta-python/recipes-devtools/python/python3-django_1.11.8.bb b/meta-python/recipes-devtools/python/python3-django_1.11.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-django_1.11.8.bb
rename to meta-python/recipes-devtools/python/python3-django_1.11.9.bb
-- 
2.7.4


