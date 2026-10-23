Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1641.1792738436260906967
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kl3OKmrF;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-89f639ba307so233501b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738436; x=1793343236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EouuQfs5jnD+w+a4qhPdFvhaV9Yxy0QefF8tsM5xpUw=;
        b=Kl3OKmrFGSk62hOkuuB0yWD8ls7+oALhL9UOXyMcszFE7yKs42e0lLqdjY1D3stoe/
         D+bG8Xzey1aN8ZkoTizbEZATg4jRKE6wjXorQ3Qyxkx/cAn/IexjwxjZ1t/AsSmkK+5/
         Y4d78mkHQL21hA0wiqe8Wrj2DMSvCPa3TikI1BMNRa+u1DnFw8b0iRmkA9iz+5AEKHaq
         DiZk8OTYYOA2vLQT9RBhfM1L7FzuDQqX6/AkO8VTcXJNhGTmazPZa7FftP/YnEdACotS
         D5gym8gmgfkix/+JPx2GSu1a/IpDab7WQQyAzd0vB3SkC5woOfSnN7ViAcW/f5MqrSWf
         yvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738436; x=1793343236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EouuQfs5jnD+w+a4qhPdFvhaV9Yxy0QefF8tsM5xpUw=;
        b=PF2am1UNJJd5aSKA4L7J4iKa1ZkQakW3qA8mtTggZukebflFeXbXfNauIcj+fyENP9
         NdtxabdcNojVY9+Qn6/zJ7oE/GB156IYImPLQc57ClqH/dARgqIKpkmcXnm4O7ZrpckP
         8fqN+e4SM85eP5+3LgU+5ojULNCNn+Rumki6n62VDCLmKDXywOnGl5WQ7Vimt4FUacJD
         2TB2BpCSomqxn+HxsJcLNdEG+n3JDkmtFrv3pdJCq4tNE22m6xhx77sNAPFvWhDWaauH
         +Xs4NWDWmmjUSlsdFppNKyN5GLyTjC7dud7pklgoCmHKprW5ORbsabYDETfL04DDkKq9
         3/Hw==
X-Gm-Message-State: AFq9FYKytYzqe59z2hl/zzS/HRqwjCjVqQLLqw0N3ismTEZJfTQNr7On
	jdspVtMwd1VNzM86peE/TXVeJfVQwbvFZByqBpT2u1awiiwXJK7LlpeLurogRq7cYck=
X-Gm-Gg: AYBFou2cQzqImoQfxnOPnv38ygVk/9Hn9u2bHbFpxBJqfvdswsiYwq0QMUL7IBZ10Lr
	Xc618QJiYrXi1WJUzCGhjgF1+Bb5vkebc2aAVEtTlSHDnCCXcJBXHPASD0w+qn+Zso/u/38THIw
	HMqSC+N+zqE8Gnbvrdv2M7nICdZsnx/nNbeNA6xmPNqBbHA5NHhxm4kKJ429aF2/ZB3WROnJacA
	ey59nLS/2eANw6lC6vKRr49iZ5K2t2yf9GQCFrFnrGxbbrCu+MSLc3rich+ULB2k31wiI1MRVL5
	iTihzdG135Qnfj3Xlc78gJudira2KVIs61hSea4LCc8PgDNPAymQj2K7nVSrteX98WW3ypJQBrg
	S5JBrYGR23ZndMpS85U1hRPVnxfkCYrKJEfnkTucriR5MmHHVVW67FV47Q6ZYDYltQF+2Q/GCtu
	iCWd1YDb2sBshORcifsgFgSxSZXYTZhJvqI5JluQpBHzbhGI2CTo3f86UDeMG/YbIhjeQMS23M/
	zAHZn2JGsh05Lag0OD8jGmh54XpcBtLptO50SGO1g3ZxTYcCRsx4DbK0m7QGyCltzmyhCDYt/7e
	F3YO+YxrA2HoLyLsGu9HEhJjoz54H8FzHKO26qXl+ztwd0C7wytFu7KWUO5coz3hBkmbxRuOF7g
	6fnlwOKUu7K2b3w+0A/I01M+UOJJk7rS5RovN+DpM/VQae3G5PGlKlo2KN1riGVQ+EQYLmSv0hc
	VJazNruBc2Ot4Z52T4U0AKSeWuBXSfAiUva/VmyXgTblLRJYJ798CW4uIvuhAi6dQy5uv/Vz3P+
	0w8bbZ/lgkF8G39k0eBvKMmW51dJcKWLgK/Kj+VpMoSjLcDyE9d
