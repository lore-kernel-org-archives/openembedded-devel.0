Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.26.1619208224072212639
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 13:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=T3nDeHcg;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57F436144A;
	Fri, 23 Apr 2021 20:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619208221;
	bh=W8bT+CnR4J8VVZnQuaQMJuj7/NAi6FiUwn2wjUbZGoU=;
	h=From:To:Cc:Subject:Date:From;
	b=T3nDeHcg0aB4Jqcplu8IL154yl7NkZ09I0GS+rJZI0jHYqSYWbX1k+SQvlr/vx1Ew
	 sowJBkPFZIcofMhIzYAShS6S63jKFI8mnoa6MyUCfuvAnXJlCQ+fjOnBuIRGG+Ek4e
	 OmmY0Pi0yX62DCN1lmQR1fnl6wFIpy3nShd4UyTucy8aXzyAqJDeEuRPqxKoHtjwFJ
	 9wA81gD9kDCcK2qFcHRz3svhsN4E1xVRbMNoErRwv4+3U9U1hVvkij5ISNPaNKLC1f
	 MI/oiNEYkoi8AIvpinqzh2lMbr3Bk/bhk9EW2tiNOouSUMl4/eYnqWSNtctsYmBu/F
	 PxSb0kj70P6Ug==
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH] zram: add support for mem_limit
Date: Fri, 23 Apr 2021 20:03:25 +0000
Message-Id: <20210423200325.3204-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Some targets might be interested in limiting how big
zram can grow. If the variable is set in /etc/default/zram file,
configure it in mem_limit sysfs attribute.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta-oe/recipes-extended/zram/zram/zram-swap-init | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/zram/zram/zram-swap-init b/meta-oe/recipes-extended/zram/zram/zram-swap-init
index ccc3aafe3a..28082f7ff0 100755
--- a/meta-oe/recipes-extended/zram/zram/zram-swap-init
+++ b/meta-oe/recipes-extended/zram/zram/zram-swap-init
@@ -24,3 +24,8 @@ modprobe -q zram || true
 
 zramctl -a ${ZRAM_ALGORITHM} -s ${memzram}KB $device
 mkswap -L "zram-swap" $device
+
+devname="${device##*/}"
+if [ ! -z ${ZRAM_SIZE_LIMIT+x} ]; then
+	echo ${ZRAM_SIZE_LIMIT} > /sys/block/$devname/mem_limit
+fi
-- 
2.17.1

