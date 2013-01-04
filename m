Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tr6V4-0008RM-Bm
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 13:36:07 +0100
Received: by mail-ea0-f174.google.com with SMTP id e13so6854144eaa.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2013 04:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=W/vyCemV6g+Ph7onJvxVDs0YA23xc5zVu2FAWGIxn54=;
	b=kvgAVIZeQZrpnP85O8n6V/LGeECn3verDtkCe530FePqBhxL9RXpxN6rzGSBC5PI2p
	GBkCavNeL6+xwNrcKQFQmMlBe2u2/AvesnhgcL1z7QNb1qICBA90a9+e60FK/aMXLbA5
	nhJ6IDFFcN7ayDvph8BRvbSdPkMuxzGDGJrHY49ABy/5OiA5VQn3qKdSoOCb/awI3yrY
	LvjdMV9x/kN4/bxtvIRs1WVYheAljBecbmL+X6+8OGEa39+PJ1RXgSvI/HSLcCw7cR3H
	H2VFo28wLZZewRwHHKY5CqmEL3m05w4uVZ7EVNA8CVGozELicPITTdfZN18dYTmkw6W6
	ziyA==
X-Received: by 10.14.194.4 with SMTP id l4mr142897151een.42.1357302045549;
	Fri, 04 Jan 2013 04:20:45 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	b49sm110483612eem.16.2013.01.04.04.20.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 04:20:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jan 2013 13:20:31 +0100
Message-Id: <cf8ed0f104728576fb33a61d209f76d4d3c97593.1357301108.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1357301108.git.Martin.Jansa@gmail.com>
References: <cover.1357301108.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1357301108.git.Martin.Jansa@gmail.com>
References: <cover.1357301108.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][danny][PATCH 1/6] python-phoneutils: drop due to lack of libphone-utils
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
X-List-Received-Date: Fri, 04 Jan 2013 12:36:14 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

ERROR: Nothing PROVIDES 'libphone-utils' (but meta-openembedded/meta-oe/recipes-devtools/python/python-phoneutils_git.bb DEPENDS on or otherwise requires it)
ERROR: Required build target 'python-phoneutils' has no buildable providers.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-devtools/python/python-phoneutils_git.bb | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-phoneutils_git.bb

diff --git a/meta-oe/recipes-devtools/python/python-phoneutils_git.bb b/meta-oe/recipes-devtools/python/python-phoneutils_git.bb
deleted file mode 100644
index 36f5241..0000000
--- a/meta-oe/recipes-devtools/python/python-phoneutils_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Python Bindings for libphone-utils"
-SECTION = "devel/python"
-DEPENDS = "libphone-utils python-cython-native python-pyrex-native"
-RDEPENDS_${PN} = "libphone-utils"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://phoneutils/c_phoneutils.pyx;endline=18;md5=ca321e4ec3a30a44469b23ebca782665"
-
-SRCREV = "8a7c719e0c3f1f8c10f77f17422da02d7177f0dd"
-PV = "0.0.2+gitr${SRCPV}"
-PR = "r5"
-
-SRC_URI = "git://git.shr-project.org/repo/libphone-utils.git;protocol=http;branch=master"
-S = "${WORKDIR}/git/src/python"
-
-inherit setuptools
-- 
1.8.0.2



