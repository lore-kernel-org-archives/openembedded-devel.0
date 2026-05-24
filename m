Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4A8CD5BB4
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 06:54:28 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4014.1779605659109150444
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 May 2026 23:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q/s50kRI;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-841882f8f4bso184808b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 23:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779605658; x=1780210458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8W7zB54iS2EMOPRSndhKCGS6HGVJj/UmZwANDKqbUjs=;
        b=Q/s50kRIWWb2GUUF4OSCXrvu2yKX5ZGCsNg6LP64nK6GF34j/qHUvDObcpMJvzwb+H
         WS4HGsQkO8vYaxlbatyENgijSIQTBca0POrwBg6rbvFNOjIdXVFISLQzDMOn7ebKbRQC
         dOK6xXKadpADfIr9V6IMkrHnIFFpW5YtCgAS1t0M8HlcPItOcSZGPYJc38sJsKW3iWmY
         tuWkhh3CpW700oZRhrMmmEeT0iAb2qeh9cUnFnkFXL0zpiH10klSxBvx9XnxwDZN499E
         ecTYfbGXAyglI/GS638aN8+EZ2q9mU9FwTpM40hu4YI8q55fKqsqv/QyYWtyz7df2OsY
         4euQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779605658; x=1780210458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8W7zB54iS2EMOPRSndhKCGS6HGVJj/UmZwANDKqbUjs=;
        b=ggZAKq7gX77BYx5iyC0C+EOZtWiDgsUPfoNcjBze2cQJBC/Gt3gV7fp4nWvQNUNlP7
         Fu7D5BhYLdwZ9PywIoO5O0yhxtD7CbDZnqn6ns4yYHwEvXTJupSeBdKn26j7oB9XXDYG
         QX04u9ZuEv9IT1xoVYmcxcPcZjLI9jzMAYNaAhReiXK9pzSXDVZl7VddwRjDyySZt4gh
         8khBXNeaugmoL+bWy6uCjPREwdVy6rO5kobLkAbUua2uU0k+zqKcVy4x1KhsT4S5T7g/
         YY9eCYmXqCCkA2CRJYDE121/vLl+Qw6JGYFgkqyxQI2bIBEnBtZxU/dS5YlbHoxGfRoA
         d2tw==
X-Gm-Message-State: AOJu0Yx0KxjlC+Z7JHAQquvckZOp3Yw+5r4gQtk5PsyVgFenqWNBK6Kc
	rBAxnWouV0fFjgUSHeqrUh/hbXPYW4kXq0ky0hIBwkZbdWILBsXd/BgyztcGtA==
X-Gm-Gg: Acq92OH+HwHoDnN82qpZziJR5tNU28RcTzbcsbR6quwES7wfiBYoCqZm7GDHZjJ6TG9
	pHlCekCQI7IvUYqJ79aiQ6jYiczAHZOYR40BxBlScyeHxHV3p5ro2gkq8r5QHB1jGrXst+gr6Jn
	96VE7dpPhKr51E+k/PrZTYzoc10giA+pzeczLShnjJsGctvN+j2YRUxQ+FzC2GPDsPxr1y0vRLz
	qaI++hHzndeUAUrK/r/T0WbBh4iPzjyc9kVythl4u+RLBFPLNM4gpv3/zGbOKsyPaCnwlWItsa0
	5eZDwS2dx7oJz+8NVuDpcfSvUXBpm4pi7NR0lWpDcX4M8ZJBsZSPcrYBDXrpFTCBvDe1aQHyWIF
	reAnL4zLwue1p/rbdmOTeXkMGC9XKqfIEvFboQzWcmQ0RJ9n+/YJrNYdrTzy6OBxp1WQGDTd/Il
	wJ
X-Received: by 2002:a05:6a00:a8c:b0:83a:b344:826a with SMTP id d2e1a72fcca58-8415f66dd1emr9030743b3a.26.1779605658437;
        Sat, 23 May 2026 23:54:18 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:94:3c8a:db68:70f9:93df:9353])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165010d60sm7053411b3a.61.2026.05.23.23.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 23:54:18 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH v4 3/4] android-tools: removes selinux dependency from android-tools_29.0.6.r14.bb
Date: Sun, 24 May 2026 12:23:39 +0530
Message-ID: <20260524065341.82660-4-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524065341.82660-1-emailaddress.ashish@gmail.com>
References: <20260524065341.82660-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 06:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127182

From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../android-tools/android-tools_29.0.6.r14.bb                | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
index 3d4e95b496..b3a3f78254 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
     file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
 "
-DEPENDS = "libbsd libpcre zlib libcap libusb squashfs-tools 7zip libselinux googletest"
+DEPENDS = "libbsd libpcre zlib libcap libusb squashfs-tools 7zip googletest"
 
 SRCREV_core = "abfd66fafcbb691d7860df059f1df1c9b1ef29da"
 
@@ -191,3 +191,6 @@ FILES:${PN}-fstools = "\
 FILES:${PN} += "${libdir}/android ${libdir}/android/*"
 
 BBCLASSEXTEND = "native"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+PACKAGECONFIG[selinux] = ",,libselinux"
-- 
2.43.0


