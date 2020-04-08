Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.13122.1586358345445486698
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2020 08:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=bveR38Zc;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 530476022A;
	Wed,  8 Apr 2020 17:05:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586358343;
	bh=I0N4o304Ic0BeblqKO9aBxSZdPkDWSsbkcS78LCb3rU=;
	h=From:To:Cc:Subject:Date:From;
	b=bveR38ZcxsUfoEh9m89cUVXnmF3KIra9TscZvA2OppQDnVG8mD9Hni0hpI6uWkc5n
	 N2Z64bAzdJhJZ56zwe8J7sL1SXDxjYc9En5E9X9HDjCu2WJx5nD9sJjqe7PnBcQmKg
	 iMhgU8UDLC/f9qI4g8qKbWL0Bgjucz8PlX3wJhHj1W+fl2aMKkbu5JQqsKne09MXcQ
	 FtUJFAejfAhWuGc46ArOfoY1pA3c5jauQ6gk66PDhatb1SG2reeBFZBGBiQl6b3rdR
	 6uLbCR/R+9hVsMsNRd9jKpXWyqxLMDT0kiQ0OCZf9IMHXGmsDfynavMn+soXzAd2RO
	 lsPytvRNXn/Gg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] nano: upgrade 4.4 -> 4.9.2
Date: Wed,  8 Apr 2020 17:05:40 +0200
Message-Id: <1586358340-14662-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://www.nano-editor.org/news.php

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/nano/{nano_4.4.bb => nano_4.9.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nano/{nano_4.4.bb => nano_4.9.2.bb} (80%)

diff --git a/meta-oe/recipes-support/nano/nano_4.4.bb b/meta-oe/recipes-support/nano/nano_4.9.2.bb
similarity index 80%
rename from meta-oe/recipes-support/nano/nano_4.4.bb
rename to meta-oe/recipes-support/nano/nano_4.9.2.bb
index c23ee04..2b236ba 100644
--- a/meta-oe/recipes-support/nano/nano_4.4.bb
+++ b/meta-oe/recipes-support/nano/nano_4.9.2.bb
@@ -12,8 +12,8 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[md5sum] = "9650dd3eb0adbab6aaa748a6f1398ccb"
-SRC_URI[sha256sum] = "2af222e0354848ffaa3af31b5cd0a77917e9cb7742cd073d762f3c32f0f582c7"
+SRC_URI[md5sum] = "10df0100ebf4aa7bb4806428c11751eb"
+SRC_URI[sha256sum] = "d8a25eea942ecee2d57b8e037eb4b28f030f818b78773b8fcb994ed5835d2ef6"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.7.4

