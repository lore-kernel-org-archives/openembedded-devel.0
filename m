Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id CB1C075C61
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 17:29:54 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q184so7671508qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 10:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4H6ZjybFkyyzO3iIW/VzkW1mPpALlMOPS2rwHMaCv6w=;
	b=L0RLla8XwomzOlLI4XtgobmOL9GFgHj5zIrCicOweznOSk6zC8USB3o+bNkCjuerDc
	Sh8pxzTw4VseKGWKO8hMxd0KXxz8GNMCfxF1OpLU29Bx95vDux2yjCQqeV9WbiWlrtpu
	p4P7xNWu6f+0yhqUZ0buGS8xMkv2KPbZS99znNDi7Xe9pdpdh2p5lfddwbI9y0fPJ2OX
	LxXLEMnm4Mt/F1oyWQQvWybA3XQf6iQ9LMv1xt8JcFEoLtvo4HLNHtmq/Zc3jIK+UrEL
	YOqu9zb70r+Pzj09fw8X/LNt8e/PKrujIcsxoljjHB1MEXZhoN09mQdVzFKtUirRyaq1
	Vj2Q==
X-Gm-Message-State: AOPr4FXzyfbvaC4cSTy2ZhHmzwTarPy/rprXBgPH5EZrLj3zqK+oTLggiSrgbhEkWEMsFA==
X-Received: by 10.55.33.167 with SMTP id f39mr3717925qki.156.1462555795649;
	Fri, 06 May 2016 10:29:55 -0700 (PDT)
Received: from lnx-dereks-laptop.minotaur.lab
	(c-73-172-178-168.hsd1.md.comcast.net. [73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 141sm6113089qhk.7.2016.05.06.10.29.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 May 2016 10:29:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2016 13:29:27 -0400
Message-Id: <1462555768-3318-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462555768-3318-1-git-send-email-derek@asterius.io>
References: <1462555768-3318-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-gnome][PATCH 2/3] tracker: add missing depends for intltool-native
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
X-List-Received-Date: Fri, 06 May 2016 17:29:56 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index fa7fcd5..302d9b8 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Tracker is a tool designed to extract information and metadata about your personal data so that it can be searched easily and quickly."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ee31012bf90e7b8c108c69f197f3e3a4"
-DEPENDS = "file gstreamer dbus libexif gettext sqlite3 icu gst-plugins-base libgnome-keyring poppler tiff enca libgsf libunistring giflib taglib bzip2 upower gtk+3 libgee networkmanager"
+DEPENDS = "file gstreamer dbus libexif gettext sqlite3 icu gst-plugins-base libgnome-keyring poppler tiff enca libgsf libunistring giflib taglib bzip2 upower gtk+3 libgee networkmanager intltool-native"
 
 RDEPENDS_${PN} += " gvfs gsettings-desktop-schemas"
 HOMEPAGE = "http://projects.gnome.org/tracker/"
-- 
1.9.1


