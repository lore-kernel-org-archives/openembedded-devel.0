Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 045E37C5C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:36 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id z7so27203132wrl.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tkJS6wY/rudqHJxFzbfY32TiXDn4+4Jsa7ktm2iBY64=;
	b=anF+u3NfzPtEMMSyX73YTlL2M+n9Dpenh68v6uYTAnth+VIHZF3lWoGdLBXm3rSOBv
	gdNWQSs1pCWULij6eC2k8ie3BoomSMmGrIbaroFP2s55/ckgCkdIcqjiM8Ue/eKUlFiL
	BfcEZNXCyIuHk4rRYuHOpFgkggYE0gt5OnEkUCXU6aSRBKgoWFZQuIE5m6cq74qFeFLt
	IEE8ERT/T9bjkmfQ25YzEHJ+n4DIcmZjMRYhU9rCcjv+9JE1BZdqmp0M+nQW+nQCGQ85
	fuUMORKJ8PoCIN9leEfH93x3OzJGw0l2FEMjpopYaOHTXSTMIoOaogVhyHppit5QELL5
	45qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tkJS6wY/rudqHJxFzbfY32TiXDn4+4Jsa7ktm2iBY64=;
	b=EfdgiA3KL84RMNRgEQ6JbIwc2/GTeDeKHJ4Je1a0CiOGzRSlUPViRe6UNiYyQAzsk7
	at4W7Q+Xhxas2w/3BfIIxBXcut2eys9ajDYk1hajhf758czBOOxGeGPcwstDiF9buIIB
	4QL6VsDl5EUgDOvj7VMwV0gsGOWLhgxbxQE1XteJ61rPieluiy9Sz7CvKHmxFdy9FmX0
	gDEXVKOvkwu84vDVQXhej3p07CCxXc3UyxBtSQYa+YI6UrHSY65CLnjgRQuxpLmycOBL
	JNSvWyxxEnNCq8nH6L5CyofL2fhhYP5TAwkKcbKbHAZOnpoPyTkUi5deLesMmLjkT/ZN
	4fjw==
X-Gm-Message-State: APjAAAXjtYzRgaEIY7y1PfjJxGtYEk4qrGXUyG7MtuYlQQocbgteuNrM
	qAtswTErEmOzrkoXJvc5xBdkQhmSJpQ=
X-Google-Smtp-Source: APXvYqyKwYEOTp2dUvWYUxWXS1k8SL2CwGzjT1SPrMr/vVuLKoP+qUcFVdPhFAeha76litv/gv/pfw==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr51011758wrm.210.1577482297549; 
	Fri, 27 Dec 2019 13:31:37 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:10 +0100
Message-Id: <20191227213120.3930-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/23] gnome-desktop3: upgrade 3.34.1 -> 3.34.2
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

==============
Version 3.34.2
==============

- Add helper to create transient systemd scopes
- Translation updates

[1] http://ftp.gnome.org/pub/gnome/sources/gnome-desktop/3.34/gnome-desktop-3.34.2.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-desktop3_3.34.1.bb => gnome-desktop3_3.34.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.34.1.bb => gnome-desktop3_3.34.2.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.2.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.1.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.2.bb
index a2f73590f..19f73a6e5 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.2.bb
@@ -14,8 +14,8 @@ inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspecti
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "357b4e63960830c1399d3341d05746ea"
-SRC_URI[archive.sha256sum] = "c1dbeb5666dad27166c769e48e2ab41dd5ed74718ea35eb57c8488790662dc5a"
+SRC_URI[archive.md5sum] = "a0fda8ee9283536e281405e94af15776"
+SRC_URI[archive.sha256sum] = "4081ba619733da33ec6ba98cd52170ee99a90439709df4df333e5c9e631f28ed"
 
 SRC_URI += " \
     file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-- 
2.21.0


