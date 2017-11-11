Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 25F2E785CC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:30:09 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p75so7327718wmg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 05:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=M4HP0M2uaam8vl6i9CU2FqupKvzf+uKef/b+GgdTaFU=;
	b=Np+7YiekaX09I4Opls/WXbcXPBmSIVmqZzSRBfqa0Pc2RbAaZMM75AXcAzb8IFXzG6
	2DaiK/RT6CGv7z/P+rlMOItPo8aWr/Ezu4/MOoUsQXWmO9fWw9TeeNTTQTaS2D0G1HTr
	PcJ3qLY4KEPN4tCUEz2UlMpw8mzBzoJQE+3JcnEF9vpGdQUONJCMoY7zxDLv207NNxIg
	XAPQ1yymvtEiTUBSkvSzSgCS9YwfrHiPd0NjmLs0XuMqcr1FG0dCxW9sYd9gPiyBZAlT
	GgQ8rCGlfGnw2jhaRNlVVA3mPsYgYr7ddmtGYB38nYwlrtRirRbLJoAgI3Z2KX5NSm4I
	U1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=M4HP0M2uaam8vl6i9CU2FqupKvzf+uKef/b+GgdTaFU=;
	b=RN8Wz9T69vwOPlQC0nODdGNapKbmiQEaOFie6aRIE9rpouqmh5TV4Shtfbs+qdv+zI
	oYg/uapzSJzuTEsqmze31MSsYdRatJvIywJsaSbRD9H0TR2o7sh2JTtVYnMixHDI5a5C
	31fAqSspZC8m/9pY2ro40qYR+WoigSFZrNtM69ooIpSvhou+lUhEOnO9/bmBeEI2S4wp
	jLfv9UL/u0UM2TYIkuZk03BmA/csSmN8cC5t0tuW5Ew9Jdh0nvqyolhbbh/8/G2LaJdD
	SQYMkfNLerNXt8AK5kQufDrMq8niiEeQYRepq5EI3KQraM3NG2SikGyI5mmXkcq3TDUH
	x3qA==
X-Gm-Message-State: AJaThX6Lom9TbH12044phYrRgZSc6ZuRW2Ex8cLfllOw14oISyy7xuHB
	ggFxmfUG9gZN+DUjOc403FF9Sg==
X-Google-Smtp-Source: AGs4zMbjT409I3VXjh/yAGfBJz+zYqiIOZNXRfeRMRUXZ6avuXbZ6DhDWlaA5KnovDfmBFn2MQ5xaA==
X-Received: by 10.28.66.215 with SMTP id k84mr2707236wmi.143.1510407010498;
	Sat, 11 Nov 2017 05:30:10 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030070ED074A591E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:70:ed07:4a59:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	195sm16189805wmj.3.2017.11.11.05.30.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Nov 2017 05:30:09 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Nov 2017 14:29:45 +0100
Message-Id: <20171111132950.12570-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171111132950.12570-1-schnitzeltony@gmail.com>
References: <20171111132950.12570-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 08/13] xfce4-appfinder: update 4.12.0 -> 4.13.0
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
X-List-Received-Date: Sat, 11 Nov 2017 13:30:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

It is a development version but this was tested and considered stable.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-appfinder_4.12.0.bb => xfce4-appfinder_4.13.0.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.12.0.bb => xfce4-appfinder_4.13.0.bb} (54%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.12.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.0.bb
similarity index 54%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.12.0.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.0.bb
index 175a827..7e73911 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.12.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.0.bb
@@ -2,13 +2,13 @@ DESCRIPTION="Xfce4 Application Finder"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS="glib-2.0 gtk+ libxfce4util libxfce4ui garcon dbus-glib xfconf"
+DEPENDS="glib-2.0 gtk+3 libxfce4util libxfce4ui garcon dbus-glib xfconf"
 
 inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "0b238b30686388c507c119b12664f1a1"
-SRC_URI[sha256sum] = "2ad4a58019a76a6b64a816050db25f96854917c2f2e89d6a9df6c18e6c84c567"
+SRC_URI[md5sum] = "6b6cf080c891f7945953f8084a901552"
+SRC_URI[sha256sum] = "c0eb3b29eba3cfa9175ed35174e83a21faa2a2423ddb79501fe8846cc430e3ae"
 
 FILES_${PN} += "${datadir}/appdata"
-- 
2.9.5


