Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5690E6FE41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 07:45:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6A7jCHF011872
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 00:45:12 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 10 Jul 2014 00:45:11 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Jul 2014 15:45:17 +0800
Message-ID: <1404978317-2680-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] tcpslice: add recipe under tcpdump
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jul 2014 07:45:11 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

tcpslice is a tool for extracting parts of a tcpdump packet trace,
so put it under tcpdump dir

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../tcpdump/tcpslice/tcpslice-1.2a3-time.patch     |   75 ++++++++++++++++++++
 .../tcpslice/tcpslice-CVS.20010207-bpf.patch       |   15 ++++
 .../recipes-support/tcpdump/tcpslice_1.2a3.bb      |   35 +++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-1.2a3-time.patch
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-CVS.20010207-bpf.patch
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb

diff --git a/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-1.2a3-time.patch b/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-1.2a3-time.patch
new file mode 100644
index 0000000..a86f6d2
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-1.2a3-time.patch
@@ -0,0 +1,75 @@
+Upstream-Status: Pending [from tcpdump-4.1.1-1.fc14.src.rpm]
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
+--- tcpslice-1.2a3.orig/search.c	2000-09-10 10:52:40.000000000 +0200
++++ tcpslice-1.2a3/search.c	2006-07-28 14:56:55.000000000 +0200
+@@ -53,7 +53,7 @@
+ /* Size of a packet header in bytes; easier than typing the sizeof() all
+  * the time ...
+  */
+-#define PACKET_HDR_LEN (sizeof( struct pcap_pkthdr ))
++#define PACKET_HDR_LEN (sizeof( struct pcap_sf_pkthdr ))
+ 
+ extern int snaplen;
+ 
+@@ -111,16 +111,24 @@
+ static void
+ extract_header( pcap_t *p, u_char *buf, struct pcap_pkthdr *hdr )
+ 	{
+-	memcpy((char *) hdr, (char *) buf, sizeof(struct pcap_pkthdr));
++	struct pcap_sf_pkthdr hdri;
++
++	memcpy((char *) &hdri, (char *) buf, sizeof(struct pcap_sf_pkthdr));
+ 
+ 	if ( pcap_is_swapped( p ) )
+ 		{
+-		hdr->ts.tv_sec = SWAPLONG(hdr->ts.tv_sec);
+-		hdr->ts.tv_usec = SWAPLONG(hdr->ts.tv_usec);
+-		hdr->len = SWAPLONG(hdr->len);
+-		hdr->caplen = SWAPLONG(hdr->caplen);
++		hdr->ts.tv_sec = SWAPLONG(hdri.ts.tv_sec);
++		hdr->ts.tv_usec = SWAPLONG(hdri.ts.tv_usec);
++		hdr->len = SWAPLONG(hdri.len);
++		hdr->caplen = SWAPLONG(hdri.caplen);
++		}
++	else
++		{
++		hdr->ts.tv_sec = hdri.ts.tv_sec;
++		hdr->ts.tv_usec = hdri.ts.tv_usec;
++		hdr->len = hdri.len;
++		hdr->caplen = hdri.caplen;
+ 		}
+-
+ 	/*
+ 	 * From bpf/libpcap/savefile.c:
+ 	 *
+--- tcpslice-1.2a3.orig/tcpslice.h	1995-11-02 00:40:53.000000000 +0100
++++ tcpslice-1.2a3/tcpslice.h	2006-07-28 14:56:55.000000000 +0200
+@@ -20,6 +20,26 @@
+  */
+ 
+ 
++#include <time.h>
++/* #include <net/bpf.h> */
++
++/*
++ * This is a timeval as stored in disk in a dumpfile.
++ * It has to use the same types everywhere, independent of the actual
++ * `struct timeval'
++ */
++                                                                                
++struct pcap_timeval {
++    bpf_int32 tv_sec;           /* seconds */
++    bpf_int32 tv_usec;          /* microseconds */
++};
++
++struct pcap_sf_pkthdr {
++    struct pcap_timeval ts;     /* time stamp */
++    bpf_u_int32 caplen;         /* length of portion present */
++    bpf_u_int32 len;            /* length this packet (off wire) */
++};
++
+ time_t	gwtm2secs( struct tm *tm );
+ 
+ int	sf_find_end( struct pcap *p, struct timeval *first_timestamp,
diff --git a/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-CVS.20010207-bpf.patch b/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-CVS.20010207-bpf.patch
new file mode 100644
index 0000000..0a73593
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-CVS.20010207-bpf.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Pending [from tcpdump-4.1.1-1.fc14.src.rpm]
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+diff -ur tcpdump-3.8.1/tcpslice/tcpslice.c tcpdump-3.8.1.new/tcpslice/tcpslice.c
+--- tcpslice/tcpslice.c	2004-01-15 17:35:53.000000000 +0100
++++ tcpslice/tcpslice.c	2004-01-15 16:12:57.000000000 +0100
+@@ -35,7 +35,7 @@
+ #include <sys/file.h>
+ #include <sys/stat.h>
+ 
+-#include <net/bpf.h>
++/* #include <net/bpf.h> */
+ 
+ #include <ctype.h>
+ #ifdef HAVE_FCNTL_H
diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
new file mode 100644
index 0000000..0b47da6
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
@@ -0,0 +1,35 @@
+SUMMARY = "tcpslice"
+DESCRIPTION = "A tool for extracting parts of a tcpdump packet trace."
+HOMEPAGE = "http://ee.lbl.gov"
+SECTION = "console/network"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD;md5=3775480a712fc46a69647678acb234cb" 
+
+SRC_URI = "ftp://ftp.ee.lbl.gov/tcpslice-1.2a3.tar.gz \
+           file://tcpslice-1.2a3-time.patch \
+           file://tcpslice-CVS.20010207-bpf.patch \
+           "
+SRC_URI[md5sum] = "e329cbeb7e589f132d92c3447c477190"
+SRC_URI[sha256sum] = "4096e8debc898cfaa16b5306f1c42f8d18b19e30e60da8d4deb781c8f684c840"
+
+inherit autotools-brokensep
+
+DEPENDS += "libpcap"
+
+# We do not want to autoreconf.  We must specify srcdir as ".".
+# We have to set the ac_cv_* cache variables as well as pass the normal
+# cross-compilation options to configure!
+#
+do_configure () {
+	oe_runconf \
+            --srcdir="." \
+            ac_cv_build=${BUILD_SYS} \
+            ac_cv_host=${HOST_SYS} \
+            ac_cv_target=${HOST_SYS}
+}
+
+do_install_prepend () {
+	mkdir -p ${D}/usr/sbin
+}
+
-- 
1.7.10.4


