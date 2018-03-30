Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3E26774710
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:18 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id d1so8046765wrj.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qVFSJN+k5SZ7xptlRQuWHV8it7io5sqA3VYh2aqO1qw=;
	b=sXE0q4NlF4ywEQQRsmrZz5ZlMQyWHp3bwViIC1xuOapIx5gtjLsSGOHKwyP1Hh6XOM
	noim6eaQEq5A1KAMRmRikrzGCoCHq03alPCo5WcQz267wcnQkzBJxd/OX7HR+5E2NhSy
	qAAMt0y/we7Dp7QstAeny0a+01Z8kDu8lBAydjA8iWgfBRYUtipz7ysAvOAx2chsx2lO
	La7BseKKRiO2+gMV5kCudgKzHaTuEDuvazHPsZ4MwDw+2Etq8VVwYHj0VYPv4WWDPt1b
	VuGZ3RqbKTtxnuHvmWOxofTtL7SH3pTxV2IyOo9Eknrr80GUaBckJLgHoh1kIfqZSk0n
	sI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qVFSJN+k5SZ7xptlRQuWHV8it7io5sqA3VYh2aqO1qw=;
	b=jCm7QDGTJ5Wyo78cIlhJzWRqHvpsiBa8GLLF3GSvX4ur6OXP5F5YFIdLqBxpHROM8f
	V/tGO/azSJuFIS3QRSpV8BPCcuyr71zoN4KYEmdJuooDUqLL55uRwju9DPXs+7XFrWqC
	2Vdcv/tNUaggGxO7mzhGNsCmco/c4teIDum+G8KzNMoEMt3sJJJV+IKbAZNp/y8pWXTl
	DIGmIiIArCgsitSPUZVBqb7Q7SFz6CzeUxokVmbesOZkOpucO4X9c2bTT1p5ptn+zgLC
	stUkWUVy8I89ffjQsWOYhhsiW7qtXnYDhnC2FFGN6/0zXDLgBVBzWoq534dWvEq5jeIG
	6+hg==
X-Gm-Message-State: AElRT7E996RYhE+3yJ0PHCDQ+u4rWOyUgXB1NYXli9x1jWO8r18HjwuQ
	JmEN3Y26h1SbVxlNiulgXpdnPw==
X-Google-Smtp-Source: AIpwx4/sXJayDwEeR+0bR9RDF7paCXBsznmKEb7MD16gMnyPzWNVJ3N+A4HD5ll4H7Ab/jiYy0f8fA==
X-Received: by 10.223.200.138 with SMTP id k10mr10195390wrh.282.1522416739407; 
	Fri, 30 Mar 2018 06:32:19 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:26 +0200
Message-Id: <20180330133151.25882-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/39] libgnome-keyring: update 2.32.0 -> 3.12.0
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Licence files are now COPYING and COPYING.GPL. The source code files set in
  old version are referencing these.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-keyring/libgnome-keyring_2.32.0.bb         | 20 --------------------
 .../gnome-keyring/libgnome-keyring_3.12.0.bb         | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 20 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
deleted file mode 100644
index 7e9de5026..000000000
--- a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Compatibility library for accessing secrets"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0914b9d3ebaba41ef2e3e0ae16f296cf \
-                    file://library/gnome-keyring.h;endline=25;md5=68ea64f81c160d670c37da5f137be4fb \
-                    file://library/gnome-keyring.c;endline=26;md5=8d7a4fb674aaa012ea5a98e7c368b4a5 \
-                    file://egg/egg-dh.h;endline=22;md5=1626c16af2a8da1f88324cf3ced33f08"
-
-SECTION = "x11/gnome/libs"
-PR = "r3"
-
-inherit gnomebase gtk-doc
-
-DEPENDS = "dbus libgcrypt glib-2.0 glib-2.0-native intltool-native"
-
-SRC_URI[archive.md5sum] = "c42b2ca66204835d901d3dbfc1fa5ae6"
-SRC_URI[archive.sha256sum] = "56388c0d81ddfdb57d30e4963c83ecc1c18498aab99395420e0fff69929a0f0c"
-GNOME_COMPRESS_TYPE="bz2"
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb
new file mode 100644
index 000000000..82abe3349
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Compatibility library for accessing secrets"
+HOMEPAGE = "http://www.gnome.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "GPLv2 & LGPLv2"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=0914b9d3ebaba41ef2e3e0ae16f296cf \
+    file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
+"
+SECTION = "x11/gnome/libs"
+
+inherit gnomebase gtk-doc gobject-introspection
+
+DEPENDS = "dbus libgcrypt glib-2.0 glib-2.0-native intltool-native"
+
+SRC_URI[archive.md5sum] = "6696e4f2e9aed4625cdc3af30bd8c238"
+SRC_URI[archive.sha256sum] = "c4c178fbb05f72acc484d22ddb0568f7532c409b0a13e06513ff54b91e947783"
-- 
2.14.3


