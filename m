Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id ED71A7FC98
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:10 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id c9so25042651wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=26y0bLEeeryA9mLJaebZl8P0lORK1h66/DVYLwIARc8=;
	b=a0PrfVU2lzj+4eeVetotdit23uNWxKg6WW9BVL6s+/YP1y/wHR+BCARLjup1jzvxmK
	YRYjn0/4TCEqSXqAOD/iqVi5R7R/p0V9gpqYpcotDop92LXGzlnpviavXAste7JN4AuP
	AKsuvfaTi3sDyfFmeJiYkUJ+TlYqj/0BNjwEgLgXhHtf7X/8Y/C6RfpBDXGRdXhZ2VLe
	1PDnrTuwhCuBw6Ab7GOnactX985w/vqWwOX8sjTQR4xqbsTsCKOmY2vbCDyW8iZyO7a1
	LNcD2muBGHl+vOCXlqDyknmzHvHhD8lLZ1M+qKj6jAPZO0QEuj2LdxTEGz0y9J2iQ3WV
	e+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=26y0bLEeeryA9mLJaebZl8P0lORK1h66/DVYLwIARc8=;
	b=V8+Gyw2nWFv6zj5Kffv/oJiPzSfjHeICQPSymMfhncDZzuMWBaNHYwKfNLRQup1QZm
	XoZWPlV4683NzBRUgMuUqcynuhAzZpWo6/YvZPYe1en6wJ/ceiiDEyPn/Tc7sayUKwvp
	3vBm3/hOLZlc+dwlWMN7GAgGWdf/R9LKGcnV0U334Uo+sDMFb5hvW56PnzGLv5dI9ffh
	pERNCniOeEIRnaFbEisyOj5YDemDofkplxJhi0HMOzRpslBGYkFIwVqxnYWcwLDPqgN5
	tJcB+mBXhfxZqpARdjfil+iynKZnbjJ3PP85tQTlW6dKnJidOdXODbbR802qdC4BZxzj
	cEEw==
X-Gm-Message-State: APjAAAUeANhWkXyeC2HDL1/j6jY4Xgr2P91cPw5X2XwRZOcslw1hk++F
	8MCuF2XIs7QJzBD7Q4og45bEqKiZsUo=
X-Google-Smtp-Source: APXvYqwU713qwLQfuFjKjd3hufZOb/jkx5b14cdrH2i+Sf4yEmQdzAtB6i+xkIbFvVOzOhh7tUwk3A==
X-Received: by 2002:adf:fe07:: with SMTP id n7mr7736384wrr.286.1579346891533; 
	Sat, 18 Jan 2020 03:28:11 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:10 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:40 +0100
Message-Id: <20200118112757.5287-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/23] glade: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-devtools/glade/glade_3.22.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.1.bb b/meta-oe/recipes-devtools/glade/glade_3.22.1.bb
index cdd7057b3..01decabea 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.22.1.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.22.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "gtk+ gtk+3 glib-2.0 libxml2 intltool-native \
 "
 
 
-inherit features_check autotools pkgconfig gnomebase gobject-introspection
+inherit features_check autotools pkgconfig gnomebase gobject-introspection mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


