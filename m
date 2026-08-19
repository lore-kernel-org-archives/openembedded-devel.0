Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239CDC5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:11:17 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4701.1787137870493870015
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iViR/YgV;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=22527; q=dns/txt;
  s=iport01; t=1787137870; x=1788347470;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VFL9Fr8S+56UVPwcDJx+ZATHYcGTTATeWS92/HOwQlI=;
  b=iViR/YgV/UxPYloRjexkwsr+s13jRw5vAXyTbGYy/+3E9PDq3+tHlv1U
   zTjzTpXW+L5npUSy3dt76lD8HAJdpOpcJ2718H649IIaVMN4i9iDxwn2A
   EAmGhdM59MRxEKjhzcytXviRgPULJcFfCebmovQubFLpwxhdoShHTshfv
   JgP/aHnhTZ/lqQ+v72DAEfCTc6XOT/J7MBeN92gZyhtIOZykBpOmtUDh5
   O00VhMPiDSwuq6qEJvYUF4vDMWhiMNnFLzoSuKFzcaw3Gf/QLnFSumCyR
   eD5jCGh4oPGGO7OD2UvM3jF0XnZYMQLT71lQW8I+C/NFw/emwN+2kFxjf
   g==;
X-CSE-ConnectionGUID: r2NQdYjZQU+t3yn1zrFvLA==
X-CSE-MsgGUID: hjax8ettTcKqF46pQ88kgg==
X-IPAS-Result: =?us-ascii?q?A0BOAgDEjoVq/5AQJK1aglmCGD90XkNJA4RUkXMDgROdC?=
 =?us-ascii?q?BSBag8BAQEPRA0EAQGFBQKNawImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBAxoJBAsBGAEbEhAJEwMBAgMCJgICKyMIEAmDA?=
 =?us-ascii?q?gGCdAMRBqhQmyN6fzOBAYMoAT8CQ1DbMAELFAEFgQUuhT+DHwGFAl0YAUSEO?=
 =?us-ascii?q?CcbG4FygRWCc3aBBYFcBBiBDR8Cg3OCagSCInoSgVoegQ+QOEiBAhwDWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XNVgbBgWBHYEohDcjGTZ6gQlegSsqYQESF?=
 =?us-ascii?q?4EJggoCgnOCBgIBSUURCgsLGA1IESw3FBkEPQFuB45JIIJHAWMXCQoBBwwYg?=
 =?us-ascii?q?QUTQgoELBgFAQgDKZJ7A5I+oQ8KKIN2jCGVOhozhASmaAuYfYJZizGWAFCEa?=
 =?us-ascii?q?YFoPIFZcBU7gmcJShkPih2EEAsLgRQBAodcxyYnMgIJAy8BAQcCBwEBCwEDC?=
 =?us-ascii?q?4FokAACJgeBTwEB?=
IronPort-Data: A9a23:z2pv968cB6sD0U8p2no5DrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 TEZWmCDM/eDZWujL9p3bonkoRxQv5LdyNZnTldp/H9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjtFs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2ksZ6sh9td1M1hzt
 uBDOTZUfAqtmcaflefTpulE3qzPLeHiOIcZ/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cP3WjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oi0a4uEJYLaGK25mG6Yp
 GvWr2nlHi0RF8WxlWSdyyL8heDAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rMnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:PJqfcqxKwxMUaOBxq/oOKrPw8r1zdoMgy1knxilNoNJuHfBw8P
 re+sjztCWE7wr5N0tApTntAsS9qDbnhPxICOoqTNOftXfd2FdARbsKheCJ/9SjIVyaygc378
 ldmsZFZOEYJGIK9PoSmDPIcOoI8Z2g7L2ig/vYwjNGSAFnbLwl0iJCYzzranGfgGJ9dOAE/F
 323Ls9mwad
X-Talos-CUID: 9a23:FMr4VGMkCYfTSe5DQnNBzUIlGPIcTz7Bl2bWel2iJ3hNYejA
X-Talos-MUID: 9a23:ClyiagUT+Gfw+fnq/D/ujSEyOdt036+NEW5Rz40/65mHOiMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="813997685"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:11:00 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id EE90C180001C3;
	Wed, 19 Aug 2026 11:10:59 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 8A6CFCC12A6; Wed, 19 Aug 2026 04:10:59 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-oe][scarthgap][PATCH 4/5] libssh: Fix CVE-2026-59848
