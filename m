Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.12335.1591551798997219894
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2020 10:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=TpL66eph;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id D10FE60057;
	Sun,  7 Jun 2020 19:43:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591551796;
	bh=jliAC1E9g2bFCR2IMdbiSEsXW5cTfd9CcxIH9SB2xbw=;
	h=From:To:Cc:Subject:Date:From;
	b=TpL66ephMqNfhS9DpaBf2tN4NO3std5NtZagiH9eDSW34KC5HpORxS/F2LDHuj3HR
	 pSWHq4tlfcmmQf/wMmCpqq7XHP0GTrJSdZQdG3kU8W9KL/faRfGhzVF45n+9oUM6YS
	 +nAZfDRDWUNEY8hwpcXy7yIQ1LBhVuzguV6SAN5fVVycTOeStDMzAYniFdjYQz9lDp
	 FMi/WCKj26IW1hfsmTihXYmGdN855a87XNcCoobxhI8//Z1dvjPjYZjYUGvxNyYi3j
	 tkcbkWnWe/u6yK0uvSd3YQphwdeVJgnRphCjduO9fqITwa4/ibZVUCJsAXXA94o8VU
	 6Q8njrMAlj1VA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] jpnevulator: upgrade 2.3.4 -> 2.3.5
Date: Sun,  7 Jun 2020 19:43:14 +0200
Message-Id: <1591551794-25427-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See changelog https://github.com/snarlistic/jpnevulator/blob/master/Changelog

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
index d2819f7..50dd74b 100644
--- a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
+++ b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
@@ -2,10 +2,10 @@ SUMMARY = "A handy serial sniffer"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
-PV = "2.3.4+git${SRCPV}"
+PV = "2.3.5+git${SRCPV}"
 
 SRC_URI = "git://github.com/snarlistic/jpnevulator.git;protocol=http"
-SRCREV = "97438ecbd52fbc01540221bc590f8388a43c74e0"
+SRCREV = "c2d857091c0dfed05139ac07ea9b0f36ad259638"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4

