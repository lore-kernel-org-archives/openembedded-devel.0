Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UOFwS-0006po-3P
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 01:21:09 +0200
Received: by mail-ea0-f174.google.com with SMTP id m14so1506503eaj.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 16:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=BGh7Jqi6cAtWRYWvikixwIFiKb2CDMGV2A/MEbhmy/E=;
	b=dcD5iNQNmcRzHy0+q1F1vzvHwk1UI+octd6XPgHqi40LWeCwuix7A9KHxrJbbMVajL
	u0mOGykNQ9ity310aJoEuwb+vzOemxEXRYuXc5GDdixP3fqVR4NocXPlSGIQYfhcwrNE
	2HlHN9v4m0B+hMF4HXWkNbDM9uCzmsyBEooH8RrEnulSzyMC4RVy91AVNnjOHut5gJJk
	GVqMWgBdvlGXr2ihoEiUnSKSfVBwMrnS5PKHxG7Cpqj5Ow9BpUMCZyT4Xn+WuTB0vq1E
	ZeJmQqVEFyGVsvKnUgk8QMzlrrPmXa4uFhMbBl+ZEpLbwQiuY/6oVUgUG5VI12Y8+T8k
	c+4w==
X-Received: by 10.15.99.201 with SMTP id bl49mr10403247eeb.43.1365203033254;
	Fri, 05 Apr 2013 16:03:53 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2C0A.dip.t-dialin.net.
	[91.10.44.10])
	by mx.google.com with ESMTPS id a1sm18010579eep.2.2013.04.05.16.03.51
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 16:03:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 01:03:34 +0200
Message-Id: <1365203016-17804-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1365203016-17804-1-git-send-email-schnitzeltony@googlemail.com>
References: <1365203016-17804-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce++ 4/6] xfdesktop: update to 4.10.2
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
X-List-Received-Date: Fri, 05 Apr 2013 23:21:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfdesktop_4.10.0.bb => xfdesktop_4.10.2.bb}   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.10.0.bb => xfdesktop_4.10.2.bb} (67%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.0.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb
similarity index 67%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.0.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb
index c9cd924..a36f1c6 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 gtk+ libxfce4util libxfce4ui libwnck xfconf dbus-glib thunar
 
 inherit xfce
 
-SRC_URI[md5sum] = "d5f6fb9fdde3ddff5804b2a251892936"
-SRC_URI[sha256sum] = "897ae6ee435dcc89809ad70c15c5d15347d1cf4fc8033238b17dcc47836c2d7b"
+SRC_URI[md5sum] = "54a84ce63046c279fc3ec3f436d2f1b0"
+SRC_URI[sha256sum] = "49a6e0be513e307e896f7e5929825babec9bbcd4b2e73552f9d27647a4db797d"
 
 FILES_${PN} += "${datadir}/backgrounds"
-- 
1.7.4.4



