Return-Path: <danismostlikely@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id F0E1572184
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 20:29:28 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id hl2so33982572igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Feb 2015 12:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wf9+bTWPki5aAqpC/ebAscLzHHIbA1MP1WEHfCk4wFk=;
	b=SPDfF+pQJ7WAtXwro2on0Y4kCaEWO53OYhG+n8Y4Cee5wleigSyX7R/X0S2YCe68PD
	0LGQhMrJrpLg7ncUxDBw2vVnLW41mZMUQCXMrGBvKyooO2DrGU8peWLrtlObfGG+me+c
	TnoujTnLfUFeSxEScXU3jBAJ6OipwitLeyy3ignTDxLLop30tJE0ODZlMyJ4XhwIS4BA
	G8Pq9Y7hb+hGggyJe79gCn6PEjCYxcNl2KfF8BUenLz8T0re74xflalXCkxZs+o9RBb0
	W9v6gXte4/HnqtCw4BIM2/QwywLG3UPotmRzEIa4je3Aw6Nk9iUiAsW25UJh2gHUqSyS
	fbIg==
X-Received: by 10.50.49.43 with SMTP id r11mr26803324ign.18.1423081769462;
	Wed, 04 Feb 2015 12:29:29 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by mx.google.com with ESMTPSA id 16sm1382580ion.23.2015.02.04.12.29.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 12:29:29 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Feb 2015 14:29:22 -0600
Message-Id: <1423081763-2905-5-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423081763-2905-1-git-send-email-danismostlikely@gmail.com>
References: <1423081763-2905-1-git-send-email-danismostlikely@gmail.com>
Subject: [meta-gnome][PATCH 4/5] gdm: Only start in runlevel 5
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
X-List-Received-Date: Wed, 04 Feb 2015 20:29:30 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Runlevel 5 is traditionally graphical. If it starts in runlevel 2
or 3 systemd gets confused and adds it as a dependency of the
multi-user target, not just the graphical target.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-gnome/recipes-gnome/gdm/gdm/gdm       | 4 ++--
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm/gdm b/meta-gnome/recipes-gnome/gdm/gdm/gdm
index 43eae95..bb5b418 100755
--- a/meta-gnome/recipes-gnome/gdm/gdm/gdm
+++ b/meta-gnome/recipes-gnome/gdm/gdm/gdm
@@ -4,8 +4,8 @@
 # Should-Start:      console-screen acpid dbus hal network-manager
 # Required-Start:    $local_fs $remote_fs
 # Required-Stop:     $local_fs $remote_fs
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
+# Default-Start:     5
+# Default-Stop:      0 1 2 3 6
 # Short-Description: GNOME Display Manager
 # Description:       Debian init script for the GNOME Display Manager
 ### END INIT INFO
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index b2ae9ac..fcd51ff 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -88,7 +88,7 @@ RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "gdm.service"
 
 INITSCRIPT_NAME = "gdm"
-INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
+INITSCRIPT_PARAMS = "start 99 5 . stop 20 0 1 2 3 6 ."
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --no-create-home --home ${localstatedir}/lib/gdm --user-group gdm"
-- 
2.1.0


