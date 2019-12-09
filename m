Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id F34AC7FC00
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:16 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id z3so14142980wru.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=a3sD9MLyrQgCFNPnxiX0hWItEF/Xaexw0jZb3NPedcw=;
	b=sJkDIebEhl5I7LS9OhkF9PaefqsZrwz/x37OFxGaGbdGm7j+AXmVvJSYbXKXfLJcyJ
	+XCkyUoj6Y1CiEPqG+Bx/yv152DH0Shmv2C9u3IiH9IgWzAlXq9D07iCyPez86S7dFqw
	9VHuz5Qe7c+EcE305dbtWZrLCFsY0AeS5if1Iekpr0X+f6EMRpGngNZoZ/ORPdb0F5BT
	zK4P5edLhkDztdzCu3oZsOjsW2QWZNcha187ddFmT+/SEopHf45lFewtt+iWDNdEw56U
	117up9IAy8aK4ekBsmbtJPc2J1kbOjZKRVXUyBSBpJQEfhDl9jDz4H5hUxtDLCb7AQQA
	apiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a3sD9MLyrQgCFNPnxiX0hWItEF/Xaexw0jZb3NPedcw=;
	b=RCRC/INpEQkgA9HCKhGgiCjyZYPaYY4B3/hgeKllIP4TCn+m2t8o7Zkuxdn1X7Rx1Q
	DOyyB2OUog4ATGLXy3r9YiAK/kQhs9tGZcDhVCxfmWS9xu0NawmsDSpphQ7gceIxkroL
	H+zMrJ8L0q6QXCDP8PJunlSpbvmtFGkjX8mcxtdGG+nkiDLgzt14vUDMYf7Ep0mqzLV1
	LRABu9IqG2pr/tGqGvLfEpcOzKr2Wpc62rCNBy64w637PJ5sPuQmDDs2YuNy+RaaiDyH
	zpzsXwpLmRRhQtUfkafH11lzsuUp+/aBizid3UZaAM9T6qyGT/jbfn71onFUuHhncSDL
	roCA==
X-Gm-Message-State: APjAAAVlUwseSCu4x/4YjADmNSo51/f0dW+GGQnEKCHT2lhQTSggDfss
	z0stGFD9b30+CNNQAlj3k6om8XxD
X-Google-Smtp-Source: APXvYqxfkhMnH60fL0/M1Wq8sga2LPqoesPHLCQVb4nVRsU6OlXWHlI3k5UKfy2oxyyoAZKw+NvpOA==
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr29021635wrt.100.1575851957684;
	Sun, 08 Dec 2019 16:39:17 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:36 +0100
Message-Id: <20191209003840.3383-26-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 25/29] colord-gtk: add polkit to required distro features
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
index 8f6cd0431..7845509ba 100644
--- a/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
+++ b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
@@ -18,4 +18,8 @@ EXTRA_OEMESON = "-Dman=false"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+
+# colord
+REQUIRED_DISTRO_FEATURES += "polkit"
+
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
-- 
2.21.0


