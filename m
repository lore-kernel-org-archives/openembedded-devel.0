Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C17C88E45
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:11:07 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27869.1789081867194517504
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fwvMyPfs;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso302061a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081866; x=1789686666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdnK/+imx+9tRJ9YMx+Zo6+Kx5seHdxlPFYp3/xeLrI=;
        b=fwvMyPfssQBjZndfu0AKo6Qm1mbB6Ra8jObCTLDTdpr8NR97A/YNK9pEUgHb6fcWOj
         lMbkfmBxC0dbBnIQtGeIjiEMr3DTH2brjm7On0lFXuygQWV0DjgMDiYHpHjZb9o2eRve
         fCa+4VZ9uHHXHQMvdUBcWB53bdp5sJG64lqYibaYJA0yHUEcooiPGhHy4Pcs8+g5gqYV
         lNYH9kTmxonNtGlaSAMfZRhzb34lJrSCDFMmH5MgOXICGRqQoAo3nXHZIcPewqVwkQbF
         7ubn/lVGqUZWdYVOQye0Gi5PeIHyE1shyWr1SvteLqeOCLf6nlAvlig3/cPRvUcWsoXB
         yJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081866; x=1789686666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdnK/+imx+9tRJ9YMx+Zo6+Kx5seHdxlPFYp3/xeLrI=;
        b=mahIkO4EtXsUzhvHIJI6lMuvMCgxNiuAtpJVJTEn1FE3qBVrm21SOhhcxOf0iBtQDb
         kCx0bNW/Jir94v+ZBsBKFnBs8EU11H4r0zcTdqZI04DVATEVJlM2IVGGBod3SF1aHr6q
         6wFL4Bfylv7PvWvjSTAy3bYlyuJjVLn7Z33cxpVn9IETXGSI7TwTyQlgmRoL4te6DJwo
         0K5+I+gCnTX3fPxa63fjinLwUOT/6lGZcv3+qDeJdvga8MyCR5Fc8Cn1fmRp8nPjpyFA
         DJ1jlAHCt2Eh2QQAQP9H5y20zziVgWZQLM2ngQXWNZkCGn4/xCxGK28+jsUhafW5lheG
         WepQ==
X-Gm-Message-State: AFuF++libypji099NAUV81yn40k9UAK22plYl6R2RKWHlLGNRoadiQrf
	S57a7pNkBZiwcGd+F1BHiYTB2unvslbHrM/nShJI7KSdAFQ4iAX1tA8P+bbAqA==
X-Gm-Gg: AYBFou3E1Hz5XyFzYEyApPsTNTwY5rSXdHTSJRhr9DSZ6fH94ZnrlumE8KD1+sUyqid
	Jm4OylSOK4i0PzKdILGvo3pnzsOrya6LZDTYm4yfgFZ3y9lAQIv6mZX32QFZK07Sn5xVVG/Yv0j
	Wx0hAsTaKra97WY7wyW8StQbj4z3yq9xi+fWpAP7YTWr/Ihp8p8H3H7hO8/zrxt+5OpnrHHeJCe
	/DYrTuuyLL8KBsKyHf9sc1OtpFbIeZzB2cp1aXCrlLfvPxJftbJttOnhOpKo8tBQEw2ldTTq2Js
	hi2heB7aHvKBDiTAjHdJe+cqR+6x+fgD2gLMvynJvjKkQg3LfQ9bPYzBp8XOYsVYoGqD+LvIicn
	dy5BvGMSgPtSCYpyHGe3QRFRSVJQfDpT5CmV+qSuOE/brw82HGIcDTi0/uVi5CxFovGlWqp299y
	2BD16JgwPp7pqxAIoNuA+7lcDjhUrrc+SE8tlOBT59jpmXhOwV9Y9beFKyYNoheHgYtF9S/spX7
	ShmCbr8/1HcfKiwByZa+J0=
X-Received: by 2002:a17:90b:5605:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-39d9bbd8837mr1590090a91.5.1789081866408;
        Thu, 10 Sep 2026 16:11:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:11:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 30/32] unbound: patch CVE-2026-55991
