Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30406C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 05:00:49 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2427.1784523640221503498
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 22:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oo8UiQlu;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceb096e675so93953125ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 22:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784523639; x=1785128439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3VLiCU7In/rd7n4z9hspgurUqV5JXNIPMgVXoVA6fY=;
        b=oo8UiQluAyfSV7eci5t+bxC1bmRxxzb9hw26JDa10+xIWaoClbY61wh04iedUmVKTn
         KiQrLKy6zzhon41Si5gvT3jL0zTaHRRSXeYZLGgapXO1+CaNEiLWDzch33HwJOZgRohE
         odpMJ5862eSa/73i0cEiJw5Md4rMT3kDLoeAy6hqOo0izo/y1XX63GZfghNMyBu7MssM
         NF5fT8PQIyGzukDCvz5G08dzQ9c/G03Gcyirs227G/agsi07uUFhesBQF5AT7+7JYcUZ
         SttbX1nBGqiDkr9R03+A+Dd0BQXwLeehzVmrlZJjG7cw4KZczq7w0nCeZal38M7peBTL
         PEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784523639; x=1785128439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3VLiCU7In/rd7n4z9hspgurUqV5JXNIPMgVXoVA6fY=;
        b=GBoTcPoVxNhFcxqMzD/Ls2B6xcpM+zOK+QsoDYM4PxrmfCLEPikNcZIH1DDvdiQX6Z
         43LWP51Bol3CPZU+QZAXgVg4JpChtWQl/t2+GrmwZaqmb9rLr52cucsyfWYNiZ2MOMHr
         XbsJN7iEnNwU+0UP8FkO94jNrIMCbxJlA7qNXd/uUlccaFDnxbK7Q9RyA8oDPP2u1MsS
         v1FTTMZcfh00wYdZ1UKZTEmdEXlW935ZYqGrQu/7GzPLNvnh/iIE/zMsg6KnQhy0+yye
         GueGOxlkh5K82usM6jtTPjejr1P6BylkX2EeGfauqNp4OqQLx0WtZ/62mP8j2JSWlt0i
         LkRw==
X-Gm-Message-State: AOJu0YysKrCWp2pDv/E5V5+/UBwWmf3DpW6jByQsKelY2PoXNJtI9Xxt
	gMgWFyuM8eWANc8CkxW++m4Qxl6dhcYMvxaxjvktJZ6BQjA1sFbRzyWD9T5K4w==
X-Gm-Gg: AfdE7cnE3pxRqMgjvrqnpjooDU4OSLyY0Ccp/6zGsO2WsUSm06hrHtS/t/JK8U1QL9U
	cBNiW3qr1U+5LGMugF4zd/gUNZWoIrgYqwx9aSs8C+jLm1CBnkkLjvCT7JOTS3W5+B9SwXAzKOY
	gZ7We9DQLTcZDZFI/DZdueNjvU2uCaNZ+itLdYCHA07xplcNlioHOSG6o1cwvHeW2VIZSsCPZup
	afJXiHVcCGNuHCfUcDYnwwpElXgN02yoCuFewkdnoIyrhNiC5F54InLZ/NFEWRqh9uoZ349JV7v
	HsowIwTeKUCCjb77STxWbvIG9IF7h0tDCyaC6eELW69x/MK9m3jWsTK9ChL+Vuo+Qp8bHvIyCU9
	nxbKyVA2/f+uiifi5ExBG5498P/wlOYuAzLpSRpApAyeqqTdGBMgxt7fe6IYkDK90q5mN2/vXRK
	N+fvtWmmRrehcVqQlIplnxu8hRLmKKKjfkw5YghJgyDUkIW5+nTJnjykZhdE1jCklxMY5KmoNNi
	j8FLaIhcR+vpnf4l1y0LE4Um+G5O/2uRXSrpDp+vjxzOaq5EDpa08/BKmjL20XyTqiVZIxcvS7Q
	vVEVA2sxM2oG9MOn8Js=
X-Received: by 2002:a05:6a20:9397:b0:3bf:6c08:fb94 with SMTP id adf61e73a8af0-3c3ada37416mr13452721637.54.1784523639283;
        Sun, 19 Jul 2026 22:00:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm37486232eec.5.2026.07.19.22.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 22:00:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] wxwidgets: use non-deprecated SPDX license expression
Date: Sun, 19 Jul 2026 22:00:36 -0700
Message-ID: <20260720050036.196991-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 05:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128271

SPDX has deprecated the "wxWindows" license identifier in favour of an
expression combining the main license, the WITH operator and the
WxWindows-exception-3.1 identifier.

The wxWindows Library Licence is the GNU Library GPL v2 "or, at your
option, any later version" plus an exception, so the equivalent
expression is "LGPL-2.0-or-later WITH WxWindows-exception-3.1". Both
license texts already ship in common-licenses.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
index 2f96662244..f87744b48e 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://trac.wxwidgets.org/"
 # WXwindows licence is a modified version of LGPL explicitly allowing not
 # distributing the sources of an application using the library even in the
 # case of static linking.
-LICENSE = "wxWindows"
+LICENSE = "LGPL-2.0-or-later WITH WxWindows-exception-3.1"
 LIC_FILES_CHKSUM = "file://docs/licence.txt;md5=981f50a934828620b08f44d75db557c6"

 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt', 'cmake_qt5', 'cmake', d)}

