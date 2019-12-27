Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id F36757C446
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id q9so7557620wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=rINBbi3E+Jhp7bOSWde/IchJXA1UNiVczVO4RJnpDX4=;
	b=RCHwPjsu3FiCJr35hag6/Sm4mFuOK1CqKJONBOgbpwGwRu12wTtiJ9mF91IDmIVN1N
	fNu5zo04/JjY6hKD7Jk2MpYgUjxojgZfCzuc8xbwPsAMD4vdQN6C/czea1i1O5/xUIAB
	Y9pkVPsuw5hmhNDUP5ehKeYUMn1L7m7ay8LNoIbHWbGDNyvEyXNhjLgrtIf00sFtlkB4
	lm+C5eM7M0y/g7e6d8As4E3kTM6z82QX09WK8tH8ryW1yZclFH958eWu7sfqHDt1dSjP
	bPNJ9clgfUH2cKpIDLPbz8Zks42hIWFIVxSD40NXVF4KG3OO83SoBmAlj8t2PY145xzM
	MFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rINBbi3E+Jhp7bOSWde/IchJXA1UNiVczVO4RJnpDX4=;
	b=nI8BzTcAiNqH9JxIMkLKTIgyNYgsJX1wD3OjcyLnWSxBTghzK8mfG3Hpzd7mTLspmA
	KMsHU5owCTsSnPtQCGiISTQWP+3Khv8mZk0D7jrSlhqNrGrXl7Wg0s28rSJV5xhhNnus
	OmzysW3499qBkZETY78NmjULbMaKAwRF4yF/5iFb+pS4Xn3xKZT0RGy4W5xMk4IkQ7QR
	GC3t8QQvihilQtNrJIL8kOBZ3v96v/IUfvqzaZP6pytTM/gF9QH+p6FrW+02qTWYJj6M
	6Pi+MTEfT94BUW9Bt16VPl+kpPU30VyfOJ6bdP+G5wQfj09drU2cH6L2r/+4We+yHVyK
	txAA==
X-Gm-Message-State: APjAAAUmbUm5mMctx/rSlcXc+v3Bma4KQ7pNs+inOK1ZZOud2ZBQS7HR
	ca0CO9n3CY1IlXVRb9+h7hlWIFuOby0=
X-Google-Smtp-Source: APXvYqy70LMZ7mXkLXTlm2UGuRZ6s/jAxQox/jbE3YHWhgC1S4DnGWxYa6Rf3G7V5d/0+osW+sLlrg==
X-Received: by 2002:a7b:c851:: with SMTP id c17mr21636928wml.71.1577482302641; 
	Fri, 27 Dec 2019 13:31:42 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:16 +0100
Message-Id: <20191227213120.3930-19-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 19/23] gvfs: upgrade 1.42.1 -> 1.42.2
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

Major changes in 1.42.2
=======================
* gdbus: Add workaround for deadlocks when cancelling jobs

[1] http://ftp.gnome.org/pub/gnome/sources/gvfs/1.42/gvfs-1.42.2.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.42.1.bb => gvfs_1.42.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.42.1.bb => gvfs_1.42.2.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.2.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.42.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.42.2.bb
index e5d23b085..f04246f16 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.2.bb
@@ -9,8 +9,8 @@ DEPENDS += "libsecret glib-2.0 glib-2.0-native libgudev shadow-native \
             gsettings-desktop-schemas dbus"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
-SRC_URI[archive.md5sum] = "93592535508322548d44fa036b635a0a"
-SRC_URI[archive.sha256sum] = "9d06071b4a1d83671f76d0e3c32b66631671669d330fe21702f60a8611c37730"
+SRC_URI[archive.md5sum] = "8dea2f6a3f327a814a347758d4350e4b"
+SRC_URI[archive.sha256sum] = "b57af97573bd295aa50037eed29c6ba7a36188230c515e007c3018855a5cf949"
 
 # depends on gsettings-desktop-schemas->gcr->gtk+3-> x11
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.21.0


