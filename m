Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.8091.1585061902332221362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 07:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=FoYqrFAD;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 4AFCC60222;
	Tue, 24 Mar 2020 15:58:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585061900;
	bh=40K+/RoqQbrkEU0JCwF/t+nQG/s8R7DsySNoBNOVKQ0=;
	h=From:To:Cc:Subject:Date:From;
	b=FoYqrFAD3PZo1ZG22TssAQH++Tzg2q81UolhYAqNXTs/MHUGU+yTosOJ5M9e4WVFs
	 g/zJR3z1EksaFORyyzdoHiV6E7KvTOV80LIA9+Pc4fJYgpQyMi+wl5sBdUrNzZ6FYb
	 gzUv4EiMZmkEJJJm67MfOkGrXKmDnrjFzV/hPEa7yp5XnkyZl7+EURAwzHilkoM9AY
	 jX73Z8fIiN+BqbBm1WY/dSol3AbEIF6PCOBi84ltnmChMr0EVAEsQTvmAmJkklDq+o
	 cqV0SGMVbabqyxriWxLi0NJaVt52aUAlANJ5TLr8Tmxjz7C3Qg5V7uIxQWeGsffkbL
	 ZeGvjUc1FdqHQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 1/2] openvpn: upgrade 2.4.7 -> 2.4.8
Date: Tue, 24 Mar 2020 15:58:11 +0100
Message-Id: <1585061892-18458-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://community.openvpn.net/openvpn/wiki/ChangesInOpenvpn24

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-support/openvpn/{openvpn_2.4.7.bb => openvpn_2.4.8.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.4.7.bb => openvpn_2.4.8.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.7.bb b/meta-networking/recipes-support/openvpn/openvpn_2.4.8.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.4.7.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.4.8.bb
index 2a4eb25..7cad0e4 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.4.7.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.8.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://openvpn@.service \
            file://openvpn-volatile.conf"
 
-SRC_URI[md5sum] = "9d67cabc9b0441062ebd4e12bb7dfedb"
-SRC_URI[sha256sum] = "73dce542ed3d6f0553674f49025dfbdff18348eb8a25e6215135d686b165423c"
+SRC_URI[md5sum] = "e9cb40542e17ce295d80860690710aab"
+SRC_URI[sha256sum] = "65e1da3f3a08e7e900c175e7fc30d834881fd2dea0eb39b25325a861a9da0bc5"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.7.4

