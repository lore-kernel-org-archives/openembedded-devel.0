Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1StaGP-0004DG-SH
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 10:14:41 +0200
Received: by wgbdr1 with SMTP id dr1so6145921wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2012 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5GgXnHhAF91rK97bLyeCZYIS4piqV1tXftvzGauXths=;
	b=pogMN6dpV7DM/Jo7U+b4JPStQMYcZUV0ZYLkjqJ4i2eoFcTgNFGzSWCiLx+g7dMZek
	L1zai/VEAwXhdN9TzROFb/pCcUaVYnmvNNxv8BW3s64UeoW1DL9BMVoPUYXsLXKhiyjD
	Naq0p+rgx7jTzxHniP4E+myoLLiBql2/IDWwnUt8mM8U7Pqx9JeEl9GDqGbwOnqUz9e8
	t0xzhWK0IknyRPpqdzkKYVyiA83es3GgAvmsjOT1evdScZxwkcQIgADfCS2zjre4giWY
	XDOxKoyQWZYXSvvikVhqD/RuH5w7wlV3KDPhmvM158rnsvWYVhE9+t6u1b6Aqben6FcU
	X0zw==
Received: by 10.180.105.6 with SMTP id gi6mr4661078wib.4.1343116994156;
	Tue, 24 Jul 2012 01:03:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t8sm3135979wiy.3.2012.07.24.01.03.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 01:03:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2012 10:02:55 +0200
Message-Id: <0bb57f740fc362b631725dfb281f047ba982ecc5.1343116924.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343116924.git.Martin.Jansa@gmail.com>
References: <cover.1343116924.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343116924.git.Martin.Jansa@gmail.com>
References: <cover.1343116924.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/5] webkit-efl: inherit pythonnative
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
X-List-Received-Date: Tue, 24 Jul 2012 08:14:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Conflicts:

	meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
---
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
index 0c490c3..7719212 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
@@ -11,7 +11,7 @@ DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
 
 SRCREV = "105069"
 PV = "1.7.3+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRCREV_FORMAT = "source"
 
@@ -30,7 +30,7 @@ do_configure_prepend() {
   cp ${WORKDIR}/CMakeLists.txt ${S};
 }
 
-inherit cmake lib_package pkgconfig perlnative
+inherit cmake lib_package pkgconfig perlnative pythonnative
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.7.8.6



