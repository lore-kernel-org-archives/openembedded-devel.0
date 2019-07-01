Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0F37E52D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 15:00:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45crC93L6Jz3t
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 17:00:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561993221;
	bh=KJ+my5C/xzf/GrKqfJk5Vlyvy+koWYFyMfnzmnPjKWc=;
	h=From:To:Subject:Date:From;
	b=ipNauPcvM+HSmOAWDDQboiKz6FLPXz0dhhQcERIIsQf90A1edo1OaO3am9Fy7VE3a
	o24zrzN8NyCRmVaMxEQzQil6mMADEeMziMWCdBtHrctvguuZgR/F0Omr+Qa9XfjhwY
	3B9L8yd2gTQyRus3i9O11EvFU35OORIVk0fNekvvAnw4kdzkzSMyIY7Uhm2YivUWY+
	EKO0tbbSAT4SCVJge6VTS5cG0ght5IZbaDZsMG+Be4kELuagWYwSykg+V2oTe9Q0/5
	czcTmexLHqf/FP5TAAGn8sExhaVHf/iFVWSrKR5+8PUF80LEuY2qzV5oLI9Q2rFEp2
	mFxiE+sIFRY7rdii3J79mS70iNesa9DhMrNgsh1Wweww3zccBxFrLzXXCUvaPajj3t
	9dQ9DhZlQOdNTtTqyU9rM6QZ8D5mO7XQ3y8xQm90LJqPkp+57jW3ht42C6IpiVGLrb
	lr6MgROyJwvy36b+sK/7676l5u7+LvygPTUQp6L+NpUdsHfEPCeeqbnHJ0az1MO2rT
	K9JBjvYmaJgG9BHQ08s76edUMzuc8iFDFyVP9a/MMJYtikOG81dSqvDbKYUzgUAVpA
	yj4tZYDlmfTQHm/jx9OXMZs4nDSweFrmMdr7vhPY0JeCpYH/vNMhHFPbgHiXWmgQ5q
	FGWtoubFDea1knJytWxLaJwM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jul 2019 18:00:20 +0300
Message-Id: <20190701150020.3737-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] networkmanager: Drop bluez4 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Jul 2019 15:00:21 -0000

bluez4 was removed from meta-oe 2 years ago.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../networkmanager/networkmanager_1.18.0.bb                   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
index 9215a8676..21fbea9c1 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
@@ -20,7 +20,7 @@ DEPENDS = " \
     curl \
 "
 
-inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection gtk-doc
+inherit gnomebase gettext systemd bash-completion vala gobject-introspection gtk-doc
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
@@ -70,7 +70,7 @@ do_compile_prepend() {
 
 PACKAGECONFIG ??= "nss ifupdown dhclient dnsmasq \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
 "
 PACKAGECONFIG[systemd] = " \
-- 
2.17.1


