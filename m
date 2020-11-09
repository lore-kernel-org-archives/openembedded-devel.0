Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.6480.1604891550248161517
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2020 19:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E+Im6qvf;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id f27so2437317pgl.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2020 19:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wt8fE3+viQm6QiZJ5xtwkU2jlav3Wd7QZH+05jIhQHM=;
        b=E+Im6qvfJcLgP7p1ho1AppwVnNXnVdl7d5yI15zajXQMLkvMNYVsdoWgZ/SBdvyhX8
         xnqe29+6iLp51iX8QE3jk9P37Z43uH3LYYiTFkqmNsDqmkl8Ih81NQVTugLKAuSjGMpU
         zyDn3CQDS4xYD0rBjDoc6yxdE/rOQZiolTcsaxL78ga99Bcs6hMVgwECLew8NTEN1Wvm
         u71EbSuLOzKOPXMUvorpE1lPlHdoAvG+URi21+mqfRgC/AjKbRAMj046NM2/pj519jWI
         KgRmxJVylhELsCDrFhEUscI0RGj+UC1HgIIsmSkJVreME1scVa5AUdgAiYVI6/HGMOUk
         dHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wt8fE3+viQm6QiZJ5xtwkU2jlav3Wd7QZH+05jIhQHM=;
        b=b09dGyg3WI/g8jmEY+ff9QQy/ULh18ujPGvD2k0j2Demb+4INMbM4pmEWNsoSx3N0R
         DHTUfUJSZ01fwA+jfj4l6KJx/fyRyNMbqJCEQSjSLNmYK23yNokdjjxAyCNiS8oUq9pP
         3wwuLSm4tAITyS3aTuvu38Qym5BW8rmfL+MmufF2FXn+ATSmeTjSv5mTOQMe6fBBvNGq
         7hd/f6kxP9SAcjQ9XgTcmJTiuvoHZCiuQ7cpa0hN776AvfCoW/eOAxCLlwtg/QrcP5Fg
         3azhksMOnFPnIJb7We1x6IjDt8YNcgKDcYox+7JwmYm7VQrzmD0ddIlUAI31Bw2uzoek
         Y/EA==
X-Gm-Message-State: AOAM531B7zqmoUdsOmxFlfQ0LIZgWSMcBWcCy7lrhWSOt2l3MbPn5YOP
	boYWzKVLYjxJZCerlSGNcVbvL+G3bOJzBA==
X-Google-Smtp-Source: ABdhPJxxJROh1PPchVeKXfiR2tpNHe11fCrtisX1/YomVVUdPiTi71r3Av32LVjhnA6jsz6n8xgG4Q==
X-Received: by 2002:a17:90a:f993:: with SMTP id cq19mr11047538pjb.173.1604891549015;
        Sun, 08 Nov 2020 19:12:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id v18sm9528959pfn.35.2020.11.08.19.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 19:12:28 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] lksctp-tools: Update to latest master
