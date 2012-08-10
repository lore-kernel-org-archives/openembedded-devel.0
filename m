Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzpkZ-0003Mh-Dp
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:59:39 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1221497wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=72ohh9S1DPfoCvcy1cLW6zjVcDDg5ac4vhD8o+m1938=;
	b=Ji2a4otKcs4jX6qlrmkbpje4Z1aYTbM2ku8/H3SwlVGsSoQuqykAL8ejuXE6KB8IxL
	adtxiLEWls+jYe4aZiHN1j07dQlbT+1XR3HLcWshZSz9ePk/80tp3NanCog32yXGxfRp
	UQKJaEdS/1jO4XSHgpj0uTsggBfTpuTM0hueCmKu3/54O6wzv+and29One4GEo+jbkYr
	668AhZB9IV/cfAFc4wZqDPvF1Uu7+pWvoxEma27F5DP0GRFemKlmWmh9V7dM1vhGZOE3
	1ivl+jMSjbfYiN83ysG2+zQxiYQQOu3VQxxpFddD8+3sydYrrzTfF4LKge8GyXlg4VOd
	MYUQ==
Received: by 10.180.91.1 with SMTP id ca1mr6255115wib.8.1344606471930;
	Fri, 10 Aug 2012 06:47:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q4sm7835476wix.9.2012.08.10.06.47.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:47:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:25 +0200
Message-Id: <c1ee7faac4afd2d2e9e2c6475a5ab40b0dc4b79c.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 30/46] evas: use PN instead of BPN?
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
X-List-Received-Date: Fri, 10 Aug 2012 13:59:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
index a869caf..fb0342f 100644
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas_svn.bb
@@ -8,7 +8,7 @@ DEFAULT_PREFERENCE = "-1"
 # evas-loader-svg is gone as we don't have esvg and probably won't have anytime soon
 # http://www.intesis.hr/news/16-esvg-source
 # http://blog.gmane.org/gmane.comp.window-managers.enlightenment.user/page=3
-RRECOMMENDS_${BPN} += "evas-loader-generic evas-generic-loader-svn"
+RRECOMMENDS_${PN} += "evas-loader-generic evas-generic-loader-svn"
 
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
-- 
1.7.8.6



