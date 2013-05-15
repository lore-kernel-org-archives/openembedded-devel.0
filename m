Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdpn-0006lD-CQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:41:43 +0200
Received: by mail-ea0-f176.google.com with SMTP id k11so1016878eaj.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Mfprtml+oQJjk++gnHzuYcKBJL3dbnv+hjIAilgUCwU=;
	b=iDtGrar5snArwMtv0N+nRwldmLoSfjDpdwZ9C/W7affNW5YeJXjNw7Ue8wUHrXsCSg
	wQSjJ88X85xZ8J+LSCn0DQCujxItEhLa7w6R2ZQoHBn9nXWj6b6KyDyGFZYvtIgGw1aR
	ExgMEegnPHh3T/6Cg22roROdgHJuqZRyLbhcq7Zh8LpBOxTHzMQe3TPcaEjuV9xsHGNc
	vq5pdUVy+V+YHUIVqf29Da2lqIhEWcxzV/mz2XsAgpa0vNK9fmHGwgU0X+f2710AMwxk
	KcG8pIq2gquSAFzZVQDicT5SX8xvHQGIeaAcB7yC33XFKDeXyzR7f/zq+fk6seRGCfMf
	49DQ==
X-Received: by 10.15.49.199 with SMTP id j47mr60470617eew.24.1368631410682;
	Wed, 15 May 2013 08:23:30 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:46 +0200
Message-Id: <1368631259-13401-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 01/14] thunar: update to 1.6.3
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
X-List-Received-Date: Wed, 15 May 2013 15:41:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../thunar/{thunar_1.6.2.bb => thunar_1.6.3.bb}    |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.2.bb => thunar_1.6.3.bb} (85%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb
similarity index 85%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb
index 973eb47..fc80dc9 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb
@@ -3,12 +3,11 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm dbus-glib startup-notification libnotify xfce4-panel"
-PR = "r1"
 
 inherit xfce
 
-SRC_URI[md5sum] = "a446103ab90855cc8ba484dfeedb82d8"
-SRC_URI[sha256sum] = "7dbd172ae396e7a2533f47dc1ff703a9ea1a61af3edfdc6f4877b9b9331abd85"
+SRC_URI[md5sum] = "4f10d5d5576ce5127308d6badbac3afa"
+SRC_URI[sha256sum] = "9a2706f6881ac29cda9f0b0325d179153bc09e37bcbafcab9823c1c1ec89579d"
 SRC_URI = "http://archive.xfce.org/src/xfce/${PN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
 
 S = "${WORKDIR}/Thunar-${PV}/"
-- 
1.7.6.5



