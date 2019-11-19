Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E22FF7CE5F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:17:40 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i12so22478684wro.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 23:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2cmtlNN9+WKAn3HcE+9WF5B+KV1DjqooowwJtunolME=;
	b=fk+IjiA8HQzGhRB9dC6+s5onvl7zTwL7o9w5xlxGEK9o9V3Pcvzq6THlCJ/QkiXkIL
	mBbbcfiOvIuq5NvGfZzDu7AQMDe9uhTlI8C9z6iXUlKW9tUFPZOEF+g9hmUwfqWCkzRo
	VSXIPpf2sKwgiXozcmU4mHYzEtaolKdoN0XC6wE5w9y8xJSYodoUnK0SIQPsSa5Se+tl
	TSwU5Se6OGV0SY4xCyy0lTsIKdJvOO3zeBAasEcMAnW+xOhnSjHdAkHOPwKAm9BUnLtW
	sqiXoVdArd+Uv1NllTsFrw2Dx87oP+z+E4ccAM2ybenNMe4RQ/84sBUJ2Eb9AGiFWmiQ
	5gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2cmtlNN9+WKAn3HcE+9WF5B+KV1DjqooowwJtunolME=;
	b=h6sk4HYmYbc/6MY/zCa1MdVe4nz7QnUSnOjJj8cNHhCr7ce2XzX/rnLGFBy+iaYn/p
	fAE8ged7AcU1WlYchjbPzP73KzlFgG7QF1XoPtbdBs30uti6BFfPohs5hutGFWBPrKvq
	Ajg8Nq0+vJz3fCQBg0j+Yt20xp31wJ1Rt1+zo7cl2BTxbuykzvMnwJ8RMWB6GdB8uR52
	fFwch2QrheTQzJWpYCbwmTpRIgqQFyrk0hmc7TyVbYyQtD/q/yJPCx9+OgidKZs+ipir
	gtyxgvjlXHPol+Yo1vxaowLmcnkrDoyMLmAu+2+Q5X62WSam8CJ6R0nsvDx/tDLUVojp
	RMKA==
X-Gm-Message-State: APjAAAUWa+L3rWdMA5s3SKb0sQBvnEvQgGqrPJCwGBZkUFrNCiKHeZEL
	+DKkGVRebkK6ToTwVlf/EB5ni18z
X-Google-Smtp-Source: APXvYqzb5Xcc3mfeSPIrWIIlHZsgopXZuJOeB/E17csktyyiCw1r9rjP9VgJ3feFSv8XdLCNOOlTOQ==
X-Received: by 2002:a5d:6a8c:: with SMTP id s12mr29123376wru.353.1574147861488;
	Mon, 18 Nov 2019 23:17:41 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0CB657F29A81DEDF319DFC.dip0.t-ipconnect.de.
	[2003:f0:7f0c:b657:f29a:81de:df31:9dfc])
	by smtp.gmail.com with ESMTPSA id
	b1sm24480182wrs.74.2019.11.18.23.17.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 23:17:40 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 08:17:22 +0100
Message-Id: <20191119071730.2682-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119071730.2682-1-schnitzeltony@gmail.com>
References: <20191119071730.2682-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] file-roller: add gsettings to inherit
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
X-List-Received-Date: Tue, 19 Nov 2019 07:17:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb
index 8350189a5..7dcf3e9ec 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
     libnotify \
 "
 
-inherit gnomebase itstool gnome-help gettext upstream-version-is-even
+inherit gnomebase gsettings itstool gnome-help gettext upstream-version-is-even
 
 SRC_URI[archive.md5sum] = "e79715bb2400df83c0f67cc0cce2b655"
 SRC_URI[archive.sha256sum] = "c60a79e0baf74cb1c09a1c8f5ffe0d6e311227ca14ecc5b1156beb3715341a71"
-- 
2.21.0


