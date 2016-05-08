Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED38D607A5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 May 2016 23:50:48 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id yl2so14666781pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2016 16:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=WVFdjAKwn5+PM2C7oXpXuKicyQXtj0+nfiWnG9i5JfQ=;
	b=YizZGEPCMWUOphNLG0mNb+WWB4BNmyxVa++HMyqd2ZR+Y1q3bunN1F/jU9Ak/kbmAO
	PCnk9BK6E8++1Vtala1MRyl07vMVCvH+UitAsG8UHex7CX/H39mxK5agAUd1EmOArdu6
	sCzAQ2j8oBy3cB+V+JT7tA+vC0/kJ1e82RYn9IM9+yfcOGgHDd+3tRwkbJxG2rVCXZ7I
	7WlZWrWVBf2HB7TJILcAKCRKVCAL7dDFOgeO2deok4d5wo4Q+hUVF9CTorZgYpgdkvTf
	Dy6m5J3jcHJ/TGXSpwBAocHriIbenSW1iGb2XSLrlqmc6si3SjIND6TYX5SVLgqmuxV/
	XKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WVFdjAKwn5+PM2C7oXpXuKicyQXtj0+nfiWnG9i5JfQ=;
	b=Rp5XjLWVloPaFx1ucXzodOzkkNdvdFrN0oXrFy28g9WA4JvCcFLaT/eWJhxj8OAfmc
	/92oQQlnQG2ne1/sQ3qs3FuO757u9QOrHI5WsE3DXVaToN/7E70voCyctm9KMsbbIn20
	nrzJ3yoeNJv0dK/Gm0nMD1MMPs7PfGua30MQp/0KIqfZhJBKwH64UPmpwrc0X0i4J1v+
	yyLyFu+OMg3QDKmOY44cQa2Ue6cOweQ8krtMZEDxVjE4Wvtwcto1M+nyXlWOrSqdC/jq
	yK0LqWrzBEdYbCJ7Ci8chgcQIGnh3G8YEW8r5JPpkaASaJJ3Dikz0iB32xaIjY06YU4q
	n5VA==
X-Gm-Message-State: AOPr4FUvAu1tWY+3JsJJ2uaIGzQzMehklqgZLYLJsXzPuZCHMMkWeTnFriyrJ2IiuxJPJQ==
X-Received: by 10.66.146.196 with SMTP id te4mr46003584pab.125.1462751449652; 
	Sun, 08 May 2016 16:50:49 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	133sm35702378pfw.35.2016.05.08.16.50.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 May 2016 16:50:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  8 May 2016 16:50:47 -0700
Message-Id: <1462751447-11852-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][master][krogoth][PATCH] upower: fix WARNING
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
X-List-Received-Date: Sun, 08 May 2016 23:50:51 -0000

WARNING: upower-0.9.14-r2 do_configure: Missing DEPENDS on intltool-native

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/upower/upower_0.9.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/upower/upower_0.9.14.bb b/meta-oe/recipes-support/upower/upower_0.9.14.bb
index dddaa9b..d2c5943 100644
--- a/meta-oe/recipes-support/upower/upower_0.9.14.bb
+++ b/meta-oe/recipes-support/upower/upower_0.9.14.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 
 PR = "r2"
 
-DEPENDS = "libusb1 libgudev glib-2.0 dbus-glib polkit"
+DEPENDS = "intltool-native libusb1 libgudev glib-2.0 dbus-glib polkit"
 
 SRC_URI = "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "18803f82102d56aac90949d1e4251645"
-- 
2.3.5


