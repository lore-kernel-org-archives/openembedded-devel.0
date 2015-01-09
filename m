Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id ED6D572498
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 08:54:55 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so1011437wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jan 2015 00:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=JB5pjTw6hFWZ5srsANfCcJOF1eGCAaPUOhmz87DpdR8=;
	b=I6FVsoNnrwPGu1gvzgrKztUrFQ2jPIhq+RWVczVlL+dC01agaP1iXpWGSgmMpLg2In
	2JKzTq8lTgybSliYI7NQrQmTPUeEyr59ymGXlmJKpYh+Demr5kYZ0OtZtA+Fkany/jnk
	uG+xNPq6SUCE81TPhEE6S6RNtDR0LBxIPPra0v+3UfBGWu8nW3We7SXJiKgie9/+nQ3A
	iuO3TZO01OlPkSEd8AfPQQknlkliy5tV0YScSiw5wCk7yukN3fw0T02QIp+InzjKjp2R
	eYrFQBAZ+VNVaGTgUnYkuYEP/GYCG+2vYeHsKS9tSzXXgTjxO1IFEV/dJ9tW98ITzpUY
	cUeg==
X-Received: by 10.180.105.68 with SMTP id gk4mr2923883wib.30.1420793695857;
	Fri, 09 Jan 2015 00:54:55 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-254-85.hsi05.unitymediagroup.de. [176.198.254.85])
	by mx.google.com with ESMTPSA id i3sm9572779wie.23.2015.01.09.00.54.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jan 2015 00:54:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Jan 2015 09:54:46 +0100
Message-Id: <1420793686-18771-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] network-manager-applet: remove polkit-gnome dependency and un-blacklist recipe
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
X-List-Received-Date: Fri, 09 Jan 2015 08:55:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* polkit-gnome caused blacklisting
* upstream dependency on polkit-gnome was removed in:
  | commit 0f378cce475b136bb1c6124bc2ea803e1da7dfc8
  | Author: Dan Williams <dcbw@redhat.com>
  | Date:   Fri Mar 2 14:07:31 2012 -0600

  |  build: remove unused polkit configure check

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../network-manager-applet/network-manager-applet_0.9.8.10.bb         | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
index 8c271ed..545b2cf 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
@@ -2,14 +2,12 @@ SUMMARY = "GTK+ applet for NetworkManager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "polkit-gnome libnotify libsecret networkmanager dbus-glib gconf gnome-keyring libgnome-keyring iso-codes"
+DEPENDS = "libnotify libsecret networkmanager dbus-glib gconf gnome-keyring libgnome-keyring iso-codes"
 
 inherit gnomebase gtk-icon-cache
 
 GNOME_COMPRESS_TYPE = "xz"
 
-PNBLACKLIST[network-manager-applet] ?= "Depends on broken polkit-gnome"
-
 SRC_URI += " \
     file://0001-remove-classes-and-properties-which-are-not-supporte.patch \
     file://0002-Add-support-for-AP-mode-setting-for-wifi-sharing.patch \
-- 
1.8.3.1


