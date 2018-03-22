Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 65BCD6025E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 21:37:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i75so206421wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 14:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=79SVkEOAst3y5P2cxxI2C5EaXdgVZZV1y2dHCMeQyKw=;
	b=CoU9ksDLiR5hUn3MoJoxHFMHOSkRzU02b4RL5+vwB2tnJ4d8OK8+voyfaqooTXo3q4
	Mw59oPAEL+16OPS3NwoBjZSjC+p2rwZ8iFR1o1ZT1gMf7nAuZw1BnhRo/VcerKzvkwp1
	B5h5fFXW6pAe5XeI1SQUDz3do49xRP1NRtWWaS/8OaFIwQBmlJwmjcVXnyftFMpA8Xlp
	eXNGQcpEf8PIPrcneO3/mMszFXIvvMqXUkmlSU7IXvzLG1aW8vE99biKLjTI0CLBs4eL
	POCyJsTXqgFlCFMgdZ7bEtBVcteG4OEcvvpmEugXoxt17gX92On/1vpD4g1LGeju4K65
	huBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=79SVkEOAst3y5P2cxxI2C5EaXdgVZZV1y2dHCMeQyKw=;
	b=hhPdaRrzC8iz+MCtUJpoUv4TYciFNuh2MVI2OZWHgJLzw/jE06bxhf62YWQwmbtwUB
	jpiD8xeMtT+kkKsNLvmzOvgFzEZjzCYelijKKth3Q43VAzB+XXuXr66aEvbWyHNR2XGg
	SRD/sy5CvfDkFHTor+lmDLG85CZnDU28Hu4bwwe4NBDLPbvZuNSgsT6OK5OhoKGDzX8F
	/Sr318Z4I2BJMibgKlNIsR4MbAhvBFFDN8yZA5i04eHol02evwbsM12HOiJuf9LGgg7K
	Lz4b+x2aOdpCe5p5v4SrGfz1upBvnGMQxv/sFmR1HEGdtHhG/qlSBsgKE5NwRmg8Wpo6
	DaxA==
X-Gm-Message-State: AElRT7FH3wLczBsFPGtgp1zlSiahkbVNqJXvok0slTrpYo1zhjakrIgG
	giA/aZ6R0BU7wJ+/DwN/duKbwQ==
X-Google-Smtp-Source: AG47ELttwJ5Hhmwd4HEps3mcP3hjGc54KBxKRQWiN4HiGiQwNFJq1LzAZgcMiuzCC+qbfOQzUO13SA==
X-Received: by 10.28.232.89 with SMTP id f86mr7255421wmh.72.1521754677878;
	Thu, 22 Mar 2018 14:37:57 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC111611E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:1161:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id m7sm7558897wrb.86.2018.03.22.14.37.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Mar 2018 14:37:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2018 22:37:39 +0100
Message-Id: <20180322213741.29876-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180322213741.29876-1-schnitzeltony@gmail.com>
References: <20180322213741.29876-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] libgnome-keyring: update 2.32.0 -> 3.12.0
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
X-List-Received-Date: Thu, 22 Mar 2018 21:37:57 -0000
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
index e24188232..000000000
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
-DEPENDS = "dbus libgcrypt glib-2.0 intltool-native"
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


