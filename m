Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB30C4332F
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 22:57:03 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.84746.1638313022935458025
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:57:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gMg/Alr1;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id r138so21411110pgr.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CkYknpvA2V5QG30+UVPm2JaFp7fr5xBaLjGz+GNRw5M=;
        b=gMg/Alr1M6pNItqXa8r2LeeqbxN4Soc86EROInI46EKXHC9qzGgFjnYSbFpL3JM1zC
         IuSUeyTj/CfeUtmLdFGkFf1+egWKx9CFv3Avdu0eAmzepaWM7a/fcV+2PQI57XygsjET
         ZjVSoiUIMRW/bVkLae3kZbIGeM5PQN5O1LMJKH7n+dbjOMmTZHw5jGIXtQ6eDgyjQGQ7
         /WiPwXAx2hJ0EWnlSVzuBZYrpGdA3CjDv5Bso/J9sTFZakjgNKJVEmkD7dS8JfToMmAM
         a3qUU0yfCi48ThqipBV1ZD93CRU5o0v9AEjTycrlMd06fyB/+vAVEPM1+ExHK13O5R4b
         abcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CkYknpvA2V5QG30+UVPm2JaFp7fr5xBaLjGz+GNRw5M=;
        b=bCrHG9ArRT4kvzSZtZLOJehwPv8y3oToo9bKbWXbWDPKFE/100R9ttfzZL/SW1/f9u
         htZVsMU+w7/BQ9aRHJ+TWOIePJj96cVl+dVrXVCKUNrEsuSHMy4E4c5Y0veChXxDZCe2
         DtHlK1gi4uU364LuDcijmeCVF0LIne7WIwvCNj0jTFKf56QkVVMdB0u/Gi01ClpZ28rL
         suWyDJMR1M6hqSB6j//MtPg0yoWSq0f5fU7J1LZjj2sRlqyfI+FxYjgZTisqJDiV8AOp
         CroKW0qUd6Rf3dWktTz/0XBTiCVWpRM26XOqFTULu7JDHvF4WuAuwBzDCWRG76zi0yUI
         e90w==
X-Gm-Message-State: AOAM531xCQ3bQtWM3jqc03PRKIS7Rc4QXOG/NuFkiWeuYFDECoBIa9s8
	muMwOe0MTSTw+8ZZBD+jxUdAxbPZdFY=
X-Google-Smtp-Source: 
 ABdhPJw7eSRE0wt+zq76PP7XwXBb7T7t+nyRjwhTEK1/Qmsecy7QyjeA6B2GeAoiD6b6p8ZoDwJ2FQ==
X-Received: by 2002:a62:7ec4:0:b0:4a3:219b:7008 with SMTP id
 z187-20020a627ec4000000b004a3219b7008mr2013364pfc.3.1638313021882;
        Tue, 30 Nov 2021 14:57:01 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7839:c9c5:3df1:81ad])
        by smtp.gmail.com with ESMTPSA id
 p16sm23373028pfh.97.2021.11.30.14.57.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 14:57:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 4/6] postgresql: fix CVE-2021-23214,CVE-2021-23222
Date: Tue, 30 Nov 2021 14:56:53 -0800
Message-Id: 
 <b87521033c7c6a7c546392bd399dad641169554e.1638312940.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638312940.git.akuster808@gmail.com>
References: <cover.1638312940.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 22:57:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94157

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../postgresql/files/CVE-2021-23214.patch     | 116 ++++++++++++++++
 .../postgresql/files/CVE-2021-23222.patch     | 131 ++++++++++++++++++
 .../recipes-dbs/postgresql/postgresql_13.4.bb |   2 +
 3 files changed, 249 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch
