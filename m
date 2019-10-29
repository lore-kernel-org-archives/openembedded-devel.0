Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B08F07FA37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:06:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472Qh434hvzJm
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 10:07:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572340020;
	bh=+37eadK1wiMj+/HFIC8e0l+psfNzdMiv8y2bsLYNDLU=;
	h=From:To:Subject:Date:From;
	b=U0x58nHdgzKIpAKCLN9uMkuGuufg5VVtfyI1WIQc9U345UY6Z0I2uqog074GSUbd6
	bxRLymfnwVhbEYuSwHYAE9ob/wQwWLLGW6ytDeheRQZr0KbNpg0I+BqaLeD4ZNaIog
	oScfOCI00cHUv9tOw/uGCTxNnC7JWe9xOdU56yqKpjtEh3lqmdsP9d7qPJYtoO8BRn
	AxopYfYU4/3SYN52/EaXpnzfaB0qhgh/3K2+JD/5fGc7y8pR4LxMdAJox9qVL1+dWI
	difgx2roiMtVPYTSeTPwYNEkoHixSKnQHZwEOu7WPLNgG4ABXQXv4tBHE3wXdeV7oT
	i5XtKWLKl31PK0utlXGyAEZvFUbR821xd2smDo3LSIxdqEq3AVX2WppSlRZd/9Iwps
	7uCBnBATnfuMwj02sj26zoAOvcs7qwV+QmrJ9yMJGb3wCBjs+nH+7XyTQQHqkKVPcH
	X0xf1bSbwYM0G3lpFYgFrLgoa9aZKGMyxqd1ysXNdxS6I2RxrNFNwvCM0JVVq85Xvi
	L+nsBXXoE3/91t3zBisf6aqyjfiqpru9D0ZcJPFZgryQUz/y4ms0oE350lM6jSz++0
	wg9Zd6ea8WClsBaWbgCbFlw2y2ebFqWe2NZm8TNXBZD7qDriz5Vp8MvvZc4zsvBvR4
	/L+uTOXNjXHl4+exQiSgtNB0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 11:06:57 +0200
Message-Id: <20191029090657.30771-6-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] dovecot: Upgrade 2.2.36.3 -> 2.2.36.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Oct 2019 09:06:59 -0000

The release contains the CVE-2019-11500 fix.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../dovecot/{dovecot_2.2.36.3.bb => dovecot_2.2.36.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.2.36.3.bb => dovecot_2.2.36.4.bb} (95%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.3.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
similarity index 95%
rename from meta-networking/recipes-support/dovecot/dovecot_2.2.36.3.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
index be633e03b..239a25273 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.3.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://0001-doveadm-Fix-parallel-build.patch \
            "
 
-SRC_URI[md5sum] = "80c1c271b1c4cbe26a793f4e3b09eb8e"
-SRC_URI[sha256sum] = "992521305fa1d61f4726aac2619ccc65094a3cc2e5c80644455199764305863e"
+SRC_URI[md5sum] = "66c4d71858b214afee5b390ee602dee2"
+SRC_URI[sha256sum] = "777c61e264869e9b288b8d6603f4ed3ac3aac9ec573908067353f51269dce2fe"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
-- 
2.17.1


