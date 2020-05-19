Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.8700.1589881935109493143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 02:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=qnQusRqv;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 20A6E601E7;
	Tue, 19 May 2020 11:52:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1589881932;
	bh=vfJyOw9uzjdMnz5KZz4/dNe+WF6SuljMTGBR6tKGfzg=;
	h=From:To:Cc:Subject:Date:From;
	b=qnQusRqvvLI7c4wrTDdYpnNQLQiQy0yWXwMO9BUuAOwairQwSMtu/WHN9F9n7gkd5
	 mLsC9sQDBgBO/wMKRanLjETT92Z61IHKCqiV2xkN94U/SmWpFp6y5ll3tersRlTlfd
	 CFS6Bh9XtdY/Py9FBZ2IzosftoaLDG/aQGPOU0ZHy7mGFMS3HlCNFVuNIsgFQ+uYxW
	 Dbyr+kNSIl9IzwsZbUNaV/qRXfQPwyP9HlqU3S+hDf7o0HTZCY0Nl+dDgtoaPmO0D+
	 36iDVkR3cOFYjm+QhwKVv7ixXhue/6ynzlfHFKRBYt7t3gsNz8FlLC2wWcwKmpoxDO
	 jmJ1AMtu24mzQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] librsync: upgrade 2.3.0 -> 2.3.1
Date: Tue, 19 May 2020 11:52:08 +0200
Message-Id: <1589881928-11578-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This is a patch release that adds peformance improvements, updates and
tidies documentation, and fixes two build/test bugs.

See full changelog https://github.com/librsync/librsync/releases/tag/v2.3.1

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-support/librsync/{librsync_2.3.0.bb => librsync_2.3.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/librsync/{librsync_2.3.0.bb => librsync_2.3.1.bb} (88%)

diff --git a/meta-oe/recipes-support/librsync/librsync_2.3.0.bb b/meta-oe/recipes-support/librsync/librsync_2.3.1.bb
similarity index 88%
rename from meta-oe/recipes-support/librsync/librsync_2.3.0.bb
rename to meta-oe/recipes-support/librsync/librsync_2.3.1.bb
index e9d34ee..004c93d 100644
--- a/meta-oe/recipes-support/librsync/librsync_2.3.0.bb
+++ b/meta-oe/recipes-support/librsync/librsync_2.3.1.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 SRC_URI = "git://github.com/librsync/librsync.git"
-SRCREV = "028d9432d05ba4b75239e0ba35bcb36fbfc17e35"
+SRCREV = "27f738650c20fef1285f11d85a34e5094a71c06f"
 S = "${WORKDIR}/git"
 
 DEPENDS = "popt"
-- 
2.7.4

