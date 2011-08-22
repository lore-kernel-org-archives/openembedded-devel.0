Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qvb9E-0001Cf-61
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 22:31:04 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so3800464fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 13:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=TLcg/RLIMzVVQcuKh/vvwaPHKk6Ri6Ibg1j2jHWiqVE=;
	b=Uxs3H2XWoULHRAkDjPQkcXnqcAxdb6au8fYLamog4J+aGKqE1b2wUqaxFfWgNZxAMA
	+LhYO1+jslGBcNv/eWFmhlNLLhIPItSLMpFVo/hkgA0drNuRJ52zJxYlBtUd+HFhtPfD
	ueXkGBeAmE8hqDHyKyF6EkiDe5LObOR+rF3zs=
Received: by 10.223.66.91 with SMTP id m27mr4290112fai.7.1314044782155;
	Mon, 22 Aug 2011 13:26:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p4sm4097295fah.25.2011.08.22.13.26.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Aug 2011 13:26:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2011 22:26:04 +0200
Message-Id: <6d59d1da5379ba8e231c5a17e787b9f1f97304d3.1314044687.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <f2d4302d43765f25c2fca5a78959300dd5fc5371.1314044687.git.Martin.Jansa@gmail.com>
References: <f2d4302d43765f25c2fca5a78959300dd5fc5371.1314044687.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314044687.git.Martin.Jansa@gmail.com>
References: <cover.1314044687.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/4] elementary: add new elementary-accessibility package and improve packaging
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
X-List-Received-Date: Mon, 22 Aug 2011 20:31:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary_svn.bb |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index a28927c..1c8909f 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -21,13 +21,13 @@ do_compile_append() {
                   elementary.pc
 }
 
-PACKAGES =+ "${PN}-configs"
+PACKAGES =+ "${PN}-configs ${PN}-accessibility"
 
 RDEPENDS_${PN} = "\
-  elementary-themes \
-  elementary-configs \
+  ${PN}-themes \
+  ${PN}-configs \
 "
-RSUGGESTS_${PN} = "elementary-tests"
+RSUGGESTS_${PN} = "${PN}-tests ${PN}-accessibility"
 
 FILES_${PN} += "\
   ${libdir}/edje/modules/elm \
@@ -43,6 +43,8 @@ FILES_${PN}-configs = "\
 
 FILES_${PN}-dbg += "\
   ${libdir}/elementary/modules/test_entry/*/.debug \
+  ${libdir}/elementary/modules/test_map/*/.debug \
+  ${libdir}/elementary/modules/access_output/*/.debug \
   ${libdir}/edje/modules/elm/*/.debug \
 "
 
@@ -53,6 +55,11 @@ FILES_${PN}-tests = "\
   ${datadir}/applications/* \
   ${datadir}/icons/* \
   ${libdir}/elementary/modules/test_entry/* \
+  ${libdir}/elementary/modules/test_map/* \
+"
+
+FILES_${PN}-accessibility = "\
+  ${libdir}/elementary/modules/access_output/* \
 "
 
 # Some upgrade path tweaking, as in evas
-- 
1.7.6



