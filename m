Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0B42977A50
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:47:35 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id r16so201687999ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CFkT7FuY6aO0s2MXH42vBkNufBxpzVoffEiEIL7wuHk=;
	b=mbWgWTqZPkPCOy4tHz7Dt2/OXwFAu16pPTCxItLDhyU61jlsvKCQsJRIifVpCC+AVi
	udsv+yt9UD/1qtqLTvnrg8xlJV39SvY+hV/xUYrd2r5gawuS/GV6cEYhDUEQEbBdgQGa
	8OrWOSfOxqlupm2EAoJCx3tafF04nuQO3LP7xbHKsi14EJWccOyRzsKYQVK1u5iYIbnO
	5menOhnRpZRfvt0u3Fnh06pJM5G5Au88GWJ3SQJfzSQkZuaayEe7oL2lAHmY92rZW5h+
	9qvl+lvtk26OLiQwzuGvGiHQ2BzFBUff1PzP/HgBqgAGJLDRvTzdoMgxXZjef79DOKFk
	DLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CFkT7FuY6aO0s2MXH42vBkNufBxpzVoffEiEIL7wuHk=;
	b=iDcz8lMzJsH3JQ/Ey558IE0XyZICkRALRMJ3rPcxOCKiMO8CgYjV41YMpVETGS18tX
	/HABFWzchcNnP+M7OSy/Ur6hJNjGDlW6IIuaiD2iLZ0ck2gfbZseSmSNIM0r+0t9aZE2
	NYXuD/5+kGt1esA4NpHCQvAbA3fKAJz3z5itQyKj6g6z6ZXJdlVOS4y2FIA1MlJiHwi/
	Cc46Ogb0qZr1uNIFLbvzTCwLZ0/EC7c4Inlgvlo69kWJHoU1YA5ts3xd8a4MKzSQl6/I
	RjtMgPb/H5C0v7JKgB6TpdyH6YaG5BH+ahdK6ByqfhPxIFqY/roRoamsx7XzlRTXABSQ
	q+vg==
X-Gm-Message-State: AN3rC/7lPcv8Tzc/iCwZmVsGTuMbm33hblfIyyUd56g07sp6kC91Fnp+
	AodY+IpqZ9eo9o+g
X-Received: by 10.107.131.71 with SMTP id f68mr11407975iod.40.1493092056709;
	Mon, 24 Apr 2017 20:47:36 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 9sm1244118itm.6.2017.04.24.20.47.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Apr 2017 20:47:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 20:47:11 -0700
Message-Id: <20170425034719.8630-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170425034719.8630-1-raj.khem@gmail.com>
References: <20170425034719.8630-1-raj.khem@gmail.com>
Subject: [meta-networking][ 03/11] yp-tools: Fix build with gcc7
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
X-List-Received-Date: Tue, 25 Apr 2017 03:47:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-lib-yp_all_host.c-Fix-build-with-gcc-7.patch | 33 ++++++++++++++++++++++
 .../recipes-support/nis/yp-tools_3.3.bb            |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/nis/yp-tools/0001-lib-yp_all_host.c-Fix-build-with-gcc-7.patch

diff --git a/meta-networking/recipes-support/nis/yp-tools/0001-lib-yp_all_host.c-Fix-build-with-gcc-7.patch b/meta-networking/recipes-support/nis/yp-tools/0001-lib-yp_all_host.c-Fix-build-with-gcc-7.patch
new file mode 100644
index 000000000..d1d5f9ca7
--- /dev/null
+++ b/meta-networking/recipes-support/nis/yp-tools/0001-lib-yp_all_host.c-Fix-build-with-gcc-7.patch
@@ -0,0 +1,33 @@
+From 71fdfdfcea2bfa5f522512366bfcdf95f861ecc6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 23 Apr 2017 23:44:37 -0700
+Subject: [PATCH] lib/yp_all_host.c: Fix build with gcc 7
+
+fixes
+
+| ../../../../../../../workspace/sources/yp-tools/lib/yp_all_host.c: In function 'yp_all_host':
+| ../../../../../../../workspace/sources/yp-tools/lib/yp_all_host.c:109:30: error: comparison between pointer and zero character constant [-Werror=pointer-compare]
+|        inmap == NULL || inmap == '\0')
+|                               ^~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/yp_all_host.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/yp_all_host.c b/lib/yp_all_host.c
+index 59cf236..4a07a7e 100644
+--- a/lib/yp_all_host.c
++++ b/lib/yp_all_host.c
+@@ -106,7 +106,7 @@ yp_all_host (const char *indomain, const char *inmap,
+ 
+   if (hostname == NULL || hostname[0] == '\0' ||
+       indomain == NULL || indomain[0] == '\0' ||
+-      inmap == NULL || inmap == '\0')
++      inmap == NULL || inmap[0] == '\0')
+     return YPERR_BADARGS;
+ 
+   res = YPERR_YPERR;
+-- 
+2.12.2
+
diff --git a/meta-networking/recipes-support/nis/yp-tools_3.3.bb b/meta-networking/recipes-support/nis/yp-tools_3.3.bb
index 69217fad1..7bd4630f7 100644
--- a/meta-networking/recipes-support/nis/yp-tools_3.3.bb
+++ b/meta-networking/recipes-support/nis/yp-tools_3.3.bb
@@ -15,7 +15,8 @@ SRC_URI = "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 \
            file://domainname.service \
            file://yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch \
            file://alignment-cheat.patch \
-"
+           file://0001-lib-yp_all_host.c-Fix-build-with-gcc-7.patch \
+           "
 SRC_URI[md5sum] = "acebeecc11a73fb8097503670344834c"
 SRC_URI[sha256sum] = "812be817df3d4c25813552be336c6c6ad5aedaf65611b81af3ad9f98fb3c2e50"
 
-- 
2.12.2


