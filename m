Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wj0-f174.google.com (mail-wj0-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 78D6D6FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 06:42:00 +0000 (UTC)
Received: by mail-wj0-f174.google.com with SMTP id c11so167402437wjx.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 22:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=t3fl/uYNzro28blhfvMnT4SzHB82tmuHaWRnNZypQF4=;
	b=MDJxRrgAqcT0zzhbqBYo/6vQtUsI4qvzIngGQ55zLnpV8upBpHShZ2FQNB5hDhyhYe
	Pon27zqAxxuhVsKEadhT+LhhD8A3ZTF4HG2NP13DxDX1AArd88jJSYX6NIyLXD2+dTD5
	Qj8R6e9j/QLlbw4iVz5N/qletQ15MtT+lTei4xTYlfyeCBEsXIseOOGLa6QnVph++t1t
	NqSrNlU7B6dID4XYNRw4M9pgbN78vLF0ZknCVivT8+D8afJI9OEDiKfPM+QBOnOR0HkB
	VfzxzTfWrcvTSgOSgNOexGXhIsOzDjiX6SgJa42t6YJA0z4wJDi974hEQ3PJFN9FZ7j/
	OY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t3fl/uYNzro28blhfvMnT4SzHB82tmuHaWRnNZypQF4=;
	b=qMvfwGhr+VW82Fkm5eTS0Su7IpqwTSRfjX4njTzY01Wt/PD3R3yp7bFjx/kplYXXfJ
	QaZlJ6cnfqi1Gc4XNpLcl4K6dJAW8rUJPC6No0/vi3u5J8dljy9yliNrx2IB6J3qokgA
	am8duxx7HR8pjuOf9UgdsRv5cqkwPx+XirPgJtReLCJooivq8Jf478JU01zy+bIH1CQS
	aJjEafb4MFcyQim8SCbNxSTIhn9daRKZuXN/hQcwO46JawceH9YRhNCrF3nRGORfabuF
	4tbjamn2ZycaurbDw9TVrFI8aF5cISHZRanHQfAEwAmuFCRgi2l/5Tz/efGwfweTCspP
	USSQ==
X-Gm-Message-State: AIkVDXJnKj2GN78qXmjQ0mMaAoY8PR8yKN95tk+0EkTofDnNUAt7M+EAB7TrU5Ed33j5QL19
X-Received: by 10.195.2.75 with SMTP id bm11mr37583561wjd.98.1483080122017;
	Thu, 29 Dec 2016 22:42:02 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	x188sm68600110wmx.4.2016.12.29.22.42.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 22:42:01 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2016 07:41:56 +0100
Message-Id: <1483080116-31405-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] strongswan: delete obsolete patches
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
X-List-Received-Date: Fri, 30 Dec 2016 06:42:01 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../files/install-strongswan-swanctl-service.patch | 22 -------
 .../strongswan/files/support-newer-systemd.patch   | 69 ----------------------
 2 files changed, 91 deletions(-)
 delete mode 100644 meta-networking/recipes-support/strongswan/files/install-strongswan-swanctl-service.patch
 delete mode 100644 meta-networking/recipes-support/strongswan/files/support-newer-systemd.patch

