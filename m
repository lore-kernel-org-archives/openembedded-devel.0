Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 450BB7831C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 15:35:20 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id v105so42192837wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 08:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ydDCK3Gn2lYHKL23zRpWm09D2RFw1rNlFow7XvKwKQE=;
	b=j6td1R+UoRsum/jee7kdQhN7cPrtEQZ7EAk2Fni44Ras+5Wo+tTEvyzHYD1s8Xd5zH
	DLfKJj8rYdFuzFTn+6ltDJR91yGc3cqixT/TZkKQyu8X91gj0RCl6JjIwOlJ8iMisdjT
	CtoKUsYbZyufPwXBTZai5zJrqPTIx9nyBSPp4TIQ4UZW4v6fecaahcYYapHC6BbF67hP
	ouQ5Qn1yMUvbO/e6OlWtFvXfJ0ZXIZGLZ3gXPQJ5s9NG6uuQTSEEsID7Co/6V+KOo1PW
	mJnGuLCEOKMPl5hvex8s1K7xGI2wn7sFVdpLrioz/m+YEA7ekIUmmSTSxPmB9EAEBS5d
	pq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ydDCK3Gn2lYHKL23zRpWm09D2RFw1rNlFow7XvKwKQE=;
	b=LHzEkI8TOo1rMMdq6kuWWnTpLMTMBIDBCbQFexNTYsv96K3lUZgOO3NysWyQDj+e1S
	6d+V8wyNwvGDGG2LgTTj/spspzzEBwmNtEBSY8XTDd8WmO5yfqn1shc0/UxJqg9cWXe+
	WKLaJgi0yO8qXgcXdcT3r4G1DTQHN8VvO4M6oBo0ZfuHooio1hv+q22+0u07v3233XbH
	ZPJltBuLl0pqsjEpbX7fy0nvRsQx1P4QP4dDsFHU889d+x8aNTeCpaP5lrBdC9L2uA2b
	Xt4wHJ9XzU7NrdOR902yk1zc0YYldcLnEzxPzRWssade80n/7OU6QRcT16usyKs+/oHI
	SzXw==
X-Gm-Message-State: AIVw113fKQz4473dTELDgZ6H1+bXIXf77LiE0yRD1zRdoRwsToGXP6Fn
	tZ3yOu47tNhYPQBQDCc=
X-Received: by 10.223.161.204 with SMTP id v12mr6906659wrv.125.1500564921553; 
	Thu, 20 Jul 2017 08:35:21 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	190sm2853628wmh.36.2017.07.20.08.35.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 08:35:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:35:05 +0100
Message-Id: <20170720153508.23113-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170720153508.23113-1-ross.burton@intel.com>
References: <20170720153508.23113-1-ross.burton@intel.com>
Subject: [PATCH][meta-gnome 6/9] gcalctool: remove (previously blacklisted)
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
X-List-Received-Date: Thu, 20 Jul 2017 15:35:21 -0000

GCalctool 5.32.0 is from 2010 and blacklisted, so remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-gnome/gcalctool/gcalctool_5.32.0.bb      | 20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb

diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
deleted file mode 100644
index 6028f2d1a..000000000
--- a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "gcalctool is a powerful calculator"
-SECTION = "x11"
-DEPENDS = "gtk+ gnome-doc-utils"
-
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-SRC_URI = "http://download.gnome.org/sources/${BPN}/${SHRT_VER}/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "48db927c6e7ee1d5395f953a8c184c98"
-SRC_URI[sha256sum] = "346f645c0fdef900642f6e9a2c18e7ba9a7ca9bc62fe2b08eb418f065a425c89"
-
-inherit autotools pkgconfig gsettings
-
-do_configure_prepend() {
-    sed -i -e "s: help: :g" ${S}/Makefile.am
-}
-
-PNBLACKLIST[gcalctool] ?= "broken at least since April 2013 http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57920 and nobody complained, it's also replaced by gnome calculator - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.11.0


