Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpjc-0003Jr-CR
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:58:40 +0200
Received: by wibhq4 with SMTP id hq4so1196233wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pseJI4NbjST2AMm3wTUlZQ+LO7xgb7c9hG1dFjoEGjc=;
	b=jpBFahkuSbIBGiTfWkTqA9o+zAzzOiptItdQpHBQWjrd3IZD7KK1yV11OFqZfvea4K
	RwVLyriH7w7FC3QOTmA2t6jlNuu2B4DBO+4UfVe6CtjOU4QwkCfjwWOv0oKh7DfRpt6z
	kBNkMy4szAEmDDBLOLOquFpmRmyhB6Mj1cftzGd7LKrvKJl9ygAtp6jnmUK4Z8m+mpYw
	K2WGpyLvMvFJdOGzALIDBF++f7hBlJ/1rwftu/P+qEf+mLq2a8+06LzJ3QPEQB/2nOQf
	p7vrKnN0FSuay45noRt/KswxgpOUnQAjBktmnE3P9TKjVTNiMG//gO995XxPv8R2os+I
	i8Og==
Received: by 10.216.232.84 with SMTP id m62mr1527603weq.200.1344606410828;
	Fri, 10 Aug 2012 06:46:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm7843302wiz.4.2012.08.10.06.46.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:46:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:17 +0200
Message-Id: <0e0f726c147b24e02147063e404894628ab6d195.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 22/46] evas: add evas-loader-generic + evas-generic-loader-svn to RRECOMMENDS in svn version which doesn't support librsvg loader
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
X-List-Received-Date: Fri, 10 Aug 2012 13:58:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas_svn.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
index 720703e..a869caf 100644
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas_svn.bb
@@ -2,9 +2,14 @@ require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
 PV = "1.2.1+svnr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 DEFAULT_PREFERENCE = "-1"
 
+# evas-loader-svg is gone as we don't have esvg and probably won't have anytime soon
+# http://www.intesis.hr/news/16-esvg-source
+# http://blog.gmane.org/gmane.comp.window-managers.enlightenment.user/page=3
+RRECOMMENDS_${BPN} += "evas-loader-generic evas-generic-loader-svn"
+
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
-- 
1.7.8.6



