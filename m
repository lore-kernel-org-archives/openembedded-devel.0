Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.782.1584999771806731660
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2020 14:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=hSoTJqXG;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 5F42F60481;
	Mon, 23 Mar 2020 22:42:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584999770;
	bh=M0i3D3lFaNf7bnkCr57HKn8yhAjit/+kdZP/FkCjqqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hSoTJqXGw41L8BV8AOrhOygMWaDQcruAXj63qb72iwsNhw8lyLBr3Fgh7s1z0dAto
	 scj9ayTvBdEGOWPUVFsbWUwzYzO2UzR3vkC0lH5d8Ucu7KLiaoCA4QZrBW4UGujyXl
	 uFIM7EUqkeNLz5f17NJa59PUDLOgPQH4dQIubVjRSWxGsyFGDJnAka7driA+OMyeG7
	 Jjc+CkEcAJCXRXai28t28CuQBAfgzrX6ZWdLuRgustbO/op2VyXf97MbPIktuMJyGl
	 z0QQAx9xAJBFwV8HQqBbIBm0+JhcOH5QYKmAAgF+cyqUz9qrk1hFWtPZuG3UBD/reh
	 xsLA9kKrzvvCA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 5/5] grail: fix upstream check URL
Date: Mon, 23 Mar 2020 22:42:30 +0100
Message-Id: <1584999750-7278-5-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584999750-7278-1-git-send-email-pjtexier@koncepto.io>
References: <1584999750-7278-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status grail
<...>

INFO: grail                     3.1.1           UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
index 22fd0f4..e1d3777 100644
--- a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
@@ -13,6 +13,9 @@ inherit autotools pkgconfig
 DEPENDS = "frame"
 CXXFLAGS_append_toolchain-clang = " -Wno-pessimizing-move"
 SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.bz2"
+
+UPSTREAM_CHECK_URI = "https://launchpad.net/grail/trunk"
+
 SRC_URI[md5sum] = "0df1b3ec6167920f310e2effe6e2ad44"
 SRC_URI[sha256sum] = "5eed1f650f042481daa3a2de5e7d43261fe343b2a1b1e240f3b7fc26572c9df3"
 
-- 
2.7.4

