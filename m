Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 99AFB6EB39
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:34 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id t10so2649251eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=d5v+/LRlez4gEbFFbSdAt9Wb3HECPxhW85akrCqAu/M=;
	b=hzLpxlmpdFNFfVz6JJskI92crC/s/pX1XBrGNqrWZisfINzJfG8oaqWVpSmJWtzHbp
	fEVubsgXsztqxwqMdLPmLp6Os+GdC53YLwcu0gCyLA/TEkQQhs4e/fY7uLEUoyKXWLp7
	ohoAdSUGXtu2xjN7brCwCPf1KitKCL9NKHWp+bzIVXmpq0emsRyH3OVD7Rn4CNbTygNl
	jflQolrwWAciNaIBxG55clfk73v+Zq49wEpRPZRnKYO72UTbd3PPljT86F6qq1U6gRCT
	wSahhhR3iV2E0WZ+ggTs5NaiYr2oSq/cm1emPkC6N7z8J8hx3kXLCelGG64pPefPxYwD
	q7FQ==
X-Received: by 10.14.202.8 with SMTP id c8mr237948eeo.88.1391240075302;
	Fri, 31 Jan 2014 23:34:35 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j42sm46876639eep.21.2014.01.31.23.34.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:09 +0100
Message-Id: <6276dfe6ae264b6e1ab177d9827e21143b3b79c1.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 13/20] edbus: remove old edbus(1) svn recipe
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:35 -0000

* it was moved to legacy git tree:
  http://git.enlightenment.org/legacy/e_dbus.git/
* there is newer 1.7.10 release but only efl version requirements
  were changed since 1.7.9 (see git diff v1.7.9 v1.7.10)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edbus_svn.bb | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/edbus_svn.bb

diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
deleted file mode 100644
index 5b13b9e..0000000
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
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


