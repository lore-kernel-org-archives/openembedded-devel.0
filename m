Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3815EE9A03E
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 08:55:30 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8126.1771404927189164251
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 00:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EbSjAgZt;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65a36c8bcabso2709796a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 00:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771404925; x=1772009725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HNzms1xVUgdbNUnaO/9IvUiesT39VhEVr1PowSCrGCc=;
        b=EbSjAgZtW75FP8Q/i3lMGzQnXvRJ7X8J867fd7SIKbZvym/im1JDl5ZyA+7LRYwCYn
         /wl4+VqpzsG2rQX4KXeqawma46dbKiWGtZ5stnzBktHcn6fZhN/QIvLuQ+OJ3z88Sh4Y
         At1R0Q9Mv+a4BdV/2c15RYnBNp3aXGyXq2vMi0x2BMvi1m9FkSmnvfb7bYaW/xJJmzdf
         aABKuS/GuWQybCVawFIVSF2XqS23ksStibeEPk55hj67EitlEK8O8TxYSSz4PWtYHp5a
         Fivo4EsAuMSjDnF0Vdo0xoPNSPoeRK9JqythoKIWbhoafmkDc0EUepH5LfRNfnwcx+f2
         eiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404925; x=1772009725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNzms1xVUgdbNUnaO/9IvUiesT39VhEVr1PowSCrGCc=;
        b=jaARxmOj35C9DDNxXb2QWg8gSuMlgauQ9hYTHnS2vDxSrnjKcmToh9m3HaKd3jEQab
         iWsAcGMfpXr7w/YAiIciVZ6wEpgy6mLJMhD49IGeh30OS+89BC31COQWDuHNHLY5atuo
         amJy2KAquIU32UMvFFpCgUmcYspOsYDKZe/1XbcSeoFQ7zUYrrriDLMLau9Yf1hhLDfY
         dePQVs9kntFi+aqG9d0jZFFIZHGgl4G5tbpJ9R+OwO39ALkoo5+JF+8wmhaN4Y0ickav
         z7O0NLf8VvAPLi7hT/pAnjDKrvHoB0KUCBNKQGtMWfY3NPAiqDFyRLz0Edpw0PXJrQ8o
         /uTQ==
X-Gm-Message-State: AOJu0YzHtxVrCfbCJE1iIyOQdC3/t2Qf39LU1RvBC3vSxU6y8aq+tVEt
	Fytqm+X9BRLQSQxm9YHwB6bsTB7dgtWYvaiMkjj2oAEggBxMs/lM83akfoqMuw==
X-Gm-Gg: AZuq6aK469cBv37+Lmq0sVVfYKEKz6TkJ6zY+zNHKDZnZGTVVlRGAYGURNyvahkqtPO
	U9ar+EgrXNhwmS068MC3KkZLxf51wN60BmqIwS7yOZduLf6+WZSSbJkKwF8w0SrJi9ajAoVZgTW
	saSHZAOlAUjgx/ZW5xgu8OLKDSWD46tWKhswYnOVXZ60aKTqBXPX1U1QvXiQOWuwDwiyT4FPA2u
	oalDiY6l3s2f9EkfuXz2E3VXLzYW10OQUk039atOnATzdZzlprfT5f22Tbm9eSSCKyzKyKspQ46
	MpUCMfWoyxYGo3SBBJ08aw4whUrYQONEJC1oc9hyuz8CUAeN+BzZkhxmNQwT4qjZ+5ls+ME0FSi
	LA5qO0yNnR75j92iBaCmOG+Ivm9ZQqLj5mn2vdaLqaaznZ2GP89WkKU+8n4rEWujzSW3qaVc8wN
	ln11L6etIZMy+W5WFFhu5XyfL8mKKBpwhDaor8oIcft/wEblJr4L3TkJBFiruyOZHD032BgSsF8
	Q==
X-Received: by 2002:a17:907:1ca9:b0:b8f:e9fa:ddf7 with SMTP id a640c23a62f3a-b8fe9faf0a2mr645668866b.40.1771404925177;
        Wed, 18 Feb 2026 00:55:25 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.67.bredband.3.dk. [77.241.136.67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76278b8sm436826066b.33.2026.02.18.00.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:55:24 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe][PATCH] dbus-cxx: update 2.6.0 -> 2.6.1
Date: Wed, 18 Feb 2026 09:55:18 +0100
Message-ID: <20260218085518.213124-1-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 08:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124470

Changelog from upstream:

Some minor fixes for code generation. Qt6 is now properly detected.

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 .../dbus-cxx/{dbus-cxx_2.6.0.bb => dbus-cxx_2.6.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus-cxx/{dbus-cxx_2.6.0.bb => dbus-cxx_2.6.1.bb} (96%)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.1.bb
similarity index 96%
rename from meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
rename to meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.1.bb
index cfa476cd1c..bedd379e89 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.1.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-3.0-or-later | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24594f493407a4cd401ce9794e0b9308"
 
 SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https;tag=${PV}"
-SRCREV = "b705ad73bef724de0ed33f60462c70b380b6b300"
+SRCREV = "521a3d88bb731b94cc9998a0f711a5ca9e831e04"
 
 DEPENDS = "libsigc++-3"
 
-- 
2.52.0


