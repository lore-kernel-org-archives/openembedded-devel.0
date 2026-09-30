Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0531DCA5FCF
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:30:55 +0000 (UTC)
Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.130.1790811047698372762
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 16:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JjpOhehc;
 spf=pass (domain: gmail.com, ip: 74.125.228.39, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78d59bb02so2320295a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 16:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811047; x=1791415847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hyJSMHWNEY0+RZ/uMJuMI3UDXKItbSx2+D3M0XHl9LE=;
        b=JjpOhehcdqkoFLxZKtkAcps7NLt0qBzH0a1RrJ4YSKQNcNWRfzvKc8NTwJPuQtsc4v
         wb8TvtfyUX/m/ooWhouY6I6wUEw5k9oJ55u5F4MvkuZv8QymgfKoCgl4qdVHfMETJKOq
         0LTgBMj2vRSYFxD9WKg5CBu3v5ZGU2wITsGDwkFG2Pa5QnOdZdfzTe1iM/vRe6H7QLL4
         2ehmaLRVBR3Cn/rhROxg8SAt9/H3qzxdjQIu1E/nVq0+7kz0BFIim/tPHcBTO5Tgooq1
         rZzHRlX9IWT8aEgmt163MMd1dbYd1BgpPiZZX9ElMSSmUO4uBNM4zTqfHdj3PxICcOXW
         GfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811047; x=1791415847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hyJSMHWNEY0+RZ/uMJuMI3UDXKItbSx2+D3M0XHl9LE=;
        b=T4cdoPVcIerCBZDHAWWhjo3R92GPqeY5+BAVLuJT8mJ7iCmmldDd3ZUB+gCJ8B/XI0
         j7PKL9J1ZizkSK+SS8om1eeOwMUu2j7JfMre94HgPV1mB85nhdtDcsVRC374gejm2wHT
         +nJtEytDFoGg7TI9tUzpf3yE3Vv/PhpZBLME5HrPOJpu9eCsHVmwqf5QfogPQROHp94Y
         kTjBSinNmWWTJaMB3YzFlC+2cqYlNRYU8ncn9+GQntlvBL6kigkb7YGtnOGQwTpbHaNQ
         hE5DB3gcD/0XGI5VK7SHp76QDBw/N+OTvW+pJm1J5YkZIfOUaVU7JEP02iObNFmGrfVk
         p3JQ==
X-Gm-Message-State: AFuF++nADF79usxrDGuw8EznsH1Yb1En8F0tdgMnD0zchsL6+b3/Nwj4
	uLaONWQB+SWxmZygaG7MH2rPE/umjdvBeULc6XHzYfH8j5y3VI7RTj3F7jcyJg==
X-Gm-Gg: AYBFou2R953v+VNIqaQniEYdTUUUY9xl5KqBQbeLfArsS/xvrmluLzsxPy+hRRh54Tx
	fZAG6OW75rqdCZk2D3Mhv8F5V5EPNuaYKoFKf0lZ6dRALMK3Dd1gSH+fCbp/LcPXOu1iWWUGH3c
	Qi8pXdfZhAlHaWYFXABxOLSWbmNhZqm6h578Flvyehr82EWbCJkuVCuI/fgOJCdSlnbEnjWdnu2
	tBJJJkQjuqf9T8VsI/AOuppLk6HkS2OKs6oXydPuos+tDWYvlFeyCZXLLyNSysl6ITZpyUE+bgM
	D2y4fgK/28q3V4Zk7pPGi5xvKraeHjBbtXjroRouHigjcI/fw8TPw93IoKTka1QdGMtgDwfzECP
	HfdhZmDaNn8a1QY2U9wM2xjfptyehTndYvlvyLB3+jHHwMyi3tWczkAGB2lpGnvFH8W+E32zeww
	UqXbtpvRGs+ubVy66roQGhzSEmTKZV46UbIOH/np8u5W7QHdlE8COY3fBEpJj4o4km5J7uR3mld
	ex/Ghi7RlYcK691pOdMNB0=
X-Received: by 2002:a05:6a21:2983:b0:3cd:8bba:824f with SMTP id adf61e73a8af0-3de9e0dbfb9mr3043200637.4.1790811047000;
        Wed, 30 Sep 2026 16:30:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881589a0c3sm231249b3a.7.2026.09.30.16.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:30:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 3/14] ifuse: add UPSTREAM_CHECK variables
Date: Thu,  1 Oct 2026 12:30:23 +1300
Message-ID: <20260930233034.659237-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
References: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 23:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130536

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version ifuse
...
INFO: Current version: 1.2.1
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.1.bb b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.1.bb
index 82dc3b714c..aea737d334 100644
--- a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.1.bb
+++ b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.1.bb
@@ -7,6 +7,9 @@ DEPENDS = "fuse3 libimobiledevice"
 
 SRC_URI = "https://github.com/libimobiledevice/ifuse/releases/download/${PV}/ifuse-${PV}.tar.bz2"
 
+UPSTREAM_CHECK_URI = "https://github.com/libimobiledevice/ifuse/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
+
 SRC_URI[sha256sum] = "9d490470ba6553f8052b385bb5330462e46fbe82131ebe65be47a1cc1c70e857"
 
 inherit autotools pkgconfig

