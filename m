Received: from [209.85.220.213] (helo=mail-fx0-f213.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBsfu-0000ej-Ab
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:46:46 +0200
Received: by mail-fx0-f213.google.com with SMTP id 9so74430fxm.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 08:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=6K7uuqfZOcbqNzwdHE1vdVblYR11nqsysMqMBJbiKEo=;
	b=D9F3S855Gvq72T1IixoVtrq0d4y/CWeEw4B2KazYPCs9ja6dOM/NRY9yfQ/tw0FgNh
	xVbiYUebkww+bQgkgJb04oXVPhLC+oqeslvGazFkM+i1h1LfwY5T+n3bVld5nv4equNg
	x7pxJC5SGCEGX6dgj6QaibwVS6mqJ4KHVfcVA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rHvZLuDVsURRw1B91C50YpDUvptDzjcloACWkV/8lDU9aqqOPtVQdmCAFvIwIeJs4a
	5275AEgKYXPAcs6dXjUS2QcOerugUWc+0l3y1pcvDdPR+qkUWVMlfSZzAYnaOu6zRqk3
	V5fvFofCxerne5OjLGHuAomUg6jW6dISfABkU=
Received: by 10.103.182.1 with SMTP id j1mr690286mup.119.1244043468985;
	Wed, 03 Jun 2009 08:37:48 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 12sm22827038muq.23.2009.06.03.08.37.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Jun 2009 08:37:47 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 18:37:14 +0300
Message-Id: <1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 04/12] qt4-tools-native: use INC_PR
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
X-List-Received-Date: Wed, 03 Jun 2009 15:46:46 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/qt4/qt4-tools-native.inc      |    2 ++
 recipes/qt4/qt4-tools-native_4.4.3.bb |    2 +-
 recipes/qt4/qt4-tools-native_4.5.1.bb |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/qt4/qt4-tools-native.inc b/recipes/qt4/qt4-tools-native.inc
index 4836a9d..0fd4f92 100644
--- a/recipes/qt4/qt4-tools-native.inc
+++ b/recipes/qt4/qt4-tools-native.inc
@@ -5,6 +5,8 @@ HOMEPAGE = "http://www.trolltech.com"
 PRIORITY = "optional"
 LICENSE = "GPL"
 
+INC_PR = "r4"
+
 inherit native
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
diff --git a/recipes/qt4/qt4-tools-native_4.4.3.bb b/recipes/qt4/qt4-tools-native_4.4.3.bb
index e8fc316..a734b6b 100644
--- a/recipes/qt4/qt4-tools-native_4.4.3.bb
+++ b/recipes/qt4/qt4-tools-native_4.4.3.bb
@@ -1,2 +1,2 @@
 require qt4-tools-native.inc
-PR = "r4"
+PR = "${INC_PR}.1"
diff --git a/recipes/qt4/qt4-tools-native_4.5.1.bb b/recipes/qt4/qt4-tools-native_4.5.1.bb
index adb341d..d1962bf 100644
--- a/recipes/qt4/qt4-tools-native_4.5.1.bb
+++ b/recipes/qt4/qt4-tools-native_4.5.1.bb
@@ -1,4 +1,4 @@
 require qt4-tools-native.inc
-PR = "r1"
+PR = "${INC_PR}.1"
 
 TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-- 
1.6.3.1



