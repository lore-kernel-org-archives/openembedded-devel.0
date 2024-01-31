Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809CFC47DDB
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 02:37:14 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.5787.1706668633147953557
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jan 2024 18:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UQfzcDwO;
 spf=pass (domain: mvista.com, ip: 209.85.210.44, mailfrom: vanusuri@mvista.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6e1214ae9d4so1678529a34.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 18:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1706668631; x=1707273431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dmmp0agHBacnWOdD1JFQ7V+A+i1HasFOGQCkTBWuBZ8=;
        b=UQfzcDwOASIwnMzDbHeGibVwGdMITie8sqvSmfiGv4zmqRobLTmhur50n6Y9hhf2v1
         luUxweCWs7fHITI3WYRpNpelwtcyADlFJjVB6j0qdv/E2E72mysLxcJlDv8z0KtoZrOV
         u+xXViLQI4czWO0cij2fiMf7ec6fF9STCMPv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706668631; x=1707273431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dmmp0agHBacnWOdD1JFQ7V+A+i1HasFOGQCkTBWuBZ8=;
        b=kpZPAlnZhG7VYUad2BPBz+/jYABicPulbuUHMuqgOIdXB2GbepDICb2SVCkt0bk/uF
         yh9k+5KSQYcHONvlyav9klGrsBZcYXTqxBZFN9FfiJndUmn0zDlzoPbQ4VnP9IZD2TGw
         Idalz4JkznA1fSqcvFa5etF3GFLe5qZerDRRluqoNL8k6Dm8YnmM8FnFuq1YadyNCE8N
         mq116D7cWsjwjgFo+d+GoFIbzvwBgcNmijQbbtUHcoToZBTKAdcj5dLFH+N9af5NP6kZ
         BGvhWxTmkcLOGhlaISRWpOJeQ4IOB9iBkKb9fafPfGagIBCEFHjQDD37F9TXHuaWE8Zd
         IX+g==
X-Gm-Message-State: AOJu0YzdCvU5WNo41YChJAcDqdHMabraQqKm0fXp7BZvv/IMU0j7E2+e
	mVJC2apUBArDaLvcPIEOH5Wm0kB//vuDSYyhJzPpzJ0XFW8rtLgOfCxCqTdyC/f7tZG5kd2TXmf
	r
X-Google-Smtp-Source: AGHT+IFCVoAQryQJ3jkuwU6PwtEPo9A4+bhuwnr+CagNnnEunq5SAaQvuOzJhNxucnZH/zYE9tV5Uw==
X-Received: by 2002:a9d:6190:0:b0:6e1:46ce:a2b7 with SMTP id g16-20020a9d6190000000b006e146cea2b7mr247387otk.2.1706668630326;
        Tue, 30 Jan 2024 18:37:10 -0800 (PST)
Received: from MVIN00020.mvista.com ([122.181.211.15])
        by smtp.gmail.com with ESMTPSA id m1-20020a634c41000000b005cfd70edc1bsm9152286pgl.7.2024.01.30.18.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 18:37:09 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][dunfell][PATCH] squid: backport Debian patch for CVE-2023-46728 and CVE-2023-46846
Date: Wed, 31 Jan 2024 08:04:59 +0530
Message-Id: <20240131023459.5105-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Jan 2024 02:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108504

From: Vijay Anusuri <vanusuri@mvista.com>

import patches from ubuntu to fix
 CVE-2023-46728
 CVE-2023-46846

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/squid/tree/debian/patches?h=ubuntu/focal-security&id=9ccd217ca9428c9a6597e9310a99552026b245fa
Upstream commit
https://github.com/squid-cache/squid/commit/6ea12e8fb590ac6959e9356a81aa3370576568c3
&
https://github.com/squid-cache/squid/commit/417da4006cf5c97d44e74431b816fc58fec9e270
&
https://github.com/squid-cache/squid/commit/05f6af2f4c85cc99323cfff6149c3d74af661b6d]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../squid/files/CVE-2023-46728.patch          |  608 +++++++++
 .../squid/files/CVE-2023-46846-pre1.patch     | 1154 +++++++++++++++++
 .../squid/files/CVE-2023-46846.patch          |  169 +++
 .../recipes-daemons/squid/squid_4.9.bb        |    3 +
 4 files changed, 1934 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2023-46728.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2023-46846-pre1.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2023-46846.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2023-46728.patch b/meta-networking/recipes-daemons/squid/files/CVE-2023-46728.patch
