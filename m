Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 202AA6EAD9
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:28 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so2621904eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Cr+3cwwgNZGAQ0ulu8azK1Pn56947oAy8Iol1IP1de8=;
	b=pAiS+S8lPn2eLK7dIj9NJL2GSHM4CBrQUBWiUe/IbBUWS0JmtWgrMFwCQUWAPiy3/O
	lKjgFXK9GJcx+Y8UlESghpkR+eIjBeaQHv2X8g9JIimr2YqjwCf+ZYcqB+2xBlgjmgxV
	cNuiMr+QaGooLr2JKKSchwHP2E5fWpQfQ4W07zn4vChLzEY7lABRIxYkyxh54o4w1/26
	vtU4k9OcLn3GovWh+qC0MKpigJivPRkgu1ldR++g4NHnLPgmbiSo566aDWAQl4E3PUHi
	UT4dXxMcheGFWsFkMwr2v8rqykIUXe6Quf5qgXSv5Us6VbWFWtzu/12aa5Pijz7F8BYi
	oHeA==
X-Received: by 10.14.173.129 with SMTP id v1mr484227eel.60.1391240069863;
	Fri, 31 Jan 2014 23:34:29 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id g1sm46218391eet.6.2014.01.31.23.34.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:06 +0100
Message-Id: <3e557657a51b662dafed93b528419597d2ea2ec8.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 10/20] e-wm: Drop evas-.*-loader.* from RDEPENDS
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:29 -0000

* with new evas those are by default built-in not as separate libs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm.inc b/meta-efl/recipes-efl/e17/e-wm.inc
index 659ad6a..3f24b62 100644
--- a/meta-efl/recipes-efl/e17/e-wm.inc
+++ b/meta-efl/recipes-efl/e17/e-wm.inc
@@ -60,10 +60,6 @@ RDEPENDS_${PN} += "\
     edje-utils \
     ${PN}-utils \
     dbus-x11 \
-    evas-loader-png \
-    evas-loader-jpeg \
-    evas-loader-gif \
-    evas-generic-loader-svg \
 "
 
 # Uclibc build don't have 'glibc-utils'
-- 
1.8.5.3


