Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5D372F56
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:32 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c198so146278pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yS6JnvUJCNZ8L5D+kdTbl0T2/cSjMgi3mYXgJe3RWYE=;
	b=UUmWOHLKSfmstoMGl9iwcOcL9CIY6hT79GB6g8Ar1Ff5Fb/5tEM/JSnNkywWY4XLBN
	jiyF68tg1k1nzU5+3anhK8M6wPOreSfPlBGmORcZKc7QXrMSoW3GLxwuIkrUtxHrlCFZ
	kZAKb6vyucojBWmt+zmzxFXT93w08aR+z7De3fJgnCxmaiHv6HHYSoH/UFGAwbbsOwZx
	sUn7l3qYF3KQV8XFTHDRXiIInx1W5FBpnIyl48D03t1cySRJrjhYXuEY8Io64aGlu5Mm
	7ZtmRUUnPr84QfSLYCRph42m/f01WfdMe9L4sDgn1vRpJ/uutFhLqsQvftqO/SOexxQ0
	KnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yS6JnvUJCNZ8L5D+kdTbl0T2/cSjMgi3mYXgJe3RWYE=;
	b=byFPgConW0itaS5sX3lqqOEwyvjcd8tgpfU0YM4CWnWabuXRSwLsX9KN0iE2zEbqST
	fEcdKWhQW9q5/serjS/8si90jAFv6kQ/SbpfcGLeHT5c/dRGew4L61EC/taXhEJpAqcp
	0yNSaaYmm5UYDTNdAq/xlTaPeZRoro86LlyJpUarcLsFgZ3jZTpZJ8FjAvzr0aVeQtYd
	BtHPUbShWXo3OZMhzrM9uttj1cYoPQ7oMKa+Xf9CrZOajAaLF2EofyjiT6C5xSqhwNZ3
	koJaGjnDORkxCpBx+1Sf05un7hqNbNYHl4VoaxqPQYfOArZ4ZPToX/8047UaMXFcLj70
	Jswg==
X-Gm-Message-State: AN3rC/74RwD5tfo/1ilo8cSPrm+hJ8kWL//GBE/Eb797KZe3xQ6edqm/
	yDHdezrpmU/eWw==
X-Received: by 10.98.141.216 with SMTP id p85mr18975259pfk.195.1492539753975; 
	Tue, 18 Apr 2017 11:22:33 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:36 -0700
Message-Id: <20170418182142.27253-26-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-oe][ 26/32] libutempter: Fix build with musl
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:32 -0000

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


