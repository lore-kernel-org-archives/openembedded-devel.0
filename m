Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 13BCB7C749
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 13:59:21 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id k11so3965353wro.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2019 06:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MKPbPIA0vhnLRZ+vx6HWC073tKnxoMR1Yoo65sFWWaw=;
	b=as3AfD0R/Kj8l0C0X8UWK3QXggCxOO9dKtygWYkPURDsnEdrAEfYDW0ocSesHJYq1X
	Hmq/v8pIAZI4eS6dhRM0TQCxwup+HsjEAeWly+TZ2egklJcY68bUe1x7C3woMymXKHzL
	dEPWGnvj2Cj6o6mZwJmldGOuFd3SLYuyn+ZpRUOvNhG3yzuwuc8VNMXGv9eOpBLM6hIk
	EmNUQziI6IIAcmV0eShTpNJoXaWfF5J6rIUHZj35FRp+IEK/4OoEPIcYYVF67rVSm3xd
	5DaUz7dDhmI8/SmoEoa7zGII/Z0fckVgbukz9vPgxiBAGLWa6/e62zHflD7KOhUygLse
	bqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MKPbPIA0vhnLRZ+vx6HWC073tKnxoMR1Yoo65sFWWaw=;
	b=Y4eXO7c6D4IrZJavEMR9sUSjRAAT/WYV1scwqnyF2qgnMxGCDK428Yg8BuQ9x4Y1Rd
	Vj4TfsXnkswekAuBv1JAUsR3YdmXFvVq9jy1x7IkbIy0OUcA7pxul+AGoFIFTdhY3e5M
	8UPyl3fFKr7EUpFtj4qXP7zWVID0IgfLGKuc5WRaIbw6IYx6LckO/g+HVLyts/l1O71/
	doTosFSkdxCKqsL1iD9oiByHF260CNeIxK0USMixWwPWzMrvUsqVppMnH7tfuNLinw4Z
	uxKtarokMUfy45G0Swj5Nn/ckE9AX6Zj+zgVnCQdSFFIvcoWSY9ybs22zz9YgAiQmz7z
	jfug==
X-Gm-Message-State: APjAAAWfTHVSMn5atpAlObpkqTDwNUbXj7aC6yU/A15mMt9DSicrF5Ta
	hRmsEadU4IwaBcKh/kNGuxVPQuoA2Fs=
X-Google-Smtp-Source: APXvYqyaqosyL9hhXplE1Mj3M0zJBXywkJnzrrjQ6IPu3tsfWg3P65FDhQVXDDjODa1Jdgr9ID5S8g==
X-Received: by 2002:adf:8bc5:: with SMTP id w5mr4024211wra.226.1554386362507; 
	Thu, 04 Apr 2019 06:59:22 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.214.126.255])
	by smtp.gmail.com with ESMTPSA id
	q4sm26056547wrx.25.2019.04.04.06.59.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Apr 2019 06:59:21 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org, bunk@stusta.de,
	martin.jansa@gmail.com, raj.khem@gmail.com
Date: Thu,  4 Apr 2019 15:58:58 +0200
Message-Id: <1554386339-20076-3-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554386339-20076-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1554386339-20076-1-git-send-email-vincent.prince.fr@gmail.com>
Subject: [meta-oe] [PATCH v3 2/3] cppzmq: bump version 4.2.3 => 4.3.0
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
X-List-Received-Date: Thu, 04 Apr 2019 13:59:22 -0000

There is currently no support for building tests as googletest will be replaced by catch in next version.

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
Changes in v3:
 - Add comment to explain why tests are disabled

Changes in v2:
 - Remove git SRCPV from PV

 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 9aff59c..11ea3be 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
-SRCREV = "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
-PV = "4.2.3+git${SRCPV}"
+SRCREV = "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
+PV = "4.3.0"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git"
 
@@ -13,6 +13,8 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
+EXTRA_OECMAKE = "-DCPPZMQ_BUILD_TESTS=OFF"
+
 PACKAGES = "${PN}-dev"
 
 RDEPENDS_${PN}-dev = "zeromq-dev"
-- 
2.7.4


