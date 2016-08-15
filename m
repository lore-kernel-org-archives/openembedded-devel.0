Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A2EBB7718B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:21:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so10344336wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3/xHEORJTH9526KYsM0+U4Y3vHEmOx/nJO34Ytjzkgs=;
	b=e1PJQPgUwc22KuS8zzUVi3YZ98N/CngHJhoWhYUjFEFMfJLMqFerA9MNGiQFOxGCiX
	E2ebz5kxEpA/ec+FsN7aDa911lBKe+2tYcT5aGF8SOysBEQoI66zB+tuZLOwyShfokuM
	vuxafErQ+Qx9x0VST3x93AqOrf42cTPsL/CW/cLrqoU9Hjx0QuTju3W/RDzbuaZGEobI
	lNVXTB/8oenIIOF+VN4MsYrSQak5D8C89EV/FaVYfNrFgcs7uAW9BUju8rzcn0sMf7uf
	2AO4pZLTvmZluCYzGakykHm5yXxO53EXflPb6yV7LI0amxv/H7pNOqFPcBMJc2QPlouG
	88kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3/xHEORJTH9526KYsM0+U4Y3vHEmOx/nJO34Ytjzkgs=;
	b=D70mSeE0tLxm7cGmgY0kDc+l1j3VHkL4BB7T8pIsOoHGZvz6EApOh69xmd7yXq4tpm
	+JbMi8/viPDvUKqE36kvfMhMmMcOtvqSxHboQ6PrLLCfK58o7JiYx2+weccJHNVwyKDW
	d8JgKsNn5rqsPXlY6dGujDRlQ03H56MJl53S1yrkgcY3o+mhqri5RBJVPyGM4F3xkFFI
	uVC/+eBOpj8HJeT73ksCnugabQNoZ+hmI5HpShTXyetZWnTn1+UhuHStWrOh2zW/Dype
	NtFWLdXL9muabbjc+AioUmdQLMDERUvbGdBQ4fJ/T5mnaQjp0zzv35Lh2URubOMgqc0e
	BF1g==
X-Gm-Message-State: AEkoouv8q4BGtFi8ge//16PV4mo52IOEfuh7SXDtzD5EfPjMyG4+164f4qdTGT3iTp5q7A==
X-Received: by 10.28.153.70 with SMTP id b67mr14786959wme.84.1471256460972;
	Mon, 15 Aug 2016 03:21:00 -0700 (PDT)
Received: from localhost ([89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	x203sm15801211wmg.0.2016.08.15.03.20.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 03:21:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 12:20:45 +0200
Message-Id: <20160815102049.3291-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160815102049.3291-1-Martin.Jansa@gmail.com>
References: <20160815102049.3291-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/11] gnome-bluetooth: add intltool-native dependency
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
X-List-Received-Date: Mon, 15 Aug 2016 10:21:01 -0000

* fixes:
  | ../gnome-bluetooth-3.18.2/configure: line 12094: syntax error near unexpected token `0.40.0'
  | ../gnome-bluetooth-3.18.2/configure: line 12094: `IT_PROG_INTLTOOL(0.40.0)'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
index 7b064c3..fe3e572 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
@@ -6,8 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 SECTION = "x11/gnome"
 
-DEPENDS = "udev gtk+3 libnotify libcanberra"
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
+DEPENDS = "udev gtk+3 libnotify libcanberra intltool-native \
+    ${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)} \
+"
 
 inherit gnomebase gtk-icon-cache gobject-introspection
 
-- 
2.9.2


