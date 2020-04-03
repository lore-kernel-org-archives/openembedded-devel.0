Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.15028.1585930873324958848
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 09:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=ieQc+e7I;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 3F862600BB;
	Fri,  3 Apr 2020 18:21:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585930871;
	bh=C7tvSwwQqnWcM41ndKsiikR7nTsl78fltz/Ir0lVtCg=;
	h=From:To:Cc:Subject:Date:From;
	b=ieQc+e7Iz3h1rB0gQNbWsoO3Ohs87lSCUdoLcXDgki1z/+u4tCq1GEyOHq/c0YKsS
	 pyP/k9FPvOY0T5MNGjXk8HKferVZjM4LmetlqjM5/ocw0rTk3VZCNT5zs9EU/8B57e
	 +PX2+StdDxWsi3WsimJ8ykBK8rQxjdX2cSeIGkqjWUShUL2TPGhNWqWn3ZciUqjqfg
	 OIvBM6oo2jJ7iRKD2+sRvKm8Jr5JCw9wdZDa/nA0TPJ2c0ScgFXm8fEkjr7ttQjUAq
	 BtMlfb+fzOQMDNv5SG4dVJr2TrGytAWnb81JK5LCMHfpquiHZABWS3H3jDLsVyxLUG
	 slGoATf5oms6Q==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-networking][PATCH 1/2] libnftnl: upgrade 1.1.5 -> 1.1.6
Date: Fri,  3 Apr 2020 18:20:18 +0200
Message-Id: <1585930819-13325-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This includes the following changes:

ac0778e build: libnftnl 1.1.6 release
60e6d9b include: update nf_tables.h.
c8cc25b Revert "bitwise: add support for passing mask and xor via registers."
4bf470b expr: nat: snprint flags in hexadecimal
ff92868 expr: masq: revisit _snprintf()
c76d36a set: support for NFTNL_SET_EXPR
9270557 set_elem: missing set and build for NFTNL_SET_ELEM_EXPR
4c8abad chain: add NFTNL_CHAIN_FLAGS
75b8778 bitwise: add support for passing mask and xor via registers.
8db0a94 include: update nf_tables.h.
7b4848c tests: bitwise: fix error message.
ec3622b src: add nftnl_*_{get,set}_array()
629ee38 src: Fix for reading garbage in nftnl_chain getters
04cc28d set_elem: Introduce support for NFTNL_SET_ELEM_KEY_END
7cd41b5 set: Add support for NFTA_SET_DESC_CONCAT attributes
131a6c2 include: resync nf_tables.h cache copy
8fa63d7 bitwise: add support for left- and right-shifts.
3f232d7 bitwise: add support for new netlink attributes.
3fb5640 include: update nf_tables.h.
154104a bitwise: add helper to print boolean expressions.
66d6afb bitwise: fix some incorrect indentation.
35bac9a Update gitignore.
325cb6f include: Remove buffer.h
6079297 expr: meta: add slave device matching
7e15d9d udata: support for TLV attribute nesting
7f72b5c udata: add NFTNL_UDATA_SET_*TYPEOF* definitions
d16abf7 include: typo in object.h C++ wrapper
dfe3828 examples: Replace use of deprecated symbols
d95a703 chain: Correctly check realloc() call
835d645 flowtable: Correctly check realloc() call
32a8c5f chain: Fix memleak in error path of nftnl_chain_parse_devs()
ba1b025 flowtable: Fix memleak in error path of nftnl_flowtable_parse_devs()
b238876 tests: flowtable: Don't check NFTNL_FLOWTABLE_SIZE

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-filter/libnftnl/{libnftnl_1.1.5.bb => libnftnl_1.1.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.1.5.bb => libnftnl_1.1.6.bb} (88%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.5.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.6.bb
similarity index 88%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.1.5.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.1.6.bb
index e1c2720..db42954 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.5.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.6.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 DEPENDS = "libmnl"
 
-SRCREV = "a71599dc0ae1a808e970e96850ea83d77f452994"
+SRCREV = "ac0778e403eb51986ce19bcf1a6e8ae3cd83dcfa"
 SRC_URI = "git://git.netfilter.org/libnftnl \
            file://0001-avoid-naming-local-function-as-one-of-printf-family.patch \
            "
-- 
2.7.4

