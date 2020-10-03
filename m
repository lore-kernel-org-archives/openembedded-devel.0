Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.8342.1601736317740899795
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Oct 2020 07:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=drbS6yx8;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1148-234.w90-120.abo.wanadoo.fr [90.120.95.234])
	by koncepto.io (Postfix) with ESMTPSA id 53F6F601C8;
	Sat,  3 Oct 2020 16:45:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1601736315;
	bh=YSTkCs8qIK6XYKgwOYHo5g274QvbI2UBZma6/FyhLP4=;
	h=From:To:Cc:Subject:Date:From;
	b=drbS6yx8A6eHge/XWpPD6aipL7arF76vxFSx5cafDUdRNGv2L37AVnf8EcMPKN0r8
	 PSaHTrThx/2T3IshQ8FmJ5ZjRRLRKND8X8b+e0e38uLqTegL3gS4E2XIpkmGKCEkk9
	 pMRNldKTiq/7TcpqTBinjT7+zSR6Mx6xh/m4BGVIld21Kjf483oPi/i1909aB5b8gr
	 xgBv45RmW1wGRiiZDXhhjVNrXugKapJcLvevg8RS0+kffidg8lOM9OLIb8ULxa+f+Z
	 6i90zxoXJ5BJAkEmniZKnO2JEUj0WxU2Jng/FJfOGz50zoTH3+wFXw1CDwNzgf78B8
	 +1e3S9d3WJ/Sw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH 1/1] cppzmq: upgrade 4.6.0 -> 4.7.0
Date: Sat,  3 Oct 2020 16:44:28 +0200
Message-Id: <1601736268-8352-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog: https://github.com/zeromq/cppzmq/releases/tag/v4.7.0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 0b66970..9f68eb4 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
-SRCREV = "8d5c9a88988dcbebb72939ca0939d432230ffde1"
-PV = "4.6.0"
+SRCREV = "fef905d5982aaeb4f4bac5cccbdf8bea72728a10"
+PV = "4.7.0"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git"
 
-- 
2.7.4

