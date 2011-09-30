Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9clQ-0007eY-Mu
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 15:04:29 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1747506bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 05:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LbeSbvuQ0azuOsoUGtuPNVmC19Bs0Ol2rA5nzRsED4w=;
	b=TgeYe38ixNLbECZIujv2DJeB7EHI+/6cbXGtsUErGK93A17QVEQPW7bAD47NrR+Lq4
	9GnrwZVdCg2F/4UURPxO4XfID4Ylh6wc9fS5FfvIFd6KJ3sr2eBwTzIT7C4M4iuJ3Gvp
	W3KY7sU1gq5EJkJejROtROuXINzqHtVhf4QLI=
Received: by 10.204.135.72 with SMTP id m8mr7851404bkt.389.1317387540900;
	Fri, 30 Sep 2011 05:59:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex8sm4902471bkc.2.2011.09.30.05.58.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 05:58:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 14:56:51 +0200
Message-Id: <5be2a627791d3ccb0fa5943bf710ac1f46c2e073.1317387144.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
References: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317387144.git.Martin.Jansa@gmail.com>
References: <cover.1317387144.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 15/15] glx-use-tls: moved to oe-core with mesa recipes
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
X-List-Received-Date: Fri, 30 Sep 2011 13:06:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/glx-use-tls.bbclass |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)
 delete mode 100644 meta-oe/classes/glx-use-tls.bbclass

diff --git a/meta-oe/classes/glx-use-tls.bbclass b/meta-oe/classes/glx-use-tls.bbclass
deleted file mode 100644
index 7530872..0000000
--- a/meta-oe/classes/glx-use-tls.bbclass
+++ /dev/null
@@ -1,7 +0,0 @@
-def get_tls_setting(bb, d):
-    # until we have no prober TLS support in uclibc disable it
-    if bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 :
-        return ""
-    return "--enable-glx-tls"
-
-EXTRA_OECONF += "${@get_tls_setting(bb, d)}"
-- 
1.7.6.1



