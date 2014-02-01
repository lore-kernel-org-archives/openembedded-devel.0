Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id C47196EB50
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:43 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e53so2643352eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=6y3HnKwTVfS8asjg74oRPMFWdlYpiEFlwoJLWtSUyss=;
	b=fNg1Ton9L+Ic+V1LmDp0G34fHefcdz7NIFbOytAB8VHE5bIHLnDuf99e2PuhElI31a
	QKmNJra23HItvMFHKgFfSCjFN4zaRB5MMbVv6x2w39eUE1bIzkS7ne/AlFIyc7207HTA
	BAPfRVOQqDw+otLKOkUYtqVr5cK67jFpmISpz7hyGbZkYBLC/d6jwOouwMXuAjfYYzPi
	sc8ahkZXMjG0h9goB/NIyI+0kKqVC1xHflWLjgyc2LUqQR7R1zEOi/jQXM8ad6MmkJbf
	OOcos8b65Z/j6BpljUJcufBAMGin2DuVFZoku2spbBAGh3/rszSlXWqZO8/EOYKh4N6I
	RXxg==
X-Received: by 10.15.52.194 with SMTP id p42mr29579731eew.11.1391240084415;
	Fri, 31 Jan 2014 23:34:44 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm46156216eel.2.2014.01.31.23.34.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:14 +0100
Message-Id: <ca9950ccdb4a6d0927cdbdb1f9b5bdde3f1c1702.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 18/20] elfe: Replace svn with git version
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:44 -0000

* bump PE to cope with +svn -> +git

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/{elfe_svn.bb => elfe_git.bb} | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
 rename meta-efl/recipes-efl/e17/{elfe_svn.bb => elfe_git.bb} (41%)

diff --git a/meta-efl/recipes-efl/e17/elfe_svn.bb b/meta-efl/recipes-efl/e17/elfe_git.bb
similarity index 41%
rename from meta-efl/recipes-efl/e17/elfe_svn.bb
rename to meta-efl/recipes-efl/e17/elfe_git.bb
index f6d6fdb..fcb97a9 100644
--- a/meta-efl/recipes-efl/e17/elfe_svn.bb
+++ b/meta-efl/recipes-efl/e17/elfe_git.bb
@@ -1,10 +1,15 @@
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
-PV = "0.0.1+svnr${SRCPV}"
-PR = "${INC_PR}.1"
+PV = "0.0.1+gitr${SRCPV}"
+PE = "1"
 
 require e-module.inc
 
-SRCREV = "${EFL_SRCREV}"
+SRC_URI = " \
+    git://git.enlightenment.org/enlightenment/modules/${BPN}.git \
+"
+S = "${WORKDIR}/git"
+
+SRCREV = "1ec0e7713c3ca901014811ff78277d9e2aaac981"
 
 DEPENDS += "elementary"
-- 
1.8.5.3


