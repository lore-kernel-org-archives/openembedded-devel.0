Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A40CC0015E
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 11:41:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16810.1689334909415587774
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jul 2023 04:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MnZdGfJE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=655946fe48=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36E9DQ2e002536
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 11:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=4ISJo
	A5Ox7n13JtTvFu9v/VeJTYN3lmytGHZ2f6tbRY=; b=MnZdGfJEa4jx/BY0ME1Kn
	HQSK8Gk97k3eeIDAhZPIGVcS+yxfE7V9uWjhyo1/tGxF+OVLEw8EW5vn3UuFrWb2
	8sveXUra1oEXQ3a1tzxeRJJ9+dspeti1lDyvR6IXb3MrtR/1vtezBkevn8Zzjcgd
	9Qh0G1h3DI8BbzDLu+88iF9mGeKa/0C+EpHTAommnpp/8dHvQOnXzo1KCnFNFD3f
	BSw7hkcq3DOpzSpn5GdYebUiVI763FhNxpg0KA2MBAbM61I99RuH1fu1K5D9W0B7
	Wpi+g66QHX0gAhc+D7xqAwMo5R0KP6Z9mjTNXLQLish4R0Xrh54iClh7qYfZrDGR
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rtpun8ps2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 11:41:48 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 04:41:45 -0700
From: Meenali Gupta <meenali.gupta@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-networking[mickledore][PATCH 1/1] tcpdump: fix CVE-2023-1801
Date: Fri, 14 Jul 2023 11:41:26 +0000
Message-ID: <20230714114126.1827763-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: NOjimZe0ZzW2nkvQwkQ4KAzxyBPwsWNM
X-Proofpoint-GUID: NOjimZe0ZzW2nkvQwkQ4KAzxyBPwsWNM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=767 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307140104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 11:41:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103866

From: Meenali Gupta <mgupta1@blr-linux-engg1.wrs.com>

The SMB protocol decoder in tcpdump version 4.99.3 can perform
an out-of-bounds write when decoding a crafted network packet

