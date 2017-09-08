Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9E8DD78213
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 22:08:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h4so2004518pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Sep 2017 15:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xZDQs5UEODkIMfW6CRD6WxgM8itjARp+Trna6OLEsqM=;
	b=GQqSm9yQTfXwKhor6f0p0HgPCmkQf1LZHqrFzdAPudFIaje8HH47K6HD1U9MT7FTzm
	w00AyD/bTq6BRq0zf/CSf1mmfzOim+SDjAQlHWSEoDeesl2XMW8n6GRxKycH5ypeNxvT
	dq8kFkF5JSfUXF7UOman9iWCB51eQUAp7SpRZ14bs7DuqGBK8clPAT9iEze+VF7iAl7P
	J0zU9LPDblYvCVPIxc47haU27uqt4glFa7RDTYjeYSTzXFC5vweXtT3GQ9oPzwf6fKD3
	NIlNVmUbEC6RlQk7iAyByRLf0HDUNf0YB18f7vV/cxdH1XTmWYAsOyGr9CWBf7ERVotK
	acbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xZDQs5UEODkIMfW6CRD6WxgM8itjARp+Trna6OLEsqM=;
	b=G6Re2yu0Y908UwmAHGGQKNkKbEx4qbTo3NEJHAJytFGaeehMCkoNEfKGxkB41IkdzM
	O20YG//KKO1LqwzjWRa/2SkWgtrFmrOjfhWb3s9mdTHBYbx/SInzmu0EtqNYCgG0yH5K
	UjKUTKr/zne5VyYMu/OHftQXsLc0cMFsRdHBPdTAsuhs0OGhE/G116AzUCigG6Nk89kd
	PYyXoMIdXK8P9cQGtPH847U9amevKpLpaBN2UdErzyFyT+lhMlZ4++ohTKJRKbgRpIsh
	/lrNJsRF4aw2F4M58RBMBySJIj3ubfNnwgCQzyx40FEaBHE8xBXE1TrbQQ8pL3PKKb1p
	jrfA==
X-Gm-Message-State: AHPjjUiVL1l74D/X71cCG2pKraowkUiCkXePGn5F0Z+HOJSUh5BY6eIu
	IednTo36Ow2NhejY
X-Google-Smtp-Source: ADKCNb5VHAl7lbagqTdypflLOnWh57/iSzK6yhg4w5Cqk+7vpbEGVwzutMtGbmVXz4taOWnGTKW/EA==
X-Received: by 10.98.18.73 with SMTP id a70mr4646636pfj.245.1504908526966;
	Fri, 08 Sep 2017 15:08:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id a6sm4502134pgq.17.2017.09.08.15.08.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 15:08:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Sep 2017 15:08:37 -0700
Message-Id: <20170908220837.44604-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH V2] minicoredumper: Switch src_uri to upstream lf git
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
X-List-Received-Date: Fri, 08 Sep 2017 22:08:46 -0000

COPYING file changed since copyright is now assined to linutronix from Erricson

Fix build on arm

Fixes error like
corestripper.c:1245:4: error: format specifies type 'unsigned long' but the arg
ument has type 'long long' [-Werror,-Wformat]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in V2: Add patch to fix build on arm

 .../files/0001-fix-compile-error-on-arch-x32.patch | 32 ++++++++++++++++++++++
 .../minicoredumper/minicoredumper_2.0.0.bb         |  7 +++--
 2 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-fix-compile-error-on-arch-x32.patch

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-fix-compile-error-on-arch-x32.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-fix-compile-error-on-arch-x32.patch
new file mode 100644
index 000000000..6ba6ad481
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/0001-fix-compile-error-on-arch-x32.patch
@@ -0,0 +1,32 @@
+From 883f53ee33eaef8aca1288a110857402ad362966 Mon Sep 17 00:00:00 2001
+From: John Ogness <john.ogness@linutronix.de>
+Date: Fri, 8 Sep 2017 15:03:03 -0700
+Subject: [PATCH] fix compile error on arch=x32
+
+On the x32 architecture time_t is a "long long int". By
+ typecasting time_t to "long long", this should work correctly
+ for all architectures.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/minicoredumper/corestripper.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
+index fd39bfb..07dc318 100644
+--- a/src/minicoredumper/corestripper.c
++++ b/src/minicoredumper/corestripper.c
+@@ -1241,7 +1241,7 @@ static int dump_compressed_tar(struct dump_info *di)
+ 	snprintf(hdr.mode, sizeof(hdr.mode), "%07o", 0644);
+ 	snprintf(hdr.uid, sizeof(hdr.uid), "%07o", 0);
+ 	snprintf(hdr.gid, sizeof(hdr.gid), "%07o", 0);
+-	snprintf(hdr.mtime, sizeof(hdr.mtime), "%011lo",
++	snprintf(hdr.mtime, sizeof(hdr.mtime), "%011llo",
+ 		 (long long)time(NULL));
+ 	memset(hdr.checksum, ' ', sizeof(hdr.checksum));
+ 	hdr.type = 'S';
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
index 3bf9f66b9..1858e102d 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "minicoredumper provides an alternate core dump facility for Linux \
 to allow minimal and customized crash dumps"
 LICENSE = " LGPLv2.1 & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=709087c2ed0acda54a4d91497a889e42 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=aa846ae365f71b69e9fa0d21a56391ec \
                     file://COPYING.BSD;md5=b915ac80d5236d6aa659cb986daf00e5 \
                     file://COPYING.LGPLv2.1;md5=321bf41f280cf805086dd5a720b37785 \
                    "
@@ -9,14 +9,15 @@ DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux json-c"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-SRCREV = "248019446ccf6079926efb54f8b6dd7be769bbae"
+SRCREV = "cdc1faf1212a51e89b477468876e229223fceb9a"
 
 PR .= "+git${SRCPV}"
 
-SRC_URI = "git://github.com/Linutronix/minicoredumper-debian;branch=unstable \
+SRC_URI = "git://git.linuxfoundation.org/diamon/minicoredumper.git;protocol=http \
            file://minicoredumper.service \
            file://minicoredumper.init \
            file://0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch \
+           file://0001-fix-compile-error-on-arch-x32.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.14.1


