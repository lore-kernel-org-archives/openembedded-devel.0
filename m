Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id BB5966BE3D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:48 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so340568eek.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=W019yZhkBBjkzYPZXGS74aKchl1irMynxlD2s2THmIU=;
	b=LbY77qdVJGI4qyCCaTAcVn7gof9rVpKXaNvSGH+Bv9HYhVqvY5pLuaGGQSbPnLnuRs
	gZDtXErfkxLcjuqy+gwn6IOSNnDQFpXqaNj8XTKlVEy3RilcGh+LDiq8EGHjeV//qiXd
	DJNX+u6b37u48aj1MfN7Of7Qd7bTYp6SBoaXNXby0Zvsxow+3U79FJVdSn/Iiq73TIEx
	weaOybp6pQK/xZFkVxGdUrjLGP5NciKXGCcWGeDx8fu+ca+Jc1aGOab+xs5SqktXjRa8
	EWLNPkN6bGRvu9WnPW405H/XsyUexfATMxYUm4UDw06Pnn07OWxvS7P20eboTle00weD
	iN1g==
X-Received: by 10.14.178.66 with SMTP id e42mr4586060eem.67.1377791509199;
	Thu, 29 Aug 2013 08:51:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm47205517eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:38 +0200
Message-Id: <0b2dee7382ae4335a4959e075b12bf7d9e17b7da.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 45/66] gnuplot: Add PACKAGECONFIG for cairo
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/gnuplot/gnuplot.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot.inc b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
index b72bbd7..96d6ee2 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
@@ -4,12 +4,15 @@ HOMEPAGE = "http://www.gnuplot.info/"
 SECTION = "console/scientific"
 LICENSE = "BSD-4"
 LIC_FILES_CHKSUM = "file://Copyright;md5=243a186fc2fd3b992125d60d5b1bab8f"
-DEPENDS = "virtual/libx11 gd cairo readline"
+DEPENDS = "virtual/libx11 gd readline"
 
 inherit autotools
 
 acpaths = ""
 
+PACKAGECONFIG ??= "cairo"
+PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,cairo pango"
+
 EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR}/.. \
                 --without-lisp-files \
                 --without-tutorial \
-- 
1.8.3.2


