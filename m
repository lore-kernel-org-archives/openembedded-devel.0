Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D164DCD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 04:41:51 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.31092.1712205707906363787
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Apr 2024 21:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gC2v6DqP;
 spf=pass (domain: mvista.com, ip: 209.85.167.175, mailfrom: hprajapati@mvista.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bd4e6a7cb0so221714b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Apr 2024 21:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1712205707; x=1712810507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TeApGr2Pj3dQAFSj9Xe5+1+kN18hZOS9SPj4jb8bGpI=;
        b=gC2v6DqPNnIUxO6s4l6jSSxJ+/oUCI+A8s1l1UhkGzOronLRAaFTrtl2C+LsD/s+Zz
         6X0wu8/wQs2gVPEJrlaYhhU5PDr5NXbVi2WRTZXnkzpGm1X6FanMeaHtmAv0JJc3MstN
         bwTJhdRJsbjcf6sB6MJibrNzyRVUJChn49FRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712205707; x=1712810507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeApGr2Pj3dQAFSj9Xe5+1+kN18hZOS9SPj4jb8bGpI=;
        b=vkofh+fi8xZcKV5bxHyTipPpdX9BHWKFktUx3kZ59qsFR1bxG+L91WiYx162uf5YeF
         FNzEHY4CtpLpB3qNwk6CHNSdUNm4/PiCdtoFidQs4Rhpwx8sBhDyIvLbTvIqMVYZmumA
         Bv2liy+An9DdkXgOhcpBF6OF7YhA/FpxWFptfkzGgxMoYUrXC17Ysrdj+YhCJG6cHelH
         kn2Onfr+Oqvn4ewSWp7th6lwXuR9IHj+/uY2Rh0VPaPz1/BZhBRxE7XC7Tc7Ve9nnTNm
         jn61j/+XnlwpPogfsLB/iPNAPsNzAR3SSvOqV6kSbjum3CkA+rV4Bd1lTuPrZlmDtY2t
         3Yxg==
X-Gm-Message-State: AOJu0YzC6dZrE16lnSkMs+Jtm+n4ODLX8lmWSJCOxrcrbeUOfVZ5JaSY
	gxGArcB3jVP8uILxAR5MKwsSq5lnm8XASOZiZbe6RGlXzYs2XBqxVsac3szpMS8otSztAbxaXAM
	D
X-Google-Smtp-Source: AGHT+IHP7mk0hwLtgG0uNI3eBDZxpE0Mg9SEJSfxj7IQPpNNh5NVYIwsIQw0etDkmCZuDmWdFen7ww==
X-Received: by 2002:a05:6808:320b:b0:3c2:18a7:dd70 with SMTP id cb11-20020a056808320b00b003c218a7dd70mr2421128oib.55.1712205706813;
        Wed, 03 Apr 2024 21:41:46 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.209])
        by smtp.gmail.com with ESMTPSA id i187-20020a62c1c4000000b006eac4d7b2e1sm503979pfg.113.2024.04.03.21.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 21:41:46 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] wireshark: fix CVE-2023-6175
Date: Thu,  4 Apr 2024 10:11:40 +0530
Message-Id: <20240404044140.81487-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 04:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109795

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/3be1c99180a6fc48c34ae4bfc79bfd840b29ae3e

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2023-6175.patch       | 246 ++++++++++++++++++
 .../wireshark/wireshark_3.2.18.bb             |   1 +
 2 files changed, 247 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-6175.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-6175.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-6175.patch
