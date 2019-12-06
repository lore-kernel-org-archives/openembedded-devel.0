Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id E52677FA37
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:34 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id p17so5642482wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9qTLupM/wkxrDihUBUzrBfntOeqLuSahFCyX8C17El0=;
	b=XcjBD/NGQ9lgbLnWTSYOv4TZYJ5abs4/NPqGI5orwhWq3a8EFuEf9OiJ5dH1EVu0Jp
	ZF7quEbXYnrJByf5oV90fzMETtU624HjnXFe0z2lOf+1WayIKkdiEKSCSMCPggG7aCwh
	5Evv7710nIJuGJ8y3l0s4yWYWBdbPJq2Vj040UZE9iH2/s1xgvajDcg7DykGaBUCeC9i
	4d1hfV8HFAcnRKTB6USVdZTqAyT3LnurMTRK0i+tyByuwz2w31OJFYiq1maK+B9HbHjP
	e2HV5ijvhnhs85hJmbZA0LpFM+pVwPnAyPt/R+CJgjF1PzSZz5QABvJbyl7Vr+jD9EaO
	TtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9qTLupM/wkxrDihUBUzrBfntOeqLuSahFCyX8C17El0=;
	b=JyZwu7v1JsmGnWzkqELil0XVB2EOo5tyhsLjn4BVzt9GUgHB30AnjnC1CDOeAxpmCH
	PVnJC6a8yun0bQMN0M2EN0ODiZS/CsTcSXWTbrvB9j+8ImRSGc/HoxJeN2Keg4DE8JyW
	9INgqwUGJo4y61Fx/plaARVTPZfQAUDeJwRKT4w72rOwZO5KPDWbudmPcFc/wPmva7Nh
	Dx31zuVZDK4SH4+PNoEzgAkYmgwGA6jcf1Vwb9PhVarE4nnjgXCbTQXgBAg2bZ3VKAYZ
	0iJotOyppRju9bdyK+QJV9x/5uo98zg1EVEP9XMBVdyuXzW8j+e61KNo/UjFSRogyFbL
	JLtg==
X-Gm-Message-State: APjAAAWtbe4tPqAWgLWhjGlsemH8+E7l3b/u0rMxMhdiNrnbNIETQ0sq
	FVFVhnzWg+isP01tnilVcyIF4lXA
X-Google-Smtp-Source: APXvYqwEUl57C7VJ7tAQhaK4oJmMaeN3NQibB+RapUffgR7iFBdGKqBqKgV2tKajFIHRN/CPzQQV+Q==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr8030753wmk.15.1575590975343; 
	Thu, 05 Dec 2019 16:09:35 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:34 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:09:02 +0100
Message-Id: <20191206000912.19841-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/21] gnome-online-accounts: initial add 3.34.1
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a mandatory dependency for upcoming gnome-control-center

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-online-accounts_3.34.1.bb           | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.34.1.bb
new file mode 100644
index 000000000..65ccdbd14
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.34.1.bb
@@ -0,0 +1,32 @@
+SUMMARY = "GNOME Online Accounts - Single sign-on framework for GNOME"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=34c88b124db5fb2762c1676be7dadd36"
+
+GNOMEBASEBUILDCLASS = "autotools"
+
+inherit gnomebase gsettings gobject-introspection gsettings gtk-doc vala gettext upstream-version-is-even
+
+DEPENDS = "glib-2.0"
+
+SRC_URI[archive.md5sum] = "aa94d1dd07ca53729a036b5df1c78c05"
+SRC_URI[archive.sha256sum] = "4832ca8e48d3a497fc676e7b6f146009ab4206995362977b9805aa39f164783a"
+
+# backend is required for gnome-control-center
+PACKAGECONFIG = "backend other"
+
+PACKAGECONFIG[backend] = "--enable-backend,--disable-backend,gtk+3 webkitgtk libsoup-2.4 json-glib libsecret rest libxml2"
+PACKAGECONFIG[krb5] = "--enable-kerberos, --disable-kerberos , krb5 gcr"
+
+# no extra dependencies!
+PACKAGECONFIG[other] = " \
+    --enable-facebook  --enable-foursquare  --enable-exchange  --enable-flickr  --enable-google  --enable-imap-smtp  --enable-owncloud  --enable-windows-live,\
+    --disable-facebook --disable-foursquare --disable-exchange --disable-flickr --disable-google --disable-imap-smtp --disable-owncloud --disable-windows-live, \
+"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${libdir}/goa-1.0/web-extensions/*.so \
+"
+
+# looked into pkg-config file: it is not a bug - they mean it
+FILES_${PN}-dev += "${libdir}/goa-1.0/include"
-- 
2.21.0


