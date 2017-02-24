Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id B579A605FF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 00:57:54 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id s186so1101787qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 16:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zcCuZHAUno4p9pg89qtT0VNM8M8XVn/Ts9M3U0fspH0=;
	b=Qeec5c5xNq9kyiKJRtA0d8MGlvJpbwwrDNpt2l8GBAOBUBZFFXY7J0918MDLc+y8+6
	Vpf+TENAf6m+fJyDv43kf999L2K/NTi7damS7Vk+e0m7Td4KNb2RlTx2ZiSocxAdw6yz
	WpZMFlhlLf3EJ1NbRuao4y5V4AuWXqjn3Ee3Sm0kin4N65RLqNNZJbaKYSzexOtqfsrj
	QVvr2EmNkd1r9cZKox/l0jDmcQ+3dTOkl7jw/OaKL+TME2HiVUo1YakZQ/SoWD6nHJjH
	sApLgO3tvWlSUrbKDDSyoqz/gfWUoL00e9Y6l6cGcT7saMafTjufZnSolM/LeoC8fC5O
	umzA==
X-Gm-Message-State: AMke39kBB7GbPzQvrAI+EU8WdhhBe8e+z0yBEIynztEOrDaMQ8H/BMS4mQMWZNCu+hCxQw==
X-Received: by 10.55.111.199 with SMTP id k190mr12085qkc.25.1487897875537;
	Thu, 23 Feb 2017 16:57:55 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id h40sm3819404qtb.6.2017.02.23.16.57.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 16:57:54 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 19:57:45 -0500
Message-Id: <1487897865-10456-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyalsaaudio: update to version 0.8.3
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
X-List-Received-Date: Fri, 24 Feb 2017 00:57:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-pyalsaaudio_0.8.2.bb => python-pyalsaaudio_0.8.3.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyalsaaudio_0.8.2.bb => python-pyalsaaudio_0.8.3.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.2.bb b/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.3.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.2.bb
rename to meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.3.bb
index 5408702..7dfb136 100644
--- a/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.2.bb
+++ b/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.3.bb
@@ -3,11 +3,11 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
 
-SRC_URI[md5sum] = "1f22415a3d8da4b303182ad81c2d062e"
-SRC_URI[sha256sum] = "b6df486f1c4035041a5f3800496b86c64e48e4a7d47f94dcbca11b0187aa3a15"
+SRC_URI[md5sum] = "fd87fdd34fb0aaf7e48bfe036ec8e2f7"
+SRC_URI[sha256sum] = "74d9f04e0aeb71b0b5d36c0f02b0dd69b227ae7324cb5ae70d1e22a61459573e"
 
 DEPENDS += "alsa-lib"
 
-inherit pypi distutils
+inherit pypi setuptools
 
 RDEPENDS_${PN} += "alsa-lib"
-- 
2.7.4


