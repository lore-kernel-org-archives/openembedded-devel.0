Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043D8C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 03:39:38 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.7230.1633923576725869734
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Oct 2021 20:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19B3dZEF006330
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Oct 2021 20:39:35 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19B3dUi9022545
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Oct 2021 20:39:35 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 10 Oct 2021 20:39:29 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Sun, 10 Oct 2021 20:39:29 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 10 Oct 2021 20:39:28 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 1/2] vsftpd: Upgrade to 3.0.5
Date: Mon, 11 Oct 2021 11:37:44 +0800
Message-ID: <20211011033745.32284-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211011033745.32284-1-changqing.li@windriver.com>
References: <20211011033745.32284-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 03:39:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93213

From: Mingli Yu <mingli.yu@windriver.com>

Drop 2 seccomp patches as seccomp sandbox policy tweaks in new version [1].

[1] https://security.appspot.com/vsftpd/Changelog.txt

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-allow-newfstatat-and-pselect6-sysca.patch | 51 -------------------
 ...llow-syscalls-in-the-seccomp-sandbox.patch | 46 -----------------
 ...-with-musl-which-does-not-have-utmpx.patch |  0
 .../makefile-destdir.patch                    |  0
 .../makefile-libs.patch                       |  0
 .../makefile-strip.patch                      |  0
 .../nopam-with-tcp_wrappers.patch             |  0
 .../nopam.patch                               |  0
 .../vsftpd-2.1.0-filter.patch                 |  0
 .../vsftpd-tcp_wrappers-support.patch         |  0
 .../{vsftpd_3.0.3.bb => vsftpd_3.0.5.bb}      |  5 +-
 11 files changed, 1 insertion(+), 101 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/makefile-destdir.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/makefile-libs.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/makefile-strip.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/nopam-with-tcp_wrappers.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/nopam.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/vsftpd-2.1.0-filter.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/vsftpd-tcp_wrappers-support.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd_3.0.3.bb => vsftpd_3.0.5.bb} (93%)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch
deleted file mode 100644
index 29ce85cc1..000000000
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 7bc261076ec94efa3197beaca39eba095d162b5e Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Fri, 26 Feb 2021 16:32:27 +0800
-Subject: [PATCH] seccompsandbox.c: allow newfstatat and pselect6 syscalls in
- the seccomp sandbox
-
-Allow newfstatat and pselect6 in the seccomp sanbox for glibc 2.33.
-
-Fixes the following OOPS error:
-root@qemux86-64:~# tnftp 192.168.1.1
-Connected to 192.168.1.1.
-220 (vsFTPd 3.0.3)
-Name (192.168.1.1:root): anonymous
-331 Please specify the password.
-Password:
-230 Login successful.
-Remote system type is UNIX.
-Using binary mode to transfer files.
-ftp> ls
-OOPS: priv_sock_get_cmd
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- seccompsandbox.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/seccompsandbox.c b/seccompsandbox.c
-index 377c50e..f601241 100644
---- a/seccompsandbox.c
-+++ b/seccompsandbox.c
-@@ -267,6 +267,7 @@ seccomp_sandbox_setup_data_connections()
-                        3, IPPROTO_TCP);
-   allow_nr(__NR_bind);
-   allow_nr(__NR_select);
-+  allow_nr(__NR_pselect6);
-   if (tunable_port_enable)
-   {
-     allow_nr(__NR_connect);
-@@ -411,6 +412,7 @@ seccomp_sandbox_setup_postlogin(const struct vsf_session* p_sess)
-   allow_nr(__NR_getdents);
-   allow_nr(__NR_getdents64);
-   allow_nr(__NR_sysinfo);
-+  allow_nr(__NR_newfstatat);
-   /* Misc */
-   allow_nr(__NR_umask);
- 
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch
deleted file mode 100644
index 7573c967f..000000000
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From dd353303f62d1dfe32cb000e482616b021708fbe Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 29 Nov 2018 00:47:34 -0800
-Subject: [PATCH] vsftpd: allow syscalls in the seccomp sandbox
-
-* Allow sysinfo() and getdents64 in the seccomp
-  sandbox otherwise comes below OOPS: priv_sock_get_cmd
-  as the syscall sysinfo() and getdents64 not allowed
-
-root@qemux86-64:~# tnftp 192.168.1.1
-Connected to 192.168.1.1.
-220 (vsFTPd 3.0.3)
-Name (192.168.1.1:root): anonymous
-331 Please specify the password.
-Password:
-230 Login successful.
-Remote system type is UNIX.
-Using binary mode to transfer files.
-ftp> prompt
-Interactive mode off.
-ftp> mget small*
-OOPS: priv_sock_get_cmd
-
-Upstream-Status: Pending
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- seccompsandbox.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/seccompsandbox.c b/seccompsandbox.c
-index 2c350a9..377c50e 100644
---- a/seccompsandbox.c
-+++ b/seccompsandbox.c
-@@ -409,6 +409,8 @@ seccomp_sandbox_setup_postlogin(const struct vsf_session* p_sess)
-   allow_nr(__NR_getcwd);
-   allow_nr(__NR_chdir);
-   allow_nr(__NR_getdents);
-+  allow_nr(__NR_getdents64);
-+  allow_nr(__NR_sysinfo);
-   /* Misc */
-   allow_nr(__NR_umask);
- 
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-destdir.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-destdir.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-libs.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-libs.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-strip.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-strip.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam-with-tcp_wrappers.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam-with-tcp_wrappers.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-2.1.0-filter.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-2.1.0-filter.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-tcp_wrappers-support.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-tcp_wrappers-support.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
similarity index 93%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
rename to meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
index 024b776de..192f8de33 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
@@ -18,11 +18,9 @@ SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
            file://volatiles.99_vsftpd \
            file://vsftpd.service \
            file://vsftpd-2.1.0-filter.patch \
-           file://0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://vsftpd-tcp_wrappers-support.patch', '', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '${NOPAM_SRC}', d)} \
            file://0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch \
-           file://0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch \
            "
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/v/vsftpd/"
@@ -31,8 +29,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.orig\.tar"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
                         file://COPYRIGHT;md5=04251b2eb0f298dae376d92454f6f72e \
                         file://LICENSE;md5=654df2042d44b8cac8a5654fc5be63eb"
-SRC_URI[md5sum] = "da119d084bd3f98664636ea05b5bb398"
-SRC_URI[sha256sum] = "9d4d2bf6e6e2884852ba4e69e157a2cecd68c5a7635d66a3a8cf8d898c955ef7"
+SRC_URI[sha256sum] = "26b602ae454b0ba6d99ef44a09b6b9e0dfa7f67228106736df1f278c70bc91d3"
 
 
 PACKAGECONFIG ??= "tcp-wrappers"
-- 
2.17.1


