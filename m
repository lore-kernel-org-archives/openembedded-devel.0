Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi3O-0002Sw-Mj
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:16:10 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926125eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=aREG2baXf6OUwyHrhbTTZFfm+FHWFx6lrXnnw5nc5kI=;
	b=pAMZyoP7wUPqpixBJDDoE9l9sYuG40qnOBbyr9B/p+hAD3/AZG0Lnw35zeV4k5r1AU
	zZVYbnNfvi4EuFb8zJXCPzaR9BAQOI+m2ygHNJKHOkfA19ICh3g7qRrwJ4VsfitxFj6q
	gTD9WsruSsAKpYzBilJ4K//+WToPsG+yLeb4XVG75ac33T2LhPursWp3ArX0sqoymaEC
	KqCnVewuAkD2ZlnkQ3YfR5PvEyZGuM/w231FerXK2MfFHmzbwOIYt6aXeICui909m4Z/
	ZRshHYlG1yzyttnu53Sisyns3p6wZEF2tpsKznNaP8cgizUcsfwxdRCPgDf5x4uZlZ2S
	bpeQ==
Received: by 10.14.175.133 with SMTP id z5mr42859397eel.15.1354586511114;
	Mon, 03 Dec 2012 18:01:51 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 44sm25510927eek.0.2012.12.03.18.01.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:01:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:49 +0100
Message-Id: <af08d8dd5b631b5da4759f6db33c56f580088cef.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 16/58] uptime: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:16:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/uptime_svn.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/e17/uptime_svn.bb b/meta-efl/recipes-efl/e17/uptime_svn.bb
index c6d7434..a296a5e 100644
--- a/meta-efl/recipes-efl/e17/uptime_svn.bb
+++ b/meta-efl/recipes-efl/e17/uptime_svn.bb
@@ -1,4 +1,7 @@
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
+                    file://COPYING-PLAIN;md5=c910b645eda0005ccec46f75203dc96e"
+
 PV = "0.0.2+svnr${SRCREV}"
 PR = "${INC_PR}.0"
 
-- 
1.8.0