new file mode 100644
index 0000000000..58bf810626
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch
@@ -0,0 +1,116 @@
+From 24c2b9e42edb6d2f4ef2cead3b0aa1d6196adfce Mon Sep 17 00:00:00 2001
+From: Tom Lane <tgl@sss.pgh.pa.us>
+Date: Mon, 8 Nov 2021 11:01:43 -0500
+Subject: [PATCH 2/2] Reject extraneous data after SSL or GSS encryption
+ handshake.
+
+The server collects up to a bufferload of data whenever it reads data
+from the client socket.  When SSL or GSS encryption is requested
+during startup, any additional data received with the initial
+request message remained in the buffer, and would be treated as
+already-decrypted data once the encryption handshake completed.
+Thus, a man-in-the-middle with the ability to inject data into the 
+TCP connection could stuff some cleartext data into the start of
+a supposedly encryption-protected database session.
+
+This could be abused to send faked SQL commands to the server,
+although that would only work if the server did not demand any 
+authentication data.  (However, a server relying on SSL certificate
+authentication might well not do so.)
+
+To fix, throw a protocol-violation error if the internal buffer
+is not empty after the encryption handshake.
+
+Our thanks to Jacob Champion for reporting this problem.
+
+Security: CVE-2021-23214
+
+Upstream-Status: Backport[https://github.com/postgres/postgres/commit/28e24125541545483093819efae9bca603441951]
+CVE: CVE-2021-23214
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ src/backend/libpq/pqcomm.c          | 11 +++++++++++
+ src/backend/postmaster/postmaster.c | 23 ++++++++++++++++++++++-
+ src/include/libpq/libpq.h           |  1 +
+ 3 files changed, 34 insertions(+), 1 deletion(-)
+
+diff --git a/src/backend/libpq/pqcomm.c b/src/backend/libpq/pqcomm.c
+index ee2cd86..4dd1c02 100644
+--- a/src/backend/libpq/pqcomm.c
++++ b/src/backend/libpq/pqcomm.c
+@@ -1183,6 +1183,17 @@ pq_getstring(StringInfo s)
+ 	}
+ }
+ 
++/* -------------------------------
++ *             pq_buffer_has_data              - is any buffered data available to read?
++ *
++ * This will *not* attempt to read more data.
++ * --------------------------------
++ */
++bool
++pq_buffer_has_data(void)
++{
++	return (PqRecvPointer < PqRecvLength);
++}
+ 
+ /* --------------------------------
+  *		pq_startmsgread - begin reading a message from the client.
+diff --git a/src/backend/postmaster/postmaster.c b/src/backend/postmaster/postmaster.c
+index 5775fc0..1fcc3f8 100644
+--- a/src/backend/postmaster/postmaster.c
++++ b/src/backend/postmaster/postmaster.c
+@@ -2049,6 +2049,17 @@ retry1:
+ 			return STATUS_ERROR;
+ #endif
+ 
++		/*
++		* At this point we should have no data already buffered.  If we do,
++		* it was received before we performed the SSL handshake, so it wasn't
++		* encrypted and indeed may have been injected by a man-in-the-middle.
++		* We report this case to the client.
++		*/
++		if (pq_buffer_has_data())
++			ereport(FATAL,
++				(errcode(ERRCODE_PROTOCOL_VIOLATION),
++				errmsg("received unencrypted data after SSL request"),
++				errdetail("This could be either a client-software bug or evidence of an attempted man-in-the-middle attack.")));
+ 		/*
+ 		 * regular startup packet, cancel, etc packet should follow, but not
+ 		 * another SSL negotiation request, and a GSS request should only
+@@ -2080,7 +2091,17 @@ retry1:
+ 		if (GSSok == 'G' && secure_open_gssapi(port) == -1)
+ 			return STATUS_ERROR;
+ #endif
+-
++		/*
++		* At this point we should have no data already buffered.  If we do,
++		* it was received before we performed the GSS handshake, so it wasn't
++		* encrypted and indeed may have been injected by a man-in-the-middle.
++		* We report this case to the client.
++		*/
++		if (pq_buffer_has_data())
++			ereport(FATAL,
++				(errcode(ERRCODE_PROTOCOL_VIOLATION),
++				errmsg("received unencrypted data after GSSAPI encryption request"),
++				errdetail("This could be either a client-software bug or evidence of an attempted man-in-the-middle attack.")));
+ 		/*
+ 		 * regular startup packet, cancel, etc packet should follow, but not
+ 		 * another GSS negotiation request, and an SSL request should only
+diff --git a/src/include/libpq/libpq.h b/src/include/libpq/libpq.h
+index b115247..9969692 100644
+--- a/src/include/libpq/libpq.h
++++ b/src/include/libpq/libpq.h
+@@ -73,6 +73,7 @@ extern int	pq_getbyte(void);
+ extern int	pq_peekbyte(void);
+ extern int	pq_getbyte_if_available(unsigned char *c);
+ extern int	pq_putbytes(const char *s, size_t len);
++extern bool pq_buffer_has_data(void);
+ 
+ /*
+  * prototypes for functions in be-secure.c
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch
new file mode 100644
index 0000000000..42b78539b4
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch
@@ -0,0 +1,131 @@
+From 79125ead2a6a234086844bb42f06d49603fe6ca0 Mon Sep 17 00:00:00 2001
+From: Tom Lane <tgl@sss.pgh.pa.us>
+Date: Mon, 8 Nov 2021 11:14:56 -0500
+Subject: [PATCH 1/2] libpq: reject extraneous data after SSL or GSS encryption
+ handshake.
+
+libpq collects up to a bufferload of data whenever it reads data from
+the socket.  When SSL or GSS encryption is requested during startup,
+any additional data received with the server's yes-or-no reply
+remained in the buffer, and would be treated as already-decrypted data
+once the encryption handshake completed.  Thus, a man-in-the-middle
+with the ability to inject data into the TCP connection could stuff
+some cleartext data into the start of a supposedly encryption-protected
+database session.
+
+This could probably be abused to inject faked responses to the
+client's first few queries, although other details of libpq's behavior
+make that harder than it sounds.  A different line of attack is to
+exfiltrate the client's password, or other sensitive data that might
+be sent early in the session.  That has been shown to be possible with
+a server vulnerable to CVE-2021-23214.
+
+To fix, throw a protocol-violation error if the internal buffer
+is not empty after the encryption handshake.
+
+Our thanks to Jacob Champion for reporting this problem.
+
+Security: CVE-2021-23222
+
+Upstream-Status: Backport[https://github.com/postgres/postgres/commit/160c0258802d10b0600d7671b1bbea55d8e17d45]
+CVE: CVE-2021-23222
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ doc/src/sgml/protocol.sgml        | 28 ++++++++++++++++++++++++++++
+ src/interfaces/libpq/fe-connect.c | 26 ++++++++++++++++++++++++++
+ 2 files changed, 54 insertions(+)
+
+diff --git a/doc/src/sgml/protocol.sgml b/doc/src/sgml/protocol.sgml
+index e26619e1b5..b692648fca 100644
+--- a/doc/src/sgml/protocol.sgml
++++ b/doc/src/sgml/protocol.sgml
+@@ -1471,6 +1471,20 @@ SELCT 1/0;<!-- this typo is intentional -->
+     and proceed without requesting <acronym>SSL</acronym>.
+    </para>
+ 
++   <para>
++    When <acronym>SSL</acronym> encryption can be performed, the server
++    is expected to send only the single <literal>S</literal> byte and then
++    wait for the frontend to initiate an <acronym>SSL</acronym> handshake.
++    If additional bytes are available to read at this point, it likely
++    means that a man-in-the-middle is attempting to perform a
++    buffer-stuffing attack
++    (<ulink url="https://www.postgresql.org/support/security/CVE-2021-23222/">CVE-2021-23222</ulink>).
++    Frontends should be coded either to read exactly one byte from the
++    socket before turning the socket over to their SSL library, or to
++    treat it as a protocol violation if they find they have read additional
++    bytes.
++   </para>
++
+    <para>
+     An initial SSLRequest can also be used in a connection that is being
+     opened to send a CancelRequest message.
+@@ -1532,6 +1546,20 @@ SELCT 1/0;<!-- this typo is intentional -->
+     encryption.
+    </para>
+ 
++   <para>
++    When <acronym>GSSAPI</acronym> encryption can be performed, the server
++    is expected to send only the single <literal>G</literal> byte and then
++    wait for the frontend to initiate a <acronym>GSSAPI</acronym> handshake.
++    If additional bytes are available to read at this point, it likely
++    means that a man-in-the-middle is attempting to perform a
++    buffer-stuffing attack
++    (<ulink url="https://www.postgresql.org/support/security/CVE-2021-23222/">CVE-2021-23222</ulink>).
++    Frontends should be coded either to read exactly one byte from the
++    socket before turning the socket over to their GSSAPI library, or to
++    treat it as a protocol violation if they find they have read additional
++    bytes.
++   </para>
++
+    <para>
+     An initial GSSENCRequest can also be used in a connection that is being
+     opened to send a CancelRequest message.
+diff --git a/src/interfaces/libpq/fe-connect.c b/src/interfaces/libpq/fe-connect.c
+index f80f4e98d8..57aee95183 100644
+--- a/src/interfaces/libpq/fe-connect.c
++++ b/src/interfaces/libpq/fe-connect.c
+@@ -3076,6 +3076,19 @@ keep_going:						/* We will come back to here until there is
+ 				pollres = pqsecure_open_client(conn);
+ 				if (pollres == PGRES_POLLING_OK)
+ 				{
++					/*
++					 * At this point we should have no data already buffered.
++					 * If we do, it was received before we performed the SSL
++					 * handshake, so it wasn't encrypted and indeed may have
++					 * been injected by a man-in-the-middle.
++					 */
++					if (conn->inCursor != conn->inEnd)
++					{
++						appendPQExpBufferStr(&conn->errorMessage,
++											 libpq_gettext("received unencrypted data after SSL response\n"));
++						goto error_return;
++					}
++
+ 					/* SSL handshake done, ready to send startup packet */
+ 					conn->status = CONNECTION_MADE;
+ 					return PGRES_POLLING_WRITING;
+@@ -3175,6 +3188,19 @@ keep_going:						/* We will come back to here until there is
+ 				pollres = pqsecure_open_gss(conn);
+ 				if (pollres == PGRES_POLLING_OK)
+ 				{
++					/*
++					 * At this point we should have no data already buffered.
++					 * If we do, it was received before we performed the GSS
++					 * handshake, so it wasn't encrypted and indeed may have
++					 * been injected by a man-in-the-middle.
++					 */
++					if (conn->inCursor != conn->inEnd)
++					{
++						appendPQExpBufferStr(&conn->errorMessage,
++											 libpq_gettext("received unencrypted data after GSSAPI encryption response\n"));
++						goto error_return;
++					}
++
+ 					/* All set for startup packet */
+ 					conn->status = CONNECTION_MADE;
+ 					return PGRES_POLLING_WRITING;
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
index f63d23dbef..2ed0fa49bb 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
@@ -7,6 +7,8 @@ SRC_URI += "\
    file://0001-Add-support-for-RISC-V.patch \
    file://0001-Improve-reproducibility.patch \
    file://0001-configure.in-bypass-autoconf-2.69-version-check.patch \
+   file://CVE-2021-23214.patch \
+   file://CVE-2021-23222.patch \
 "
 
 SRC_URI[sha256sum] = "ea93e10390245f1ce461a54eb5f99a48d8cabd3a08ce4d652ec2169a357bc0cd"
-- 
2.25.1


