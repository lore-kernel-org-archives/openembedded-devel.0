Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 735F96EA30
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:47 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id b10so2722753eae.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=EmuZFydzqJMnTP1+JKE0+GtEJxKKHFCnBztOJ6wmidQ=;
	b=MSM+D5etanr/hfliFYgmd3RdlKSOQWGwL4/sC5Lp/CR8rqPpAxz0iJbJcq8EZObill
	NUDlxx4j/o0Hk+QlqPPEcFUZGSrZXEYOrNJu95zCArsRdl/NJoChnahyERTPFccJNT+U
	hgJDo9yY9bounDbE7D9lAYGB7idBoLshhDiUM7orA3RAt74x8z+LWr0FjmnkiN/d8eNp
	RybdXzUuyvzJy589/AQqWItjRotgB1Zn1yZoq7zdm4fN3W6H4NYJu8gua+Pv1AWDHLLf
	z4mxZhV8E+pku6ubnh/tDeXtggv/DCFFwksx4zBfLOEGn7anvs7YCI7P2D1YAbwqQCWL
	9Bww==
X-Received: by 10.14.105.200 with SMTP id k48mr7028254eeg.44.1391240088199;
	Fri, 31 Jan 2014 23:34:48 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z49sm46311601eeo.10.2014.01.31.23.34.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:16 +0100
Message-Id: <3d048e0353c1b7e2bb09ba59749a55ff2835380b.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 20/20] expedite: Replace old svn recipe with git version
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/expedite_git.bb | 11 +++++++++++
 meta-efl/recipes-efl/efl/expedite_svn.bb | 13 -------------
 2 files changed, 11 insertions(+), 13 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/expedite_git.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_svn.bb

diff --git a/meta-efl/recipes-efl/efl/expedite_git.bb b/meta-efl/recipes-efl/efl/expedite_git.bb
new file mode 100644
index 0000000..5b44cf0
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/expedite_git.bb
@@ -0,0 +1,11 @@
+require ${BPN}.inc
+
+SRCREV = "a5e6af917af52877b378090811cf836c16d0bfbb"
+PV = "1.7.99+gitr${SRCPV}"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "\
+    git://git.enlightenment.org/tools/${BPN}.git \
+"
+S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/expedite_svn.bb b/meta-efl/recipes-efl/efl/expedite_svn.bb
deleted file mode 100644
index 5b13b9e..0000000
--- a/meta-efl/recipes-efl/efl/expedite_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.4+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-DEFAULT_PREFERENCE = "-1"
-
-SRCNAME_append = "-1.7"
-
-SRC_URI = "\
-    ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
-"
-S = "${WORKDIR}/${SRCNAME}"
-- 
1.8.5.3


