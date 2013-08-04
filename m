Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id E08876B4FE
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:23 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so1255309eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=K0hJ9AcZWa2mYU0ZsJ/DInqz+nkEYTIMoc5ovqNGqqE=;
	b=qGqPlFZ8uIn4h7XhdDLdhzY+zp3116oRfil1T/uN7oy4GucBKqKiC3Vhd1ELQ6iS6Y
	me7yAynCzqg4jrD/KCWSHBbFspG96zEtZu5p3aHoY5pW1wHKFOUeRYl6yeLmcVVNZXjm
	XEOJaR5zsWfgVUOrlE2I+kXGW6zoDViNOqyrGjyieqLtsS9ZcvS8WtdYyJmU+oldOXzW
	RYgE35ZYR1zQW7MYh9CH0UUlt0isdOmQi4eNQMcuyAY62xKdcwE1U8HVHH1/bfxJi0pH
	iSnyhAdJ4lXWx3cqsNVlkpke2qeQvZ7x4KJzym8QRLSUxQkpn0gw3AETbNmMcHLwiXPE
	tKLw==
X-Received: by 10.14.173.2 with SMTP id u2mr14252686eel.35.1375652844287;
	Sun, 04 Aug 2013 14:47:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j2sm28797694eep.6.2013.08.04.14.47.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:43 +0200
Message-Id: <1375652867-10498-11-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/15] gmtk: inherit gconf
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
X-List-Received-Date: Sun, 04 Aug 2013 21:47:24 -0000

* do_configure fails without it
  configure.ac:215: error: possibly undefined macro: AM_GCONF_SOURCE_2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
index 9aa4e04..0a4b484 100644
--- a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
@@ -13,4 +13,4 @@ SRC_URI[sha256sum] = "a07130d62719e8c1244f8405dd97445798df5204fc0f3f2f2b669b1251
 
 EXTRA_OECONF = "--disable-gconf --with-gio --with-alsa --enable-keystore"
 
-inherit gettext pkgconfig autotools
+inherit gettext pkgconfig autotools gconf
-- 
1.8.3.2


