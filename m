Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id DA71E7CBD5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 08:13:47 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id p74so5768038wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 01:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EYHGeqVqpTOc3kHvCxajHk3MUsqC9pNV9Vo84FRz6Dw=;
	b=B4Q62HQtRgVXypTpyGmHm3QotmudGCGOcGuqADDq21/8rFGNLIaObkuk2Q2ScNl55F
	rmzi3K5pWdrZ81i8g7MtiX9DzYWHzt+XRNaQj8Hgx4fhEKrB7CghJ1UbhTinGoQluPzm
	uN/kJCR7miQSq+73TAY0Z9/aX7ld49PeBqQEXkjT+UQ7t1+kuhzCwzSGYHtXYfXJcKRN
	DZjH11O+L2Nv0KbPqb/UGCp8EARUXo47Xr8QLYtXIUNQcKwHuFxAZ+4y8LoN26XROTgZ
	uUP+/lriOizVCZw4ePcsDWUnYRxVs0TOToEMgx5xczyeUf3nFS7Lh5rxaKy1Wilp4ze7
	l8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EYHGeqVqpTOc3kHvCxajHk3MUsqC9pNV9Vo84FRz6Dw=;
	b=LU5JwJZbj5/GN64XnpHEnL/deMOvG/ZZMXY6RKFJoF9JxpbdWo0K/SNQfPTmvO8Tv3
	y/sXV7t0jVMTR3IY86OAzfNP59zyjluKG9YE4vYwbVWjE8woOG5iRN0JWogXxmLnkuPJ
	74IRMoy9dZ7GApPpWVG3MNhQDHMLklUVsMnC60ILkarDpTGdtkWZyA/UlWjoTnt18pRh
	mUWrWtKH/T/VtO/0oij+y36NYFwpYpgXb+RGPyL44Z2vzDYceffmFomN7UfGIzKKB/JS
	X2aZzuZTgwDJUrCMJXgU28zFb9mmU9JAmUQI18B8FNZAeeP4gGYrP4AKCm11M79fPUoU
	bDFg==
X-Gm-Message-State: APjAAAUKMjIfj38ZirPGGykaedndOxpUTzCwxZwQpglN68aHarNNnzxb
	LoAU5fciKDG4w8wlB7Uf0UHtx5/Y
X-Google-Smtp-Source: APXvYqw+Ln3Kwlnw6j67XIr4fBjzEwiOcHtF+MNAqbrGl6xrRB1So63qm3cfG0Q8/j/y+StCRyTX+Q==
X-Received: by 2002:a1c:2015:: with SMTP id g21mr10404643wmg.33.1566029628229; 
	Sat, 17 Aug 2019 01:13:48 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F2D875347F2BEDFD5FFA793.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8753:47f2:bedf:d5ff:a793])
	by smtp.gmail.com with ESMTPSA id
	q124sm7592567wma.33.2019.08.17.01.13.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 01:13:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sat, 17 Aug 2019 10:13:35 +0200
Message-Id: <20190817081339.22253-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: bunk@stusta.de
Subject: [warrior][PATCH 0/4] vlc adjustments
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
X-List-Received-Date: Sat, 17 Aug 2019 08:13:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some cherry-picks for vlc

1. Is mandatory because qt4 support is gone and without qt5 vlc is not useful
   exactly
2.- 4. Are good enhancements. It is upon warrior maintainers if they are
   important enough to make it into stable branch.

Adrian Bunk (3):
  vlc: Remove workaround and patches for problems fixed upstream
  vlc: notify switched to GTK+3 some time ago
  vlc: Remove the obsolete dependency on dbus-glib

Andreas Müller (1):
  vlc: rework qt PACKAGECONFIG

 .../recipes-multimedia/vlc/vlc.inc            | 28 +++++++++++--------
 .../0002-glibc-does-not-provide-strlcpy.patch | 15 ----------
 .../vlc/0005-libpostproc-header-check.patch   | 15 ----------
 .../recipes-multimedia/vlc/vlc_3.0.6.bb       |  5 ----
 4 files changed, 17 insertions(+), 46 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0002-glibc-does-not-provide-strlcpy.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch

-- 
2.20.1


