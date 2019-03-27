Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id C73D17D157
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:40 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id o10so5107094wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OQfoacW4EveOUH8gbm+mdd1FlTav2q0Y6dbd6QDJbqg=;
	b=E6AD7s+GMw1qqMRbY+qfeVhPN8VgWMmP0cNum/5sCYv23r7LB53itXKmKsqequPqOm
	MPgVgS7J4JrAOkmrBNwCImuqeoyhK5BkBuuaeyMH7s7h4sezz87AvgN0AiXBJkDmzG4c
	Cle9Ls3F5P6Iwtj5OXSLH/XaUGaQd1KMpBBlKun0IwcV36arccoiYh8o4tRwTczTVmZI
	XgQXsfos/vXB/+NasHLFgQTLqyPKzMPn0VRmyt7Pim4/LhEwzaGioKZMc2h4YEGBIXpl
	GRjRZiGXN0+VA21GIJpyE01FRO4Dn5Yx84/cbKnrv87fXnP+tbP4KB7/WQPqR2a3nE61
	f6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OQfoacW4EveOUH8gbm+mdd1FlTav2q0Y6dbd6QDJbqg=;
	b=YOAzEZDUz0Ha2OIsgtL6ZdhSTP/eUnLV6JDu/S1I9WaipUxI91+HglNvNJYfuJ6W9P
	Jj46P7Db4wLLiTJI2ttYu5iFrJ2NlTVZOFt6tRAvZmbRDSQgDxL22zM6eTZwEsj45HFK
	AUt3OyY90LRq56dBfMbGCYdcA9F3+kuSuTCIpyqeCTNdFzGgE9nA7LdNrVqjmpt5BMaU
	ZIVpzOIDKKkh6hl/FMDQUlcVaNMtcjeBDZvE1rKfcjwfiSbSb5+xNUyyK4alzMxA0tIa
	MzV1zP/81eVPvdTcx4nmcDZjO+1Kia722mdzR3ivAPx3q20KZuUotxejKK0BXTq45szF
	Whuw==
X-Gm-Message-State: APjAAAWqzvejuUQyGzgvbDBaiM2kITEo+Wsij8j5YzYc7tbx0ajoqm9c
	HjHT9B69AK8zSfAy6JvYLlvMrriH
X-Google-Smtp-Source: APXvYqxbHLn01J/jioAELeESB0WOtzYd3Jx1V8HnQHdq0qwyN9HJ2F1PYtegBwnxWojg/qj6Q5H3wA==
X-Received: by 2002:a1c:63c3:: with SMTP id x186mr17902881wmb.47.1553700941433;
	Wed, 27 Mar 2019 08:35:41 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:35:05 +0100
Message-Id: <20190327153509.23928-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327153509.23928-1-schnitzeltony@gmail.com>
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/15] libgnomekbd: upgrade 3.26.0 -> 3.26.1
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgnome/{libgnomekbd_3.26.0.bb => libgnomekbd_3.26.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libgnome/{libgnomekbd_3.26.0.bb => libgnomekbd_3.26.1.bb} (71%)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
similarity index 71%
rename from meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.0.bb
rename to meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
index 456a744fa..3a7379f9e 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
@@ -12,8 +12,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "8b9d13d46255cde910b3db5a6ebb4727"
-SRC_URI[archive.sha256sum] = "ea3b418c57c30615f7ee5b6f718def7c9d09ce34637324361150744258968875"
+SRC_URI[archive.md5sum] = "98040022484406e7ebe25f82cef93344"
+SRC_URI[archive.sha256sum] = "f7ca02631576e9b88aee1b1bae37ac1488b80ee7975f20a97f29e761a7172679"
 
 EXTRA_OECONF_remove = "--disable-schemas-install"
 
-- 
2.20.1


