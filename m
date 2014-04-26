Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id E7A4E65D76
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:43 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id fp1so2151858pdb.23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MLX7WBfAm2wJ9aWPwtMLa0p3IQSgjXhZLdIbdudR1LE=;
	b=UGY6Flia7jI3MTlzpNG+E0dALmwAe1ci7GzXARI6um9AaVWcAiH5kd8VMZEjOESA5l
	GWIwqfgfHjL6eVVpbWQUDzSclKWj79WXCqtkyl58jndaebXmQo5T+QMzJhz2EfC3olrP
	m41vkvgoj2DE038erZNarQM7njjl+CM+Ba+X6/+6Dn5IbN1ugWf5B8eKbPc0STPxa2tR
	PgOWd5aTwFsDjdiXPdw6AJZF2QjIXMP93HIo9npMvenmtMlwh7wo2jI6+Ilj0lFAn6Qp
	g8BWIrVBmwSFfdsZV9TGX/3vpCWjmcNPHRaPxspVTwuv1nf7B7KXQPRH494YPlwRv3cn
	Yf7A==
X-Received: by 10.68.99.194 with SMTP id es2mr19542488pbb.100.1398544364763;
	Sat, 26 Apr 2014 13:32:44 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:29 -0700
Message-Id: <1398544484-27299-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 06/21] obexd, gnome-panel: Do not do out-of-tree builds yet
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:44 -0000

They need changes into components build system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb         |    2 +-
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
index 0f04081..e7bff3f 100644
--- a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
+++ b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz \
 SRC_URI[md5sum] = "d03cf9bad2983243837f4f6d76ef14a6"
 SRC_URI[sha256sum] = "eaa9d8d9542700e6750918d72a3ce00f8cf3a2771d3e2516efd1be5a05f78582"
 
-inherit autotools
+inherit autotools-brokensep
 
 PACKAGES =+ "obex-client obex-plugins"
 
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
index 91d814a..4957a99 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
@@ -11,7 +11,7 @@ PR = "r7"
 
 DEPENDS = "gnome-doc-utils-native gconf glib-2.0 gnome-desktop gtk+ pango libwnck gnome-menus cairo libgweather dbus-glib librsvg libcanberra" 
 
-inherit gtk-doc gnome gettext pkgconfig gconf
+inherit gtk-doc gnome autotools-brokensep gettext pkgconfig gconf
 
 SRCREV = "6a364b6a4a9beed3da9ca6f5b0dac81eb99dea2a"
 SRC_URI = "git://git.gnome.org/gnome-panel;branch=gnome-2-32"
-- 
1.7.10.4