new file mode 100644
index 000000000..b11721041
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2023-46728.patch
@@ -0,0 +1,608 @@
+Partial backport of:
+
+From 6ea12e8fb590ac6959e9356a81aa3370576568c3 Mon Sep 17 00:00:00 2001
+From: Alex Rousskov <rousskov@measurement-factory.com>
+Date: Tue, 26 Jul 2022 15:05:54 +0000
+Subject: [PATCH] Remove support for Gopher protocol (#1092)
+
+Gopher code quality remains too low for production use in most
+environments. The code is a persistent source of vulnerabilities and
+fixing it requires significant effort. We should not be spending scarce
+Project resources on improving that code, especially given the lack of
+strong demand for Gopher support.
+
+With this change, Gopher requests will be handled like any other request
+with an unknown (to Squid) protocol. For example, HTTP requests with
+Gopher URI scheme result in ERR_UNSUP_REQ.
+
+Default Squid configuration still considers TCP port 70 "safe". The
+corresponding Safe_ports ACL rule has not been removed for consistency
+sake: We consider WAIS port safe even though Squid refuses to forward
+WAIS requests:
+
+    acl Safe_ports port 70          # gopher
+    acl Safe_ports port 210         # wais
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/squid/tree/debian/patches/CVE-2023-46728.patch?h=ubuntu/focal-security&id=9ccd217ca9428c9a6597e9310a99552026b245fa
+Upstream commit https://github.com/squid-cache/squid/commit/6ea12e8fb590ac6959e9356a81aa3370576568c3]
+CVE: CVE-2023-46728
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ doc/Programming-Guide/Groups.dox         |   5 -
+ doc/debug-sections.txt                   |   1 -
+ doc/manuals/de.po                        |   2 +-
+ doc/manuals/en.po                        |   2 +-
+ doc/manuals/en_AU.po                     |   2 +-
+ doc/manuals/es.po                        |   2 +-
+ doc/manuals/fr.po                        |   2 +-
+ doc/manuals/it.po                        |   2 +-
+ errors/af.po                             |   6 +-
+ errors/az.po                             |   6 +-
+ errors/bg.po                             |   6 +-
+ errors/ca.po                             |   6 +-
+ errors/cs.po                             |   6 +-
+ errors/da.po                             |   6 +-
+ errors/de.po                             |   6 +-
+ errors/el.po                             |   4 +-
+ errors/en.po                             |   6 +-
+ errors/errorpage.css                     |   2 +-
+ errors/es-mx.po                          |   3 +-
+ errors/es.po                             |   4 +-
+ errors/et.po                             |   6 +-
+ errors/fi.po                             |   7 +-
+ errors/fr.po                             |   6 +-
+ errors/he.po                             |   6 +-
+ errors/hu.po                             |   6 +-
+ errors/hy.po                             |   6 +-
+ errors/it.po                             |   4 +-
+ errors/ja.po                             |   6 +-
+ errors/ko.po                             |   6 +-
+ errors/lt.po                             |   6 +-
+ errors/lv.po                             |   6 +-
+ errors/nl.po                             |   6 +-
+ errors/pl.po                             |   6 +-
+ errors/pt-br.po                          |   6 +-
+ errors/pt.po                             |   6 +-
+ errors/ro.po                             |   4 +-
+ errors/ru.po                             |   6 +-
+ errors/sk.po                             |   6 +-
+ errors/sl.po                             |   6 +-
+ errors/sr-latn.po                        |   4 +-
+ errors/sv.po                             |   6 +-
+ errors/templates/ERR_UNSUP_REQ           |   2 +-
+ errors/tr.po                             |   6 +-
+ errors/uk.po                             |   6 +-
+ errors/vi.po                             |   4 +-
+ errors/zh-hans.po                        |   6 +-
+ errors/zh-hant.po                        |   7 +-
+ src/FwdState.cc                          |   5 -
+ src/HttpRequest.cc                       |   6 -
+ src/IoStats.h                            |   2 +-
+ src/Makefile.am                          |   8 -
+ src/adaptation/ecap/Host.cc              |   1 -
+ src/adaptation/ecap/MessageRep.cc        |   2 -
+ src/anyp/ProtocolType.h                  |   1 -
+ src/anyp/Uri.cc                          |   1 -
+ src/anyp/UriScheme.cc                    |   3 -
+ src/cf.data.pre                          |   5 +-
+ src/client_side_request.cc               |   4 -
+ src/error/forward.h                      |   2 +-
+ src/gopher.cc                            | 993 -----------------------
+ src/gopher.h                             |  29 -
+ src/http/Message.h                       |   1 -
+ src/mgr/IoAction.cc                      |   3 -
+ src/mgr/IoAction.h                       |   2 -
+ src/squid.8.in                           |   2 +-
+ src/stat.cc                              |  19 -
+ src/tests/Stub.am                        |   1 -
+ src/tests/stub_gopher.cc                 |  17 -
+ test-suite/squidconf/regressions-3.4.0.1 |   1 -
+ 69 files changed, 88 insertions(+), 1251 deletions(-)
+ delete mode 100644 src/gopher.cc
+ delete mode 100644 src/gopher.h
+ delete mode 100644 src/tests/stub_gopher.cc
+
+--- a/src/FwdState.cc
++++ b/src/FwdState.cc
+@@ -28,7 +28,6 @@
+ #include "fde.h"
+ #include "FwdState.h"
+ #include "globals.h"
+-#include "gopher.h"
+ #include "hier_code.h"
+ #include "http.h"
+ #include "http/Stream.h"
+@@ -1004,10 +1003,6 @@ FwdState::dispatch()
+             httpStart(this);
+             break;
+ 
+-        case AnyP::PROTO_GOPHER:
+-            gopherStart(this);
+-            break;
+-
+         case AnyP::PROTO_FTP:
+             if (request->flags.ftpNative)
+                 Ftp::StartRelay(this);
+--- a/src/HttpRequest.cc
++++ b/src/HttpRequest.cc
+@@ -18,7 +18,6 @@
+ #include "Downloader.h"
+ #include "err_detail_type.h"
+ #include "globals.h"
+-#include "gopher.h"
+ #include "http.h"
+ #include "http/one/RequestParser.h"
+ #include "http/Stream.h"
+@@ -556,11 +555,6 @@ HttpRequest::maybeCacheable()
+             return false;
+         break;
+ 
+-    case AnyP::PROTO_GOPHER:
+-        if (!gopherCachable(this))
+-            return false;
+-        break;
+-
+     case AnyP::PROTO_CACHE_OBJECT:
+         return false;
+ 
+--- a/src/IoStats.h
++++ b/src/IoStats.h
+@@ -22,7 +22,7 @@ public:
+         int writes;
+         int write_hist[histSize];
+     }
+-    Http, Ftp, Gopher;
++    Http, Ftp;
+ };
+ 
+ #endif /* SQUID_IOSTATS_H_ */
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -306,8 +306,6 @@ squid_SOURCES = \
+ 	FwdState.h \
+ 	Generic.h \
+ 	globals.h \
+-	gopher.h \
+-	gopher.cc \
+ 	helper.cc \
+ 	helper.h \
+ 	hier_code.h \
+@@ -1259,8 +1257,6 @@ tests_testCacheManager_SOURCES = \
+ 	fqdncache.cc \
+ 	FwdState.cc \
+ 	FwdState.h \
+-	gopher.h \
+-	gopher.cc \
+ 	hier_code.h \
+ 	helper.cc \
+ 	$(HTCPSOURCE) \
+@@ -1678,8 +1674,6 @@ tests_testEvent_SOURCES = \
+ 	fqdncache.cc \
+ 	FwdState.cc \
+ 	FwdState.h \
+-	gopher.h \
+-	gopher.cc \
+ 	helper.cc \
+ 	hier_code.h \
+ 	$(HTCPSOURCE) \
+@@ -1914,8 +1908,6 @@ tests_testEventLoop_SOURCES = \
+ 	fqdncache.cc \
+ 	FwdState.cc \
+ 	FwdState.h \
+-	gopher.h \
+-	gopher.cc \
+ 	helper.cc \
+ 	hier_code.h \
+ 	$(HTCPSOURCE) \
+@@ -2145,8 +2137,6 @@ tests_test_http_range_SOURCES = \
+ 	fqdncache.cc \
+ 	FwdState.cc \
+ 	FwdState.h \
+-	gopher.h \
+-	gopher.cc \
+ 	helper.cc \
+ 	hier_code.h \
+ 	$(HTCPSOURCE) \
+@@ -2461,8 +2451,6 @@ tests_testHttpRequest_SOURCES = \
+ 	fqdncache.cc \
+ 	FwdState.cc \
+ 	FwdState.h \
+-	gopher.h \
+-	gopher.cc \
+ 	helper.cc \
+ 	hier_code.h \
+ 	$(HTCPSOURCE) \
+@@ -3307,8 +3295,6 @@ tests_testURL_SOURCES = \
+ 	fqdncache.cc \
+ 	FwdState.cc \
+ 	FwdState.h \
+-	gopher.h \
+-	gopher.cc \
+ 	helper.cc \
+ 	hier_code.h \
+ 	$(HTCPSOURCE) \
+--- a/src/adaptation/ecap/Host.cc
++++ b/src/adaptation/ecap/Host.cc
+@@ -49,7 +49,6 @@ Adaptation::Ecap::Host::Host()
+     libecap::protocolHttp.assignHostId(AnyP::PROTO_HTTP);
+     libecap::protocolHttps.assignHostId(AnyP::PROTO_HTTPS);
+     libecap::protocolFtp.assignHostId(AnyP::PROTO_FTP);
+-    libecap::protocolGopher.assignHostId(AnyP::PROTO_GOPHER);
+     libecap::protocolWais.assignHostId(AnyP::PROTO_WAIS);
+     libecap::protocolUrn.assignHostId(AnyP::PROTO_URN);
+     libecap::protocolWhois.assignHostId(AnyP::PROTO_WHOIS);
+--- a/src/adaptation/ecap/MessageRep.cc
++++ b/src/adaptation/ecap/MessageRep.cc
+@@ -140,8 +140,6 @@ Adaptation::Ecap::FirstLineRep::protocol
+         return libecap::protocolHttps;
+     case AnyP::PROTO_FTP:
+         return libecap::protocolFtp;
+-    case AnyP::PROTO_GOPHER:
+-        return libecap::protocolGopher;
+     case AnyP::PROTO_WAIS:
+         return libecap::protocolWais;
+     case AnyP::PROTO_WHOIS:
+--- a/src/anyp/ProtocolType.h
++++ b/src/anyp/ProtocolType.h
+@@ -27,7 +27,6 @@ typedef enum {
+     PROTO_HTTPS,
+     PROTO_COAP,
+     PROTO_COAPS,
+-    PROTO_GOPHER,
+     PROTO_WAIS,
+     PROTO_CACHE_OBJECT,
+     PROTO_ICP,
+--- a/src/anyp/Uri.cc
++++ b/src/anyp/Uri.cc
+@@ -852,8 +852,6 @@ urlCheckRequest(const HttpRequest * r)
+         if (r->method == Http::METHOD_PUT)
+             rc = 1;
+ 
+-    case AnyP::PROTO_GOPHER:
+-
+     case AnyP::PROTO_WAIS:
+ 
+     case AnyP::PROTO_WHOIS:
+--- a/src/anyp/UriScheme.cc
++++ b/src/anyp/UriScheme.cc
+@@ -87,9 +87,6 @@ AnyP::UriScheme::defaultPort() const
+         // Assuming IANA policy of allocating same port for base and TLS protocol versions will occur.
+         return 5683;
+ 
+-    case AnyP::PROTO_GOPHER:
+-        return 70;
+-
+     case AnyP::PROTO_WAIS:
+         return 210;
+ 
+--- a/src/client_side_request.cc
++++ b/src/client_side_request.cc
+@@ -33,7 +33,6 @@
+ #include "fd.h"
+ #include "fde.h"
+ #include "format/Token.h"
+-#include "gopher.h"
+ #include "helper.h"
+ #include "helper/Reply.h"
+ #include "http.h"
+@@ -965,9 +964,6 @@ clientHierarchical(ClientHttpRequest * h
+     if (request->url.getScheme() == AnyP::PROTO_HTTP)
+         return method.respMaybeCacheable();
+ 
+-    if (request->url.getScheme() == AnyP::PROTO_GOPHER)
+-        return gopherCachable(request);
+-
+     if (request->url.getScheme() == AnyP::PROTO_CACHE_OBJECT)
+         return 0;
+ 
+--- a/src/err_type.h
++++ b/src/err_type.h
+@@ -65,7 +65,7 @@ typedef enum {
+     ERR_GATEWAY_FAILURE,
+ 
+     /* Special Cases */
+-    ERR_DIR_LISTING,            /* Display of remote directory (FTP, Gopher) */
++    ERR_DIR_LISTING,            /* Display of remote directory (FTP) */
+     ERR_SQUID_SIGNATURE,        /* not really an error */
+     ERR_SHUTTING_DOWN,
+     ERR_PROTOCOL_UNKNOWN,
+--- a/src/HttpMsg.h
++++ b/src/HttpMsg.h
+@@ -38,7 +38,6 @@ public:
+         srcFtp = 1 << (16 + 1), ///< ftp_port or FTP server
+         srcIcap = 1 << (16 + 2), ///< traditional ICAP service without encryption
+         srcEcap = 1 << (16 + 3), ///< eCAP service that uses insecure libraries/daemons
+-        srcGopher = 1 << (16 + 14), ///< Gopher server
+         srcWhois = 1 << (16 + 15), ///< Whois server
+         srcUnsafe = 0xFFFF0000,  ///< Unsafe sources mask
+         srcSafe = 0x0000FFFF ///< Safe sources mask
+--- a/src/mgr/IoAction.cc
++++ b/src/mgr/IoAction.cc
+@@ -35,9 +35,6 @@ Mgr::IoActionData::operator += (const Io
+     ftp_reads += stats.ftp_reads;
+     for (int i = 0; i < IoStats::histSize; ++i)
+         ftp_read_hist[i] += stats.ftp_read_hist[i];
+-    gopher_reads += stats.gopher_reads;
+-    for (int i = 0; i < IoStats::histSize; ++i)
+-        gopher_read_hist[i] += stats.gopher_read_hist[i];
+ 
+     return *this;
+ }
+--- a/src/mgr/IoAction.h
++++ b/src/mgr/IoAction.h
+@@ -27,10 +27,8 @@ public:
+ public:
+     double http_reads;
+     double ftp_reads;
+-    double gopher_reads;
+     double http_read_hist[IoStats::histSize];
+     double ftp_read_hist[IoStats::histSize];
+-    double gopher_read_hist[IoStats::histSize];
+ };
+ 
+ /// implement aggregated 'io' action
+--- a/src/stat.cc
++++ b/src/stat.cc
+@@ -206,12 +206,6 @@ GetIoStats(Mgr::IoActionData& stats)
+     for (i = 0; i < IoStats::histSize; ++i) {
+         stats.ftp_read_hist[i] = IOStats.Ftp.read_hist[i];
+     }
+-
+-    stats.gopher_reads = IOStats.Gopher.reads;
+-
+-    for (i = 0; i < IoStats::histSize; ++i) {
+-        stats.gopher_read_hist[i] = IOStats.Gopher.read_hist[i];
+-    }
+ }
+ 
+ void
+@@ -245,19 +239,6 @@ DumpIoStats(Mgr::IoActionData& stats, St
+     }
+ 
+     storeAppendPrintf(sentry, "\n");
+-    storeAppendPrintf(sentry, "Gopher I/O\n");
+-    storeAppendPrintf(sentry, "number of reads: %.0f\n", stats.gopher_reads);
+-    storeAppendPrintf(sentry, "Read Histogram:\n");
+-
+-    for (i = 0; i < IoStats::histSize; ++i) {
+-        storeAppendPrintf(sentry, "%5d-%5d: %9.0f %2.0f%%\n",
+-                          i ? (1 << (i - 1)) + 1 : 1,
+-                          1 << i,
+-                          stats.gopher_read_hist[i],
+-                          Math::doublePercent(stats.gopher_read_hist[i], stats.gopher_reads));
+-    }
+-
+-    storeAppendPrintf(sentry, "\n");
+ }
+ 
+ static const char *
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -263,7 +263,7 @@ am__squid_SOURCES_DIST = AclRegs.cc Auth
+ 	ExternalACL.h ExternalACLEntry.cc ExternalACLEntry.h \
+ 	FadingCounter.h FadingCounter.cc fatal.h fatal.cc fd.h fd.cc \
+ 	fde.cc fde.h FileMap.h filemap.cc fqdncache.h fqdncache.cc \
+-	FwdState.cc FwdState.h Generic.h globals.h gopher.h gopher.cc \
++	FwdState.cc FwdState.h Generic.h globals.h \
+ 	helper.cc helper.h hier_code.h HierarchyLogEntry.h htcp.cc \
+ 	htcp.h http.cc http.h HttpHeaderFieldStat.h HttpHdrCc.h \
+ 	HttpHdrCc.cc HttpHdrCc.cci HttpHdrRange.cc HttpHdrSc.cc \
+@@ -352,7 +352,7 @@ am_squid_OBJECTS = $(am__objects_1) Acce
+ 	EventLoop.$(OBJEXT) external_acl.$(OBJEXT) \
+ 	ExternalACLEntry.$(OBJEXT) FadingCounter.$(OBJEXT) \
+ 	fatal.$(OBJEXT) fd.$(OBJEXT) fde.$(OBJEXT) filemap.$(OBJEXT) \
+-	fqdncache.$(OBJEXT) FwdState.$(OBJEXT) gopher.$(OBJEXT) \
++	fqdncache.$(OBJEXT) FwdState.$(OBJEXT) \
+ 	helper.$(OBJEXT) $(am__objects_5) http.$(OBJEXT) \
+ 	HttpHdrCc.$(OBJEXT) HttpHdrRange.$(OBJEXT) HttpHdrSc.$(OBJEXT) \
+ 	HttpHdrScTarget.$(OBJEXT) HttpHdrContRange.$(OBJEXT) \
+@@ -539,7 +539,7 @@ am__tests_testCacheManager_SOURCES_DIST
+ 	tests/stub_ETag.cc event.cc external_acl.cc \
+ 	ExternalACLEntry.cc fatal.h tests/stub_fatal.cc fd.h fd.cc \
+ 	fde.cc FileMap.h filemap.cc fqdncache.h fqdncache.cc \
+-	FwdState.cc FwdState.h gopher.h gopher.cc hier_code.h \
++	FwdState.cc FwdState.h hier_code.h \
+ 	helper.cc htcp.cc htcp.h http.cc HttpBody.h HttpBody.cc \
+ 	HttpHeader.h HttpHeader.cc HttpHeaderFieldInfo.h \
+ 	HttpHeaderTools.h HttpHeaderTools.cc HttpHeaderFieldStat.h \
+@@ -594,7 +594,7 @@ am_tests_testCacheManager_OBJECTS = Acce
+ 	event.$(OBJEXT) external_acl.$(OBJEXT) \
+ 	ExternalACLEntry.$(OBJEXT) tests/stub_fatal.$(OBJEXT) \
+ 	fd.$(OBJEXT) fde.$(OBJEXT) filemap.$(OBJEXT) \
+-	fqdncache.$(OBJEXT) FwdState.$(OBJEXT) gopher.$(OBJEXT) \
++	fqdncache.$(OBJEXT) FwdState.$(OBJEXT) \
+ 	helper.$(OBJEXT) $(am__objects_5) http.$(OBJEXT) \
+ 	HttpBody.$(OBJEXT) HttpHeader.$(OBJEXT) \
+ 	HttpHeaderTools.$(OBJEXT) HttpHdrCc.$(OBJEXT) \
+@@ -838,7 +838,7 @@ am__tests_testEvent_SOURCES_DIST = Acces
+ 	EventLoop.h EventLoop.cc external_acl.cc ExternalACLEntry.cc \
+ 	FadingCounter.cc fatal.h tests/stub_fatal.cc fd.h fd.cc fde.cc \
+ 	FileMap.h filemap.cc fqdncache.h fqdncache.cc FwdState.cc \
+-	FwdState.h gopher.h gopher.cc helper.cc hier_code.h htcp.cc \
++	FwdState.h helper.cc hier_code.h htcp.cc \
+ 	htcp.h http.cc HttpBody.h HttpBody.cc \
+ 	tests/stub_HttpControlMsg.cc HttpHeader.h HttpHeader.cc \
+ 	HttpHeaderFieldInfo.h HttpHeaderTools.h HttpHeaderTools.cc \
+@@ -891,7 +891,7 @@ am_tests_testEvent_OBJECTS = AccessLogEn
+ 	external_acl.$(OBJEXT) ExternalACLEntry.$(OBJEXT) \
+ 	FadingCounter.$(OBJEXT) tests/stub_fatal.$(OBJEXT) \
+ 	fd.$(OBJEXT) fde.$(OBJEXT) filemap.$(OBJEXT) \
+-	fqdncache.$(OBJEXT) FwdState.$(OBJEXT) gopher.$(OBJEXT) \
++	fqdncache.$(OBJEXT) FwdState.$(OBJEXT) \
+ 	helper.$(OBJEXT) $(am__objects_5) http.$(OBJEXT) \
+ 	HttpBody.$(OBJEXT) tests/stub_HttpControlMsg.$(OBJEXT) \
+ 	HttpHeader.$(OBJEXT) HttpHeaderTools.$(OBJEXT) \
+@@ -975,8 +975,8 @@ am__tests_testEventLoop_SOURCES_DIST = A
+ 	tests/stub_ETag.cc EventLoop.h EventLoop.cc event.cc \
+ 	external_acl.cc ExternalACLEntry.cc FadingCounter.cc fatal.h \
+ 	tests/stub_fatal.cc fd.h fd.cc fde.cc FileMap.h filemap.cc \
+-	fqdncache.h fqdncache.cc FwdState.cc FwdState.h gopher.h \
+-	gopher.cc helper.cc hier_code.h htcp.cc htcp.h http.cc \
++	fqdncache.h fqdncache.cc FwdState.cc FwdState.h \
++	helper.cc hier_code.h htcp.cc htcp.h http.cc \
+ 	HttpBody.h HttpBody.cc tests/stub_HttpControlMsg.cc \
+ 	HttpHeader.h HttpHeader.cc HttpHeaderFieldInfo.h \
+ 	HttpHeaderTools.h HttpHeaderTools.cc HttpHeaderFieldStat.h \
+@@ -1029,7 +1029,7 @@ am_tests_testEventLoop_OBJECTS = AccessL
+ 	external_acl.$(OBJEXT) ExternalACLEntry.$(OBJEXT) \
+ 	FadingCounter.$(OBJEXT) tests/stub_fatal.$(OBJEXT) \
+ 	fd.$(OBJEXT) fde.$(OBJEXT) filemap.$(OBJEXT) \
+-	fqdncache.$(OBJEXT) FwdState.$(OBJEXT) gopher.$(OBJEXT) \
++	fqdncache.$(OBJEXT) FwdState.$(OBJEXT) \
+ 	helper.$(OBJEXT) $(am__objects_5) http.$(OBJEXT) \
+ 	HttpBody.$(OBJEXT) tests/stub_HttpControlMsg.$(OBJEXT) \
+ 	HttpHeader.$(OBJEXT) HttpHeaderTools.$(OBJEXT) \
+@@ -1187,7 +1187,7 @@ am__tests_testHttpRequest_SOURCES_DIST =
+ 	fs_io.cc dlink.h dlink.cc dns_internal.cc errorpage.cc \
+ 	tests/stub_ETag.cc external_acl.cc ExternalACLEntry.cc fatal.h \
+ 	tests/stub_fatal.cc fd.h fd.cc fde.cc fqdncache.h fqdncache.cc \
+-	FwdState.cc FwdState.h gopher.h gopher.cc helper.cc \
++	FwdState.cc FwdState.h helper.cc \
+ 	hier_code.h htcp.cc htcp.h http.cc HttpBody.h HttpBody.cc \
+ 	tests/stub_HttpControlMsg.cc HttpHeader.h HttpHeader.cc \
+ 	HttpHeaderFieldInfo.h HttpHeaderTools.h HttpHeaderTools.cc \
+@@ -1243,7 +1243,7 @@ am_tests_testHttpRequest_OBJECTS = Acces
+ 	$(am__objects_4) errorpage.$(OBJEXT) tests/stub_ETag.$(OBJEXT) \
+ 	external_acl.$(OBJEXT) ExternalACLEntry.$(OBJEXT) \
+ 	tests/stub_fatal.$(OBJEXT) fd.$(OBJEXT) fde.$(OBJEXT) \
+-	fqdncache.$(OBJEXT) FwdState.$(OBJEXT) gopher.$(OBJEXT) \
++	fqdncache.$(OBJEXT) FwdState.$(OBJEXT) \
+ 	helper.$(OBJEXT) $(am__objects_5) http.$(OBJEXT) \
+ 	HttpBody.$(OBJEXT) tests/stub_HttpControlMsg.$(OBJEXT) \
+ 	HttpHeader.$(OBJEXT) HttpHeaderTools.$(OBJEXT) \
+@@ -1670,8 +1670,8 @@ am__tests_testURL_SOURCES_DIST = AccessL
+ 	fs_io.cc dlink.h dlink.cc dns_internal.cc errorpage.cc ETag.cc \
+ 	event.cc external_acl.cc ExternalACLEntry.cc fatal.h \
+ 	tests/stub_fatal.cc fd.h fd.cc fde.cc FileMap.h filemap.cc \
+-	fqdncache.h fqdncache.cc FwdState.cc FwdState.h gopher.h \
+-	gopher.cc helper.cc hier_code.h htcp.cc htcp.h http.cc \
++	fqdncache.h fqdncache.cc FwdState.cc FwdState.h \
++	helper.cc hier_code.h htcp.cc htcp.h http.cc \
+ 	HttpBody.h HttpBody.cc tests/stub_HttpControlMsg.cc \
+ 	HttpHeaderFieldStat.h HttpHdrCc.h HttpHdrCc.cc HttpHdrCc.cci \
+ 	HttpHdrContRange.cc HttpHdrRange.cc HttpHdrSc.cc \
+@@ -1725,7 +1725,7 @@ am_tests_testURL_OBJECTS = AccessLogEntr
+ 	event.$(OBJEXT) external_acl.$(OBJEXT) \
+ 	ExternalACLEntry.$(OBJEXT) tests/stub_fatal.$(OBJEXT) \
+ 	fd.$(OBJEXT) fde.$(OBJEXT) filemap.$(OBJEXT) \
+-	fqdncache.$(OBJEXT) FwdState.$(OBJEXT) gopher.$(OBJEXT) \
++	fqdncache.$(OBJEXT) FwdState.$(OBJEXT) \
+ 	helper.$(OBJEXT) $(am__objects_5) http.$(OBJEXT) \
+ 	HttpBody.$(OBJEXT) tests/stub_HttpControlMsg.$(OBJEXT) \
+ 	HttpHdrCc.$(OBJEXT) HttpHdrContRange.$(OBJEXT) \
+@@ -1925,8 +1925,8 @@ am__tests_test_http_range_SOURCES_DIST =
+ 	dns_internal.cc errorpage.cc tests/stub_ETag.cc event.cc \
+ 	FadingCounter.cc fatal.h tests/stub_libauth.cc \
+ 	tests/stub_fatal.cc fd.h fd.cc fde.cc FileMap.h filemap.cc \
+-	fqdncache.h fqdncache.cc FwdState.cc FwdState.h gopher.h \
+-	gopher.cc helper.cc hier_code.h htcp.cc htcp.h http.cc \
++	fqdncache.h fqdncache.cc FwdState.cc FwdState.h \
++	helper.cc hier_code.h htcp.cc htcp.h http.cc \
+ 	HttpBody.h HttpBody.cc tests/stub_HttpControlMsg.cc \
+ 	HttpHeaderFieldStat.h HttpHdrCc.h HttpHdrCc.cc HttpHdrCc.cci \
+ 	HttpHdrContRange.cc HttpHdrRange.cc HttpHdrSc.cc \
+@@ -1979,7 +1979,7 @@ am_tests_test_http_range_OBJECTS = Acces
+ 	FadingCounter.$(OBJEXT) tests/stub_libauth.$(OBJEXT) \
+ 	tests/stub_fatal.$(OBJEXT) fd.$(OBJEXT) fde.$(OBJEXT) \
+ 	filemap.$(OBJEXT) fqdncache.$(OBJEXT) FwdState.$(OBJEXT) \
+-	gopher.$(OBJEXT) helper.$(OBJEXT) $(am__objects_5) \
++	helper.$(OBJEXT) $(am__objects_5) \
+ 	http.$(OBJEXT) HttpBody.$(OBJEXT) \
+ 	tests/stub_HttpControlMsg.$(OBJEXT) HttpHdrCc.$(OBJEXT) \
+ 	HttpHdrContRange.$(OBJEXT) HttpHdrRange.$(OBJEXT) \
+@@ -2131,7 +2131,7 @@ am__depfiles_remade = ./$(DEPDIR)/Access
+ 	./$(DEPDIR)/external_acl.Po ./$(DEPDIR)/fatal.Po \
+ 	./$(DEPDIR)/fd.Po ./$(DEPDIR)/fde.Po ./$(DEPDIR)/filemap.Po \
+ 	./$(DEPDIR)/fqdncache.Po ./$(DEPDIR)/fs_io.Po \
+-	./$(DEPDIR)/globals.Po ./$(DEPDIR)/gopher.Po \
++	./$(DEPDIR)/globals.Po \
+ 	./$(DEPDIR)/helper.Po ./$(DEPDIR)/hier_code.Po \
+ 	./$(DEPDIR)/htcp.Po ./$(DEPDIR)/http.Po \
+ 	./$(DEPDIR)/icp_opcode.Po ./$(DEPDIR)/icp_v2.Po \
+@@ -3043,7 +3043,7 @@ squid_SOURCES = $(ACL_REGISTRATION_SOURC
+ 	ExternalACL.h ExternalACLEntry.cc ExternalACLEntry.h \
+ 	FadingCounter.h FadingCounter.cc fatal.h fatal.cc fd.h fd.cc \
+ 	fde.cc fde.h FileMap.h filemap.cc fqdncache.h fqdncache.cc \
+-	FwdState.cc FwdState.h Generic.h globals.h gopher.h gopher.cc \
++	FwdState.cc FwdState.h Generic.h globals.h \
+ 	helper.cc helper.h hier_code.h HierarchyLogEntry.h \
+ 	$(HTCPSOURCE) http.cc http.h HttpHeaderFieldStat.h HttpHdrCc.h \
+ 	HttpHdrCc.cc HttpHdrCc.cci HttpHdrRange.cc HttpHdrSc.cc \
+@@ -3708,8 +3708,6 @@ tests_testCacheManager_SOURCES = \
+ 	fqdncache.cc \
+ 	FwdState.cc \
+ 	FwdState.h \
+-	gopher.h \
+-	gopher.cc \
+ 	hier_code.h \
+ 	helper.cc \
+ 	$(HTCPSOURCE) \
+@@ -4134,8 +4132,6 @@ tests_testEvent_SOURCES = \
+ 	fqdncache.cc \
+ 	FwdState.cc \
+ 	FwdState.h \
+-	gopher.h \
+-	gopher.cc \
+ 	helper.cc \
+ 	hier_code.h \
+ 	$(HTCPSOURCE) \
+@@ -4371,8 +4367,6 @@ tests_testEventLoop_SOURCES = \
+ 	fqdncache.cc \
+ 	FwdState.cc \
+ 	FwdState.h \
+-	gopher.h \
+-	gopher.cc \
+ 	helper.cc \
+ 	hier_code.h \
+ 	$(HTCPSOURCE) \
+@@ -4604,8 +4598,6 @@ tests_test_http_range_SOURCES = \
+ 	fqdncache.cc \
+ 	FwdState.cc \
+ 	FwdState.h \
+-	gopher.h \
+-	gopher.cc \
+ 	helper.cc \
+ 	hier_code.h \
+ 	$(HTCPSOURCE) \
+@@ -4924,8 +4916,6 @@ tests_testHttpRequest_SOURCES = \
+ 	fqdncache.cc \
+ 	FwdState.cc \
+ 	FwdState.h \
+-	gopher.h \
+-	gopher.cc \
+ 	helper.cc \
+ 	hier_code.h \
+ 	$(HTCPSOURCE) \
+@@ -5777,8 +5767,6 @@ tests_testURL_SOURCES = \
+ 	fqdncache.cc \
+ 	FwdState.cc \
+ 	FwdState.h \
+-	gopher.h \
+-	gopher.cc \
+ 	helper.cc \
+ 	hier_code.h \
+ 	$(HTCPSOURCE) \
+@@ -6823,7 +6811,6 @@ distclean-compile:
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/fqdncache.Po@am__quote@ # am--include-marker
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/fs_io.Po@am__quote@ # am--include-marker
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/globals.Po@am__quote@ # am--include-marker
+-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/gopher.Po@am__quote@ # am--include-marker
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/helper.Po@am__quote@ # am--include-marker
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/hier_code.Po@am__quote@ # am--include-marker
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/htcp.Po@am__quote@ # am--include-marker
+@@ -7804,7 +7791,6 @@ distclean: distclean-recursive
+ 	-rm -f ./$(DEPDIR)/fqdncache.Po
+ 	-rm -f ./$(DEPDIR)/fs_io.Po
+ 	-rm -f ./$(DEPDIR)/globals.Po
+-	-rm -f ./$(DEPDIR)/gopher.Po
+ 	-rm -f ./$(DEPDIR)/helper.Po
+ 	-rm -f ./$(DEPDIR)/hier_code.Po
+ 	-rm -f ./$(DEPDIR)/htcp.Po
+@@ -8129,7 +8115,6 @@ maintainer-clean: maintainer-clean-recur
+ 	-rm -f ./$(DEPDIR)/fqdncache.Po
+ 	-rm -f ./$(DEPDIR)/fs_io.Po
+ 	-rm -f ./$(DEPDIR)/globals.Po
+-	-rm -f ./$(DEPDIR)/gopher.Po
+ 	-rm -f ./$(DEPDIR)/helper.Po
+ 	-rm -f ./$(DEPDIR)/hier_code.Po
+ 	-rm -f ./$(DEPDIR)/htcp.Po
diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2023-46846-pre1.patch b/meta-networking/recipes-daemons/squid/files/CVE-2023-46846-pre1.patch
new file mode 100644
index 000000000..5b4e370d4
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2023-46846-pre1.patch
@@ -0,0 +1,1154 @@
+Backport of:
+
+From 417da4006cf5c97d44e74431b816fc58fec9e270 Mon Sep 17 00:00:00 2001
+From: Eduard Bagdasaryan <eduard.bagdasaryan@measurement-factory.com>
+Date: Mon, 18 Mar 2019 17:48:21 +0000
+Subject: [PATCH] Fix incremental parsing of chunked quoted extensions (#310)
+
+Before this change, incremental parsing of quoted chunked extensions
+was broken for two reasons:
+
+* Http::One::Parser::skipLineTerminator() unexpectedly threw after
+  partially received quoted chunk extension value.
+
+* When Http::One::Tokenizer was unable to parse a quoted extension,
+  it incorrectly restored the input buffer to the beginning of the
+  extension value (instead of the extension itself), thus making
+  further incremental parsing iterations impossible.
+
+IMO, the reason for this problem was that Http::One::Tokenizer::qdText()
+could not distinguish two cases (returning false in both):
+
+* the end of the quoted string not yet reached
+
+* an input error, e.g., wrong/unexpected character
+
+A possible approach could be to improve Http::One::Tokenizer, making it
+aware about "needs more data" state.  However, to be acceptable,
+these improvements should be done in the base Parser::Tokenizer
+class instead. These changes seem to be non-trivial and could be
+done separately and later.
+
+Another approach, used here, is to simplify the complex and error-prone
+chunked extensions parsing algorithm, fixing incremental parsing bugs
+and still parse incrementally in almost all cases. The performance
+regression could be expected only in relatively rare cases of partially
+received or malformed extensions.
+
+Also:
+* fixed parsing of partial use-original-body extension values
+* do not treat an invalid use-original-body as an unknown extension
+* optimization: parse use-original-body extension only in ICAP context
+  (i.e., where it is expected)
+* improvement: added a new API to TeChunkedParser to specify known
+  chunked extensions list
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/squid/tree/debian/patches/CVE-2023-46846-pre1.patch?h=ubuntu/focal-security&id=9ccd217ca9428c9a6597e9310a99552026b245fa
+Upstream commit https://github.com/squid-cache/squid/commit/417da4006cf5c97d44e74431b816fc58fec9e270]
+CVE: CVE-2023-46846 #Dependency Patch1
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/adaptation/icap/ModXact.cc  |  21 ++++-
+ src/adaptation/icap/ModXact.h   |  20 +++++
+ src/http/one/Parser.cc          |  35 ++++----
+ src/http/one/Parser.h           |  10 ++-
+ src/http/one/RequestParser.cc   |  16 ++--
+ src/http/one/RequestParser.h    |   8 +-
+ src/http/one/ResponseParser.cc  |  17 ++--
+ src/http/one/ResponseParser.h   |   2 +-
+ src/http/one/TeChunkedParser.cc | 139 ++++++++++++++++++--------------
+ src/http/one/TeChunkedParser.h  |  41 ++++++++--
+ src/http/one/Tokenizer.cc       | 104 ++++++++++++------------
+ src/http/one/Tokenizer.h        |  89 ++++++++------------
+ src/http/one/forward.h          |   3 +
+ src/parser/BinaryTokenizer.h    |   3 +-
+ src/parser/Makefile.am          |   1 +
+ src/parser/Tokenizer.cc         |  40 +++++++++
+ src/parser/Tokenizer.h          |  13 +++
+ src/parser/forward.h            |  22 +++++
+ 18 files changed, 364 insertions(+), 220 deletions(-)
+ create mode 100644 src/parser/forward.h
+
+--- a/src/adaptation/icap/ModXact.cc
++++ b/src/adaptation/icap/ModXact.cc
+@@ -25,12 +25,13 @@
+ #include "comm.h"
+ #include "comm/Connection.h"
+ #include "err_detail_type.h"
+-#include "http/one/TeChunkedParser.h"
+ #include "HttpHeaderTools.h"
+ #include "HttpMsg.h"
+ #include "HttpReply.h"
+ #include "HttpRequest.h"
+ #include "MasterXaction.h"
++#include "parser/Tokenizer.h"
++#include "sbuf/Stream.h"
+ #include "SquidTime.h"
+ 
+ // flow and terminology:
+@@ -44,6 +45,8 @@ CBDATA_NAMESPACED_CLASS_INIT(Adaptation:
+ 
+ static const size_t TheBackupLimit = BodyPipe::MaxCapacity;
+ 
++const SBuf Adaptation::Icap::ChunkExtensionValueParser::UseOriginalBodyName("use-original-body");
++
+ Adaptation::Icap::ModXact::State::State()
+ {
+     memset(this, 0, sizeof(*this));
+@@ -1108,6 +1111,7 @@ void Adaptation::Icap::ModXact::decideOn
+         state.parsing = State::psBody;
+         replyHttpBodySize = 0;
+         bodyParser = new Http1::TeChunkedParser;
++        bodyParser->parseExtensionValuesWith(&extensionParser);
+         makeAdaptedBodyPipe("adapted response from the ICAP server");
+         Must(state.sending == State::sendingAdapted);
+     } else {
+@@ -1142,9 +1146,8 @@ void Adaptation::Icap::ModXact::parseBod
+     }
+ 
+     if (parsed) {
+-        if (state.readyForUob && bodyParser->useOriginBody >= 0) {
+-            prepPartialBodyEchoing(
+-                static_cast<uint64_t>(bodyParser->useOriginBody));
++        if (state.readyForUob && extensionParser.sawUseOriginalBody()) {
++            prepPartialBodyEchoing(extensionParser.useOriginalBody());
+             stopParsing();
+             return;
+         }
+@@ -2014,3 +2017,14 @@ void Adaptation::Icap::ModXactLauncher::
+     }
+ }
+ 
++void
++Adaptation::Icap::ChunkExtensionValueParser::parse(Tokenizer &tok, const SBuf &extName)
++{
++    if (extName == UseOriginalBodyName) {
++        useOriginalBody_ = tok.udec64("use-original-body");
++        assert(useOriginalBody_ >= 0);
++    } else {
++        Ignore(tok, extName);
++    }
++}
++
+--- a/src/adaptation/icap/ModXact.h
++++ b/src/adaptation/icap/ModXact.h
+@@ -15,6 +15,7 @@
+ #include "adaptation/icap/Xaction.h"
+ #include "BodyPipe.h"
+ #include "http/one/forward.h"
++#include "http/one/TeChunkedParser.h"
+ 
+ /*
+  * ICAPModXact implements ICAP REQMOD and RESPMOD transaction using
+@@ -105,6 +106,23 @@ private:
+     enum State { stDisabled, stWriting, stIeof, stDone } theState;
+ };
+ 
++/// handles ICAP-specific chunk extensions supported by Squid
++class ChunkExtensionValueParser: public Http1::ChunkExtensionValueParser
++{
++public:
++    /* Http1::ChunkExtensionValueParser API */
++    virtual void parse(Tokenizer &tok, const SBuf &extName) override;
++
++    bool sawUseOriginalBody() const { return useOriginalBody_ >= 0; }
++    uint64_t useOriginalBody() const { assert(sawUseOriginalBody()); return static_cast<uint64_t>(useOriginalBody_); }
++
++private:
++    static const SBuf UseOriginalBodyName;
++
++    /// the value of the parsed use-original-body chunk extension (or -1)
++    int64_t useOriginalBody_ = -1;
++};
++
+ class ModXact: public Xaction, public BodyProducer, public BodyConsumer
+ {
+     CBDATA_CLASS(ModXact);
+@@ -270,6 +288,8 @@ private:
+ 
+     int adaptHistoryId; ///< adaptation history slot reservation
+ 
++    ChunkExtensionValueParser extensionParser;
++
+     class State
+     {
+ 
+--- a/src/http/one/Parser.cc
++++ b/src/http/one/Parser.cc
+@@ -7,10 +7,11 @@
+  */
+ 
+ #include "squid.h"
++#include "base/CharacterSet.h"
+ #include "Debug.h"
+ #include "http/one/Parser.h"
+-#include "http/one/Tokenizer.h"
+ #include "mime_header.h"
++#include "parser/Tokenizer.h"
+ #include "SquidConfig.h"
+ 
+ /// RFC 7230 section 2.6 - 7 magic octets
+@@ -61,20 +62,19 @@ Http::One::Parser::DelimiterCharacters()
+            RelaxedDelimiterCharacters() : CharacterSet::SP;
+ }
+ 
+-bool
+-Http::One::Parser::skipLineTerminator(Http1::Tokenizer &tok) const
++void
++Http::One::Parser::skipLineTerminator(Tokenizer &tok) const
+ {
+     if (tok.skip(Http1::CrLf()))
+-        return true;
++        return;
+ 
+     if (Config.onoff.relaxed_header_parser && tok.skipOne(CharacterSet::LF))
+-        return true;
++        return;
+ 
+     if (tok.atEnd() || (tok.remaining().length() == 1 && tok.remaining().at(0) == '\r'))
+-        return false; // need more data
++        throw InsufficientInput();
+ 
+     throw TexcHere("garbage instead of CRLF line terminator");
+-    return false; // unreachable, but make naive compilers happy
+ }
+ 
+ /// all characters except the LF line terminator
+@@ -102,7 +102,7 @@ LineCharacters()
+ void
+ Http::One::Parser::cleanMimePrefix()
+ {
+-    Http1::Tokenizer tok(mimeHeaderBlock_);
++    Tokenizer tok(mimeHeaderBlock_);
+     while (tok.skipOne(RelaxedDelimiterCharacters())) {
+         (void)tok.skipAll(LineCharacters()); // optional line content
+         // LF terminator is required.
+@@ -137,7 +137,7 @@ Http::One::Parser::cleanMimePrefix()
+ void
+ Http::One::Parser::unfoldMime()
+ {
+-    Http1::Tokenizer tok(mimeHeaderBlock_);
++    Tokenizer tok(mimeHeaderBlock_);
+     const auto szLimit = mimeHeaderBlock_.length();
+     mimeHeaderBlock_.clear();
+     // prevent the mime sender being able to make append() realloc/grow multiple times.
+@@ -228,7 +228,7 @@ Http::One::Parser::getHostHeaderField()
+     debugs(25, 5, "looking for " << name);
+ 
+     // while we can find more LF in the SBuf
+-    Http1::Tokenizer tok(mimeHeaderBlock_);
++    Tokenizer tok(mimeHeaderBlock_);
+     SBuf p;
+ 
+     while (tok.prefix(p, LineCharacters())) {
+@@ -250,7 +250,7 @@ Http::One::Parser::getHostHeaderField()
+         p.consume(namelen + 1);
+ 
+         // TODO: optimize SBuf::trim to take CharacterSet directly
+-        Http1::Tokenizer t(p);
++        Tokenizer t(p);
+         t.skipAll(CharacterSet::WSP);
+         p = t.remaining();
+ 
+@@ -278,10 +278,15 @@ Http::One::ErrorLevel()
+ }
+ 
+ // BWS = *( SP / HTAB ) ; WhitespaceCharacters() may relax this RFC 7230 rule
+-bool
+-Http::One::ParseBws(Tokenizer &tok)
++void
++Http::One::ParseBws(Parser::Tokenizer &tok)
+ {
+-    if (const auto count = tok.skipAll(Parser::WhitespaceCharacters())) {
++    const auto count = tok.skipAll(Parser::WhitespaceCharacters());
++
++    if (tok.atEnd())
++        throw InsufficientInput(); // even if count is positive
++
++    if (count) {
+         // Generating BWS is a MUST-level violation so warn about it as needed.
+         debugs(33, ErrorLevel(), "found " << count << " BWS octets");
+         // RFC 7230 says we MUST parse BWS, so we fall through even if
+@@ -289,6 +294,6 @@ Http::One::ParseBws(Tokenizer &tok)
+     }
+     // else we successfully "parsed" an empty BWS sequence
+ 
+-    return true;
++    // success: no more BWS characters expected
+ }
+ 
+--- a/src/http/one/Parser.h
++++ b/src/http/one/Parser.h
+@@ -12,6 +12,7 @@
+ #include "anyp/ProtocolVersion.h"
+ #include "http/one/forward.h"
+ #include "http/StatusCode.h"
++#include "parser/forward.h"
+ #include "sbuf/SBuf.h"
+ 
+ namespace Http {
+@@ -40,6 +41,7 @@ class Parser : public RefCountable
+ {
+ public:
+     typedef SBuf::size_type size_type;
++    typedef ::Parser::Tokenizer Tokenizer;
+ 
+     Parser() : parseStatusCode(Http::scNone), parsingStage_(HTTP_PARSE_NONE), hackExpectsMime_(false) {}
+     virtual ~Parser() {}
+@@ -118,11 +120,11 @@ protected:
+      * detect and skip the CRLF or (if tolerant) LF line terminator
+      * consume from the tokenizer.
+      *
+-     * throws if non-terminator is detected.
++     * \throws exception on bad or InsuffientInput.
+      * \retval true only if line terminator found.
+      * \retval false incomplete or missing line terminator, need more data.
+      */
+-    bool skipLineTerminator(Http1::Tokenizer &tok) const;
++    void skipLineTerminator(Tokenizer &) const;
+ 
+     /**
+      * Scan to find the mime headers block for current message.
+@@ -159,8 +161,8 @@ private:
+ };
+ 
+ /// skips and, if needed, warns about RFC 7230 BWS ("bad" whitespace)
+-/// \returns true (always; unlike all the skip*() functions)
+-bool ParseBws(Tokenizer &tok);
++/// \throws InsufficientInput when the end of BWS cannot be confirmed
++void ParseBws(Parser::Tokenizer &);
+ 
+ /// the right debugs() level for logging HTTP violation messages
+ int ErrorLevel();
+--- a/src/http/one/RequestParser.cc
++++ b/src/http/one/RequestParser.cc
+@@ -9,8 +9,8 @@
+ #include "squid.h"
+ #include "Debug.h"
+ #include "http/one/RequestParser.h"
+-#include "http/one/Tokenizer.h"
+ #include "http/ProtocolVersion.h"
++#include "parser/Tokenizer.h"
+ #include "profiler/Profiler.h"
+ #include "SquidConfig.h"
+ 
+@@ -64,7 +64,7 @@ Http::One::RequestParser::skipGarbageLin
+  *  RFC 7230 section 2.6, 3.1 and 3.5
+  */
+ bool
+-Http::One::RequestParser::parseMethodField(Http1::Tokenizer &tok)
++Http::One::RequestParser::parseMethodField(Tokenizer &tok)
+ {
+     // method field is a sequence of TCHAR.
+     // Limit to 32 characters to prevent overly long sequences of non-HTTP
+@@ -145,7 +145,7 @@ Http::One::RequestParser::RequestTargetC
+ }
+ 
+ bool
+-Http::One::RequestParser::parseUriField(Http1::Tokenizer &tok)
++Http::One::RequestParser::parseUriField(Tokenizer &tok)
+ {
+     /* Arbitrary 64KB URI upper length limit.
+      *
+@@ -178,7 +178,7 @@ Http::One::RequestParser::parseUriField(
+ }
+ 
+ bool
+-Http::One::RequestParser::parseHttpVersionField(Http1::Tokenizer &tok)
++Http::One::RequestParser::parseHttpVersionField(Tokenizer &tok)
+ {
+     static const SBuf http1p0("HTTP/1.0");
+     static const SBuf http1p1("HTTP/1.1");
+@@ -253,7 +253,7 @@ Http::One::RequestParser::skipDelimiter(
+ 
+ /// Parse CRs at the end of request-line, just before the terminating LF.
+ bool
+-Http::One::RequestParser::skipTrailingCrs(Http1::Tokenizer &tok)
++Http::One::RequestParser::skipTrailingCrs(Tokenizer &tok)
+ {
+     if (Config.onoff.relaxed_header_parser) {
+         (void)tok.skipAllTrailing(CharacterSet::CR); // optional; multiple OK
+@@ -289,12 +289,12 @@ Http::One::RequestParser::parseRequestFi
+     // Earlier, skipGarbageLines() took care of any leading LFs (if allowed).
+     // Now, the request line has to end at the first LF.
+     static const CharacterSet lineChars = CharacterSet::LF.complement("notLF");
+-    ::Parser::Tokenizer lineTok(buf_);
++    Tokenizer lineTok(buf_);
+     if (!lineTok.prefix(line, lineChars) || !lineTok.skip('\n')) {
+         if (buf_.length() >= Config.maxRequestHeaderSize) {
+             /* who should we blame for our failure to parse this line? */
+ 
+-            Http1::Tokenizer methodTok(buf_);
++            Tokenizer methodTok(buf_);
+             if (!parseMethodField(methodTok))
+                 return -1; // blame a bad method (or its delimiter)
+ 
+@@ -308,7 +308,7 @@ Http::One::RequestParser::parseRequestFi
+         return 0;
+     }
+ 
+-    Http1::Tokenizer tok(line);
++    Tokenizer tok(line);
+ 
+     if (!parseMethodField(tok))
+         return -1;
+--- a/src/http/one/RequestParser.h
++++ b/src/http/one/RequestParser.h
+@@ -54,11 +54,11 @@ private:
+     bool doParse(const SBuf &aBuf);
+ 
+     /* all these return false and set parseStatusCode on parsing failures */
+-    bool parseMethodField(Http1::Tokenizer &);
+-    bool parseUriField(Http1::Tokenizer &);
+-    bool parseHttpVersionField(Http1::Tokenizer &);
++    bool parseMethodField(Tokenizer &);
++    bool parseUriField(Tokenizer &);
++    bool parseHttpVersionField(Tokenizer &);
+     bool skipDelimiter(const size_t count, const char *where);
+-    bool skipTrailingCrs(Http1::Tokenizer &tok);
++    bool skipTrailingCrs(Tokenizer &tok);
+ 
+     bool http0() const {return !msgProtocol_.major;}
+     static const CharacterSet &RequestTargetCharacters();
+--- a/src/http/one/ResponseParser.cc
++++ b/src/http/one/ResponseParser.cc
+@@ -9,8 +9,8 @@
+ #include "squid.h"
+ #include "Debug.h"
+ #include "http/one/ResponseParser.h"
+-#include "http/one/Tokenizer.h"
+ #include "http/ProtocolVersion.h"
++#include "parser/Tokenizer.h"
+ #include "profiler/Profiler.h"
+ #include "SquidConfig.h"
+ 
+@@ -47,7 +47,7 @@ Http::One::ResponseParser::firstLineSize
+ // NP: we found the protocol version and consumed it already.
+ // just need the status code and reason phrase
+ int
+-Http::One::ResponseParser::parseResponseStatusAndReason(Http1::Tokenizer &tok, const CharacterSet &WspDelim)
++Http::One::ResponseParser::parseResponseStatusAndReason(Tokenizer &tok, const CharacterSet &WspDelim)
+ {
+     if (!completedStatus_) {
+         debugs(74, 9, "seek status-code in: " << tok.remaining().substr(0,10) << "...");
+@@ -87,14 +87,13 @@ Http::One::ResponseParser::parseResponse
+     static const CharacterSet phraseChars = CharacterSet::WSP + CharacterSet::VCHAR + CharacterSet::OBSTEXT;
+     (void)tok.prefix(reasonPhrase_, phraseChars); // optional, no error if missing
+     try {
+-        if (skipLineTerminator(tok)) {
+-            debugs(74, DBG_DATA, "parse remaining buf={length=" << tok.remaining().length() << ", data='" << tok.remaining() << "'}");
+-            buf_ = tok.remaining(); // resume checkpoint
+-            return 1;
+-        }
++        skipLineTerminator(tok);
++        buf_ = tok.remaining(); // resume checkpoint
++        debugs(74, DBG_DATA, Raw("leftovers", buf_.rawContent(), buf_.length()));
++        return 1;
++    } catch (const InsufficientInput &) {
+         reasonPhrase_.clear();
+         return 0; // need more to be sure we have it all
+-
+     } catch (const std::exception &ex) {
+         debugs(74, 6, "invalid status-line: " << ex.what());
+     }
+@@ -119,7 +118,7 @@ Http::One::ResponseParser::parseResponse
+ int
+ Http::One::ResponseParser::parseResponseFirstLine()
+ {
+-    Http1::Tokenizer tok(buf_);
++    Tokenizer tok(buf_);
+ 
+     const CharacterSet &WspDelim = DelimiterCharacters();
+ 
+--- a/src/http/one/ResponseParser.h
++++ b/src/http/one/ResponseParser.h
+@@ -43,7 +43,7 @@ public:
+ 
+ private:
+     int parseResponseFirstLine();
+-    int parseResponseStatusAndReason(Http1::Tokenizer&, const CharacterSet &);
++    int parseResponseStatusAndReason(Tokenizer&, const CharacterSet &);
+ 
+     /// magic prefix for identifying ICY response messages
+     static const SBuf IcyMagic;
+--- a/src/http/one/TeChunkedParser.cc
++++ b/src/http/one/TeChunkedParser.cc
+@@ -13,10 +13,13 @@
+ #include "http/one/Tokenizer.h"
+ #include "http/ProtocolVersion.h"
+ #include "MemBuf.h"
++#include "parser/Tokenizer.h"
+ #include "Parsing.h"
++#include "sbuf/Stream.h"
+ #include "SquidConfig.h"
+ 
+-Http::One::TeChunkedParser::TeChunkedParser()
++Http::One::TeChunkedParser::TeChunkedParser():
++    customExtensionValueParser(nullptr)
+ {
+     // chunked encoding only exists in HTTP/1.1
+     Http1::Parser::msgProtocol_ = Http::ProtocolVersion(1,1);
+@@ -31,7 +34,11 @@ Http::One::TeChunkedParser::clear()
+     buf_.clear();
+     theChunkSize = theLeftBodySize = 0;
+     theOut = NULL;
+-    useOriginBody = -1;
++    // XXX: We do not reset customExtensionValueParser here. Based on the
++    // clear() API description, we must, but it makes little sense and could
++    // break method callers if they appear because some of them may forget to
++    // reset customExtensionValueParser. TODO: Remove Http1::Parser as our
++    // parent class and this unnecessary method with it.
+ }
+ 
+ bool
+@@ -49,14 +56,14 @@ Http::One::TeChunkedParser::parse(const
+     if (parsingStage_ == Http1::HTTP_PARSE_NONE)
+         parsingStage_ = Http1::HTTP_PARSE_CHUNK_SZ;
+ 
+-    Http1::Tokenizer tok(buf_);
++    Tokenizer tok(buf_);
+ 
+     // loop for as many chunks as we can
+     // use do-while instead of while so that we can incrementally
+     // restart in the middle of a chunk/frame
+     do {
+ 
+-        if (parsingStage_ == Http1::HTTP_PARSE_CHUNK_EXT && !parseChunkExtension(tok, theChunkSize))
++        if (parsingStage_ == Http1::HTTP_PARSE_CHUNK_EXT && !parseChunkMetadataSuffix(tok))
+             return false;
+ 
+         if (parsingStage_ == Http1::HTTP_PARSE_CHUNK && !parseChunkBody(tok))
+@@ -80,7 +87,7 @@ Http::One::TeChunkedParser::needsMoreSpa
+ 
+ /// RFC 7230 section 4.1 chunk-size
+ bool
+-Http::One::TeChunkedParser::parseChunkSize(Http1::Tokenizer &tok)
++Http::One::TeChunkedParser::parseChunkSize(Tokenizer &tok)
+ {
+     Must(theChunkSize <= 0); // Should(), really
+ 
+@@ -104,66 +111,75 @@ Http::One::TeChunkedParser::parseChunkSi
+     return false; // should not be reachable
+ }
+ 
+-/**
+- * Parses chunk metadata suffix, looking for interesting extensions and/or
+- * getting to the line terminator. RFC 7230 section 4.1.1 and its Errata #4667:
+- *
+- *   chunk-ext = *( BWS  ";" BWS chunk-ext-name [ BWS "=" BWS chunk-ext-val ] )
+- *   chunk-ext-name = token
+- *   chunk-ext-val  = token / quoted-string
+- *
+- * ICAP 'use-original-body=N' extension is supported.
+- */
+-bool
+-Http::One::TeChunkedParser::parseChunkExtension(Http1::Tokenizer &tok, bool skipKnown)
+-{
+-    SBuf ext;
+-    SBuf value;
+-    while (
+-        ParseBws(tok) && // Bug 4492: IBM_HTTP_Server sends SP after chunk-size
+-        tok.skip(';') &&
+-        ParseBws(tok) && // Bug 4492: ICAP servers send SP before chunk-ext-name
+-        tok.prefix(ext, CharacterSet::TCHAR)) { // chunk-ext-name
+-
+-        // whole value part is optional. if no '=' expect next chunk-ext
+-        if (ParseBws(tok) && tok.skip('=') && ParseBws(tok)) {
+-
+-            if (!skipKnown) {
+-                if (ext.cmp("use-original-body",17) == 0 && tok.int64(useOriginBody, 10)) {
+-                    debugs(94, 3, "Found chunk extension " << ext << "=" << useOriginBody);
+-                    buf_ = tok.remaining(); // parse checkpoint
+-                    continue;
+-                }
+-            }
+-
+-            debugs(94, 5, "skipping unknown chunk extension " << ext);
+-
+-            // unknown might have a value token or quoted-string
+-            if (tok.quotedStringOrToken(value) && !tok.atEnd()) {
+-                buf_ = tok.remaining(); // parse checkpoint
+-                continue;
+-            }
+-
+-            // otherwise need more data OR corrupt syntax
+-            break;
+-        }
+-
+-        if (!tok.atEnd())
+-            buf_ = tok.remaining(); // parse checkpoint (unless there might be more token name)
+-    }
+-
+-    if (skipLineTerminator(tok)) {
+-        buf_ = tok.remaining(); // checkpoint
+-        // non-0 chunk means data, 0-size means optional Trailer follows
++/// Parses "[chunk-ext] CRLF" from RFC 7230 section 4.1.1:
++///   chunk = chunk-size [ chunk-ext ] CRLF chunk-data CRLF
++///   last-chunk = 1*"0" [ chunk-ext ] CRLF
++bool
++Http::One::TeChunkedParser::parseChunkMetadataSuffix(Tokenizer &tok)
++{
++    // Code becomes much simpler when incremental parsing functions throw on
++    // bad or insufficient input, like in the code below. TODO: Expand up.
++    try {
++        parseChunkExtensions(tok); // a possibly empty chunk-ext list
++        skipLineTerminator(tok);
++        buf_ = tok.remaining();
+         parsingStage_ = theChunkSize ? Http1::HTTP_PARSE_CHUNK : Http1::HTTP_PARSE_MIME;
+         return true;
++    } catch (const InsufficientInput &) {
++        tok.reset(buf_); // backtrack to the last commit point
++        return false;
+     }
++    // other exceptions bubble up to kill message parsing
++}
++
++/// Parses the chunk-ext list (RFC 7230 section 4.1.1 and its Errata #4667):
++/// chunk-ext = *( BWS ";" BWS chunk-ext-name [ BWS "=" BWS chunk-ext-val ] )
++void
++Http::One::TeChunkedParser::parseChunkExtensions(Tokenizer &tok)
++{
++    do {
++        ParseBws(tok); // Bug 4492: IBM_HTTP_Server sends SP after chunk-size
+ 
+-    return false;
++        if (!tok.skip(';'))
++            return; // reached the end of extensions (if any)
++
++        parseOneChunkExtension(tok);
++        buf_ = tok.remaining(); // got one extension
++    } while (true);
++}
++
++void
++Http::One::ChunkExtensionValueParser::Ignore(Tokenizer &tok, const SBuf &extName)
++{
++    const auto ignoredValue = tokenOrQuotedString(tok);
++    debugs(94, 5, extName << " with value " << ignoredValue);
++}
++
++/// Parses a single chunk-ext list element:
++/// chunk-ext = *( BWS ";" BWS chunk-ext-name [ BWS "=" BWS chunk-ext-val ] )
++void
++Http::One::TeChunkedParser::parseOneChunkExtension(Tokenizer &tok)
++{
++    ParseBws(tok); // Bug 4492: ICAP servers send SP before chunk-ext-name
++
++    const auto extName = tok.prefix("chunk-ext-name", CharacterSet::TCHAR);
++
++    ParseBws(tok);
++
++    if (!tok.skip('='))
++        return; // parsed a valueless chunk-ext
++
++    ParseBws(tok);
++
++    // optimization: the only currently supported extension needs last-chunk
++    if (!theChunkSize && customExtensionValueParser)
++        customExtensionValueParser->parse(tok, extName);
++    else
++        ChunkExtensionValueParser::Ignore(tok, extName);
+ }
+ 
+ bool
+-Http::One::TeChunkedParser::parseChunkBody(Http1::Tokenizer &tok)
++Http::One::TeChunkedParser::parseChunkBody(Tokenizer &tok)
+ {
+     if (theLeftBodySize > 0) {
+         buf_ = tok.remaining(); // sync buffers before buf_ use
+@@ -188,17 +204,20 @@ Http::One::TeChunkedParser::parseChunkBo
+ }
+ 
+ bool
+-Http::One::TeChunkedParser::parseChunkEnd(Http1::Tokenizer &tok)
++Http::One::TeChunkedParser::parseChunkEnd(Tokenizer &tok)
+ {
+     Must(theLeftBodySize == 0); // Should(), really
+ 
+-    if (skipLineTerminator(tok)) {
++    try {
++        skipLineTerminator(tok);
+         buf_ = tok.remaining(); // parse checkpoint
+         theChunkSize = 0; // done with the current chunk
+         parsingStage_ = Http1::HTTP_PARSE_CHUNK_SZ;
+         return true;
+     }
+-
+-    return false;
++    catch (const InsufficientInput &) {
++        return false;
++    }
++    // other exceptions bubble up to kill message parsing
+ }
+ 
+--- a/src/http/one/TeChunkedParser.h
++++ b/src/http/one/TeChunkedParser.h
+@@ -18,6 +18,26 @@ namespace Http
+ namespace One
+ {
+ 
++using ::Parser::InsufficientInput;
++
++// TODO: Move this class into http/one/ChunkExtensionValueParser.*
++/// A customizable parser of a single chunk extension value (chunk-ext-val).
++/// From RFC 7230 section 4.1.1 and its Errata #4667:
++/// chunk-ext = *( BWS  ";" BWS chunk-ext-name [ BWS "=" BWS chunk-ext-val ] )
++/// chunk-ext-name = token
++/// chunk-ext-val  = token / quoted-string
++class ChunkExtensionValueParser
++{
++public:
++    typedef ::Parser::Tokenizer Tokenizer;
++
++    /// extracts and ignores the value of a named extension
++    static void Ignore(Tokenizer &tok, const SBuf &extName);
++
++    /// extracts and then interprets (or ignores) the extension value
++    virtual void parse(Tokenizer &tok, const SBuf &extName) = 0;
++};
++
+ /**
+  * An incremental parser for chunked transfer coding
+  * defined in RFC 7230 section 4.1.
+@@ -25,7 +45,7 @@ namespace One
+  *
+  * The parser shovels content bytes from the raw
+  * input buffer into the content output buffer, both caller-supplied.
+- * Ignores chunk extensions except for ICAP's ieof.
++ * Chunk extensions like use-original-body are handled via parseExtensionValuesWith().
+  * Trailers are available via mimeHeader() if wanted.
+  */
+ class TeChunkedParser : public Http1::Parser
+@@ -37,6 +57,10 @@ public:
+     /// set the buffer to be used to store decoded chunk data
+     void setPayloadBuffer(MemBuf *parsedContent) {theOut = parsedContent;}
+ 
++    /// Instead of ignoring all chunk extension values, give the supplied
++    /// parser a chance to handle them. Only applied to last-chunk (for now).
++    void parseExtensionValuesWith(ChunkExtensionValueParser *parser) { customExtensionValueParser = parser; }
++
+     bool needsMoreSpace() const;
+ 
+     /* Http1::Parser API */
+@@ -45,17 +69,20 @@ public:
+     virtual Parser::size_type firstLineSize() const {return 0;} // has no meaning with multiple chunks
+ 
+ private:
+-    bool parseChunkSize(Http1::Tokenizer &tok);
+-    bool parseChunkExtension(Http1::Tokenizer &tok, bool skipKnown);
+-    bool parseChunkBody(Http1::Tokenizer &tok);
+-    bool parseChunkEnd(Http1::Tokenizer &tok);
++    bool parseChunkSize(Tokenizer &tok);
++    bool parseChunkMetadataSuffix(Tokenizer &);
++    void parseChunkExtensions(Tokenizer &);
++    void parseOneChunkExtension(Tokenizer &);
++    bool parseChunkBody(Tokenizer &tok);
++    bool parseChunkEnd(Tokenizer &tok);
+ 
+     MemBuf *theOut;
+     uint64_t theChunkSize;
+     uint64_t theLeftBodySize;
+ 
+-public:
+-    int64_t useOriginBody;
++    /// An optional plugin for parsing and interpreting custom chunk-ext-val.
++    /// This "visitor" object is owned by our creator.
++    ChunkExtensionValueParser *customExtensionValueParser;
+ };
+ 
+ } // namespace One
+--- a/src/http/one/Tokenizer.cc
++++ b/src/http/one/Tokenizer.cc
+@@ -8,35 +8,18 @@
+ 
+ #include "squid.h"
+ #include "Debug.h"
++#include "http/one/Parser.h"
+ #include "http/one/Tokenizer.h"
++#include "parser/Tokenizer.h"
++#include "sbuf/Stream.h"
+ 
+-bool
+-Http::One::Tokenizer::quotedString(SBuf &returnedToken, const bool http1p0)
++/// Extracts quoted-string after the caller removes the initial '"'.
++/// \param http1p0 whether to prohibit \-escaped characters in quoted strings
++/// \throws InsufficientInput when input can be a token _prefix_
++/// \returns extracted quoted string (without quotes and with chars unescaped)
++static SBuf
++parseQuotedStringSuffix(Parser::Tokenizer &tok, const bool http1p0)
+ {
+-    checkpoint();
+-
+-    if (!skip('"'))
+-        return false;
+-
+-    return qdText(returnedToken, http1p0);
+-}
+-
+-bool
+-Http::One::Tokenizer::quotedStringOrToken(SBuf &returnedToken, const bool http1p0)
+-{
+-    checkpoint();
+-
+-    if (!skip('"'))
+-        return prefix(returnedToken, CharacterSet::TCHAR);
+-
+-    return qdText(returnedToken, http1p0);
+-}
+-
+-bool
+-Http::One::Tokenizer::qdText(SBuf &returnedToken, const bool http1p0)
+-{
+-    // the initial DQUOTE has been skipped by the caller
+-
+     /*
+      * RFC 1945 - defines qdtext:
+      *   inclusive of LWS (which includes CR and LF)
+@@ -61,12 +44,17 @@ Http::One::Tokenizer::qdText(SBuf &retur
+     // best we can do is a conditional reference since http1p0 value may change per-client
+     const CharacterSet &tokenChars = (http1p0 ? qdtext1p0 : qdtext1p1);
+ 
+-    for (;;) {
+-        SBuf::size_type prefixLen = buf().findFirstNotOf(tokenChars);
+-        returnedToken.append(consume(prefixLen));
++    SBuf parsedToken;
++
++    while (!tok.atEnd()) {
++        SBuf qdText;
++        if (tok.prefix(qdText, tokenChars))
++            parsedToken.append(qdText);
++
++        if (!http1p0 && tok.skip('\\')) { // HTTP/1.1 allows quoted-pair, HTTP/1.0 does not
++            if (tok.atEnd())
++                break;
+ 
+-        // HTTP/1.1 allows quoted-pair, HTTP/1.0 does not
+-        if (!http1p0 && skip('\\')) {
+             /* RFC 7230 section 3.2.6
+              *
+              * The backslash octet ("\") can be used as a single-octet quoting
+@@ -78,32 +66,42 @@ Http::One::Tokenizer::qdText(SBuf &retur
+              */
+             static const CharacterSet qPairChars = CharacterSet::HTAB + CharacterSet::SP + CharacterSet::VCHAR + CharacterSet::OBSTEXT;
+             SBuf escaped;
+-            if (!prefix(escaped, qPairChars, 1)) {
+-                returnedToken.clear();
+-                restoreLastCheckpoint();
+-                return false;
+-            }
+-            returnedToken.append(escaped);
++            if (!tok.prefix(escaped, qPairChars, 1))
++                throw TexcHere("invalid escaped character in quoted-pair");
++
++            parsedToken.append(escaped);
+             continue;
++        }
+ 
+-        } else if (skip('"')) {
+-            break; // done
++        if (tok.skip('"'))
++            return parsedToken; // may be empty
+ 
+-        } else if (atEnd()) {
+-            // need more data
+-            returnedToken.clear();
+-            restoreLastCheckpoint();
+-            return false;
+-        }
++        if (tok.atEnd())
++            break;
+ 
+-        // else, we have an error
+-        debugs(24, 8, "invalid bytes for set " << tokenChars.name);
+-        returnedToken.clear();
+-        restoreLastCheckpoint();
+-        return false;
++        throw TexcHere(ToSBuf("invalid bytes for set ", tokenChars.name));
+     }
+ 
+-    // found the whole string
+-    return true;
++    throw Http::One::InsufficientInput();
++}
++
++SBuf
++Http::One::tokenOrQuotedString(Parser::Tokenizer &tok, const bool http1p0)
++{
++    if (tok.skip('"'))
++        return parseQuotedStringSuffix(tok, http1p0);
++
++    if (tok.atEnd())
++        throw InsufficientInput();
++
++    SBuf parsedToken;
++    if (!tok.prefix(parsedToken, CharacterSet::TCHAR))
++        throw TexcHere("invalid input while expecting an HTTP token");
++
++    if (tok.atEnd())
++        throw InsufficientInput();
++
++    // got the complete token
++    return parsedToken;
+ }
+ 
+--- a/src/http/one/Tokenizer.h
++++ b/src/http/one/Tokenizer.h
+@@ -9,68 +9,47 @@
+ #ifndef SQUID_SRC_HTTP_ONE_TOKENIZER_H
+ #define SQUID_SRC_HTTP_ONE_TOKENIZER_H
+ 
+-#include "parser/Tokenizer.h"
++#include "parser/forward.h"
++#include "sbuf/forward.h"
+ 
+ namespace Http {
+ namespace One {
+ 
+ /**
+- * Lexical processor extended to tokenize HTTP/1.x syntax.
++ * Extracts either an HTTP/1 token or quoted-string while dealing with
++ * possibly incomplete input typical for incremental text parsers.
++ * Unescapes escaped characters in HTTP/1.1 quoted strings.
+  *
+- * \see ::Parser::Tokenizer for more detail
++ * \param http1p0 whether to prohibit \-escaped characters in quoted strings
++ * \throws InsufficientInput as appropriate, including on unterminated tokens
++ * \returns extracted token or quoted string (without quotes)
++ *
++ * Governed by:
++ *  - RFC 1945 section 2.1
++ *  "
++ *    A string of text is parsed as a single word if it is quoted using
++ *    double-quote marks.
++ *
++ *        quoted-string  = ( <"> *(qdtext) <"> )
++ *
++ *        qdtext         = <any CHAR except <"> and CTLs,
++ *                         but including LWS>
++ *
++ *    Single-character quoting using the backslash ("\") character is not
++ *    permitted in HTTP/1.0.
++ *  "
++ *
++ *  - RFC 7230 section 3.2.6
++ *  "
++ *    A string of text is parsed as a single value if it is quoted using
++ *    double-quote marks.
++ *
++ *    quoted-string  = DQUOTE *( qdtext / quoted-pair ) DQUOTE
++ *    qdtext         = HTAB / SP /%x21 / %x23-5B / %x5D-7E / obs-text
++ *    obs-text       = %x80-FF
++ *  "
+  */
+-class Tokenizer : public ::Parser::Tokenizer
+-{
+-public:
+-    Tokenizer(SBuf &s) : ::Parser::Tokenizer(s), savedStats_(0) {}
+-
+-    /**
+-     * Attempt to parse a quoted-string lexical construct.
+-     *
+-     * Governed by:
+-     *  - RFC 1945 section 2.1
+-     *  "
+-     *    A string of text is parsed as a single word if it is quoted using
+-     *    double-quote marks.
+-     *
+-     *        quoted-string  = ( <"> *(qdtext) <"> )
+-     *
+-     *        qdtext         = <any CHAR except <"> and CTLs,
+-     *                         but including LWS>
+-     *
+-     *    Single-character quoting using the backslash ("\") character is not
+-     *    permitted in HTTP/1.0.
+-     *  "
+-     *
+-     *  - RFC 7230 section 3.2.6
+-     *  "
+-     *    A string of text is parsed as a single value if it is quoted using
+-     *    double-quote marks.
+-     *
+-     *    quoted-string  = DQUOTE *( qdtext / quoted-pair ) DQUOTE
+-     *    qdtext         = HTAB / SP /%x21 / %x23-5B / %x5D-7E / obs-text
+-     *    obs-text       = %x80-FF
+-     *  "
+-     *
+-     * \param escaped HTTP/1.0 does not permit \-escaped characters
+-     */
+-    bool quotedString(SBuf &value, const bool http1p0 = false);
+-
+-    /**
+-     * Attempt to parse a (token / quoted-string ) lexical construct.
+-     */
+-    bool quotedStringOrToken(SBuf &value, const bool http1p0 = false);
+-
+-private:
+-    /// parse the internal component of a quote-string, and terminal DQUOTE
+-    bool qdText(SBuf &value, const bool http1p0);
+-
+-    void checkpoint() { savedCheckpoint_ = buf(); savedStats_ = parsedSize(); }
+-    void restoreLastCheckpoint() { undoParse(savedCheckpoint_, savedStats_); }
+-
+-    SBuf savedCheckpoint_;
+-    SBuf::size_type savedStats_;
+-};
++SBuf tokenOrQuotedString(Parser::Tokenizer &tok, const bool http1p0 = false);
+ 
+ } // namespace One
+ } // namespace Http
+--- a/src/http/one/forward.h
++++ b/src/http/one/forward.h
+@@ -10,6 +10,7 @@
+ #define SQUID_SRC_HTTP_ONE_FORWARD_H
+ 
+ #include "base/RefCount.h"
++#include "parser/forward.h"
+ #include "sbuf/forward.h"
+ 
+ namespace Http {
+@@ -31,6 +32,8 @@ typedef RefCount<Http::One::ResponsePars
+ /// CRLF textual representation
+ const SBuf &CrLf();
+ 
++using ::Parser::InsufficientInput;
++
+ } // namespace One
+ } // namespace Http
+ 
+--- a/src/parser/BinaryTokenizer.h
++++ b/src/parser/BinaryTokenizer.h
+@@ -9,6 +9,7 @@
+ #ifndef SQUID_SRC_PARSER_BINARYTOKENIZER_H
+ #define SQUID_SRC_PARSER_BINARYTOKENIZER_H
+ 
++#include "parser/forward.h"
+ #include "sbuf/SBuf.h"
+ 
+ namespace Parser
+@@ -44,7 +45,7 @@ public:
+ class BinaryTokenizer
+ {
+ public:
+-    class InsufficientInput {}; // thrown when a method runs out of data
++    typedef ::Parser::InsufficientInput InsufficientInput;
+     typedef uint64_t size_type; // enough for the largest supported offset
+ 
+     BinaryTokenizer();
+--- a/src/parser/Makefile.am
++++ b/src/parser/Makefile.am
+@@ -13,6 +13,7 @@ noinst_LTLIBRARIES = libparser.la
+ libparser_la_SOURCES = \
+ 	BinaryTokenizer.h \
+ 	BinaryTokenizer.cc \
++	forward.h \
+ 	Tokenizer.h \
+ 	Tokenizer.cc
+ 
+--- a/src/parser/Tokenizer.cc
++++ b/src/parser/Tokenizer.cc
+@@ -10,7 +10,9 @@
+ 
+ #include "squid.h"
+ #include "Debug.h"
++#include "parser/forward.h"
+ #include "parser/Tokenizer.h"
++#include "sbuf/Stream.h"
+ 
+ #include <cerrno>
+ #if HAVE_CTYPE_H
+@@ -96,6 +98,23 @@ Parser::Tokenizer::prefix(SBuf &returned
+     return true;
+ }
+ 
++SBuf
++Parser::Tokenizer::prefix(const char *description, const CharacterSet &tokenChars, const SBuf::size_type limit)
++{
++    if (atEnd())
++        throw InsufficientInput();
++
++    SBuf result;
++
++    if (!prefix(result, tokenChars, limit))
++        throw TexcHere(ToSBuf("cannot parse ", description));
++
++    if (atEnd())
++        throw InsufficientInput();
++
++    return result;
++}
++
+ bool
+ Parser::Tokenizer::suffix(SBuf &returnedToken, const CharacterSet &tokenChars, const SBuf::size_type limit)
+ {
+@@ -283,3 +302,24 @@ Parser::Tokenizer::int64(int64_t & resul
+     return success(s - range.rawContent());
+ }
+ 
++int64_t
++Parser::Tokenizer::udec64(const char *description, const SBuf::size_type limit)
++{
++    if (atEnd())
++        throw InsufficientInput();
++
++    int64_t result = 0;
++
++    // Since we only support unsigned decimals, a parsing failure with a
++    // non-empty input always implies invalid/malformed input (or a buggy
++    // limit=0 caller). TODO: Support signed and non-decimal integers by
++    // refactoring int64() to detect insufficient input.
++    if (!int64(result, 10, false, limit))
++        throw TexcHere(ToSBuf("cannot parse ", description));
++
++    if (atEnd())
++        throw InsufficientInput(); // more digits may be coming
++
++    return result;
++}
++
+--- a/src/parser/Tokenizer.h
++++ b/src/parser/Tokenizer.h
+@@ -143,6 +143,19 @@ public:
+      */
+     bool int64(int64_t &result, int base = 0, bool allowSign = true, SBuf::size_type limit = SBuf::npos);
+ 
++    /*
++     * The methods below mimic their counterparts documented above, but they
++     * throw on errors, including InsufficientInput. The field description
++     * parameter is used for error reporting and debugging.
++     */
++
++    /// prefix() wrapper but throws InsufficientInput if input contains
++    /// nothing but the prefix (i.e. if the prefix is not "terminated")
++    SBuf prefix(const char *description, const CharacterSet &tokenChars, SBuf::size_type limit = SBuf::npos);
++
++    /// int64() wrapper but limited to unsigned decimal integers (for now)
++    int64_t udec64(const char *description, SBuf::size_type limit = SBuf::npos);
++
+ protected:
+     SBuf consume(const SBuf::size_type n);
+     SBuf::size_type success(const SBuf::size_type n);
+--- /dev/null
++++ b/src/parser/forward.h
+@@ -0,0 +1,22 @@
++/*
++ * Copyright (C) 1996-2019 The Squid Software Foundation and contributors
++ *
++ * Squid software is distributed under GPLv2+ license and includes
++ * contributions from numerous individuals and organizations.
++ * Please see the COPYING and CONTRIBUTORS files for details.
++ */
++
++#ifndef SQUID_PARSER_FORWARD_H
++#define SQUID_PARSER_FORWARD_H
++
++namespace Parser {
++class Tokenizer;
++class BinaryTokenizer;
++
++// TODO: Move this declaration (to parser/Elements.h) if we need more like it.
++/// thrown by modern "incremental" parsers when they need more data
++class InsufficientInput {};
++} // namespace Parser
++
++#endif /* SQUID_PARSER_FORWARD_H */
++
diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2023-46846.patch b/meta-networking/recipes-daemons/squid/files/CVE-2023-46846.patch
new file mode 100644
index 000000000..a6d0965e7
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2023-46846.patch
@@ -0,0 +1,169 @@
+From 05f6af2f4c85cc99323cfff6149c3d74af661b6d Mon Sep 17 00:00:00 2001
+From: Amos Jeffries <yadij@users.noreply.github.com>
+Date: Fri, 13 Oct 2023 08:44:16 +0000
+Subject: [PATCH] RFC 9112: Improve HTTP chunked encoding compliance (#1498)
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/squid/tree/debian/patches/CVE-2023-46846.patch?h=ubuntu/focal-security&id=9ccd217ca9428c9a6597e9310a99552026b245fa
+Upstream commit https://github.com/squid-cache/squid/commit/05f6af2f4c85cc99323cfff6149c3d74af661b6d]
+CVE: CVE-2023-46846
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/http/one/Parser.cc          |  8 +-------
+ src/http/one/Parser.h           |  4 +---
+ src/http/one/TeChunkedParser.cc | 23 ++++++++++++++++++-----
+ src/parser/Tokenizer.cc         | 12 ++++++++++++
+ src/parser/Tokenizer.h          |  7 +++++++
+ 5 files changed, 39 insertions(+), 15 deletions(-)
+
+--- a/src/http/one/Parser.cc
++++ b/src/http/one/Parser.cc
+@@ -65,16 +65,10 @@ Http::One::Parser::DelimiterCharacters()
+ void
+ Http::One::Parser::skipLineTerminator(Tokenizer &tok) const
+ {
+-    if (tok.skip(Http1::CrLf()))
+-        return;
+-
+     if (Config.onoff.relaxed_header_parser && tok.skipOne(CharacterSet::LF))
+         return;
+ 
+-    if (tok.atEnd() || (tok.remaining().length() == 1 && tok.remaining().at(0) == '\r'))
+-        throw InsufficientInput();
+-
+-    throw TexcHere("garbage instead of CRLF line terminator");
++    tok.skipRequired("line-terminating CRLF", Http1::CrLf());
+ }
+ 
+ /// all characters except the LF line terminator
+--- a/src/http/one/Parser.h
++++ b/src/http/one/Parser.h
+@@ -120,9 +120,7 @@ protected:
+      * detect and skip the CRLF or (if tolerant) LF line terminator
+      * consume from the tokenizer.
+      *
+-     * \throws exception on bad or InsuffientInput.
+-     * \retval true only if line terminator found.
+-     * \retval false incomplete or missing line terminator, need more data.
++     * \throws exception on bad or InsufficientInput
+      */
+     void skipLineTerminator(Tokenizer &) const;
+ 
+--- a/src/http/one/TeChunkedParser.cc
++++ b/src/http/one/TeChunkedParser.cc
+@@ -91,6 +91,11 @@ Http::One::TeChunkedParser::parseChunkSi
+ {
+     Must(theChunkSize <= 0); // Should(), really
+ 
++    static const SBuf bannedHexPrefixLower("0x");
++    static const SBuf bannedHexPrefixUpper("0X");
++    if (tok.skip(bannedHexPrefixLower) || tok.skip(bannedHexPrefixUpper))
++        throw TextException("chunk starts with 0x", Here());
++
+     int64_t size = -1;
+     if (tok.int64(size, 16, false) && !tok.atEnd()) {
+         if (size < 0)
+@@ -121,7 +126,7 @@ Http::One::TeChunkedParser::parseChunkMe
+     // bad or insufficient input, like in the code below. TODO: Expand up.
+     try {
+         parseChunkExtensions(tok); // a possibly empty chunk-ext list
+-        skipLineTerminator(tok);
++        tok.skipRequired("CRLF after [chunk-ext]", Http1::CrLf());
+         buf_ = tok.remaining();
+         parsingStage_ = theChunkSize ? Http1::HTTP_PARSE_CHUNK : Http1::HTTP_PARSE_MIME;
+         return true;
+@@ -132,12 +137,14 @@ Http::One::TeChunkedParser::parseChunkMe
+     // other exceptions bubble up to kill message parsing
+ }
+ 
+-/// Parses the chunk-ext list (RFC 7230 section 4.1.1 and its Errata #4667):
++/// Parses the chunk-ext list (RFC 9112 section 7.1.1:
+ /// chunk-ext = *( BWS ";" BWS chunk-ext-name [ BWS "=" BWS chunk-ext-val ] )
+ void
+-Http::One::TeChunkedParser::parseChunkExtensions(Tokenizer &tok)
++Http::One::TeChunkedParser::parseChunkExtensions(Tokenizer &callerTok)
+ {
+     do {
++        auto tok = callerTok;
++
+         ParseBws(tok); // Bug 4492: IBM_HTTP_Server sends SP after chunk-size
+ 
+         if (!tok.skip(';'))
+@@ -145,6 +152,7 @@ Http::One::TeChunkedParser::parseChunkEx
+ 
+         parseOneChunkExtension(tok);
+         buf_ = tok.remaining(); // got one extension
++        callerTok = tok;
+     } while (true);
+ }
+ 
+@@ -158,11 +166,14 @@ Http::One::ChunkExtensionValueParser::Ig
+ /// Parses a single chunk-ext list element:
+ /// chunk-ext = *( BWS ";" BWS chunk-ext-name [ BWS "=" BWS chunk-ext-val ] )
+ void
+-Http::One::TeChunkedParser::parseOneChunkExtension(Tokenizer &tok)
++Http::One::TeChunkedParser::parseOneChunkExtension(Tokenizer &callerTok)
+ {
++    auto tok = callerTok;
++
+     ParseBws(tok); // Bug 4492: ICAP servers send SP before chunk-ext-name
+ 
+     const auto extName = tok.prefix("chunk-ext-name", CharacterSet::TCHAR);
++    callerTok = tok; // in case we determine that this is a valueless chunk-ext
+ 
+     ParseBws(tok);
+ 
+@@ -176,6 +187,8 @@ Http::One::TeChunkedParser::parseOneChun
+         customExtensionValueParser->parse(tok, extName);
+     else
+         ChunkExtensionValueParser::Ignore(tok, extName);
++
++    callerTok = tok;
+ }
+ 
+ bool
+@@ -209,7 +222,7 @@ Http::One::TeChunkedParser::parseChunkEn
+     Must(theLeftBodySize == 0); // Should(), really
+ 
+     try {
+-        skipLineTerminator(tok);
++        tok.skipRequired("chunk CRLF", Http1::CrLf());
+         buf_ = tok.remaining(); // parse checkpoint
+         theChunkSize = 0; // done with the current chunk
+         parsingStage_ = Http1::HTTP_PARSE_CHUNK_SZ;
+--- a/src/parser/Tokenizer.cc
++++ b/src/parser/Tokenizer.cc
+@@ -147,6 +147,18 @@ Parser::Tokenizer::skipAll(const Charact
+     return success(prefixLen);
+ }
+ 
++void
++Parser::Tokenizer::skipRequired(const char *description, const SBuf &tokenToSkip)
++{
++    if (skip(tokenToSkip) || tokenToSkip.isEmpty())
++        return;
++
++    if (tokenToSkip.startsWith(buf_))
++        throw InsufficientInput();
++
++    throw TextException(ToSBuf("cannot skip ", description), Here());
++}
++
+ bool
+ Parser::Tokenizer::skipOne(const CharacterSet &chars)
+ {
+--- a/src/parser/Tokenizer.h
++++ b/src/parser/Tokenizer.h
+@@ -115,6 +115,13 @@ public:
+      */
+     SBuf::size_type skipAll(const CharacterSet &discardables);
+ 
++    /** skips a given character sequence (string);
++     * does nothing if the sequence is empty
++     *
++     * \throws exception on mismatching prefix or InsufficientInput
++     */
++    void skipRequired(const char *description, const SBuf &tokenToSkip);
++
+     /** Removes a single trailing character from the set.
+      *
+      * \return whether a character was removed
diff --git a/meta-networking/recipes-daemons/squid/squid_4.9.bb b/meta-networking/recipes-daemons/squid/squid_4.9.bb
index c9a92772d..98257e54c 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.9.bb
@@ -25,6 +25,9 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
            file://0001-tools.cc-fixed-unused-result-warning.patch \
            file://0001-splay.cc-fix-bind-is-not-a-member-of-std.patch \
            file://CVE-2023-46847.patch \
+           file://CVE-2023-46728.patch \
+           file://CVE-2023-46846-pre1.patch \
+           file://CVE-2023-46846.patch \
            "
 
 SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
-- 
2.25.1


