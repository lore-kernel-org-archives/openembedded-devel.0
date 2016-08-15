Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2A2AB77117
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 14:09:44 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n66so2289899qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 07:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jjXqSavv6UQSb53xa7kaMPZOmxfWKvfD4FIDk2iMFOI=;
	b=LnZd3ZLxJQUT1t4OxWYp5ao2fB7AQSbDIWqbUXShSNLFMRMmrx/e0a0Kut2geR9WHS
	qkOketXAa09pbDEm72bfl9qAmgue0eZU7UQBJGGQEydXMVFZXa441x8OUP+zcidVWUi3
	3+cWlehIAr+PFa6qxsttUZ96lmEDay6F6Aq4tchLNYwUb7NqPJJipWNaN3cpUryZNLSz
	LI/nrO3efIw7Vdmv7yZE0KzJx8n9AgDhl59jcLmh0hGD3fWxfJp52acu7qRuOMh3FoXV
	MyCBxndYOkM+TjCyTx8yt2Fbj0GqpwjMbDRPmp3bPmPFCCA1mYRXalmM7Dwrfu5vpVyd
	RQiA==
X-Gm-Message-State: AEkoouuONII5anPfGelEBfnFhaLJ5sWXw2BdKnPARy0K6GoGCYNaS3X/TUjl/17Ixq1GOw==
X-Received: by 10.55.145.197 with SMTP id t188mr18074051qkd.172.1471270185098; 
	Mon, 15 Aug 2016 07:09:45 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	i65sm12424856qtb.18.2016.08.15.07.09.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 07:09:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 10:09:24 -0400
Message-Id: <1471270165-3098-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCHv2 1/2] utouch-frame: fix build errors associated with xmllint
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
X-List-Received-Date: Mon, 15 Aug 2016 14:09:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../utouch/files/remove-man-page-creation.patch          | 16 ++++++++++++++++
 meta-oe/recipes-support/utouch/utouch-frame_git.bb       |  6 ++----
 2 files changed, 18 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/utouch/files/remove-man-page-creation.patch

diff --git a/meta-oe/recipes-support/utouch/files/remove-man-page-creation.patch b/meta-oe/recipes-support/utouch/files/remove-man-page-creation.patch
new file mode 100644
index 0000000..8706d91
--- /dev/null
+++ b/meta-oe/recipes-support/utouch/files/remove-man-page-creation.patch
@@ -0,0 +1,16 @@
+configure.ac: never generate the docs even if a2x is found as xmllint will fail finding custom dtd files
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+--- git/configure.ac.orig	2016-08-15 09:53:46.787003658 -0400
++++ git/configure.ac	2016-08-15 09:53:51.698972432 -0400
+@@ -37,7 +37,7 @@
+ ])
+  
+ AC_CHECK_PROG([ASCIIDOC], [a2x], [a2x])
+-AM_CONDITIONAL([HAVE_DOCTOOLS], [test "x$ASCIIDOC" != "x"])
++AM_CONDITIONAL([HAVE_DOCTOOLS], [false])
+ AS_IF([test "x$ASCIIDOC" = "x"],
+       [AC_MSG_WARN([asciidoc not installed, man pages will not be created])])
+ 
diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
index 8fc8733..6ec566d 100644
--- a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
@@ -9,12 +9,10 @@ DEPENDS += "mtdev utouch-evemu"
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://bitmath.org/git/frame.git;protocol=http"
+SRC_URI = "git://bitmath.org/git/frame.git;protocol=http \
+           file://remove-man-page-creation.patch"
 SRCREV = "95363d5a1f7394d71144bf3b408ef4e6db4350fc"
 
 PV = "1.1.2+git${SRCPV}"
 
 S = "${WORKDIR}/git/"
-
-# http://errors.yoctoproject.org/Errors/Details/74486/
-PNBLACKLIST[utouch-frame] ?= "BROKEN: Fails to execute xmllint"
-- 
2.7.4


