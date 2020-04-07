Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.4841.1586244752416245507
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 00:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=F1MXvYrI;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 22DAC6029D;
	Tue,  7 Apr 2020 09:32:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586244750;
	bh=HFzA0cPX6l7eXp8sKo2Hi1AImSPAOPPii9P0wYT6fgM=;
	h=From:To:Cc:Subject:Date:From;
	b=F1MXvYrIVovW4rl/AKzyJ/bb1nD+hXajxwkY9Rm0zjP3mZbWoh+rDu1KovXnPiZoV
	 2tXMhD+xG8bGyZBbicc6uk1Ape0/GrZEqPNAI+0EI+AxMUSMthd0G01mhp64L1ADHQ
	 Xr9UutYgD1ZDeRzPuHRRXkHVi6oPs1ybrlurHud042ZXWd3EU9BnPY7W/Qptv6yQYk
	 proi4qTsWwQBZt5Fg5t9veM6JNsgTG4tcM7qCM5pT3qKfSrzt2cP5+5gzKfVWipDCo
	 CAObtJaEJ8/LwTdaoyUdiJBpXuN5Y13A4QyczEtd12XR0JVuVJpjXe1S99da+xgksE
	 J8bDwH41U1fDw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] librsync: upgrade 2.2.1 -> 2.3.0
Date: Tue,  7 Apr 2020 09:32:24 +0200
Message-Id: <1586244744-7325-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/librsync/librsync/releases/tag/v2.3.0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-support/librsync/{librsync_2.2.1.bb => librsync_2.3.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/librsync/{librsync_2.2.1.bb => librsync_2.3.0.bb} (88%)

diff --git a/meta-oe/recipes-support/librsync/librsync_2.2.1.bb b/meta-oe/recipes-support/librsync/librsync_2.3.0.bb
similarity index 88%
rename from meta-oe/recipes-support/librsync/librsync_2.2.1.bb
rename to meta-oe/recipes-support/librsync/librsync_2.3.0.bb
index c2f28fe..e9d34ee 100644
--- a/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
+++ b/meta-oe/recipes-support/librsync/librsync_2.3.0.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 SRC_URI = "git://github.com/librsync/librsync.git"
-SRCREV = "5917692418657dc78c9cbde3a8db4c85f25b9c8d"
+SRCREV = "028d9432d05ba4b75239e0ba35bcb36fbfc17e35"
 S = "${WORKDIR}/git"
 
 DEPENDS = "popt"
-- 
2.7.4

