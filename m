Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id B34CE7F95C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:27 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q10so5800258wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4blzWhC+Fmp88G0DRUrmGFAMsrNfvzU+MIxWS3voJfY=;
	b=DQ8R/FMcjSMSgYKwZ4U3CgHiJJxA32ZfNuV2wC9xPxAYNXpMuZdn5tMq+kH4HyXVsn
	YQed8qnIqYL5Ehh6gmZoMJ7rmBQzqS8IzLLjCkt1F6RRIT0Gh8hpLSd2pWmSClKxsGVA
	9WB6DJbZhcZJfJcZd9VloJaC3kFOXR7qBmx+VCcIaZhobjQt8OE0lQvM3ORH0VDWZRET
	HDG8bg7D53Y/k+LscnUdG/gtGOy8CYyo9DHTf1LR76HuRAeHNH/xUq2PwhrGT5CRw1lG
	iyWlQ8cTxukwyyZiyfwJZXP4cKXJY51Kzsby9c1+bA7szJV9gbfGUNa4Z/AvaarEElyA
	QCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4blzWhC+Fmp88G0DRUrmGFAMsrNfvzU+MIxWS3voJfY=;
	b=C6SkXdMysb49pg79IhSa9JVcOIZqj8fXuSB5Dj70uSwCHEY0v8mKCtgMG4tWWMIa4M
	MC+yTxwk9OxRMlh3QyVS8H4AjpAM2jY1vbXmJS5fCci+2IK3ylFn7w2YpgkT6Mjozv1p
	v6s6e+XzO5DsAz0THGtGWKUTOpss8hxGB4gjXr4fU8w7jffuOuIi/fbhQ1F+2WDeSl9P
	TARanW39sEhs8wKvHf+6MIrSkEOShdCmHIPM3f7P2Z100WuBfoDCo79R9wYFgM58yxT0
	D5HZQQOy7UCM+5toCJXDtNUVbOCnxu7NxgeJ4sNqHhCiQUMyznszoCQmS2lffOxuPv3x
	FxNw==
X-Gm-Message-State: APjAAAVDpk6wjDgLEsjyxwF4VgDmrBTuO6CyltwrprhpEExdfdVTTIUx
	E1tIcKqY6RXwk7M7rbL+gTJpgdV/
X-Google-Smtp-Source: APXvYqz8KSVLsPgFvs8iYJ22HtTMVX/kFL6bs8CbUss7z/tqftH6lI79JwjPXjkZEk1mEobmstC8xQ==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr12241261wrt.70.1575590968169; 
	Thu, 05 Dec 2019 16:09:28 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:08:55 +0100
Message-Id: <20191206000912.19841-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/21] libgnome-keyring: remove
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:28 -0000
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


