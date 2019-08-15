Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id D2CE77F2ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:56:20 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id b16so3511126wrq.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QCpcDcAp47pl0KbXI5X5j9fI6VMEu0eC/d07vTukYoM=;
	b=C6/F5dAIwnE4yLl+HnKykKjMOnKjSlSy5L2Xpubb5nI3SVhGBv/Fz4Y8pTHxdmI6ai
	Awj8cryAEzmz2KEs/DOLY6MGnhsM2i6jNpL5mnW9RMnNuYhYALl81RvR395f/yCqDoVA
	4bkodjoU3aEXFIBKDpM6q9ZQ+doa9J4dmnn+ddPuq5SzOCm3RjWek2Tz5c7S5dskNv5C
	3yTIIWxePp5Xl4+k/cOXLf42Cg3moFzlj4WMOaOsupBbLo2zRuv6XqtQdaz+hKcEeb7Y
	zWST5pYWKAtIG6z//pAQXDlNyYQgt1wjm5CbcJJ1v/4lM5BQ2Ped27KMlsgGr4DLxlr+
	MjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QCpcDcAp47pl0KbXI5X5j9fI6VMEu0eC/d07vTukYoM=;
	b=PfpX6o3fHv0gDRohVlmsyejtaXm01AMT94k9pqlFt4y0Ybh+13tnyBu/SgnA9XeubD
	32cOrUqn1LeTdGW8KGv9VG9WIs6kepSo0aa7kKanM9CRhbdspw3HSu9G7QGjq/IRlSyu
	BvYOYyJChzJFd6b0chSRjht0jN5inDajXup3jdRciVQoLGKE+zpZLtjQob3j2KIohA41
	343lCqpBWVzByNY0oF0nS/A1wjlLZBfx8lT0UlN/PTPb1ODP2dKIrT77nmMuf1pUkCpv
	3n6fF/51FurdQ5G+Bj0rXTC6DlScIP3MtOihqmSH9W9YuTXYsve/9zm1T0INkRTjRVHc
	9AuA==
X-Gm-Message-State: APjAAAUO78mVaSFM6z2AY2QYDGBNpx8+KQIxraEjyhTPLgBBIoudWYrf
	shkbLMGzeMZabAOoRwy7Vc+lh8TS
X-Google-Smtp-Source: APXvYqy4VQBLAWRtdPP6C7RoTE2WTF145COqpoQLBBbrbGgoFRRoiYaEnGFu5EHd/kWPonwxR2w4YQ==
X-Received: by 2002:a5d:4250:: with SMTP id s16mr7323842wrr.318.1565906181379; 
	Thu, 15 Aug 2019 14:56:21 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F042332D9169E9166842542.dip0.t-ipconnect.de.
	[2003:f0:7f04:2332:d916:9e91:6684:2542])
	by smtp.gmail.com with ESMTPSA id
	h97sm10555192wrh.74.2019.08.15.14.56.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:56:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 15 Aug 2019 23:55:59 +0200
Message-Id: <20190815215605.19600-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815215605.19600-1-schnitzeltony@gmail.com>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/13] mousepad: upgrade 0.4.1 -> 0.4.2
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
X-List-Received-Date: Thu, 15 Aug 2019 21:56:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* many bugfixes
* dependencies reworked / cleaned up

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{mousepad_0.4.1.bb => mousepad_0.4.2.bb}       | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.4.1.bb => mousepad_0.4.2.bb} (27%)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.2.bb
similarity index 27%
rename from meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb
rename to meta-xfce/recipes-apps/mousepad/mousepad_0.4.2.bb
index 67c49930b..4bf10a47b 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.2.bb
@@ -3,14 +3,14 @@ SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-# intltool to provide intltool.m4 with AC_PROG_INTLTOOL
-# xfce4-dev-tools-native for XDT_I18N macro and more importantly XDT_CHECK_OPTIONAL_PACKAGE
-# which fixes mousepad/Makefile.am:72: error: HAVE_DBUS does not appear in AM_CONDITIONAL
-DEPENDS = "gtk+3 dbus dbus-glib gtksourceview3 intltool-native xfce4-dev-tools-native"
+DEPENDS = "gtk+3 gtksourceview3 xfconf xfce4-dev-tools-native"
 
 inherit xfce-app gsettings
 
-SRC_URI[md5sum] = "fb85c23bcb096a46aee9ec22b4e4fdf5"
-SRC_URI[sha256sum] = "39a7379b929d964665299c385b2cf705e32e8760698ccc34f91c990bb733518b"
+SRC_URI[md5sum] = "98d908842d4a93c35756a67d681c08fe"
+SRC_URI[sha256sum] = "84c02adfca7f8b33b9466a306ded72fb9f38f93c9edb78660343854c4a3aded7"
 
-FILES_${PN} += "${datadir}/glib-2.0/schemas"
+FILES_${PN} += " \
+    ${datadir}/glib-2.0/schemas \
+    ${datadir}/polkit-1 \
+"
-- 
2.21.0


