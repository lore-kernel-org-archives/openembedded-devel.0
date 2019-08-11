Return-Path: <laszlth@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 003D37E468
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 17:51:37 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id p74so10180317wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 10:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M6RDLnAccYyGcU3P4ffExWlHmZ4f33IwCkmp+H0sfXk=;
	b=TrtnUS4nvT21gu1RLUnkIJIcAw7Bc3/xQhY+7nyU3MgEONpX9W3JWH1FiQgO7QFl6R
	Hh6+5HR+ItS3D7T3s5eTxwTtwIUIahTcOhlnZTZ4aqbA0JOd/EPWfXWvAYNl36OlBfmU
	DiHKdiVCHgjUsjIW+KTxoc+bB2OaZy+4gdgY/bcVQXFB7xyczQ8Eqs/jPKql82M4PjJd
	XE94qlKDwZXuVJ88SGABtDwGnd/7FNMt+b6vVsl4YQUNQCg36eX5HeCWLy1fS7a1ROy/
	qHGld7YaEeM+jzWxaFdI17czvNHhNQLA7HnPT3sOY5dER+jSUAZz74Zil6d/jARRHaau
	IPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M6RDLnAccYyGcU3P4ffExWlHmZ4f33IwCkmp+H0sfXk=;
	b=pA1/YPmW3vkKXif++kvz2STY9nBbop/yXen71kdB5iORE+DoNskB3iqUWP8YWLGmXW
	yMdskcQCYpvtRwSX/hhbHuWI7RiIcc0hkeo2hziT9YsE39YZloEnuHHss1RBULc8wbit
	KwE56DTBDHbWkxlBYgmuhMZirzGUS34h2lG1YyBMqSRlUiH02MvoN8eFY5H7ZN5KiIu9
	WUizCibxXKd/ccFBF2fwOjqypSeFgrmgIlPDg/7MVdy5eyahm3FI7vc1vnEURRSWgYoH
	9kGrc1pcEkdHRXoYnquku3uqiuX5soniDqZLleit5JdumEqEdSgSKRAitVFxgjUET+5a
	e8uQ==
X-Gm-Message-State: APjAAAWD/IcqWReIM1iJEIdYn7FTWBdlgvukHOdHvs9MWLV2CRUZwjFb
	SVaMdtSjmor32s+AwIkurlfJRyy5
X-Google-Smtp-Source: APXvYqwqL6tq+cPPHKZdpheiHoTMhLYp7khZzSc4d/OS9VhAUmOcETGTW7Verzc7QnAf7AmZ3S2W8A==
X-Received: by 2002:a1c:107:: with SMTP id 7mr23390192wmb.84.1565545898618;
	Sun, 11 Aug 2019 10:51:38 -0700 (PDT)
Received: from latitude-5590.localdomain (catv-176-63-45-62.catv.broadband.hu.
	[176.63.45.62]) by smtp.gmail.com with ESMTPSA id
	s64sm18384891wmf.16.2019.08.11.10.51.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 11 Aug 2019 10:51:38 -0700 (PDT)
From: Laszlo Toth <laszlth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Aug 2019 19:54:23 +0200
Message-Id: <20190811175423.19351-1-laszlth@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] networkmanager: fix typo in nonarch_base_libdir
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
X-List-Received-Date: Sun, 11 Aug 2019 17:51:38 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Laszlo Toth <laszlth@gmail.com>
---
 .../networkmanager/networkmanager_1.18.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
index 037566783..58968dfb0 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
@@ -111,7 +111,7 @@ FILES_${PN} += " \
     ${nonarch_libdir}/NetworkManager/conf.d \
     ${datadir}/polkit-1 \
     ${datadir}/dbus-1 \
-    ${noarch_base_libdir}/udev/* \
+    ${nonarch_base_libdir}/udev/* \
     ${systemd_unitdir}/system \
     ${libdir}/pppd \
 "
-- 
2.22.0


