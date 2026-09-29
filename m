Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0B6CA5FB8
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:43 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1480.1790722660807983393
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kAFBkaBj;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c11ef641aso4996457eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722660; x=1791327460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2IRv/FdD5IfCHVTbQjBNYBf0VfO9Nti23eMGacRHRg=;
        b=kAFBkaBjy4d/5EFJUcazvdXA8pVRB7x4BaM/aaLjC+s3eWMvS74KezozwMLeXr9G2M
         5RBoPJa1sUmWH7xap8JjPuHA8g6v/4OZApMOOJiAmZq7SNMjzGMAc7/AmMIckRy6zMHB
         EH/BLgueYVPny1qCiZx+vzAf+eGGw8JpCAVjPzmVe1g2f/6s5rp2JCB/Bf7lCYh++BEw
         w4aBCYk6I7bNQD4DJEf6xv3zKofvK5TUiCFlwEtzdkRg9Vly9rLE/k2b6RRyynnBrISe
         kTgVIRO4I+uEBkx4uKWkt7+R4jGSbbA6iDa0wx428FxS19Zf4WWLiYn+Y9mEyc6oF6RY
         Z5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722660; x=1791327460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2IRv/FdD5IfCHVTbQjBNYBf0VfO9Nti23eMGacRHRg=;
        b=ecVJbUCmDC+1H3Kjl6rIJ6XjqITC9nWD59bQf9AORUYB+pOIXHJI1t5gJztvfIMKub
         97VInv6tnS8amxeV79sSupqDOZGMjMel8QHYFA4DiDUJbDnYAsVMg8KpVwZKfIfzF0/b
         WgZyotA/rRA7MdoRaxrw15QZuKoGcm9a0Hjex7pmUrRVmB8xTTh5+ZdtnTqeyR7pHwab
         /VNhmAjFZdUDhtqhEge7tso/CkgEG5rP8d2S1tqtJUDcJgCKbnr3OY1mU99Gpf+KahRB
         psI0q0Bw3fh76SVRKwD8KeB2tEo+3R7KNnsubvXqSzOyPgSa7jiB5ZHhGC8VwrpFmWCp
         qmTQ==
X-Gm-Message-State: AFq9FYJMCGEveRQy+CShkjGMbYvmG5D5b9RBGfFZ7SAdPpsAcE9cylU7
	f+JyOglBRu8+zOYa8xET0SID6QnLEVzcUqd4BNO25EMicARiNYH5bVgLv8gJhUdb4eE=
X-Gm-Gg: AYBFou2teEpItkO9osXLVR8qkK49p9dK7QdgZyo2++wiMwfG996ZsYnh9fg38B7kkUg
	i6t9CcfLgjNuxbrRUwSl/AjHJRZJ5CARhnZpRTVdrelDM4fFJGX5LzhDk6yH8sjd1Mu7NHqpQn1
	lDsRUnkXwYRRnT1Xa/YZNE8FPIDP6kzBNotxqmU/MrovGztWQQSxaB94aIUrmuMI0JcBDzNaa/T
	tTiL2JP2STVCtvLliN2jo5Aeo1yP8U/YwmHKnciUrJDvsUAVUEUrnoGxjo4V3Xz4gXFylv/9BTd
	RkGs8ZFT58gpSxCxuiIqbWzHnNowi+6y6Kzsm6NGTYM2PDJl0NTPBPYwVx53iCxhHGmmWOjU6a2
	HlZr1kaN5W7UUIhLHBGcq1IbirvIHlKK5QhhurHAKKukm2W1+YMECTxuJq5HjYJtJmoX/5EvmGi
	UhB9dMVLU5FrBAw3tATtam/u4SRTnxGwQfidk05jF6pG8LMHwfDO+2mY5JUaUTKbDkFNl77lF7r
	eZr1nZfMMcEJJWOFOsRJGGAeEsGNPeiRmpHv3KOUqG5hiYk57pcS8/2qMtKixJ8dpGG49CUfvdU
	yVvytBY5V0MQpz4tIzicdRruYVndSHVty+WIqtCiILTjmM/goO5+ujaE200lu8yU6D5hMj1i5Uh
	DnrAynazfLpKL4BZvf0wMWghQzSCe3eOgzGoCk7/0zPZmyx50uYcg0jAaEsbm/qVcrMs3/PXxL5
	KO350qJL8gT6JpNdyws3Qq61f8tuAJdCSCbSxSoQ==
