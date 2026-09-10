Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEC8C88E48
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:27 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27846.1789081823981230322
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l6AUFG50;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso280529a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081823; x=1789686623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i5VZoGVo7eMO+DceJpcVERYD4xg2YXNO8kTRyEVKZvk=;
        b=l6AUFG50nlSrqBn3XnRaotrJVSsNfGp8Ca61i0JormEkJLeB4hrPWWeUYX1uc6NSaM
         DHuUWlCwvIAG5x/b+Dktzwft2nmAGtkWjQPl05BxYqCAAkij9lui6PVUI6UvozS2OjMj
         6unqWhdldZIJfrsBkvWMT0HdeOcLOoN6ZXJTGc63eBoK8F/OHdTww3fQg4iJz058UbR8
         t5iV7JHNeOZwqIJdI/mtZprUDMczheIOECTFB6T3eVLLuY/CGDJmvUbL1OVbO7dH1Qb8
         jktWPqAEO5x1VpJYx2v+AJc0LQ8wvoPQstskB6I18zfDf3l6DYE6u2tuNzb1qu4XxrU/
         J4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081823; x=1789686623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i5VZoGVo7eMO+DceJpcVERYD4xg2YXNO8kTRyEVKZvk=;
        b=pbC5OApKwLjvmw7/YTRBnTspATXRootz0cFh9Wf/KAZeJtpSw9rDYvccUfsZgR8x60
         sMDrU0gQ9rcK1E1eIIDuU3SH0ImY8mlT3drj8uqUM3NFUZIgpiY+a8qwge+X3GInoj1F
         X6o5IdzCpiWP6s3ThhWM/mqgLs5ECsWs0nDX/jtVDLD6Or45/69TGKwdfvTOkfVFVkiN
         7ON8iCxMv10umGrF+ui8MBXtdrx21ia60CV0eStVeMc0kE4gEfuhItbokAES6UiCB+QM
         Zs+0aBOpXXs1NssO3pf3JNe52DkDBzVTM68bsKZpqdvNlHjNOmOlYja1GO+53bZTyQnk
         Cbyg==
X-Gm-Message-State: AFuF++lPXXlyfp9dorcss7MW40ct1sZtGBZHzTgrrsMvWuGzXypzi2HW
	jjE5P2FY1n1o1jCT9uRPC3wf99Cjk+QUit1hJ7BQJN6gvISC2EGZamnGyKgOdg==
X-Gm-Gg: AYBFou26BxkHStLfI7Z4Ivg9OJqUP35XZiJbE6zl02+C58jd+k1xkeX5jrthDLJBm4y
	gsV4LwRyBtsa0ovk/Uy2Ixc/tKbSr7ZhSbaHNkaovMR9SWI8J5rmyLivM3Wml8iG0NYIDFWRAu6
	kpmo/6sNgpsb3N7dKoEtSeQJFDwGpYoUnDxAtv9s3nmWwjuu1yAhXvQHII1/QylLT3+G3y4tHyZ
	+yR163gx0w6M0z1m5sUs7UTLFb+pr28jLVbzNINDH8dA0/i9Hsuj8HeJVcJnrgRxcfs1sQuCrPh
	5RNbzOcFVor+J1rlYdadkNvSvENayI/IsQIkWtfF68oiSnu4iL3JTcs4ZfwqFXoXNOvfWmC8Az/
	deUBWKd+dCbx0Ff1mDWd0MRAeLzR0INrDkwnFj6oiv00k0srT43zs3kntdp66zXOoRtycof3sTL
	X85/WkKUsN6p6ye8g5y9XX211PSk0yH6fFaA40xguHRAkAE+q96bR8VzMnHgJS9wSoHt61QZgPW
	+NCfLDBdwFGrN5C3wQfDjs=
X-Received: by 2002:a17:90b:5790:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-39d9c21b847mr1770026a91.19.1789081823249;
        Thu, 10 Sep 2026 16:10:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 14/32] unbound: patch CVE-2026-32665
