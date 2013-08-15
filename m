Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 156006B7C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:45 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so177932eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=99WMrBCQw4dl3mkDqBvRC3S12MCqiFFyZgmAbTCPYvI=;
	b=VxVDuBNSTpMsM7eGn+loY8rHTj4RmVzR0ErtvcP6e8Ov21ZJIsyzpvSGnmM6DnO8V7
	lyjIfNvtAQ4Cr7eglTtwdmhX98CxUZe1coM7BC8erue1A6/laGEIMgwbyrlXuZxp4oA7
	1JS02Ot0eZUQCoucCNY+GteUG0QfpFyDFUwGJGdwZas/EQWbyJanSErqY6xSFgPtBxLl
	xHfmWN78C2YUuRXA9RV9UdcQopulwRo04U79LqcLnnYETUANc0jSQJvqYF7WmhMd8xVp
	BHMDTFsojarKGqFQGRM8aP1xy4yU2NafxHk0FjR2SDiS7QCo8EjPXBFAzVg7YAYMaCaq
	WlHQ==
X-Received: by 10.15.64.194 with SMTP id o42mr1760376eex.62.1376551186504;
	Thu, 15 Aug 2013 00:19:46 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm81933814eeg.5.2013.08.15.00.19.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:20 +0200
Message-Id: <7626e2a2c460c650f9156d28b09e5c635721da3a.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 40/60] joe: add PACKAGECONFIG for joe
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:46 -0000

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


