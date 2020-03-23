Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.810.1584999770495965065
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2020 14:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=ZHHe9QJh;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 1B98260338;
	Mon, 23 Mar 2020 22:42:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584999769;
	bh=t7JXjBdwF5SpP1KcVOOY8FNVMfnXrl1q08GDbujDKM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZHHe9QJhhallk0OcX3Zrg3zG0dDvhm61Z89vHCwUfWcdQ8a9EqouPOpHPzMK1ptz5
	 6HQxINMW+EhEzPMQWQmCHQMe8ai0ErUWOKrLXTHGNsXSitEq1jfvcJtjuC/0dijEU2
	 teUX4MUNn1EOSAlj9hF9bI3jk+9t0j99mi+AWWDAoPTtYNKKQfurYXJk+gw4bdK1DG
	 4qFOkmFABp2/4sDpz/5XdoxtnBpCxmEL61Pq8N9wFTxJj4VUR2hr0FYdm9MAT8oPDb
	 iR4iagdxM6+6N9p2K60H16FJLTmvnLM03BYY24pE1ZZ+6Jo/bTzLZ48dDa3RDi0Nlr
	 wrXYWZ4oIKgUQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 3/5] libmemcached: fix upstream check URL
Date: Mon, 23 Mar 2020 22:42:28 +0100
Message-Id: <1584999750-7278-3-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584999750-7278-1-git-send-email-pjtexier@koncepto.io>
References: <1584999750-7278-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status libmemcached
<...>

INFO: libmemcached              1.0.18          UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-networking/recipes-support/libmemcached/libmemcached.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/libmemcached/libmemcached.inc b/meta-networking/recipes-support/libmemcached/libmemcached.inc
index d9a821d..319ab29 100644
--- a/meta-networking/recipes-support/libmemcached/libmemcached.inc
+++ b/meta-networking/recipes-support/libmemcached/libmemcached.inc
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=865490941c91ba790f0ea78dec93bd60"
 
 SRC_URI = "http://launchpad.net/libmemcached/1.0/${PV}/+download/libmemcached-${PV}.tar.gz"
 
+UPSTREAM_CHECK_URI = "https://launchpad.net/libmemcached"
+
 TARGET_LDFLAGS += "-luuid"
 TARGET_CFLAGS += "-D__USE_GNU -D_GNU_SOURCE"
 
-- 
2.7.4

