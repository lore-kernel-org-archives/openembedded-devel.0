Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C079CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 04:32:25 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.4568.1761625940133264628
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 21:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B1oqbA/o;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a27ab05a2dso4686019b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 21:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761625939; x=1762230739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cClnxoNQ/lwTz6QqO3hLOU/4L59kT7w7gDn1zYnh0Ms=;
        b=B1oqbA/o2c6Cszy+L+y5/vmOo0I/JuMAcKKmrtLGk1XWOvGy2797yMjJSG/upzlvcg
         5caAvua5wF6Im5dSCZoY91wSMXSJQgZRsYYc400ypkkf8p5ZyubqzlI+nIolFmRMAB+k
         LtmRz3bde3x4xrbaHFLOxjbZxggDqjpPs5gy3px/bAh9+356VWTChbaAIYjVkq7+8wYe
         v3F8HgkL8/SvBIW6UIitIE6YMpktha0CkRVtMz+h6zCn3MYjsnDFZPh9jCz6Q23wGAOd
         uJhOXPJxWKJYfuXi1ePY0+s8sOo7mfztQzwyA7z4DgmGgPQKBuCVx5J/cGGO8ICmut/9
         s+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761625939; x=1762230739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cClnxoNQ/lwTz6QqO3hLOU/4L59kT7w7gDn1zYnh0Ms=;
        b=bEoUyJewdBqnLj6HeGgIY8Nu1ubwd/XAYr/rqfMdjQWXc2gb3eB9DMo0qKE5wJtTTN
         VtWR1/EmlOFAPwpITHc1tcRvKRwLqI3lwMjG2Vt/5T3p7UZue2otl11YEnetUO2q6KHP
         CT43D8aSJLafY+/faUqos5lDLt3DU6+RBZPqUp5HAJjacP4ZUY1jC+LvezPB3kbTRwGN
         NogMNYLf4WwGvM1YwO1I6bgqyjf393WmxxcqfvuE9ev3du7+ySqM5IxIBtdc+xybFBl3
         3cL1FyfMT1aDvKY6mfHbEuO0c5UYSJk6IN5lHCS298HphUHHA25uqwHiAzu7jfonXanY
         CXfA==
X-Gm-Message-State: AOJu0Yx4rGhY2n0K8Z0PBaSl6tFpuxnrAjR6+xBizr5zgitpKPU72BPG
	xtFeQMC27tT3rpWcAx1VZ3uqvL99mfFoJubJOKVQBJ/uyyjx+1J1I6vmzY3iJYKj
X-Gm-Gg: ASbGncuvoJ+JYi1P0vLIfAdbiryQmApC1GrOsowBREh75ZE+GBxjgIfoO3q3P0y2Il1
	OCA7u4cwQ9FUfCavGB3LrlLaCqNy8INywVVoXLCNijHpuTDO4/j8mdk/GNmk5NZEo6zQ0RA85si
	AB7khQ5pk2vvmLLFHRsoNRHx/tfiLdDACJ+qYoWlDASn9rbUNfvzca6uS80I5tAV2YKGwTn8S3/
	5tyvBBzlpgG9olyHzOU4LdWfDIouupqNmDdIep9l/KPLzmVBNRerwttZE6WFDJYeGxxIwsGEYcx
	QEBs/BNpWU3i8TbfcFYUTxkUINKB0xDnPVGE6z8ms7tauE+Hc0OOmz5lcZ5mH12sorwcwllmFia
	8vC5oLmoMD2UbF05pbaOq5Z59JMK+wcbCbaj0wMKcSH3lAC8fokvWTdQnbCIqjGIhwII4ZePwzg
	ibE1U41ENHgo6OZw==
X-Google-Smtp-Source: AGHT+IGHCDg8b59/5qyA8TnVgu1ASyhjQzF0CAXn27a5a1/oxSKvCNOT72N6AnDskuUmgddjJvsMaw==
X-Received: by 2002:a05:6a00:84f:b0:77e:f03b:d49a with SMTP id d2e1a72fcca58-7a441c2fcfcmr2648673b3a.19.1761625939172;
        Mon, 27 Oct 2025 21:32:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414087005sm10054699b3a.60.2025.10.27.21.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 21:32:18 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH] hostapd: patch CVE-2025-24912
Date: Tue, 28 Oct 2025 17:32:11 +1300
Message-ID: <20251028043211.4151799-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 04:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121061

Details https://nvd.nist.gov/vuln/detail/CVE-2025-24912

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hostapd/hostapd/CVE-2025-24912_01.patch   | 80 +++++++++++++++++++
 .../hostapd/hostapd/CVE-2025-24912_02.patch   | 72 +++++++++++++++++
 .../hostapd/hostapd_2.10.bb                   |  2 +
 3 files changed, 154 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912_01.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912_02.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912_01.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912_01.patch
