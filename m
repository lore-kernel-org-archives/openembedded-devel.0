Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0DBC77F29D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:56:19 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id p74so2460316wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hiY9wfG3HKtg8tjXaQu7aO6s+DFJ93+rhr/bx5CiJgM=;
	b=seFrueycHZlBuSvJ4uDMeUP060uzHHRkmwiMzCwew3mWBvjxYgM+b/Axr3EQxFGGbF
	rEm+to7SprcXESb6hYUXpTpfhPoDjDTpfaTiDu2k3wq1rPkHygEQsVIKU38jSRzWlj5F
	138H+WwZ2SN7hHi58OI5/JgyYZKQrD2uuKD2+1RbQs5TRFzZ9/DOU0+e6P5Wytu5DYhp
	F1EzZh+BC85NxBRnlhyNc/egowhaAZgLruK61KDuyAhHOobZ7/gbxMxPtnv7sRTzmYhV
	lIfMMYL+yfQz5y8gXOTesax30Y1DkDM/RQO6nIz7kZUHcveTxY9NTNlFFjG0o3lWG84+
	D6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hiY9wfG3HKtg8tjXaQu7aO6s+DFJ93+rhr/bx5CiJgM=;
	b=qQy70MCp7Y6YV57+pwKCiOx9UWNrS/xmTaNg4kiItYqIIr015qUMVP+W7UHlOnB2ZH
	HJ/dbGWtzulg7h214/+kxSWOeOhcMyBT8Gwxmw03vlzxLfSJIcFkBzwJxVESQwlMvwNT
	yNrkAJPjU600Y1bjvHvifKy187scHhjTdLhGT1UU/uFwqcKHfK4La5w4uvYwfgPltF7S
	Qnm6PErMq7SVi3Bv3NQ13irEuUcDJgdW3WjxzKSl/6xgUMMjIqRn1lVVXwUGOwQ0bXvu
	ZgSKnxFdE3BOVf1bx7wkTx/A5ePntGemg+UDSdeXoxG4hvmVFJGIYZQc7nliyxk9shAl
	NJGw==
X-Gm-Message-State: APjAAAX7RPndwGGOBSTZOliCELhzzM9yupb5F8axWaNPl+yXLIal31Jo
	ga/qSA7Es1qVyluxSqS2JIrwJvof
X-Google-Smtp-Source: APXvYqwvAhnDf6ChpGPvZ4DvQ8Dy4jwvzddkTpMXGtZZHRVDzHTqFBrbcEyVu1sMlVMMGTvFiE0LRg==
X-Received: by 2002:a05:600c:224c:: with SMTP id
	a12mr4403770wmm.12.1565906180427; 
	Thu, 15 Aug 2019 14:56:20 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F042332D9169E9166842542.dip0.t-ipconnect.de.
	[2003:f0:7f04:2332:d916:9e91:6684:2542])
	by smtp.gmail.com with ESMTPSA id
	h97sm10555192wrh.74.2019.08.15.14.56.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:56:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 15 Aug 2019 23:55:58 +0200
Message-Id: <20190815215605.19600-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815215605.19600-1-schnitzeltony@gmail.com>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/13] mousepad: move to gtk3
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
X-List-Received-Date: Thu, 15 Aug 2019 21:56:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

At the time of creation there was no gtksourceview3. That was a blocker
to use gtk3. gtksourceview3 was added long ago.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb
index d122bfe37..67c49930b 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb
@@ -6,14 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 # intltool to provide intltool.m4 with AC_PROG_INTLTOOL
 # xfce4-dev-tools-native for XDT_I18N macro and more importantly XDT_CHECK_OPTIONAL_PACKAGE
 # which fixes mousepad/Makefile.am:72: error: HAVE_DBUS does not appear in AM_CONDITIONAL
-DEPENDS = "gtk+ dbus dbus-glib gtksourceview2 intltool-native xfce4-dev-tools-native"
+DEPENDS = "gtk+3 dbus dbus-glib gtksourceview3 intltool-native xfce4-dev-tools-native"
 
 inherit xfce-app gsettings
 
 SRC_URI[md5sum] = "fb85c23bcb096a46aee9ec22b4e4fdf5"
 SRC_URI[sha256sum] = "39a7379b929d964665299c385b2cf705e32e8760698ccc34f91c990bb733518b"
 
-# we have no gtksourceview 3.x around
-EXTRA_OECONF = "--disable-gtk3"
-
 FILES_${PN} += "${datadir}/glib-2.0/schemas"
-- 
2.21.0


