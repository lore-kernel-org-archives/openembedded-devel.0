Return-Path: <danismostlikely@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0CEB379C84
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 15:46:50 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id p6-v6so19095527qkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=dMpwlAk21iYK7JxPWcqyijyl3KLmHOCG0+CSyU3GDIo=;
	b=gbkxGJXilbF2xoKeTzj8uZJyBitlgbCm3lCVMYYILYzExUkrffR9rJrHT22iL7msqN
	FsHOV/I3Te3mS0a7N9pK9udliZ5E0cfQk1pYYTRt08WhI7V+CBFD4KbjVglRc5BO8sLf
	n+m4Cx2gh9fnCDe15KV4o+lobIxMhRL9WqNPMvBg6UIHBjRsdtqPIfuNAkeVhNDrmSpx
	oKzcc7plcezDJXX8lKbiSVRvd0UHQ5gZmO7K8DG88724MWMzICgSmNsqhtxOoUxuV5A4
	sS5ALF0byNgHKXoOo9bR8aSmmAjnQTWGTHM8fN6vO4CmEaWkCfVt35CNiBlGGZUjtpyG
	cVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dMpwlAk21iYK7JxPWcqyijyl3KLmHOCG0+CSyU3GDIo=;
	b=WUTsybq93HcZefJpcwqdiJ8cc8aAUyS/b+1RIBpmk5+3cRGXwH64cucmRqR/uXe7YP
	PmudEfVXs2H6KUqFKLbqRrNmjsVx8bQVG5jx/3Kk3Dw/GZBv7NgBFgzYHDYOY9Nm+p5j
	2X1HC0XpBrJLq5LpXgOX3xKKadgYwt9W4GLWndAPV+lFSZAXQKy7K6T30iIVze3V9udP
	x7mv3h3n68oClP3voR9A+HeymoG3s9ohRePcck09r34FhYWjCNOuaidK/sBNU95qQ9Na
	DLlgCwgSlJswrD8KjJhVPDX4jdm9dG+VkKIVE/Gtv3VbNji4oaPnZEV3oQVJ/iZ5SEm0
	z0EQ==
X-Gm-Message-State: ABuFfogayBUS/qivuTII72qpVhWeEZdMSSgM7/0e2mzvmFeAmVPAARKn
	T8/9MmPTi5T+dVAcOm1WB5rFtAhd
X-Google-Smtp-Source: ACcGV6264KWBIy831eZh1aHdXcjIeRiC4ZqHO3Wpry6t+UZn5P1e4qLf9isJrCoyV6KQGn2q/6lwSg==
X-Received: by 2002:a37:1a4a:: with SMTP id
	a71-v6mr29495123qka.252.1539877611388; 
	Thu, 18 Oct 2018 08:46:51 -0700 (PDT)
Received: from mediabox.local (204-83-204-143.prna.hsdb.sasknet.sk.ca.
	[204.83.204.143]) by smtp.gmail.com with ESMTPSA id
	o4-v6sm14922401qtb.44.2018.10.18.08.46.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Oct 2018 08:46:50 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Oct 2018 09:46:28 -0600
Message-Id: <20181018154628.27229-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.19.0-dev
In-Reply-To: <20181018154628.27229-1-danismostlikely@gmail.com>
References: <20181018154628.27229-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] toybox: Fix paths to match OE conventions
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
X-List-Received-Date: Thu, 18 Oct 2018 15:46:51 -0000
Content-Transfer-Encoding: 8bit

From: Dan McGregor <dan.mcgregor@usask.ca>

Many toybox commands get installed in places that are unexpected
in openembedded-core, causing conflicts. Fix up the paths I identified
that are causing conflicts.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../toybox/toybox/OE-path-changes.patch       | 195 ++++++++++++++++++
 meta-oe/recipes-core/toybox/toybox_0.7.5.bb   |   4 +-
 2 files changed, 198 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/toybox/toybox/OE-path-changes.patch

