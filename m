Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514EBC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 05:13:38 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.10534.1704777213956153839
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 21:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WCR0KmR6;
 spf=pass (domain: mvista.com, ip: 209.85.160.50, mailfrom: hprajapati@mvista.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2045bedb806so2399831fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 21:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704777213; x=1705382013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQS4NrBVbiibFTcs2d6OnQBCErexqnSfoJzqrkLbSAk=;
        b=WCR0KmR6sFOYK9Sb2fOCE0XAoOc//RHuCUMUVjGHwPI5T4yAOo14hKQKJ4RSC0tHQI
         nVxVLwUmUGJCjBdoX6wnXcLfFRo23mZdW56+HiLx09UsstouNHQ1KzmLKlTDEGL1wtP3
         AMw56SoE4UXKT6j/IGq6qpCUGpTzsIdePYupk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704777213; x=1705382013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQS4NrBVbiibFTcs2d6OnQBCErexqnSfoJzqrkLbSAk=;
        b=f2GB3rnsPMZ8ie3Qms+co3usJe8AAFOiiG50CXLLrXXl2Z4qrrYR+S1q+1oqz/SxF/
         DU/mONZbG7mr4CjnRWof/DxwAWPKdhjuj+ZSrDQb8j8VhU2fB4sKckzg2N4dsJz5+tga
         XEIbq7zdCtqQDeTeKVLvwVr9gSmkxDmuWIZljKPiGqGk5dbcyOiCQZxBDr6nkoJmNQ2S
         FkwqHoBYK84tz2B8jt8Lx8zj3gQ2wLGqDeH0bUvDwURrN6xqR6UNG3mxliHAp/xAQ6RP
         I39c8rDQ0BIrY0s/uhAM7jjZS9rDQgdrlPrdEnH+VA8ZuJOmFj7KbRoGuuwBSLfslpcB
         Zl5A==
X-Gm-Message-State: AOJu0YxrxRkJ1uVzItVYvLdCTYfqtN546I22lK7i/O0LiByjjFQYqOJr
	SOuxOObS+AZ0+tyB3o5EtasPK5bQqsqdOPYop7KGhklG4dg=
X-Google-Smtp-Source: AGHT+IHIaWv/J+4X/86U4DTeSDgNnDuPYpHGd27dvv6NmiKDDpgHYoN/3leIsaCIdKA6RYMIdu9ohw==
X-Received: by 2002:a05:6870:8994:b0:203:3016:2f56 with SMTP id f20-20020a056870899400b0020330162f56mr7171988oaq.45.1704777212794;
        Mon, 08 Jan 2024 21:13:32 -0800 (PST)
Received: from MVIN00016.mvista.com ([150.129.170.233])
        by smtp.gmail.com with ESMTPSA id l2-20020a632502000000b005c67ca3c2c2sm693664pgl.21.2024.01.08.21.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 21:13:32 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-webserver][dunfell][PATCH] apache2: upgrade 2.4.57 -> 2.4.58
Date: Tue,  9 Jan 2024 10:43:26 +0530
Message-Id: <20240109051326.126005-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 05:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108182

This upgrade incorporates the CVE-2023-31122, CVE-2023-43622 &
CVE-2023-45802 fixes and other bugfixes.

The "0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch"
and "CVE-2023-45802.patch" is no longer needed as it's included in this upgrade.

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.58

