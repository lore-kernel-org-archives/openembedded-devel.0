Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1886271A0B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2016 03:04:26 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e9so9562740pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 19:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kr+Fuq1CxWDFdlyuLNV1LpcJAD/2+BmSZ8saKYvkXUo=;
	b=sL3cwI82jRdygvCXji/03DMn0az1aXz6GAfR7J2VismZvQxOiMxxlvL3LWbkKaTHnm
	w2KifA9Uv275Zda2VzQhkAFZH0qCuewOde/tTasU2JKQlWaEfGCOqGx4aH8QXmFdba6B
	7ziKA+FX9uNXW7BshuXE2dSaUz4Tjya8mHOjSXkwPvPwUeFLiD6Y2A8EZWPTaQbZS/KI
	9LBAVkiFwJ5ihVmQFCxaqCVTOhrAWuug6dabKhTglPHdPT5kmxNi5MaL+jkBIqGAciX3
	9sJlrVvE9PUtuB7cwFqLm2IUOhv+sQCUUE9ZT7ibFb3x4SIz3WkQ2aU7msqXhuPgG9RT
	Q61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kr+Fuq1CxWDFdlyuLNV1LpcJAD/2+BmSZ8saKYvkXUo=;
	b=eCWO6/R0Cgyz4x9Fxnz/FvnB3okDMU56zwK2z88VJhAFTnX+9vfgdUiB8bg5P4+sNN
	cZdV0a22fS9MGaf4uNBOlIxxXkvkb+v9wsgoK6NjX6dLNp54i9gd6BOjxjLMaE4dGbZd
	IbSrRbnn+Fh1usUwQJNJJaSeq4wlm9UZgAFMHfocfpm8QQnS4mRnvZqhV5XLIg5wO/9U
	VoRdm3I1Fy199Pr22te0ceyrtYa0t4CyLeyafPJaUtpuAxFU2xaWS8qIi/ig9yJfAqwV
	xJNxDYUKYbSt/Wg16C5odlzNoTypPsfYn3krbwH/CYSUOUDVeNZrUMp2xio6g+NNETgR
	Tbhg==
X-Gm-Message-State: AKaTC02snSMPqsUVQGhuloKjulGxhgipQxsOk9uVFS5jyEdFu8Eo18LHDURnh/2KNqUagg==
X-Received: by 10.84.178.195 with SMTP id z61mr104375100plb.176.1480734268315; 
	Fri, 02 Dec 2016 19:04:28 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	186sm10624342pfv.61.2016.12.02.19.04.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 19:04:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2016 19:04:15 -0800
Message-Id: <20161203030422.17285-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH 1/8] libvncserver: Fix build with security flags on and disable libva
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
X-List-Received-Date: Sat, 03 Dec 2016 03:04:27 -0000

When libva is present it detects it and then fails to build
until the support is fixed, lets disable it

Add a patch to fix issue found when compiling with
security flags turned on

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libvncserver/0002-format_string.patch           | 21 +++++++++++++++++++++
 .../libvncserver/libvncserver_0.9.10.bb             |  3 +++
 2 files changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/0002-format_string.patch

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver/0002-format_string.patch b/meta-oe/recipes-graphics/libvncserver/libvncserver/0002-format_string.patch
new file mode 100644
index 0000000..566a208
--- /dev/null
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver/0002-format_string.patch
@@ -0,0 +1,21 @@
+From: Luca Falavigna <dktrkranz@debian.org>
+Date: Tue, 27 Jan 2015 01:26:04 +0000
+Subject: format_string
+
+---
+ client_examples/gtkvncviewer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/client_examples/gtkvncviewer.c b/client_examples/gtkvncviewer.c
+index 261b2da..861e4e3 100644
+--- a/client_examples/gtkvncviewer.c
++++ b/client_examples/gtkvncviewer.c
+@@ -588,7 +588,7 @@ static void GtkDefaultLog (const char *format, ...)
+ 
+ 	time (&log_clock);
+ 	strftime (buf, 255, "%d/%m/%Y %X ", localtime (&log_clock));
+-	fprintf (stdout, buf);
++	fprintf (stdout, "%s", buf);
+ 
+ 	vfprintf (stdout, format, args);
+ 	fflush (stdout);
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
index 387202b..0eba87c 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
@@ -14,6 +14,7 @@ SRC_URI  = "\
     ${DEBIAN_MIRROR}/main/libv/libvncserver/libvncserver_0.9.10+dfsg.orig.tar.xz \
     file://0001-remove-webclients-build.patch \
     file://0002-common-add-sha1.patch \
+    file://0002-format_string.patch \
 "
 
 SRC_URI[md5sum] = "e883b6c7bd339a5e1c48645051abe5c4"
@@ -21,4 +22,6 @@ SRC_URI[sha256sum] = "583f28869b82aec57768d7d18cd7ff81bf092ecbbc1209b587c2c2cd68
 
 S = "${WORKDIR}/${BPN}-LibVNCServer-${PV}"
 
+EXTRA_OECONF += "--without-libva"
+
 TARGET_LDFLAGS += "-lgcrypt"
-- 
2.10.2


