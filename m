Return-Path: <Catalin.Enache@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0B55B77175
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 07:45:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4V7jWI9022224
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 00:45:32 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.124.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 31 May 2016 00:45:31 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 31 May 2016 10:50:14 +0300
Message-ID: <1464681014-17612-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] squid: CVE-2016-4556
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
X-List-Received-Date: Tue, 31 May 2016 07:45:32 -0000
Content-Type: text/plain

Double free vulnerability in Esi.cc in Squid 3.x before 3.5.18
and 4.x before 4.0.10 allows remote servers to cause a denial
of service (crash) via a crafted Edge Side Includes (ESI) response.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4556

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../squid/files/CVE-2016-4556.patch                | 96 ++++++++++++++++++++++
 .../recipes-daemons/squid/squid_3.5.7.bb           |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2016-4556.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2016-4556.patch b/meta-networking/recipes-daemons/squid/files/CVE-2016-4556.patch
new file mode 100644
index 0000000..e990c4a
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2016-4556.patch
@@ -0,0 +1,96 @@
+From ee68ec6602f88ee588ac01d440b45af2a1ac2614 Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Tue, 31 May 2016 09:17:40 +0300
+Subject: [PATCH] Fix SIGSEGV in ESIContext response handling
+
+HttpReply pointer was being unlocked without heving been locked.
+Resulting in a double-free. Make it use RefCount instead of
+manual locking to ensure locked/unlock is always symmetrical.
+
+Upstream-Status: Backport
+CVE: CVE-2016-4556
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/esi/Context.h |  3 ++-
+ src/esi/Esi.cc    | 14 +++++++-------
+ 2 files changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/src/esi/Context.h b/src/esi/Context.h
+index 6d15bfe..9982d5c 100644
+--- a/src/esi/Context.h
++++ b/src/esi/Context.h
+@@ -13,6 +13,7 @@
+ #include "err_type.h"
+ #include "esi/Element.h"
+ #include "esi/Parser.h"
++#include "HttpReply.h"
+ #include "http/StatusCode.h"
+ 
+ class ESIVarState;
+@@ -91,7 +92,7 @@ public:
+     err_type errorpage; /* if we error what page to use */
+     Http::StatusCode errorstatus; /* if we error, what code to return */
+     char *errormessage; /* error to pass to error page */
+-    HttpReply *rep; /* buffered until we pass data downstream */
++    HttpReply::Pointer rep; /* buffered until we pass data downstream */
+     ESISegment::Pointer buffered; /* unprocessed data - for whatever reason */
+     ESISegment::Pointer incoming;
+     /* processed data we are waiting to send, or for
+diff --git a/src/esi/Esi.cc b/src/esi/Esi.cc
+index 768b139..338e90b 100644
+--- a/src/esi/Esi.cc
++++ b/src/esi/Esi.cc
+@@ -573,7 +573,7 @@ ESIContext::send ()
+ 
+ #endif
+ 
+-    if (!(rep || (outbound.getRaw() &&
++    if (!(rep != NULL || (outbound.getRaw() &&
+                   outbound->len && (outbound_offset <= outbound->len)))) {
+         debugs(86, 5, "ESIContext::send: Nothing to send.");
+         return 0;
+@@ -618,18 +618,18 @@ ESIContext::send ()
+     flags.clientwantsdata = 0;
+     debugs(86, 5, "ESIContext::send: this=" << this << " Client no longer wants data ");
+     /* Deal with re-entrancy */
+-    HttpReply *temprep = rep;
++    HttpReply::Pointer temprep = rep;
+     rep = NULL; /* freed downstream */
+ 
+-    if (temprep && varState)
+-        varState->buildVary (temprep);
++    if (temprep != NULL && varState)
++        varState->buildVary(temprep.getRaw());
+ 
+     {
+         StoreIOBuffer tempBuffer;
+         tempBuffer.length = len;
+         tempBuffer.offset = pos - len;
+         tempBuffer.data = next->readBuffer.data;
+-        clientStreamCallback (thisNode, http, temprep, tempBuffer);
++        clientStreamCallback (thisNode, http, temprep.getRaw(), tempBuffer);
+     }
+ 
+     if (len == 0)
+@@ -1259,7 +1259,7 @@ ESIContext::parse()
+         ++parserState.stackdepth;
+     }
+ 
+-    if (rep && !parserState.inited())
++    if (rep != NULL && !parserState.inited())
+         parserState.init(this);
+ 
+     /* we have data */
+@@ -1398,7 +1398,7 @@ ESIContext::freeResources ()
+ {
+     debugs(86, 5, HERE << "Freeing for this=" << this);
+ 
+-    HTTPMSGUNLOCK(rep);
++    rep = NULL; // refcounted
+ 
+     finishChildren ();
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
index 6040171..83a0b45 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://CVE-2016-3947.patch \
            file://CVE-2016-4554.patch \
            file://CVE-2016-4555.patch \
+           file://CVE-2016-4556.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
-- 
2.7.4


