Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpFnI-0006fE-BV
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 10:02:28 +0100
Received: by mail-ey0-f175.google.com with SMTP id l12so265605eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2012 00:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=EKlgPbsk0ExMcHSeVysyYliZv2zAPhQLYiXR5IfrTQ4=;
	b=o7KjDXBWb08Dp+Pvbmb2D10RrvGrYJdf8CHotK49hSpjFXx4yqgLqhTFwa1hFKMBB9
	/H0aQ8SfmY/hPOOzFecgV6N2IB0hlo0CT3/h8BoQE7t12/5zyb6dE24JtN4mE8gkd6hM
	P9RmD//WN6H7MGiqK6tRneHcAOaD/j3AhAE80=
Received: by 10.213.27.147 with SMTP id i19mr1395618ebc.6.1327308886695;
	Mon, 23 Jan 2012 00:54:46 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r2sm51264099eef.7.2012.01.23.00.54.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 00:54:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2012 09:54:19 +0100
Message-Id: <c1dd58f9d07686a8914b6a4d966380f177fd3240.1327308791.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
References: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1327308791.git.Martin.Jansa@gmail.com>
References: <cover.1327308791.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome][PATCH 3/8] eve: bump SRCREV for compatibility with newer webkit-efl and deprecated elm APIs
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
X-List-Received-Date: Mon, 23 Jan 2012 09:02:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/eve_svn.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index 7836c8b..23e7f3b 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "evas ecore edje elementary webkit-efl"
 PV = "0.3.0.0+svnr${SRCPV}"
 PR = "r2"
-SRCREV = "${EFL_SRCREV}"
+SRCREV = "67278"
+#SRCREV = "${EFL_SRCREV}"
 
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
-- 
1.7.8.4



