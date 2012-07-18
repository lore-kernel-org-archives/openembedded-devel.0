Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SrJgU-00088u-Px
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 04:08:15 +0200
Received: by pbbrq2 with SMTP id rq2so1546580pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 18:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=K13eVIgnLyQsJ0BhOlmkNjLqzMJYkvZBRiSxbvhhmHU=;
	b=r3vPk2RSIjGG2B0GROeMR4VrjP1AJNKk3uNVuedR1DbdVI63FJIz2lILmdt/TX4uw4
	eQUiQ/Bfrqjt/W00/Jbo1MjpsvPO+x2VgkG+KnnbaXBc4vpr9kfYD0DOU67fdtOGRbpf
	mEglCxoHOHW1MvBlAFGQok4DCNEEX2ap4dQ3oTfIUyvZTqbTAl9zLc9Ckf0el5TpxjP1
	83wtcA02uvz3Mc80oHaHW0ompKnYJ2f2RR2Q/DA2Pi0wGhUCkJfc9SlVIiRLDtt5BlrM
	SUrvYHzhZTlYhh849uBfLD5gGJKaa3Erd2TiNlFAUlen5FFo31OKrJy7Ps3InaSxAInL
	lY9w==
Received: by 10.68.226.102 with SMTP id rr6mr3088253pbc.99.1342576613813;
	Tue, 17 Jul 2012 18:56:53 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ti1sm10010816pbc.74.2012.07.17.18.56.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 18:56:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jul 2012 18:56:06 -0700
Message-Id: <1342576568-31044-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Khem Raj <rak.khem@gmail.com>
Subject: [meta-java][PATCH 1/3] llvm: Use default PACKAGES var
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 02:08:15 -0000

avoids packaging errors with oe-core master

Signed-off-by: Khem Raj <rak.khem@gmail.com>
---
 recipes-core/llvm/llvm.inc |    2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc
index 578cd40..5a46092 100644
--- a/recipes-core/llvm/llvm.inc
+++ b/recipes-core/llvm/llvm.inc
@@ -65,8 +65,6 @@ EXTRA_OECMAKE = "\
 # We need to reset this to avoid breakage as we build out of tree
 TOOLCHAIN_OPTIONS = ""
 
-PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}"
-
 PACKAGES_DYNAMIC = "llvm-*"
 
 # the difference to the non-native build is that we do not need
-- 
1.7.9.5