Date: Fri, 11 Sep 2026 11:09:13 +1200
Message-ID: <20260910230932.173913-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129932

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-32665

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-32665.patch      | 119 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-32665.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-32665.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-32665.patch
new file mode 100644
index 0000000000..401f8d094d
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-32665.patch
@@ -0,0 +1,119 @@
+From c9bd4309ec14f767db0d0de5647f0e8fe554b60d Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:09:26 +0200
+Subject: [PATCH] - Fix CVE-2026-32665, Remote DNS-over-QUIC denial of  
+ service due to `quic-size` budget bypass. Thanks to N0zoM1z0  
+ (https://github.com/N0zoM1z0) for the report. In addition, thanks to   Kunta
+ Chu, Kaihua Wang, and Jianjun Chen from Tsinghua University,   for also
+ reporting this issue. In addition, thanks to Qifan Zhang,   Palo Alto
+ Networks, for also reporting this issue. In addition,   thanks to Xuanchao
+ Xie, for also reporting this issue.
+
+(cherry picked from commit 01dfd2f466d383370405d8ecf939570947f3523e)
+
+CVE: CVE-2026-32665
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/01dfd2f466d383370405d8ecf939570947f3523e]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/listen_dnsport.c | 32 ++++++++++++++++++++++----------
+ 1 file changed, 22 insertions(+), 10 deletions(-)
+
+diff --git a/services/listen_dnsport.c b/services/listen_dnsport.c
+index f7fcca194..3c5010b6b 100644
+--- a/services/listen_dnsport.c
++++ b/services/listen_dnsport.c
+@@ -3978,7 +3978,8 @@ doq_stream_close(struct doq_conn* conn, struct doq_stream* stream,
+ 
+ /** doq stream pick up answer data from buffer */
+ static int
+-doq_stream_pickup_answer(struct doq_stream* stream, struct sldns_buffer* buf)
++doq_stream_pickup_answer(struct doq_conn* conn, struct doq_stream* stream,
++	struct sldns_buffer* buf)
+ {
+ 	stream->is_answer_available = 1;
+ 	if(stream->out) {
+@@ -3988,6 +3989,11 @@ doq_stream_pickup_answer(struct doq_stream* stream, struct sldns_buffer* buf)
+ 	}
+ 	stream->nwrite = 0;
+ 	stream->outlen = sldns_buffer_limit(buf);
++	if(!doq_table_quic_size_available(conn->doq_socket->table,
++		conn->doq_socket->cfg, stream->outlen)) {
++		verbose(VERB_ALGO, "doq stream: no space for reply length");
++		return 0;
++	}
+ 	/* For quic the output bytes have to stay allocated and available,
+ 	 * for potential resends, until the remote end has acknowledged them.
+ 	 * This includes the tcplen start uint16_t, in outlen_wire. */
+@@ -4014,7 +4020,7 @@ doq_stream_send_reply(struct doq_conn* conn, struct doq_stream* stream,
+ 	if(stream->out)
+ 		doq_table_quic_size_subtract(conn->doq_socket->table,
+ 			stream->outlen);
+-	if(!doq_stream_pickup_answer(stream, buf))
++	if(!doq_stream_pickup_answer(conn, stream, buf))
+ 		return 0;
+ 	doq_table_quic_size_add(conn->doq_socket->table, stream->outlen);
+ 	doq_stream_on_write_list(conn, stream);
+@@ -4025,13 +4031,19 @@ doq_stream_send_reply(struct doq_conn* conn, struct doq_stream* stream,
+ /** doq stream data length has completed, allocations can be done. False on
+  * allocation failure. */
+ static int
+-doq_stream_datalen_complete(struct doq_stream* stream, struct doq_table* table)
++doq_stream_datalen_complete(struct doq_conn* conn, struct doq_stream* stream,
++	struct doq_table* table)
+ {
+ 	if(stream->inlen > 1024*1024) {
+ 		log_err("doq stream in length too large %d",
+ 			(int)stream->inlen);
+ 		return 0;
+ 	}
++	if(!doq_table_quic_size_available(table, conn->doq_socket->cfg,
++		stream->inlen)) {
++		verbose(VERB_ALGO, "doq stream: no space for query length");
++		return 0;
++	}
+ 	stream->in = calloc(1, stream->inlen);
+ 	if(!stream->in) {
+ 		log_err("doq could not read stream, calloc failed: "
+@@ -4092,8 +4104,9 @@ doq_stream_data_complete(struct doq_conn* conn, struct doq_stream* stream)
+ 
+ /** doq receive data for a stream, more bytes of the incoming data */
+ static int
+-doq_stream_recv_data(struct doq_stream* stream, const uint8_t* data,
+-	size_t datalen, int* recv_done, struct doq_table* table)
++doq_stream_recv_data(struct doq_conn* conn, struct doq_stream* stream,
++	const uint8_t* data, size_t datalen, int* recv_done,
++	struct doq_table* table)
+ {
+ 	int got_data = 0;
+ 	/* read the tcplength uint16_t at the start */
+@@ -4114,7 +4127,7 @@ doq_stream_recv_data(struct doq_stream* stream, const uint8_t* data,
+ 		if(stream->nread == 2) {
+ 			/* the initial length value is completed */
+ 			stream->inlen = ntohs(tcplen);
+-			if(!doq_stream_datalen_complete(stream, table))
++			if(!doq_stream_datalen_complete(conn, stream, table))
+ 				return 0;
+ 		} else {
+ 			/* store for later */
+@@ -4331,8 +4344,7 @@ doq_stream_open_cb(ngtcp2_conn* ATTR_UNUSED(conn), int64_t stream_id,
+ 		verbose(VERB_ALGO, "doq: stream with this id already exists");
+ 		return 0;
+ 	}
+-	if(stream_id != 0 && stream_id != 4 && /* allow one stream on a new connection */
+-		!doq_table_quic_size_available(doq_conn->doq_socket->table,
++	if(!doq_table_quic_size_available(doq_conn->doq_socket->table,
+ 		doq_conn->doq_socket->cfg, sizeof(*stream)
+ 		+ 100 /* estimated query in */
+ 		+ 512 /* estimated response out */
+@@ -4390,8 +4402,8 @@ doq_recv_stream_data_cb(ngtcp2_conn* ATTR_UNUSED(conn), uint32_t flags,
+ 		return 0;
+ 	}
+ 	if(datalen != 0) {
+-		if(!doq_stream_recv_data(stream, data, datalen, &recv_done,
+-			doq_conn->doq_socket->table))
++		if(!doq_stream_recv_data(doq_conn, stream, data, datalen,
++			&recv_done, doq_conn->doq_socket->table))
+ 			return NGTCP2_ERR_CALLBACK_FAILURE;
+ 	}
+ 	if((flags&NGTCP2_STREAM_DATA_FLAG_FIN)!=0) {
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index bf17c30572..12e3deb6e4 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-44390.patch \
            file://CVE-2026-44608.patch \
            file://CVE-2026-46582.patch \
+           file://CVE-2026-32665.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

