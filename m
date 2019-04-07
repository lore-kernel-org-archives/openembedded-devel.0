Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id AB1356BD1C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 20:07:03 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id o25so11911208wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 13:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XdxstouPjlZAenktR1drto4CHPcRO+kCWz2JV/erSXE=;
	b=EaXNUYqzSsOzY3JHNF6jbF2hJATELsq4fHAi4h6mocatPbqCqOxYANNhMfF7OMHxPU
	jHerp+JuLW1BDCK0f70kbLN3ZqNtNhtlYixbCj3V2iUMR/kZkdd3t5gXz/LxaKA8ZZNY
	fn5JzooD2sCI9mx4p/EltK5Fpd8e8+sE+lhYj1MtAP/kg2v8ZvNYJZK78d6ea1P6td0S
	SN43gKKg9FTHetJnxJ24Zxb9Esak0Tm+c4aHl0RRB6bmZFfaEDRjE3C9p4IolbKzBPTY
	jyFnvGqncVGlIwMSwcs8jmHhNEItNCNgl5TtD0K9M8QmQl1H9HfNaRL5XIuKG6/XWwqr
	i+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XdxstouPjlZAenktR1drto4CHPcRO+kCWz2JV/erSXE=;
	b=gpbQmCYyEUL1sWC71LbtpEZ7FBXCa3R6J8Kp2C4cqM0uU5bTC/5msg0G9JrNavBJ1I
	9aq4WAKSGFmNg3go7iy7EVbHnA6Ges6XE9faaoYaF9b4Fif3PyxDmWACBc01D7Ws5Vwa
	oSNtyS2PIwgWxNwDSyVgJuPFSJXhmYhk/q0tNn3CED+W2kFRslP8GYdIYAlnmYm5IG+s
	fySmDG0b3G3ObpqgWp8Imd6RxfjkaudS+ropzsjTmwe00O9rQc/mvGZQ4rNbJ/hEG67/
	fiLdpeQCve29I6O9qwi/SG+grUKKp5x4Se5edS5U1ujfOazoTlIFCEHot7ZfrLXkxfMR
	jrgw==
X-Gm-Message-State: APjAAAUIf4iyGL6EhDeNAPQGtzuO+fcdsM7JDokNrTb+aGYYjtLHD6FA
	55QlHS7Ttg7PEisS5YhVucLPmJ1D
X-Google-Smtp-Source: APXvYqwA1nbv4aLtIElFw0XtABZF1imYlglkyJ9SFmSNwC6M6RizH1TzS9I7+SyIrVjvW/0547n2bQ==
X-Received: by 2002:a1c:c181:: with SMTP id r123mr7552734wmf.13.1554667623959; 
	Sun, 07 Apr 2019 13:07:03 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D997F582C1CABA04AD80.dip0.t-ipconnect.de.
	[2003:f0:7f05:d997:f582:c1ca:ba04:ad80])
	by smtp.gmail.com with ESMTPSA id
	x21sm14007900wrd.45.2019.04.07.13.07.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 07 Apr 2019 13:07:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 22:06:55 +0200
Message-Id: <20190407200655.13442-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gvfs: remove executable permission from systemd user services
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
X-List-Received-Date: Sun, 07 Apr 2019 20:07:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As written in comment: Looks to me as if meson build is not yet working as
it should for gvfs. Looked into but did not find suspicious. So just remove
flags for now.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
index df9fd50ea..8fed9e825 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
@@ -73,4 +73,12 @@ do_install_append() {
     for exe in `find ${D}/${libexec}`; do
        chmod +x $exe
     done
+
+    # Something sets user services executable - looks a bit as if meson
+    # transition has room for enhancements...
+    # Systemd warns with messages as:
+    # Apr 07 01:00:33 raspberrypi3 systemd[348]: Configuration file /usr/lib/systemd/user/gvfs-mtp-volume-monitor.service is marked executable. Please remove executable permissio>
+    for service in `find ${D}/${systemd_user_unitdir}`; do
+       chmod -x $service
+    done
 }
-- 
2.20.1


