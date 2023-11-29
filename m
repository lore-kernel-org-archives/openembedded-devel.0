Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1839C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 14:30:23 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.34247.1701268213561671430
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 06:30:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eQRbQrIF;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cfabcbda7bso7344365ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 06:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1701268213; x=1701873013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EuM+E3JRqqxR9PGj1DMKSVhONBONidkwfNJ8KJDp1fM=;
        b=eQRbQrIFwwd82OPmRz/FkK6l+5QSpm3WIsqcke6fYEWhKShJ8oAWwfiTsfD9ffebzN
         Dnt2WCX08lmbvg0JuyfwMZcW00HTSB2LC5hELtl9wSnMTc3htwP7DVdsGbWNaKOh4kbT
         M+5ahy92JcMn3mHOYFWtMdVlLkDyFP1HvSy3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701268213; x=1701873013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EuM+E3JRqqxR9PGj1DMKSVhONBONidkwfNJ8KJDp1fM=;
        b=hAIQND3LyV93diYDCOk3TGxgxVd/XVrZVLxsY5V9LJ+WYsY2rROHdcxphcYPFP4v37
         SqFYJMoF7cepUpNLXTUw0kGNiy6xSNVg4K93JTsSl9ZoaRo6rmJpJvK6iIxNwPehJNtS
         0WVTtWL+MiuIfMJ6d+mRi7hQCsRV8v45NN5srpUbCYYa9YRCMFzrtkHXDzmhsBkDCQ57
         cFqwqp0fLUmOPnlTt7WVg/X15VfDfHcue0Iwar5DkKiy9qktQiw0LMvkNEI5pMcHLO5W
         gIaM7+TpOEd+1GYfYf2sJxcWNmyG+PePGaGnWrHiivKWRTuDJR5SMbZ86hLDrNhlWAim
         F1BA==
X-Gm-Message-State: AOJu0YycldJHcUEWPL3a/bz1g0rySUlNHha+lSz0uGgoDV6ZI75bTA9B
	Jc9oVmwLdtX4h5UKlcDHr4/eeBlRxTnq6sBgrUU=
X-Google-Smtp-Source: AGHT+IExge64L63Tj4J83MD44uohACkjzowH6JPa3gvJ6ZtEQWx6DqF6K6YTMHMjSgLmxWAQsQmJGQ==
X-Received: by 2002:a17:902:c653:b0:1ce:5ca7:1070 with SMTP id s19-20020a170902c65300b001ce5ca71070mr18992348pls.16.1701268212544;
        Wed, 29 Nov 2023 06:30:12 -0800 (PST)
Received: from asharma-Latitude-3400 ([223.190.80.164])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902bf4b00b001c61073b076sm12249232pls.144.2023.11.29.06.30.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Nov 2023 06:30:12 -0800 (PST)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Wed, 29 Nov 2023 19:57:56 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [oe][meta-webserver][dunfell][PATCH] mod_http2: Backport fix for CVE-2023-45802
Date: Wed, 29 Nov 2023 19:57:54 +0530
Message-Id: <20231129142754.5729-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 14:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107138

