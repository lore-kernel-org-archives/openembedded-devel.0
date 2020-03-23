Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.780.1584999771131066565
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2020 14:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=DyPOVfWa;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id B14A36046D;
	Mon, 23 Mar 2020 22:42:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584999769;
	bh=1G/nIVn5IzRE5834ycfGZVimt+0xQnXfeK7rFfFdjGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DyPOVfWaHGFEkrc+g6eM4QLUv7KgrfO5BQg5P59WKwTs0kUjlU2bo9P9ccVSdAtdd
	 oN8LZYJILr780B5o2EZYnAZwDAg/caQXQLN9KEtJ281trmdMiUJArPho9AnYz/wqfo
	 9gOz4hFoWasgf4/DcbiaivRBa/+9WRRicShSBI/cmR93GiduJSz8sqkz9kDfCAFvso
	 Iw/is/0zM3ugZHoCTKJyC+UuEYWvyRLc3B4uEB+ElRkq6i+AlNiiFc2f/0UDnqhuFa
	 toSmrhF4BQItsbIUWvjmjdLExUHy/lRpRVFmLoV1lkAuJANCrOPyQSZykdC1FCiuOk
	 1lXkP4pOPcQaA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 4/5] geis: fix upstream check URL
Date: Mon, 23 Mar 2020 22:42:29 +0100
Message-Id: <1584999750-7278-4-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584999750-7278-1-git-send-email-pjtexier@koncepto.io>
References: <1584999750-7278-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status geis
<...>

INFO: geis                      2.2.17          UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
index 9362a5c..b9858d2 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -23,6 +23,9 @@ SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.x
            file://fix-indentation-for-gcc6.patch \
            file://0001-libgeis-Compare-the-first-character-of-string-to-nul.patch \
            "
+
+UPSTREAM_CHECK_URI = "https://launchpad.net/geis/trunk"
+
 SRC_URI[md5sum] = "2ff9d76a3ea5794516bb02c9d1924faf"
 SRC_URI[sha256sum] = "8a60f5683852094038904e690d23cc5a90a980fc52da67f0f28890baa25c70eb"
 
-- 
2.7.4