diff --git a/meta-networking/recipes-support/strongswan/files/install-strongswan-swanctl-service.patch b/meta-networking/recipes-support/strongswan/files/install-strongswan-swanctl-service.patch
deleted file mode 100644
index 86baccf..0000000
--- a/meta-networking/recipes-support/strongswan/files/install-strongswan-swanctl-service.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-commit 44cbabd8a42bc2a436562ed33fb8c89fa6b75b6e
-Author: Chris Patterson <pattersonc@ainfosec.com>
-Date:   Fri Dec 18 08:31:48 2015 -0500
-
-    strongswan-swanctl.service.in: match install used by strongswan.service
-    
-    Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
-
-Upstream-Status: Submitted
-https://github.com/strongswan/strongswan/pull/25
-
-diff --git a/init/systemd-swanctl/strongswan-swanctl.service.in b/init/systemd-swanctl/strongswan-swanctl.service.in
-index 818d352..944101f 100644
---- a/init/systemd-swanctl/strongswan-swanctl.service.in
-+++ b/init/systemd-swanctl/strongswan-swanctl.service.in
-@@ -7,3 +7,6 @@ Type=notify
- ExecStart=@SBINDIR@/charon-systemd
- ExecStartPost=@SBINDIR@/swanctl --load-all --noprompt
- ExecReload=@SBINDIR@/swanctl --reload
-+
-+[Install]
-+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/strongswan/files/support-newer-systemd.patch b/meta-networking/recipes-support/strongswan/files/support-newer-systemd.patch
deleted file mode 100644
index 550cf67..0000000
--- a/meta-networking/recipes-support/strongswan/files/support-newer-systemd.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-commit 82498129e0a91dfc3ed2c4ec3b2252f44655b83c
-Author: Chris Patterson <pattersonc@ainfosec.com>
-Date:   Fri Dec 18 08:27:57 2015 -0500
-
-    configure: support systemd >= 209
-    
-    libsystemd-journal and libsystemd-daemon are now just
-    part of libsystemd.
-    
-    Keep original systemd checks as a fallback.
-    
-    Updates charon-systemd/Makefile.am accordingly.
-    
-    Tested on:
-    - debian wheezy (systemd v44)
-    - ubuntu 15.10 (systemd v255).
-    
-    Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
-
-Upstream-Status: Submitted
-https://github.com/strongswan/strongswan/pull/24
-
-diff --git a/configure.ac b/configure.ac
-index 3d71ce0..f6c0426 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -941,13 +941,17 @@ if test x$systemd = xtrue; then
- 		AC_MSG_ERROR([not found (try --with-systemdsystemunitdir)])
- 	fi
- 
--	PKG_CHECK_MODULES(systemd_daemon, [libsystemd-daemon])
--	AC_SUBST(systemd_daemon_CFLAGS)
--	AC_SUBST(systemd_daemon_LIBS)
--
--	PKG_CHECK_MODULES(systemd_journal, [libsystemd-journal])
--	AC_SUBST(systemd_journal_CFLAGS)
--	AC_SUBST(systemd_journal_LIBS)
-+	PKG_CHECK_MODULES(systemd, [libsystemd >= 209],
-+		[AC_SUBST(systemd_CFLAGS)
-+		AC_SUBST(systemd_LIBS)],
-+		[PKG_CHECK_MODULES(systemd_daemon, [libsystemd-daemon])
-+		AC_SUBST(systemd_daemon_CFLAGS)
-+		AC_SUBST(systemd_daemon_LIBS)
-+
-+		PKG_CHECK_MODULES(systemd_journal, [libsystemd-journal])
-+		AC_SUBST(systemd_journal_CFLAGS)
-+		AC_SUBST(systemd_journal_LIBS)
-+		])
- fi
- 
- if test x$tss = xtrousers; then
-diff --git a/src/charon-systemd/Makefile.am b/src/charon-systemd/Makefile.am
-index 1b9ac15..ee85d43 100644
---- a/src/charon-systemd/Makefile.am
-+++ b/src/charon-systemd/Makefile.am
-@@ -9,11 +9,11 @@ charon_systemd_CPPFLAGS = \
- 	-I$(top_srcdir)/src/libstrongswan \
- 	-I$(top_srcdir)/src/libhydra \
- 	-I$(top_srcdir)/src/libcharon \
--	$(systemd_daemon_CFLAGS) $(systemd_journal_CFLAGS) \
-+	$(systemd_CFLAGS) $(systemd_daemon_CFLAGS) $(systemd_journal_CFLAGS) \
- 	-DPLUGINS=\""${charon_plugins}\""
- 
- charon_systemd_LDADD = \
- 	$(top_builddir)/src/libstrongswan/libstrongswan.la \
- 	$(top_builddir)/src/libhydra/libhydra.la \
- 	$(top_builddir)/src/libcharon/libcharon.la \
--	$(systemd_daemon_LIBS) $(systemd_journal_LIBS) -lm $(PTHREADLIB) $(DLLIB)
-+	$(systemd_LIBS) $(systemd_daemon_LIBS) $(systemd_journal_LIBS) -lm $(PTHREADLIB) $(DLLIB)
-- 
2.7.4


