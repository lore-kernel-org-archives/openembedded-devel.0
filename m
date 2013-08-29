Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0B26BDEA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:25 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so346860eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=4iFMFWP0p2jAapNAXLFeiUzWxeOYc4a5vf8fwUaq7Po=;
	b=rIB3/POiNQo7TM1ERWdAkGRTOxCheqb5lMJVHr/jEKyPpq5Widj1e754MmdZrPhCP6
	Q1OLSu3eT1q6BpxNM60OlBOnaLyv+yGoqBC14OOgSikJervDiWBYZ6gY1wfqzCwa2+Hh
	WJHU+TKKWNkHHXJnuZdeziF+HvYHf8OoQ1fob0wJx3yIzaFE/I/4cdlGUVd2W07lIpC9
	fBtbV4afk2oll2mYoP1jolqj4WhklxpNOmbUK1ft8nuatehPj9dGEnFJgUsNCUeiYdLo
	F1HI0Oex/ZoKLVnjhLp/VWxZFltV0RJHYW9GwwKaaBYjtW5+mHtRXbABHWZYtGzQp49d
	uf0Q==
X-Received: by 10.14.122.132 with SMTP id t4mr5433451eeh.20.1377791485557;
	Thu, 29 Aug 2013 08:51:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm47237594eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:20 +0200
Message-Id: <6dc74083bc021b7b1194a8e7a4ddb1b3df39f314.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 27/66] xterm: Add fontconfig dependency
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_293.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_293.bb b/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
index 20e88f1..9eb12fe 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/xorg-app/xorg-app-common.inc
 DESCRIPTION = "xterm is the standard terminal emulator for the X Window System."
-DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
+DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses fontconfig"
 
 LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=33;md5=3aaef904421576f75ce2ee32af88c375"
 
-- 
1.8.3.2


