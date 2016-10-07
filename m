Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 52B32719CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 09:19:33 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 123so1967426wmb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 02:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kS//phnmBHiVN5JH/hBvRnPLk//yluO5jzQv7gHXlUQ=;
	b=suDVto+RS5+SMHX4UfNwhOb7qJ4DraQqFZcVtw/WtabkJahjXFe+s/ufpaeLQXSgUu
	aIIEGPpdaqTFSIe1NinRfiZer2aevz4rqhPF8OIjXfYS7UNWNBemviQk67BOrbxQ9JFJ
	WMKRU9s5KEFJQLQUdst8J2I5REMQHvqHvbbu9xCuc0KnluYooD4B5OlkKJIg4KaadH4R
	pJGHzNAW2/2eTUA9pWYmCbQ9F6HfcPg4t+ZZEWYMX+juH9Yy5OSivijp0nC+K4SRkman
	y6SQ1KJEJiTCNiEyCwzqHhos8qhUMp5QjCOYyYSWHSnnMno9VOf0AILkpwDARru2zDdI
	ePkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kS//phnmBHiVN5JH/hBvRnPLk//yluO5jzQv7gHXlUQ=;
	b=Uz1sFy/ihYraC5LFUSTiNoeuumd3RFQEiH6gvRf+ngp9kbGC8DmirBKLP124nCtFWR
	A4RxQE1Xqvk3k+u4VY1p2Q7QyJBavOLtHQ4xv4QnqH09Aeme/paD8XcE98vROo4WN+M0
	SPJ4C4qAXyfuFJyrVKCwnTGkHKdKIeiw20/eevjiD/Tc00DfmA4+KW3aHKpPusc1s98V
	6YI0XtqYJj0oMLiBFA5G+o/b9qY6VHFfWjfTwtcvm16Mpo3JrJJtklYyIR6kyWGWopDP
	UqjZVSglOlPylznXJSvaOLRdHzSx3JAK38Pn8kqRHkjSlCw+bWAhv+1+EV2RMvwTOHRN
	a0tQ==
X-Gm-Message-State: AA6/9Rke2f6PGA+GlRaJKTXEbnESSmpt557gTflantsuJicHmf0kvN5zIQ4bJwQT2rJyLA==
X-Received: by 10.28.196.14 with SMTP id u14mr19370943wmf.17.1475831974228;
	Fri, 07 Oct 2016 02:19:34 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-95-222-156-64.hsi15.unitymediagroup.de. [95.222.156.64])
	by smtp.googlemail.com with ESMTPSA id
	jn7sm18657184wjb.5.2016.10.07.02.19.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Oct 2016 02:19:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Oct 2016 11:19:22 +0200
Message-Id: <1475831964-1993-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475831964-1993-1-git-send-email-schnitzeltony@googlemail.com>
References: <1475831964-1993-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] a2jmidid: initial add v8
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
X-List-Received-Date: Fri, 07 Oct 2016 09:19:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-pthread-library-dependency-to-fix-linkin.patch | 43 ++++++++++++++++++++++
 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb      | 22 +++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/jack/a2jmidid/0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch
 create mode 100644 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb

diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid/0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch b/meta-oe/recipes-multimedia/jack/a2jmidid/0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch
new file mode 100644
index 0000000..d17d311
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid/0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch
@@ -0,0 +1,43 @@
+From 488dc9b00239976caac6bd9ed76b38d9d1659dd9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 4 Oct 2016 23:44:49 +0200
+Subject: [PATCH] wscript: add pthread library dependency to fix linking
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Stolen from [1]
+
+[1] http://pkgs.fedoraproject.org/cgit/rpms/a2jmidid.git/tree/a2jmidid-linking.patch
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ wscript | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index 664625b..66a532a 100644
+--- a/wscript
++++ b/wscript
+@@ -67,6 +67,7 @@ def configure(conf):
+         conf.env['DBUS_ENABLED'] = False
+ 
+     conf.env['LIB_DL'] = ['dl']
++    conf.env['LIB_PTHREAD'] = ['pthread']
+ 
+     #conf.check_header('expat.h', mandatory=True)
+     #conf.env['LIB_EXPAT'] = ['expat']
+@@ -152,7 +153,7 @@ def build(bld):
+ 
+     prog.includes = '.' # make waf dependency tracking work
+     prog.target = 'a2jmidid'
+-    prog.uselib = 'ALSA JACK DL'
++    prog.uselib = 'ALSA JACK DL PTHREAD'
+     if bld.env()['DBUS_ENABLED']:
+         prog.uselib += " DBUS-1"
+     prog = bld.create_obj('cc', 'program')
+-- 
+2.5.5
+
diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
new file mode 100644
index 0000000..d7e93b6
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
@@ -0,0 +1,22 @@
+SUMMARY = "a2jmidid is daemon for exposing ALSA sequencer applications as JACK MIDI"
+SECTION = "libs/multimedia"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = " \
+    file://gpl2.txt;md5=751419260aa954499f7abaabaa882bbe \
+"
+
+DEPENDS = "alsa-lib jack dbus"
+
+SRC_URI = " \
+    http://download.gna.org/${BPN}/${BPN}-${PV}.tar.bz2 \
+    file://0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch \
+"
+SRC_URI[md5sum] = "9cf4edbc3ad2ddeeaf6c8c1791ff3ddd"
+SRC_URI[sha256sum] = "2a9635f62aabc59edb54ada07048dd47e896b90caff94bcee710d3582606f55f"
+
+inherit waf
+
+export LINKFLAGS="${LDFLAGS}"
+
+FILES_${PN} += "${datadir}/dbus-1/services"
-- 
2.7.4


