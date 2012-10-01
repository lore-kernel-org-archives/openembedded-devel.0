Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIhMG-00005r-I6
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Oct 2012 16:52:32 +0200
Received: by wgbdq11 with SMTP id dq11so3361604wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Oct 2012 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LOJi6d29Anim72EPrH6eJcAu9drywgcvsS/i+I4lYv0=;
	b=0Yl5CyZpKEFGsmhOYURvdYsgUkba7g1TUQ1lO6qn43xjUElp1xsh7rea83RbMBtTv+
	DQpyPOwjnCuUQOcGAwkHL/lIQVZk0Ibr5xTZWdhC/0HVVAY9YT4NPtw12yOCBgCSVIAn
	7AQNNBVTRj/EGIwF/KY22nEd6EYH2HtuQPnmFszu91Iq/1YvfIjf2mjKU7teelYcy2sZ
	sCvl1oMOC/R0dtzCy+7TxbYQ5TYh6gv0bBhjnfbjapOiXt5BhIdlKcQC+hiprPhKX7b9
	PktvDDhmLNADHS/Y6do1/vTmoIpbpfkiD1cxFiwa+fukAkO8+X8RPIOE6TUG9kiXieal
	sqCg==
Received: by 10.181.13.239 with SMTP id fb15mr15100881wid.22.1349102375737;
	Mon, 01 Oct 2012 07:39:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gm7sm6361030wib.10.2012.10.01.07.39.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 07:39:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2012 16:38:49 +0200
Message-Id: <78b75773e1968d4311c12e92b2d80c6194685f82.1349102278.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349102278.git.Martin.Jansa@gmail.com>
References: <cover.1349102278.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349102278.git.Martin.Jansa@gmail.com>
References: <cover.1349102278.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/6] foxtrotgps: rename configure.in only if it still exists
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
X-List-Received-Date: Mon, 01 Oct 2012 14:52:32 -0000

* it was failing when do_configure was reexecuted in same workdir

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
index 4572b8f..0cafdde 100644
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
+++ b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
@@ -12,8 +12,12 @@ SRC_URI[sha256sum] = "ae9706285510554cc0813ac92522e0d1672b0ddb065307bfacfcff3c32
 
 inherit autotools pkgconfig perlnative
 
+PR = "r1"
+
 do_configure_prepend() {
-  mv ${S}/configure.in ${S}/configure.ac
+  if [ -f ${S}/configure.in ] ; then
+    mv ${S}/configure.in ${S}/configure.ac
+  fi
 }
 
 RRECOMMENDS_${PN} = "gpsd"
-- 
1.7.12



