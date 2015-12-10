Return-Path: <rah@fern.h.settrans.net>
X-Greylist: delayed 1482 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 10 Dec 2015 14:58:42 UTC
Received: from verain.settrans.net (verain.settrans.net [93.93.131.233])
	by mail.openembedded.org (Postfix) with ESMTP id D371E60767
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2015 14:58:42 +0000 (UTC)
Received: from rah-1-pt.tunnel.tserv10.par1.ipv6.he.net
	([2001:470:1f12:e23::2] helo=myrtle.6gnip.net ident=Debian-exim)
	by verain.settrans.net with esmtps (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <rah@fern.h.settrans.net>)
	id 1a72IC-0001HW-5F for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2015 14:34:00 +0000
Received: from fern.arb.net ([172.18.111.33] helo=fern.h.settrans.net)
	by myrtle.6gnip.net with esmtp (Exim 4.84)
	(envelope-from <rah@fern.h.settrans.net>) id 1a72IB-0006rx-Dh
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2015 14:33:59 +0000
Received: by fern.h.settrans.net (Postfix, from userid 1000)
	id 6101BB405B3; Thu, 10 Dec 2015 14:33:59 +0000 (GMT)
From: Bob Ham <bob.ham@collabora.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:33:59 +0000
Message-Id: <1449758039-17252-1-git-send-email-bob.ham@collabora.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] poppler: move RDEPENDS on poppler-data to libpoppler
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
X-List-Received-Date: Thu, 10 Dec 2015 14:58:46 -0000

The poppler-data package contains data needed by consumers of
the libpoppler package, for example evince.  However, the RDEPENDS in
this recipe is only for the poppler package.  Moving the RDEPENDS to
libpoppler ensures that poppler-data is included in any builds with
separate libpoppler consumers but not poppler.  The poppler package
automatically depends on libpoppler so poppler's dependency on
poppler-data is not lost.

Signed-off-by: Bob Ham <bob.ham@collabora.com>
---
 meta-oe/recipes-support/poppler/poppler_0.37.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.37.0.bb b/meta-oe/recipes-support/poppler/poppler_0.37.0.bb
index 8d49bbe..59c477d 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.37.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.37.0.bb
@@ -44,4 +44,4 @@ PACKAGES =+ "libpoppler libpoppler-glib"
 FILES_libpoppler = "${libdir}/libpoppler.so.*"
 FILES_libpoppler-glib = "${libdir}/libpoppler-glib.so.*"
 
-RDEPENDS_${PN} = "poppler-data"
+RDEPENDS_libpoppler = "poppler-data"
-- 
2.1.4


