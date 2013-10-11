Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8756CC7F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 13:48:13 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hq15so1110284wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 06:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=miiBe3CQnt4QUi0yCbncMc3mwiqbgWLZ0Cb+OEXwfXM=;
	b=dAiPPrEN2+tv10L64em+ALwUranG2fPiLRAachQbP+NkVTA8YIYl+5ZyDEUTHGGM6A
	UBh9NoKN1y8OByjQVPnZW6qrgCHFyBLQr4FNiG/B+4n5CrvyKPmiatSFIdGeiKBKn8HS
	TomxEz4PIqEsMPJobcihimYRUZwLZ4q/rSjOoZXVlsrd4xOQgIBvlm5p/6fE4Soq+Ro2
	O5g247Ib6J/K+lOxqNiDvUyHrZb2omMJP3yrjlTWxdROoKUP8GqKUJFs04VQ2x+8X0A1
	fCLHZEq/qJ0Flp7sS+cQK7Bl+Z/FWGVh0AUUF4gVXVMqWu5J694If879+PBI096cHFvS
	WRzw==
X-Gm-Message-State: ALoCoQm0ygG4m5aySiYBQpnxAs/9z1OuMLuKNHwD3K/6sFEMrQJ61XEkeZH3z61ksTj6q294zX/m
X-Received: by 10.180.37.227 with SMTP id b3mr3355841wik.24.1381499294470;
	Fri, 11 Oct 2013 06:48:14 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id k4sm5919578wic.0.2013.10.11.06.48.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Oct 2013 06:48:13 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2013 15:48:08 +0200
Message-Id: <1381499289-10706-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-gnome][PATCH 1/2] gdm: delete broken .desktop files
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
X-List-Received-Date: Fri, 11 Oct 2013 13:48:14 -0000

GDM tries to run these during the login window and one of these crashes, leading to an autologin failure. Remove the non-essential ones to get rid of this problem.

The proper fix is to stop metacity crashing.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index 04ecb19..65e0826 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -63,6 +63,12 @@ do_install_append() {
 
     rm -rf "${D}${localstatedir}/run"
     rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
+
+    rm -f ${D}${datadir}/gdm/autostart/LoginWindow/at-spi-registryd-wrapper.desktop
+    rm -f ${D}${datadir}/gdm/autostart/LoginWindow/orca-screen-reader.desktop
+    rm -f ${D}${datadir}/gdm/autostart/LoginWindow/gnome-mag.desktop
+    rm -f ${D}${datadir}/gdm/autostart/LoginWindow/gok.desktop
+    rm -f ${D}${datadir}/gdm/autostart/LoginWindow/metacity.desktop
 }
 
 FILES_${PN} += "${datadir}/icon* \
-- 
1.8.3.1


