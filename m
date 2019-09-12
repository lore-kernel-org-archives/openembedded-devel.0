Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id E90C27E584
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:47:04 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id y5so14376635lji.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=QVfJNBFFy+cySuL9/NF99Ny1CxVe5jDaNBw8bBmWYig=;
	b=F9PEsIn7824MYpJUxUM583o/NSTalIZNnMWInbNpFZGyLuNC1wgke+EBmhRUPHDNXn
	/qLmPX7dvty1RdYEVmH7Mw9mlYBJCXLCPJ631Xvn/usyTRolBUhQKPB3uC4oMk2T0Ypp
	T/QlHvtGzmC+3vMB0uji3whVudp7m8peXxjRpdKHd3FNvfjz9Dg/kr3V2d3r/dTRuCDa
	Ai8P05blZEshXs3ue5fURLx1J+1QaL7V16Ru0LndSE2d/fP/gMphN3X8nIGzAzMi6t8h
	BK3zibD00/c9suLbyC2lryOMD91zOTR720JEqwslFmXSqKvgeJCww7AfVsKGx4n1e5TB
	ciMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QVfJNBFFy+cySuL9/NF99Ny1CxVe5jDaNBw8bBmWYig=;
	b=IufqtWoHQB9OZDT/+X6OZTj7TZYTUOgOTgGSzmfBjG7EY9lozK6XafgdoZg9Sk888o
	kEmubSaQUTWx3EP38ofOuETafVj5nJp2bYAuscy/+rb21qvzXeGfr4kLgCmkknIY0o0C
	j/uRMBMdj54eEvnFkQ9+TiRkoEcIkeM/+btBgkAM7sur53fqCYQ3dIzfZst1FGkrNtXh
	pGbt35KKEfJu4gYYFgoK6Dcnv9q0iz5HXTRCaWGWbbGrPu2iQV0EAtSQzjuAZTGm3Kwa
	PGkZZcH1UHOTwCvFVXFpl7SxjlkoXnmbG/KGjyYZXVJQD9bF8n+5e5lHrFBK7ExZTEB7
	7wdg==
X-Gm-Message-State: APjAAAVfChrKMj3pe6+V36lPH/rJdKmgWFOX0deRCeHB/GD878dhotLe
	9VRCd13O+2r9P90Q/sDNot+9AwgWAok=
X-Google-Smtp-Source: APXvYqzdsbEgKMgDzZgns6kHehbdtHNwYFeuGmh8QU9LFlYEABwdKhpU0yO3L66oWFujZ1Z2AgsWQg==
X-Received: by 2002:a2e:9881:: with SMTP id b1mr10447426ljj.134.1568328425124; 
	Thu, 12 Sep 2019 15:47:05 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id l9sm5959554ljg.79.2019.09.12.15.47.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 15:47:04 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 00:47:02 +0200
Message-Id: <20190912224702.4418-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] xclock: update to 1.0.9
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
X-List-Received-Date: Thu, 12 Sep 2019 22:47:05 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-app/{xclock_1.0.5.bb => xclock_1.0.9.bb}            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xclock_1.0.5.bb => xclock_1.0.9.bb} (63%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xclock_1.0.9.bb
similarity index 63%
rename from meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb
rename to meta-oe/recipes-graphics/xorg-app/xclock_1.0.9.bb
index cf970d5d6..31c553eee 100644
--- a/meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xclock_1.0.9.bb
@@ -6,6 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=857759ade8f2ddde5c7b32ef7356ea36"
 
 DEPENDS += " libxaw libxrender libxft libxkbfile libxt"
 
-SRC_URI[md5sum] = "eaf124bbc9d13e1a12a29faaa2ed3612"
-SRC_URI[sha256sum] = "53a9169e24f3814fbfcfee3ca0b98637840a3156ed7c7e36ae03940fabae4c9a"
-
+SRC_URI[md5sum] = "437522a96f424f68fc64ed34ece9b211"
+SRC_URI[sha256sum] = "cf461fb2c6f2ac42c54d8429ee2010fdb9a1442a370adfbfe8a7bfaf33c123bb"
-- 
2.17.1