X-Received: by 2002:a05:7301:b0e:b0:34b:efa3:ea63 with SMTP id 5a478bee46e88-34c678b98a9mr870217eec.28.1790722659753;
        Tue, 29 Sep 2026 15:57:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 07/26] libdvdread: fix off64_t definition in dvd_filesystem.h for musl
Date: Tue, 29 Sep 2026 15:57:04 -0700
Message-ID: <20260929225723.1046705-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130494

dvd_filesystem.h unconditionally uses the glibc LFS64 off64_t name.
musl's off_t is already 64-bit, so typedef it the same way the other
non-glibc branches already do. This also fixes libdvdnav, which
consumes this staged header.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...em.h-fix-off64_t-definition-for-musl.patch | 39 +++++++++++++++++++
 .../libdvdread/libdvdread_7.1.1.bb            |  4 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libdvdread/files/0001-dvd_filesystem.h-fix-off64_t-definition-for-musl.patch

diff --git a/meta-multimedia/recipes-multimedia/libdvdread/files/0001-dvd_filesystem.h-fix-off64_t-definition-for-musl.patch b/meta-multimedia/recipes-multimedia/libdvdread/files/0001-dvd_filesystem.h-fix-off64_t-definition-for-musl.patch
new file mode 100644
index 0000000000..e73e93ed38
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libdvdread/files/0001-dvd_filesystem.h-fix-off64_t-definition-for-musl.patch
@@ -0,0 +1,39 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:05:57 +0000
+Subject: [PATCH] dvd_filesystem.h: fix off64_t definition for musl
+
+dvd_filesystem.h defines off64_t itself for _MSC_VER, __GLIBC__, and a
+fixed list of BSD-like libcs (Apple, FreeBSD, OpenBSD, NetBSD,
+DragonFly) whose off_t is already 64-bit. musl falls into none of
+these branches, so off64_t stays undeclared, which breaks any
+consumer of this public installed header (e.g. libdvdnav):
+
+| dvd_filesystem.h:87:5: error: type name requires a specifier or qualifier
+| dvd_filesystem.h:87:39: error: unknown type name 'off64_t'; did you mean 'off_t'?
+
+musl's off_t is also already 64-bit (there is no separate LFS64 API),
+same as the BSDs/Apple, so replace the closed list of libcs with a
+catch-all "else", covering musl (and any other libc in the same
+situation) alongside the ones already listed.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/dvdread/dvd_filesystem.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/dvdread/dvd_filesystem.h b/src/dvdread/dvd_filesystem.h
+index 1111111..2222222 100644
+--- a/src/dvdread/dvd_filesystem.h
++++ b/src/dvdread/dvd_filesystem.h
+@@ -37,8 +37,9 @@
+ #elif defined(__GLIBC__)
+ /* sys/types.h may have been included before _LARGEFILE64_SOURCE was defined. */
+ typedef __off64_t off64_t;
+-#elif defined(__APPLE__) || defined(__FreeBSD__) || defined(__OpenBSD__) || defined(__NetBSD__) || defined(__DragonFly__)
+-/* off_t is already 64 bit here so off64_t is not provided. */
++#else
++/* musl (and the BSDs, and Apple's libc) do not provide the glibc LFS64
++ * off64_t name; their off_t is already 64 bit, so it can be used as-is. */
+ typedef off_t off64_t;
+ #endif
diff --git a/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.1.1.bb b/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.1.1.bb
index f57515f732..7b644a1265 100644
--- a/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.1.1.bb
@@ -3,7 +3,9 @@ SECTION = "libs/multimedia"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=64e753fa7d1ca31632bc383da3b57c27"

-SRC_URI = "https://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${PV}.tar.xz"
+SRC_URI = "https://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${PV}.tar.xz \
+           file://0001-dvd_filesystem.h-fix-off64_t-definition-for-musl.patch \
+"
 SRC_URI[sha256sum] = "a0d47876548bec806774bbf8dbf20bb19ba139464383156b32eb8e59915b90a9"

 inherit meson lib_package binconfig pkgconfig manpages

