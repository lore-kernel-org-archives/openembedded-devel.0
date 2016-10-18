Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.1])
	by mail.openembedded.org (Postfix) with ESMTP id 5725771A77
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 08:17:11 +0000 (UTC)
Received: from localhost.localdomain (111-250-195-39.dynamic.hinet.net
	[111.250.195.39])
	by msfrf2617.sfr.fr (SMTP Server) with ESMTP id 1E8171C00082E;
	Tue, 18 Oct 2016 10:11:03 +0200 (CEST)
Received: from localhost.localdomain (111-250-195-39.dynamic.hinet.net
	[111.250.195.39])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2617.sfr.fr (SMTP Server) with ESMTPSA;
	Tue, 18 Oct 2016 10:11:01 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (PLAIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 16:10:30 +0800
Message-Id: <1476778230-105764-2-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476778230-105764-1-git-send-email-herve.jourdain@neuf.fr>
References: <1476778230-105764-1-git-send-email-herve.jourdain@neuf.fr>
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] v4l-utils: add support for "native" build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Oct 2016 08:17:12 -0000

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
index 6148695..b9732fe 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
@@ -43,3 +43,6 @@ FILES_libv4l-dbg += "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/.debug"
 FILES_libv4l-dev += "${includedir} ${libdir}/pkgconfig \
                      ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
                      ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
+
+PARALLEL_MAKE_class-native = ""
+BBCLASSEXTEND = "native"
-- 
2.7.4


