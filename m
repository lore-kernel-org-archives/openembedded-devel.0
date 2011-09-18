Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYT-0003rO-Qp
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:29:07 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3592243fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=B2Xykgg3lTyE9YQsxrXPglAzK8wwVQDAbN5FOADfNKo=;
	b=ZJvSkkb90Ah93p+3PR51A0Xy8mH7jOtSYpeAJ2kFVJ9Nf829hifx4o9jWMaBumXaaP
	XQLal7HEYSyK8rBj2SJg6cRg3jExhSpwJbb3Qq/ewEjGj0jjP84rniWC7JrjVg3I+lJw
	Kb5uCXy9hlhAff5RCPzj/PFMw3pX2OOTHN0Mk=
Received: by 10.223.75.24 with SMTP id w24mr2917388faj.132.1316345029271;
	Sun, 18 Sep 2011 04:23:49 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:48 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:14 +0400
Message-Id: <1316344999-26642-13-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 12/17] qte-common: adapt for {moc, uic} -> {moc, uic}2 change
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
X-List-Received-Date: Sun, 18 Sep 2011 11:29:08 -0000

qt2 tools have suffix 2, adapt qt2 class to use them.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-qt/qte/qte-common_2.3.10.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qte/qte-common_2.3.10.inc b/recipes-qt/qte/qte-common_2.3.10.inc
index 8c2674c..3ba8af8 100644
--- a/recipes-qt/qte/qte-common_2.3.10.inc
+++ b/recipes-qt/qte/qte-common_2.3.10.inc
@@ -108,8 +108,8 @@ export SYSCONF_CXXFLAGS = "${CXXFLAGS} -pipe -DQWS -fno-exceptions -frtti -DNO_D
 # enable if gcc supports visibility
 #export SYSCONF_CXXFLAGS = "${CXXFLAGS} -pipe -DQWS -fno-exceptions -frtti -fvisibility=hidden -DGCC_SUPPORTS_VISIBILITY -DNO_DEBUG ${EXTRA_DEFINES} -DUSE_BIDI"
 export SYSCONF_LFLAGS = "${LDFLAGS} -lts"
-export SYSCONF_MOC = "${STAGING_BINDIR_NATIVE}/moc"
-export SYSCONF_UIC = "${STAGING_BINDIR_NATIVE}/uic"
+export SYSCONF_MOC = "${STAGING_BINDIR_NATIVE}/moc2"
+export SYSCONF_UIC = "${STAGING_BINDIR_NATIVE}/uic2"
 
 # generate uclibc, eabi and powerpc configurations
 do_configure() {
-- 
1.7.2.5



