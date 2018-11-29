Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6476C49B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 09:26:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAT9Q7YC004836
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Nov 2018 01:26:17 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 29 Nov 2018 01:25:57 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Thu, 29 Nov 2018 01:25:56 -0800
Message-ID: <20181129092556.124890-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] vsftpd: allow getdents64 in the seccomp sandbox
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
X-List-Received-Date: Thu, 29 Nov 2018 09:26:49 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

seccomp is activated by default in vsftpd and
this has caused compatibility issues with some
kernel versions. This was fixed as one can see
as https://bugzilla.redhat.com/show_bug.cgi?id=845980,
but can still cause issues with newer kernels with
kernel 4.18+.

And there is even a patch 0034-Turn-off-seccomp-sandbox-because-it-is-too-strict.patch
in fedora[https://dl.fedoraproject.org/pub/fedora/linux/releases/29/Everything/source/tree/Packages/v/vsftpd-3.0.3-28.fc29.src.rpm]
turning off seccomp sandbox for vsftpd by default
as below which means fedora doesn't limit the syscall
any more by default.
[snip]
 -  tunable_seccomp_sandbox = 1;
 +  tunable_seccomp_sandbox = 0;
   tunable_allow_writeable_chroot = 0;

   tunable_accept_timeout = 60;
[snip]

Refresh 0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch
to allow one more syscall getdents64 in the
seccomp sandbox apart from the previous one in
below commit:
fbffcf3f3 vsftpd: allow sysinfo() in the seccomp sandbox

before this patch:
root@qemux86-64:~# tnftp 127.0.0.1
Connected to 127.0.0.1.
220 (vsFTPd 3.0.3)
Name (127.0.0.1:root): anonymous
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> dir
229 Entering Extended Passive Mode (|||8352|)
150 Here comes the directory listing.
500 OOPS: priv_sock_get_cmd
ftp>

after this patch:
root@qemux86-64:~# tnftp 127.0.0.1
Connected to 127.0.0.1.
220 (vsFTPd 3.0.3)
Name (127.0.0.1:root): anonymous
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> dir
229 Entering Extended Passive Mode (|||22610|)
150 Here comes the directory listing.
226 Directory send OK.
ftp>

Reference: https://wiki.archlinux.org/index.php/Very_Secure_FTP_Daemon#vsftpd:_Error_500_with_kernel_4.18+

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...low-syscalls-in-the-seccomp-sandbox.patch} | 33 ++++++++++---------
 .../recipes-daemons/vsftpd/vsftpd_3.0.3.bb    |  2 +-
 2 files changed, 19 insertions(+), 16 deletions(-)
 rename meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/{0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch => 0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch} (47%)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch
similarity index 47%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch
index c6c0f80a1..7573c967f 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch
@@ -1,15 +1,13 @@
-From 9c4826c19f04da533886209361a2caddf582d65c Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Tue, 6 Sep 2016 17:17:44 +0800
-Subject: [PATCH] vsftpd: allow sysinfo() in the seccomp sandbox
+From dd353303f62d1dfe32cb000e482616b021708fbe Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 29 Nov 2018 00:47:34 -0800
+Subject: [PATCH] vsftpd: allow syscalls in the seccomp sandbox
 
-Upstream-Status: Pending
-
-* Allow sysinfo() in the seccomp sandbox otherwise
-  comes below OOPS: priv_sock_get_cmd as the syscall
-  sysinfo() not allowed
+* Allow sysinfo() and getdents64 in the seccomp
+  sandbox otherwise comes below OOPS: priv_sock_get_cmd
+  as the syscall sysinfo() and getdents64 not allowed
 
-tnftp 192.168.1.1
+root@qemux86-64:~# tnftp 192.168.1.1
 Connected to 192.168.1.1.
 220 (vsFTPd 3.0.3)
 Name (192.168.1.1:root): anonymous
@@ -23,21 +21,26 @@ Interactive mode off.
 ftp> mget small*
 OOPS: priv_sock_get_cmd
 
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+Upstream-Status: Pending
 
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- seccompsandbox.c | 1 +
- 1 file changed, 1 insertion(+)
+ seccompsandbox.c | 2 ++
+ 1 file changed, 2 insertions(+)
 
 diff --git a/seccompsandbox.c b/seccompsandbox.c
-index 2c350a9..67d9ca5 100644
+index 2c350a9..377c50e 100644
 --- a/seccompsandbox.c
 +++ b/seccompsandbox.c
-@@ -409,6 +409,7 @@ seccomp_sandbox_setup_postlogin(const struct vsf_session* p_sess)
+@@ -409,6 +409,8 @@ seccomp_sandbox_setup_postlogin(const struct vsf_session* p_sess)
    allow_nr(__NR_getcwd);
    allow_nr(__NR_chdir);
    allow_nr(__NR_getdents);
++  allow_nr(__NR_getdents64);
 +  allow_nr(__NR_sysinfo);
    /* Misc */
    allow_nr(__NR_umask);
  
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
index 2e3e0e884..df0d7f455 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
            file://volatiles.99_vsftpd \
            file://vsftpd.service \
            file://vsftpd-2.1.0-filter.patch \
-           file://0001-vsftpd-allow-sysinfo-in-the-seccomp-sandbox.patch \
+           file://0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://vsftpd-tcp_wrappers-support.patch', '', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '${NOPAM_SRC}', d)} \
            file://0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch \
-- 
2.17.1


