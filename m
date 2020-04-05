Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.18710.1586098610875998059
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 07:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=K4/UmUt/;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 69D4F60489;
	Sun,  5 Apr 2020 16:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586098608;
	bh=PMBksLru8pa2Vdpxm9pHNRtPAMmDApAw72SCtvNna2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K4/UmUt/oK5jqWvaw4q1ICCwbJUMyCzBJLoDHvfzrHGYgCXoIKCqjAbXfPAqzJpNC
	 sIOg6GyFUw3z+1oG2UrM+LI9JEYx9e3uNHtuacnEFHqJ2NazBigi99uTtKUQgd0EQ+
	 odY86PgA/uZuLCg/TmxCH55+qUNb3njVCk9OkdMh3MY02lEnpztOgj4eWQsmY9T5Si
	 +Txg0CJYm6OGjQUoAJjtTGjB48IwUuGpiyOWXHTfm6HOQ8JKRtpvKLmhrVqavPo1EK
	 /z0ItO0uD3RR6yWSZ6sJYUKrLsi8Gtx2TsH0JaTbYL9j4V51CRB1CC+1+kkeH0rTfz
	 GeUd9aNwqZz8w==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 6/6] cunit: fix upstream check URL
Date: Sun,  5 Apr 2020 16:56:40 +0200
Message-Id: <1586098600-13571-6-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586098600-13571-1-git-send-email-pjtexier@koncepto.io>
References: <1586098600-13571-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status cunit
<...>

INFO: cunit                     2.1-3           UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-test/cunit/cunit_2.1-3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
index 98f2cac..babf804 100644
--- a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
+++ b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
@@ -11,6 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/cunit/CUnit/${PV}/CUnit-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "b5f1a9f6093869c070c6e4a9450cc10c"
 SRC_URI[sha256sum] = "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214"
 
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/cunit/files/releases"
+
 inherit autotools-brokensep remove-libtool
 
 EXTRA_OECONF = "--enable-memtrace --enable-automated --enable-basic --enable-console"
-- 
2.7.4

