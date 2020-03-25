Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.21301.1585165339034140240
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 12:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=Dj2VPnYb;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 7CF9B6046D;
	Wed, 25 Mar 2020 20:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585165337;
	bh=zqKjFL/ODZszUhlkuOSeJ+Bsldc8aIeXyKY36Pd1J3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dj2VPnYbSd96l8vVhNXBXZSwgOpk/8GDZiE7GV4X8T5613UFYxeDidlxocmCsVqpM
	 lS60KiTDhDWAEy6ldcRjiy/QnFjb+9YsjzI7Ja/u2vglhTLMs5lGg3FBGoaWiUtnp1
	 VUgJ8mSQePmjOoE3Todelj+/7YPqGk875VMi2QR+s4qX7/S67oJxmCSPf/PHM7Jh4Z
	 kvR2rmihgjlcGuEMzJCtbYl4HXJgRO8+GjlSPNPzHEZ5gz9XebcOI4Qero0ib+gXpV
	 uMOuevWNzTkepYHlebYHbYR/aFg+KfSaAnRrM29uSDO1RKwAKwv/s5RW4u3xNWA7eL
	 L4RtIAMCalv7g==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 2/3] libwebsockets: fix upstream check URL
Date: Wed, 25 Mar 2020 20:42:11 +0100
Message-Id: <1585165332-10783-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585165332-10783-1-git-send-email-pjtexier@koncepto.io>
References: <1585165332-10783-1-git-send-email-pjtexier@koncepto.io>

Fixes:

INFO: libwebsockets             3.2.2           2015            None 9494c66d20898ddb39483427c84f152b03cbad28

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.2.bb
index 5a2244d..32ba51d 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.2.bb
@@ -9,6 +9,9 @@ S = "${WORKDIR}/git"
 SRCREV = "d880fe233020b74e058cbca95b5fb67823bbf258"
 SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v3.2-stable"
 
+UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
 inherit cmake pkgconfig
 
 PACKAGECONFIG ?= "libuv client server http2 ssl"
-- 
2.7.4

