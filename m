Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0387F34B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 11:03:12 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so83956159wrr.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Aug 2019 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1z9jxEzPfnU9SIHTknNA+Lwo6mjC2UJO8oGC4e24mVI=;
	b=Ds1uozLu/illwcOyF1Qq8zn6n36fQwpEJ3GqKyvEm0/4qsDq4TV7uE6AYX3j5OiUim
	r9LEY91F7PtVzpXRua7XcZsdEYQXpbI7HEuU1W4S6/DKk/yGazQJYJw8Kfzac0INGFPI
	del77JFQrufS+Ju2EnxyUnQHos3RfeZojL5PRhdlf8YR0t3gyWrO/8vOPCNA4m2y6Ae9
	kVbz0M0mzyOR0B83j3JihulQyD/vPB9RrIhWuF/5TuJbAMrSqXlSWvX8bhz5+EbAjbhE
	WIqAaFw+0VrvCyVWrQdQYYuJFRPPmFw7XXA6O96fG0v/gNn+sqb790yxS2jHooM/nklT
	RU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1z9jxEzPfnU9SIHTknNA+Lwo6mjC2UJO8oGC4e24mVI=;
	b=pNDhAVGVsXm5LG01ggvO2covZ5F75k0Hs3TSvda3GvtFz4D2k9JMbuw0asctscq/2v
	2UnaB5O+oOjkdC8kVNvnPt/HzVfeXYSHMn+T7h+/h2KelukIk8kVVQM1hxZp9JjFNUyU
	ZHowph70KBTM1FCvZBzE3pVf8fNWH46bsN6GCBIQWYr5LzA8vZ6wGUQnjGnAj9cDoemw
	jleXJC3wMpPWE4E2XwOQg5qreBOEONBW7xOpphwvcx7mlI8ol6hXheQ0YH7P/V4LgXUk
	22PhtzoWVRFQZqVXeeUbLAaLPO18Yc5QMKT2t2Irl+F+aOHtQgUSgv40oJ752mnheLpx
	n8mw==
X-Gm-Message-State: APjAAAWM+ve1QmzluH231q+cWa2th2+PcC971ztinNRzuu2RJ8Z7OjsE
	86CRZ6LLjRuppXgJci/zyCT60TPA
X-Google-Smtp-Source: APXvYqyxj5vEl2NQxRnNsdLQjpl6/CC8ihYRVlJy+sGziImzfnoocPGg619/v0LAq8o75A04haWmxg==
X-Received: by 2002:adf:de8b:: with SMTP id w11mr45544807wrl.134.1565002992430;
	Mon, 05 Aug 2019 04:03:12 -0700 (PDT)
Received: from localhost ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
	by smtp.gmail.com with ESMTPSA id
	t24sm77699031wmj.14.2019.08.05.04.03.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 04:03:11 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Aug 2019 12:03:08 +0100
Message-Id: <20190805110308.19949-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] python-pygobject: move python-setuptools from RDEPENDS to DEPENDS
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
X-List-Received-Date: Mon, 05 Aug 2019 11:03:12 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

python-setuptools is necessary to build pygobject but not to run it, as
also documented by the upstream packaging guide:

https://gitlab.gnome.org/GNOME/pygobject/blob/master/docs/packagingguide.rst

Move it to DEPENDS to shrink the runtime dependency chain, as setuptools
includes scripts to download other packages, which might not be desired on
a minimal image.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta-oe/recipes-devtools/python/python-pygobject_3.32.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.32.2.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.32.2.bb
index 4d26a78ae..9c175e682 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.32.2.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.32.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gobject-introspection distutils-base upstream-version-is-even
 
-DEPENDS += "python glib-2.0"
+DEPENDS += "python python-setuptools glib-2.0"
 
 SRCNAME = "pygobject"
 SRC_URI = " \
@@ -30,7 +30,6 @@ PACKAGECONFIG[python] = "-Dpython=python3, -Dpython=python2, , "
 PACKAGECONFIG[stagedir] = "-Dstagedir=${PYTHON_SITEPACKAGES_DIR}, -Dstagedir="", , "
 
 BBCLASSEXTEND = "native"
-RDEPENDS_${PN} = "python-setuptools"
 RDEPENDS_${PN}_class-native = ""
 
 do_install_append() {
-- 
2.20.1