diff --git a/meta-oe/recipes-core/toybox/toybox/OE-path-changes.patch b/meta-oe/recipes-core/toybox/toybox/OE-path-changes.patch
new file mode 100644
index 0000000000..e42c22ebd4
--- /dev/null
+++ b/meta-oe/recipes-core/toybox/toybox/OE-path-changes.patch
@@ -0,0 +1,195 @@
+diff --git a/toys/net/microcom.c b/toys/net/microcom.c
+index d34e1fe..a369e6c 100644
+--- a/toys/net/microcom.c
++++ b/toys/net/microcom.c
+@@ -2,7 +2,7 @@
+  *
+  * Copyright 2017 The Android Open Source Project.
+ 
+-USE_MICROCOM(NEWTOY(microcom, "<1>1s:X", TOYFLAG_BIN))
++USE_MICROCOM(NEWTOY(microcom, "<1>1s:X", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config MICROCOM
+   bool "microcom"
+diff --git a/toys/other/blockdev.c b/toys/other/blockdev.c
+index 38e0993..c5d9fcd 100644
+--- a/toys/other/blockdev.c
++++ b/toys/other/blockdev.c
+@@ -4,7 +4,7 @@
+  *
+  * No Standard.
+ 
+-USE_BLOCKDEV(NEWTOY(blockdev, "<1>1(setro)(setrw)(getro)(getss)(getbsz)(setbsz)#<0(getsz)(getsize)(getsize64)(flushbufs)(rereadpt)",TOYFLAG_USR|TOYFLAG_BIN))
++USE_BLOCKDEV(NEWTOY(blockdev, "<1>1(setro)(setrw)(getro)(getss)(getbsz)(setbsz)#<0(getsz)(getsize)(getsize64)(flushbufs)(rereadpt)",TOYFLAG_SBIN))
+ 
+ config BLOCKDEV
+   bool "blockdev"
+diff --git a/toys/other/chrt.c b/toys/other/chrt.c
+index a1c37a0..d6db3a5 100644
+--- a/toys/other/chrt.c
++++ b/toys/other/chrt.c
+@@ -4,7 +4,7 @@
+  *
+  * Note: -ibrfo flags sorted to match SCHED positions for highest_bit()
+ 
+-USE_CHRT(NEWTOY(chrt, "^mp#<0iRbrfo[!ibrfo]", TOYFLAG_USR|TOYFLAG_SBIN))
++USE_CHRT(NEWTOY(chrt, "^mp#<0iRbrfo[!ibrfo]", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config CHRT
+   bool "chrt"
+diff --git a/toys/other/hwclock.c b/toys/other/hwclock.c
+index 1d313e3..412582d 100644
+--- a/toys/other/hwclock.c
++++ b/toys/other/hwclock.c
+@@ -4,7 +4,7 @@
+  *
+  * No standard, but see Documentation/rtc.txt in the linux kernel source..
+  *
+-USE_HWCLOCK(NEWTOY(hwclock, ">0(fast)f(rtc):u(utc)l(localtime)t(systz)s(hctosys)r(show)w(systohc)[-ul][!rtsw]", TOYFLAG_USR|TOYFLAG_BIN))
++USE_HWCLOCK(NEWTOY(hwclock, ">0(fast)f(rtc):u(utc)l(localtime)t(systz)s(hctosys)r(show)w(systohc)[-ul][!rtsw]", TOYFLAG_SBIN))
+ 
+ config HWCLOCK
+   bool "hwclock"
+diff --git a/toys/other/modinfo.c b/toys/other/modinfo.c
+index 1178d67..966a9de 100644
+--- a/toys/other/modinfo.c
++++ b/toys/other/modinfo.c
+@@ -4,7 +4,7 @@
+  *
+  * TODO: cleanup
+ 
+-USE_MODINFO(NEWTOY(modinfo, "<1b:k:F:0", TOYFLAG_BIN))
++USE_MODINFO(NEWTOY(modinfo, "<1b:k:F:0", TOYFLAG_SBIN))
+ 
+ config MODINFO
+   bool "modinfo"
+diff --git a/toys/other/pmap.c b/toys/other/pmap.c
+index abb0a33..2acef02 100644
+--- a/toys/other/pmap.c
++++ b/toys/other/pmap.c
+@@ -5,7 +5,7 @@
+  *
+  * No Standard.
+ 
+-USE_PMAP(NEWTOY(pmap, "<1xq", TOYFLAG_BIN))
++USE_PMAP(NEWTOY(pmap, "<1xq", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config PMAP
+   bool "pmap"
+diff --git a/toys/other/printenv.c b/toys/other/printenv.c
+index e8bcf29..65f62ed 100644
+--- a/toys/other/printenv.c
++++ b/toys/other/printenv.c
+@@ -2,7 +2,7 @@
+  *
+  * Copyright 2012 Georgi Chorbadzhiyski <georgi@unixsol.org>
+ 
+-USE_PRINTENV(NEWTOY(printenv, "0(null)", TOYFLAG_USR|TOYFLAG_BIN))
++USE_PRINTENV(NEWTOY(printenv, "0(null)", TOYFLAG_BIN))
+ 
+ config PRINTENV
+   bool "printenv"
+diff --git a/toys/other/taskset.c b/toys/other/taskset.c
+index 8ffdab7..89fd528 100644
+--- a/toys/other/taskset.c
++++ b/toys/other/taskset.c
+@@ -2,7 +2,7 @@
+  *
+  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
+ 
+-USE_TASKSET(NEWTOY(taskset, "<1^pa", TOYFLAG_BIN|TOYFLAG_STAYROOT))
++USE_TASKSET(NEWTOY(taskset, "<1^pa", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_STAYROOT))
+ USE_NPROC(NEWTOY(nproc, "(all)", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config NPROC
+diff --git a/toys/other/timeout.c b/toys/other/timeout.c
+index 9b93466..e1d0f4d 100644
+--- a/toys/other/timeout.c
++++ b/toys/other/timeout.c
+@@ -4,7 +4,7 @@
+  *
+  * No standard
+ 
+-USE_TIMEOUT(NEWTOY(timeout, "<2^vk:s: ", TOYFLAG_BIN))
++USE_TIMEOUT(NEWTOY(timeout, "<2^vk:s: ", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config TIMEOUT
+   bool "timeout"
+diff --git a/toys/other/truncate.c b/toys/other/truncate.c
+index 142d3c7..40eb1e5 100644
+--- a/toys/other/truncate.c
++++ b/toys/other/truncate.c
+@@ -2,7 +2,7 @@
+  *
+  * Copyright 2011 Rob Landley <rob@landley.net>
+ 
+-USE_TRUNCATE(NEWTOY(truncate, "<1s:|c", TOYFLAG_BIN))
++USE_TRUNCATE(NEWTOY(truncate, "<1s:|c", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config TRUNCATE
+   bool "truncate"
+diff --git a/toys/posix/nice.c b/toys/posix/nice.c
+index 4b587ee..9f7b119 100644
+--- a/toys/posix/nice.c
++++ b/toys/posix/nice.c
+@@ -4,7 +4,7 @@
+  *
+  * See http://opengroup.org/onlinepubs/9699919799/utilities/nice.html
+ 
+-USE_NICE(NEWTOY(nice, "^<1n#", TOYFLAG_USR|TOYFLAG_BIN))
++USE_NICE(NEWTOY(nice, "^<1n#", TOYFLAG_BIN))
+ 
+ config NICE
+   bool "nice"
+diff --git a/toys/posix/nl.c b/toys/posix/nl.c
+index 9b02bfa..41e1b89 100644
+--- a/toys/posix/nl.c
++++ b/toys/posix/nl.c
+@@ -7,7 +7,7 @@
+  * This implements a subset: only one logical page (-ip), no sections (-dfh).
+  * todo: -lv
+ 
+-USE_NL(NEWTOY(nl, "v#<1=1l#b:n:s:w#<0=6E", TOYFLAG_BIN))
++USE_NL(NEWTOY(nl, "v#<1=1l#b:n:s:w#<0=6E", TOYFLAG_USR|TOYFLAG_BIN))
+ 
+ config NL
+   bool "nl"
+diff --git a/toys/posix/paste.c b/toys/posix/paste.c
+index ea04f02..8972f71 100644
+--- a/toys/posix/paste.c
++++ b/toys/posix/paste.c
+@@ -6,7 +6,7 @@
+  *
+  * Deviations from posix: the FILE argument isn't mandatory, none == '-'
+ 
+-USE_PASTE(NEWTOY(paste, "d:s", TOYFLAG_BIN|TOYFLAG_LOCALE))
++USE_PASTE(NEWTOY(paste, "d:s", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE))
+ 
+ config PASTE
+   bool "paste"
+diff --git a/toys/posix/ps.c b/toys/posix/ps.c
+index aef2a7f..b559e09 100644
+--- a/toys/posix/ps.c
++++ b/toys/posix/ps.c
+@@ -44,7 +44,7 @@
+  * TODO: top: thread support and SMP
+  * TODO: pgrep -f only searches the amount of cmdline that fits in toybuf.
+ 
+-USE_PS(NEWTOY(ps, "k(sort)*P(ppid)*aAdeflMno*O*p(pid)*s*t*Tu*U*g*G*wZ[!ol][+Ae][!oO]", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE))
++USE_PS(NEWTOY(ps, "k(sort)*P(ppid)*aAdeflMno*O*p(pid)*s*t*Tu*U*g*G*wZ[!ol][+Ae][!oO]", TOYFLAG_BIN|TOYFLAG_LOCALE))
+ // stayroot because iotop needs root to read other process' proc/$$/io
+ USE_TOP(NEWTOY(top, ">0m" "O*Hk*o*p*u*s#<1d#=3<1n#<1bq[!oO]", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE))
+ USE_IOTOP(NEWTOY(iotop, ">0AaKO" "k*o*p*u*s#<1=7d#=3<1n#<1bq", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_STAYROOT|TOYFLAG_LOCALE))
+diff --git a/toys/posix/sed.c b/toys/posix/sed.c
+index cf7d15e..130ac08 100644
+--- a/toys/posix/sed.c
++++ b/toys/posix/sed.c
+@@ -10,7 +10,7 @@
+  * TODO: handle error return from emit(), error_msg/exit consistently
+  *       What's the right thing to do for -i when write fails? Skip to next?
+ 
+-USE_SED(NEWTOY(sed, "(help)(version)e*f*inEr[+Er]", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE|TOYFLAG_NOHELP))
++USE_SED(NEWTOY(sed, "(help)(version)e*f*inEr[+Er]", TOYFLAG_BIN|TOYFLAG_LOCALE|TOYFLAG_NOHELP))
+ 
+ config SED
+   bool "sed"
diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.5.bb b/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
index eaa548f897..7e8e7b2eaa 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
@@ -5,7 +5,9 @@ DEPENDS = "attr virtual/crypt"
 LICENSE = "BSD-0-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
 
-SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
+           file://OE-path-changes.patch \
+           "
 SRC_URI[md5sum] = "a8bb502a1be941f06dd2644fff25f547"
 SRC_URI[sha256sum] = "3ada450ac1eab1dfc352fee915ea6129b9a4349c1885f1394b61bd2d89a46c04"
 
-- 
2.19.0-dev


