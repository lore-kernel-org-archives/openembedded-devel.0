Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web08.7459.1611911982903163022
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 01:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=jCgm+xTj;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=656a671b5=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1611911982; x=1643447982;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=istmgNrjYyYfosmh01GkLcOeZmJw71A11clZNf4NgPE=;
  b=jCgm+xTj43wWwPPrnr9RwOna8KMXXDJuWid3OMsx2wNGeu/BPSLxMyiJ
   URMb6bPYmAecTovkWuiyJNNmzuRtSoL7id7SMHKesqkahy5iR61wC5MII
   1QyCIWilOJjIfcT4/UiKTl9WkFPWmpC/cFV7QlfQ8Pww04tp6C6sPDGz8
   0=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 29 Jan 2021 10:19:39 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw4.muc with ESMTP/TLS;
 29 Jan 2021 10:19:39 +0100
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp) ([160.48.96.43])
 by esabb6.muc with ESMTP/TLS; 29 Jan 2021 10:19:32 +0100
Received: from michael-pcx.bmw-carit.intra (192.168.221.41) by
 smucm09k.europe.bmw.corp (160.48.96.43) with Microsoft SMTP Server (TLS;
 Fri, 29 Jan 2021 10:19:30 +0100
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Michael Ho <Michael.Ho@bmw.de>
Subject: [meta-java][PATCH] openjdk-8-cross.inc: exclude BB_NUMBER_THREADS from sstate hash
Date: Fri, 29 Jan 2021 10:19:21 +0100
Message-ID: <1611911961-96454-1-git-send-email-michael.ho@bmw.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Return-Path: michael.ho@bmw.de
X-ClientProxiedBy: smucm15l.europe.bmw.corp (160.48.96.68) To
 smucm09k.europe.bmw.corp (160.48.96.43)
Content-Type: text/plain

From: Michael Ho <Michael.Ho@bmw.de>

The sstate-cache for openjre is not shareable across multiple machines
because the parallelisation configuration of Bitbake is being embedded
into the sstate hash of openjre.

Exclude BB_NUMBER_THREADS from the do_install sstate hashing to avoid
this issue.

Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 9f68d08..25d971f 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -99,6 +99,8 @@ do_install_append() {
     fi
 }
 
+do_install[vardepsexclude] += "BB_NUMBER_THREADS"
+
 export MAKE_VERBOSE = "y"
 export MFLAGS="${@jdk_make_options(d)} MAKE_VERBOSE=y QUIETLY= VERBOSE=-s LOG_LEVEL=trace STRIP_POLICY=no_strip"
 
-- 
2.7.4

