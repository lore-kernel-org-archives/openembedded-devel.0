Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QqMTP-0008RV-Eo
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Aug 2011 11:50:15 +0200
Received: by fxg11 with SMTP id 11so4511740fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2011 02:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7Ls6oNv/i7ptygDyCOjIPKGn6gq+Gcwk0wvAdzwZJUo=;
	b=kvpa2jw1eAXeABdWm2Dm7aLSeY9UIEeco/wIJrnxN9bwokrwvTRGDfzim0iCfWjZW8
	uvyA624UbM8LteZKN8mIrpUy1bYzwJKrWLyo4coo2b0LKlc1UFCBGyMQVaa1qodTuLp3
	+GPlLBaOcdhqWgCCHFmB5vcbx8KfgE/EN718U=
Received: by 10.223.17.6 with SMTP id q6mr7289902faa.96.1312796747626;
	Mon, 08 Aug 2011 02:45:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o7sm3057774fah.12.2011.08.08.02.45.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Aug 2011 02:45:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Aug 2011 11:45:32 +0200
Message-Id: <1312796732-9259-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [meta-efl][PATCH] webkit-efl: inherit perlnative and s/ARM/arm/g in ARM_INSTRUCTION_SET
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
X-List-Received-Date: Mon, 08 Aug 2011 09:50:15 -0000

* ARM_INSTRUCTION_SET != "thumb" is enough but better to unify with
  other recipes in case someone does ARM_INSTRUCTION_SET == "arm" later

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
index ee1e18d..bffded7 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
@@ -22,7 +22,7 @@ SRC_URI = "\
 
 S = "${WORKDIR}/src/Source"
 
-inherit cmake lib_package pkgconfig
+inherit cmake lib_package pkgconfig perlnative
 
 # Wants to jump too far for THUMB on armv4t
 # in WebCore::DocTypeStringsHash::doctype_hash_function(char const*, unsigned int)':
@@ -30,7 +30,7 @@ inherit cmake lib_package pkgconfig
 # the same in WebCore::CSSValueKeywordsHash::value_hash_function(char const*, unsigned int)':
 #             WebCore::CSSPropertyNamesHash::propery_hash_function(char const*, unsigned int)':
 #             WebCore::ColorDataHash::colordata_hash_function(char const*, unsigned int)':
-ARM_INSTRUCTION_SET = "ARM"
+ARM_INSTRUCTION_SET = "arm"
 
 EXTRA_OECMAKE = "-DPORT=Efl -DSHARED_CORE=ON"
 
-- 
1.7.6



