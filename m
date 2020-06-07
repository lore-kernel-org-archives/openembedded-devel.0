Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.12779.1591553092776194367
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2020 11:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=b2B4U/Ld;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id DEBEA602D9;
	Sun,  7 Jun 2020 20:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591553091;
	bh=0yWPFaLIRPUZJpaPZcCyx5CMPpniIrIbx64KOG7fv2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b2B4U/LdswUvWBG4TShLsfej0e6fbLG/B1J2dQqlDJwyFUeRejQngWGYztJstd/hR
	 HnMfF0AIeNXHznpw34s2wd1rXUHkJIkY9vd+m9osZlvpwhUZve67ur3j7XoRazPsFQ
	 qus+naKKHGKU4nf7I7ZkOzRwKJN476twlhZzJ6p1XWGymBejAiWFE/eMWp3OLTulmn
	 ZoSS4/rqp+vtzwcy3Q7xvN67LQ7h0vWV7SrJ9Wc/kbpMMzwfrQNNXl231wVv+GSlha
	 FA7Wz81tw9XP9onQe6bHQgMl8OQemTmaDx9yM5NA+PHzcIQTcRqFFEiAd1CXBkXWIw
	 gt7biHbCpr7TQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-networking][PATCH 2/2] tinyproxy: fix upstream check URL
Date: Sun,  7 Jun 2020 20:04:40 +0200
Message-Id: <1591553080-26878-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591553080-26878-1-git-send-email-pjtexier@koncepto.io>
References: <1591553080-26878-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status tinyproxy
<...>

INFO: tinyproxy                 1.10.0          UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb
index 7d97f52..82d6701 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb
@@ -12,6 +12,8 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
 SRC_URI[md5sum] = "423047c8dc53a15e19f78e238198549c"
 SRC_URI[sha256sum] = "6020955e6a0ef0ef898ad5bb17a448c47f9e4c003c464b4ae7c4dba063272055"
 
+UPSTREAM_CHECK_URI = "https://github.com/tinyproxy/tinyproxy/releases"
+
 EXTRA_OECONF += " \
 	--enable-filter \
 	--enable-transparent \
-- 
2.7.4

