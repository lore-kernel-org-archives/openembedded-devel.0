Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC017FCA4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:19 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id y11so25041828wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wUrGEWCyoAo/jJSyTunsjq9jOJMvc9U/obNRg4lKmQo=;
	b=ijGUp+NT61wnFWjWw9tAKxr6/hFwLzjvwpp8msJNOwcx8THQGP4knO+BfV7F3n1Pp3
	4fuBbWEw4LiAw5V8TWKIIYMaxv4ObvNmPnosSvFWcAww3gXvIrl3K6eGNbRhHGw1GNBu
	+qI0w4UoQ3llePxW7DeT7dXuNtR7wEFA3e1N09Eh9XSsrji50roRaCwuELUDvRqwau60
	gp+6qFympErH/TeHNfALg3IO1UtXRZTiNOOdDWxgxMFKReNYaUYmIsl5z8jdC7SvP4Z/
	up5KHXHQRNE7hqc3grCK+e9APz02qGesWyQMLkXCmO8Mu6z/ScmsSACD3enYewNksitm
	xG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wUrGEWCyoAo/jJSyTunsjq9jOJMvc9U/obNRg4lKmQo=;
	b=jFiZjkvq3VZUbRrTNVwBBp57zN3IjTjaTcDvHqf6mgOzCc86MJ84pW0aBXqiIHyKPr
	C6bwpI7BQhqAoe1We25++2loKcyYYp/YZvUtvSubEJgx/sJiD5GdrmqnE8oQaFF9j9UM
	LBJGiiQGzHPgKK4xZEu8ps5IOjJpPcwD45QYpbU4lQWKTC78FPBgkxeZMFrx77RhBA+b
	T9WlB23sLxdquXJtKJbLggbgNL++VlpXn6EmaFXONgrnXLhNm7K30OJ7YnO9lAtzH+gk
	xtyrt489+2ohmOzxsbR11YFyWGkkLiVqo36rJOWvNQbGBjkgVHyJcSRAOKN8XSatvpoD
	Z4kA==
X-Gm-Message-State: APjAAAU1PJ08gHpuiUyRWzuTtfWZvpCrWK56di/T4zS1ztLmMEgeqcIW
	O3+NOXWBEwXGR5HnyUTkwBTM+OInVwI=
X-Google-Smtp-Source: APXvYqwWGjeykhJNcu0Qrq/B3A2yZJW24xKkhv9ytB95A+Imm7TrvkoAjarj2ebb3NVEY2FUxRE7xg==
X-Received: by 2002:adf:df90:: with SMTP id z16mr7907632wrl.273.1579346900388; 
	Sat, 18 Jan 2020 03:28:20 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:50 +0100
Message-Id: <20200118112757.5287-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/23] file-roller: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/file-roller/file-roller_3.32.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.3.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.3.bb
index 3ab9668ec..f6b045786 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.3.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.3.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
     libnotify \
 "
 
-inherit gnomebase gsettings itstool gnome-help gettext upstream-version-is-even
+inherit gnomebase gsettings itstool gnome-help gettext upstream-version-is-even mime-xdg
 
 SRC_URI[archive.md5sum] = "5e098bb254d34f48a9b5761b468f4240"
 SRC_URI[archive.sha256sum] = "be111fb877dc1eb487ec5d6e2b72ba5defe1ab8033a6a6b9b9044a2a7787e22a"
-- 
2.21.0


