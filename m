Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9fTc-0004M7-J3
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 17:58:16 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3210360fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 08:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1wEPyNJf+jIAp8f69zmNpgOMDzrcu6eELls63fyKe+A=;
	b=axgNM5+vJeTfVmVlNV1dW/8heoE5Wryyx9z9vOsDfZGgKZK7oVhPT1Kb+j2NsttKw6
	a4X8KW5wqMaTvoM6Os91C5PLRx0YA+RdwxzGCVsNm4aTM6XDVpV1hRtYowtxRUFej4PT
	MwvtoeEVZjlwcgTvbkimtxf+mak5KDrphPXPw=
Received: by 10.223.76.24 with SMTP id a24mr4070286fak.109.1317397969961;
	Fri, 30 Sep 2011 08:52:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u6sm7228612faf.3.2011.09.30.08.52.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 08:52:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:52:04 +0200
Message-Id: <867e2c787e1f4d4c7036e15aa5794a4412993541.1317397769.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d949b79e20616add7118dcc7cb4f5ee08b4fed3b.1317397769.git.Martin.Jansa@gmail.com>
References: <d949b79e20616add7118dcc7cb4f5ee08b4fed3b.1317397769.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317397769.git.Martin.Jansa@gmail.com>
References: <cover.1317397769.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/6] python-cython: upgrade to 0.15.1 because 0.13 doesn't work with python-2.7.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Sep 2011 15:58:16 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...thon-cython_0.13.bb => python-cython_0.15.1.bb} |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-cython_0.13.bb => python-cython_0.15.1.bb} (73%)

diff --git a/meta-oe/recipes-devtools/python/python-cython_0.13.bb b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
similarity index 73%
rename from meta-oe/recipes-devtools/python/python-cython_0.13.bb
rename to meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
index b547de6..f22a473 100644
--- a/meta-oe/recipes-devtools/python/python-cython_0.13.bb
+++ b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
@@ -6,13 +6,11 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 SRCNAME = "Cython"
 BBCLASSEXTEND = "native"
-NATIVE_INSTALL_WORKS = "1"
-DEPENDS = "python"
 
 SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-SRC_URI[md5sum] = "ed2ec5e0df60a6b8e500bedf93bb1feb"
-SRC_URI[sha256sum] = "a30d5e26c82ec65d65703c7cf312161a21b30339addc1a42d3b2965dea254ca6"
+SRC_URI[md5sum] = "171021b3845c9ca8bd6d8185b3cde664"
+SRC_URI[sha256sum] = "248123f2f02f2701a28d9452132ac835533b396a273cda9d361cb65c26067edc"
 
 inherit distutils
-- 
1.7.6.1



