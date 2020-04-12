Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.13549.1586705406045281597
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2020 08:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=SczeMyPF;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id A76B5600BB;
	Sun, 12 Apr 2020 17:30:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586705401;
	bh=OrQHJMAeATD1l+3S1fttWczHtEt8SWO4cIyFBZT7E0M=;
	h=From:To:Cc:Subject:Date:From;
	b=SczeMyPF14ZUeQij6q7RTmJaJ5SxAyXslNVfZ0vwo7jPGDlfzm8P9eKiTHNA2XlT6
	 T2wH1UpgysnwDe2E/j8sOCI2Z1JsLBzfGeDgXAp1v9ry9MuEBJH/r+hUpzJDNB8X/K
	 LtA5pY27AAL4ellgyQ0A6FaYyuB1O6haOIi0fO0Cnl4Njw2KM5r254PunzER3XgWKn
	 yaid9b9+aJpYgaklyxKXLnZhlEWAONPI5Rdc4zpds/D9SJGnffV772Pjshdt2jfTbx
	 jA9GJHR9APzIWs77YoIty7ZF0XQFMG84lv88b5dupp2xeTOW+QmJALKK3nkS1mpHB/
	 rMgPEas5B//sQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] nlohmann-fifo: use UPSTREAM_CHECK_COMMITS
Date: Sun, 12 Apr 2020 17:29:59 +0200
Message-Id: <1586705399-17347-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Fixes:

$: devtool check-upgrade-status nlohmann-fifo
<...>

INFO: nlohmann-fifo             1.0.0           UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
index 326a4ab..a97eb53 100644
--- a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
+++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
@@ -10,6 +10,8 @@ PV = "1.0.0+git${SRCPV}"
 
 SRCREV = "0dfbf5dacbb15a32c43f912a7e66a54aae39d0f9"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 S = "${WORKDIR}/git"
 
 # nlohmann-fifo is a header only C++ library, so the main package will be empty.
-- 
2.7.4

