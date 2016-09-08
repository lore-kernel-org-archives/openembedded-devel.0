Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 968DC77087
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Sep 2016 06:00:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8860j6b007475
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Sep 2016 23:00:45 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 7 Sep 2016 23:00:44 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Sep 2016 13:58:15 +0800
Message-ID: <1473314295-13816-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] vsftpd: allow sysinfo() in the seccomp sandbox
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
X-List-Received-Date: Thu, 08 Sep 2016 06:00:45 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Allow sysinfo() in the seccomp sandbox otherwise
  comes below OOPS: priv_sock_get_cmd as the syscall
  sysinfo() not allowed

tnftp 192.168.1.1
Connected to 192.168.1.1.
220 (vsFTPd 3.0.3)
Name (192.168.1.1:root): anonymous
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> prompt
Interactive mode off.
ftp> mget small*
OOPS: priv_sock_get_cmd

* use "strace -ff /usr/sbin/vsftpd" to track in both
  seccomp sandbox on and seccomp sandbox off (add
  seccomp_sandbox=NO in /etc/vsftpd.conf) scenarios when
  type the commands at ftp client as above, the ftp
  connection at server side ends up each time with SIGSYS when
  call sysinfo() syscall in seccomp sandbox on case,
  so we need to add sysinfo() in the seccomp sandbox if
  still use seccomp sandbox for vsftpd

* The issue still exists in other distribution, Please
  check https://bugzilla.redhat.com/show_bug.cgi?id=845980 for details

  And check ftp://195.220.108.108/linux/fedora/linux/updates/\
  24/SRPMS/p/proftpd-1.3.5b-2.fc24.src.rpm for fedora, there
  is even a patch vsftpd-3.0.2-seccomp.patch as below to turn off
  seccomp sandbox for vsftpd by default which also means fedora
  doesn't limit the syscall any more by default.

  From dd86a1c28f11fa67b1263d5dc79fa9953629d30d Mon Sep 17 00:00:00 2001
  From: Martin Sehnoutka <msehnout@redhat.com>
  Date: Fri, 8 Apr 2016 15:03:16 +0200
  Subject: [PATCH 1/7] vsftpd-3.0.2-seccomp

  ---
  tunables.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

  diff --git a/tunables.c b/tunables.c
  index 93f85b1..b024be4 100644
  --- a/tunables.c
  +++ b/tunables.c
  @@ -232,7 +232,7 @@ tunables_load_defaults()
    tunable_isolate_network = 1;
    tunable_ftp_enable = 1;
    tunable_http_enable = 0;
 -  tunable_seccomp_sandbox = 1;
 +  tunable_seccomp_sandbox = 0;
    tunable_allow_writeable_chroot = 0;

    tunable_accept_timeout = 60;

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...ftpd-allow-sysinfo-in-the-seccomp-sandbox.patch | 45 ++++++++++++++++++++++
 .../recipes-daemons/vsftpd/vsftpd_3.0.3.bb         |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch
new file mode 100644
index 0000000..7accbbc
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch
@@ -0,0 +1,45 @@
+From 37cc924363515c8c309944c455bcbba7ddcc8eda Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Tue, 6 Sep 2016 17:17:44 +0800
+Subject: [PATCH] vsftpd: allow sysinfo() in the seccomp sandbox
+
+Upstream-Status: Pending
+
+* Allow sysinfo() in the seccomp sandbox otherwise
+  comes below OOPS: priv_sock_get_cmd as the syscall
+  sysinfo() not allowed
+
+tnftp 192.168.1.1
+Connected to 192.168.1.1.
+220 (vsFTPd 3.0.3)
+Name (192.168.1.1:root): anonymous
+331 Please specify the password.
+Password:
+230 Login successful.
+Remote system type is UNIX.
+Using binary mode to transfer files.
+ftp> prompt
+Interactive mode off.
+ftp> mget small*
+OOPS: priv_sock_get_cmd
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ seccompsandbox.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/seccompsandbox.c b/seccompsandbox.c
+index 2c350a9..67d9ca5 100644
+--- a/seccompsandbox.c
++++ b/seccompsandbox.c
+@@ -409,6 +409,7 @@ seccomp_sandbox_setup_postlogin(const struct vsf_session* p_sess)
+   allow_nr(__NR_getcwd);
+   allow_nr(__NR_chdir);
+   allow_nr(__NR_getdents);
++  allow_nr(__NR_sysinfo);
+   /* Misc */
+   allow_nr(__NR_umask);
+ 
+-- 
+2.8.1
+
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
index e398799..3eaaa30 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
            file://volatiles.99_vsftpd \
            file://vsftpd.service \
            file://vsftpd-2.1.0-filter.patch \
+           file://0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
-- 
2.8.1


