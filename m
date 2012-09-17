Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDZEO-0000xC-7n
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 13:11:12 +0200
Received: by wgbds1 with SMTP id ds1so2529352wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=64KlJYF9UsOYtYXf1yTnBHvNSA0Os+wQH3CnfGqN6AA=;
	b=BZxwOhmB1hp4TuzgLmk6t7V9qMiUMTZHxdFSvEdwWmzrrTMHZ/vLd9/WYFsLLOrz8X
	zo7jJ3Y43D0oPJhR6d8gmTvuYwMuL5cM/E5UGua8XdCLop/V7AL1ZGQsbig+8K733eji
	fKxXkixbFpOYNGCs2I0Czd2YCQGNwkgKHe4Qxet5gszj3rgUG6zKhKzAbv4I51FOQ7NM
	CB58euedFa1j7vxWyFSjoGRDfFYdn3yuG4fB2ZdZbzfPG8HhvMqwgmOyaMGHJ1FbXS08
	ah7z1/stsWjrKQBhIiLqdwIs5GnCoS6NQ712gATk5dJ5JMniG2RxITUM7AObYhtPL5u5
	p4cg==
Received: by 10.180.79.229 with SMTP id m5mr15348916wix.13.1347879508942;
	Mon, 17 Sep 2012 03:58:28 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id cl8sm17277618wib.10.2012.09.17.03.58.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:58:28 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 12:58:10 +0200
Message-Id: <1347879491-2425-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
References: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnjYkZGoJI3QwO5yg8Pz5m/WYhdT0bIVKgfjSiKUSs//m3khtDUuXCGGgoOxWdiWq4YTFPF
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][systemd update 5/6] gdm: do not rely on dev-tty7.device
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
X-List-Received-Date: Mon, 17 Sep 2012 11:11:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Error message was:

[ TIME ] Timed out waiting for device dev-tty7.device.
[DEPEND] Dependency failed for Gnome Display Manager.

run tested on overo/xfce

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/gdm/gdm/gdm.service |    3 +--
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb   |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm/gdm.service b/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
index 72a56f9..dbfc4f8 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
+++ b/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
@@ -1,7 +1,6 @@
 [Unit]
 Description=Gnome Display Manager
-Requires=dev-tty7.device
-After=dev-tty7.device systemd-user-sessions.service
+After=systemd-user-sessions.service
 
 [Service]
 ExecStart=/usr/sbin/gdm -nodaemon
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index d71c7d8..6ebd587 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolekit libpam gnome-doc-utils gtk+ xrdb"
 
-PR = "r7"
+PR = "r8"
 
 inherit gnome update-rc.d systemd
 
-- 
1.7.7.6



