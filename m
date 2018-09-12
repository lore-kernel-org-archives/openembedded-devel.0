Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id D4B6B79567
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 00:18:59 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id r1-v6so61768pgp.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2018 17:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9//mPoHJvSIukvytMJKGTKcA3CMVmMnUUWm1gwdDPD8=;
	b=dboeNfwHFvEid/ILywOLUJSUeQx1ICf3g51DfaqplUdQAHJxJmCzE9Wf9uPqOzAmbT
	KwGArFzV/mu0ZeIhqwE4Q5rzMkcaZZyeeTuDCxQOZl+fyp7BaC8xqEh/kpTaO8RI0kKN
	ECeYXJ7KjpG3XWhnX9/rPIGYP23wh7QJ8+O0poIU9+yI1vObq5C/e/BDmO/e/WHcpuZx
	cOfGM23E70r9DdnRhlpE53ahzMz5LEIEaUw+GknVobWGHP4npTkQnbdXAnypNcsNwBsh
	Bwn7rO8gSGtcsAJKOfYcK4kxEAP77VhC+kS19Od6zIBY0prj2aCSO/wBsa1aCRFtzYWm
	IBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9//mPoHJvSIukvytMJKGTKcA3CMVmMnUUWm1gwdDPD8=;
	b=MFh2Kf4i3M7ltjvbhu6Cf1D+Y40XE9SsyToNYCzmUsV5P2hwt7on26glz2UPNwUXnD
	mfaZBhS86PBya7OoyAzmuHUunaltAihzwKCQi+waBc/TOO3car9+Sf3pPJ8fZ8RWdjTg
	hcZY7BavJy9lvmMWZUk1dEU0AnyNBlicIUKAEaiyga2pO0ck8K6MAj0psj6TYy+msm/B
	CILfvFVHt8SRJM9Av9fiA9GMGfcsDeBV8jdKAc9kZWFk48rTzp1QsPaMnsK7g7gcSXAj
	hj7ZemAy3GIXv3Wk+g1Ug1DLHpwTil04DPHUdVTXuDwDSy/NOb+oqygjW++DqWM/AgHQ
	sgfQ==
X-Gm-Message-State: APzg51Dvdker3v2+3uzpv1zasmvq0B4wB2d+kkGgBdSYzWnqOH3rfMMv
	EhjW9BimFidCqK/ril7omDWDVzFA
X-Google-Smtp-Source: ANB0VdbAFYE3/OuoVqbkb+PAqAaPcQejO6y3WZjGd8nk1YVxf9nCncBpY3IjwYIXc2LNAJr2qleUQQ==
X-Received: by 2002:a62:dbc5:: with SMTP id
	f188-v6mr32669295pfg.182.1536711540243; 
	Tue, 11 Sep 2018 17:19:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	g25-v6sm39781692pfd.23.2018.09.11.17.18.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Sep 2018 17:18:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2018 17:18:50 -0700
Message-Id: <20180912001851.7181-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH 1/2] start-stop-daemon: Recognise musleabi triplet in dpkg
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
X-List-Received-Date: Wed, 12 Sep 2018 00:19:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-linux-musleabi-to-ostable.patch  | 39 +++++++++++++++++++
 .../start-stop-daemon_1.17.25.bb              |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-Add-linux-musleabi-to-ostable.patch

diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-Add-linux-musleabi-to-ostable.patch b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-Add-linux-musleabi-to-ostable.patch
new file mode 100644
index 0000000000..269441fc8b
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-Add-linux-musleabi-to-ostable.patch
@@ -0,0 +1,39 @@
+From 087840efdbc86b1432ebdd81f25b4cb78c75f818 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 Sep 2018 12:28:10 -0700
+Subject: [PATCH] Add linux-musleabi to ostable
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ostable      | 1 +
+ triplettable | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/ostable b/ostable
+index 3bb6819..d0ffdc7 100644
+--- a/ostable
++++ b/ostable
+@@ -15,6 +15,7 @@
+ uclibceabi-linux	linux-uclibceabi	linux[^-]*-uclibceabi
+ uclibc-linux		linux-uclibc		linux[^-]*-uclibc
+ musleabihf-linux	linux-musleabihf	linux[^-]*-musleabihf
++musleabi-linux		linux-musleabi		linux[^-]*-musleabi
+ musl-linux		linux-musl		linux[^-]*-musl
+ gnueabihf-linux		linux-gnueabihf		linux[^-]*-gnueabihf
+ gnueabi-linux		linux-gnueabi		linux[^-]*-gnueabi
+diff --git a/triplettable b/triplettable
+index 7257744..45864c3 100644
+--- a/triplettable
++++ b/triplettable
+@@ -6,6 +6,7 @@
+ uclibceabi-linux-arm	uclibc-linux-armel
+ uclibc-linux-<cpu>	uclibc-linux-<cpu>
+ musleabihf-linux-arm	musl-linux-armhf
++musleabi-linux-arm	musl-linux-arm
+ musl-linux-<cpu>	musl-linux-<cpu>
+ gnueabihf-linux-arm	armhf
+ gnueabi-linux-arm	armel
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb
index cc2727b758..b9b22a316e 100644
--- a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb
@@ -9,6 +9,7 @@ RCONFLICTS_${PN} = "dpkg"
 SRC_URI = " \
     ${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
     file://0001-dpkg-start-stop-daemon-Accept-SIG-prefixed-signal-na.patch \
+    file://0001-Add-linux-musleabi-to-ostable.patch \
 "
 
 SRC_URI[md5sum] = "e48fcfdb2162e77d72c2a83432d537ca"
-- 
2.18.0