X-Received: by 2002:a05:6a21:890b:b0:3e2:978e:2753 with SMTP id adf61e73a8af0-3e36a0d136cmr825867637.16.1792738435461;
        Thu, 22 Oct 2026 23:53:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:53:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 02/29] ntp: Use time_t for the stime() argument
Date: Thu, 22 Oct 2026 23:53:23 -0700
Message-ID: <20261023065350.3228996-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131326
Content-Type: text/plain; charset="utf-8"

ntp_set_tod() passes a long to stime(), which fails to build on 32-bit
targets with a 64-bit time_t, e.g. riscv32 with clang:

  libntp/machines.c:483:14: error: incompatible pointer types passing
  'long *' to parameter of type 'const time_t *'

Add a patch to use time_t unless the system declares stime() with a
long (DECL_STIME_1), so the argument matches the prototype in use on
every architecture.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...tp-Use-time_t-for-the-stime-argument.patch | 42 +++++++++++++++++++
 .../recipes-support/ntp/ntp_4.2.8p18.bb       |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/0001-libntp-Use-time_t-for-the-stime-argument.patch

diff --git a/meta-networking/recipes-support/ntp/ntp/0001-libntp-Use-time_t-for-the-stime-argument.patch b/meta-networking/recipes-support/ntp/ntp/0001-libntp-Use-time_t-for-the-stime-argument.patch
new file mode 100644
index 0000000000..0779663159
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/0001-libntp-Use-time_t-for-the-stime-argument.patch
@@ -0,0 +1,42 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 20 Oct 2026 21:30:00 -0700
+Subject: [PATCH] libntp: Use time_t for the stime() argument
+
+ntp_set_tod() passes a long to stime(), which is declared as
+stime(const time_t *) everywhere except on systems where configure sets
+DECL_STIME_1 (stime(long *)). That only works when time_t and long have
+the same size. 32-bit targets with a 64-bit time_t, such as riscv32 or
+any 32-bit target built with _TIME_BITS=64, break:
+
+  libntp/machines.c:483:14: error: incompatible pointer types passing
+  'long *' to parameter of type 'const time_t *' (aka 'const long long *')
+
+Use time_t unless the system declares stime() with a long, so the
+argument always matches the prototype in use.
+
+Upstream-Status: Submitted [https://github.com/ntp-project/ntp/pull/35]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ libntp/machines.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+--- a/libntp/machines.c
++++ b/libntp/machines.c
+@@ -477,7 +477,17 @@
+ #endif /* HAVE_SETTIMEOFDAY */
+ #ifdef HAVE_STIME
+ 	if (rc && (SET_TOD_STIME == tod || !tod)) {
++		/*
++		 * stime() takes a time_t pointer except on systems
++		 * that declare it with a long (DECL_STIME_1).  time_t
++		 * may be wider than long, e.g. on 32-bit targets with
++		 * 64-bit time_t, so match the prototype in use.
++		 */
++#ifdef DECL_STIME_1
+ 		long tp = tvp->tv_sec;
++#else
++		time_t tp = tvp->tv_sec;
++#endif
+
+ 		errno = 0;
+ 		rc = stime(&tp); /* lie as bad as SysVR4 */
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
index 8479b6ce12..6fd5e528bf 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://0001-colcomp-sntp-libpkgver-colcomp.c-Convert-K-R-functio.patch \
            file://0001-Makefile.am-Don-t-build-deprecated-ntpdate.patch \
            file://0001-ntp_crypto-use-the-ASN1_STRING-accessors.patch \
+           file://0001-libntp-Use-time_t-for-the-stime-argument.patch \
            file://ntpd \
            file://ntp.conf \
            file://ntpd.service \
