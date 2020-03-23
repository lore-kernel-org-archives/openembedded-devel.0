Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.765.1584999770415499617
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2020 14:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=Jrow0wAA;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 9B49560031;
	Mon, 23 Mar 2020 22:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584999767;
	bh=gnbKm0kgun8TPbzjmh9f5ZhDhtkXF6S8XkfCcL8iVa8=;
	h=From:To:Cc:Subject:Date:From;
	b=Jrow0wAAtVM0UmczoihpnAHJgQKTiHHG//GQFi1K5LMPhej24hAcBvrKhjokjhHYN
	 jXl/5Fbl/QZ+PYtiIjJFxJ9FGd7q7DOGeygbMyXMbai1xNKoxLlujDckHWMEVRlXIF
	 eyjuWT2VEDwCymFzslNfm4tiTocoZOcQbm7QQidSwyepjU1IwU89rUDM5TDOagdqGJ
	 ZZ954EqPSd/N1bgR8jqkcAxbEcLSOXeOaX+8jVsOqrPA2oR91UsX2e1gfPKz5V0GdG
	 /J5TZ7D/o3r/qoxS9jnmblBgFenip1HKYpAnKMZnnH8OA5Hc8vKBjduUlXYQyuJY+Q
	 e68FiTE7KiqMQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 1/5] ufw: fix upstream check URL
Date: Mon, 23 Mar 2020 22:42:26 +0100
Message-Id: <1584999750-7278-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Fixes:

$: devtool check-upgrade-status ufw
<...>

INFO: ufw                       0.33            UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-networking/recipes-connectivity/ufw/ufw_0.33.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
index d620e88..42fc262 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
@@ -17,6 +17,9 @@ SRC_URI = " \
            file://0004-lp1039729.patch \
            file://0005-lp1191197.patch \
 "
+
+UPSTREAM_CHECK_URI = "https://launchpad.net/ufw"
+
 SRC_URI[md5sum] = "3747b453d76709e5a99da209fc0bb5f5"
 SRC_URI[sha256sum] = "5f85a8084ad3539b547bec097286948233188c971f498890316dec170bdd1da8"
 
-- 
2.7.4

