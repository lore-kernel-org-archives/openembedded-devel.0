Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qvb9L-0001Cf-83
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 22:31:11 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so3800464fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 13:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=laFuyNjapAgt7QHolnT+hnduumWfxjPf8BgEMuZtAIY=;
	b=WJ4saNbXweO8RkI0LT9d9dYoLq//I2WLboPBJYdM6MM1tBXuC+HPnCnFsVEF8otnQH
	U9TNbg1ftyJ5/TLIRSzLyAb+LmcBfBgnC8JHFz/rtYbIJaxYfe4THaDAq7GJFIXIdPBu
	Q2iX/vN1xIwCt776VH47ue2uMkzowQYzd7YQ0=
Received: by 10.223.63.139 with SMTP id b11mr4221219fai.87.1314044789204;
	Mon, 22 Aug 2011 13:26:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c7sm5376158fac.12.2011.08.22.13.26.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Aug 2011 13:26:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2011 22:26:05 +0200
Message-Id: <10bb87f3e1492b3a436514333a55a844dc2f781f.1314044687.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <f2d4302d43765f25c2fca5a78959300dd5fc5371.1314044687.git.Martin.Jansa@gmail.com>
References: <f2d4302d43765f25c2fca5a78959300dd5fc5371.1314044687.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314044687.git.Martin.Jansa@gmail.com>
References: <cover.1314044687.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 3/4] edje: include epp in edje-utils package. Fixes edje_cc
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
X-List-Received-Date: Mon, 22 Aug 2011 20:31:11 -0000

From: Sebastian Krzyszkowiak <dos@dosowisko.net>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edje.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edje.inc b/meta-efl/recipes-efl/efl/edje.inc
index 9d4d222..b922f90 100644
--- a/meta-efl/recipes-efl/efl/edje.inc
+++ b/meta-efl/recipes-efl/efl/edje.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f2d83425ec8dfae5cd77f8ce52e872c"
 inherit efl
 
 BBCLASSEXTEND = "native nativesdk"
-INC_PR = "r0"
+INC_PR = "r1"
 
 do_configure_prepend_virtclass-native() {
 	sed -i 's:EMBRYO_PREFIX"/bin:"${STAGING_BINDIR}:' ${S}/src/bin/edje_cc_out.c
@@ -52,5 +52,6 @@ RREPLACES_${PN} = "libedje-ver-pre-svn-00-0 libedje-ver-pre-svn-01-0"
 FILES_${PN}-utils = "\
   ${bindir}/edje_* \
   ${bindir}/inkscape2edc \
+  ${libdir}/edje/utils/epp \
   ${datadir}/edje/include/edje.inc \
 "
-- 
1.7.6



