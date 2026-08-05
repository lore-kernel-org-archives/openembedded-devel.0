Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE35C55ABF
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 21:26:21 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6225.1785965178126920463
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 14:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VWV/M/Ci;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so1341250a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 14:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785965177; x=1786569977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hp5VsKYh5uUkzqNQC5HtFslW1Dv7Zd9auz0nVetuLVA=;
        b=VWV/M/CioorEUE55yLeeNsTPpcFX0HF1Vl2Fgqm/YULyimI3XSn0GhFkB9m+y+Y93R
         MxJfVAgOQTflZPIjjoJd48dnM9I2tY6CSKCO9cI1OAwLuj+u6I8aHGDvj2PI7plqyWlW
         gWFCCOMBqVY3EepdvGTArecePwfLdwve47vgBhFU9tUEUyvTbJsTs0XPmd2UE0+4y4sp
         RzLCFzCgYg3sM8c/ujzar56dDfeUbxrmqF3AT8UQbLTh6LkoAopciUiOi+fSq9sfqTX1
         nh9lJeBbmjzI4dBB3dIuQZ6elAI70gv6VipS1Rj2A79w5seTDBSZHH9we1GA4kqmUkKJ
         SknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785965177; x=1786569977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hp5VsKYh5uUkzqNQC5HtFslW1Dv7Zd9auz0nVetuLVA=;
        b=bT9U24M0kF3uUt/N6s1UHTErQ8+6/2Z2qy69kV61jc6WkyCqixZCkediEInfaBogyZ
         e6lH0fFnff3XQEb5v2tmBqKCyfLT0QF9Z92la2bYFlLjW9UbKJEjCzd52aOSb2FKE5JF
         Xd4VRbIn0tnxGk3qdgHsWsLuOiTWMlHF+a8U8+Xkxi50+0jhpmgOCas/9glc4nF6s6Km
         pQIVHYTGbiJsrxa9cOK4nF6qLfHXqkH9T18uCnNdu+qCusMHj2c2ZgAV/qP3x14/rxjl
         1QodJwGuePGbLrh+XhiEj+BNNy1aEwatIr8vlJ8t55AsGHZyAoFXo01vVaGCE4k6dhxj
         TXSQ==
X-Gm-Message-State: AOJu0YwwvkhQKmMOXkFWpVDIrt0ctbMy3v0Ng9URG0iLUEEyvEg6cfIT
	rBVYA/tiEjDFYRJZgCCm6glQ4YWnWSELRAjr7mM0iQ4hPf+BvP9oz+qX8bktLZk/
X-Gm-Gg: AR+sD12s0Vp607pA2UQGVA+dB9+XGWNHJTtYj1NjdniTd9518ojbTIYPJocmz5mlJ1a
	KY1CR3gcBJ+EeP65HIXv5CAoc8ugQy+5d2O6mpNMBu+mOPF5w7yfkBvqx08uNS1aX3fuXBRyLHL
	HXgO5K1BABB62PzbbQMUpLGQweAu1iInD2CgrKR5fisNZTGWthRivhvTiu3ZWRFS0bsNXPA2s1F
	BP+SoimjZzQE6qi9ShmBUC6vAMmaPVdL6pvq9BAQGcHTJ223z5fUebkeVYD9gxXU+Jj8reRdgZa
	kqOHZwSMNCnytxMmZqhGrZbPZETHR9pbJ8Y69nY91hgGgKwXV2m1YFMwT3BAWX0R9P+7U2+LVOf
	BueMpO5gFSw8QAxOoIyb+HY8HLcUxSh1cpZNTf47YkRJ8IlrVaCPRC1IX+l8RJb2bvQ44ZBFhwX
	t3U8bNNDOIyGn6pDmO+vgeppbKyOCbSv9ZKgSj3haYzAFl7lxK3VWg5tMP1u2WlZRqpLyRw8kdK
	jtMyB/yaJdQ0bV6Y7fSjpGLVnZoUSZyVxR5THLDLcSo50JaZiPfaC2MKse9I6HIGJM1irX6Zwgk
	HGk+VhOG+EHkSgGGPvTOUAd67Tc/EnRVeHgFHC2cJLfjP6uXP2Aed1GP3KLtUDn0IUHO/WEko8g
	7cg==
