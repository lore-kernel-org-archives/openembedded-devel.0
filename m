Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF1B7722B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 00:23:29 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r18so5897565wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 16:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=baYDt+OQIsJpz0DqHy1kc9s5OZ0/wA201JlpS9vJ6Gw=;
	b=pBYeivixy/radox+PQi/+sra1RTrZciLqEbxGaXkagljbmIBHKuyDKCBH+ntsroRUz
	Us8bvbP0+NZWrX5ahixkg3BP1cvEhHQ7vvDY4Z14uxnq155HFr8ewVOlLn01FWaTriZn
	gil/D67Aiyu5vf/xzA43zIcnwAVq4LzcSIbOjdygYs9voIVio11G02CRxO+HMnGtsxo3
	MpVNYaHnN4fOcjIfgoV/04066dUmxpnyFCuLKZUj37CQVUx1aAhezWPzZCBIiJSgyYey
	u2JARNtvM3NT/snWdSQ1+/2a/c/2E5MiorA3GiexKCipJrd/lLWR+UfndgugdO9qW7Mv
	rFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=baYDt+OQIsJpz0DqHy1kc9s5OZ0/wA201JlpS9vJ6Gw=;
	b=sA5HowwdMiM7q9IXu2zG4Ivh90JdvHaWYgQOOhmG/Ywyix35FjwmmOTVZFwJ/P9Jgl
	8rEUel1Hjop6NHHzMz9CMaKgDhBw6jV4/T24sxsNfpu3xn2QCt7YuK/qt37ZxgqQFNh+
	TL7yCo9V/jWk60ameQnFBewHGJa8tIMzLUnZfMNwy0Jn1fdnr9zeIEmFVfAt8tKTbCT0
	XQaSgcd0xjEt6Rr0Xcg+dH9C5hkXnAXLe2P/syq0CTXyIomz23se8SrJjjVd5AvQ8sis
	79IY4dk6ijzyu9QWJpAB2Wjl+z6pB3dEdE5sOssODH4zzGOkuz1I6maW4KNmXL2WcO3M
	wc1Q==
X-Gm-Message-State: AMke39nj8jw/U9mikq783eihLj1t+yb/S6HW1fVlWRuymuL/XJ/TwyJaMPxze02hOmQh7w==
X-Received: by 10.28.144.135 with SMTP id s129mr5479900wmd.18.1487118208882;
	Tue, 14 Feb 2017 16:23:28 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	g40sm2716232wrg.19.2017.02.14.16.23.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Feb 2017 16:23:28 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Feb 2017 01:22:54 +0100
Message-Id: <1487118174-23647-2-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1487118174-23647-1-git-send-email-max.krummenacher@toradex.com>
References: <1487118174-23647-1-git-send-email-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-gnome][PATCH][master-next 2/2] gnome-vfs: remove blacklist
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
X-List-Received-Date: Wed, 15 Feb 2017 00:23:29 -0000

Build is fixed for gnome-mime-data.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index edf5bfc..3ec6466 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -56,5 +56,3 @@ python populate_packages_prepend () {
     plugindir = d.expand('${libdir}/gnome-vfs-2.0/modules/')
     do_split_packages(d, plugindir, '^lib(.*)\.so$', 'gnome-vfs-plugin-%s', 'GNOME VFS plugin for %s')
 }
-
-PNBLACKLIST[gnome-vfs] ?= "Depends on blacklisted gnome-mime-data"
-- 
2.6.6


