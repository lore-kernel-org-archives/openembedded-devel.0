Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 314F365E61
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 07:32:48 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so8484425eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 00:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=9VeR9KGuem7zsCXCUDd6Y+FoplPuFSfJyK0emT1pp9A=;
	b=z811i2Y8SxXbIF0dKGc1qphm+h9keIhOstYlvf3KZexkbqK1aQg8IvjNbnC4f92LZE
	iOcVww/9Z+ZTA1rSotUtoM2o6WmUZrAtL8ipw8nhSlBD8tMnmIIe25s79kMcwKzyJa0r
	58PoeJpaFtcnLqBazGP0hQTkqOWI7pGntmHZmxEaVrMmYV+dGmVFMVaIZw16m234zT91
	lr8mBQ2fnjaTW01qYwj1kOjCEiGFkJnVPQ+R6zowR0CgRqioOZj4+6Iaqovjoiw3w6eF
	zMkhYoV5lG64FGVgo5GjMFw2tGEHwpaGSFy9Y+wrLKNZrDSkLGMbtaslFMu5tBFA7zaP
	f45g==
X-Received: by 10.15.54.6 with SMTP id s6mr2987884eew.4.1397633569649;
	Wed, 16 Apr 2014 00:32:49 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-162.unitymediagroup.de.
	[178.200.247.162]) by mx.google.com with ESMTPSA id
	a42sm55485161ees.10.2014.04.16.00.32.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Apr 2014 00:32:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Apr 2014 09:32:30 +0200
Message-Id: <1397633550-19323-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1397633550-19323-1-git-send-email-schnitzeltony@googlemail.com>
References: <1397633550-19323-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gnome-disk-utility: change PACKAGECONFIG default: remove nautilus
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
X-List-Received-Date: Wed, 16 Apr 2014 07:32:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gnome-doc-utils had to be added when not depending on nautilus

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index 6bfbfaf..bf836cc 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "GNOME disk utility"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
 
-DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart"
+DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart gnome-doc-utils"
 
 PR = "r4"
 
@@ -20,7 +20,7 @@ SRC_URI += "\
 
 EXTRA_OECONF += "--disable-scrollkeeper"
 
-PACKAGECONFIG ??= "nautilus"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[nautilus] = "--enable-nautilus-extension,--disable-nautilus-extension,nautilus"
 
 do_configure_prepend() {
-- 
1.8.3.1


