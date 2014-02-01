Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB686EB40
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:45 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so2750005eaj.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=CQe9ldqe95bq+FkMlsX9ZAsNeg2OFObOTD+4c3oGOqg=;
	b=Dj5JaeoU4zxZGYf2/ca/oASQq137pGZ3L3RFF5vWaBK9XCeIvYFWEbu91yDxjucQou
	7JjOzHkluiyU1m4hvXSsSEb/5HUrQ4KJT/zVsl4R6etKBzpWz9BdMEYpK15CC6mh4zQ+
	392hw8EY01IiFt1t+5oC/5N+hqMVYYURJqmYVVxqR+7uvtYYNsNtK6OPnE9p14UwyPqc
	uoWGMOH4Ll3h7AfidpKe1sfrNSEYhm2pKI6z88iFP6uU2Qvee2gKypw/amSyGoHZOQMp
	ga7t2fJbeAV19Q/WABeihq13o4Te/K59Ae/EipsVudZe+oSHsVNVQQMCTYH++YxoKOm1
	DmSA==
X-Received: by 10.14.6.5 with SMTP id 5mr23745379eem.51.1391240086401;
	Fri, 31 Jan 2014 23:34:46 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z49sm46313971eeo.10.2014.01.31.23.34.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:15 +0100
Message-Id: <26b4ecf1541b52389f26f901e27ce1bb11330d24.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 19/20] packagegroup-efl-sdk: Update SDK-EFL for shared source tree efl
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.inc | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.inc b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.inc
index 89c9f9a..64c034c 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.inc
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.inc
@@ -1,13 +1,8 @@
 SDK-EFL = " \
-     eina-dev \
-     eet-dev \
-     evas-dev \
-     embryo-dev \
-     ecore-dev \
+     efl-dev \
+     elementary-dev \
      edbus-dev \
      lua5.1-dev \
-     edje-dev \
-     elementary-dev \
 "
 
 SDK-EXTRAS ?= ""
-- 
1.8.5.3


