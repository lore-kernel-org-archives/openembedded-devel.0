Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id C7B537FA42
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:38:54 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id j42so14060219wrj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4blzWhC+Fmp88G0DRUrmGFAMsrNfvzU+MIxWS3voJfY=;
	b=oMzRkaoJby8hKKI4bK2hRdqqb2ct3DObb13V6lBZ7kXCLVJC2+YUQuCZLNbYplytBT
	tls5vtqoNwfBDoV0CrpMXbow1c9XpI5WrlpyI6DsgP5SPTOFSmCsvKFV9eLH0rCp/NB3
	EPzatXqwF2YLr6bbA1uhiHk0WyW+a7IBQlLo76coUHLG9H+3I3ZYJDWP0L/E9y0hnj3m
	o9NXhgdxQg6WU8Sy4NjeQbwZKsPX8FmOy2LnI9WtDStFcfBb+QvMlUdIAUtc3VBPuDHH
	tUQiTmz+4hG3PMaf2tAAH3/I2UHgDfJ0rbjzipT6o3xvXfmynib+4BlKSl1y6YWl2tha
	xjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4blzWhC+Fmp88G0DRUrmGFAMsrNfvzU+MIxWS3voJfY=;
	b=kQmBR3XZy4F9I/UDmqDdAs1yU0qL0aAAVZGqPzJNhPI/R3u8DCQHXa2rKn5MSaz6IK
	tFVQvW/Py7Wm1UizS1YAWOjggOW0etIKtJAehVOZYZzIDnO9ufbg0MlGr1IbnyIR7pYf
	hrmkGNsvL4n04aazltUKIF+DX+Rpe24KXK9gSWs9h5QqQH6cC2jSoP9EUssQ2JBV4EWi
	r7U7W1diFl3u7aaPAYOeCgBLeYg6fcjL1AWVQO5/TpIlbTZEAZJMBoCPfR271Nl9a/Lb
	rVwQ36FwaysYHA78Oi3o4xBgTk7AQ+8FiJSYUkU2QsQ1XMi/pHDT1awouyQ4eJiD+MsA
	Yo2g==
X-Gm-Message-State: APjAAAV9eIzUmWThuf47biU47rNF7mpZKm2HKSxyupkqNkbKi8Y+KqAb
	32tDgYjnDQEF3aAWC+TkdTGcXAMz
X-Google-Smtp-Source: APXvYqw0uFyxQMh8ifFIFe3AOGW9VK3VyeGQWG4iWfUyCkEe3gkruJTHLujn9Hmp7F3YP+w+W3GD2g==
X-Received: by 2002:adf:fd91:: with SMTP id d17mr29088777wrr.340.1575851935403;
	Sun, 08 Dec 2019 16:38:55 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.38.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:38:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:15 +0100
Message-Id: <20191209003840.3383-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/29] libgnome-keyring: remove
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
X-List-Received-Date: Mon, 09 Dec 2019 00:38:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* with recent changes nothing requires it anymore
* development stopped in 2014

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-keyring/libgnome-keyring_3.12.0.bb  | 29 -------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb
deleted file mode 100644
index ba69e2e0c..000000000
--- a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Compatibility library for accessing secrets"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = " \
-    file://COPYING;md5=0914b9d3ebaba41ef2e3e0ae16f296cf \
-    file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
-"
-SECTION = "x11/gnome/libs"
-
-inherit gnomebase gtk-doc gobject-introspection
-
-DEPENDS = "dbus libgcrypt glib-2.0 glib-2.0-native intltool-native"
-
-SRC_URI[archive.md5sum] = "6696e4f2e9aed4625cdc3af30bd8c238"
-SRC_URI[archive.sha256sum] = "c4c178fbb05f72acc484d22ddb0568f7532c409b0a13e06513ff54b91e947783"
-
-
-# Fails to build with thumb-1 (qemuarm)
-#| {standard input}: Assembler messages:
-#| {standard input}:823: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#3'
-#| {standard input}:823: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#13'
-#| {standard input}:824: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#29'
-#| {standard input}:824: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#19'
-#| {standard input}:825: Error: lo register required -- `orr r10,r10,r10'
-ARM_INSTRUCTION_SET_armv5 = "arm"
-ARM_INSTRUCTION_SET_armv4 = "arm"
-
-- 
2.21.0