Upstream-Status: Backport from [https://github.com/apache/httpd/commit/decce82a706abd78dfc32821a03ad93841d7758a]
CVE: CVE-2023-45802

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../apache2/apache2/CVE-2023-45802.patch      | 141 ++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.57.bb   |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2023-45802.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2023-45802.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2023-45802.patch
new file mode 100644
index 000000000..ee26e701f
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2023-45802.patch
@@ -0,0 +1,141 @@
+From decce82a706abd78dfc32821a03ad93841d7758a Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <icing@apache.org>
+Date: Mon, 16 Oct 2023 09:05:00 +0000
+Subject: [PATCH] Merge of /httpd/httpd/trunk:r1912999
+
+ * mod_http2: improved early cleanup of streams.
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x@1913000 13f79535-47bb-0310-9956-ffa450edef68
+---
+Upstream-Status: Backport from [https://github.com/apache/httpd/commit/decce82a706abd78dfc32821a03ad93841d7758a]
+CVE: CVE-2023-45802
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+ changes-entries/h2_cleanup.txt |  2 ++
+ modules/http2/h2_mplx.c        | 26 ++++++++++++++++++++++----
+ modules/http2/h2_mplx.h        |  3 ++-
+ modules/http2/h2_session.c     | 18 +++++++++++++++++-
+ modules/http2/h2_stream.c      |  2 +-
+ 5 files changed, 44 insertions(+), 7 deletions(-)
+ create mode 100644 changes-entries/h2_cleanup.txt
+
+diff --git a/changes-entries/h2_cleanup.txt b/changes-entries/h2_cleanup.txt
+new file mode 100644
+index 00000000000..5366b4adfc6
+--- /dev/null
++++ b/changes-entries/h2_cleanup.txt
+@@ -0,0 +1,2 @@
++ * mod_http2: improved early cleanup of streams.
++   [Stefan Eissing]
+diff --git a/modules/http2/h2_mplx.c b/modules/http2/h2_mplx.c
+index 4637a5f66ef..2aeea42b5df 100644
+--- a/modules/http2/h2_mplx.c
++++ b/modules/http2/h2_mplx.c
+@@ -1119,14 +1119,32 @@ static int reset_is_acceptable(h2_stream *stream)
+     return 1; /* otherwise, be forgiving */
+ }
+ 
+-apr_status_t h2_mplx_c1_client_rst(h2_mplx *m, int stream_id)
++apr_status_t h2_mplx_c1_client_rst(h2_mplx *m, int stream_id, h2_stream *stream)
+ {
+-    h2_stream *stream;
+     apr_status_t status = APR_SUCCESS;
++    int registered;
+ 
+     H2_MPLX_ENTER_ALWAYS(m);
+-    stream = h2_ihash_get(m->streams, stream_id);
+-    if (stream && !reset_is_acceptable(stream)) {
++    registered = (h2_ihash_get(m->streams, stream_id) != NULL);
++    if (!stream) {
++      /* a RST might arrive so late, we have already forgotten
++       * about it. Seems ok. */
++      ap_log_cerror(APLOG_MARK, APLOG_DEBUG, 0, m->c1,
++                    H2_MPLX_MSG(m, "RST on unknown stream %d"), stream_id);
++      AP_DEBUG_ASSERT(!registered);
++    }
++    else if (!registered) {
++      /* a RST on a stream that mplx has not been told about, but
++       * which the session knows. Very early and annoying. */
++      ap_log_cerror(APLOG_MARK, APLOG_DEBUG, 0, m->c1,
++                    H2_STRM_MSG(stream, "very early RST, drop"));
++      h2_stream_set_monitor(stream, NULL);
++      h2_stream_rst(stream, H2_ERR_STREAM_CLOSED);
++      h2_stream_dispatch(stream, H2_SEV_EOS_SENT);
++      m_stream_cleanup(m, stream);
++      m_be_annoyed(m);
++    }
++    else if (!reset_is_acceptable(stream)) {
+         m_be_annoyed(m);
+     }
+     H2_MPLX_LEAVE(m);
+diff --git a/modules/http2/h2_mplx.h b/modules/http2/h2_mplx.h
+index a2e73d9d7c3..860f9160397 100644
+--- a/modules/http2/h2_mplx.h
++++ b/modules/http2/h2_mplx.h
+@@ -201,7 +201,8 @@ int h2_mplx_c1_all_streams_want_send_data(h2_mplx *m);
+  * any processing going on and remove from processing
+  * queue.
+  */
+-apr_status_t h2_mplx_c1_client_rst(h2_mplx *m, int stream_id);
++apr_status_t h2_mplx_c1_client_rst(h2_mplx *m, int stream_id,
++                                   struct h2_stream *stream);
+ 
+ /**
+  * Get readonly access to a stream for a secondary connection.
+diff --git a/modules/http2/h2_session.c b/modules/http2/h2_session.c
+index 066c73ad98b..b6f6e7c01fb 100644
+--- a/modules/http2/h2_session.c
++++ b/modules/http2/h2_session.c
+@@ -402,6 +402,10 @@ static int on_frame_recv_cb(nghttp2_session *ng2s,
+                           H2_SSSN_STRM_MSG(session, frame->hd.stream_id,
+                           "RST_STREAM by client, error=%d"),
+                           (int)frame->rst_stream.error_code);
++            if (stream) {
++                rv = h2_stream_recv_frame(stream, NGHTTP2_RST_STREAM, frame->hd.flags,
++                    frame->hd.length + H2_FRAME_HDR_LEN);
++            }
+             if (stream && stream->initiated_on) {
+                 /* A stream reset on a request we sent it. Normal, when the
+                  * client does not want it. */
+@@ -410,7 +414,8 @@ static int on_frame_recv_cb(nghttp2_session *ng2s,
+             else {
+                 /* A stream reset on a request it sent us. Could happen in a browser
+                  * when the user navigates away or cancels loading - maybe. */
+-                h2_mplx_c1_client_rst(session->mplx, frame->hd.stream_id);
++                h2_mplx_c1_client_rst(session->mplx, frame->hd.stream_id,
++                                      stream);
+             }
+             ++session->streams_reset;
+             break;
+@@ -812,6 +817,17 @@ static apr_status_t session_cleanup(h2_session *session, const char *trigger)
+                       "goodbye, clients will be confused, should not happen"));
+     }
+ 
++    if (!h2_iq_empty(session->ready_to_process)) {
++        int sid;
++        ap_log_cerror(APLOG_MARK, APLOG_DEBUG, 0, c,
++                      H2_SSSN_LOG(APLOGNO(), session,
++                      "cleanup, resetting %d streams in ready-to-process"),
++                      h2_iq_count(session->ready_to_process));
++        while ((sid = h2_iq_shift(session->ready_to_process)) > 0) {
++          h2_mplx_c1_client_rst(session->mplx, sid, get_stream(session, sid));
++        }
++    }
++
+     transit(session, trigger, H2_SESSION_ST_CLEANUP);
+     h2_mplx_c1_destroy(session->mplx);
+     session->mplx = NULL;
+diff --git a/modules/http2/h2_stream.c b/modules/http2/h2_stream.c
+index c419e2d8591..f6c92024519 100644
+--- a/modules/http2/h2_stream.c
++++ b/modules/http2/h2_stream.c
+@@ -125,7 +125,7 @@ static int trans_on_event[][H2_SS_MAX] = {
+ { S_XXX, S_ERR,  S_ERR,  S_CL_L, S_CLS,  S_XXX,  S_XXX,  S_XXX, },/* EV_CLOSED_L*/
+ { S_ERR, S_ERR,  S_ERR,  S_CL_R, S_ERR,  S_CLS,  S_NOP,  S_NOP, },/* EV_CLOSED_R*/
+ { S_CLS, S_CLS,  S_CLS,  S_CLS,  S_CLS,  S_CLS,  S_NOP,  S_NOP, },/* EV_CANCELLED*/
+-{ S_NOP, S_XXX,  S_XXX,  S_XXX,  S_XXX,  S_CLS,  S_CLN,  S_XXX, },/* EV_EOS_SENT*/
++{ S_NOP, S_XXX,  S_XXX,  S_XXX,  S_XXX,  S_CLS,  S_CLN,  S_NOP, },/* EV_EOS_SENT*/
+ { S_NOP, S_XXX,  S_CLS,  S_XXX,  S_XXX,  S_CLS,  S_XXX,  S_XXX, },/* EV_IN_ERROR*/
+ };
+ 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
index 36d78942c..06b00859a 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
@@ -17,6 +17,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
            file://0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch \
+           file://CVE-2023-45802.patch \
           "
 
 SRC_URI:append:class-target = " \
-- 
2.24.4


