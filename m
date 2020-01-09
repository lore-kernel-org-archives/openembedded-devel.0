Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 49BA77FDDF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 21:05:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c14so8923060wrn.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 13:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wPB9MDQ/VVaAJwTlJ0wxb4akM3fgJQ4Vu5GJk5sDKaY=;
	b=QSDbcDEg/HNBugavQEoKiarrJP5qqCJVrTqmU2fvNJXm5UjSPtjDMpVoRdMv7ncYhb
	YQm1I8MHr//gcHMV3kNu6SeWlEfJUPLSMLd6HgdYj3gb7V2shaO8mpcdrr6/XFacIO21
	z9bCnX9sYB0l9vG+PkTKXafVeiM++gJ+SP3OMaf/h84qX036F3ijHVrIsYEKcFlZAMIL
	tXuASNh2QbDXx+t6Oe4BL75yZvJU8NS/bJBEw4MF8Yqm3z+QHDv/XH7+2SJpEovuzwwh
	b32PU7+/cKerDxB76e//RfOz9yCriFBVYxhOUYaGVBMEB7ESC+nUCdoq+1s1QcHTs8zo
	F0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wPB9MDQ/VVaAJwTlJ0wxb4akM3fgJQ4Vu5GJk5sDKaY=;
	b=gG3Q/Zoa2uT2KDuG/4b+qKM3QLXQN5qkYN1fMWf2EFCtjNgWera6PWySl+CvURLJJU
	iRUq5mvS8gDEmtZRlLsNgJLAMnGeKgMhaPAIjD6ZBRGq10qMWlTx5+ZljtZpqXBl1kf/
	Vs0OA8NnaS+HoIc5YGKrhmTGbNMuO+gmTTsO5izeByE3c4AQ9QqvZaR19Hwrbm1SvIS9
	DOwX9Zvy/BvTJEn7lYXSehEqnOGAxqyGBfdMa1L4idxS2uUHWBohIJ0LiCHvUiEzEOor
	BXBYbvvNo+6qR9wH5OAXMZyIeinfLshTKOSy2GE/KY8sjzDuhRfer1K6Liqhamcq1Aww
	4O5w==
X-Gm-Message-State: APjAAAVTO4Z7WktKmhKIenGN3EaXs1c/6GGGbE222NWuXVVoVslVoQB1
	wLKcMl3H4MQj/kUywqQM7xyc2txrchU=
X-Google-Smtp-Source: APXvYqzgCBfG7fpmT1fVfrr+M3cH9PaAUWCbKabgZDKgmemiGPmhDV6kKQVA3HwPULFV3X4OoPun2w==
X-Received: by 2002:adf:d848:: with SMTP id k8mr12357158wrl.328.1578603928008; 
	Thu, 09 Jan 2020 13:05:28 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id q6sm9825041wrx.72.2020.01.09.13.05.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 13:05:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 22:05:12 +0100
Message-Id: <20200109210518.22451-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109210518.22451-1-schnitzeltony@gmail.com>
References: <20200109210518.22451-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] mutter: upgrade 3.34.2 -> 3.34.3
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
X-List-Received-Date: Thu, 09 Jan 2020 21:05:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From announcement:

* Fix window recording on HiDPI [Pascal; !976]
* Fix top-left pixel being insensitive to clicks [Sebastian; #893]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mutter/{mutter_3.34.2.bb => mutter_3.34.3.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_3.34.2.bb => mutter_3.34.3.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.2.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.3.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/mutter/mutter_3.34.2.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_3.34.3.bb
index 992915bb7..9afa269ed 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.3.bb
@@ -22,8 +22,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even features_check
 
-SRC_URI[archive.md5sum] = "4515ccdb762a243d65757f5ab073d206"
-SRC_URI[archive.sha256sum] = "2d6f7763193766d4652d43d0d0de2e49e60ca571eca0a7f1e6341fbd67f90b2d"
+SRC_URI[archive.md5sum] = "c3ee46ae7b84d9d0e8dd3f9e04a61ab1"
+SRC_URI[archive.sha256sum] = "cdf57ddd0bc35db952b732b77c796760e65d1ce2f7df31273e5c8d4759ed4a89"
 SRC_URI += "file://0001-cogl-Fix-GLES2-fallback.patch"
 
 # x11 is still manadatory - see meson.build
-- 
2.21.0


