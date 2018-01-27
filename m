Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id DD59478869
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:56 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id 136so1368972pgd.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zlnl0qYBdlb8b9wZK9QuZW4SWzJryViMsplo7gJ9xxo=;
	b=FSXqEyxsQogBCFcLfbWdlkhCv85SRC39w0+YtSDMckxINo/uvDNO71u3PCr6XK8qvp
	TbpR5iv27MZp0+LRvBu3AtylRp8RfIoEGbGgb0OoJcfmhs2jn5w1QmaeIa2yShb11Zs0
	HUnsSxYD9K7v57ImWobIIo6hfIRYLtPGUdt/4rcQYpUq3FkGdgrDjNuJwPcmD5gTvq+a
	zNnrCacwpmlWwwAmhZgkpgvuSUbt/xy4+VPyAc4iAsJgRwAOBrmj/6WQe/+TcHTB2w4n
	c+UzHpi+WYND6TxngQP1dnQdfVaxHeWOFAbFVlCg3BQgBk/1+YRC6vNCICk7c9VOTfVO
	H7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zlnl0qYBdlb8b9wZK9QuZW4SWzJryViMsplo7gJ9xxo=;
	b=ZEXskGalWZyIlgmO7drAV94+u7rlUw2mbeiUheNAno8/Qa7tPCVQhDHBcZZUs9C5tX
	s0gOPBJw2d4fiam6rMhkKQUHRHckBTnS+G3fIGaCwTnULK4Jpl3gCQeOdfyefPAn4MS3
	4JIpoJz+VcYZ/jPDE93qkGw6gey/8RgU0JNZ412MbxSNlT2td5Gz1tpu8vFLF57GVQUO
	+8oexzV7fWbdlCwzVDj0y/+xXihVBVUAZ2k3tl+nxeENIZ/uvZWHansIhUGigVzf00uX
	nI4KwRoK0Sli5kWZUG5rx+GH4f/nAf8cuKhC4oZ7E/ShT616sv7yWilz5ywfQsFv6nKw
	35kQ==
X-Gm-Message-State: AKwxytcgNdIMW5vZQK0C1d0PP9c/rOaXfnht33LbPovCgK95DyZX5MpL
	qRypsD24eBTFt7ncWzD7lhXV7Q==
X-Google-Smtp-Source: AH8x226iqGOUPjINoFSZOr9K3PGn06hv+7+ltQF+PdCJ0vDmoAtf7Sr5b/Qx2GZMYSNkObygbSgDkg==
X-Received: by 10.98.76.150 with SMTP id e22mr20676638pfj.28.1517023498058;
	Fri, 26 Jan 2018 19:24:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:18 -0800
Message-Id: <154290781cf4b8397f5457e29881894f2c43db52.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 18/36] Move RDEPENDS on libasound-module to bluez4 since it has been removed from bluez5
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:57 -0000

From: Tobias Olausson <tobias.olausson@pelagicore.com>

See also: https://patchwork.openembedded.org/patch/139422/

Signed-off-by: Tobias Olausson <tobias.olausson@pelagicore.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit cf993a2c9e10dea286979850c4c5ecd751735ce8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
index 317f972..f2a16dc 100644
--- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -15,13 +15,13 @@ inherit bluetooth
 
 RDEPENDS_bluez4 = " \
     obexftp \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'libasound-module-bluez', '', d)} \
 "
 
 RDEPENDS_bluez5 = " \
     bluez5-noinst-tools \
     bluez5-obex \
     bluez5-testtools  \
-    libasound-module-bluez \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', \
         'pulseaudio-module-bluetooth-discover \
          pulseaudio-module-bluetooth-policy \
-- 
2.7.4