new file mode 100644
index 0000000000..5ba3308139
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912_01.patch
@@ -0,0 +1,80 @@
+From c77bc3f388b81fabc9fa6233caa618c724de8a28 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 25 Jan 2025 11:21:16 +0200
+Subject: [PATCH] RADIUS: Drop pending request only when accepting the response
+
+The case of an invalid authenticator in a RADIUS response could imply
+that the response is not from the correct RADIUS server and as such,
+such a response should be discarded without changing internal state for
+the pending request. The case of an unknown response (RADIUS_RX_UNKNOWN)
+is somewhat more complex since it could have been indicated before
+validating the authenticator. In any case, it seems better to change the
+state for the pending request only when we have fully accepted the
+response.
+
+Allowing the internal state of pending RADIUS request to change based on
+responses that are not fully validation could have allow at least a
+theoretical DoS attack if an attacker were to have means for injecting
+RADIUS messages to the network using the IP address of the real RADIUS
+server and being able to do so more quickly than the real server and
+with the matching identifier from the request header (i.e., either by
+flooding 256 responses quickly or by having means to capture the RADIUS
+request). These should not really be realistic options in a properly
+protected deployment, but nevertheless it is good to be more careful in
+processing RADIUS responses.
+
+Remove a pending RADIUS request from the internal list only when having
+fully accepted a matching RADIUS response, i.e., after one of the
+registered handlers has confirmed that the authenticator is valid and
+processing of the response has succeeded.
+
+CVE: CVE-2025-24912
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=726432d7622cc0088ac353d073b59628b590ea44]
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+(cherry picked from commit 726432d7622cc0088ac353d073b59628b590ea44)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/radius/radius_client.c | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
+index ee9e46d2a..8f9332583 100644
+--- a/src/radius/radius_client.c
++++ b/src/radius/radius_client.c
+@@ -922,13 +922,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 		       roundtrip / 100, roundtrip % 100);
+ 	rconf->round_trip_time = roundtrip;
+ 
+-	/* Remove ACKed RADIUS packet from retransmit list */
+-	if (prev_req)
+-		prev_req->next = req->next;
+-	else
+-		radius->msgs = req->next;
+-	radius->num_msgs--;
+-
+ 	for (i = 0; i < num_handlers; i++) {
+ 		RadiusRxResult res;
+ 		res = handlers[i].handler(msg, req->msg, req->shared_secret,
+@@ -939,6 +932,13 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 			radius_msg_free(msg);
+ 			/* fall through */
+ 		case RADIUS_RX_QUEUED:
++			/* Remove ACKed RADIUS packet from retransmit list */
++			if (prev_req)
++				prev_req->next = req->next;
++			else
++				radius->msgs = req->next;
++			radius->num_msgs--;
++
+ 			radius_client_msg_free(req);
+ 			return;
+ 		case RADIUS_RX_INVALID_AUTHENTICATOR:
+@@ -960,7 +960,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 		       msg_type, hdr->code, hdr->identifier,
+ 		       invalid_authenticator ? " [INVALID AUTHENTICATOR]" :
+ 		       "");
+-	radius_client_msg_free(req);
+ 
+  fail:
+ 	radius_msg_free(msg);
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912_02.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912_02.patch
new file mode 100644
index 0000000000..28c0fa61ea
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912_02.patch
@@ -0,0 +1,72 @@
+From fe4d203a300e1eaa1ad7c7bc49e01b9490ab03d8 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Wed, 5 Feb 2025 19:23:39 +0200
+Subject: [PATCH] RADIUS: Fix pending request dropping
+
+A recent change to this moved the place where the processed RADIUS
+request was removed from the pending list to happen after the message
+handler had been called. This did not take into account possibility of
+the handler adding a new pending request in the list and the prev_req
+pointer not necessarily pointing to the correct entry anymore. As such,
+some of the pending requests could have been lost and that would result
+in not being able to process responses to those requests and also, to a
+memory leak.
+
+Fix this by determining prev_req at the point when the pending request
+is being removed, i.e., after the handler function has already added a
+new entry.
+
+Fixes: 726432d7622c ("RADIUS: Drop pending request only when accepting the response")
+
+CVE: CVE-2025-24912
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=339a334551ca911187cc870f4f97ef08e11db109]
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+(cherry picked from commit 339a334551ca911187cc870f4f97ef08e11db109)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/radius/radius_client.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
+index 8f9332583..a5a6cdfae 100644
+--- a/src/radius/radius_client.c
++++ b/src/radius/radius_client.c
+@@ -824,7 +824,7 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 	struct radius_hdr *hdr;
+ 	struct radius_rx_handler *handlers;
+ 	size_t num_handlers, i;
+-	struct radius_msg_list *req, *prev_req;
++	struct radius_msg_list *req, *prev_req, *r;
+ 	struct os_reltime now;
+ 	struct hostapd_radius_server *rconf;
+ 	int invalid_authenticator = 0;
+@@ -887,7 +887,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 		break;
+ 	}
+ 
+-	prev_req = NULL;
+ 	req = radius->msgs;
+ 	while (req) {
+ 		/* TODO: also match by src addr:port of the packet when using
+@@ -899,7 +898,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 		    hdr->identifier)
+ 			break;
+ 
+-		prev_req = req;
+ 		req = req->next;
+ 	}
+ 
+@@ -933,6 +931,12 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 			/* fall through */
+ 		case RADIUS_RX_QUEUED:
+ 			/* Remove ACKed RADIUS packet from retransmit list */
++			prev_req = NULL;
++			for (r = radius->msgs; r; r = r->next) {
++				if (r == req)
++					break;
++				prev_req = r;
++			}
+ 			if (prev_req)
+ 				prev_req->next = req->next;
+ 			else
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
index 5ef6ac64b2..0e241e48b0 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
@@ -22,6 +22,8 @@ SRC_URI = " \
     file://0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch \
     file://0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch \
     file://CVE-2023-52160.patch \
+    file://CVE-2025-24912_01.patch \
+    file://CVE-2025-24912_02.patch \
 "
 
 

