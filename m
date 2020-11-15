Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.25685.1605475645222271612
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2020 13:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SvbSfrzQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id k7so7131959plk.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2020 13:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BQ91Bez1lV2HdEJIAruw5elWpPFW4bsYz5D4+oDbjwc=;
        b=SvbSfrzQFaR0f/8nEhBnOp9RjzaFd/UsnEC57lGqNSS8bM/UXugu/6VPz5CX80p+0r
         dtEZ3h/GNO6CETa/kX5sFZj3LpXzUn5L1rmQxS8qm7WsghFAL78ICY+KTkQnbF0nDYP/
         8N4pnfUz3/d82rfTXrLMyP5Puv2C7dspdntpHjlJutBdcfijcaMCNkIRnMpiZV84/xGn
         dvQWR6J+0qLQLGO94ztCwMY7zQ0T9mWrH+JoS49II8zUkhHvz5CJ9MzSwvW+uIKrbMxp
         63L7sVgR5ioiDQuaEyRuGIh9SwdL57RVKYWkpsiabp1OCG7klSFi2sWmSbUulHWJQQnH
         cmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BQ91Bez1lV2HdEJIAruw5elWpPFW4bsYz5D4+oDbjwc=;
        b=hqOHPIElAg1ZBGmVNqyHEmx5tvHkY5G4qdL/WQhBB4LTrTsmbfOLtuYdXEqDpop1Z9
         ++TXRR5cgiCYe0goOrYeJezSlfuO7HqY6Pc1vnh0cguv5ypSovXH9PQzCPVeJetpqbFg
         xnhFY7/pz+e1stGnCeRJdNyh2NrL8PKwuzNo1svHWdO0wNXq38rB1FWPpVbneo/RufMW
         sJol8JhrEYAGTrKEJv/YcWgSS6Tf2UDUifcK4EC5eaAjPnMGZFSi/iiIj+1JyWqAXeCR
         NIIh4M2p2rpV55uKOpgC76XtNeUd7qPzjcmbTJKgyOojDXq/uqOw+H8xD8sAc/2oPDcy
         NyqQ==
X-Gm-Message-State: AOAM532buzC8mGBHBSxFkWinodlLzYwHVWHfMdii6r25bwmA2DMEefnA
	Zwu0acMgLeVjR5X2idXcIO3kVxDW/McUig==
X-Google-Smtp-Source: ABdhPJxLcCdlFM0VMbMgTOAesOH4NuqxRx31EuEbBUNdMDDzrLqR6/S4n3mDoMBkcpgcBl49Qhn43g==
X-Received: by 2002:a17:902:bccb:b029:d6:fa5c:b481 with SMTP id o11-20020a170902bccbb02900d6fa5cb481mr10428633pls.17.1605475644483;
        Sun, 15 Nov 2020 13:27:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id a25sm16082046pfg.138.2020.11.15.13.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 13:27:24 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] opensaf: Fix build on 32bit arches with 64bit time_t e.g. RISCV-32
Date: Sun, 15 Nov 2020 13:27:21 -0800
Message-Id: <20201115212721.2891211-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rrect-printf-format-for-__fsblkcnt_t.patch | 36 +++++++++++++++++++
 .../opensaf/opensaf_5.20.08.bb                |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch
new file mode 100644
index 0000000000..0e113f533f
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch
@@ -0,0 +1,36 @@
+From 90f81c1fb3e560cfc99ee7ab9a48a1736e3929cd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2020 13:22:31 -0800
+Subject: [PATCH] Use correct printf format for __fsblkcnt_t
+
+This depends on time_t size and on some 32bit architectures e.g. riscv32
+this would be a 64bit value
+
+Fixes
+os_defs.c:920:40: error: format '%ld' expects argument of type 'long int', but argument 3 has type '__fsblkcnt_t' {aka 'long long unsigned int'} [-Werror=format=]
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/base/os_defs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/base/os_defs.c b/src/base/os_defs.c
+index 83458c2..655c190 100644
+--- a/src/base/os_defs.c
++++ b/src/base/os_defs.c
+@@ -917,7 +917,11 @@ uint32_t ncs_os_posix_shm(NCS_OS_POSIX_SHM_REQ_INFO *req)
+ 			    ((statsvfs.f_bfree - 1) * statsvfs.f_frsize)) {
+ 				syslog(
+ 				    LOG_ERR,
++#if __TIMESIZE == 64 && __WORDSIZE == 32
++				    "Insufficient shared memory (%lld) to write the data of size: %" PRId64
++#else
+ 				    "Insufficient shared memory (%ld) to write the data of size: %" PRId64
++#endif
+ 				    "\n",
+ 				    (statsvfs.f_bfree * statsvfs.f_frsize),
+ 				    req->info.write.i_write_size);
+-- 
+2.29.2
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.20.08.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.20.08.bb
index 7c7051eff3..5516fc43ae 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.20.08.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.20.08.bb
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-create_empty_library-Use-CC-variable-intead-of-hardc.patch \
            file://0001-immom_python-convert-to-python3.patch \
            file://0001-Fix-build-with-fno-common.patch \
+           file://0001-Use-correct-printf-format-for-__fsblkcnt_t.patch \
            "
 SRC_URI[md5sum] = "02cfe732d194339237da6adce8e54384"
 SRC_URI[sha256sum] = "84268b90dc48a6675e5a77e2b20390a04bb59deb48a829102a9dbc4b9ac27483"
-- 
2.29.2