Signed-off-by: Meenali Gupta <mgupta1@blr-linux-engg1.wrs.com>
---
 .../tcpdump/tcpdump/CVE-2023-1801.patch       | 342 ++++++++++++++++++
 .../recipes-support/tcpdump/tcpdump_4.99.3.bb |   1 +
 2 files changed, 343 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/CVE-2023-1801.patch

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2023-1801.patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2023-1801.patch
new file mode 100644
index 000000000..03a1c0aa4
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2023-1801.patch
@@ -0,0 +1,342 @@
+From 13336c4054015bef84d93bf51b50b15df6e265bf Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Mon, 30 Jan 2023 23:03:16 -0800
+Subject: [PATCH] tcpdump: Have a common routine for converting dates and times
+ to strings.
+
+Have a routine that takes a buffer, a strftime format, and a struct tm *
+as arguments, and:
+
+* checks whether the struct tm * is null and, if so, returns a string
+indicating that the date and time couldn't be converted;
+
+* otherwise, passes it to strftime(), along with the buffer and the
+format argument and, if strftime() returns 0, meaning the string didn't
+fit into the buffer and thus that the buffer's contents are undefined,
+returns a string indicating that the date and time didn't fit into the
+buffer;
+
+* otherwise, returns a pointer to the buffer.
+
+Call that routine instead of directly calling strftime() in printers;
+that prevents printing a buffer with undefined data if the buffer isn't
+big enough for the string.
+
+Also, when generating file names using an strftime format, check the
+return value of strftime() to make sure the buffer didn't overflow.
+
+Upstream-Status: Backport[https://github.com/the-tcpdump-group/tcpdump/commit/03c037bbd75588beba3ee09f26d17783d21e30bc]
+CVE: CVE-2023-1801
+
+Signed-off-by: Meenali Gupta <mgupta1@blr-linux-engg1.wrs.com>
+---
+ netdissect.h   |  3 +++
+ ntp.c          | 21 ++++++---------------
+ print-ahcp.c   | 12 ++++--------
+ print-arista.c | 13 ++++---------
+ print-rx.c     |  8 ++++----
+ print-zep.c    |  7 +++----
+ smbutil.c      | 16 +++++-----------
+ tcpdump.c      | 22 ++++++++++++++++++++--
+ util-print.c   | 36 ++++++++++++++++++++++++++++--------
+ 9 files changed, 77 insertions(+), 61 deletions(-)
+
+diff --git a/netdissect.h b/netdissect.h
+index 5c16be6..b1074ef 100644
+--- a/netdissect.h
++++ b/netdissect.h
+@@ -423,6 +423,9 @@ extern void ts_print(netdissect_options *, const struct timeval *);
+ extern void signed_relts_print(netdissect_options *, int32_t);
+ extern void unsigned_relts_print(netdissect_options *, uint32_t);
+
++extern const char *nd_format_time(char *buf, size_t bufsize,
++    const char *format, const struct tm *timeptr);
++
+ extern void fn_print_char(netdissect_options *, u_char);
+ extern void fn_print_str(netdissect_options *, const u_char *);
+ extern u_int nd_printztn(netdissect_options *, const u_char *, u_int, const u_char *);
+diff --git a/ntp.c b/ntp.c
+index 4d17932..0a79f81 100644
+--- a/ntp.c
++++ b/ntp.c
+@@ -55,8 +55,8 @@ p_ntp_time(netdissect_options *ndo,
+	if (i) {
+	    int64_t seconds_64bit = (int64_t)i - JAN_1970;
+	    time_t seconds;
+-	    struct tm *tm;
+	    char time_buf[128];
++	    const char *time_string;
+
+	    seconds = (time_t)seconds_64bit;
+	    if (seconds != seconds_64bit) {
+@@ -64,22 +64,13 @@ p_ntp_time(netdissect_options *ndo,
+		 * It doesn't fit into a time_t, so we can't hand it
+		 * to gmtime.
+		 */
+-		ND_PRINT(" (unrepresentable)");
++		time_string = "[Time is too large to fit into a time_t]";
+	    } else {
+-		tm = gmtime(&seconds);
+-		if (tm == NULL) {
+-		    /*
+-		     * gmtime() can't handle it.
+-		     * (Yes, that might happen with some version of
+-		     * Microsoft's C library.)
+-		     */
+-		    ND_PRINT(" (unrepresentable)");
+-		} else {
+-		    /* use ISO 8601 (RFC3339) format */
+-		    strftime(time_buf, sizeof (time_buf), "%Y-%m-%dT%H:%M:%SZ", tm);
+-		    ND_PRINT(" (%s)", time_buf);
+-		}
++		/* use ISO 8601 (RFC3339) format */
++		time_string = nd_format_time(time_buf, sizeof (time_buf),
++		  "%Y-%m-%dT%H:%M:%SZ", gmtime(&seconds));
+	    }
++	    ND_PRINT(" (%s)", time_string);
+	}
+ #endif
+ }
+diff --git a/print-ahcp.c b/print-ahcp.c
+index 9859f76..d57edda 100644
+--- a/print-ahcp.c
++++ b/print-ahcp.c
+@@ -102,18 +102,14 @@ ahcp_time_print(netdissect_options *ndo,
+                 const u_char *cp, uint8_t len)
+ {
+	time_t t;
+-	struct tm *tm;
+-	char buf[BUFSIZE];
++	char buf[sizeof("-yyyyyyyyyy-mm-dd hh:mm:ss UTC")];
+
+	if (len != 4)
+		goto invalid;
+	t = GET_BE_U_4(cp);
+-	if (NULL == (tm = gmtime(&t)))
+-		ND_PRINT(": gmtime() error");
+-	else if (0 == strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", tm))
+-		ND_PRINT(": strftime() error");
+-	else
+-		ND_PRINT(": %s UTC", buf);
++	ND_PRINT(": %s",
++	    nd_format_time(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S UTC",
++	      gmtime(&t)));
+	return;
+
+ invalid:
+diff --git a/print-arista.c b/print-arista.c
+index 039a1ff..079ad68 100644
+--- a/print-arista.c
++++ b/print-arista.c
+@@ -10,7 +10,6 @@
+
+ #include "netdissect.h"
+ #include "extract.h"
+-#include "addrtoname.h"
+
+ /*
+
+@@ -93,17 +92,13 @@ arista_print_date_hms_time(netdissect_options *ndo, uint32_t seconds,
+		uint32_t nanoseconds)
+ {
+	time_t ts;
+-	struct tm *tm;
+-	char buf[BUFSIZE];
++	char buf[sizeof("-yyyyyyyyyy-mm-dd hh:mm:ss")];
+
+	ts = seconds + (nanoseconds / 1000000000);
+	nanoseconds %= 1000000000;
+-	if (NULL == (tm = gmtime(&ts)))
+-		ND_PRINT("gmtime() error");
+-	else if (0 == strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", tm))
+-		ND_PRINT("strftime() error");
+-	else
+-		ND_PRINT("%s.%09u", buf, nanoseconds);
++	ND_PRINT("%s.%09u",
++	    nd_format_time(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S",
++	       gmtime(&ts)), nanoseconds);
+ }
+
+ int
+diff --git a/print-rx.c b/print-rx.c
+index 3f7589e..dbef71c 100644
+--- a/print-rx.c
++++ b/print-rx.c
+@@ -794,12 +794,12 @@ rx_cache_find(netdissect_options *ndo, const struct rx_header *rxh,
+			ND_PRINT(" %" PRIu64, _i); \
+		}
+
+-#define DATEOUT() { time_t _t; struct tm *tm; char str[256]; \
++#define DATEOUT() { time_t _t; char str[256]; \
+			_t = (time_t) GET_BE_S_4(bp); \
+			bp += sizeof(int32_t); \
+-			tm = localtime(&_t); \
+-			strftime(str, 256, "%Y/%m/%d %H:%M:%S", tm); \
+-			ND_PRINT(" %s", str); \
++			ND_PRINT(" %s", \
++			    nd_format_time(str, sizeof(str), \
++			      "%Y/%m/%d %H:%M:%S", localtime(&_t))); \
+		}
+
+ #define STOREATTROUT() { uint32_t mask, _i; \
+diff --git a/print-zep.c b/print-zep.c
+index fd74368..642b240 100644
+--- a/print-zep.c
++++ b/print-zep.c
+@@ -83,12 +83,11 @@ static void zep_print_ts(netdissect_options *ndo, const u_char *p)
+	 */
+	if (i) {
+		time_t seconds = i - JAN_1970;
+-		struct tm *tm;
+		char time_buf[128];
+
+-		tm = localtime(&seconds);
+-		strftime(time_buf, sizeof (time_buf), "%Y/%m/%d %H:%M:%S", tm);
+-		ND_PRINT(" (%s)", time_buf);
++		ND_PRINT(" (%s)",
++		    nd_format_time(time_buf, sizeof (time_buf), "%Y/%m/%d %H:%M:%S",
++		      localtime(&seconds)));
+	}
+ #endif
+ }
+diff --git a/smbutil.c b/smbutil.c
+index 7f609f7..f33a323 100644
+--- a/smbutil.c
++++ b/smbutil.c
+@@ -768,9 +768,8 @@ smb_fdata1(netdissect_options *ndo,
+	case 'T':
+	  {
+	    time_t t;
+-	    struct tm *lt;
+	    const char *tstring;
+-	    char buffer[sizeof("Www Mmm dd hh:mm:ss yyyy\n")];
++	    char buffer[sizeof("Www Mmm dd hh:mm:ss yyyyy")];
+	    uint32_t x;
+
+	    switch (atoi(fmt + 1)) {
+@@ -800,16 +799,11 @@ smb_fdata1(netdissect_options *ndo,
+		break;
+	    }
+	    if (t != 0) {
+-		lt = localtime(&t);
+-		if (lt != NULL) {
+-		    strftime(buffer, sizeof(buffer), "%a %b %e %T %Y%n", lt);
+-		    tstring = buffer;
+-		}
+-		else
+-		    tstring = "(Can't convert time)\n";
++		    tstring = nd_format_time(buffer, sizeof(buffer), "%a %b %e %T %Y",
++		    localtime(&t));
+	    } else
+-		tstring = "NULL\n";
+-	    ND_PRINT("%s", tstring);
++		tstring = "NULL";
++	    ND_PRINT("%s\n", tstring);
+	    fmt++;
+	    while (ND_ASCII_ISDIGIT(*fmt))
+		fmt++;
+diff --git a/tcpdump.c b/tcpdump.c
+index 78d0871..b0f75b9 100644
+--- a/tcpdump.c
++++ b/tcpdump.c
+@@ -843,6 +843,8 @@ MakeFilename(char *buffer, char *orig_name, int cnt, int max_chars)
+         char *filename = malloc(PATH_MAX + 1);
+         if (filename == NULL)
+             error("%s: malloc", __func__);
++	if (strlen(orig_name) == 0)
++            error("an empty string is not a valid file name");
+
+         /* Process with strftime if Gflag is set. */
+         if (Gflag != 0) {
+@@ -854,9 +856,25 @@ MakeFilename(char *buffer, char *orig_name, int cnt, int max_chars)
+           }
+
+           /* There's no good way to detect an error in strftime since a return
+-           * value of 0 isn't necessarily failure.
++           *  * value of 0 isn't necessarily failure; if orig_name is an empty
++           * string, the formatted string will be empty.
++           *
++           * However, the C90 standard says that, if there *is* a
++           * buffer overflow, the content of the buffer is undefined,
++           * so we must check for a buffer overflow.
++           *
++           * So we check above for an empty orig_name, and only call
++           * strftime() if it's non-empty, in which case the return
++           * value will only be 0 if the formatted date doesn't fit
++           * in the buffer.
++           *
++           * (We check above because, even if we don't use -G, we
++           * want a better error message than "tcpdump: : No such
++           * file or directory" for this case.)
+            */
+-          strftime(filename, PATH_MAX, orig_name, local_tm);
++          if (strftime(filename, PATH_MAX, orig_name, local_tm) == 0) {
++            error("%s: strftime", __func__);
++          }
+         } else {
+           strncpy(filename, orig_name, PATH_MAX);
+         }
+diff --git a/util-print.c b/util-print.c
+index 8b20649..fea6b19 100644
+--- a/util-print.c
++++ b/util-print.c
+@@ -230,7 +230,8 @@ ts_date_hmsfrac_print(netdissect_options *ndo, long sec, long usec,
+ {
+	time_t Time = sec;
+	struct tm *tm;
+-	char timestr[32];
++	char timebuf[32];
++	const char *timestr;
+
+	if ((unsigned)sec & 0x80000000) {
+		ND_PRINT("[Error converting time]");
+@@ -242,14 +243,14 @@ ts_date_hmsfrac_print(netdissect_options *ndo, long sec, long usec,
+	else
+		tm = gmtime(&Time);
+
+-	if (!tm) {
+-		ND_PRINT("[Error converting time]");
+-		return;
++
++	if (date_flag == WITH_DATE) {
++		timestr = nd_format_time(timebuf, sizeof(timebuf),
++		    "%Y-%m-%d %H:%M:%S", tm);
++	} else {
++		timestr = nd_format_time(timebuf, sizeof(timebuf),
++		    "%H:%M:%S", tm);
+	}
+-	if (date_flag == WITH_DATE)
+-		strftime(timestr, sizeof(timestr), "%Y-%m-%d %H:%M:%S", tm);
+-	else
+-		strftime(timestr, sizeof(timestr), "%H:%M:%S", tm);
+	ND_PRINT("%s", timestr);
+
+	ts_frac_print(ndo, usec);
+@@ -404,6 +405,25 @@ signed_relts_print(netdissect_options *ndo,
+	}
+	unsigned_relts_print(ndo, secs);
+ }
++/*
++ * Format a struct tm with strftime().
++ * If the pointer to the struct tm is null, that means that the
++ * routine to convert a time_t to a struct tm failed; the localtime()
++ * and gmtime() in the Microsoft Visual Studio C library will fail,
++ * returning null, if the value is before the UNIX Epoch.
++ */
++const char *
++nd_format_time(char *buf, size_t bufsize, const char *format,
++         const struct tm *timeptr)
++{
++	if (timeptr != NULL) {
++		if (strftime(buf, bufsize, format, timeptr) != 0)
++			return (buf);
++		else
++			return ("[nd_format_time() buffer is too small]");
++	} else
++		return ("[localtime() or gmtime() couldn't convert the date and time]");
++}
+
+ /* Print the truncated string */
+ void nd_print_trunc(netdissect_options *ndo)
+--
+2.40.0
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
index 03f1b76f9..dfb408dcd 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     http://www.tcpdump.org/release/${BP}.tar.gz \
     file://add-ptest.patch \
     file://run-ptest \
+    file://CVE-2023-1801.patch \
 "
 
 SRC_URI[sha256sum] = "ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e73b3"
-- 
2.40.0


