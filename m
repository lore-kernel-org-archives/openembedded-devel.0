Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9ci-00081O-Cp
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:56:12 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so879969fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CjDG7uezyDNkITl/79TzFHbFDcjvim6YZeoI5Hj2Wlk=;
	b=kDUtj5HrLEEvHfqnvYUf+T2nCkuFt5yY/4Awn1d5g4G9NJMB6HQFriom4ozLpCTO/v
	WU3DYKsfB+luXkZy/qy3byuvFZkOVfDQfpW2+tM26mEnqdYkAFvZkiebEZvFNDbBQiuF
	nNIwS/lUsZIdgRyd3LWM9L3v8AVnT2u/BxCcQ=
Received: by 10.223.39.193 with SMTP id h1mr492592fae.135.1314892279135;
	Thu, 01 Sep 2011 08:51:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p3sm136989faa.9.2011.09.01.08.51.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:51:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:50:55 +0200
Message-Id: <434e2f75c6a34daa0be1a7691c9f8a2560c4ab93.1314892207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <4d660e0531b72769b0bf04e0288cca6d52cb083f.1314892207.git.Martin.Jansa@gmail.com>
References: <4d660e0531b72769b0bf04e0288cca6d52cb083f.1314892207.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314892207.git.Martin.Jansa@gmail.com>
References: <cover.1314892207.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] serial-forward, pty-forward-native: remove extra slash and '.git' from SRC_URI
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
X-List-Received-Date: Thu, 01 Sep 2011 15:56:12 -0000

* causing multiple files and checkouts in downloads directory for same revision
  4,3M    downloads/git2/git.freesmartphone.org.cornucopia
  4,3M    downloads/git2/git.freesmartphone.org.cornucopia.git
  4,3M    downloads/git2/git.freesmartphone.org.cornucopia.git.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../serial-utils/pty-forward-native.bb             |    2 +-
 .../serial-utils/serial-forward_git.bb             |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
index 72dfa22..6bf1d85 100644
--- a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
+++ b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
@@ -7,7 +7,7 @@ SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
 PV = "1.1+gitr${SRCPV}"
 PR = "r0"
 
-SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia.git;protocol=git"
+SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia;protocol=git"
 S = "${WORKDIR}/git/tools/serial_forward"
 
 inherit autotools native
diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
index 0e4ec44..cf66556 100644
--- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
+++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
@@ -7,7 +7,7 @@ SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
 PV = "1.1+gitr${SRCPV}"
 PR = "r0"
 
-SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia.git/;protocol=git"
+SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia;protocol=git"
 S = "${WORKDIR}/git/tools/serial_forward"
 
 inherit autotools
-- 
1.7.6.1



