Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id B6C217F403
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 10:14:37 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id h7so5052093wrt.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 03:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=g3HviAOrAzcb8hPkqbiyngxH3melOsNW7d74gCtKn9g=;
	b=Khh95yY35fcAEquhMx1pn+8hCXqi5p5gJqxStB6nI9mAiso51+3UuowXC+id2CaMru
	a5k2gyf1KHF/E8gsLhX+yP8pB0TlrT0UmLDoXnXPhVOXgDFQ5s2oT+nHTpYwuxTEG/rs
	ifCcwBNjGXGitCR3+Ee+0vbS3vQf5RaJYt4t7HR7T7satyNb9zEVD6Ay0LMwrZKc2Jkl
	xqD8CKuFjeWhSqdFiXPPHLOUQHwj2mXRa9bmFD/ogvBb/SIxlTgFbKhC4ITydKz8ls/f
	711jAq67+5m0HXatfZ0aS8H129gtnBNC7uTcB4qyUulZWq0/Hspkpq1P6Aj+ZmxUSq9e
	0law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=g3HviAOrAzcb8hPkqbiyngxH3melOsNW7d74gCtKn9g=;
	b=b2JqhWcUIsJkgHnXyHDNyp+sOPq2JFhT5cftmJ/mUMezSQ4Zw5JcFb4ncsdK9Nkk29
	ZvlMrKRTZHiEITIPTiuoKi4ZVrkyFBETXFa7WxxYDz/TrrfnBSB2Ka2Q6Fjz8xQBcItJ
	XllGZjv37O0pMSYVk3C0uIY/OFUAeeMN+SFjKIh/XIqpbK6NxwNmZAVDEUkW0QUbxJcD
	ZsbZJCvWrjL5SHY3uuZoxhXWTXnBBhxxlPuRjqfSNro5utVDCbRVhyVTto43ccH4X5qb
	0+hxjedwOb6PMuyg/9rFOuCndVBTXDYakC/iP8UacejZh8OKfZcgUAsPMDp7Lvcq2GrP
	ivZA==
X-Gm-Message-State: APjAAAWIP1lMWyPoX1K7C1Mt24xQbMHz2gKfGo0xlbMrec5fAYvtth2W
	0njh71TaMEUr+/CtXTCMutRTgk/G
X-Google-Smtp-Source: APXvYqzly8ZFJPRVFuURI5jX9meUC5CxOPHuXA1oa/uL56S7sy2YjSg81yCBk0NLeN9N46IQQsIoYw==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr18489061wrn.87.1567160078091; 
	Fri, 30 Aug 2019 03:14:38 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F02915607EC4D6226D2CD7F.dip0.t-ipconnect.de.
	[2003:f0:7f02:9156:7ec:4d62:26d2:cd7f])
	by smtp.gmail.com with ESMTPSA id w5sm3866864wmm.43.2019.08.30.03.14.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 03:14:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Fri, 30 Aug 2019 12:14:26 +0200
Message-Id: <20190830101427.14200-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190830101427.14200-1-schnitzeltony@gmail.com>
References: <20190830101427.14200-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [mexta-xfce][PATCH 3/3] xfce4-screenshooter: upgrade 1.9.5 -> 1.9.6
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
X-List-Received-Date: Fri, 30 Aug 2019 10:14:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a bugfix & translation-update release

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-screenshooter_1.9.5.bb => xfce4-screenshooter_1.9.6.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.5.bb => xfce4-screenshooter_1.9.6.bb} (76%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.5.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.6.bb
similarity index 76%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.5.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.6.bb
index 9f8f61a4a..7f6756fc9 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.5.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.6.bb
@@ -7,8 +7,8 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "0354811cd2622d3de92e342c7eaa184d"
-SRC_URI[sha256sum] = "bf35b5432cb920987c6d7ff193600e5dd4d73422b6aa02b4ec5288744053b38c"
+SRC_URI[md5sum] = "9e4026d9ae7850b290992c9d2aea80dd"
+SRC_URI[sha256sum] = "88c174ce687d1f7ba5470d6ab5784d33dc215f8f220211e892e268189dbea658"
 
 do_compile_prepend() {
     mkdir -p lib
@@ -16,7 +16,7 @@ do_compile_prepend() {
 }
 
 FILES_${PN} += " \
-    ${datadir}/appdata \
+    ${datadir}/metainfo \
     ${datadir}/xfce4/panel/plugins \
     ${libdir}/xfce4/panel/plugins \
 "
-- 
2.21.0


