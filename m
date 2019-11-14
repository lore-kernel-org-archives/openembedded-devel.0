Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 38BAE7FA17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:47 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id b18so6549449wrj.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RvvFnHc0F3ZC80DadJEIvLfpYj+Rz1t4Upd/uEI6tMQ=;
	b=R00JowOx/PVZgoiJBIFunnPRVhaMQxPguVFAh3BAgGW6Zusmec7GYQRdl21pQ48/U5
	O3PE7fypW5n3I2EZj98t3Tzb3OyLMfLRavriyV0ft7WeqXkHKmcNTNaCCWqKs8IBggX0
	zsbZ/iDOCVrhKIdKZnffr4Uavxf5Q7YoT+Mhuv4SnYxkoLHBxONYn9rW8jT/YmSdsiZv
	kRmVtsykBKWkR5efy+bZO0Nx9p4QEsgaWqPVXnr2FgEwVyl2G2xCTamYq/+B8L7kqAD6
	Wuw3Pu2QaDJ3JMpcVdTb1reytp6i57sZKkMlDeDWnqB7zruhhwQnHJ/qOlSpa1o5Zlb2
	jg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RvvFnHc0F3ZC80DadJEIvLfpYj+Rz1t4Upd/uEI6tMQ=;
	b=tBHqdRmoJDmO8RILmrl6ucDnEgYvblc/pseE4oTbcG4sM1ysI50kgJ+MtP1ECHnQHp
	dNjSWA02hniVVpZzkLP9SW5sYNLFoWMHKiI1h0Oygcv5aMYJA5kHhLT83GI9NUOC+Q2v
	zCMKPmnbynhNJ+yW3nIOCuEKj4/vvm9MgAVJBIn1I2ihf/KLN2xBqMOgI5FdVBsDdIIO
	0HMwiWLcNdt/UY96NVNShe9VYMYRZpNzj6wVB5ASxQ591K7S8oOfwIxsUmE+ie5XAW/N
	PObH4o6Dz0CEfuwu82UNIywZsSovx3WuR/TX5Kt0F0jrYyMWzYUHUL9TnLrpmvoKXMGD
	LqUw==
X-Gm-Message-State: APjAAAUtYtbwMaBC5XWzaa7wORev3kT3cm0T7pASMSB5SLdtSR4zeFPI
	M1wktkio0YFbv2aIAZ8RiybHwqJS
X-Google-Smtp-Source: APXvYqzXJr3nBrIuNQNs+ZIGcZROrgKcjDKdok2Hwid3E7ZONT7M/B1/cn8itqjAUOk1XgDkHfzz/g==
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr9896213wru.159.1573760987757; 
	Thu, 14 Nov 2019 11:49:47 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:47 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:23 +0100
Message-Id: <20191114194930.2786-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/16] gexiv2: initial add 0.12.0
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is an optional dependecy for upcoming nautils 3.34.0

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gexiv2/gexiv2_0.12.0.bb     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb
new file mode 100644
index 000000000..458eaeaa1
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A GObject-based Exiv2 wrapper"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
+
+DEPENDS = "exiv2"
+
+GNOMEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk_doc"
+
+inherit gnomebase gobject-introspection gtk-doc
+
+SRC_URI[archive.md5sum] = "0a618c5b053106d1801d89cc77385419"
+SRC_URI[archive.sha256sum] = "58f539b0386f36300b76f3afea3a508de4914b27e78f58ee4d142486a42f926a"
+
+EXTRA_OEMESON = " \
+    -Dvapi=false \
+    -Dpython2_girdir=no \
+    -Dpython3_girdir=no \
+"
-- 
2.21.0


