Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sw7hl-0002Wb-7X
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 10:21:25 +0200
Received: by bkcik5 with SMTP id ik5so2442894bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 01:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=HN7FnFmOOAHyskmDdoIREEsRZWtZD+5TQfYnRJ9j+Qo=;
	b=0kLQsAo1RpZbgCIgXxw0ORyuJYYolQdA7ntKxJM3uh1g+XPjtqapMDprFxym5THB06
	TL81zvNgqS5DhJCpNEXwlOXKyEPO8yrBOG7PAguFABpVkDTZy6e5an2W3mdjuM3pdGq/
	oX8M6gJTI4b+p+DUytvHF2ctj6PV5KicH5g5sgFKf96a6Vg9jHYuRRDKCb9kTaegp9pT
	nj/v+z8B1yDMwqLMJ2plQdqbnZynSRFpDPP8k4ZCA9Q3KML6sRqq6YPv7eXPafEDPHt0
	VidKQcwnbwooJbZcqT6tvjAls+w01a7nTRULJtTSehlTuJk0gBOtdTCZ9KoxvOSbwV2N
	QHIw==
Received: by 10.205.118.14 with SMTP id fo14mr5055229bkc.130.1343722188505;
	Tue, 31 Jul 2012 01:09:48 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4759654bkc.5.2012.07.31.01.09.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 01:09:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 10:09:18 +0200
Message-Id: <1343722158-9303-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-gnome] gnome-settings-daemon: remove gtk-doc from inherit to unbreak build
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
X-List-Received-Date: Tue, 31 Jul 2012 08:21:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error message was:
gtkdocize: GTK_DOC_CHECK not called in configure.ac

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gnome-settings-daemon_2.32.1.bb                |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index 6567080..9ea523b 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "GNOME settings daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PR = "r6"
+PR = "r7"
 
 DEPENDS = "libsndfile1 libxtst glib-2.0 polkit gtk+ gconf dbus-glib libnotify libgnomekbd libxklavier gnome-doc-utils gnome-desktop"
 
-inherit gtk-doc gnome
+inherit gnome
 
 SRC_URI = "git://git.gnome.org/gnome-settings-daemon;protocol=git;branch=gnome-2-32"
 SRCREV = "0160f6725cfb872e017f3958f108792c3b882872"
-- 
1.7.6.5



