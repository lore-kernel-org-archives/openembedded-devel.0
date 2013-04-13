Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQytI-0004e7-MG
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 13:45:23 +0200
Received: by mail-ea0-f175.google.com with SMTP id r16so1546750ead.34
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 04:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=3sz1Z1cJXmmfdFbZmMbVGoX2uk8ovM9uRUIWveCG4TE=;
	b=N6kT0DHdIhADRhS2QOZ7jmhot5YEGslZCPmdp8h3bUPdULnfsVwlGO+OIJPddNTn/3
	VFS2z7BwlmZfSQHpEh2twf5kSocb21AU6DEymwjBS0UtvDYZVgJnaAxU3or8/1Chpd85
	covnGNOIFKeNXjUSILcF0+QbH0FSNV+Qxm6fJ0Ew1j670n7or+w8ygj5X3EIFthYi2PV
	tFpEe67qqWN3zZ6uMRth9hR+8Mewd7xrbTGpuaKzcqnnVn6j+0lTptoEA88LyTA4CH37
	Y8pDQbSreOTpQ83LfwgEpw5bhdXVnrFU4yWAHlz+fecj+eawn2xR3MK9LD09SnHtaEIC
	3CoQ==
X-Received: by 10.14.110.198 with SMTP id u46mr38197899eeg.41.1365852463084;
	Sat, 13 Apr 2013 04:27:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bj2sm16015255eeb.1.2013.04.13.04.27.42
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 04:27:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 13:27:39 +0200
Message-Id: <1365852460-3361-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365852460-3361-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365852460-3361-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 4/5] busybox: move bbappend to oe-core subdirectory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Apr 2013 11:45:36 -0000

---
 .../recipes-core/busybox/busybox/busybox-klogd.service.in                 | 0
 .../recipes-core/busybox/busybox/busybox-syslog.service.in                | 0
 .../{meta-oe => oe-core}/recipes-core/busybox/busybox_1.20.2.bbappend     | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-core/busybox/busybox/busybox-klogd.service.in (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-core/busybox/busybox/busybox-syslog.service.in (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-core/busybox/busybox_1.20.2.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-klogd.service.in b/meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-klogd.service.in
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-klogd.service.in
rename to meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-klogd.service.in
diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in b/meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-syslog.service.in
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
rename to meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-syslog.service.in
diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-systemd/oe-core/recipes-core/busybox/busybox_1.20.2.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
rename to meta-systemd/oe-core/recipes-core/busybox/busybox_1.20.2.bbappend
-- 
1.8.1.5



