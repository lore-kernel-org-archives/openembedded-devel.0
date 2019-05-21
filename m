Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id E81E17E168
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:54 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id a3so7846354pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BoSmY7xTJkF4ygeLxWdR1R5PEc3OHOO6DX22xdHqwcE=;
	b=q/ouKRxffLVv3INbhegW5BxH6loFNvOiq/Qwmj2x/KIES5TZupRMKQ+egqH6ddco9h
	DnJOapXze44gcbLdvFLviaskg2p9qsTugSJTU8IHa7vQwWYnFR2zKQgzer4MgEyfy+5l
	ku5REZR0/LiYM8J6GDDGeaco4zU3daqIATR4kSE7btax75EiG8IIdnNI9rWE9x9FGEeY
	8XKKy7UpJzSQk4ncHmyndlNBclD+NXHx9L1IHmChJoMLgAHvZleFBiKUT6fmaU5APLqm
	12NrA6pSGG2F8/LOyiOYHQmM5UidSZ8u55R5xU4mCPdXVUbG8JT+YPXq7XPhhxdbOMOX
	38Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BoSmY7xTJkF4ygeLxWdR1R5PEc3OHOO6DX22xdHqwcE=;
	b=iUp5zO9Lg+SGRi1gtVWNHz5LfI8iFzg+8dC6MFuwcgNC2iiJknIl/vigFxQIKGykn+
	8lvg9PQcvtAwDEKoMOzQB6W4eMjKTVQ4150GvZ6uGuSa2yTUsVW3Lh/C9P64b42lv8cj
	445LXDwjr2ztJxV6BSHgKhNPx9M9IfurhrWvtMameDURbrVuj2qBgUDlMPxE3ouUWEk4
	QnbwUNYrMxLa3NGwCfN4pdk1az+c1AQmkIurJafzXxPcPpHNI7uKkUgYAB/rh9jFByjs
	G4/E0l8rK0uHcbJPgFJ3i3J99CKFehOFuoRQGixuCJx9eeKltEjBsuDj2Ff58QyD9lh3
	Pu/A==
X-Gm-Message-State: APjAAAWzT7FHfKaAocHamQq1FVkLdfQ/Y5IqnY1jMHFJOZE6KulFpF8U
	kQ95K+Fnt37y0p6xx1fBpbNvgz2f
X-Google-Smtp-Source: APXvYqxKNtNsVcaArH4ktPIvhjscSodUKcG9AhZqa+grbxsrYpYiNzLTt/PFqxbFwgnHEfj4Wao7nQ==
X-Received: by 2002:a65:6497:: with SMTP id e23mr65184505pgv.388.1558411016054;
	Mon, 20 May 2019 20:56:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:22 -0700
Message-Id: <bbab208f537c52155f3ee83f6550545c9452bacc.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior][patch 22/34] meta-xfce: add meta-networking to layer depends
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
X-List-Received-Date: Tue, 21 May 2019 03:56:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

* blueman was moved to meta-networking (without an explanation why). It is
  added to packagegroup-xfce-extended in case 'bluetooth' is in DISTRO_FEATURES
* thunar-shares-plugin RDEPENDS on samba-server

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-xfce/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 2a4c87f..80cfe08 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -17,6 +17,7 @@ LAYERDEPENDS_xfce-layer += "openembedded-layer"
 LAYERDEPENDS_xfce-layer += "gnome-layer"
 LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
+LAYERDEPENDS_xfce-layer += "networking-layer"
 
 LAYERSERIES_COMPAT_xfce-layer = "warrior"
 
-- 
2.7.4


