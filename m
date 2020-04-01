Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.10195.1585755189083956281
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 08:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=a2Oi8qT9;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 0808D600BC;
	Wed,  1 Apr 2020 17:33:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585755187;
	bh=s6xlKZAnsliusrB8lXBMUz68EU/XST4wXrnpqbEuxfY=;
	h=From:To:Cc:Subject:Date:From;
	b=a2Oi8qT9B1bp6NwxnlhqliXcuAZ7gy2kqLrSyEcvmoG+jlIMb/K9gbuTlrdYHiozj
	 pw4dLMushGwcTRV2wIAXJcp6/ML/5NVhJuDYE6bjStS7NMIJZ7opUQBo+IJEeaOlcn
	 6RZeEyXP+Irr+jJ5f2mYMclRZcQPMA+Y1ZQbJ6Qyck1YoIUo/ASjv87TVRBgGOYKAG
	 HNV5dg00AfLg7BbEtBs7928/Zb1OFXq0Ta2Xbj34tXt70TjN69szCL81mp+Hot60Vt
	 HDEJHOTyS2K2ykiaeUvEu8ntJyvKNyahsvGBC+bz05nwGyFs8yHFJvgd7imTV41Oam
	 A4Qp/LgMwlpjg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 1/2] poco: add UPSTREAM_CHECK_GITTAGREGEX
Date: Wed,  1 Apr 2020 17:32:19 +0200
Message-Id: <1585755140-23538-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Fixes:

INFO: poco                      1.9.4           UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/poco/poco_1.9.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/poco/poco_1.9.4.bb b/meta-oe/recipes-support/poco/poco_1.9.4.bb
index f1dabcd..fcd5219 100644
--- a/meta-oe/recipes-support/poco/poco_1.9.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.9.4.bb
@@ -16,6 +16,8 @@ SRC_URI = " \
    "
 SRCREV = "b95393dcc3640807838e8323b4e600e54d2e8116"
 
+UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
+
 S = "${WORKDIR}/git"
 
 inherit cmake ptest
-- 
2.7.4

