Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id DE06577A2C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 May 2017 19:18:49 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id d1so4736512pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 May 2017 12:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JjdBYHCaZtaGCNW7Vdsqmnb+XifKKL7bw0AQLNOs/p0=;
	b=eacsqPtk80VzfexC+M5CldQk6kNkxO5iv2DVsmmpXuMhY3bn2y/jEaHh4cU7QiOscl
	L5R7quPIB+ptKDFr6FBOdaOVzqE1mAttiww2FzlnIIAuhLcHpWn7ekZPfPCd4uPggoKc
	7Iv/7S/wOuklQkmrP5vFaCNJAnU7HQDiLNwlkmCIILdvBAErHUXE5h9P/wHt0GAuCAAw
	WZ7NmNNIoHEx6Y0euIu09Fn+fA7CyEpUyrkaycLlU3oGER9gf7h4dD6yqY15egFzzYwJ
	CYNR3Xi5qvTXcm6mUy3kXhlOS7RamL2MTj1W2fuprczxatn/0SosCoIV1sEwkSexLVh7
	tclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JjdBYHCaZtaGCNW7Vdsqmnb+XifKKL7bw0AQLNOs/p0=;
	b=pWih0dBrbhvOwDIAjtjGiDFpkO8BuG4W7CEsxw8yHY8dKoreAgMcYagksxDVF5OApc
	EomnXh1IU6Qgl78DaPI8l2wtnfSATCe5dZ44OgcfnuKgH/+wxbfL/CVIKmrPsad988VL
	mUogBC3FMxp3iLZLDINFztO+FjOThBUB6Vk/cTeoHlt8Ysc2RmGldvmQ0PUXGE1Fs5J5
	HqWaBMngnT1azu+IAhTk9yQkYUS8yCzYA2LavIS4m/+diW/YiZTiEk2W9Q1KMi7SldcA
	LYXcg1sqxeR0iSJfiljyed9PIXFZnMjARmTPp6D4pseule5OvZrXAL0vA4hh+vuEraTS
	eObg==
X-Gm-Message-State: AODbwcCU0i8SMd1BC7D2KaxyZ0abFR0SUTGt0xx+kHMvZfEPH/YnG20I
	QcRWguwAMZZgUQ==
X-Received: by 10.84.133.68 with SMTP id 62mr2348890plf.63.1494098331062;
	Sat, 06 May 2017 12:18:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8882:b8c::d586])
	by smtp.gmail.com with ESMTPSA id
	p62sm14237888pfp.48.2017.05.06.12.18.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 May 2017 12:18:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 May 2017 12:18:39 -0700
Message-Id: <20170506191840.26070-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170506191840.26070-1-raj.khem@gmail.com>
References: <20170506191840.26070-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 3/4] gnome-bluetooth: Look for x11 in distro features
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
X-List-Received-Date: Sat, 06 May 2017 19:18:50 -0000

It does not compile without it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
index be62b371b..8cfd65af3 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
@@ -10,7 +10,8 @@ DEPENDS = "udev gtk+3 libnotify libcanberra intltool-native gnome-common-native
     ${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)} \
 "
 
-inherit gnomebase gtk-icon-cache gobject-introspection
+inherit gnomebase gtk-icon-cache gobject-introspection distro_features_check
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[archive.md5sum] = "75d09c924468ec0c687f9ab3acf7f113"
 SRC_URI[archive.sha256sum] = "d8df073c331df0f97261869fb77ffcdbf4e3e4eaf460d3c3ed2b16e03d9c5398"
-- 
2.12.2


