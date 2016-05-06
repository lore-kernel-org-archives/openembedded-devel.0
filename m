Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6814375D22
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 17:29:55 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id f74so7253925qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 10:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oUywmIAtx4NZ5937Jgnff9dOPe0vaGkry9O3YYfdR1E=;
	b=AWSkKbIYo9JSMstf0wqhQ/uJlS5Cfnk9z4TrFUDBox9dqwzgp5KZqTxWMnmAmfpuZe
	jbZSwIxbKKK+SZCQXmS2IuAwdjJOj4sQ/+dfRzravfbowS53zum4uzbwcu+im5oLV+uR
	ejr5aT4i0uPugDAyOEc5J93lCYEsnBGLPC/rj2r6bdxkBiizNsQJB9zpvOXL2Qha4aUJ
	Mz6ZrJd/f9X1ldTBfpW6gvdPYoeVKegYp/ObCW5nkpGpCSGXLqfY79O9aUiYU+9ygkkr
	949bowTCiLUpvK4btJMNxQLQf6it5/KUFTYuSCk7gl8CRa2io3gs6e9/bj/+LobPncTs
	eiIw==
X-Gm-Message-State: AOPr4FU+j6OnU0Lu7WIcuVBGORHuOTwH8MDcC/C3kz+A8bDvJUEjipFJYtWBw1mn7Nu8MA==
X-Received: by 10.140.105.182 with SMTP id c51mr21390478qgf.78.1462555796353; 
	Fri, 06 May 2016 10:29:56 -0700 (PDT)
Received: from lnx-dereks-laptop.minotaur.lab
	(c-73-172-178-168.hsd1.md.comcast.net. [73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 141sm6113089qhk.7.2016.05.06.10.29.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 May 2016 10:29:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2016 13:29:28 -0400
Message-Id: <1462555768-3318-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462555768-3318-1-git-send-email-derek@asterius.io>
References: <1462555768-3318-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-gnome][PATCH 3/3] tracker: update run-time dependencies
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

Addresses QA Issue: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.so

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index 302d9b8..ff53669 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ee31012bf90e7b8c108c69f197f3e3a4"
 DEPENDS = "file gstreamer dbus libexif gettext sqlite3 icu gst-plugins-base libgnome-keyring poppler tiff enca libgsf libunistring giflib taglib bzip2 upower gtk+3 libgee networkmanager intltool-native"
 
 RDEPENDS_${PN} += " gvfs gsettings-desktop-schemas"
+
+RDEPENDS_${PN}-nautilus-extension += "nautilus"
 HOMEPAGE = "http://projects.gnome.org/tracker/"
 
 PR = "r7"
-- 
1.9.1


