Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.6952.1586616671451702250
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Apr 2020 07:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=H8V9wXya;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 4B75F600BB;
	Sat, 11 Apr 2020 16:51:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586616669;
	bh=TkXXmPe1SO2hla/TbfuSPWpAPDpPX62AT5SuJI9Cn4w=;
	h=From:To:Cc:Subject:Date:From;
	b=H8V9wXyaUAnscQsz8/AFYJNP6WA95xboupX9kL7qGVKgKNhpGwmLVyN+xA0p1VcoD
	 s9+Ev89RuIHO0h8TkcVMeZBTFcRlytOHfjYs/IBfyi3Wj7qm/4FWvT2tTbURyz4Mk/
	 5cxnKlPoTxhn5/Lh6cmOvYBAkeMONwoXTzw/YQxjbmV8VgweH+8W4suDzmrZsCfkEf
	 qXhVvd5yfMpjUksXj78/zDCbvWcNcQYAEqeLf9zz/lOVgYimhQUkPCoWV94ojMpYTj
	 UWHaclf6IsvjSN8qQXT/gojDR7rXKkq7/26KxVFORMrxGSzoBSj43GjsEYO7OqLW+e
	 eVWdq48CorAtg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] tmux: fix upstream check URL
Date: Sat, 11 Apr 2020 16:51:02 +0200
Message-Id: <1586616662-32321-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-extended/tmux/tmux_2.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/tmux/tmux_2.6.bb b/meta-oe/recipes-extended/tmux/tmux_2.6.bb
index fba5156..17c2fba 100644
--- a/meta-oe/recipes-extended/tmux/tmux_2.6.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_2.6.bb
@@ -11,6 +11,8 @@ SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.g
 SRC_URI[md5sum] = "d541ff392249f94c4f3635793556f827"
 SRC_URI[sha256sum] = "b17cd170a94d7b58c0698752e1f4f263ab6dc47425230df7e53a6435cc7cd7e8"
 
+UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
+
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= ""
-- 
2.7.4

