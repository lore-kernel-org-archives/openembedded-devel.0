Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 68A576AF44
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:24:11 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id o10so1138690eaj.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wVEIj6PARkVK+138HT6pRLkmaOd9PolyPA0442Yj8Eg=;
	b=eOXOcE3vNeZE4iYGKeBOPvfGlzhrMXNtgxgXNAASBWEMmm+M9+Gh38CCe6veYOUN49
	afchKjID6KhOJ+ZZkQTz4YcIbHSYd7TCCvwx82YpQu4twwPbfms6D9vRDpxJkT2WiRU3
	DinZu5vzlrhj7eABn4ceeF2u+UuFWCwzw/vCRF1UkF1MeG/dWHLFYsL8eUeG6I8LpDrQ
	sg/3nTnKUxxPQD8oSicGOyci6FWAUHyP58aWAhnydQnb2H8zxDVZSY2i9KE712k+oO5w
	jI1yCSVvSYDxPRTjMXzwMXFPvango2qzjUeC+YmYcvd1hfH95rB9mRD2SfsQvy4cB5id
	8Peg==
X-Received: by 10.15.34.129 with SMTP id e1mr9430075eev.80.1372987451884;
	Thu, 04 Jul 2013 18:24:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m1sm9554230eex.17.2013.07.04.18.24.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:24:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:23:54 +0200
Message-Id: <3c6284dd3582089d516471f0e8480b4b5bf527a4.1372987207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
References: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987207.git.Martin.Jansa@gmail.com>
References: <cover.1372987207.git.Martin.Jansa@gmail.com>
Subject: [PATCH 10/10] iso-codes: add missing dependency on gettext-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jul 2013 01:24:11 -0000

* msgfmt is called in do_install and both MSGFMT variables
  are empty without gettext-native detected in configure
  %.mo: %.po
        $(MSGFMT) $(MSGFMT_FLAGS) -o $@ $<

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb b/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb
index 9502923..ed89a12 100644
--- a/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb
+++ b/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb
@@ -8,6 +8,10 @@ SRC_URI = "ftp://pkg-isocodes.alioth.debian.org/pub/pkg-isocodes/iso-codes-${PV}
 SRC_URI[md5sum] = "4073466e57df23d39721513219e4f7ae"
 SRC_URI[sha256sum] = "0a7cf177c25b3f0d77c60a5f1149aab9e03ba70f69bac70138a867efe19a1d97"
 
+# inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
+# are inhibited by allarch
+DEPENDS = "gettext-native"
+
 inherit autotools allarch
 
 FILES_${PN} += "${datadir}/xml/"
-- 
1.8.2.1


