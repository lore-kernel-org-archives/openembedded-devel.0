Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id BDFD860D64
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 15:11:04 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id y11so4420483wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 07:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jz3KRMxcOTVMfUTjAMUX4vkYi9A9RpA32M9Qpt9hU+8=;
	b=E59EagLz+jJ4AE4vJSE3GdTojSU7uiIC7kRUwME+EfkddWfu/QKZ+m+uOPg3R+40/T
	PY2vO+s2ROYYk/6krlPlGLJIYCpczYiHSHJT8EqW+Zbhg6GhHSekcpWCGXTDWIo8+ylf
	ha9t0fdR0wmXOvW2TLiccBxp42A2fk323r3RmUClEZIn4m58YbmDdOj/ilzX27yqIw74
	EnzHWUzXSlCwuM59VNqikpw+/SG0DMfwfUeCPxJAgJOexVzwOGUbIovC3wZqNyw+px/t
	3noAf6lLhafmufAfBYAk+bAkyMAPiGakiUZgMyDNFMH5O9N+o4mNWqsrFv72DKD0smxt
	+RKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jz3KRMxcOTVMfUTjAMUX4vkYi9A9RpA32M9Qpt9hU+8=;
	b=eEb03riQRQIzehMNHqLep+wCdrIyG2vODa06zQegl8823/u9+UtO4VGngb9250bCOT
	FQ9Z4vDRqyi6JOATzZ4S6M39JQ12MQKti+oZj+Tw10w1kPk0j1v68wgWxExW6z0BSIf1
	E0MgS9HZFxoGOzBn18fzbZmXBwv2sSX4BY47X0wpV3B6Tn2goDakoTLNyLdtq4Yl9GO1
	6ziib1WbyEUHvYrc2C3cPRMEGc/1Notoc7EkAQhY9YXHHaAlF+robTaTY1RQI3X6lV67
	cfypKJy5VmkYmsUDfnEBBQ+CAnR+yWJDe313SboYgUJ2aP1l29KdktvZlqTgiEOCYPpg
	Eu1w==
X-Gm-Message-State: APjAAAU2tt2KKYEXIcaKddrTkRP0bqFRFnL4m5agTvI8OWESrhQ/kCY8
	FuQ7j2+AIHUBX041xLf2rIXrMhmZ
X-Google-Smtp-Source: APXvYqwimwwf/IES4maOl0d8d8C6rwWc5XFaHxtD3sOGGJyvKX98t+m8GzlrqaYELHgpER/hS58xwA==
X-Received: by 2002:adf:f847:: with SMTP id d7mr11298761wrq.35.1581261065126; 
	Sun, 09 Feb 2020 07:11:05 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F2C16629984A4CCEAA4B6A2.dip0.t-ipconnect.de.
	[2003:f0:7f2c:1662:9984:a4cc:eaa4:b6a2])
	by smtp.gmail.com with ESMTPSA id
	q10sm11429093wme.16.2020.02.09.07.11.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 07:11:04 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 16:10:50 +0100
Message-Id: <20200209151053.4277-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200209151053.4277-1-schnitzeltony@gmail.com>
References: <20200209151053.4277-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 3/6] libmypaint: initial add 1.4.0
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
X-List-Received-Date: Sun, 09 Feb 2020 15:11:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a dependency for upcoming gimp 2.10.14

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gimp/mypaint/libmypaint_git.bb    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb

diff --git a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
new file mode 100644
index 000000000..2ca80f3e6
--- /dev/null
+++ b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "libmypaint is a library for making brushstrokes"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9d13203ab4013e5a14dd62105f75d58b"
+
+DEPENDS = " \
+    glib-2.0-native \
+    intltool-native \
+    glib-2.0 \
+    babl \
+    json-c \
+"
+
+inherit autotools gobject-introspection gettext python3native
+
+SRC_URI = "git://github.com/mypaint/libmypaint.git;protocol=https;branch=libmypaint-v1"
+SRCREV = "477cb94b596035b54a255faaf95d13f6a8ee3619"
+PV = "1.4.0"
+S = "${WORKDIR}/git"
+
+do_configure_append() {
+    # autogen uses python2 so generate headers ourselves
+    cd ${S}
+    python3 generate.py mypaint-brush-settings-gen.h brushsettings-gen.h
+}
-- 
2.21.0


