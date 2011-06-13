Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1QWBMU-0000RD-92
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 19:55:42 +0200
Received: by wwi18 with SMTP id 18so2758926wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2011 10:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=DFAR7JvIYrD9NrepbR2TqNtf49hiCXo5SL4EbnFPpxQ=;
	b=PnZpBXjGD6VOfqazZHYCYdNlzKKEhVcZscwwYAt6ALZC84SY0oOkGOMKcoQFI4RH/o
	AciZdBdo4juOuxMD1JH2JheAtN1M/nQcTVnAgrsNWPAwbFvK197lkRx5K+Zzff5Od5IR
	q0OK7K4vYflnNAh3lrStljNngmp6NTnM/1yOU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=NqV7kSq6E55b1jBotK3olLY7LtDuCicD+Js/GqSQCuRhcItTh50yl6VJKQ0DhXgM1c
	m5FB1n0BXG5JXBPgwkfSFR8rWDyKz9VimxTbKV+UJxWsYLZny24K0a8g9RnuPtN5oHti
	+/Pm4R2FiCyyccF4QExoWkhbW27ja2z5YWv4A=
Received: by 10.227.54.6 with SMTP id o6mr5476507wbg.83.1307987538101;
	Mon, 13 Jun 2011 10:52:18 -0700 (PDT)
Received: from localhost.localdomain ([90.163.82.81])
	by mx.google.com with ESMTPS id ex2sm4392966wbb.65.2011.06.13.10.52.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 10:52:17 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jun 2011 19:52:11 +0200
Message-Id: <1307987531-2625-1-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [PATCH] enjoy: add alsa and autodetect gst modules. Without autodetect, enjoy segfaults. Without alsa, no sound is played
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
X-List-Received-Date: Mon, 13 Jun 2011 17:55:42 -0000

---
 recipes/e17/enjoy_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/e17/enjoy_svn.bb b/recipes/e17/enjoy_svn.bb
index eab81b4..d709eb7 100644
--- a/recipes/e17/enjoy_svn.bb
+++ b/recipes/e17/enjoy_svn.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv3"
 DEPENDS = "evas ecore edje elementary emotion lightmediascanner"
 SRCREV = "${EFL_SRCREV}"
 PV = "0.0+svnr${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 DEPENDS += "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly', d)}"
 
@@ -13,7 +13,7 @@ DEPENDS += "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1', '', '
 #4th needed for flac playback
 #5th needed binary to create db
 RDEPENDS += "\
-	gst-plugin-typefindfunctions gst-plugin-playbin gst-plugin-volume gst-plugin-decodebin2  \
+	gst-plugin-typefindfunctions gst-plugin-playbin gst-plugin-volume gst-plugin-decodebin2  gst-plugin-alsa gst-plugin-autodetect \
 	${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugin-mad gst-plugin-id3demux', d)} \
 	gst-plugin-ogg gst-plugin-ivorbisdec \
 	gst-plugin-flac \
-- 
1.7.5.rc3



