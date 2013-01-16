Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TvOfh-00068q-1R
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jan 2013 09:48:34 +0100
Received: by mail-ea0-f171.google.com with SMTP id n10so397710eaa.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2013 00:33:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=Cx9CYBqX2cIKStcj85qsElS4vKTRExvDFbYVGB4fcAQ=;
	b=SLrmy/Im7fOpgXovs1xIXkv6Ndtvrx0xBvkNoxbpYf9jp05PI7F1UfRIw5xSfp6L7D
	2qoV6PAy/n7/I4g1gPo29LLUsmh0RUMI+RvjEHincNKnnyv6poyv5siHsfJ5LGxGHeQ7
	iPfXCQo/ILVS+5TZbIpFkYJ+0rtojD5Bv27X9m5NGb0MsQ3x/wSPWdggtTOWgkpqYLpG
	aGlWH425OYKgiLL4zJ8fxJoYS/bM0goIeNWdYWJ/HtUJLyDDiabCoGlE+wVuifix7fgd
	ATOMI+dAz+3Cv3y9URkjyvwHv9Qe1HdWlSoGrbdWs+RyvSTayegNr0/Zp+YDhoHhMw5e
	bDoA==
X-Received: by 10.14.194.4 with SMTP id l4mr742890een.42.1358325191621;
	Wed, 16 Jan 2013 00:33:11 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id w3sm28613338eel.17.2013.01.16.00.33.09
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 00:33:10 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Jan 2013 09:32:45 +0100
Message-Id: <1358325167-18862-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
X-Gm-Message-State: ALoCoQk92+Zd4Joh3jhpTys/8mJ380hgg2ayKAGG2Zf6DZqth+ej66VIepAWtOufbpEK66uppehj
Subject: [meta-oe][meta-gnome][danny][PATCH 1/3] cheese: rename eds-dbus to evolution-data-server in DEPENDS
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
X-List-Received-Date: Wed, 16 Jan 2013 08:48:35 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* was renamed in oe-core
  commit 6189a8a05620974c098d548c26502453f371fe26
  Author: Saul Wold <sgw@linux.intel.com>
  Date:   Thu Apr 19 17:26:01 2012 -0700

    evolation-data-server: Rename from eds-dbus

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
index d6d61fd..4ac667b 100644
--- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
+++ b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
@@ -2,7 +2,9 @@ DESCRIPTION = "Take photos and videos with your webcam, with fun graphical effec
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
 
-DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg gnome-desktop eds-dbus"
+DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg gnome-desktop evolution-data-server"
+
+PR = "r1"
 
 inherit gnome
 
-- 
1.8.1



