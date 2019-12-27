Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 57F9D7D00A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:44 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id p9so9144343wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=UCuBLl+IvutslxQT8/zQ27o5gVRixwfoJvjQAquTz/U=;
	b=OFcKQQMGxX0qGF39Tzj3aRhDfIZdU7gree+Rf1rVokgUb4ljaWN2jINE3fL2NYQO9b
	L8cvHiLmZ2k9nKnE1tzHc0fAF74tniApIOt0IR1zCPsj8VP3dE71EdEiqQr3z3ffWDow
	o+uIceMFsAFZdmMIAxO6hFq+OhRSzCdiXO0Dgh2nk1SOxq/3cETFC/8rgJY4HnHZ1dPS
	iPswNQgQQfbZUAVxGUBHzuKoxMl0eLK0dFiPhS0L26ooGC+dTt4d/TFxaXN101VWxG7D
	5fIGfgKBuoo9zjj2i2eov8NTxa+wH+52B/rGJbRNOFTsGdt0s/2JT/imIlqIQrWSnoze
	8M6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UCuBLl+IvutslxQT8/zQ27o5gVRixwfoJvjQAquTz/U=;
	b=bF5doaGApDLJQvFq5a094eShe5GfsTMgFKNNiFkoNtmIAkxNz8p1kbsPrrWGn3Beaj
	ohf5Zk6ioSujR3mPkqyefLtuYjr4r6cvgun7YGESlvq1qTAV0/dHPYiCbO4dhDfgwkgt
	yZ5iw2u5y4cUhktrZJXsHL4n6FN23cB0eloeZGwNXI6IptaQcrEUK2Uvjf/nlo3VtpF1
	4t+ptdzfOi/hnEDMLZTeVyeOR81IGYehDDajytdStHE5AzclrzGq93zAijPiyfapN9QJ
	xHagypjGGgKkZupM1c8oOQwX51D2NT5bEVN9qr08TkoXdg8tH7m6MZ9ljZ/X30Zqikve
	cOaA==
X-Gm-Message-State: APjAAAVVNXtUXN9LiRBLKipYsHRfiLHnNoy5T5ApnQDcKdbq15DuQBG4
	Ff6dgp+xxA/wR6o6/AeMBlTVMT5/OIE=
X-Google-Smtp-Source: APXvYqzPHxqwbrdkhUUT8VtcgHhXMpgzt4X6OteqCISu5y3+jV3C65dSzqxvu5zW5EubhUvBK+L6qA==
X-Received: by 2002:a05:600c:28d:: with SMTP id
	13mr19808546wmk.52.1577482304938; 
	Fri, 27 Dec 2019 13:31:44 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:19 +0100
Message-Id: <20191227213120.3930-22-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 22/23] nautilus: upgrade 3.34.1 -> 3.34.2
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

Major changes in 3.34.2:
* Don't use hyphens when breaking filenames in multiple lines (AntÃ³nio Fernandes)
* Fix drag and drop on scaled displays (Robert Mader)

[1] http://ftp.gnome.org/pub/gnome/sources/nautilus/3.34/nautilus-3.34.2.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../nautilus/{nautilus_3.34.1.bb => nautilus_3.34.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_3.34.1.bb => nautilus_3.34.2.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.2.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_3.34.2.bb
index a256ea95a..bacc967a3 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.2.bb
@@ -17,8 +17,8 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "19e4f1d89fb9d0ff135d5b1974ce43b5"
-SRC_URI[archive.sha256sum] = "37ce2c16a610c589dcc7660f9092446465568e38e29bce6ed8c24f2e8e0077f3"
+SRC_URI[archive.md5sum] = "88573061544040c0ff960f934aa83719"
+SRC_URI[archive.sha256sum] = "bb06e226b965f479a0b8668c19c8e1762b9d8f039af6817961cc7a8f09e6f8a7"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