Date: Sun,  8 Nov 2020 19:12:25 -0800
Message-Id: <20201109031225.68138-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the patches which are upstream now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0dce7a36fb-actually-belongs-to-v4.19.patch | 31 --------
 ...x-netinet-sctp.h-not-to-be-installed.patch | 35 ---------
 ...uild-fix-probing-for-HAVE_SCTP_SENDV.patch | 35 ---------
 ...12-secondary-defines-in-favor-of-HAV.patch | 52 --------------
 ...-CURRENT-REVISION-and-AGE-for-libsct.patch | 71 -------------------
 ...1_events.c-initialize-event-properly.patch | 44 ------------
 ...tp-use-PACKAGE_VERSION-in-withsctp.h.patch | 43 -----------
 .../lksctp-tools/lksctp-tools_1.0.18.bb       |  9 +--
 8 files changed, 1 insertion(+), 319 deletions(-)
 delete mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-0b0dce7a36fb-actually-belongs-to-v4.19.patch
 delete mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-netinet-sctp.h-not-to-be-installed.patch
 delete mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-probing-for-HAVE_SCTP_SENDV.patch
 delete mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-remove-v4.12-secondary-defines-in-favor-of-HAV.patch
 delete mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-configure.ac-add-CURRENT-REVISION-and-AGE-for-libsct.patch
 delete mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-test_1_to_1_events.c-initialize-event-properly.patch
 delete mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-withsctp-use-PACKAGE_VERSION-in-withsctp.h.patch

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-0b0dce7a36fb-actually-belongs-to-v4.19.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-0b0dce7a36fb-actually-belongs-to-v4.19.patch
deleted file mode 100644
index 7599b1bcfb..0000000000
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-0b0dce7a36fb-actually-belongs-to-v4.19.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e5952a0cdfa8b1b56a5823574835f1f771f14ae0 Mon Sep 17 00:00:00 2001
-From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
-Date: Fri, 24 Aug 2018 09:53:00 -0300
-Subject: [PATCH] build: 0b0dce7a36fb actually belongs to v4.19
-
-Typo or not, this commit actually belongs to v4.19 and made me wonder why
-on v4.18 it didn't find this feature.
-
-Fixes: 817f0bfa248f ("build: add two defines for Peer Address Parameters extensions on sctp_paddrparams")
-Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
-Reviewed-by: Xin Long <lucien.xin@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index f55775a..5de5c76 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -101,7 +101,7 @@ LKSCTP_CHECK_TYPE([struct sctp_prinfo], [HAVE_SCTP_SENDV])
- # added on v4.16, 30f6ebf65bc4
- LKSCTP_CHECK_DECL([SCTP_AUTH_NO_AUTH], [HAVE_SCTP_AUTH_NO_AUTH])
- 
--# New members to sctp_paddrparams, added on v4.18, 0b0dce7a36fb
-+# New members to sctp_paddrparams, added on v4.19, 0b0dce7a36fb
- LKSCTP_CHECK_MEMBER([struct sctp_paddrparams.spp_ipv6_flowlabel],
- 		    [HAVE_SCTP_SPP_IPV6_FLOWLABEL])
- LKSCTP_CHECK_MEMBER([struct sctp_paddrparams.spp_dscp],
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-netinet-sctp.h-not-to-be-installed.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-netinet-sctp.h-not-to-be-installed.patch
deleted file mode 100644
index 03c6c4f737..0000000000
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-netinet-sctp.h-not-to-be-installed.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 378560050a8f93786c590cc99a55461666205b61 Mon Sep 17 00:00:00 2001
-From: Xin Long <lucien.xin@gmail.com>
-Date: Fri, 24 Aug 2018 01:13:32 +0800
-Subject: [PATCH] build: fix netinet/sctp.h not to be installed
-
-After libcnetinet_HEADERS was set to sctp.h.in, netinet/sctp.h can
-no longer be installed into ${includedir}.
-
-Since "AC_CONFIG_HEADERS([src/include/netinet/sctp.h])" is already
-added into configure.ac, there's no need to generate sctp.h by
-automake.
-
-So we simply set libcnetinet_HEADERS back to sctp.h.
-
-Fixes: 9607dd85e70a ("netinet/sctp.h: dynamically build based on system setup")
-Signed-off-by: Xin Long <lucien.xin@gmail.com>
-Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
----
- src/include/netinet/Makefile.am | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/include/netinet/Makefile.am b/src/include/netinet/Makefile.am
-index ca0aac2..965db8c 100644
---- a/src/include/netinet/Makefile.am
-+++ b/src/include/netinet/Makefile.am
-@@ -11,5 +11,4 @@ libcnetinetdir = $(includedir)/netinet
- # API.
- include_HEADERS =
- 
--libcnetinet_HEADERS = sctp.h.in
--BUILT_SOURCES = sctp.h
-+libcnetinet_HEADERS = sctp.h
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-probing-for-HAVE_SCTP_SENDV.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-probing-for-HAVE_SCTP_SENDV.patch
deleted file mode 100644
index 89c89835da..0000000000
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-probing-for-HAVE_SCTP_SENDV.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 596efd6631b83069d41782fb0ee2d6cf76a50dfa Mon Sep 17 00:00:00 2001
-From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
-Date: Fri, 24 Aug 2018 09:52:59 -0300
-Subject: [PATCH] build: fix probing for HAVE_SCTP_SENDV
-
-Somehow it was using a type that is non-existent. The right one is
-sctp_prinfo, introduced on ed63afb8a318 ("sctp: add support for PR-SCTP
-Information for sendmsg"), present on v4.17.
-
-Fixes: 1b798f1ca3b5 ("build: add define HAVE_SCTP_AUTH_NO_AUTH")
-Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
-Reviewed-by: Xin Long <lucien.xin@gmail.com>
----
- configure.ac | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index dad658c..f55775a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -94,9 +94,8 @@ LKSCTP_CHECK_MEMBER([struct sctp_pdapi_event.pdapi_stream],
- LKSCTP_CHECK_MEMBER([struct sctp_pdapi_event.pdapi_seq],
- 		    [HAVE_SCTP_PDAPI_EVENT_PDAPI_SEQ])
- 
--# PR-SCTP field used to probe for sendv/recvv support, added on v4.17
--LKSCTP_CHECK_MEMBER([struct sendv_prinfo.sctp_prinfo],
--		    [HAVE_SCTP_SENDV])
-+# PR-SCTP struct used to probe for sendv/recvv support, added on v4.17
-+LKSCTP_CHECK_TYPE([struct sctp_prinfo], [HAVE_SCTP_SENDV])
- 
- # This event indicates that the peer does not support SCTP authentication,
- # added on v4.16, 30f6ebf65bc4
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-remove-v4.12-secondary-defines-in-favor-of-HAV.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-remove-v4.12-secondary-defines-in-favor-of-HAV.patch
deleted file mode 100644
index d22cda6814..0000000000
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-remove-v4.12-secondary-defines-in-favor-of-HAV.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From db6d15bf12a0123e4320e5fd7cb688331dea1bdc Mon Sep 17 00:00:00 2001
-From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
-Date: Fri, 24 Aug 2018 09:52:58 -0300
-Subject: [PATCH] build: remove v4.12 secondary defines in favor of
- HAVE_SCTP_STREAM_RECONFIG
-
-These were backups, commented out since beginning.
-HAVE_SCTP_STREAM_RECONFIG is enough to identify that these are there, so
-lets use only one.
-
-Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
-Reviewed-by: Xin Long <lucien.xin@gmail.com>
----
- configure.ac                  | 8 --------
- src/include/netinet/sctp.h.in | 2 --
- 2 files changed, 10 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2ae36ec..dad658c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -82,14 +82,6 @@ AC_CHECK_FUNCS([bzero gethostbyname gettimeofday memmove memset select socket \
- LKSCTP_CHECK_MEMBER([struct sctp_event_subscribe.sctp_stream_reset_event],
- 		    [HAVE_SCTP_STREAM_RESET_EVENT])
- 
--# Support for assoc reset event, added on v4.12, c95129d127c6
--#LKSCTP_CHECK_MEMBER([struct sctp_event_subscribe.sctp_assoc_reset_event], \
--#		    [HAVE_SCTP_ASSOC_RESET_EVENT])
--
--# Support for stream change event, added on v4.12, b444153fb5a6
--#LKSCTP_CHECK_MEMBER([struct sctp_event_subscribe.sctp_stream_change_event], \
--#		    [HAVE_SCTP_STREAM_CHANGE_EVENT])
--
- # RFC 6525 (Stream Reconf), finished on v4.12, c0d8bab6ae51
- LKSCTP_CHECK_DECL([SCTP_RECONFIG_SUPPORTED], [HAVE_SCTP_STREAM_RECONFIG])
- 
-diff --git a/src/include/netinet/sctp.h.in b/src/include/netinet/sctp.h.in
-index c049077..2009f1c 100644
---- a/src/include/netinet/sctp.h.in
-+++ b/src/include/netinet/sctp.h.in
-@@ -61,8 +61,6 @@ extern "C" {
- #define HAVE_SCTP_CANSET_PRIMARY
- 
- #undef HAVE_SCTP_STREAM_RESET_EVENT
--#undef HAVE_SCTP_ASSOC_RESET_EVENT
--#undef HAVE_SCTP_STREAM_CHANGE_EVENT
- #undef HAVE_SCTP_STREAM_RECONFIG
- #undef HAVE_SCTP_PEELOFF_FLAGS
- #undef HAVE_SCTP_PDAPI_EVENT_PDAPI_STREAM
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-configure.ac-add-CURRENT-REVISION-and-AGE-for-libsct.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-configure.ac-add-CURRENT-REVISION-and-AGE-for-libsct.patch
deleted file mode 100644
index bec9bf0d1b..0000000000
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-configure.ac-add-CURRENT-REVISION-and-AGE-for-libsct.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 7de2bd7e769f10521e3d0c2cb42c6f6b9b505dd0 Mon Sep 17 00:00:00 2001
-From: Xin Long <lucien.xin@gmail.com>
-Date: Thu, 16 Aug 2018 14:12:30 +0800
-Subject: [PATCH] configure.ac: add CURRENT REVISION and AGE for libsctp and
- libwithsctp
-
-Add CURRENT REVISION and AGE for libsctp and libwithsctp in
-configure.ac to update these 2 library version information.
-
-Compatible with before, they will start from 1:18:0. But each
-will get updated according to their definitions in the future.
-
-Signed-off-by: Xin Long <lucien.xin@gmail.com>
-Acked-by: Neil Horman <nhorman@tuxdriver.com>
-Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
----
- configure.ac             | 7 +++++++
- src/lib/Makefile.am      | 7 +++++--
- src/withsctp/Makefile.am | 3 ++-
- 3 files changed, 14 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 275ef4e..2ae36ec 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -14,6 +14,13 @@ dnl reduce clutter in the root; if we put it below AM_INIT_AUTOMAKE,
- dnl configure will fail ...)
- 
- AC_INIT([lksctp-tools], [1.0.18], [], [], [http://www.lksctp.org/])
-+AC_SUBST(LIBSCTP_CURRENT, 1)
-+AC_SUBST(LIBSCTP_REVISION, 18)
-+AC_SUBST(LIBSCTP_AGE, 0)
-+AC_SUBST(LIBWITHSCTP_CURRENT, 1)
-+AC_SUBST(LIBWITHSCTP_REVISION, 18)
-+AC_SUBST(LIBWITHSCTP_AGE, 0)
-+
- AC_CONFIG_AUX_DIR(bin)
- AC_CONFIG_SRCDIR([src/apps/sctp_darn.c])
- AC_CONFIG_HEADERS([config.h])
-diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
-index 6100c56..1d62175 100644
---- a/src/lib/Makefile.am
-+++ b/src/lib/Makefile.am
-@@ -8,5 +8,8 @@ AM_CPPFLAGS = -I$(top_srcdir)/src/include
- 
- lib_LTLIBRARIES = libsctp.la
- 
--libsctp_la_SOURCES = bindx.c connectx.c peeloff.c opt_info.c addrs.c sendmsg.c recvmsg.c Versions.map
--libsctp_la_LDFLAGS = -version-info 1:17:0 -Wl,--version-script=$(srcdir)/Versions.map
-+libsctp_la_SOURCES = bindx.c connectx.c peeloff.c opt_info.c \
-+		addrs.c sendmsg.c recvmsg.c Versions.map
-+libsctp_la_LDFLAGS = -version-info \
-+		@LIBSCTP_CURRENT@:@LIBSCTP_REVISION@:@LIBSCTP_AGE@ \
-+		-Wl,--version-script=$(srcdir)/Versions.map
-diff --git a/src/withsctp/Makefile.am b/src/withsctp/Makefile.am
-index 70b1cca..1f6ca37 100644
---- a/src/withsctp/Makefile.am
-+++ b/src/withsctp/Makefile.am
-@@ -14,7 +14,8 @@ AM_CPPFLAGS=-I$(top_srcdir)/src/include
- pkglib_LTLIBRARIES = libwithsctp.la
- libwithsctp_la_SOURCES = sctp_load_libs.c sctp_socket.c sctp_bind.c \
- 	sctp_sockopt.c sctp_socket.h
--libwithsctp_la_LDFLAGS = -version-info 1:17:0 -ldl
-+libwithsctp_la_LDFLAGS = -version-info \
-+	@LIBWITHSCTP_CURRENT@:@LIBWITHSCTP_REVISION@:@LIBWITHSCTP_AGE@ -ldl
- 
- pkgdoc_DATA = sctp_load_libs.c sctp_socket.c sctp_bind.c \
- 	sctp_sockopt.c sctp_socket.h checksctp.c
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-test_1_to_1_events.c-initialize-event-properly.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-test_1_to_1_events.c-initialize-event-properly.patch
deleted file mode 100644
index 621e6f4693..0000000000
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-test_1_to_1_events.c-initialize-event-properly.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e1e670defb84d51efdd124e5f3fa166a1a4b7c1d Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Tue, 25 Sep 2018 11:39:43 +0800
-Subject: [PATCH] test_1_to_1_events.c: initialize event properly
-
-Initialize event properly to avoid below
-Segmentation fault when run below test
-related to AUTH_NO_AUTH.
-
- # ./test_1_to_1_events
-test_1_to_1_events.c 1 PASS : COMM_UP notification on client socket - SUCCESS
-test_1_to_1_events.c 2 PASS : COMM_UP notification on server socket - SUCCESS
-test_1_to_1_events.c 3 BROK : Got a datamsg, expecting notification
-DUMP_CORE sctputil.c: 187
-[ 1468.733938] test_1_to_1_eve[2376]: segfault at 0 ip 0000561a4a3d5079 sp 00007ffd49101580 error 6 in test_1_to_1_events[561a4a3d4000+2000]
-[ 1468.734479] Code: ff bf 0a 00 00 00 e8 e6 ef ff ff b9 c9 00 00 00 48 8d 15 61 13 00 00 bf 01 00 00 00 31 c0 48 8d 35 c7 0f 00 00 e8 97 f0
-Segmentation fault
-
-Upstream-Status: Pending
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- src/func_tests/test_1_to_1_events.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/func_tests/test_1_to_1_events.c b/src/func_tests/test_1_to_1_events.c
-index 46439bf..a086832 100644
---- a/src/func_tests/test_1_to_1_events.c
-+++ b/src/func_tests/test_1_to_1_events.c
-@@ -92,9 +92,11 @@ main(int argc, char *argv[])
- 	/* Create the client socket.  */
- 	clt_sk = test_socket(AF_INET, SOCK_STREAM, IPPROTO_SCTP);
- 
-+	memset(&event, 0, sizeof(event));
- 	event.sctp_data_io_event = 1;
- 	event.sctp_association_event = 1;
- 	event.sctp_shutdown_event = 1;
-+	event.sctp_authentication_event = 1;
- 	len = sizeof(struct sctp_event_subscribe);
- 	test_setsockopt(svr_sk, SCTP_EVENTS, &event, len);
- 	test_setsockopt(clt_sk, SCTP_EVENTS, &event, len);
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-withsctp-use-PACKAGE_VERSION-in-withsctp.h.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-withsctp-use-PACKAGE_VERSION-in-withsctp.h.patch
deleted file mode 100644
index 2537bb976a..0000000000
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-withsctp-use-PACKAGE_VERSION-in-withsctp.h.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 7c0ef4d441b3833e721df58f56e2cb8c81b34df4 Mon Sep 17 00:00:00 2001
-From: Xin Long <lucien.xin@gmail.com>
-Date: Thu, 16 Aug 2018 14:12:01 +0800
-Subject: [PATCH] withsctp: use @PACKAGE_VERSION@ in withsctp.h
-
-use @PACKAGE_VERSION@ to replace the hardcode version.
-
-Signed-off-by: Xin Long <lucien.xin@gmail.com>
-Acked-by: Neil Horman <nhorman@tuxdriver.com>
-Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
----
- Makefile.rules           | 3 ++-
- src/withsctp/withsctp.in | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.rules b/Makefile.rules
-index 83f5f0c..d3693fa 100644
---- a/Makefile.rules
-+++ b/Makefile.rules
-@@ -15,4 +15,5 @@
- edit = @sed \
- 	-e "s|\@bindir\@|$(bindir)|" \
- 	-e "s|\@libdir\@|$(libdir)|" \
--	-e "s|\@PACKAGE\@|$(PACKAGE)|"
-+	-e "s|\@PACKAGE\@|$(PACKAGE)|" \
-+	-e "s|\@PACKAGE_VERSION\@|$(PACKAGE_VERSION)|"
-diff --git a/src/withsctp/withsctp.in b/src/withsctp/withsctp.in
-index 7f182ba..fda5ebc 100644
---- a/src/withsctp/withsctp.in
-+++ b/src/withsctp/withsctp.in
-@@ -2,7 +2,8 @@
- # -*- sh -*-
- LIBDIR=@libdir@/@PACKAGE@
- BINDIR=@bindir@
--export LD_PRELOAD=${LIBDIR}/libwithsctp.so.1.0.17
-+LIBVER=@PACKAGE_VERSION@
-+export LD_PRELOAD=${LIBDIR}/libwithsctp.so.${LIBVER}
- if ! ${BINDIR}/checksctp 2> /dev/null
- then
-     ${BINDIR}/checksctp;
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
index 3cabc4ff8d..1e2c644b41 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
@@ -8,20 +8,13 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
 "
 
-SRCREV = "1b077af62d83d53c34b1bde8bad6648149d5edf9"
+SRCREV = "12c74404e09755561dee40cf194954f7ff5afd60"
 
 PV .= "+git${SRCPV}"
 LK_REL = "1.0.18"
 
 SRC_URI = " \
     git://github.com/sctp/lksctp-tools.git \
-    file://0001-withsctp-use-PACKAGE_VERSION-in-withsctp.h.patch \
-    file://0001-configure.ac-add-CURRENT-REVISION-and-AGE-for-libsct.patch \
-    file://0001-build-fix-netinet-sctp.h-not-to-be-installed.patch \
-    file://0001-build-remove-v4.12-secondary-defines-in-favor-of-HAV.patch \
-    file://0001-build-fix-probing-for-HAVE_SCTP_SENDV.patch \
-    file://0001-build-0b0dce7a36fb-actually-belongs-to-v4.19.patch \
-    file://0001-test_1_to_1_events.c-initialize-event-properly.patch \
     file://run-ptest \
     file://v4test.sh \
     file://v6test.sh \
-- 
2.29.2

