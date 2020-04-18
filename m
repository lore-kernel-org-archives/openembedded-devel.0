Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.2701.1587207456257583155
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Apr 2020 03:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=Z6ghJf4q;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 0BC6B6008F;
	Sat, 18 Apr 2020 12:57:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1587207452;
	bh=eBoENCjppp7ffmP/fTozyQoL1I6KM2+3oD/q6xMJ+zA=;
	h=From:To:Cc:Subject:Date:From;
	b=Z6ghJf4qGbnUJdhAFzc/Q51ruNl256op2+A/FlrgQbdUeeKWhVfwXmaTqC4dIcFSU
	 6lgR1hlJRq25POVwj+AiXjmf/31oxpPRfKhm1DsBpLfaendwtdd7VR0Wl6hnkNGljJ
	 LVOm5zVtUvR7nwB5jk6YgbV3HR7qdp82LbLFzVXGqBaDKYzSfIq+onGZm+Ij2M0vXo
	 Fl0xm0Qom4B1ZZ85c/xB7r865TTyavbVgouJ2VaAYydMO6uYMhMEsTtgImDGLpMntj
	 Y8ny2X5yVYKekH+M4BdTGYNZ+0WseK89qNzh1loV/E3AjXMyAWV4zvpf7zCB7MD7ts
	 ILdus8LYKIWmw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] fbgrab: upgrade 1.3.1 -> 1.3.3
Date: Sat, 18 Apr 2020 12:57:26 +0200
Message-Id: <1587207446-8939-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/GunnarMonell/fbgrab/releases

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-graphics/fbgrab/{fbgrab_1.3.1.bb => fbgrab_1.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/fbgrab/{fbgrab_1.3.1.bb => fbgrab_1.3.3.bb} (89%)

diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.1.bb b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.3.bb
similarity index 89%
rename from meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.1.bb
rename to meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.3.bb
index 212ba12..e3dff91 100644
--- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.1.bb
+++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.3.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 DEPENDS = "libpng zlib"
 SRC_URI = "git://github.com/GunnarMonell/fbgrab.git;protocol=https"
 
-SRCREV = "d3a8b6b42b6b74228e92758a0b015d8b8c1e6fa0"
+SRCREV = "b179e2a42b8a5d72516b9c8d91713c9025cf6044"
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep
-- 
2.7.4

