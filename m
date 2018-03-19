Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 99698789E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:24 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f19so4953349wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NQnuMWCKWTtC4FKjvz/bjkAaCJpJVTFW4xr1E2pH8Hs=;
	b=J5OYjZaDa/qfpYdsGIw1wLHTpstAxTm2kCLVuLc2CYy1gsCsBnWhmk69YD4NWwmLKO
	A7KBTAx1kvJ7sTJGTGh6FE/h1m4FV9R5JtiMUvi9d2wE/EkR3tY/N6L489njFE8LbL2G
	H9eU+Ibh4JIcgYeNUShLU/0oCLmKNbhzJbSQgKryNgL3Dlv0qzqBwN7msE8zpdZ3O58j
	mNcPUrD4hFaPPn8AKnZICjlRMDHHs+rfNqsbiTMINBoEIJB2uSqDooT8FdEKvj5ZtaZi
	qGOEOVBb4GSa+I5Lk/tdUUlnb4hbhVJ8Eg1F+w9I9hSyt8ETiMfVZpxD5F3PwsT8s6tN
	3mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NQnuMWCKWTtC4FKjvz/bjkAaCJpJVTFW4xr1E2pH8Hs=;
	b=DT8qWpss6kBMCJ6KXGH3OcDxrNG45ITayXXP3ckr0e+VMilMkRXxPmGVwjf2x3Q3xN
	YStfrKCN6NCOrxXdWojZlHyiVwgEOLdm7DeQGWRAlaSkgB/6jhxllHV173yhGKvhLj4N
	i3N60BdfWK313OzajH99ZdPbwDW5LLFXLNQ3lTcQkJfbjP+V8i0C2jmC0Y3xiHK/zX9/
	IiqY4WjpGN1C0+NensBoFkmcX3IcF7ryPsAwGGQEuWKWQbyCwDSPZBb9ernfK8b0b5kD
	D6+/A2CxtUz4S1Z1u2OlUbL2XRiw3NRVrSzuhY0U6IzObJ4QPrpJ1BjOJknoDiF3qEwZ
	frcg==
X-Gm-Message-State: AElRT7Ha3RfoZdIWrtbVDtiCdqWbzCueKxSt/n7M06d8fqv/HfiAKZ5B
	3Ce1rO9tM4W32TCFilBzDPYqSQ==
X-Google-Smtp-Source: AG47ELv/15YUzC4PcKXkGOp2VUGtADtUm0cT4hGMpj2rebLvXUMqEwLP3mSQI+/J37MsY9BlxsM9mA==
X-Received: by 10.28.43.66 with SMTP id r63mr72586wmr.93.1521491365247;
	Mon, 19 Mar 2018 13:29:25 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:28:56 +0100
Message-Id: <20180319202911.30760-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/17] evolution-data-server: remove libglade from dependencies
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libglade is not necessary and does not exist any more

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb
index f4ff48957..2303b8f18 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 DEPENDS = " \
     intltool-native gperf-native \
     glib-2.0 gtk+3 gconf libgnome-keyring libgdata \
-    dbus db virtual/libiconv zlib libsoup-2.4 libglade libical nss libsecret \
+    dbus db virtual/libiconv zlib libsoup-2.4 libical nss libsecret \
 "
 
 inherit distro_features_check gnomebase cmake gtk-doc gettext gobject-introspection perlnative pythonnative
-- 
2.14.3


