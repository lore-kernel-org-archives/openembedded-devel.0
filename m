Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.15104.1585930873605200025
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 09:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=N+nstMLz;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id DE6E260323;
	Fri,  3 Apr 2020 18:21:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585930871;
	bh=rufAlFHYA/Z9ZV9oVfBGlTBplGaICuZ+IM9iPUBwdM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N+nstMLzokxjB2miWSPdANkYL9xEi9HqrKgZl25G/8uPWJ4QWQS1AFLln+wjkI1cB
	 OJPdmQ1riA+JlqH0OeYZ4dFH5KOQXyzKo0AREPJFVUtIFF59UaCI6airxoj54TGSFG
	 ct8RIX9kFqPf8EESMzOR0B/2gzhLXHrBRKSbaBRo6EWvSJXccGnO3GKEuP/ANVZ4kv
	 GebwZ+AWTQcVdCNX7vT+JAiY6v2Gjth/Ozqsxexe34IjE4K4gexsx/nQ621AjnV1aE
	 Pis1VQlkTlcbg7eCeTcr0VZnh6U85u/Ie8AsM/ck5b9VsOENy1OErzrzP3gN9ya13o
	 cG75M4H1WLHfw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-networking][PATCH 2/2] nftables: upgrade 0.9.3 -> 0.9.4
Date: Fri,  3 Apr 2020 18:20:19 +0200
Message-Id: <1585930819-13325-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585930819-13325-1-git-send-email-pjtexier@koncepto.io>
References: <1585930819-13325-1-git-send-email-pjtexier@koncepto.io>

See https://lwn.net/Articles/816528/

Also remove patch applied upstream

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../0001-update-python3-nftables-reference.patch   | 47 ----------------------
 .../{nftables_0.9.3.bb => nftables_0.9.4.bb}       |  7 ++--
 2 files changed, 3 insertions(+), 51 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0001-update-python3-nftables-reference.patch
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.3.bb => nftables_0.9.4.bb} (85%)

diff --git a/meta-networking/recipes-filter/nftables/files/0001-update-python3-nftables-reference.patch b/meta-networking/recipes-filter/nftables/files/0001-update-python3-nftables-reference.patch
deleted file mode 100644
index db22434..0000000
--- a/meta-networking/recipes-filter/nftables/files/0001-update-python3-nftables-reference.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From ddbe652bf0f4ed300bae9497250130d68e4cbf5b Mon Sep 17 00:00:00 2001
-From: Arturo Borrero Gonzalez <arturo@netfilter.org>
-Date: Tue, 10 Dec 2019 12:00:45 +0100
-Subject: py: load the SONAME-versioned shared object
-
-Instruct the python module to load the SONAME versioned shared object.
-
-Normal end-user systems may only have available libnftables.so.1.0.0 and not
-libnftables.so which is usually only present in developer systems.
-
-In Debian systems, for example:
-
- % dpkg -L libnftables1 | grep so.1
- /usr/lib/x86_64-linux-gnu/libnftables.so.1.0.0
- /usr/lib/x86_64-linux-gnu/libnftables.so.1
-
- % dpkg -L libnftables-dev | grep so
- /usr/lib/x86_64-linux-gnu/libnftables.so
-
-The "1" is not a magic number, is the SONAME of libnftables in the current
-version, as stated in Make_global.am.
-
-Reported-by: Michael Biebl <biebl@debian.org>
-Signed-off-by: Arturo Borrero Gonzalez <arturo@netfilter.org>
-Acked-by: Phil Sutter <phil@nwl.cc>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
- py/nftables.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/py/nftables.py b/py/nftables.py
-index 48eb54fe..2a0a1e89 100644
---- a/py/nftables.py
-+++ b/py/nftables.py
-@@ -64,7 +64,7 @@ class Nftables:
- 
-     validator = None
- 
--    def __init__(self, sofile="libnftables.so"):
-+    def __init__(self, sofile="libnftables.so.1"):
-         """Instantiate a new Nftables class object.
- 
-         Accepts a shared object file to open, by default standard search path
--- 
-cgit v1.2.1
-
-
diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.3.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.4.bb
similarity index 85%
rename from meta-networking/recipes-filter/nftables/nftables_0.9.3.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.9.4.bb
index 65a7bcc..5b57abb 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.3.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.4.bb
@@ -9,10 +9,9 @@ DEPENDS = "libmnl libnftnl bison-native \
 # Ensure we reject the 0.099 version by matching at least two dots
 UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
-SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
-           file://0001-update-python3-nftables-reference.patch"
-SRC_URI[md5sum] = "9913b2b46864394d41916b74638e0875"
-SRC_URI[sha256sum] = "956b915ce2a7aeaff123e49006be7a0690a0964e96c062703181a36e2e5edb78"
+SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
+SRC_URI[md5sum] = "fdfd51a1083fb054a487b5159b1ed5cd"
+SRC_URI[sha256sum] = "08b8683a9db5fba980bc092b75288af98d218bbe8ab446daf2338570d0730f9a"
 
 inherit autotools manpages pkgconfig
 
-- 
2.7.4

