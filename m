Return-Path: <brarcher@lexmark.com>
Received: from mail-qt0-f225.google.com (mail-qt0-f225.google.com
	[209.85.216.225])
	by mail.openembedded.org (Postfix) with ESMTP id 0892B77E8D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 13:25:06 +0000 (UTC)
Received: by mail-qt0-f225.google.com with SMTP id r58so7395036qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jun 2017 06:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lexmark-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=XI3ypV4GJv7eN7WPmFToZyfE8lBA6TaFkUY3awkUQkA=;
	b=wXecpCjJKCvAy/kR50+H+9gluA4O9o5KYIWIYTaprhE3HjCGG6poZyR430U1bgoNx1
	FCcgboC11RyTNcMmeWOphm4u7RZl6x8mpUoVGFh4Rxlowvu9uB+7TaQJWItPgib2TUJf
	pK8WY0qHG4iytjCZAiwbFEw/E55A7fjiQF13+cZd9hT+Dcv2d/bh0i8WDiWmGLqTHKRi
	REIgGazQi5HDNxCGChUkefyAi8DuoZAicpZhEoeKGe2GLWi+iq+XT1FzL+M9PBx6GaYj
	x1bNfa5QpwAiktKhcRz2Px0IoMLZ+SP8i+nVaYg+HlfWzuLN23fS85ajU5gL3jytccj7
	bRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XI3ypV4GJv7eN7WPmFToZyfE8lBA6TaFkUY3awkUQkA=;
	b=XqTM+hS8K7r9VvSqNu7yn2rvmo5Fntc398XWGVL9gSZKVHAG9lFsm9OY67q/giZGrl
	bYQacCK5VeNsbW25s5hcgEM37d+RrUyiO1I/w9adS+Toq8hHufdqsPDoWsBjNNB+2kNY
	JAAjOf5hznr2ynALwNiQuIUyikyYCASkpiecMS46tMjnvXODU5tG5fYICfcEteE+pIBj
	IXnuQj1CQIOz4X2g8a8jvm6dGZbi5P5I/oDp1Dif5Oo76YPoHEx8+vhrQjohCMWClXkD
	1SePiIO4kuheKiesmGfj7ED6u+NyGn4aA/nQ5YlEVdN/VOoPkWh6B32D+hqi0Hy8vReX
	hhbQ==
X-Gm-Message-State: AODbwcBsRUqa5ZklN6HOJMg7eFpVA1ddyTZfKIwxB5FtOzn7Bvxq4axL
	750YP+/j1Pf9zcSL/KEmHRYXi/mpMvKsNBuXu+w=
X-Received: by 10.107.130.25 with SMTP id e25mr7348962iod.31.1496409908169;
	Fri, 02 Jun 2017 06:25:08 -0700 (PDT)
Received: from smtp02a.notes.lexmark.com ([192.146.101.90])
	by smtp-relay.gmail.com with ESMTP id
	e74sm826331itd.4.2017.06.02.06.25.07; 
	Fri, 02 Jun 2017 06:25:08 -0700 (PDT)
X-Relaying-Domain: lexmark.com
Received: from brarcher-OptiPlex-780.dhcp.ad.rds.lexmark.com (unknown
	[10.199.110.65])
	by smtp02a.notes.lexmark.com (Postfix) with ESMTP id C1779139C0B;
	Fri,  2 Jun 2017 09:25:07 -0400 (EDT)
From: Branden Archer <brarcher@lexmark.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jun 2017 09:25:00 -0400
Message-Id: <1496409900-15381-1-git-send-email-brarcher@lexmark.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] zsh: update to 5.3.1
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
X-List-Received-Date: Fri, 02 Jun 2017 13:25:08 -0000

---
 meta-oe/recipes-extended/zsh/{zsh_5.0.5.bb => zsh_5.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/zsh/{zsh_5.0.5.bb => zsh_5.3.1.bb} (92%)

diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb b/meta-oe/recipes-extended/zsh/zsh_5.3.1.bb
similarity index 92%
rename from meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
rename to meta-oe/recipes-extended/zsh/zsh_5.3.1.bb
index 39b2d95..1f5e390 100644
--- a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
+++ b/meta-oe/recipes-extended/zsh/zsh_5.3.1.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b7bc853894664be455a922db9805288e"
 DEPENDS = "ncurses bison-native libcap libpcre gdbm groff-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
-SRC_URI[md5sum] = "6fb0e3e52a0f8de5ca63138391b81ce0"
-SRC_URI[sha256sum] = "b35cf19e4a6ba39fd03c6372b8a8760a491cc2e2e4aba3d15023ff291c2894b4"
+SRC_URI[md5sum] = "d583fbca0c2410bf9542ce8a651c26ca"
+SRC_URI[sha256sum] = "3d94a590ff3c562ecf387da78ac356d6bea79b050a9ef81e3ecb9f8ee513040e"
 
 inherit autotools gettext update-alternatives
 
-- 
2.7.4