X-Received: by 2002:a05:6a20:6a08:b0:3c3:859b:9178 with SMTP id adf61e73a8af0-3cb85f508cemr11379064637.34.1785965177229;
        Wed, 05 Aug 2026 14:26:17 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be4dsm25585093eec.16.2026.08.05.14.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 14:26:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 2/3] net-snmp: Backport upstream fix for explicit library linking
Date: Wed,  5 Aug 2026 14:26:11 -0700
Message-ID: <20260805212612.1351211-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805212612.1351211-1-khem.raj@oss.qualcomm.com>
References: <20260805212612.1351211-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 21:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128824

libnetsnmptrapd uses symbols that live in libnetsnmpagent, but
apps/Makefile.in only passes $(MIBLIB) and $(USELIBS) to the link. That
works with GNU ld, which resolves symbols through the DT_NEEDED entries
of the libraries named on the command line, and libnetsnmpmibs records a
dependency on libnetsnmpagent. lld deliberately does not, so the link
fails:

| ld.lld: error: undefined symbol: init_vacm_config_tokens
| >>> referenced by snmptrapd_auth.c:51
| >>>               .libs/snmptrapd_auth.o:(init_netsnmp_trapd_auth)
| ld.lld: error: undefined symbol: send_v2trap
| >>> referenced by snmptrapd_handlers.c:886
| >>>               .libs/snmptrapd_handlers.o:(axforward_handler)

Backport upstream commit 5e66246bd994 which names $(AGENTLIB) explicitly
and additionally links libcrypto into libnetsnmpmibs and the apps, both
of which rely on the same transitive resolution. The libnetsnmptrapd.la
hunk is rebased because 5.9.5.2 still puts $(LDFLAGS) at the end of that
link command.

Verified on aarch64 for qemuarm64: do_compile fails before the change
with the errors above; after it do_compile and do_package succeed and
libnetsnmptrapd.so records DT_NEEDED on libnetsnmpmibs, libnetsnmpagent
and libnetsnmp directly.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...akefile.in-Link-libraries-explicitly.patch | 103 ++++++++++++++++++
 .../net-snmp/net-snmp_5.9.5.2.bb              |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0012-apps-Makefile.in-Link-libraries-explicitly.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0012-apps-Makefile.in-Link-libraries-explicitly.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0012-apps-Makefile.in-Link-libraries-explicitly.patch
