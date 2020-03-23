Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.811.1584999770574867752
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2020 14:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=jzi9UmSD;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 7921D60332;
	Mon, 23 Mar 2020 22:42:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584999768;
	bh=PvVmefClAgw1Ez7j7YML6Aon009IMpGrDCikfzjLj9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jzi9UmSDD391UlVOfhb4X4yK14ZtpN7Xl8uED4kKZ7RFaQuaOV8w8/5/fXlDiu3ku
	 FCG1Azd1/MJEv00QdiJkM8HLe7uIA7jKuLLNfLWyVubSu3O65I6HDgJMTjdJU3alm2
	 W3FbknBfoYp+vyq2cLSGrGZ1UP0x2YMs53GYBoWj0oEgKUXDFZqFLPqdZ/JYHE0/6P
	 bueLkS80T0qP9GzG1JGKgxDgTcQa7egYKBOnGt2UJy+1DwvnGzU8bFt96d3GgA3mK6
	 bWPGbGLJv1k/oB8TADjd/Elx2jMTO6b8LJgZ/CQ3NKJG6d07Ox8nOZHZQGGRXrV3VJ
	 iQlMD/6KdnpKg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 2/5] frame: fix upstream check URL
Date: Mon, 23 Mar 2020 22:42:27 +0100
Message-Id: <1584999750-7278-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584999750-7278-1-git-send-email-pjtexier@koncepto.io>
References: <1584999750-7278-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status frame
<...>

INFO: frame                     2.5.0           UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
index da1a2a3..22b9d0b 100644
--- a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
@@ -12,6 +12,9 @@ inherit autotools pkgconfig
 
 SRC_URI = "https://launchpad.net/${BPN}/trunk/v${PV}/+download/${BPN}-${PV}.tar.gz \
            file://pessimizing-move.patch"
+
+UPSTREAM_CHECK_URI = "https://launchpad.net/frame/trunk"
+
 SRC_URI[md5sum] = "02baa941091c5d198cd1623b3ad36e68"
 SRC_URI[sha256sum] = "cfb9ab52cdccd926f1822a457264d0014c7eb9f4600a72626063dd073b26256f"
 
-- 
2.7.4

