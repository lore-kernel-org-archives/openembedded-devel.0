Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC417FC9A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:12 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id b19so9818935wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=i72fbXx2QkiuwXlg35TcA8FNgUl5i0FOCgaJw4t+5hc=;
	b=H4XSOyl042W/ZlQIte9M/+7eyywpkRxLWelnoPrY5yqofgf8BUKvGc71mXEvWl0Zfu
	Aaz0TV8YqbfjJ3D3eLD7eJBHUERb38S6doCv7qHoxax825FnrbgMYJlFPlrZ3x9rmiYV
	AscrD9dzzdKGQkL+wbgKd/TQV5KHcsyJVUij/O51GMTDoHlLkIXWzRmLJiiXqeRloGYm
	kZ60a9zY5Roto4lqHJRJVi98usdqA4gn02NlQNBvQMlo+xTcxt4/z9yX0KI8ZWirt7tu
	3G4Hvvh6ywdHaVefb70bjfxXZB5Cyno8I3+DcEG40WN41hKUKMHl2P+7cEvWkAXAn46O
	+Ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i72fbXx2QkiuwXlg35TcA8FNgUl5i0FOCgaJw4t+5hc=;
	b=eY/9TRufiFzUXVqjEA38/Xa4xtDf68L88wJJa3VqX18JdkImuaLxUU598Fv6L1Bjar
	xXDrxJiITOlBY9l4GwufZSxBe+PGALO7XTnNTVzHlbnaY1vnKfQtQxoUu5E5c2da+6sh
	mmTC2YF7+VEM1eNBKBW7RSRr/y3xbr1CJZm8pupWQuN4N0d0Wbw0MwbkSjY0vXpsp3lx
	WT0vF5ccnUYaWXAmfp/xDOJcxhlwdZg0NpL3/JBQdlyriB9dmb1zTceTQAOTAOATAhE+
	Z2riQ19WbSsn9vQngt6csXvHqc0BZWZRLIk9UiS6Gim93F2n5FjuNvtGa0GZQPQYbn47
	obbg==
X-Gm-Message-State: APjAAAXrW9haNCfBmyaIsdW7c6qSuCsATm8qRwu6rIeD2H39C33PQ7Td
	OgYHGYfgyNIIv58p9XZgoHlefRZax3k=
X-Google-Smtp-Source: APXvYqwmr5fFU96sl7JIVa87C5qylgsupJSmqRBrnlvWoXdHosy0n7jFe9+cMf/9GCnZVgUAWemqOA==
X-Received: by 2002:a1c:8095:: with SMTP id b143mr9097089wmd.7.1579346893180; 
	Sat, 18 Jan 2020 03:28:13 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:12 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:42 +0100
Message-Id: <20200118112757.5287-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/23] mousepad: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-apps/mousepad/mousepad_0.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.2.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.2.bb
index 4bf10a47b..29038ac19 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.2.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+3 gtksourceview3 xfconf xfce4-dev-tools-native"
 
-inherit xfce-app gsettings
+inherit xfce-app gsettings mime-xdg
 
 SRC_URI[md5sum] = "98d908842d4a93c35756a67d681c08fe"
 SRC_URI[sha256sum] = "84c02adfca7f8b33b9466a306ded72fb9f38f93c9edb78660343854c4a3aded7"
-- 
2.21.0


