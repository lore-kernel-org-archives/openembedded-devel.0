Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id E678572F47
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 May 2017 00:04:48 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id v1so18195254pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 May 2017 17:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hMA09CEowo5t9dM6cJZAV4NrcqBztPQj/OKd2SE5E/8=;
	b=qv7tE9nf4yu17Kg2iUujK37nkJgjbu9kn0kHkiSHrl5fqescqjikjYl0FcR50yxfjh
	lUU0gN4BAsqD+9hnWmuuFTlG3gFzBFGyotR1v7SsQ96gPgSi+mk8XaZOPckNIEv38e5m
	vtjrb1nYtL1dcAQQXXwZXvcjG5H3i40o6rSSwGsyRRpjez8WofpQ0ak0KeG5vRE4hJXz
	ZdfAfQ/kUWiLRc53an5X6M3iKk53YTj4kr2CgoN5rhDWgfZWDubrJxUnoGD/CUsuZWYK
	+VcXoh0yAs9TSpgxu9+euWQDSrk0bNE1nTGIcRP/F+a/JRq+t1FdD5NMtg0XtDHJVNcL
	01ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hMA09CEowo5t9dM6cJZAV4NrcqBztPQj/OKd2SE5E/8=;
	b=W0u5X+TSOfS48eJTql/xTUklQ/QJpxKWONsczXOP+AeZbVD2ZeDeqP9LhlytLKAxde
	t8yzS5/9y4dP7nV33aCg6EeBPjyq/k0GdsBovoqjZMd+LcyJXUimx6FmiD+wQcuiqN4W
	nFc3QALPcjkHky+JPOltOG6OwosaklaJ3GAM2TRgXjV+A6CrKCvxJRjtgc5JVFsyR1mw
	+Ne4hTc08kZ0ua6Q3trT2PO3vdTqJI8GzCQyJncrAkBI/wIm126NWVAfQ2jEk98apqA7
	a1V2jZQoWsPD7oh48SYRX3VADgnNyQ+L0tnG3ICSsFIa9WpCsybJ04r/svx7ym+IW5X6
	YY2Q==
X-Gm-Message-State: AN3rC/47QVZOhxBbhGx5JCxuEDyw3zxCs/D1brFtbOFPPnnYs55s5YoV
	hPnmRA/4PwE6oQ==
X-Received: by 10.99.123.81 with SMTP id k17mr7520464pgn.125.1493683489492;
	Mon, 01 May 2017 17:04:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8882:b8c::d586])
	by smtp.gmail.com with ESMTPSA id l62sm30886pfb.91.2017.05.01.17.04.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 May 2017 17:04:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 May 2017 17:04:31 -0700
Message-Id: <20170502000431.28568-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-networking][PATCH] openhpi: Fix build with gcc7
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
X-List-Received-Date: Tue, 02 May 2017 00:04:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-Fix-build-failures-with-gcc7.patch  | 49 ++++++++++++++++++++++
 .../recipes-daemons/openhpi/openhpi_3.6.1.bb       |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/0001-Fix-build-failures-with-gcc7.patch

diff --git a/meta-networking/recipes-daemons/openhpi/files/0001-Fix-build-failures-with-gcc7.patch b/meta-networking/recipes-daemons/openhpi/files/0001-Fix-build-failures-with-gcc7.patch
new file mode 100644
index 000000000..4f493f7b8
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/0001-Fix-build-failures-with-gcc7.patch
@@ -0,0 +1,49 @@
+From 398c6db66c643ed6133cc2b028ab1e27a17c5295 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 1 May 2017 19:10:09 +0000
+Subject: [PATCH] Fix build failures with gcc7
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plugins/ipmidirect/ipmi_mc_vendor.cpp | 2 +-
+ plugins/ipmidirect/ipmi_resource.cpp  | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/plugins/ipmidirect/ipmi_mc_vendor.cpp b/plugins/ipmidirect/ipmi_mc_vendor.cpp
+index 2c6c090..557771c 100644
+--- a/plugins/ipmidirect/ipmi_mc_vendor.cpp
++++ b/plugins/ipmidirect/ipmi_mc_vendor.cpp
+@@ -322,7 +322,7 @@ cIpmiMcVendor::CreateResources( cIpmiDomain *domain, cIpmiMc *source_mc, cIpmiSd
+       if ( addr.m_channel != source_mc->GetChannel() ) 
+           stdlog << "WARNING : SDR channel " << addr.m_channel << " NOT equal to MC channel " << source_mc->GetChannel() << "\n";
+ 
+-       if ( FindOrCreateResource( domain, source_mc, fru_id, sdr, sdrs ) == false ) {
++       if ( !FindOrCreateResource( domain, source_mc, fru_id, sdr, sdrs ) ) {
+ 	    return false;
+ 	}
+      }
+diff --git a/plugins/ipmidirect/ipmi_resource.cpp b/plugins/ipmidirect/ipmi_resource.cpp
+index c438e74..2552673 100644
+--- a/plugins/ipmidirect/ipmi_resource.cpp
++++ b/plugins/ipmidirect/ipmi_resource.cpp
+@@ -73,7 +73,7 @@ cIpmiResource::SendCommandReadLock( const cIpmiMsg &msg, cIpmiMsg &rsp,
+ 
+   domain->ReadLock();
+ 
+-  if ( domain->VerifyResource( resource ) == false )
++  if ( !domain->VerifyResource( resource ) )
+        return SA_ERR_HPI_NOT_PRESENT;
+ 
+   return rv;
+@@ -91,7 +91,7 @@ cIpmiResource::SendCommandReadLock( cIpmiRdr *rdr, const cIpmiMsg &msg, cIpmiMsg
+   
+   domain->ReadLock();
+   
+-  if ( domain->VerifyRdr( rdr ) == false )
++  if ( !domain->VerifyRdr( rdr ) )
+        return SA_ERR_HPI_NOT_PRESENT;
+ 
+   return rv;
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
index b9b0437b2..db2a24a9b 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
@@ -35,6 +35,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://openhpi-invalide-session.patch \
            file://openhpi-use-serial-tests-config-needed-by-ptest.patch \
            file://openhpi-fix-alignment-issue.patch \
+           file://0001-Fix-build-failures-with-gcc7.patch \
            \
            file://openhpi.init \
            file://openhpid.service \
-- 
2.12.2