new file mode 100644
index 0000000000..a08610f8d2
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-6175.patch
@@ -0,0 +1,246 @@
+From 2d59b26d3b554960c777003c431add89d018b0a6 Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Tue, 17 Oct 2023 22:08:42 -0700
+Subject: [PATCH] netscreen: do bounds checking for each byte of packet data.
+
+Make sure each byte we add to the packet data from the file fits in the
+buffer, rather than stuffing bytes into the buffer and checking
+afterwards.
+
+This prevents a buffer overflow.
+
+Fixes #19404, which was filed as part of Trend Micro's Zero Day
+Initiative as ZDI-CAN-22164.
+
+While we're at it, expand a comment and make error messages give some
+more detail.
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/3be1c99180a6fc48c34ae4bfc79bfd840b29ae3e]
+CVE: CVE-2023-6175
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ wiretap/netscreen.c | 125 +++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 94 insertions(+), 31 deletions(-)
+
+diff --git a/wiretap/netscreen.c b/wiretap/netscreen.c
+index 9ad825f..ffcb689 100644
+--- a/wiretap/netscreen.c
++++ b/wiretap/netscreen.c
+@@ -59,7 +59,12 @@ static gboolean netscreen_seek_read(wtap *wth, gint64 seek_off,
+ static gboolean parse_netscreen_packet(FILE_T fh, wtap_rec *rec,
+ 	Buffer* buf, char *line, int *err, gchar **err_info);
+ static int parse_single_hex_dump_line(char* rec, guint8 *buf,
+-	guint byte_offset);
++	guint byte_offset, guint pkt_len);
++
++/* Error returns from parse_single_hex_dump_line() */
++#define PARSE_LINE_INVALID_CHARACTER	-1
++#define PARSE_LINE_NO_BYTES_SEEN	-2
++#define PARSE_LINE_TOO_MANY_BYTES_SEEN	-3
+ 
+ /* Returns TRUE if the line appears to be a line with protocol info.
+    Otherwise it returns FALSE. */
+@@ -241,13 +246,40 @@ netscreen_seek_read(wtap *wth, gint64 seek_off,	wtap_rec *rec, Buffer *buf,
+               2c 21 b6 d3 20 60 0c 8c 35 98 88 cf 20 91 0e a9     ,!...`..5.......
+               1d 0b                                               ..
+ 
++ * The first line of a packet is in the form
++
++<secs>.<dsecs>: <iface>({i,o}) len=<length>:<llinfo>>
+ 
++ * where:
++ *
++ *   <secs> and <dsecs> are a time stamp in seconds and deciseconds,
++ *     giving the time since the firewall was booted;
++ *
++ *   <iface> is the name of the interface on which the packet was
++ *     received or on which it was transmitted;
++ *
++ *   {i,o} is i for a received packet and o for a transmitted packet;
++ *
++ *   <length> is the length of the packet on the network;
++ *
++ *   <llinfo>, at least for Ethernet, appears to be a source MAC
++ *     address, folowed by "->", folowed by a destination MAC
++ *     address, followed by a sequence of Ethertypes, each
++ *     preceded by a "/" (multiple Ethertypes if there are VLAN
++ *     tags and the like), possibly followed by ", tag <tag>".
++ *
++ * Following that may be some "info lines", each of which is indented
++ * by 14 spaces, giving a dissection of the payload after the
++ * link-layer header.
++ *
++ * Following that is a hex/ASCII dump of the contents of the
++ * packet, with 16 octets per line.
+  */
+ static gboolean
+ parse_netscreen_packet(FILE_T fh, wtap_rec *rec, Buffer* buf,
+     char *line, int *err, gchar **err_info)
+ {
+-	int		pkt_len;
++	guint		pkt_len;
+ 	int		sec;
+ 	int		dsec;
+ 	char		cap_int[NETSCREEN_MAX_INT_NAME_LENGTH];
+@@ -266,17 +298,12 @@ parse_netscreen_packet(FILE_T fh, wtap_rec *rec, Buffer* buf,
+ 	memset(cap_int, 0, sizeof(cap_int));
+ 	memset(cap_dst, 0, sizeof(cap_dst));
+ 
+-	if (sscanf(line, "%9d.%9d: %15[a-z0-9/:.-](%1[io]) len=%9d:%12s->%12s/",
++	if (sscanf(line, "%9d.%9d: %15[a-z0-9/:.-](%1[io]) len=%9u:%12s->%12s/",
+ 		   &sec, &dsec, cap_int, direction, &pkt_len, cap_src, cap_dst) < 5) {
+ 		*err = WTAP_ERR_BAD_FILE;
+ 		*err_info = g_strdup("netscreen: Can't parse packet-header");
+ 		return -1;
+ 	}
+-	if (pkt_len < 0) {
+-		*err = WTAP_ERR_BAD_FILE;
+-		*err_info = g_strdup("netscreen: packet header has a negative packet length");
+-		return FALSE;
+-	}
+ 	if (pkt_len > WTAP_MAX_PACKET_SIZE_STANDARD) {
+ 		/*
+ 		 * Probably a corrupt capture file; don't blow up trying
+@@ -323,44 +350,71 @@ parse_netscreen_packet(FILE_T fh, wtap_rec *rec, Buffer* buf,
+ 			break;
+ 		}
+ 
+-		n = parse_single_hex_dump_line(p, pd, offset);
++		n = parse_single_hex_dump_line(p, pd, offset, pkt_len);
+ 
+-		/* the smallest packet has a length of 6 bytes, if
+-		 * the first hex-data is less then check whether
+-		 * it is a info-line and act accordingly
++		/*
++		 * The smallest packet has a length of 6 bytes.
++		 * If the first line either gets an error when
++		 * parsed as hex data, or has fewer than 6
++		 * bytes of hex data, check whether it's an
++		 * info line by see if it has at least
++		 * NETSCREEN_SPACES_ON_INFO_LINE spaces at the
++		 * beginning.
++		 *
++		 * If it does, count this line and, if we have,
++		 * so far, skipped no more than NETSCREEN_MAX_INFOLINES
++		 * lines, skip this line.
+ 		 */
+ 		if (offset == 0 && n < 6) {
+ 			if (info_line(line)) {
++				/* Info line */
+ 				if (++i <= NETSCREEN_MAX_INFOLINES) {
++					/* Skip this line */
+ 					continue;
+ 				}
+ 			} else {
+-				*err = WTAP_ERR_BAD_FILE;
+-				*err_info = g_strdup("netscreen: cannot parse hex-data");
+-				return FALSE;
++				if (n >= 0) {
++					*err = WTAP_ERR_BAD_FILE;
++					*err_info = g_strdup("netscreen: first line of packet data has only %d hex bytes, < 6");
++					return FALSE;
++				}
++				/* Otherwise, fall through to report error */
+ 			}
+ 		}
+ 
+ 		/* If there is no more data and the line was not empty,
+ 		 * then there must be an error in the file
+ 		 */
+-		if (n == -1) {
+-			*err = WTAP_ERR_BAD_FILE;
+-			*err_info = g_strdup("netscreen: cannot parse hex-data");
++		if (n < 0) {
++			switch (n) {
++
++			case PARSE_LINE_INVALID_CHARACTER:
++				*err = WTAP_ERR_BAD_FILE;
++				*err_info = g_strdup("netscreen: invalid character in hex data");
++				break;
++
++			case PARSE_LINE_NO_BYTES_SEEN:
++				*err = WTAP_ERR_BAD_FILE;
++				*err_info = g_strdup("netscreen: no hex bytes seen in hex data");
++				break;
++
++			case PARSE_LINE_TOO_MANY_BYTES_SEEN:
++				*err = WTAP_ERR_BAD_FILE;
++				*err_info = g_strdup("netscreen: number of hex bytes seen in hex data is greater than the packet length");
++				break;
++
++			default:
++				*err = WTAP_ERR_INTERNAL;
++				*err_info = g_strdup_printf("netscreen: unknown error %d from parse_single_hex_dump_line()", n);
++				break;
++			}
++
+ 			return FALSE;
+ 		}
+ 
+ 		/* Adjust the offset to the data that was just added to the buffer */
+ 		offset += n;
+ 
+-		/* If there was more hex-data than was announced in the len=x
+-		 * header, then then there must be an error in the file
+-		 */
+-		if (offset > pkt_len) {
+-			*err = WTAP_ERR_BAD_FILE;
+-			*err_info = g_strdup("netscreen: too much hex-data");
+-			return FALSE;
+-		}
+ 	}
+ 
+ 	/*
+@@ -400,7 +454,7 @@ parse_netscreen_packet(FILE_T fh, wtap_rec *rec, Buffer* buf,
+  *
+  * Returns number of bytes successfully read, -1 if bad.  */
+ static int
+-parse_single_hex_dump_line(char* rec, guint8 *buf, guint byte_offset)
++parse_single_hex_dump_line(char* rec, guint8 *buf, guint byte_offset, guint pkt_len)
+ {
+ 	int num_items_scanned;
+ 	guint8 character;
+@@ -419,7 +473,7 @@ parse_single_hex_dump_line(char* rec, guint8 *buf, guint byte_offset)
+ 			/* Nothing more to parse */
+ 			break;
+ 		} else
+-			return -1; /* not a hex digit, space before ASCII dump, or EOL */
++			return PARSE_LINE_INVALID_CHARACTER; /* not a hex digit, space before ASCII dump, or EOL */
+ 		byte <<= 4;
+ 		character = *rec++ & 0xFF;
+ 		if (character >= '0' && character <= '9')
+@@ -429,7 +483,16 @@ parse_single_hex_dump_line(char* rec, guint8 *buf, guint byte_offset)
+ 		else if (character >= 'a' && character <= 'f')
+ 			byte += character - 'a' + 0xa;
+ 		else
+-			return -1; /* not a hex digit */
++			return PARSE_LINE_INVALID_CHARACTER; /* not a hex digit */
++
++		/* If there was more hex-data than was announced in the len=x
++		 * header, then there must be an error in the file; quit
++		 * now, as adding this byte will overflow the buffer.
++		 */
++		if (byte_offset + num_items_scanned >= pkt_len) {
++			return PARSE_LINE_TOO_MANY_BYTES_SEEN;
++		}
++
+ 		buf[byte_offset + num_items_scanned] = byte;
+ 		character = *rec++ & 0xFF;
+ 		if (character == '\0' || character == '\r' || character == '\n') {
+@@ -437,11 +500,11 @@ parse_single_hex_dump_line(char* rec, guint8 *buf, guint byte_offset)
+ 			break;
+ 		} else if (character != ' ') {
+ 			/* not space before ASCII dump */
+-			return -1;
++			return PARSE_LINE_INVALID_CHARACTER;
+ 		}
+ 	}
+ 	if (num_items_scanned == 0)
+-		return -1;
++		return PARSE_LINE_NO_BYTES_SEEN;
+ 
+ 	return num_items_scanned;
+ }
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
index 8054cbb5aa..28b1cefbcd 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://CVE-2022-4345.patch \
            file://CVE-2024-0208.patch \
            file://CVE-2023-1992.patch \
+           file://CVE-2023-6175.patch \
            "
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.25.1


