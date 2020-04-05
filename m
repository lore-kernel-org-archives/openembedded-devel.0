Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.18709.1586098608534614073
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 07:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=Ql0IMsvq;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 4BC036022A;
	Sun,  5 Apr 2020 16:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586098605;
	bh=5AXqosEmqSl9L5PlJHSn093znCvvjNe9fseQxfhL/Vk=;
	h=From:To:Cc:Subject:Date:From;
	b=Ql0IMsvqBoBODuRZAlRVnA/xnUN5TvULvLT1GazWqIfTlZzCCWeXqWX2cu+4mImyg
	 BG+ZjxlDRjeLTXDpooLycAX+bT1O/Z3A1CLI5avQFamBiYPZrhJmkmHG9H6tQ0IGhx
	 2ThR7icr70GHEJ2vWf3uxvtsFGo0sc2d+fxYKACqxBvw5iPCglV7HU6GzK18Eu637u
	 9XWwcm+19LlSFNnSiUdTItHdzlWySSKvHu1D+I8BMY0aznoS2urHMv6yoUr5yrGL6J
	 9udJkUgH07Q0CcCbQb8pfwHXsPxXTDO3yH2JtnPwzU3LebuqG0gxjO2Ws7dfbA9bor
	 eZKNy3gHVuQGA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 1/6] srecord: fix upstream check URL
Date: Sun,  5 Apr 2020 16:56:35 +0200
Message-Id: <1586098600-13571-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Fixes:

$: devtool check-upgrade-status srecord
<...>

INFO: srecord                   1.64            UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/srecord/srecord_1.64.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/srecord/srecord_1.64.bb b/meta-oe/recipes-support/srecord/srecord_1.64.bb
index d3488df..4c34fa1 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.64.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.64.bb
@@ -11,6 +11,8 @@ SRC_URI = " \
 SRC_URI[md5sum] = "4de4a7497472d7972645c2af91313769"
 SRC_URI[sha256sum] = "49a4418733c508c03ad79a29e95acec9a2fbc4c7306131d2a8f5ef32012e67e2"
 
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/srecord/files/releases"
+
 DEPENDS = "libtool-native boost groff-native"
 
 inherit autotools-brokensep
-- 
2.7.4

