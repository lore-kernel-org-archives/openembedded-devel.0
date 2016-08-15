Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8707C770E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:20:57 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q128so10341087wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uAImGB3jmN4bQpobTnd63HHWCcvfs/txYE4U8mXsDd0=;
	b=F60Xx6fJb2N6rozjY7sI855IfxEwwXi7X2aAjl1RmtRiZJVmlfAYIv4e5wl4rHGPTw
	U2PAdSq6pbyjalOsYtNDiGvtmgDVKwVslJwvT+psv5XiC1Sybd2vQBSf7Nf4XAAH9R95
	CfJLqYwHmkBOqUDcuBWsu3RUBPEWhOyUZtUMxFU2MxJC4+H0easjm+YcxPjOIY6z/ILU
	2Y6Pikwe4DkdKl0fkF2981ImQBanfO/zXnpSWQWE4wR1uVoS0uWD07v4/UWGgzVEYS1I
	aIPGoxK28JHxSr2maobQyurd3L78FOgSclv4mT/UJv2FIsrmP0P6gy9d14xr6hjwEzC2
	Rzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uAImGB3jmN4bQpobTnd63HHWCcvfs/txYE4U8mXsDd0=;
	b=YaXfrLKR2vywGWDzU0e5EuY/qopTyTOXE6GnYbE99qaJc5DkYAGAspABO+HmTy+mM9
	95kGui+4sR+iWDnkRi8fSDG+FarYlWQ+Nmza3wb+rVUvpeZm4bXpDr0kB0ZEvV9oxi2E
	xCEcc4B7Y1bX9EswrlSkulnU6eOokbcBUEOEAoKmJiRDl4AGMWRNlLWaHzp52IwVDYXI
	XFqe7F3GX3scOyQvH5PbPxCQWuxYZriPoVoIXxUQTtOVp4Ecas4YjP0T9bVsjzv+uyHB
	zkT61p8YqVLFjZ0mXvW+TqEgnnoqsNT0hPI91Ry+SfuambElyFfsVyUmXim0QtI6EE/V
	UB2A==
X-Gm-Message-State: AEkoouv0PaDxzVwGp2xjcekcQBqWn0eHecJ0hohuVMj3C2bO8CWUt2x3kyKoBefkMPxB9w==
X-Received: by 10.28.111.213 with SMTP id c82mr13577155wmi.47.1471256457776;
	Mon, 15 Aug 2016 03:20:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	qe2sm20770543wjc.28.2016.08.15.03.20.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 03:20:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 12:20:43 +0200
Message-Id: <20160815102049.3291-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160815102049.3291-1-Martin.Jansa@gmail.com>
References: <20160815102049.3291-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/11] gupnp-tools: add intltool-native dependency
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
X-List-Received-Date: Mon, 15 Aug 2016 10:20:58 -0000

* fixes:
  | ../gupnp-tools-0.8.10/configure: line 14369: syntax error near unexpected token `0.40.6'
  | ../gupnp-tools-0.8.10/configure: line 14369: `IT_PROG_INTLTOOL(0.40.6)'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb
index 821b5a3..eda70e8 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb
@@ -2,7 +2,7 @@ SUMMARY = "Tools for GUPnP"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/network-light/main.c;beginline=1;endline=21;md5=2c39b3a000495dabd4932f231c7efed8"
-DEPENDS = "gupnp gupnp-av gtk+3"
+DEPENDS = "gupnp gupnp-av gtk+3 intltool-native"
 RRECOMMENDS_${PN} = "adwaita-icon-theme"
 
 SRC_URI = "http://download.gnome.org/sources/${BPN}/0.8/${BPN}-${PV}.tar.xz"
-- 
2.9.2


