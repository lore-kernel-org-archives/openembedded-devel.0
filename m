Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 786EE6B720
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 15:22:07 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id k14so7477811wgh.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 08:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=ebLprP0WmuufhZtge0hBezp1CyQLGxY3beyd8evFlOg=;
	b=qAmB1GCXzpTSDaS2Hn5XZRsqMVte9kRoyf/sE/0s8l9ztQog4wuC+yzTR2zffD17ki
	oE2FgCxHN1hhmDrgKIC0uh5Bpq+8jlTxRqch8lkp4yVQZTKP8lXnRKAZnKFB8xJ1LuE3
	MYA6lU/W7fZ9ejEWFnGpyapik25VIgAML3Na0Viw9RKFkSrslRfc5fwCOZNf+9249Jiy
	+WBdsW8a9ZMWVpIdHeGKVLoPnF2pOhpgfnsZuMsXgKe+4tHXFL9AiXg8wfaj/BpXVcMp
	m0uvET+1VsvR9uzcOX7bVZouTLS2WNtkKTouJgwcW+2X+5oKfUdUvGOx9XAAGQPAtNoy
	seKA==
X-Received: by 10.194.57.77 with SMTP id g13mr22145255wjq.42.1396365727864;
	Tue, 01 Apr 2014 08:22:07 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199])
	by mx.google.com with ESMTPSA id 48sm41246865eee.2.2014.04.01.08.22.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 08:22:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 17:21:45 +0200
Message-Id: <1396365706-14220-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
References: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce/meta-gnome 09/10] sound-theme-freedesktop: fix configure
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
X-List-Received-Date: Tue, 01 Apr 2014 15:22:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

oe-core's
commit 79ea036de331bde65a88fb777647dc099ef05acf
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Sun Mar 2 17:36:38 2014 +0000

    autotools: Limit aclocal files to those in dependencies

makes explicit depencies mandatory

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
index 71f4053..9c4f9c0 100644
--- a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
+++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://CREDITS;md5=3213e601ce34bb42ddc3498903ac4e69"
 
 inherit autotools gettext
 
+DEPENDS += "glib-2.0-native intltool-native"
+
 SRC_URI = "http://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "d7387912cfd275282d1ec94483cb2f62"
 SRC_URI[sha256sum] = "cb518b20eef05ec2e82dda1fa89a292c1760dc023aba91b8aa69bafac85e8a14"
-- 
1.8.3.1


