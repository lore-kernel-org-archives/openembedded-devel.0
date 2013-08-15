Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2BBCC6B7ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:14 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so181059eak.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=pI4UQjK0AJDQQs80Y9YSj2uePf4RVgu9VgmCGM3Nygo=;
	b=mGvzYVYcZEfqdSQK1ME7o9l6DeGCNYbtDTooKfHW4NiolNWh7W0Q+nsZ0uaX3sqo9U
	tYVuaLElEDrGp0HQfbX2bpbWYvp6hvSAzk6l31ZZcAJNLASq+Ac1ETWkvICxEr5MKegM
	LnH9rwXYTQcb/3LQ0xq03FK4LHXCE9G48hvAriRKS04ko5WNgzXq3VhD7E0zVzEUbsjD
	/LE6xEgOF8ajw7jObZ539f9k7cBN/bKGW4eDK/lRrXoTgw1LZTi7VUiCSyapNjKYZdCe
	peTHQIQFlyHIZ45E5ObNhz8O3Y3la/2s7BoOb2tJVjs5a4DHWeQs5vAf6XelTKPIuECj
	5GmA==
X-Received: by 10.15.33.132 with SMTP id c4mr20855526eev.2.1376551154525;
	Thu, 15 Aug 2013 00:19:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm81953233eeg.13.2013.08.15.00.19.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:56 +0200
Message-Id: <0766821991bbb34cb2e8a8bca4d4ba245f4b4c8f.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 16/60] iso-codes: add missing dependency on gettext-native
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:14 -0000

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
1.8.3.2


