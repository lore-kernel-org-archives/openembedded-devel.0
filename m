Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.9839.1591544662327862396
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2020 08:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=KEuLMVEr;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id DF9C7602D9;
	Sun,  7 Jun 2020 17:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591544660;
	bh=syekaiam7eNdXxSmkcyjNsv71FAylbSgsbEj8hOswNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KEuLMVErwccC6TwpUeQZhxbObR23x3k9rSLvbyMeFfUM5CPQzewiuXVKgwKH24aON
	 63/PIBA3lDl5OqUfnYna84R+TC9lIHxVYTclgqcOOIB/Wbl59/OW3n3T4D7M6F/eG7
	 L/yqEa1PQvlipSZZbCL5Y4aMbynIkjbSc6MLYR4UXqVhxIPoQBhu2LjHz2UKbCaVFl
	 D0KnTOy18oB7M9M7h2V1hR0RsQvgwuIuzpjFuX4i4qF9toqyT9cX5hovzT36ayuInm
	 pz3ISniCEgzjbLpfeP/FoYJjHU2tAPZMoC2vw96X8xex6hvIs1t1pNkgu6/9pUO9zC
	 SjuGnztK4LOsQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-networking][PATCH 2/2] nftables: upgrade 0.9.4 -> 0.9.5
Date: Sun,  7 Jun 2020 17:44:15 +0200
Message-Id: <1591544655-21672-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591544655-21672-1-git-send-email-pjtexier@koncepto.io>
References: <1591544655-21672-1-git-send-email-pjtexier@koncepto.io>

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-filter/nftables/{nftables_0.9.4.bb => nftables_0.9.5.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.4.bb => nftables_0.9.5.bb} (90%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.4.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.5.bb
similarity index 90%
rename from meta-networking/recipes-filter/nftables/nftables_0.9.4.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.9.5.bb
index 5b57abb..0fd187f 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.4.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.5.bb
@@ -10,8 +10,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
-SRC_URI[md5sum] = "fdfd51a1083fb054a487b5159b1ed5cd"
-SRC_URI[sha256sum] = "08b8683a9db5fba980bc092b75288af98d218bbe8ab446daf2338570d0730f9a"
+SRC_URI[sha256sum] = "f2c1957eabc370057c4576b8f33a71d91a6ad019b8b335abafe61c9c42cc7e16"
 
 inherit autotools manpages pkgconfig
 
-- 
2.7.4

