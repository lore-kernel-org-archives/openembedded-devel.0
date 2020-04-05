Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.18747.1586098608442974341
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 07:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=xv4RxTOk;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 0565260468;
	Sun,  5 Apr 2020 16:56:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586098607;
	bh=UMQ7RVtxrdtoZYr8b+uQcoPRUWPrpn//+NCCal5u80I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xv4RxTOkcUGkDSgSCui+4UIEtiS02jgBlgQsszssJEy0mIuV9dqorjCFd0Y8bMLjT
	 l6hrIF2AJpwedNin1BxtzI+ALRuHGbiKVNgefMVsxdAcWn5tJnxBl6tqEkiX3HsCTO
	 KCoOS6rRLnXI6ezmH+RlCre1aeYD6788itrofd0mHdowEvb254sZ6t/lHiLdG3pTE3
	 8BekclI/+ciZWETb74JsvG5dudSTNs5YLxMloLqN6MYqTe9TF3+KDbqhvXEDiboPgF
	 Rs9m31mN4NPg9IgqS7dORX6pw3yxayHku1d0fLIrD8rRL6R2mWn/pqi8tovVLNnK52
	 mulxuobRuHLVA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 4/6] nano: fix upstream check URL
Date: Sun,  5 Apr 2020 16:56:38 +0200
Message-Id: <1586098600-13571-4-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586098600-13571-1-git-send-email-pjtexier@koncepto.io>
References: <1586098600-13571-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status nano
<...>

INFO: nano                      4.4             UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/nano/nano_4.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/nano/nano_4.4.bb b/meta-oe/recipes-support/nano/nano_4.4.bb
index 18121be..c23ee04 100644
--- a/meta-oe/recipes-support/nano/nano_4.4.bb
+++ b/meta-oe/recipes-support/nano/nano_4.4.bb
@@ -15,6 +15,8 @@ SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
 SRC_URI[md5sum] = "9650dd3eb0adbab6aaa748a6f1398ccb"
 SRC_URI[sha256sum] = "2af222e0354848ffaa3af31b5cd0a77917e9cb7742cd073d762f3c32f0f582c7"
 
+UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
+
 inherit autotools gettext pkgconfig
 
 PACKAGECONFIG[tiny] = "--enable-tiny,"
-- 
2.7.4

