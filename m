Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id C704777E41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:30 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id g2so18479168pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mir5AmYWPUUUGu8X/6qTsdLGjBjDmvbpOIgzFDhR8tw=;
	b=WDR0eZ/ezFY3ddJWiiG/YzIroVIKHJObSPRzV9EGxEOhVNiwq6HoHUO4TFFr6yVtEV
	xLDAqnsR46NeCzXDcuR6fpNMI+yXZAAJ0qKaA5gT3GyfkZdKLIwWrgRycm5PzWAk5pkN
	q58sBrlHHvg9BGxD0oXpDTdURkQvzIptPR0wgYRH3kQ5K1TqgTZGj5/2mZV5F9ge4OxZ
	9X9QvgavYwqgX6lOy2dCAhSLpNwkR8cv5t9lB7JapekYHhSZ2LveAbhsWLHjlUavuUFj
	Ct0pWNoICdYvrL6hCZvYW6GW8rTbWs23DszoQkwKUTRf1xnVeHM3HcQFrjgyoigsM/qI
	VZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mir5AmYWPUUUGu8X/6qTsdLGjBjDmvbpOIgzFDhR8tw=;
	b=IaWda7FivOefGOtP3jg3oV+Yt6Y5WMZRWDArgLH6tALJtj+WnQwFjQBOescNv0qPFt
	Drqeh2t7Qf0Azu226bNHXkKC6N5NdeyJ/90pIfhlb9/4s1SMa1ZSytVSYiSwss7ijoJd
	tOA4mBTZR355Bp6ntNTNewMtt0NbWDGgZOZ+KoYTDPQ42cpeRzu7BYa8upmuCGcd/Hji
	rnNnY/Bcrk+roYy0Btfvhmm/datOSZw5CTdxFvzsgBaMG79QMHKbcSVB4xHKruhBBy7U
	+1ZhXDeVfZK/i+8pdWz8Voq8y7beillvYzEp0+cNg5adP80rPE5k/c2qKsqMFy3vVJhm
	/tKQ==
X-Gm-Message-State: AFeK/H1m+LUyUjcNmwmay3ucG4nphgz/GbCIcv/evAnODlUneoYNEy21hMlQJj789kZL0A==
X-Received: by 10.84.197.131 with SMTP id n3mr4497835pld.43.1490978612076;
	Fri, 31 Mar 2017 09:43:32 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:29 -0700
Message-Id: <20170331164247.5052-25-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 25/43] vsftpd: Fix build with musl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...c-Fix-with-musl-which-does-not-have-utmpx.patch | 28 ++++++++++++++++++++++
 .../recipes-daemons/vsftpd/vsftpd_3.0.3.bb         |  7 +++---
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
new file mode 100644
index 000000000..c3919e117
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
@@ -0,0 +1,28 @@
+From e55135c2a4ea7eae3cb1f4dccf69ca477ea095bf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Mar 2017 20:09:12 -0700
+Subject: [PATCH] sysdeputil.c: Fix with musl which does not have utmpx
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeputil.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/sysdeputil.c b/sysdeputil.c
+index 06f01f4..a8cff3b 100644
+--- a/sysdeputil.c
++++ b/sysdeputil.c
+@@ -58,7 +58,9 @@
+ #define VSF_SYSDEP_HAVE_SHADOW
+ #define VSF_SYSDEP_HAVE_USERSHELL
+ #define VSF_SYSDEP_HAVE_LIBCAP
+-#define VSF_SYSDEP_HAVE_UTMPX
++#if defined(__GLIBC__)
++  #define VSF_SYSDEP_HAVE_UTMPX
++#endif
+ 
+ #define __USE_GNU
+ #include <utmpx.h>
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
index 3eaaa30b6..e52461446 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
@@ -19,7 +19,10 @@ SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
            file://vsftpd.service \
            file://vsftpd-2.1.0-filter.patch \
            file://0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch \
-"
+           ${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://vsftpd-tcp_wrappers-support.patch', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '${NOPAM_SRC}', d)} \
+           file://0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch \
+           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
                         file://COPYRIGHT;md5=04251b2eb0f298dae376d92454f6f72e \
@@ -30,13 +33,11 @@ SRC_URI[sha256sum] = "9d4d2bf6e6e2884852ba4e69e157a2cecd68c5a7635d66a3a8cf8d898c
 
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = ",,tcp-wrappers"
-SRC_URI +="${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://vsftpd-tcp_wrappers-support.patch', '', d)}"
 
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-listfile', '', d)}"
 PAMLIB = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '-L${STAGING_BASELIBDIR} -lpam', '', d)}"
 NOPAM_SRC ="${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://nopam-with-tcp_wrappers.patch', 'file://nopam.patch', d)}"
-SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '${NOPAM_SRC}', d)}"
 
 inherit update-rc.d useradd systemd
 
-- 
2.12.1


