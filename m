Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 324FB6B666
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 09:49:35 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id o10so5456772eaj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 01:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nCAjkwGah0vO/7kwwe8NSIKCFtdvLJ6Edy9a4S9JBrw=;
	b=yNtGnZQUWWYm6R6wG8HcEIlraT6KpDzT5dwRoH16A6aVp3voz1Me5Yy35yZzicN52w
	AcLRmGtTGBXu1SnZkldlEhDTy3BMAQ6pisaYhsXtXYCOaecU2CFzBe2VWrgKgqUPKwhY
	NRkjvfKDDWssWlcD0HEiEhIGLbYuE9t1+ipfODvjPJLEGnWWg+irL7yVVrFUOwsCR4NW
	AAhsS6t8NRgAV0SJRsI8PcMQvQ+SwGM7jSs3/iYefWBRk+O5jJCuHOpQrWJLIYOZf/Qd
	dbVoK0YptgXzcdBI1q5a/iJOLQwtotJBE8JiYTlqwk7Fhz46GWl8v4AV9JW84KAXp8SJ
	drzw==
X-Received: by 10.15.82.8 with SMTP id z8mr59290020eey.25.1388483375996;
	Tue, 31 Dec 2013 01:49:35 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z42sm116592155eeo.17.2013.12.31.01.49.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Dec 2013 01:49:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2013 10:49:20 +0100
Message-Id: <1388483363-28575-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][for-dora][PATCH 08/11] usb-modeswitch-data: Drop allarch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Dec 2013 09:49:35 -0000

* has runtime dependency on TUNE_PKGARCH usb-modeswitch
  Hash for dependent task usb-modeswitch_1.2.5.bb.do_packagedata changed from 5709ee415d286847b58e7b438b5b9f75 to fbef5eee3bb2bacb805a0bead2095b52

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
index fc0fbfb..8b71618 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
@@ -2,8 +2,6 @@ DESCRIPTION = "Data files for usbmodeswitch"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit allarch
-
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-${PV}.tar.bz2"
 SRC_URI[md5sum] = "91feff51deba6e48e78506b8f4db2274"
 SRC_URI[sha256sum] = "a3114e2c1f38eed3ad0067df30e53a96313908a9539a8ea5d94a4d35651699eb"
-- 
1.8.4.3


