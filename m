Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id AD9887E426
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:25 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id d9so4904252wrx.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uAqq4lx2Q04J122325tRpe5GBQmD+pTplDnfde6epds=;
	b=ljyAQ30wSBKbAr1ZygeuM1TOGOCsUhhFcspKEgxYQpU29uo7yQvfZcygdl62fUjygC
	xngvjxKwO7PUVtvY0R6bFywwWzfgckBQ85Nw+2XfVY4yMMMuEI61LwEp2zCfG3cBUOPj
	gfifrUsAUqteHzvqxVdrtQFBXtrmULVZcv6EQsDqpv8wEugEtY7VA33Pct6kBmlrGRxy
	kP2239Ni1b2cr7PFsuLDgaUkbo8cmIy90U8CAea4s97QM+rtFjJD9TzyEzW9D2/W+0cb
	PHxw8xLFCwcD0RQPHESnqiKs9QPPOhkaADzfmcFhAnB86Z7QMcMHOlUBwVTCgfTZfRLr
	cGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uAqq4lx2Q04J122325tRpe5GBQmD+pTplDnfde6epds=;
	b=TNhVUIWLuV8IXmra1Cwvy4Q3huc/Sgo6GqtqCYwTy3x0riSU4Tv7gLHaC/AmNwNN+X
	wJXRiTQQazgFh2no7O1q6cG3CYRNG6RpuEm5M0FTmOtDgmX8gcj4pzAP6NunDU57uL+F
	0356ngRNyGU/4ApDAs46To7iLG0VApE58PdkHxovooB0q7BwQ+uuLo8LE0e19gtgu0ry
	LZlwjYflzY3c1sZwha1pn7yLZoe3kpc67ilVD7zaA1RnbHeW1rKu0s2kcUcy2XUG6xd6
	jeeAHu2bMdJBDR89CH3BtI3Q0tDBfCwn7jWKIvE1hzY1wHN7MWoUfRv9/2QTBwgtkzie
	vbxQ==
X-Gm-Message-State: APjAAAW+dDG8vSIW0OGXekzLLf7UcQO7L5JACi3K0lJcoiT0iTSh1VE5
	XwG/64CfO31ufDjNmtI3YK30NuikpsI=
X-Google-Smtp-Source: APXvYqzNKH9q8goB4zhskM/v0oYBQO+mh92EoQiNxDBR0gj+KfnfjhNyYFxbTXoOVS/X/HujPNneuQ==
X-Received: by 2002:adf:dfd0:: with SMTP id q16mr2275090wrn.235.1558594166342; 
	Wed, 22 May 2019 23:49:26 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:39 +0200
Message-Id: <20190523064859.24336-22-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 21/41] gexiv2: initial add 0.12.0
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
X-List-Received-Date: Thu, 23 May 2019 06:49:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is an optional dependecy for upcoming nautils 3.22.1

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gexiv2/gexiv2_0.12.0.bb     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb
new file mode 100644
index 000000000..65a9257f2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "A GObject-based Exiv2 wrapper"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
+
+DEPENDS = " \
+   exiv2 \
+"
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
2.20.1