References:
https://httpd.apache.org/security/vulnerabilities_24.html
https://security-tracker.debian.org/tracker/CVE-2023-31122
https://security-tracker.debian.org/tracker/CVE-2023-43622
https://security-tracker.debian.org/tracker/CVE-2023-45802

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 ...config9.m4-Add-server-directory-to-i.patch |  31 ----
 .../apache2/apache2/CVE-2023-45802.patch      | 141 ------------------
 .../{apache2_2.4.57.bb => apache2_2.4.58.bb}  |   4 +-
 3 files changed, 1 insertion(+), 175 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2023-45802.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb => apache2_2.4.58.bb} (97%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
deleted file mode 100644
index 996eabf586..0000000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5c9257fa34335ff83f7c01581cf953111072a457 Mon Sep 17 00:00:00 2001
-From: Valeria Petrov <valeria.petrov@spinetix.com>
-Date: Tue, 18 Apr 2023 15:38:53 +0200
-Subject: [PATCH] * modules/mappers/config9.m4: Add 'server' directory to
- include path if mod_rewrite is enabled.
-
-Upstream-Status: Accepted [https://svn.apache.org/viewvc?view=revision&revision=1909241]
-
----
- modules/mappers/config9.m4 | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/modules/mappers/config9.m4 b/modules/mappers/config9.m4
-index 55a97ab993..7120b729b7 100644
---- a/modules/mappers/config9.m4
-+++ b/modules/mappers/config9.m4
-@@ -14,6 +14,11 @@ APACHE_MODULE(userdir, mapping of requests to user-specific directories, , , mos
- APACHE_MODULE(alias, mapping of requests to different filesystem parts, , , yes)
- APACHE_MODULE(rewrite, rule based URL manipulation, , , most)
- 
-+if test "x$enable_rewrite" != "xno"; then
-+    # mod_rewrite needs test_char.h
-+    APR_ADDTO(INCLUDES, [-I\$(top_builddir)/server])
-+fi
-+
- APR_ADDTO(INCLUDES, [-I\$(top_srcdir)/$modpath_current])
- 
- APACHE_MODPATH_FINISH
--- 
-2.25.1
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2023-45802.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2023-45802.patch
deleted file mode 100644
index ee26e701f3..0000000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2023-45802.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From decce82a706abd78dfc32821a03ad93841d7758a Mon Sep 17 00:00:00 2001
-From: Stefan Eissing <icing@apache.org>
-Date: Mon, 16 Oct 2023 09:05:00 +0000
-Subject: [PATCH] Merge of /httpd/httpd/trunk:r1912999
-
- * mod_http2: improved early cleanup of streams.
-
-
-
-git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x@1913000 13f79535-47bb-0310-9956-ffa450edef68
----
-Upstream-Status: Backport from [https://github.com/apache/httpd/commit/decce82a706abd78dfc32821a03ad93841d7758a]
-CVE: CVE-2023-45802
-Signed-off-by: Ashish Sharma <asharma@mvista.com>
- changes-entries/h2_cleanup.txt |  2 ++
- modules/http2/h2_mplx.c        | 26 ++++++++++++++++++++++----
- modules/http2/h2_mplx.h        |  3 ++-
- modules/http2/h2_session.c     | 18 +++++++++++++++++-
- modules/http2/h2_stream.c      |  2 +-
- 5 files changed, 44 insertions(+), 7 deletions(-)
- create mode 100644 changes-entries/h2_cleanup.txt
-
-diff --git a/changes-entries/h2_cleanup.txt b/changes-entries/h2_cleanup.txt
-new file mode 100644
-index 00000000000..5366b4adfc6
---- /dev/null
-+++ b/changes-entries/h2_cleanup.txt
-@@ -0,0 +1,2 @@
-+ * mod_http2: improved early cleanup of streams.
-+   [Stefan Eissing]
-diff --git a/modules/http2/h2_mplx.c b/modules/http2/h2_mplx.c
-index 4637a5f66ef..2aeea42b5df 100644
---- a/modules/http2/h2_mplx.c
-+++ b/modules/http2/h2_mplx.c
-@@ -1119,14 +1119,32 @@ static int reset_is_acceptable(h2_stream *stream)
-     return 1; /* otherwise, be forgiving */
- }
- 
--apr_status_t h2_mplx_c1_client_rst(h2_mplx *m, int stream_id)
-+apr_status_t h2_mplx_c1_client_rst(h2_mplx *m, int stream_id, h2_stream *stream)
- {
--    h2_stream *stream;
-     apr_status_t status = APR_SUCCESS;
-+    int registered;
- 
-     H2_MPLX_ENTER_ALWAYS(m);
--    stream = h2_ihash_get(m->streams, stream_id);
--    if (stream && !reset_is_acceptable(stream)) {
-+    registered = (h2_ihash_get(m->streams, stream_id) != NULL);
-+    if (!stream) {
-+      /* a RST might arrive so late, we have already forgotten
-+       * about it. Seems ok. */
-+      ap_log_cerror(APLOG_MARK, APLOG_DEBUG, 0, m->c1,
-+                    H2_MPLX_MSG(m, "RST on unknown stream %d"), stream_id);
-+      AP_DEBUG_ASSERT(!registered);
-+    }
-+    else if (!registered) {
-+      /* a RST on a stream that mplx has not been told about, but
-+       * which the session knows. Very early and annoying. */
-+      ap_log_cerror(APLOG_MARK, APLOG_DEBUG, 0, m->c1,
-+                    H2_STRM_MSG(stream, "very early RST, drop"));
-+      h2_stream_set_monitor(stream, NULL);
-+      h2_stream_rst(stream, H2_ERR_STREAM_CLOSED);
-+      h2_stream_dispatch(stream, H2_SEV_EOS_SENT);
-+      m_stream_cleanup(m, stream);
-+      m_be_annoyed(m);
-+    }
-+    else if (!reset_is_acceptable(stream)) {
-         m_be_annoyed(m);
-     }
-     H2_MPLX_LEAVE(m);
-diff --git a/modules/http2/h2_mplx.h b/modules/http2/h2_mplx.h
-index a2e73d9d7c3..860f9160397 100644
---- a/modules/http2/h2_mplx.h
-+++ b/modules/http2/h2_mplx.h
-@@ -201,7 +201,8 @@ int h2_mplx_c1_all_streams_want_send_data(h2_mplx *m);
-  * any processing going on and remove from processing
-  * queue.
-  */
--apr_status_t h2_mplx_c1_client_rst(h2_mplx *m, int stream_id);
-+apr_status_t h2_mplx_c1_client_rst(h2_mplx *m, int stream_id,
-+                                   struct h2_stream *stream);
- 
- /**
-  * Get readonly access to a stream for a secondary connection.
-diff --git a/modules/http2/h2_session.c b/modules/http2/h2_session.c
-index 066c73ad98b..b6f6e7c01fb 100644
---- a/modules/http2/h2_session.c
-+++ b/modules/http2/h2_session.c
-@@ -402,6 +402,10 @@ static int on_frame_recv_cb(nghttp2_session *ng2s,
-                           H2_SSSN_STRM_MSG(session, frame->hd.stream_id,
-                           "RST_STREAM by client, error=%d"),
-                           (int)frame->rst_stream.error_code);
-+            if (stream) {
-+                rv = h2_stream_recv_frame(stream, NGHTTP2_RST_STREAM, frame->hd.flags,
-+                    frame->hd.length + H2_FRAME_HDR_LEN);
-+            }
-             if (stream && stream->initiated_on) {
-                 /* A stream reset on a request we sent it. Normal, when the
-                  * client does not want it. */
-@@ -410,7 +414,8 @@ static int on_frame_recv_cb(nghttp2_session *ng2s,
-             else {
-                 /* A stream reset on a request it sent us. Could happen in a browser
-                  * when the user navigates away or cancels loading - maybe. */
--                h2_mplx_c1_client_rst(session->mplx, frame->hd.stream_id);
-+                h2_mplx_c1_client_rst(session->mplx, frame->hd.stream_id,
-+                                      stream);
-             }
-             ++session->streams_reset;
-             break;
-@@ -812,6 +817,17 @@ static apr_status_t session_cleanup(h2_session *session, const char *trigger)
-                       "goodbye, clients will be confused, should not happen"));
-     }
- 
-+    if (!h2_iq_empty(session->ready_to_process)) {
-+        int sid;
-+        ap_log_cerror(APLOG_MARK, APLOG_DEBUG, 0, c,
-+                      H2_SSSN_LOG(APLOGNO(), session,
-+                      "cleanup, resetting %d streams in ready-to-process"),
-+                      h2_iq_count(session->ready_to_process));
-+        while ((sid = h2_iq_shift(session->ready_to_process)) > 0) {
-+          h2_mplx_c1_client_rst(session->mplx, sid, get_stream(session, sid));
-+        }
-+    }
-+
-     transit(session, trigger, H2_SESSION_ST_CLEANUP);
-     h2_mplx_c1_destroy(session->mplx);
-     session->mplx = NULL;
-diff --git a/modules/http2/h2_stream.c b/modules/http2/h2_stream.c
-index c419e2d8591..f6c92024519 100644
---- a/modules/http2/h2_stream.c
-+++ b/modules/http2/h2_stream.c
-@@ -125,7 +125,7 @@ static int trans_on_event[][H2_SS_MAX] = {
- { S_XXX, S_ERR,  S_ERR,  S_CL_L, S_CLS,  S_XXX,  S_XXX,  S_XXX, },/* EV_CLOSED_L*/
- { S_ERR, S_ERR,  S_ERR,  S_CL_R, S_ERR,  S_CLS,  S_NOP,  S_NOP, },/* EV_CLOSED_R*/
- { S_CLS, S_CLS,  S_CLS,  S_CLS,  S_CLS,  S_CLS,  S_NOP,  S_NOP, },/* EV_CANCELLED*/
--{ S_NOP, S_XXX,  S_XXX,  S_XXX,  S_XXX,  S_CLS,  S_CLN,  S_XXX, },/* EV_EOS_SENT*/
-+{ S_NOP, S_XXX,  S_XXX,  S_XXX,  S_XXX,  S_CLS,  S_CLN,  S_NOP, },/* EV_EOS_SENT*/
- { S_NOP, S_XXX,  S_CLS,  S_XXX,  S_XXX,  S_CLS,  S_XXX,  S_XXX, },/* EV_IN_ERROR*/
- };
- 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
similarity index 97%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
index 2484f90eb6..746db4ac0a 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
@@ -15,8 +15,6 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0007-apache2-allow-to-disable-selinux-support.patch \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
-           file://0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch \
-           file://CVE-2023-45802.patch \
           "
 
 SRC_URI:append:class-target = " \
@@ -28,7 +26,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd83caecb262e5cf94d2a"
+SRC_URI[sha256sum] = "fa16d72a078210a54c47dd5bef2f8b9b8a01d94909a51453956b3ec6442ea4c5"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


