Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.9128.1591100268076793208
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 05:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=UIO9aY24;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id F0A5E601F0;
	Tue,  2 Jun 2020 14:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591100266;
	bh=X6IAbpjvByMMYSoadh3QAXTpGX2FBDkdbsQH9ZdwMyQ=;
	h=From:To:Cc:Subject:Date:From;
	b=UIO9aY24gC+JpPB+obqfCqMFtgvP0hev4JHtKfX0kDoSEUN5nLQiHAFgWQcngwK0g
	 iUjDswij9HyLrPR7caAP8elD7IXykmwHSoZooKu6KelGmBXhDy9KhKiUvH4SCNRII6
	 Sks3NLca2Z7HBFSXULn9qkmtn6nvy16qlWaNl2Uk78aCVIlTPKOrJujZT7XYH9W/rf
	 yT3Dh5yGnj6XdLVYMybR6kk3icNrFvjO0KIXJb3rTT2mtVYbmUlUwCAt+PG1/lId5c
	 kIyDQPbZtFe2VdAH312g8x5uH4woxqqZGgqnyBOcCyjAo9ytx3CDaJQasoCJBZ+fNs
	 Y9GfXwY4GNk2g==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] jsoncpp: upgrade 1.9.2 -> 1.9.3
Date: Tue,  2 Jun 2020 14:17:41 +0200
Message-Id: <1591100261-21518-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.3

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.2.bb => jsoncpp_1.9.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.2.bb => jsoncpp_1.9.3.bb} (93%)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
similarity index 93%
rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
index a88410f..97c6361 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
@@ -11,7 +11,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
 
-SRCREV = "d2e6a971f4544c55b8e3b25cf96db266971b778f"
+SRCREV = "6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp"
 
 S = "${WORKDIR}/git"
-- 
2.7.4

