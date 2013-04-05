Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UOFwT-0006pt-2a
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 01:21:09 +0200
Received: by mail-ea0-f169.google.com with SMTP id n15so1575711ead.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 16:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ucxzARyinsSUZe6IAoHpro0W/M+bYeSHUqiM0EANwT8=;
	b=V9oJVsHdCFC79L7utTtri5CAADJUMiwleqiMN8/laGQfR76y+GkcE+xcKbRJnOhJPd
	Zyyj251T/JRvXnOIv3LSLzlkfQ3oLgoHrcFPvzmbcK47xYJWHY7cx0se87RXAEqwJ/Ex
	xDEeYSFnamkGEpuYk8Na8/oFuXBTkfpLRCVEot/dPVXKRXdohx+oQb8x81qd9AaheRRV
	1WDuKazLjkCciqR8TcfrRQOcs7ZeK5o8zSgiCK71tnp6tMauurOjXSSyBJMwspnLJc7w
	20w+j8CRSFDzZFOJZIHJzlK2MXvTmP8WacnF5anQuqD5t5TTUyAqq0lZ/ljtoniy0zzR
	NK8Q==
X-Received: by 10.14.1.130 with SMTP id 2mr23764565eed.15.1365203034552;
	Fri, 05 Apr 2013 16:03:54 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2C0A.dip.t-dialin.net.
	[91.10.44.10])
	by mx.google.com with ESMTPS id a1sm18010579eep.2.2013.04.05.16.03.53
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 16:03:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 01:03:35 +0200
Message-Id: <1365203016-17804-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1365203016-17804-1-git-send-email-schnitzeltony@googlemail.com>
References: <1365203016-17804-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce++ 5/6] midori: update to 0.5.0
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
X-List-Received-Date: Fri, 05 Apr 2013 23:21:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../midori/{midori_0.4.8.bb => midori_0.5.0.bb}    |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-connectivity/midori/{midori_0.4.8.bb => midori_0.5.0.bb} (85%)

diff --git a/meta-gnome/recipes-connectivity/midori/midori_0.4.8.bb b/meta-gnome/recipes-connectivity/midori/midori_0.5.0.bb
similarity index 85%
rename from meta-gnome/recipes-connectivity/midori/midori_0.4.8.bb
rename to meta-gnome/recipes-connectivity/midori/midori_0.5.0.bb
index 266df4f..cf75b82 100644
--- a/meta-gnome/recipes-connectivity/midori/midori_0.4.8.bb
+++ b/meta-gnome/recipes-connectivity/midori/midori_0.5.0.bb
@@ -4,10 +4,10 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-native libnotify libunique"
 
-SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
+SRC_URI = "http://archive.xfce.org/src/apps/midori/0.5/midori-${PV}.tar.bz2;name=midori \
           "
-SRC_URI[midori.md5sum] = "ce1b01fa5aa33d2ee50196df0c71e96f"
-SRC_URI[midori.sha256sum] = "40bf23f84a3537f54d7eb45df1da40ebef54c321b1b34d0d0c8e45bb0cce5e9f"
+SRC_URI[midori.md5sum] = "ad11685633e23f8173e2cd947d945cce"
+SRC_URI[midori.sha256sum] = "d280c19bb135f2b644a67d9f34d1ec1c148ceb14b5de11ce6c23f64c15be5df0"
 
 inherit gtk-icon-cache pkgconfig vala pythonnative
 
-- 
1.7.4.4



