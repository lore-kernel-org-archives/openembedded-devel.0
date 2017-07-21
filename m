Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id BE70878375
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 08:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Y714txLxQyhvPMVe6vrxqENKoFopEQejTRXcmeSCGhE=; 
	b=ieZrcZocPCwm+11YIexggGdCq0hx4iRv5mHM1gzLVrKpKxdxirVL7w+VxWWerShYFVHa2MFYmRiMUXdw4jxqt7clJby3AhP/SKedqiTrtca+w5BJxEQHzUFHHTEDW6kj0M/Hb8CaofzWNFa3y9jAFpyiYFhDdXRHrXCEuF6OsP9usMHVXeVy6Z3YUjihriAkM81shQ2GVCot4bFNVluZK+Magea3tIDA3p+plDBQJ7TPGqggZlgZYGhITlA/kVlH/gPh+JG8RaFntmS1WCrc2HfJldoDAuq8XPDYV8bjd0q7VrdanQw3/ZDDr/3nUQK/8W1+4nRGYWwR+7l2WmY7Pw==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYTAr-0006i0-KR; Fri, 21 Jul 2017 11:20:37 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYTAr-0007oZ-JC; Fri, 21 Jul 2017 11:20:37 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jul 2017 11:20:32 +0300
Message-Id: <1500625232-28885-2-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500625232-28885-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500625232-28885-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [meta-qt5][PATCH] qt5-git.inc: set CVE_PRODUCT to qt
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
X-List-Received-Date: Fri, 21 Jul 2017 08:20:38 -0000

It is used in NVD for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2015-1860

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 recipes-qt/qt5/qt5-git.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index f864953..1cb115f 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -10,6 +10,8 @@ SRC_URI = " \
     ${QT_GIT}/${QT_MODULE}.git;name=${QT_MODULE};${QT_MODULE_BRANCH_PARAM};protocol=${QT_GIT_PROTOCOL} \
 "
 
+CVE_PRODUCT = "qt"
+
 S = "${WORKDIR}/git"
 
 PV = "5.8.0+git${SRCPV}"
-- 
1.9.1


