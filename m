Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 14988733C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 14:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEiolj025007; Fri, 13 Feb 2015 14:44:56 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aMM9zUQeg5Zg; Fri, 13 Feb 2015 14:44:56 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEip5G024981
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 Feb 2015 14:44:52 GMT
Received: from richard by ted with local (Exim 4.84_RC1)
	(envelope-from <richard@dan.rpsys.net>)
	id 1YMHU6-000275-IC; Fri, 13 Feb 2015 14:44:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 14:44:31 +0000
Message-Id: <1423838674-8066-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423838674-8066-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1423838674-8066-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/7] subversion: 1.8.10 -> 1.8.11
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
X-List-Received-Date: Fri, 13 Feb 2015 14:44:59 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{subversion-1.8.10 => subversion-1.8.11}/disable_macos.patch      | 0
 .../{subversion-1.8.10 => subversion-1.8.11}/libtool2.patch           | 0
 .../subversion/{subversion_1.8.10.bb => subversion_1.8.11.bb}         | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion-1.8.10 => subversion-1.8.11}/disable_macos.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.8.10 => subversion-1.8.11}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.8.10.bb => subversion_1.8.11.bb} (96%)

diff --git a/meta/recipes-devtools/subversion/subversion-1.8.10/disable_macos.patch b/meta/recipes-devtools/subversion/subversion-1.8.11/disable_macos.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.8.10/disable_macos.patch
rename to meta/recipes-devtools/subversion/subversion-1.8.11/disable_macos.patch
diff --git a/meta/recipes-devtools/subversion/subversion-1.8.10/libtool2.patch b/meta/recipes-devtools/subversion/subversion-1.8.11/libtool2.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.8.10/libtool2.patch
rename to meta/recipes-devtools/subversion/subversion-1.8.11/libtool2.patch
diff --git a/meta/recipes-devtools/subversion/subversion_1.8.10.bb b/meta/recipes-devtools/subversion/subversion_1.8.11.bb
similarity index 96%
rename from meta/recipes-devtools/subversion/subversion_1.8.10.bb
rename to meta/recipes-devtools/subversion/subversion_1.8.11.bb
index b223d26..8e4cd9d 100644
--- a/meta/recipes-devtools/subversion/subversion_1.8.10.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.11.bb
@@ -13,8 +13,8 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://disable_macos.patch \
 "
-SRC_URI[md5sum] = "3068256761b40863df96128834d6b71b"
-SRC_URI[sha256sum] = "1cc900c8a7974337c3ed389dc6b5c59012ec48c7d4107ae31fd7c929ded47dcc"
+SRC_URI[md5sum] = "766a89bbbb388f8eb76166672d3b9e49"
+SRC_URI[sha256sum] = "10b056420e1f194c12840368f6bf58842e6200f9cb8cc5ebbf9be2e89e56e4d9"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c2f0119e478700b5428e26386cff923"
 
-- 
2.1.0


