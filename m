Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 764DD7D0F2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:35 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id k17so11166913wrx.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=n9XPNd8tlWDM5NUxQsqVX6osSdE9uOYyG7HHWvqgcBs=;
	b=txlLSfSx3UDs78uLussPn5tPaoqLhp2Zq10x5hNTDU/hr2onXo+l5ysjBFM+czFNL8
	T9yVkXt8M1kqn0YlQBC9VpTCT/yGE3zS0z+pIe1hXQb5XDatgEv91SdpTuWuLwpcGj6H
	aH45NgsnfdnnM701ljHF6scgwliusNUMNgebQliKJQi9I+XvFiqV9pKoLt5AtGzgc5ci
	+d5gcsiUqHKuJYlw8y8yd9Z8ExHYadlqRdwrIgK4s42IyawhfvTbY7XCnYtmBTxxzXDV
	FOoqCxyZqpQ0HFn1pGrDTaGA4ihrHbGPiK7XxxzIns+qroFAgY5sg5oH79dg+YtmS5Pu
	fTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=n9XPNd8tlWDM5NUxQsqVX6osSdE9uOYyG7HHWvqgcBs=;
	b=rZENOyHtyesIw2ejlfRZjB3DBg7bD4Yss7VjQ2klyFshdK+vSB3SZeuTHPlXtYeEUS
	2wW9rph2KuiUgjzhk76ibgMpeBP1RHJbo5FMwlJ0v5iZrRlSiczk3xu8dwIBG30d9Ig2
	lVaUCUIJgPWIjtXj5FGMHtjJzWBZK2K4/yiVKN4H12mE6tzhqmYQaN9hexvVTIbHvcBN
	OCRbZ91LXzGo4BmHVzpjQAEDWXBDDSbLrREcg42EeJQJ0SdEh/bwl7TZ3fAz1r5UZwYr
	QDIeFCg2np0HQzp6U/mxjcelB/R9n8sb04TgtrmdyhsO/s3H1DpO6XjiPZVQRTPgzxD1
	yWVQ==
X-Gm-Message-State: APjAAAWdnXcp1G9telSegCakRIHYqBY98R6onz3d1zcR3ByzeDINi5HP
	Lp8Hw1UM2a5bQDEpKuvUb4jkhFdo
X-Google-Smtp-Source: APXvYqyQ0ZgvU6nuSqwZZ0pDCtMDCm7+RpOfKTfW+1iFDyB4FbSU9omBRIudk8Bt9ob7fjmstb65wg==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr24228933wrw.22.1553700935975; 
	Wed, 27 Mar 2019 08:35:35 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:35:01 +0100
Message-Id: <20190327153509.23928-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327153509.23928-1-schnitzeltony@gmail.com>
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/15] gspell: initial add 1.8.1
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is necessary for latest evince.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gspell/gspell_1.8.1.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gspell/gspell_1.8.1.bb

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.8.1.bb b/meta-gnome/recipes-gnome/gspell/gspell_1.8.1.bb
new file mode 100644
index 000000000..9de298c41
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.8.1.bb
@@ -0,0 +1,11 @@
+SUMMARY = "spell adds spell-checking to a GTK+ applications"
+HOMEPAGE = "https://wiki.gnome.org/Projects/gspell"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8c2e1ec1540fb3e0beb68361344cba7e"
+
+DEPENDS = "gtk+3 iso-codes enchant2"
+
+inherit gnomebase gettext gobject-introspection
+
+SRC_URI[archive.md5sum] = "8269918ea5ff798e49943e7daf6a32b9"
+SRC_URI[archive.sha256sum] = "819a1d23c7603000e73f5e738bdd284342e0cd345fb0c7650999c31ec741bbe5"
-- 
2.20.1


