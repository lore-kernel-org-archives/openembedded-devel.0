Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA500C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 08:54:26 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3402.1788252864540083709
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2026 01:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KFqhz3pU;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=22436; q=dns/txt;
  s=iport01; t=1788252864; x=1789462464;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RtkBrr4O7c5nm+6O5oq3sNWJPHOq2c94dU/9fcFSaps=;
  b=KFqhz3pURgelwwJUOD77BFDNiPcsh7gGmPP8/+lkFYdqgSBArp0PjWlg
   2lPPMUY1/gOCf+Rz+jQUTXPAI3uPH+f1uD03pv25ODum9PnG70H4X6A9i
   c0cTtw+gwdOHWOqOgGrRT8jT9d3Q8RLQW82wHJ9DK5CbXjTWXFWi2ErvC
   7LinbVjd3hFyM3/F4QSNIKP00TQNM+jnRQQdTuB91gVCi3n0gdhNGPk/E
   BRmIA7Wwf02osGfIbgAIWk9D/SaSxoWli+IXtC9ID8+0p2p/2c9mqQ7M6
   GnAI22jbx5d6AFrFS37X5ETAGcvQ5FlA6YZx0hf1Oh/Nd1eNI/zOTj3dh
   Q==;
X-CSE-ConnectionGUID: dqBPtKWTRvaarts9fGe9Pw==
X-CSE-MsgGUID: aqVyIGCXRPmcN796tRzp2Q==
X-IPAS-Result: =?us-ascii?q?A0BNAgBIkpZq/5UQJK1aHgEBCxIMggULghg/dF9CSQOEV?=
 =?us-ascii?q?JFzA4ETnQgUgWoPAQEBD0QNBAEBhQUCjXcCJjQJDgECBAMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMaCQQLARgBGxIQCRMDAQIDAiYCA?=
 =?us-ascii?q?isjCBAJgwIBgnQCAREGoEubI3p/M4EBgygBPwJDUNswAQsUAQWBBS6FP4MfA?=
 =?us-ascii?q?YUCXRgBRIQ4JxsbgXKBFYJzdoEFgVwEGIENHwKDc4JqBIIiehKBWh5wkHtIg?=
 =?us-ascii?q?QIcA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+FzVYGwYFgR2BKINEIxk2eoEJX?=
 =?us-ascii?q?oErKWABEheBCYIIAoJXggMCAUlDDgdHUwkqAgkLGA1IESw3FRkEPQFuB45fH?=
 =?us-ascii?q?4JSATwnFwkKAQcMGIEFE0IKBCwYBQEIAymSewOSPqEPCiiDdowilToaM4QEp?=
 =?us-ascii?q?mgLmH2CWYsxlgBQhGmBaDyBWXAVO4JnCUoZD4odhBALC4EUAQKHXMcmJDUCC?=
 =?us-ascii?q?QMvAQEHAgcBAQsBAwuBaJAAAiYHgU8BAQ?=
IronPort-Data: A9a23:yqB3sarY1u3fEBf60CcgWVsH/yFeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBmAbqvYazanLdxwbYu09EMOv8TTm9QwGlNuqy43Ey9B8uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrS8Eo35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0upuK1lS1
 sMkEi4EZwqfnLO477/qcvY506zPLOGzVG8eknhkyTecCbMtRorOBvyQo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtGYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9KobWFJoJwxnBz
 o7A123gPAA7G/ev8wKA+VTz17HTpzHjArtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2cbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:ESpf0aMGNE6XrsBcTh+jsMiBIKoaSvp037Dk7S9MoHtuA6qlfq
 GV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFeaTN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn9E4sLxKDwNeOGAbqBJb6
 ah2g==
X-Talos-CUID: 9a23:aiYV4WOzXz2ZWe5DVDBNzFI3JfwfbHTU1mvLckGXBDdRV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AVaFbJAxCqO15huTJZStyFanjeFyaqK23NlEsvr4?=
 =?us-ascii?q?2gfGBPgovammBtiavGLZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,255,1779148800"; 
   d="scan'208";a="824974571"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Sep 2026 08:54:23 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 4DFC318000164;
	Tue,  1 Sep 2026 08:54:23 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id DFE9ACE1C04; Tue,  1 Sep 2026 01:54:22 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch v2 4/5] libssh: Fix CVE-2026-59848
Date: Tue,  1 Sep 2026 01:53:56 -0700
Message-Id: <20260901085357.1254306-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260901085357.1254306-1-hthakar@cisco.com>
References: <20260901085357.1254306-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 08:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129624

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
Changes in v2
- rebase the patch on the current scarthgap branch
---
 .../libssh/CVE-2026-59848-regression.patch    |  45 ++
 .../libssh/libssh/CVE-2026-59848.patch        | 684 ++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |   2 +
 3 files changed, 731 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59848-regression.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59848.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-59848-regression.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59848-regression.patch
new file mode 100644
index 000000000..161271264
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
index 000000000..2f4efb22f
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
index 669e229ee..960621eac 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -35,6 +35,8 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-59843.patch \
            file://CVE-2026-59844.patch \
            file://CVE-2026-59846.patch \
+           file://CVE-2026-59848.patch \
+           file://CVE-2026-59848-regression.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.35.6


