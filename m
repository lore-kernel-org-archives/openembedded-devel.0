Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srbpc-0000fg-4S
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 23:30:52 +0200
Received: by wgbdr1 with SMTP id dr1so1625270wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=U8wAX3HDd8rV+coZvss1fZpRTDC4B0peg0AM5Ni2/r4=;
	b=cgD1OyQP3wjjUVK7DjVoB7nSjcKSHsulhV3+4VaSnqKJz1G2u2DIcsiPLNFVhJWd9m
	GcJQHnn27Bju3s3KLYKKNpzCkdVU7MbCFJSxCiaMBgNT1An4J8dO35yDqEjvoVaHRvUc
	cSGsXC7NMuBuLiIMB1/xvGXQqSSfw2Kw1W+V01tOu+zcq9Kl+hm3eiq2WJHKmLPLwIOm
	OOG6HtWw9GmXJ8y0nk7KGRkc7Wl+1nxywjpPu2phmu7U8DH1jStI87eK7WSHMrf/V+Vn
	pFoLx5gD/7YPqLQ9qwSsVCO+Xg5diRoOgK2a6vfGzbKHtReUIY2CuYGrzxLs+7A7cGYO
	tVKQ==
Received: by 10.217.4.193 with SMTP id u43mr490265wes.129.1342646371307;
	Wed, 18 Jul 2012 14:19:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm361310wix.6.2012.07.18.14.19.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 14:19:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 23:19:12 +0200
Message-Id: <a9e7075eb705dc00b90aaf1ac5ba9d37eff82a48.1342645937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][RFC 02/14] eina: do not remove bindir, it's not created with new automake
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
X-List-Received-Date: Wed, 18 Jul 2012 21:30:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/eina.inc |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/eina.inc b/meta-efl/recipes-efl/efl/eina.inc
index 8c9a0df..4a77de3 100644
--- a/meta-efl/recipes-efl/efl/eina.inc
+++ b/meta-efl/recipes-efl/efl/eina.inc
@@ -11,7 +11,3 @@ inherit efl
 AUTO_LIBNAME_PKGS = ""
 
 FILES_${PN} += "${libdir}/eina"
-
-do_install_append() {
-  rmdir ${D}${bindir}
-}
-- 
1.7.8.6



