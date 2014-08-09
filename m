Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6691570A7F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:47 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id w62so6698601wes.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gUJFIA5ibXw/hzxiowVx7QkyXkoxCnht/A8HtOxsg3E=;
	b=iiEMEIxlgO1GVwSf1FbD27bGbZyyykhZ7mUW6MOi1KBKej0izMXwoYGOT8AQH7XNQh
	otKvd0TvzAob+zQrC2UN48nttdOFUJ+RkPA+y97NAoBa03ZKAy4wBqYUkSlDIroaMUjh
	ONktAkpA3WruZ+ERK+u/wmX7tikjU4R3jKYZkfLUsTBdTgfOUQGg6wYxN3PmXyCTXQoq
	48ozqAkg9M3UKkRrZHw67f0QKnwUTnxjoIm//i/LhajnENWik9R1FrzNVr2me+eFoysz
	s6r/n+CAl4LwJE+tzjnOzDWyqXXIdR7wqK80TdEH2rSEsSQ/hZzTjWsc/DKkBiB4sgqF
	kMmg==
X-Received: by 10.180.107.65 with SMTP id ha1mr11390833wib.59.1407600528225;
	Sat, 09 Aug 2014 09:08:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	19sm25551600wjz.3.2014.08.09.09.08.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:38 +0200
Message-Id: <1407600537-10857-17-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 17/36] gnome-power-manager: remove unrecognized configure options
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Aug 2014 16:08:50 -0000

* fixes following QA warning:
  gnome-power-manager-2.32.0: gnome-power-manager: configure was passed
    unrecognised options: --with-dpms-ext [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb      | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
index 586eba6..2c55cf1 100644
--- a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
@@ -21,7 +21,6 @@ EXTRA_OECONF = " --disable-scrollkeeper \
                  --disable-applets \
                  --x-includes=${STAGING_INCDIR} \
                  --x-libraries=${STAGING_LIBDIR} \
-                 --with-dpms-ext=${STAGING_INCDIR}/.. \
                  --enable-compile-warnings=no \
                  ac_cv_header_X11_extensions_dpms_h=yes \
 "
-- 
2.0.4


