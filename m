Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHGTS-0001ds-6e
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 17:25:46 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so2131488wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 08:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=GejuU/wmOAu/Gq1IAzglbsB0bd8sN/O91JHB79yAw9Y=;
	b=dqKv6F97KsnlVs6KrKtafdwT+BqC3dk3ahj9ukGzdt4ZON636ylqJO+/5DS6Tsugd9
	RhZ5Qa+7k7wyybJeu49STEKEHPqRNZbEN4tMxhq1jqT3d4ohPNEtyhOtZbHHVBd4J64f
	eazLdhU9KsYYCfIfe7ch5aAPmSBQwQ47m+9ws6tJZO9gC6McLSB48QfkKanKw020Pupg
	z+Q6WSbmUf054+syCCLUS0Hhh11GywOmngH17kHbmeRD68VpRlwj1l5d+p7CYjek0C+H
	UJCaTR/FWn/pMcNFPNow8x2/wskhYOfckh+W4K50fAUk7hT6WH5dzoQBm04u7e55V7Lx
	fnEg==
Received: by 10.180.100.230 with SMTP id fb6mr19372577wib.3.1333984591861;
	Mon, 09 Apr 2012 08:16:31 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n20sm50103968wiw.5.2012.04.09.08.16.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 08:16:31 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2012 17:16:11 +0200
Message-Id: <1333984573-28464-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
References: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnqihnaGQsJlO72fL6kocRM89/h+/wY79b9HtIL0rDzRE4F6QAq50ARe3xFHa8gFCwdGSih
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 08/10] gvfs-gdu-volume-monitor 1.8.2: remove conflicting files
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
X-List-Received-Date: Mon, 09 Apr 2012 15:25:46 -0000

 * check_data_file_clashes: Package gvfs-gdu-volume-monitor wants to install file /usr/share/glib-2.0/schemas/org.gnome.system.dns_sd.gschema.xml
        But that file is already provided by package  * gvfs
 * check_data_file_clashes: Package gvfs-gdu-volume-monitor wants to install file /usr/share/glib-2.0/schemas/org.gnome.system.gvfs.enums.xml
        But that file is already provided by package  * gvfs
 * check_data_file_clashes: Package gvfs-gdu-volume-monitor wants to install file /usr/share/GConf/gsettings/gvfs-dns-sd.convert
        But that file is already provided by package  * gvfs

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../gvfs/gvfs-gdu-volume-monitor_1.8.2.bb          |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
index c87b63e..689f455 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
@@ -4,7 +4,7 @@ BPN = "gvfs"
 
 DEPENDS = "gvfs gnome-disk-utility"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 # we need gdu files only: reduce files to delete in libexecdir
 EXTRA_OECONF += "--disable-gphoto2"
@@ -15,6 +15,8 @@ do_install_append() {
 	rm -rf ${D}${includedir}
 	rm -rf ${D}${libdir}
 	rm -rf ${D}${datadir}/gvfs/mounts
+	rm -rf ${D}${datadir}/glib-2.0
+	rm -rf ${D}${datadir}/GConf
 	rm -f ${D}${datadir}/dbus-1/services/gvfs-*
 	rm -f ${D}${libexecdir}/gvfsd*
 	rm -f ${D}${libexecdir}/gvfs-fuse-daemon
-- 
1.7.2.5



