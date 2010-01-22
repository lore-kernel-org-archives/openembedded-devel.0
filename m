Received: from fg-out-1718.google.com ([72.14.220.156])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NYRZ4-0000YY-VP
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 23:01:18 +0100
Received: by fg-out-1718.google.com with SMTP id 19so641512fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 13:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ibARdDaUm/oLCZs834k6bRhQ62gLIWmEsg01aVNTjVY=;
	b=nhk2Cu9VK64seuKW7PP/E0rSb0VD26eJ/JcnenEMUPBLNGcHOiRrTF4P/VABOH1qp8
	Cjgg46oc0XSVC03boEIxOlR2HqXE2Vb17CFYI9t9VxPEDKVlMzS1YYI6YLmgiVw1+ioJ
	MaX6fZLKUQqovtyGuu8k/A6WsmPTh0PmQqET4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ONJA+giCjUt2tLlW+fFIE7SAtRQsMpiRg5mU44TPJzyVHwbCC11+f0K/UDBdYFamxh
	T7WDMV6PCArBklORneVceWfihGg4sTOSFR6Ns7VeReIUumaxd+FLgpQ1wYmuWe8TvyN9
	YHnHLcl4D+drTrjJA1umrWqDhe5ryrKdFsSsc=
Received: by 10.102.207.15 with SMTP id e15mr1839959mug.87.1264197539366;
	Fri, 22 Jan 2010 13:58:59 -0800 (PST)
Received: from localhost.localdomain ([188.45.31.245])
	by mx.google.com with ESMTPS id y2sm10888455mug.40.2010.01.22.13.58.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Jan 2010 13:58:58 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jan 2010 22:59:16 +0100
Message-Id: <1264197556-25468-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <n>
References: <n>
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] gpsd: Version bump to 2.90
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jan 2010 22:01:18 -0000


Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 recipes/gpsd/files/libtool.patch |   14 ++++++++++++++
 recipes/gpsd/gpsd_2.90.bb        |    7 +++++++
 2 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gpsd/files/libtool.patch
 create mode 100644 recipes/gpsd/gpsd_2.90.bb

diff --git a/recipes/gpsd/files/libtool.patch b/recipes/gpsd/files/libtool.patch
new file mode 100644
index 0000000..37a7557
--- /dev/null
+++ b/recipes/gpsd/files/libtool.patch
@@ -0,0 +1,14 @@
+--- a/Makefile.am	2010-01-22 21:27:04.000000000 +0100
++++ b/Makefile.am	2010-01-22 21:27:43.000000000 +0100
+@@ -225,9 +225,9 @@
+ # Warning: This overrides autoconf's normal link-line generatyion process
+ if LIBGPSMM_ENABLE
+ libgps_la_SOURCES += libgpsmm.cpp
+-libgps_la_LINK = /bin/sh ./libtool --tag=CXX --mode=link g++ $(libgps_la_LDFLAGS) -o $@
++libgps_la_LINK = $(LIBTOOL) --tag=CXX --mode=link g++ $(libgps_la_LDFLAGS) -o $@
+ else
+-libgps_la_LINK = /bin/sh ./libtool --tag=CC --mode=link gcc $(libgps_la_LDFLAGS) -o $@
++libgps_la_LINK = $(LIBTOOL) --tag=CC --mode=link gcc $(libgps_la_LDFLAGS) -o $@
+ endif
+ 
+ nodist_libgps_la_SOURCES = packet_names.h ais_json.i
diff --git a/recipes/gpsd/gpsd_2.90.bb b/recipes/gpsd/gpsd_2.90.bb
new file mode 100644
index 0000000..c0fa92e
--- /dev/null
+++ b/recipes/gpsd/gpsd_2.90.bb
@@ -0,0 +1,7 @@
+require gpsd.inc
+
+SRC_URI += "file://libtool.patch;patch=1"
+SRC_URI[gpsd.md5sum] = "a23c728b8734c542d559c485857238d2"
+SRC_URI[gpsd.sha256sum] = "8c81461266fc95aae6519ec996d7e4f4801fb5a02dbcc7a5d1c130bf7fe0cd53"
+
+PR = "${INC_PR}.0"
-- 
1.6.4.4