Date: Wed, 19 Aug 2026 04:10:46 -0700
Message-Id: <20260819111047.44043-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260819111047.44043-1-hthakar@cisco.com>
References: <20260819111047.44043-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129352

From: Hetvi Thakar <hthakar@cisco.com>

The stable-0.11 commit shown in [1] is the primary upstream fix selected
for this backport. Commit [2] corrects the request-queue pointer state
introduced by [1], so it is carried immediately afterward as a regression
fix. The upstream advisory [3] documents CVE-2026-59848 and identifies
libssh 0.11.5 as the fixed release for the 0.11 series.

[1] https://git.libssh.org/projects/libssh.git/commit/?id=a30a51003205744c10ba4439306f555206ae8497
[2] https://git.libssh.org/projects/libssh.git/commit/?id=5309aefd99e1775db40bf20869f1fb1cc6c787be
[3] https://www.libssh.org/security/advisories/CVE-2026-59848.txt

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libssh/CVE-2026-59848-regression.patch    |  45 ++
 .../libssh/libssh/CVE-2026-59848.patch        | 684 ++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |   6 +-
 3 files changed, 731 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59848-regression.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59848.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-59848-regression.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59848-regression.patch
new file mode 100644
index 0000000000..161271264f
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59848-regression.patch
@@ -0,0 +1,45 @@
+From dddd93ac995ac382e4ec9496509f24003bd72c30 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pavol=20=C5=BD=C3=A1=C4=8Dik?= <pzacik@redhat.com>
+Date: Wed, 3 Jun 2026 12:56:09 +0200
+Subject: [PATCH] CVE-2026-59848 sftp: Initialize sftp_request_queue ptr in
+ sftp_free
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Pavol Žáčik <pzacik@redhat.com>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2026-59848
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=5309aefd99e1775db40bf20869f1fb1cc6c787be]
+
+Backport Changes:
+- Adjusted hunk context for the consolidated libssh 0.10.6 SFTP
+  implementation; the pointer initialization is unchanged from upstream.
+- Omitted the upstream tests/client/torture_sftp_request_id.c follow-up hunk
+  because CVE-2026-59848.patch introduces the backported regression test
+  directly with sftp_read_and_dispatch(); there is no intermediate
+  sftp_recv_response_msg() version to update.
+
+(cherry picked from commit 00876f7658fd265682708572122502188fa22076)
+(cherry picked from commit 5309aefd99e1775db40bf20869f1fb1cc6c787be)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/sftp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sftp.c b/src/sftp.c
+index e6755e2b..ff6e5200 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -371,7 +371,7 @@ void sftp_server_free(sftp_session sftp)
+ 
+ void sftp_free(sftp_session sftp)
+ {
+-    sftp_request_queue ptr;
++    sftp_request_queue ptr = NULL;
+     struct ssh_iterator *id_it = NULL;
+ 
+     if (sftp == NULL) {
+-- 
+2.35.6
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-59848.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59848.patch
new file mode 100644
index 0000000000..2f4efb22f1
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59848.patch
@@ -0,0 +1,684 @@
+From ef75e652dd2808c27251da4d03feef84d158c1de Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pavol=20=C5=BD=C3=A1=C4=8Dik?= <pzacik@redhat.com>
+Date: Mon, 1 Jun 2026 16:33:03 +0200
+Subject: [PATCH] CVE-2026-59848 sftp: handle responses with unknown request
+ IDs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This adds a new field to sftp_session_struct,
+containing a list of outstanding request IDs.
+An ID is added to the list when a request
+is constructed and removed when the corresponding
+request is received. If a client receives a response
+with an unknown request ID, it reports an error.
+
+Storing responses with unknown request IDs in
+the response queue could be abused by a malicious
+SFTP server which could deplete client memory
+this way.
+
+Signed-off-by: Pavol Žáčik <pzacik@redhat.com>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2026-59848
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=a30a51003205744c10ba4439306f555206ae8497]
+
+Backport Changes:
+- Consolidated the upstream src/sftp_common.c and src/sftp_aio.c changes
+  into src/sftp.c, where libssh 0.10.6 implements response dispatch,
+  request-ID allocation, and asynchronous SFTP reads.
+- Kept sftp_get_new_id() static instead of exporting it through
+  sftp_priv.h because all 20 request-producing call sites in 0.10.6 are
+  in src/sftp.c; newer-only SFTP API call sites are absent.
+- Retained the 0.10.6 request construction order and free the existing
+  request buffer when request-ID tracking fails.
+- Adapted the unknown-ID regression test to call
+  sftp_read_and_dispatch() and verify the response queue remains empty;
+  0.10.6 does not provide sftp_recv_response_msg().
+
+(cherry picked from commit 26147eb4767937c797f97ff3b1b1663384232417)
+(cherry picked from commit a30a51003205744c10ba4439306f555206ae8497)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ include/libssh/sftp.h                  |   1 +
+ src/sftp.c                             | 210 ++++++++++++++++++++++---
+ tests/client/CMakeLists.txt            |   1 +
+ tests/client/torture_sftp_request_id.c | 183 +++++++++++++++++++++
+ 4 files changed, 369 insertions(+), 26 deletions(-)
+ create mode 100644 tests/client/torture_sftp_request_id.c
+
+diff --git a/include/libssh/sftp.h b/include/libssh/sftp.h
+index c713466e..984c4eb7 100644
+--- a/include/libssh/sftp.h
++++ b/include/libssh/sftp.h
+@@ -90,6 +90,7 @@ struct sftp_session_struct {
+     void **handles;
+     sftp_ext ext;
+     sftp_packet read_packet;
++    struct ssh_list *outstanding_ids;
+ };
+ 
+ struct sftp_packet_struct {
+diff --git a/src/sftp.c b/src/sftp.c
+index 2194a9ef..e6755e2b 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -149,6 +149,12 @@ sftp_session sftp_new(ssh_session session)
+         goto error;
+     }
+ 
++    sftp->outstanding_ids = ssh_list_new();
++    if (sftp->outstanding_ids == NULL) {
++        ssh_set_error_oom(session);
++        goto error;
++    }
++
+     if (ssh_channel_open_session(sftp->channel)) {
+         goto error;
+     }
+@@ -165,6 +171,7 @@ error:
+     if (sftp->channel != NULL) {
+         ssh_channel_free(sftp->channel);
+     }
++    ssh_list_free(sftp->outstanding_ids);
+     if (sftp->read_packet != NULL) {
+         if (sftp->read_packet->payload != NULL) {
+             SSH_BUFFER_FREE(sftp->read_packet->payload);
+@@ -196,6 +203,12 @@ sftp_new_channel(ssh_session session, ssh_channel channel)
+         goto error;
+     }
+ 
++    sftp->outstanding_ids = ssh_list_new();
++    if (sftp->outstanding_ids == NULL) {
++        ssh_set_error_oom(session);
++        goto error;
++    }
++
+     sftp->read_packet = calloc(1, sizeof(struct sftp_packet_struct));
+     if (sftp->read_packet == NULL) {
+         ssh_set_error_oom(session);
+@@ -217,6 +230,7 @@ error:
+     if (sftp->ext != NULL) {
+         sftp_ext_free(sftp->ext);
+     }
++    ssh_list_free(sftp->outstanding_ids);
+     if (sftp->read_packet != NULL) {
+         if (sftp->read_packet->payload != NULL) {
+             SSH_BUFFER_FREE(sftp->read_packet->payload);
+@@ -358,6 +372,7 @@ void sftp_server_free(sftp_session sftp)
+ void sftp_free(sftp_session sftp)
+ {
+     sftp_request_queue ptr;
++    struct ssh_iterator *id_it = NULL;
+ 
+     if (sftp == NULL) {
+         return;
+@@ -384,6 +399,12 @@ void sftp_free(sftp_session sftp)
+ 
+     sftp_ext_free(sftp->ext);
+ 
++    id_it = ssh_list_get_iterator(sftp->outstanding_ids);
++    for (; id_it != NULL; id_it = id_it->next) {
++        free((uint32_t *)id_it->data);
++    }
++    ssh_list_free(sftp->outstanding_ids);
++
+     SAFE_FREE(sftp);
+ }
+ 
+@@ -571,6 +592,8 @@ static sftp_message sftp_get_message(sftp_packet packet)
+ {
+     sftp_session sftp = packet->sftp;
+     sftp_message msg = NULL;
++    struct ssh_iterator *id_it = NULL;
++    bool id_found = false;
+     int rc;
+ 
+     switch(packet->type) {
+@@ -618,6 +641,28 @@ static sftp_message sftp_get_message(sftp_packet packet)
+             msg->id,
+             msg->packet_type);
+ 
++    /* Validate that this ID is in our outstanding requests list */
++    id_it = ssh_list_get_iterator(sftp->outstanding_ids);
++    for (; id_it != NULL; id_it = id_it->next) {
++        uint32_t *stored_id = (uint32_t *)id_it->data;
++        if (*stored_id == msg->id) {
++            id_found = true;
++            ssh_list_remove(sftp->outstanding_ids, id_it);
++            free(stored_id);
++            break;
++        }
++    }
++
++    if (!id_found) {
++        ssh_set_error(packet->sftp->session,
++                      SSH_FATAL,
++                      "Unknown request ID %" PRIu32,
++                      msg->id);
++        sftp_message_free(msg);
++        sftp_set_error(packet->sftp, SSH_FX_FAILURE);
++        return NULL;
++    }
++
+     return msg;
+ }
+ 
+@@ -902,13 +947,46 @@ static sftp_message sftp_dequeue(sftp_session sftp, uint32_t id){
+   return NULL;
+ }
+ 
+-/*
+- * Assigns a new SFTP ID for new requests and assures there is no collision
+- * between them.
+- * Returns a new ID ready to use in a request
++/**
++ * @brief Assigns a new SFTP ID for new requests and assures there is no
++ *        collision between them.
++ *
++ * @param sftp           The sftp session handle.
++ * @param id_out         Pointer to store the new ID.
++ *
++ * @returns SSH_OK on success with the new ID stored in *id
++ * @returns SSH_ERROR on failure with the sftp and ssh errors set
+  */
+-static inline uint32_t sftp_get_new_id(sftp_session session) {
+-  return ++session->id_counter;
++static int sftp_get_new_id(sftp_session sftp, uint32_t *id_out)
++{
++    uint32_t *id = NULL;
++    int rc;
++
++    if (id_out == NULL) {
++        ssh_set_error_invalid(sftp->session);
++        sftp_set_error(sftp, SSH_FX_FAILURE);
++        return SSH_ERROR;
++    }
++
++    id = malloc(sizeof(uint32_t));
++    if (id == NULL) {
++        ssh_set_error_oom(sftp->session);
++        sftp_set_error(sftp, SSH_FX_FAILURE);
++        return SSH_ERROR;
++    }
++
++    *id = ++sftp->id_counter;
++    rc = ssh_list_append(sftp->outstanding_ids, id);
++    if (rc != SSH_OK) {
++        free(id);
++        ssh_set_error_oom(sftp->session);
++        sftp_set_error(sftp, SSH_FX_FAILURE);
++        return SSH_ERROR;
++    }
++
++    *id_out = *id;
++
++    return SSH_OK;
+ }
+ 
+ static sftp_status_message parse_status_msg(sftp_message msg){
+@@ -1029,7 +1107,11 @@ sftp_dir sftp_opendir(sftp_session sftp, const char *path)
+         return NULL;
+     }
+ 
+-    id = sftp_get_new_id(sftp);
++    rc = sftp_get_new_id(sftp, &id);
++    if (rc != SSH_OK) {
++        SSH_BUFFER_FREE(payload);
++        return NULL;
++    }
+ 
+     rc = ssh_buffer_pack(payload,
+                          "ds",
+@@ -1571,7 +1653,11 @@ sftp_attributes sftp_readdir(sftp_session sftp, sftp_dir dir)
+             return NULL;
+         }
+ 
+-        id = sftp_get_new_id(sftp);
++        rc = sftp_get_new_id(sftp, &id);
++        if (rc != SSH_OK) {
++            SSH_BUFFER_FREE(payload);
++            return NULL;
++        }
+ 
+         rc = ssh_buffer_pack(payload,
+                              "dS",
+@@ -1704,7 +1790,11 @@ static int sftp_handle_close(sftp_session sftp, ssh_string handle)
+         return -1;
+     }
+ 
+-    id = sftp_get_new_id(sftp);
++    rc = sftp_get_new_id(sftp, &id);
++    if (rc != SSH_OK) {
++        SSH_BUFFER_FREE(buffer);
++        return -1;
++    }
+ 
+     rc = ssh_buffer_pack(buffer,
+                          "dS",
+@@ -1835,7 +1925,11 @@ sftp_file sftp_open(sftp_session sftp,
+         sftp_flags |= SSH_FXF_APPEND;
+     }
+     SSH_LOG(SSH_LOG_PACKET,"Opening file %s with sftp flags %x",file,sftp_flags);
+-    id = sftp_get_new_id(sftp);
++    rc = sftp_get_new_id(sftp, &id);
++    if (rc != SSH_OK) {
++        SSH_BUFFER_FREE(buffer);
++        return NULL;
++    }
+ 
+     rc = ssh_buffer_pack(buffer,
+                          "dsd",
+@@ -1946,7 +2040,11 @@ ssize_t sftp_read(sftp_file handle, void *buf, size_t count) {
+     return -1;
+   }
+ 
+-  id = sftp_get_new_id(handle->sftp);
++  rc = sftp_get_new_id(handle->sftp, &id);
++  if (rc != SSH_OK) {
++    SSH_BUFFER_FREE(buffer);
++    return -1;
++  }
+ 
+   rc = ssh_buffer_pack(buffer,
+                        "dSqd",
+@@ -2047,7 +2145,11 @@ int sftp_async_read_begin(sftp_file file, uint32_t len){
+     return -1;
+   }
+ 
+-  id = sftp_get_new_id(sftp);
++  rc = sftp_get_new_id(sftp, &id);
++  if (rc != SSH_OK) {
++    SSH_BUFFER_FREE(buffer);
++    return -1;
++  }
+ 
+   rc = ssh_buffer_pack(buffer,
+                        "dSqd",
+@@ -2173,7 +2275,11 @@ ssize_t sftp_write(sftp_file file, const void *buf, size_t count) {
+     return -1;
+   }
+ 
+-  id = sftp_get_new_id(file->sftp);
++  rc = sftp_get_new_id(file->sftp, &id);
++  if (rc != SSH_OK) {
++    SSH_BUFFER_FREE(buffer);
++    return -1;
++  }
+ 
+   rc = ssh_buffer_pack(buffer,
+                        "dSqdP",
+@@ -2291,7 +2397,11 @@ int sftp_unlink(sftp_session sftp, const char *file) {
+     return -1;
+   }
+ 
+-  id = sftp_get_new_id(sftp);
++  rc = sftp_get_new_id(sftp, &id);
++  if (rc != SSH_OK) {
++    SSH_BUFFER_FREE(buffer);
++    return -1;
++  }
+ 
+   rc = ssh_buffer_pack(buffer,
+                        "ds",
+@@ -2366,7 +2476,11 @@ int sftp_rmdir(sftp_session sftp, const char *directory) {
+     return -1;
+   }
+ 
+-  id = sftp_get_new_id(sftp);
++  rc = sftp_get_new_id(sftp, &id);
++  if (rc != SSH_OK) {
++    SSH_BUFFER_FREE(buffer);
++    return -1;
++  }
+ 
+   rc = ssh_buffer_pack(buffer,
+                        "ds",
+@@ -2443,7 +2557,11 @@ int sftp_mkdir(sftp_session sftp, const char *directory, mode_t mode)
+     attr.permissions = mode;
+     attr.flags = SSH_FILEXFER_ATTR_PERMISSIONS;
+ 
+-    id = sftp_get_new_id(sftp);
++    rc = sftp_get_new_id(sftp, &id);
++    if (rc != SSH_OK) {
++        SSH_BUFFER_FREE(buffer);
++        return -1;
++    }
+ 
+     rc = ssh_buffer_pack(buffer,
+                          "ds",
+@@ -2538,7 +2656,11 @@ int sftp_rename(sftp_session sftp, const char *original, const char *newname) {
+     return -1;
+   }
+ 
+-  id = sftp_get_new_id(sftp);
++  rc = sftp_get_new_id(sftp, &id);
++  if (rc != SSH_OK) {
++    SSH_BUFFER_FREE(buffer);
++    return -1;
++  }
+ 
+   rc = ssh_buffer_pack(buffer,
+                        "dss",
+@@ -2622,7 +2744,11 @@ int sftp_setstat(sftp_session sftp, const char *file, sftp_attributes attr)
+         return -1;
+     }
+ 
+-    id = sftp_get_new_id(sftp);
++    rc = sftp_get_new_id(sftp, &id);
++    if (rc != SSH_OK) {
++        SSH_BUFFER_FREE(buffer);
++        return -1;
++    }
+ 
+     rc = ssh_buffer_pack(buffer,
+                          "ds",
+@@ -2752,7 +2878,11 @@ int sftp_symlink(sftp_session sftp, const char *target, const char *dest) {
+     return -1;
+   }
+ 
+-  id = sftp_get_new_id(sftp);
++  rc = sftp_get_new_id(sftp, &id);
++  if (rc != SSH_OK) {
++    SSH_BUFFER_FREE(buffer);
++    return -1;
++  }
+ 
+   /* TODO check for version number if they ever fix it. */
+   if (ssh_get_openssh_version(sftp->session)) {
+@@ -2850,7 +2980,11 @@ char *sftp_readlink(sftp_session sftp, const char *path)
+         return NULL;
+     }
+ 
+-    id = sftp_get_new_id(sftp);
++    rc = sftp_get_new_id(sftp, &id);
++    if (rc != SSH_OK) {
++        SSH_BUFFER_FREE(buffer);
++        return NULL;
++    }
+ 
+     rc = ssh_buffer_pack(buffer,
+                          "ds",
+@@ -2976,7 +3110,11 @@ sftp_statvfs_t sftp_statvfs(sftp_session sftp, const char *path)
+         return NULL;
+     }
+ 
+-    id = sftp_get_new_id(sftp);
++    rc = sftp_get_new_id(sftp, &id);
++    if (rc != SSH_OK) {
++        SSH_BUFFER_FREE(buffer);
++        return NULL;
++    }
+ 
+     rc = ssh_buffer_pack(buffer,
+                          "dss",
+@@ -3051,7 +3189,11 @@ int sftp_fsync(sftp_file file)
+         return -1;
+     }
+ 
+-    id = sftp_get_new_id(sftp);
++    rc = sftp_get_new_id(sftp, &id);
++    if (rc != SSH_OK) {
++        SSH_BUFFER_FREE(buffer);
++        return -1;
++    }
+ 
+     rc = ssh_buffer_pack(buffer,
+                          "dsS",
+@@ -3151,7 +3293,11 @@ sftp_statvfs_t sftp_fstatvfs(sftp_file file)
+         return NULL;
+     }
+ 
+-    id = sftp_get_new_id(sftp);
++    rc = sftp_get_new_id(sftp, &id);
++    if (rc != SSH_OK) {
++        SSH_BUFFER_FREE(buffer);
++        return NULL;
++    }
+ 
+     rc = ssh_buffer_pack(buffer,
+                          "dsS",
+@@ -3238,7 +3384,11 @@ char *sftp_canonicalize_path(sftp_session sftp, const char *path)
+         return NULL;
+     }
+ 
+-    id = sftp_get_new_id(sftp);
++    rc = sftp_get_new_id(sftp, &id);
++    if (rc != SSH_OK) {
++        SSH_BUFFER_FREE(buffer);
++        return NULL;
++    }
+ 
+     rc = ssh_buffer_pack(buffer,
+                          "ds",
+@@ -3329,7 +3479,11 @@ static sftp_attributes sftp_xstat(sftp_session sftp,
+         return NULL;
+     }
+ 
+-    id = sftp_get_new_id(sftp);
++    rc = sftp_get_new_id(sftp, &id);
++    if (rc != SSH_OK) {
++        SSH_BUFFER_FREE(buffer);
++        return NULL;
++    }
+ 
+     rc = ssh_buffer_pack(buffer,
+                          "ds",
+@@ -3407,7 +3561,11 @@ sftp_attributes sftp_fstat(sftp_file file)
+         return NULL;
+     }
+ 
+-    id = sftp_get_new_id(file->sftp);
++    rc = sftp_get_new_id(file->sftp, &id);
++    if (rc != SSH_OK) {
++        SSH_BUFFER_FREE(buffer);
++        return NULL;
++    }
+ 
+     rc = ssh_buffer_pack(buffer,
+                          "dS",
+diff --git a/tests/client/CMakeLists.txt b/tests/client/CMakeLists.txt
+index 71e5182e..864478a7 100644
+--- a/tests/client/CMakeLists.txt
++++ b/tests/client/CMakeLists.txt
+@@ -49,6 +49,7 @@ if (WITH_SFTP)
+         torture_sftp_dir
+         torture_sftp_read
+         torture_sftp_fsync
++        torture_sftp_request_id
+         ${SFTP_BENCHMARK_TESTS})
+ endif (WITH_SFTP)
+ 
+diff --git a/tests/client/torture_sftp_request_id.c b/tests/client/torture_sftp_request_id.c
+new file mode 100644
+index 00000000..fe6d3f91
+--- /dev/null
++++ b/tests/client/torture_sftp_request_id.c
+@@ -0,0 +1,183 @@
++#include "config.h"
++
++#define LIBSSH_STATIC
++
++#include "sftp.c"
++#include "torture.h"
++
++#include <pwd.h>
++#include <sys/types.h>
++
++static int sshd_setup(void **state)
++{
++    torture_setup_sshd_server(state, false);
++
++    return 0;
++}
++
++static int sshd_teardown(void **state)
++{
++    torture_teardown_sshd_server(state);
++
++    return 0;
++}
++
++static int session_setup(void **state)
++{
++    struct torture_state *s = *state;
++    struct passwd *pwd = NULL;
++    int rc;
++
++    pwd = getpwnam("bob");
++    assert_non_null(pwd);
++
++    rc = setuid(pwd->pw_uid);
++    assert_return_code(rc, errno);
++
++    s->ssh.session = torture_ssh_session(s,
++                                         TORTURE_SSH_SERVER,
++                                         NULL,
++                                         TORTURE_SSH_USER_ALICE,
++                                         NULL);
++    assert_non_null(s->ssh.session);
++
++    s->ssh.tsftp = torture_sftp_session(s->ssh.session);
++    assert_non_null(s->ssh.tsftp);
++
++    return 0;
++}
++
++static int session_teardown(void **state)
++{
++    struct torture_state *s = *state;
++
++    torture_rmdirs(s->ssh.tsftp->testdir);
++    torture_sftp_close(s->ssh.tsftp);
++    ssh_disconnect(s->ssh.session);
++    ssh_free(s->ssh.session);
++
++    return 0;
++}
++
++static void torture_sftp_request_id_null(void **state)
++{
++    struct torture_state *s = *state;
++    struct torture_sftp *t = s->ssh.tsftp;
++    sftp_session sftp = t->sftp;
++    int rc;
++
++    rc = sftp_get_new_id(sftp, NULL);
++    assert_int_equal(rc, SSH_ERROR);
++}
++
++static void torture_sftp_request_id_add(void **state)
++{
++    struct torture_state *s = *state;
++    struct torture_sftp *t = s->ssh.tsftp;
++    sftp_session sftp = t->sftp;
++    uint32_t id1, id2;
++    int rc;
++    size_t count;
++
++    /* The list of IDs should be empty at first */
++    count = ssh_list_count(sftp->outstanding_ids);
++    assert_int_equal(count, 0);
++
++    /* Request a new ID */
++    rc = sftp_get_new_id(sftp, &id1);
++    assert_int_equal(rc, SSH_OK);
++
++    /* Check that the list has one ID now */
++    count = ssh_list_count(sftp->outstanding_ids);
++    assert_int_equal(count, 1);
++
++    /* Request another ID */
++    rc = sftp_get_new_id(sftp, &id2);
++    assert_int_equal(rc, SSH_OK);
++
++    /* Check that the IDs differ */
++    assert_int_not_equal(id1, id2);
++
++    /* Check that the list has two IDs now */
++    count = ssh_list_count(sftp->outstanding_ids);
++    assert_int_equal(count, 2);
++}
++
++static void torture_sftp_request_id_remove(void **state)
++{
++    struct torture_state *s = *state;
++    struct torture_sftp *t = s->ssh.tsftp;
++    sftp_session sftp = t->sftp;
++    sftp_attributes attr = NULL;
++    size_t count;
++
++    count = ssh_list_count(sftp->outstanding_ids);
++    assert_int_equal(count, 0);
++
++    /* We send a request and receive a response */
++    attr = sftp_stat(sftp, SSH_EXECUTABLE);
++    assert_non_null(attr);
++
++    /* The number of outstanding requests should be back to 0 */
++    count = ssh_list_count(sftp->outstanding_ids);
++    assert_int_equal(count, 0);
++
++    sftp_attributes_free(attr);
++}
++
++static void torture_sftp_request_id_unknown(void **state)
++{
++    struct torture_state *s = *state;
++    struct torture_sftp *t = s->ssh.tsftp;
++    sftp_session sftp = t->sftp;
++    ssh_buffer buffer = NULL;
++    uint32_t id = 0;
++    int rc;
++    size_t count;
++
++    count = ssh_list_count(sftp->outstanding_ids);
++    assert_int_equal(count, 0);
++
++    buffer = ssh_buffer_new();
++    assert_non_null(buffer);
++
++    rc = ssh_buffer_pack(buffer, "ds", id, "/tmp");
++    assert_int_equal(rc, SSH_OK);
++
++    /* Send a request without saving the request ID */
++    rc = sftp_packet_write(sftp, SSH_FXP_OPENDIR, buffer);
++    assert_int_not_equal(rc, -1);
++    SSH_BUFFER_FREE(buffer);
++
++    /* An attempt to receive the response should fail without queuing it */
++    rc = sftp_read_and_dispatch(sftp);
++    assert_int_equal(rc, -1);
++    assert_null(sftp->queue);
++}
++
++int torture_run_tests(void)
++{
++    int rc;
++    struct CMUnitTest tests[] = {
++        cmocka_unit_test_setup_teardown(torture_sftp_request_id_null,
++                                        session_setup,
++                                        session_teardown),
++        cmocka_unit_test_setup_teardown(torture_sftp_request_id_add,
++                                        session_setup,
++                                        session_teardown),
++        cmocka_unit_test_setup_teardown(torture_sftp_request_id_remove,
++                                        session_setup,
++                                        session_teardown),
++        cmocka_unit_test_setup_teardown(torture_sftp_request_id_unknown,
++                                        session_setup,
++                                        session_teardown),
++    };
++
++    ssh_init();
++
++    torture_filter_tests(tests);
++    rc = cmocka_run_group_tests(tests, sshd_setup, sshd_teardown);
++    ssh_finalize();
++
++    return rc;
++}
+-- 
+2.35.6
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 8e86073fd3..1a5f521f6a 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -34,11 +34,9 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-0965.patch \
            file://CVE-2026-59843.patch \
            file://CVE-2026-59844.patch \
-<<<<<<< HEAD
-=======
-           file://CVE-2026-59845.patch \
            file://CVE-2026-59846.patch \
->>>>>>> b782f294a0 (libssh: Fix CVE-2026-59846)
+           file://CVE-2026-59848.patch \
+           file://CVE-2026-59848-regression.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.35.6


