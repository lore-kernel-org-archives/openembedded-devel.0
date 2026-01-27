Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDB0D25948
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 06:00:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3951.1769493641459237678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 22:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DbCsxYcA;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso59936345e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 22:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769493640; x=1770098440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/c3MRYQveNHsl6vvKoxeZpsGs1vLZmusotqH0ieWHNA=;
        b=DbCsxYcAdOdyK/i/lEPp5c58E42ciB859cGn3W896BibC+kKsKKXo2dQTP88x+Gi8J
         MJN78+ajBs+gVcvZtNgUudYvWn1px7uJHh5uKKlvIof9Owe8P8cadbnIqK8jyM+bgnvw
         mWlaID+S0ft3M3DngTMYkRVw497GBSUm68xX0ROXBkTjhC6UzOFMv8bkxBNm7n6eAOip
         UrjsU1DeI5OAjaHCBjVDSljpxOnd0KUAXq0aDeginxuLmu7POc7IRlcvZ0m07PKM5see
         gg7EbVNVDMUB7D6nKgHnLOy1DF3PWiXXJd6tifqj/ZoiyeTeMenVSnVv9aoFFqrXK0Fx
         CH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769493640; x=1770098440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/c3MRYQveNHsl6vvKoxeZpsGs1vLZmusotqH0ieWHNA=;
        b=w8pA7nE1GjMJpAJwdDDuBtn6WJh6IlAAYG0c01U4mBUxdUmB4PrObtuXjcj3dOfY0M
         UbEt2HAuWTnXED3HkNw8ibNT+z9Cvfu6P7y9SeXbS9g7gZNvtEntb+/8qO4GnDcvD9OA
         lthL7PPk3EceN/pExiFBiqwXdPOP7qf5bYPhNmMzFb5MrLuRfhDgrfamLAHogonk2yv/
         5OXBvO82SIx/mtFuo4FM3rmD5Lmj9tn48iygGLDVSuKe0m5CD6k7mRZWviaA28NXpm9X
         Rhu/skTPKKTRHf9ohhFVcYEAJlFe8FOVDn2EdEveOMN22W2etwvPtlQsNQNjwkzTXzmO
         WyXw==
X-Gm-Message-State: AOJu0YypMD3hG8tAuwfX+TfjBMVaWbui6goDvNTxDdlCkxLmb5VCc/Hd
	teea2ppgkRM0unXbNY4uf9cncuuuD580eSJTY3olHu4H/r+RvwqXp+kMXyT7jQ==
X-Gm-Gg: AZuq6aIGdJtoRu1xcUfPoTVIvJNzwt8h69JAz3OYuCpKGNOgDsH/93z4nPZfDVu/Jm2
	IBHo9Il/zB90SoGSazmYl8IBTFY8L9zUHiU9aRaoKL88oi4nHEoWDRnEDDUG7njEUMkBkz1JKHX
	dCKR3nua0tg4T5CkfHit6GmqX+D0nIikWkkF0Zi4E38rz1qmlBuJsOeW8WezDpI3pjMGPq+s9KV
	LgoTeghFRDHNM/VtHnhrdUw6WzuEhHfH92ZmKUCCHoB0U+Pf9LefEvuqNTobwTUfB4/838k6ydn
	BZSo+Z+Tly+/KS63KTom2udFu4kX9ZTgHY4pR5a5LINEB0VDQyp6biFGRGxAH6eQ50+HLZa+3QP
	TEaq42U1cJjvo7OCIGzNG1M+ivP5C7saFz6pYSmKN3pwmktlpgSSEE+lLLVIIxJObbJAV710nuV
	8owZ+3FmK1
X-Received: by 2002:a05:600c:1c17:b0:480:462e:d640 with SMTP id 5b1f17b1804b1-48069c7f78cmr7121755e9.36.1769493639705;
        Mon, 26 Jan 2026 22:00:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d3ae17esm126122825e9.0.2026.01.26.22.00.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 22:00:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 5/5] gvfs: upgrade 1.50.4 -> 1.50.7
Date: Tue, 27 Jan 2026 07:00:34 +0100
Message-ID: <20260127060034.1301860-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127060034.1301860-1-skandigraun@gmail.com>
References: <20260127060034.1301860-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 06:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123904

Changelog:

1.50.7:
* client: Prevent returning invalid mount cache entries
* dav: Fix authentication issues when DNS-SD URIs are used
* nfs: Fix IPv6 URI handling
* sftp/ftp: Ensure that is-symlink is always set to avoid warnings
* Translation updates

1.50.6:
* udisks2: Disconnect signal handlers to fix crashes when unmounting
* fuse: Include missing locale.h header
* Translation updates

1.50.5:
* smbbrowse: Fix empty device listing after unrelated mount failure
* udisks: Fix missing unmount notifications
* trash: Fix nfs4 and cifs monitoring
* smb: Allow renaming a file to the same name with a different case
* mtp: Emit delete event on device disconnection
* trash: Fix wrongly reported item-count
* Some other fixes and improvements
* Translation updates

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.50.4.bb => gvfs_1.50.7.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.50.4.bb => gvfs_1.50.7.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.7.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.50.7.bb
index a8510a3d59..d49d3dda56 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.7.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.sha256sum] = "ab9059a676a537edbea21388c2aafe1a7e2c8f1ac2dfdc6d64550233075457fd"
+SRC_URI[archive.sha256sum] = "72add2c109454e3b43025f249b7caa4836ff6f77705e895f442063a273a7f231"
 
 # depends on gsettings-desktop-schemas->gcr->gtk+3-> x11
 REQUIRED_DISTRO_FEATURES = "x11"

