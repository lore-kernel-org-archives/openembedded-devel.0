Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id D2E7D6B36E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:05 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so216485ead.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=99WMrBCQw4dl3mkDqBvRC3S12MCqiFFyZgmAbTCPYvI=;
	b=nYHud9aadKjom0yEDmEWRAETjFD04ggcuUE8IBdzcymoEJekPFkWVCVwSYi1Kj7P+G
	DNtAEnEHxihzO+TMo1RN43XaAvHr/5bQN0hKFXh29TgDjviswRgyzsKJlheBGHOb7VJf
	FaOkyazACio00NSz2gQ5oawdraLPJHVF5KFp8HIYrua5hg+1Nshg1eTlJUuA7+7EPohI
	4QNdNN+BC6uK1lc13DxMZ938joRTxlNkOu6imD6E8fOKvGn5iYgtfjC4aNtjbcmQoEnt
	3rB+PKknn7tHiYSx6mPm4sarAn41LFm4C+yZfVUxIXDRQNgEZ70e+z1xinVy5tFb2Tl8
	zLkw==
X-Received: by 10.14.32.197 with SMTP id o45mr37838698eea.9.1374669666305;
	Wed, 24 Jul 2013 05:41:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c3sm65903650eev.3.2013.07.24.05.41.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:53 +0200
Message-Id: <0f7d67a775aedc355fb46aa84a0a4903f2535f2d.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/29] joe: add PACKAGECONFIG for joe
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:06 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic
* ncurses-libtinfo dependency is added only when ncurses is built before joe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/joe/joe_3.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/joe/joe_3.1.bb b/meta-oe/recipes-support/joe/joe_3.1.bb
index 6c9190f..7c5922d 100644
--- a/meta-oe/recipes-support/joe/joe_3.1.bb
+++ b/meta-oe/recipes-support/joe/joe_3.1.bb
@@ -3,10 +3,12 @@ DESCRIPTION = "Console text editor with good functionality, good choice for vi-h
 HOMEPAGE = "http://joe-editor.sourceforge.net/"
 LICENSE = "GPLv1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=da10ed7cf8038981c580e11c1d3e8fb6"
-RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/joe-editor/joe-${PV}.tar.gz"
 
+PACKAGECONFIG ??= "curses"
+PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,ncurses-terminfo"
+
 inherit autotools
 
 SRC_URI[md5sum] = "2a6ef018870fca9b7df85401994fb0e0"
-- 
1.8.3.2


