Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 589D572658
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:53 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id bj1so14766501pad.37
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=yWuOQDl9jj/y4ckLw8nMmbzoEY+0ILQ8UCQiLEwIsc8=;
	b=uJWJbYwvJcWo0NtcqfFiN367JqfxmVLi3W3zFnKtwptbppPeezGXY4aAxeZdTxabn/
	g285HmYxfdTohVppsC4DdrrXUO9GbSFT7zM1AqUIy8Et2jZ04WoKQ3pQ6DcizWKkGubT
	+FIKfwU9S5r/DyKhDZyMNTD4K8ZR3O4z94QOsWVZBipxImUqdiAj+MqI9vcPFuiT9hva
	UtH7Nm9Qykq/thUmAHCtATT+04zj2yXBEC3pFhP/PiQBN7S+9VMp+RpFgy28rXxkQz4a
	xeEcvSwN62PeCAQFGlA851wzPYR/0WZb45zhfi1T/oNnabqYGiaAYRmmre/0NNsWAsW1
	RXaw==
X-Received: by 10.70.133.35 with SMTP id oz3mr72560879pdb.69.1419700973882;
	Sat, 27 Dec 2014 09:22:53 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:08 -0800
Message-Id: <551b484a7dd8621f45b3cef7acccf1cf64781ac9.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 21/27] obex-data-server: conflict with bluez5
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:53 -0000

From: Peter Bigot <pab@pabigot.com>

Although this package builds with bluez5, it was removed from Fedora 20
[1] and is not used in bluez5-based GNOME [2], suggesting the bluez5
obexd is to be used instead.

[1] http://pkgs.fedoraproject.org/cgit/obex-data-server.git/log/?h=f20
[2] http://www.hadess.net/2013/11/bluetooth-file-sharing-obexpush-in.html

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
index 4a2b2b1..afe6106 100644
--- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
@@ -3,6 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ bluez4 dbus-glib imagemagick openobex"
+RCONFLICTS_${PN} = "bluez5"
 
 SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz"
 SRC_URI[md5sum] = "961ca5db6fe9c97024e133cc6203cc4d"
-- 
1.9.1


