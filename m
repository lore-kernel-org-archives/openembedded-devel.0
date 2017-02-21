Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 13BA872FD8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 23:06:21 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id v77so22258173wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 15:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nIE4JDx8XYrF0zeh7aeNfAlW8qf07dmEKH3W5ot2so8=;
	b=GBw04v6DOkN2v/PFdWYOCxZWoBA1TBsf7HY9RN2aDUfzmL7hOSKvBJq7lbm2CJoxhe
	tJq3Ba46j6UUrdRaAe3pcH+h06TiuyINDJAZXcYRpw44374+HtpQbHtIQOTvHcpli7sa
	ga5C+O5BhWZUJqoWmNq0iOKmHxtAGbLipzXEnL2wNxoiXKDn1dh8TYRb7NZZ8wKguKfh
	V3MvJ9nwZQ1RNPRc4LQk3OU+LsswZQxBsNBMHAt6KU63uVfkE06ZRTGsvCyC+Qu6TiEQ
	dGuhsCWgZdRv9fk8UAa0mKdl/sEgM8bQxPfKL25PhQl2e9qKuJNdJ5WyI2H7KDDvx2zN
	8ASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nIE4JDx8XYrF0zeh7aeNfAlW8qf07dmEKH3W5ot2so8=;
	b=a0iYIVIvR3JaymEhY4iWQZQg392JsnpRUAybwjkLlzZzVMfE0tKwjchtgt6EQhJCHo
	iAcwZBXMe8fgsP7xuVN3sCzJa1M3notGcWgOFiAFsnldXMMKjHyFtffoLwqN21S0tQV2
	j10Dn+dHNqq5exNyNjq4ve1yWQFEU7wXpThLj0E+ncgEl1nupWfoIfk/jfS39lcA8EJv
	urNS1KPUUu5j8lSNLtQl+7jJMBZxcPTNPWF9GnP+KJT12nx7J8ugTfFDTxXtvnrKYSQ9
	KJSnMwKKYgxV9zkBdDt2OkJvNKyl9nsIwB2Zn2PuzBnCmhcmYVENh6rNJYwi5ZgJzVeQ
	+w/A==
X-Gm-Message-State: AMke39mLS5QK5MbAZqQ+EYTJUIDGjFxz+GPoqHGwC7SSBhJSvy1zGic2kv3FCNewwFxq9Q==
X-Received: by 10.28.49.70 with SMTP id x67mr28551912wmx.69.1487718382482;
	Tue, 21 Feb 2017 15:06:22 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1201E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a120:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	d29sm19284499wmi.19.2017.02.21.15.06.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 15:06:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 00:05:38 +0100
Message-Id: <20170221230538.21902-4-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170221230538.21902-1-schnitzeltony@googlemail.com>
References: <20170221230538.21902-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] gtk-engines: add glib-2.0-native to DEPENDS an unblacklist
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
X-List-Received-Date: Tue, 21 Feb 2017 23:06:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 2a0022b..83aa749 100644
--- a/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SECTION = "x11/base"
-DEPENDS = "intltool-native gtk+ gettext-native"
+DEPENDS = "intltool-native gtk+ gettext-native glib-2.0-native"
 
 PR = "r3"
 
@@ -53,5 +53,3 @@ SRC_URI += "file://glib-2.32.patch \
             file://substitute-tests.patch"
 SRC_URI[archive.md5sum] = "5deb287bc6075dc21812130604c7dc4f"
 SRC_URI[archive.sha256sum] = "15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5"
-
-PNBLACKLIST[gtk-engines] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130602/"
-- 
2.9.3


