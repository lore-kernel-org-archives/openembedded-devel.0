Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 34A057D417
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 22:43:09 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id z24so1005215wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 15:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3r4yiI8bodu6CV8LixgT95b0Cq2TKdFzSek20VfIy2k=;
	b=WKyFaGbH9Yb/ulvO3GkJ9iOh6AIAc0K4ZS8d7kDAYkMnfN80v4EcNwyUZ5fbhRSTf3
	42vx3dXQLpNk3t6zuhtt1ZboPhbH8HGNyWpDEhxoHS38j3B4mJ+XesqH6eHYRaIB+pU4
	U7SkbEKRjCdCXladZqEnHX0aXzNTb21JomEDuzkdIuNqEPMySklRaZPwQVI0AC+R2e/v
	y6Zja2YYAEnDBXYecFlC34bLQXGXn5z1j65Q6O9TDivHWZvNFQor7Ue2afz86P0D4nrl
	mPXGWatgCATWMNKoCqLU6iFcQ/RIICjUzFeB4K8x0VpO7m2h8IxjkTqtIammvfQq7JrU
	GM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3r4yiI8bodu6CV8LixgT95b0Cq2TKdFzSek20VfIy2k=;
	b=dMKPjgPvbF+zlMKNJ8yLad+1j4wJDoXg4ewp+Us804bJ63qCE3XXer6z2Qll9ATqQF
	vYGDXfwypP2adLit4yRnCQiJUtISXp8FmUHRCnFrDh2KVz2eIlOBJQYLES3v8Txtzafv
	lQvLuP06+SNXM6TqX2KtZ4JDF0NyzztVE+NBA+yLL3GELQZiuxeDZNDuhjNqWavYs7mc
	VAybutk9MjAo+4SKe8vjf5jRGZoxv0BNcj+Gvwa8EQcBe48LsInTyzBeXJyTREQmIzTL
	unZIjz55XSBg6SmHOScNlCFKqxk1G9wTguTWCUl4f8vQ8cQ9KdJJ2NZ16sKQDNs5KvSP
	x2GA==
X-Gm-Message-State: APjAAAUyKefB5HekvMUC/BvafppfoT9UoViHbmoCfB7ZsTMTPFcOmGfG
	kHUnX/V5CRFuG2+HVmho2RaMhWVV
X-Google-Smtp-Source: APXvYqxzGJzDfn/gdO6iq1i+jTyj8pCgc8jbwgl2oxpfGlURh7r5KPydUNV1hpEbMHJiw0JXVRAuSw==
X-Received: by 2002:a1c:cb0f:: with SMTP id b15mr18406989wmg.88.1554763389635; 
	Mon, 08 Apr 2019 15:43:09 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F03E65465DDF607A3E693C2.dip0.t-ipconnect.de.
	[2003:f0:7f03:e654:65dd:f607:a3e6:93c2])
	by smtp.gmail.com with ESMTPSA id
	k4sm42824144wro.33.2019.04.08.15.43.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 Apr 2019 15:43:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Apr 2019 00:42:53 +0200
Message-Id: <20190408224258.1744-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/5] Updates & enhancements
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
X-List-Received-Date: Mon, 08 Apr 2019 22:43:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Should apply to current master-next

Andreas Müller (5):
  udisks2: upgrade 2.8.1 -> 2.8.2
  parole: upgrade 1.0.1 -> 1.0.2
  parole: replace gstreamer1.0-plugins-good by gstreamer1.0-meta-video
    in RDEPENDS
  ristretto: upgrade 0.8.3 -> 0.8.4
  networkmanager: rework musl patches

 ...ix-build-with-musl-systemd-specific.patch} | 196 ++----------------
 .../musl/0002-Fix-build-with-musl.patch       | 118 +++++++++++
 .../networkmanager/networkmanager_1.16.0.bb   |   7 +-
 .../{udisks2_2.8.1.bb => udisks2_git.bb}      |  13 +-
 ...{ristretto_0.8.3.bb => ristretto_0.8.4.bb} |   4 +-
 .../{parole_1.0.1.bb => parole_1.0.2.bb}      |   8 +-
 6 files changed, 149 insertions(+), 197 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/{0001-Fix-build-with-musl.patch => 0001-Fix-build-with-musl-systemd-specific.patch} (51%)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
 rename meta-oe/recipes-support/udisks/{udisks2_2.8.1.bb => udisks2_git.bb} (76%)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.8.3.bb => ristretto_0.8.4.bb} (76%)
 rename meta-xfce/recipes-multimedia/parole/{parole_1.0.1.bb => parole_1.0.2.bb} (76%)

-- 
2.20.1


