Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D88DF60043
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 11:37:00 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x64so11426386wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 04:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VOikoNtCZgaakLF+JhRSneBNni7En3XE53V4ou9jo44=;
	b=OyZ7N1r1OzKQmPDT//lO1B5rxMRRLuKr85Q3yyDWGR6btKdyPpNhT1mcKNAPgZyoyh
	/bNeVFipbKyrerRnFjUQ04lrBkpAsoe54OF19i9jb0tRkUSn6mMA+nTHkMrvGA+DE6Wk
	2aY0D5At3mW46keae4SHGqC6HYDWsmCe+R3nBfCXjheyWbrqyk53wjdiZiAvKlYrN0Gu
	u0WwckeJJYHR8ipy5zqmfMt/pZd2mLqbASmdOGPegVesSOA8y+YT2kz+5SnMuvv5RZjq
	/vCjYDOZ+s5x7bqkayrJI3gbkg9/XkLz/Cn9ib9c599s4au4aVOJX7jLCPR4pa5rry+p
	+m5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VOikoNtCZgaakLF+JhRSneBNni7En3XE53V4ou9jo44=;
	b=IWbxyX956d6asNFHSWNFAKVe4KpqMFyECNrmNkwwylTEgGbxeAxCjSfNb2qjboZfV+
	Tf0wefmx1BnDdycoE+NrYxOW189FsDrzjQ6MqJFqVuOcqSLsDAkcpkP0502He3LxZHKS
	q8FPu/D5oCoEkwzcjwR+nEpSHTaqsEXuCNlM1dCvUohwxvmhYRwKu+mVVsK8huiuwwxY
	H5BagB2apXpdUln+pHq0uqmJd/O3OQJWcOYfK5ex4YX6gQwV21cbpIr8h0qN5MUD+mdp
	8xurLI9yi0TuAbWrKGj/9hb50baUp0gDtar+kTmmQeUjzefA3zBAqZchQ+vbgffyKZGi
	+qqQ==
X-Gm-Message-State: AHYfb5jP1ebXK4nnhLVNCW5dKrdPkgHIW71LmmubCtG6zpqA5fx6LKOW
	NeB78+n0MShDV9Vs
X-Received: by 10.28.126.200 with SMTP id z191mr2182119wmc.46.1502624221078;
	Sun, 13 Aug 2017 04:37:01 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p20030046E902666856A7C2EFFD165696.dip0.t-ipconnect.de.
	[2003:46:e902:6668:56a7:c2ef:fd16:5696])
	by smtp.googlemail.com with ESMTPSA id
	d26sm5812501wra.92.2017.08.13.04.37.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Aug 2017 04:37:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Aug 2017 13:36:49 +0200
Message-Id: <20170813113651.2987-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
MIME-Version: 1.0
Subject: [PATCH 1/3] upower: update 0.99.4 -> 0.99.5
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
X-List-Received-Date: Sun, 13 Aug 2017 11:37:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/upower/{upower_0.99.4.bb => upower_0.99.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/upower/{upower_0.99.4.bb => upower_0.99.5.bb} (90%)

diff --git a/meta-oe/recipes-support/upower/upower_0.99.4.bb b/meta-oe/recipes-support/upower/upower_0.99.5.bb
similarity index 90%
rename from meta-oe/recipes-support/upower/upower_0.99.4.bb
rename to meta-oe/recipes-support/upower/upower_0.99.5.bb
index 3651e18..9314534 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.4.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.5.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 DEPENDS = "intltool-native libusb1 libgudev glib-2.0 dbus-glib polkit"
 
 SRC_URI = "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "78800e1ac7f92b24aabdf433e38f75d2"
-SRC_URI[sha256sum] = "9ca325a6ccef505529b268ebbbd9becd0ce65a65f6ac7ee31e2e5b17648037b0"
+SRC_URI[md5sum] = "ec57b4b7bf0af568f9a7a5603c921d97"
+SRC_URI[sha256sum] = "78605664d027c788f6ab63c50950be6e86c6ba5d030c4cf35a6664337d87f3b2"
 
 inherit autotools pkgconfig gettext gobject-introspection systemd
 
-- 
2.9.4


