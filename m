Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB4A60167
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 13:35:06 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so4236363wgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 06:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K8HRTRFKSgh3aVQ6W7qOGsjFjJKB6wo6rxf1kjScm18=;
	b=VUhSnjBbAFy1+ZcV6+7Q7B3xZ42KLYZsuGu8FZLqN1u55nSBrGechoKfrwxXn0FGRd
	RMEsh02YrxzOsadedL4/mpTTeYjPUoWZu8544OaES0CDWS2qqkA4yn2FlyHBIHvYi98A
	m+Pyy/ciUACMwUV9CLcwo/n/2S4K0wt3Ls6vzuFrRzwmZ7xjwnoJqOuIrZ8AfMVgpHLI
	+XP8jwdg3lpcUuHA4nZl1HR14x0PtyE3wzustxT9JqxNQkh/f37qGCNoOzV8feFp7ARt
	li6b0QjSPSZSJC4BKiB65V3dCtlkFLCfZ1ri0nhWzplimMsXzYcca5qlSWvW6Aua5jFH
	+hJw==
X-Gm-Message-State: ALoCoQlL9WhO32OctIjJcEMAW6Tb0iMhsnL9IiOJq3vsCRt+wdBPhZLmWdNfssnf4L6XKFkhFzg/
X-Received: by 10.194.191.162 with SMTP id gz2mr8115784wjc.89.1406900104205;
	Fri, 01 Aug 2014 06:35:04 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	ex2sm21012447wjd.30.2014.08.01.06.35.02 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Aug 2014 06:35:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 15:34:47 +0200
Message-Id: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH 01/10] libgnomekbd: fix S!=B
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
X-List-Received-Date: Fri, 01 Aug 2014 13:35:12 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
index e9ca2a7..0381192 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
@@ -6,9 +6,7 @@ SECTION = "x11/gnome/libs"
 
 DEPENDS = "gconf gtk+ glib-2.0 libxklavier"
 
-PNBLACKLIST[libgnomekbd] = "BROKEN: wasn't updated to work with B!=S"
-
-inherit gnome
+inherit gnome autotools-brokensep
 
 SRC_URI[archive.md5sum] = "de32a6e3e3464b566eecdc4332bf34bd"
 SRC_URI[archive.sha256sum] = "ddd52c4cc7d83ad7ef964a1bcb4db87407e65b00ffc3e70c088ca4ee7383d256"
-- 
1.9.0


