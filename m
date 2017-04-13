Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3BC77E92
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:54 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 63so387081pgh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yS6JnvUJCNZ8L5D+kdTbl0T2/cSjMgi3mYXgJe3RWYE=;
	b=AC+z1b4TCxuGxGKEV29P+gg8DKNs8ZkKAygju3fQqw1HijB4udACngNfwAc09yQwyo
	/wA3zl6dhVDREn8CopV+CrUp0rN1BsD3ND4JpoxrVyw0bNGW+mpuGn6W72jjxUAGHurr
	a3i4hHdTt6h7nFZuv0tEPbljcwoXXAn0aVzwjW2kjhcH3b2jziQsStheAK6hZXgoBhaF
	mk+PKU/JtkhcZSrwwl+882ijBuh5oCz3rK+btFbXn+uJoLYtPGHIIW2+bNXn7k9G9Rww
	aFGnBM1/NCnutfhlx2aotMJSWImegdmXLX1UalnhtfZNtnoTlmUoX5o7yO5rtNFvaivC
	CMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yS6JnvUJCNZ8L5D+kdTbl0T2/cSjMgi3mYXgJe3RWYE=;
	b=G14ECjaR8D+IcHPdR1/sPTKdsxR2DrYoTzlWKxfyHFRBd+GFRiOmtmRFaS0mOtfy9J
	Dl2IOresX/VdSqOcPKMJo45YflpfjrqwvyKDPB57w235sG4DxC11fAk4tPIj0780I2jp
	TmVU2oYsKUOIGxxYA3a0L0WSjbCcuTvNyHgeiwSuvSelzF8lfaCnKlFEzq/RK7TPyxCl
	rNOANn/mWA2sRFK+bx8mQcpjIKMjR8FE5WnYOErtjQIeUZh++tKZlUxTCB9vOxPqQqtZ
	guhcPfGE2pzRCcOOLq5jLb43k1oX5JE8u1Nl0ECD4FsjlJ5yHd3YXQr9gZzyBiy6dGzi
	Cy6g==
X-Gm-Message-State: AN3rC/6siNIPaSJkB+Z5oh+HoHu7AVU4nmW7pkHIo/Iloilk6uTDPQE6
	1S0L+WGID4tM+woF
X-Received: by 10.84.224.70 with SMTP id a6mr5402886plt.25.1492116116142;
	Thu, 13 Apr 2017 13:41:56 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:41:02 -0700
Message-Id: <20170413204106.30679-25-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-oe][ 25/29] libutempter: Fix build with musl
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libutempter/libutempter.bb |  4 +-
 .../libutempter-remove-glibc-assumption.patch      | 81 ++++++++++++++++++++++
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libutempter/libutempter/libutempter-remove-glibc-assumption.patch

diff --git a/meta-oe/recipes-support/libutempter/libutempter.bb b/meta-oe/recipes-support/libutempter/libutempter.bb
index 0282ba500..8c84cb376 100644
--- a/meta-oe/recipes-support/libutempter/libutempter.bb
+++ b/meta-oe/recipes-support/libutempter/libutempter.bb
@@ -11,7 +11,9 @@ SRCREV = "3ef74fff310f09e2601e241b9f042cd39d591018"
 PV = "1.1.6-alt2+git${SRCPV}"
 
 SRC_URI = "git://git.altlinux.org/people/ldv/packages/libutempter.git \
-    file://0001-Fix-macro-error.patch"
+           file://0001-Fix-macro-error.patch \
+           file://libutempter-remove-glibc-assumption.patch \
+          "
 
 S = "${WORKDIR}/git/${BPN}"
 
diff --git a/meta-oe/recipes-support/libutempter/libutempter/libutempter-remove-glibc-assumption.patch b/meta-oe/recipes-support/libutempter/libutempter/libutempter-remove-glibc-assumption.patch
new file mode 100644
index 000000000..6ed93355b
--- /dev/null
+++ b/meta-oe/recipes-support/libutempter/libutempter/libutempter-remove-glibc-assumption.patch
@@ -0,0 +1,81 @@
+diff -Naur libutempter-1.1.6.orig/utempter.c libutempter-1.1.6/utempter.c
+--- libutempter-1.1.6.orig/utempter.c	2010-11-04 13:14:53.000000000 -0400
++++ libutempter-1.1.6/utempter.c	2014-06-20 16:37:09.762403323 -0400
+@@ -34,13 +34,7 @@
+ #include <sys/stat.h>
+ #include <utmp.h>
+ 
+-#ifdef __GLIBC__
+ # include <pty.h>
+-#elif defined(__FreeBSD__)
+-# include <libutil.h>
+-#else
+-# error Unsupported platform
+-#endif /* __GLIBC__ || __FreeBSD__ */
+ 
+ #define	DEV_PREFIX	"/dev/"
+ #define	DEV_PREFIX_LEN	(sizeof(DEV_PREFIX)-1)
+@@ -106,17 +100,12 @@
+ 
+ static int
+ write_uwtmp_record(const char *user, const char *term, const char *host,
+-#ifdef __GLIBC__
+ 		   pid_t pid,
+-#endif
+ 		   int add)
+ {
+ 	struct utmp ut;
+ 	struct timeval tv;
+-
+-#ifdef __GLIBC__
+ 	size_t offset;
+-#endif
+ 
+ 	memset(&ut, 0, sizeof(ut));
+ 
+@@ -128,8 +117,6 @@
+ 	if (host)
+ 		strncpy(ut.ut_host, host, sizeof(ut.ut_host));
+ 
+-#ifdef __GLIBC__
+-
+ 	offset = (strlen(term) <= sizeof(ut.ut_id)) ? 0 :
+ 			strlen(term) - sizeof(ut.ut_id);
+ 	strncpy(ut.ut_id, term + offset, sizeof(ut.ut_id));
+@@ -156,27 +143,6 @@
+ 
+ 	(void) updwtmp(_PATH_WTMP, &ut);
+ 
+-#elif defined(__FreeBSD__)
+-
+-	ut.ut_time = tv.tv_sec;
+-
+-	if (add)
+-	{
+-		login(&ut);
+-	} else
+-	{
+-		if (logout(term) != 1)
+-		{
+-#ifdef	UTEMPTER_DEBUG
+-			fprintf(stderr, "utempter: logout: %s\n",
+-				strerror(errno));
+-#endif
+-			exit(EXIT_FAILURE);
+-		}
+-	}
+-
+-#endif /* __GLIBC__ || __FreeBSD__ */
+-
+ #ifdef	UTEMPTER_DEBUG
+ 	fprintf(stderr,
+ 		"utempter: DEBUG: utmp/wtmp record %s for terminal '%s'\n",
+@@ -255,8 +221,6 @@
+ 	validate_device(device);
+ 
+ 	return write_uwtmp_record(pw->pw_name, device + DEV_PREFIX_LEN, host,
+-#ifdef __GLIBC__
+ 				  pid,
+-#endif
+ 				  add);
+ }
-- 
2.12.2


