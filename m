Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.7776.1586003791363118657
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 05:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=ONJIvgPX;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id C0E816035D;
	Sat,  4 Apr 2020 14:36:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586003789;
	bh=S36fUhhIw8tCemLHkOr+WTMyI/dVPbbvKlkSokcaTBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ONJIvgPXA1Ln8TlBWhwZj9c86mXx+fbBjUYWpyr7O56csWWXZfQD6KYqY6xdEjh4T
	 fg1197i5KcJYjXTPMXhW+fQR0YMrKM+NjjpO5owangGMK0/7ii5D5jPkzjmyGY7jy8
	 OE/O2NDRO1C3nlt3Mgt8+d3uQJHKS7fkzRSOJoLs+iz/UtpMwtJXmBKaP8m6ytfo93
	 7HoSPZO3Sxs3+L74B6pjnkJLepf9rh1EC5cbEGqJdUM2xCoP4g6/HqI26r3Tbg+y5w
	 DFT9WV9kF9K2O5NkULaW8pfLWUYFnt2OP7W0xo2CmeMLIrFV9VuMDV0LxDSA6/B6my
	 Ns36bByRmh0yg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-networking][PATCH 2/5] relayd: use UPSTREAM_CHECK_COMMITS
Date: Sat,  4 Apr 2020 14:35:58 +0200
Message-Id: <1586003761-12873-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586003761-12873-1-git-send-email-pjtexier@koncepto.io>
References: <1586003761-12873-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status relayd
<...>

INFO: relayd                    0.0.1           UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-networking/recipes-connectivity/relayd/relayd_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
index 98dc41a..e3134e4 100644
--- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
+++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
@@ -12,6 +12,8 @@ SRC_URI = "git://git.openwrt.org/project/relayd.git \
 SRCREV = "ad0b25ad74345d367c62311e14b279f5ccb8ef13"
 PV = "0.0.1+git${SRCPV}"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.7.4

