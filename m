Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RnShn-0007qk-6M
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jan 2012 11:25:23 +0100
Received: by eaao13 with SMTP id o13so1469609eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2012 02:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=wqyDDlrGq99Jv8DIvSClA3uJh2aZvVwePrgcXj56oL0=;
	b=SxFZOasU0NsBfoh1noyFO5/qDbZApW4JtRlAs9al0alelXr9cmcyXwJNhhcRbTZrC0
	4k5AMEee0YuIck6LnIaRbgBH3YTVpq8GYMyKevB/VyJpr5UvZClZaMePttwpeUKGXFFF
	kcjladKC8sz63u1Ad+Jt73zAGfBBbRZs4mumc=
Received: by 10.213.13.217 with SMTP id d25mr4394609eba.36.1326881865177;
	Wed, 18 Jan 2012 02:17:45 -0800 (PST)
Received: from localhost.localdomain (ip-95-222-156-232.unitymediagroup.de.
	[95.222.156.232])
	by mx.google.com with ESMTPS id u53sm97933185eeu.6.2012.01.18.02.17.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jan 2012 02:17:44 -0800 (PST)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jan 2012 11:17:01 +0100
Message-Id: <1326881821-19006-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] [meta-gnome] Gtk+3: Fix cups related error in configure
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
X-List-Received-Date: Wed, 18 Jan 2012 10:25:23 -0000

This patch will disable cups for gtk+3.
The issue could be resolved by adding cups to the DEPENDS,
however in gtk+2 cups is also disabled, so fixing it here in the same way seems appropriate.

Error message is:
| checking for cups/cups.h... no
| configure: error: *** Sorry, cups-config present but cups/cups.h missing.

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb
index 83a0c6d..a08fb00 100644
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb
@@ -30,6 +30,7 @@ EXTRA_OECONF += " \
                  --enable-gtk2-dependency \
                  --disable-glibtest \
                  --enable-modules \
+                 --disable-cups \
 "
 
 # Make a symlink to our libtool
-- 
1.7.5.4