Date: Fri, 11 Sep 2026 11:09:29 +1200
Message-ID: <20260910230932.173913-30-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129948

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-55991

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-55991.patch      | 112 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-55991.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-55991.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-55991.patch
new file mode 100644
index 0000000000..7946f5a59f
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-55991.patch
@@ -0,0 +1,112 @@
+From 355213b9175382db5e86e49731aa939a533b1b03 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:19:02 +0200
+Subject: [PATCH] - Fix CVE-2026-55991, Remote DNS-over-QUIC (DoQ) flow-control
+   assertion failure in libngtcp2. Thanks to Qifan Zhang, Palo Alto  
+ Networks, for the report. In addition, thanks to Xuanchao Xie,   for also
+ reporting this issue.
+
+(cherry picked from commit aac261cbb3795cbd60af2f37ef57bfa5c186aae6)
+
+CVE: CVE-2026-55991
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/aac261cbb3795cbd60af2f37ef57bfa5c186aae6]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/listen_dnsport.c | 46 +++++++++++++++++++++++++++------------
+ testcode/doqclient.c      |  4 ++--
+ 2 files changed, 34 insertions(+), 16 deletions(-)
+
+diff --git a/services/listen_dnsport.c b/services/listen_dnsport.c
+index 3c5010b6b..d49d4ad4c 100644
+--- a/services/listen_dnsport.c
++++ b/services/listen_dnsport.c
+@@ -4472,6 +4472,29 @@ doq_stream_reset_cb(ngtcp2_conn* ATTR_UNUSED(conn), int64_t stream_id,
+ 	return 0;
+ }
+ 
++/** ngtcp2 extend_max_stream_data function */
++int doq_extend_max_stream_data_cb(ngtcp2_conn* ATTR_UNUSED(conn),
++	int64_t stream_id, uint64_t max_data, void* user_data,
++	void* ATTR_UNUSED(stream_user_data))
++{
++	struct doq_conn* doq_conn = (struct doq_conn*)user_data;
++	struct doq_stream* stream;
++	verbose(VERB_ALGO, "doq extend_max_stream_data stream id %d "
++		"max_data %d ", (int)stream_id, (int)max_data);
++	if(max_data == 0)
++		return 0;
++	stream = doq_stream_find(doq_conn, stream_id);
++	if(!stream) {
++		verbose(VERB_ALGO, "doq: unknown stream %d", (int)stream_id);
++		return 0;
++	}
++	if(!stream->is_answer_available)
++		return 0;
++	doq_stream_on_write_list(doq_conn, stream);
++	doq_conn_write_enable(doq_conn);
++	return 0;
++}
++
+ /** ngtcp2 acked_stream_data_offset callback function */
+ static int
+ doq_acked_stream_data_offset_cb(ngtcp2_conn* ATTR_UNUSED(conn),
+@@ -4846,6 +4869,7 @@ doq_conn_setup(struct doq_conn* conn, uint8_t* scid, size_t scidlen,
+ 	callbacks.stream_open = doq_stream_open_cb;
+ 	callbacks.stream_close = doq_stream_close_cb;
+ 	callbacks.stream_reset = doq_stream_reset_cb;
++	callbacks.extend_max_stream_data = doq_extend_max_stream_data_cb;
+ 	callbacks.acked_stream_data_offset = doq_acked_stream_data_offset_cb;
+ 	callbacks.recv_stream_data = doq_recv_stream_data_cb;
+ 
+@@ -5427,26 +5451,20 @@ doq_conn_write_streams(struct comm_point* c, struct doq_conn* conn,
+ 				continue;
+ 			} else if(ret == NGTCP2_ERR_STREAM_DATA_BLOCKED) {
+ 				verbose(VERB_ALGO, "doq: ngtcp2_conn_writev_stream returned NGTCP2_ERR_STREAM_DATA_BLOCKED");
+-#ifdef HAVE_NGTCP2_CCERR_DEFAULT
+-				ngtcp2_ccerr_set_application_error(
+-					&conn->ccerr, -1, NULL, 0);
+-#else
+-				ngtcp2_connection_close_error_set_application_error(&conn->last_error, -1, NULL, 0);
+-#endif
+-				if(err_drop)
+-					*err_drop = 0;
+-				if(!doq_conn_close_error(c, conn)) {
+-					if(err_drop)
+-						*err_drop = 1;
++				if(stream) {
++					doq_stream_off_write_list(conn, stream);
++					stream = stream->write_next;
++					continue;
++				} else {
++					break;
+ 				}
+-				return 0;
+ 			} else if(ret == NGTCP2_ERR_STREAM_SHUT_WR) {
+ 				verbose(VERB_ALGO, "doq: ngtcp2_conn_writev_stream returned NGTCP2_ERR_STREAM_SHUT_WR");
+ #ifdef HAVE_NGTCP2_CCERR_DEFAULT
+ 				ngtcp2_ccerr_set_application_error(
+-					&conn->ccerr, -1, NULL, 0);
++					&conn->ccerr, DOQ_APP_ERROR_CODE, NULL, 0);
+ #else
+-				ngtcp2_connection_close_error_set_application_error(&conn->last_error, -1, NULL, 0);
++				ngtcp2_connection_close_error_set_application_error(&conn->last_error, DOQ_APP_ERROR_CODE, NULL, 0);
+ #endif
+ 				if(err_drop)
+ 					*err_drop = 0;
+diff --git a/testcode/doqclient.c b/testcode/doqclient.c
+index 1994cd097..3cb25c98b 100644
+--- a/testcode/doqclient.c
++++ b/testcode/doqclient.c
+@@ -1519,9 +1519,9 @@ doq_client_send_pkt(struct doq_client_data* data, uint32_t ecn, uint8_t* buf,
+ 		}
+ 		log_err("doq sendmsg: %s", strerror(errno));
+ #ifdef HAVE_NGTCP2_CCERR_DEFAULT
+-		ngtcp2_ccerr_set_application_error(&data->ccerr, -1, NULL, 0);
++		ngtcp2_ccerr_set_application_error(&data->ccerr, 1, NULL, 0);
+ #else
+-		ngtcp2_connection_close_error_set_application_error(&data->last_error, -1, NULL, 0);
++		ngtcp2_connection_close_error_set_application_error(&data->last_error, 1, NULL, 0);
+ #endif
+ 		return 0;
+ 	}
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index e4d18e9b2a..af848988aa 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-55717.patch \
            file://CVE-2026-55973.patch \
            file://CVE-2026-55990.patch \
+           file://CVE-2026-55991.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

