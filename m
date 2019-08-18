Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD4D7F290
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 22:33:43 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 10so1353669wmp.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=n2uiE9URik7o/3cseDD2Qrk7CLBqc+cE0JdPZYvS3/I=;
	b=ql4KZT7Mm5rl69NfF7CMO6HFJqCpFXlOU4du4rciB12wHcFP4zo/KfeMehG6Gj1rii
	ZtiIJtQvkuhwDHZIlYYNCUuFrvJXe7A6qzq2+TPrgbRCTeOae6jbLWHYWWcG3Hn/rRWY
	pI27gB7tNsuAE39tcCxc+P/ynGsZbt6DOgONT1rSfNHRsVgKLcJ8dmGq1SQOhko4P7vs
	X9RkbhOYiKt7CslB9mJpBDthZb54IHd4LDzAo9euewH/bML/2DWldf/4YcrEh35CKhsM
	r2QwuYlx5zLYkiw29XTV8C52+QjVNu6D3ZxD2y9rWxaum2CFxciNin7FKywMyzNBl0sw
	t90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=n2uiE9URik7o/3cseDD2Qrk7CLBqc+cE0JdPZYvS3/I=;
	b=H7WCfg25s5mmbxRTAV7JlxX9a09+bSNUwP90nEtFI3UDs4xqa0adbPSB5k44ZTrDnA
	UWAs7nnMfaMnRsVsSy+NoXmnsxAtHEdOzoz1TMvPeq5DWC9rsYCSDvkjbhUHZ85FM0fB
	7s78djmPUzsp6s787eQuwhv/4yL4GYc0rmXKBt86GhH7QLYr54l08y8UKR17wL5ybojk
	vsaxpe5xUfxfVftnWvHZ1WXovJedxnztqTBulFMLKnrbSQpx0bN96DHqGdjnvsFpUZc0
	z5AhpJtkKpeyXIKmZxnB18QWQB+G7ZRBY4cRXg/DeVb52+Bcjm/RxU1jBYLy8hS3KD/I
	SzFA==
X-Gm-Message-State: APjAAAV5qFhh+GOgVD2GKyny2ocfe44PGDDr8P6L5K3gDZEtlTgES9D1
	tTDL7SjOg2KnOgGqwHAAxUGBFVXg
X-Google-Smtp-Source: APXvYqxWRM1bVevlIqfHEQ+NT+c4aHmzcW9EouuZznDNoQCi8BEuK8WDM6vTI6fvPszQmpgEqf2BEg==
X-Received: by 2002:a1c:770d:: with SMTP id t13mr17336236wmi.27.1566167624093; 
	Sun, 18 Aug 2019 15:33:44 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2D8718C84C5511B02F056F.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8718:c84c:5511:b02f:56f])
	by smtp.gmail.com with ESMTPSA id
	k124sm30390814wmk.47.2019.08.18.15.33.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 18 Aug 2019 15:33:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Mon, 19 Aug 2019 00:33:14 +0200
Message-Id: <20190818223316.19772-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190818223316.19772-1-schnitzeltony@gmail.com>
References: <20190818223316.19772-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 08/10] xfce4-fsguard-plugin: upgrade 1.1.0 -> 1.1.1
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
X-List-Received-Date: Sun, 18 Aug 2019 22:33:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Announcement says it is a translation-updates-only-release but it seems they
changed licence either.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...d-plugin_1.1.0.bb => xfce4-fsguard-plugin_1.1.1.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-xfce/recipes-panel-plugins/fsguard/{xfce4-fsguard-plugin_1.1.0.bb => xfce4-fsguard-plugin_1.1.1.bb} (33%)

diff --git a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.1.bb
similarity index 33%
rename from meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.0.bb
rename to meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.1.bb
index 8b924ac75..183d521af 100644
--- a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.0.bb
+++ b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.1.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "The FSGuard panel plugin checks free space on a chosen mount point frequently and displays a message when a limit is reached"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-fsguard-plugin?&#recet_releases"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-fsguard-plugin"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3434d79d62df09abf5f78bb76d6cd21b"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "c9fcc1ff37f38e6ed518eca3b9887aa8"
-SRC_URI[sha256sum] = "6b038322b49d29625219e6a54497085b8f834b9c1fd15282ce286a6529d7c445"
+SRC_URI[md5sum] = "d1e1fda4e80c36741643b1d9eca5c5c1"
+SRC_URI[sha256sum] = "d6d05d0a90a68453d65cdceec5ca7eeaef864393ab62eef532a7ba58f374d516"
-- 
2.21.0