new file mode 100644
index 0000000000..5129282ef2
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0012-apps-Makefile.in-Link-libraries-explicitly.patch
@@ -0,0 +1,103 @@
+From 5e66246bd994a2f693bd02773823691c8d07a070 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Fri, 24 Jul 2026 09:34:18 -0700
+Subject: [PATCH] apps/Makefile.in: Link libraries explicitly
+
+When building Net-SNMP with -no-undefined (which is used for libraries like
+libnetsnmpmibs.la and libnetsnmptrapd.la) and link_all_deplibs=no (default on
+modern systems to prevent overlinking), compilation fails due to undefined
+references to symbols from transitive dependencies.
+
+1. libnetsnmpmibs.la fails to link because it uses OpenSSL DH/BN symbols
+   (when snmp-usm-dh-objects-mib is enabled) but does not link with
+   libcrypto directly. Fix this by adding LIBCRYPTO to LMIBLIBS in
+   configure if OpenSSL is used, and exporting LIBCRYPTO.
+
+2. libnetsnmptrapd.la fails to link because it uses symbols from
+   libnetsnmpagent.la (like vacm_check_view_contents) but does not link with
+   it directly. Fix this by adding $(AGENTLIB) to libnetsnmptrapd.la link
+   line in apps/Makefile.in.
+
+3. Executables in apps/ (like snmpusm and snmptls) fail to link because
+   they use OpenSSL symbols directly but do not link with libcrypto/libssl
+   directly. Fix this by adding @LIBCRYPTO@ to LIBS in apps/Makefile.in.
+
+This makes Net-SNMP compatible with newer versions of libtool.
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/5e66246bd994a2f693bd02773823691c8d07a070]
+
+The libnetsnmptrapd.la hunk is rebased: 5.9.5.2 still puts $(LDFLAGS) at
+the end of that link command, upstream has since moved it before
+$(LLIBTRAPD_OBJS). The change itself is unmodified.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ apps/Makefile.in            | 4 ++--
+ configure                   | 7 +++++++
+ configure.d/config_os_libs2 | 6 ++++++
+ 3 files changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/apps/Makefile.in b/apps/Makefile.in
+index 57b8524..252fd84 100644
+--- a/apps/Makefile.in
++++ b/apps/Makefile.in
+@@ -95,7 +95,7 @@ MYSQL_LIBS	= @MYSQL_LIBS@
+ MYSQL_INCLUDES	= @MYSQL_INCLUDES@
+
+ VAL_LIBS	= @VAL_LIBS@
+-LIBS		= $(USELIBS) $(VAL_LIBS) @LIBS@
++LIBS		= $(USELIBS) $(VAL_LIBS) @LIBS@ @LIBCRYPTO@
+ PERLLDOPTS_FOR_APPS = @PERLLDOPTS_FOR_APPS@
+ PERLLDOPTS_FOR_LIBS = @PERLLDOPTS_FOR_LIBS@
+
+@@ -235,7 +235,7 @@ snmppcap$(EXEEXT):    snmppcap.$(OSUFFIX) $(USEAGENTLIBS)
+ 	$(LINK) ${CFLAGS} -o $@ snmppcap.$(OSUFFIX) ${LDFLAGS} ${USEAGENTLIBS} ${LIBS} -lpcap
+
+ libnetsnmptrapd.$(LIB_EXTENSION)$(LIB_VERSION): $(LLIBTRAPD_OBJS)
+-	$(LIB_LD_CMD) $@ ${LLIBTRAPD_OBJS} $(MIBLIB) $(MYSQL_LIBS) $(USELIBS) $(PERLLDOPTS_FOR_LIBS) $(LDFLAGS)
++	$(LIB_LD_CMD) $@ ${LLIBTRAPD_OBJS} $(MIBLIB) $(AGENTLIB) $(MYSQL_LIBS) $(USELIBS) $(PERLLDOPTS_FOR_LIBS) $(LDFLAGS)
+ 	$(RANLIB) $@
+
+ snmpinforminstall:
+diff --git a/configure b/configure
+index 6ef0026..4270aff 100755
+--- a/configure
++++ b/configure
+@@ -683,6 +683,7 @@ PERLLDOPTS_FOR_APPS
+ PERLLDOPTS_FOR_LIBS
+ EMBEDPERLUNINSTALL
+ EMBEDPERLINSTALL
++LIBCRYPTO
+ LIBCURSES
+ HAVE_LIBCURSES
+ NETSNMP_BUILD_PCAP_PROG_FALSE
+@@ -32065,6 +32066,12 @@ printf "%s\n" "$netsnmp_cv_func_ceil_LNETSNMPLIBS" >&6; }
+  fi
+
+
++if test x$CRYPTO != x; then
++    LMIBLIBS="$LMIBLIBS $LIBCRYPTO"
++fi
++
++
++
+ cat >confcache <<\_ACEOF
+ # This file is a shell script that caches the results of configure
+ # tests run on this system so they can be shared between configure
+diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
+index 5787e58..d21ea77 100644
+--- a/configure.d/config_os_libs2
++++ b/configure.d/config_os_libs2
+@@ -718,3 +718,9 @@ AC_SUBST([LIBCURSES])
+ #   libm for ceil
+ #
+ NETSNMP_SEARCH_LIBS(ceil, m,,,, LNETSNMPLIBS)
++
++if test x$CRYPTO != x; then
++    LMIBLIBS="$LMIBLIBS $LIBCRYPTO"
++fi
++
++AC_SUBST(LIBCRYPTO)
+--
+2.43.0
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
index 00a7b50cdf..48704d020f 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://0009-net-snmp-fix-for-disable-des.patch \
            file://0010-net-snmp-Reproducibility-Don-t-check-build-host-for.patch \
            file://0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch \
+           file://0012-apps-Makefile.in-Link-libraries-explicitly.patch \
            file://netsnmp-swinst-crash.patch \
            "
 SRC_URI[sha256sum] = "16707719f833184a4b72835dac359ae188123b06b5e42817c00790d7dc1384bf"

