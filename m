Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF24C433EF
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 18:16:45 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.479.1642357004539109766
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jan 2022 10:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dVpXCJZI;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 d10-20020a17090a498a00b001b33bc40d01so9374815pjh.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jan 2022 10:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=fZRosco7uVRO/Sdgug3ovwtQClEIMZ5JRp+xGPZSGWA=;
        b=dVpXCJZIpS2+Q0B+HQX9jMOLIbk6qdw4isqTTfin1q9eseRrXPjyi8eQvcheUH11rg
         BbVUkHVMa6tKTxT9ycf4avvxssFONq+VxzZSfJtaRWCen8eogoxHTnIx4ueB8/2tJZFj
         GL53tNsyiYnfbgFGROmrkkFMANePn4LeTLCdRwqO8OmmAvkEQeXNX/W0xLDMJKYcMEF+
         ziczR2/CTc7yGNsfLjBwN73iGF/FglX1l6bxqnDo3rWV6yfzsAvH5OpchraVieFj4stx
         xMtexAw92LB677CaWOlgI5KpImaMs/y+/5zfOaXWogMwiO9gvKdu+FyV8DI3Z3KsWKm0
         lORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fZRosco7uVRO/Sdgug3ovwtQClEIMZ5JRp+xGPZSGWA=;
        b=XHECN8WeVnfbVIzwhkQraiblJVaUe/AmUhn3ZSolxvPA/Fv6gCLz/GNv+Cp2+RgoVQ
         ARpimgpmMDGlzmQ79drOBWfptxDXS1+ripVTXQPcI+6a8NEEZ75jKFdKbHkSBcS/S1rq
         RfT9XPW5obMmkZdiar842cEaEp2zkAIs57uQaRVLuopLAt1WjXDJ0VMXsXArRYxhD6Ol
         XgDMj3CkPPiXdB1QR4AluNvdyaKOTda8etPgYN/V+f06LD6MFHmht9P+8DXMAVLYD36S
         f6+MAAC6Dd1oAOuGkOdydrk+sCgRNJZqQk6Oye9Apvwa+ggztpxLS1k0zDX9/NHEkK3t
         Donw==
X-Gm-Message-State: AOAM533zs20XFYe8uQsZPTFraQzAVNox1TC0SkC+/wjB40kjL3rXQL92
	af8Qvi422bIHteTJCYcadM7swfw7zDYbjg==
X-Google-Smtp-Source: 
 ABdhPJzq9nBtC/LkNqtppstPFzGrizAgJLE+/PY6fYzDC1hly+bTEg7+gTm8WzTioCOvG/zz5BocdA==
X-Received: by 2002:a17:90b:1a8c:: with SMTP id
 ng12mr30865822pjb.184.1642357003586;
        Sun, 16 Jan 2022 10:16:43 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:d6b0:9029:86aa:b4cb?
 ([2601:202:4180:a5c0:d6b0:9029:86aa:b4cb])
        by smtp.gmail.com with ESMTPSA id
 a9sm11057924pfo.169.2022.01.16.10.16.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 10:16:43 -0800 (PST)
Subject: Re: [oe] [meta-oe][hardknott][PATCH] postgresql: Update to 13.5
To: openembedded-devel@lists.openembedded.org
References: <20220115213351.974981-1-robert.joslyn@redrectangle.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <7662d30d-9c51-41c2-a54a-2610d3459e92@gmail.com>
Date: Sun, 16 Jan 2022 10:16:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220115213351.974981-1-robert.joslyn@redrectangle.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jan 2022 18:16:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94885

Robert,

On 1/15/22 1:33 PM, Robert Joslyn wrote:
> This is a security and bugfix release. With this update, the backported
> patches for CVE-2021-2314 and CVE-2021-23222 are no longer needed. Full
> release notes are available at:
> https://www.postgresql.org/docs/release/13.5/

If a patch to update master has not been sent, please do so as it
currently has the same version as hardknott.

thanks,
Armin
>
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  .../files/0001-Add-support-for-RISC-V.patch   |  10 +-
>  ...n-bypass-autoconf-2.69-version-check.patch |   2 +-
>  .../postgresql/files/CVE-2021-23214.patch     | 116 ----------------
>  .../postgresql/files/CVE-2021-23222.patch     | 131 ------------------
>  ...{postgresql_13.4.bb => postgresql_13.5.bb} |   4 +-
>  5 files changed, 8 insertions(+), 255 deletions(-)
>  delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch
>  delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_13.4.bb => postgresql_13.5.bb} (67%)
>
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
> index 0dc6ece6d..5c65e6185 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
> @@ -1,4 +1,4 @@
> -From b06a228a5fd1589fc9bed654b3288b321fc21aa1 Mon Sep 17 00:00:00 2001
> +From 0b60fe3c39b2f62f9867d955da82d9d20c42d028 Mon Sep 17 00:00:00 2001
>  From: "Richard W.M. Jones" <rjones@redhat.com>
>  Date: Sun, 20 Nov 2016 15:04:52 +0000
>  Subject: [PATCH] Add support for RISC-V.
> @@ -9,9 +9,11 @@ extending the existing aarch64 macro works.
>   src/include/storage/s_lock.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>  
> +diff --git a/src/include/storage/s_lock.h b/src/include/storage/s_lock.h
> +index 6b368a5..f7d3387 100644
>  --- a/src/include/storage/s_lock.h
>  +++ b/src/include/storage/s_lock.h
> -@@ -316,11 +316,12 @@ tas(volatile slock_t *lock)
> +@@ -317,11 +317,12 @@ tas(volatile slock_t *lock)
>   
>   /*
>    * On ARM and ARM64, we use __sync_lock_test_and_set(int *, int) if available.
> @@ -25,7 +27,7 @@ extending the existing aarch64 macro works.
>   #ifdef HAVE_GCC__SYNC_INT32_TAS
>   #define HAS_TEST_AND_SET
>   
> -@@ -337,7 +338,7 @@ tas(volatile slock_t *lock)
> +@@ -338,7 +339,7 @@ tas(volatile slock_t *lock)
>   #define S_UNLOCK(lock) __sync_lock_release(lock)
>   
>   #endif	 /* HAVE_GCC__SYNC_INT32_TAS */
> @@ -33,4 +35,4 @@ extending the existing aarch64 macro works.
>  +#endif	 /* __arm__ || __arm || __aarch64__ || __aarch64 || __riscv */
>   
>   
> - /* S/390 and S/390x Linux (32- and 64-bit zSeries) */
> + /*
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
> index db9769f82..17ba04b66 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
> @@ -18,7 +18,7 @@ index fb14dcc..a2b4a4f 100644
>  +++ b/configure.in
>  @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
>   
> - AC_INIT([PostgreSQL], [13.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
> + AC_INIT([PostgreSQL], [13.5], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
>   
>  -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
>  -Untested combinations of 'autoconf' and PostgreSQL versions are not
> diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch
> deleted file mode 100644
> index 58bf81062..000000000
> --- a/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch
> +++ /dev/null
> @@ -1,116 +0,0 @@
> -From 24c2b9e42edb6d2f4ef2cead3b0aa1d6196adfce Mon Sep 17 00:00:00 2001
> -From: Tom Lane <tgl@sss.pgh.pa.us>
> -Date: Mon, 8 Nov 2021 11:01:43 -0500
> -Subject: [PATCH 2/2] Reject extraneous data after SSL or GSS encryption
> - handshake.
> -
> -The server collects up to a bufferload of data whenever it reads data
> -from the client socket.  When SSL or GSS encryption is requested
> -during startup, any additional data received with the initial
> -request message remained in the buffer, and would be treated as
> -already-decrypted data once the encryption handshake completed.
> -Thus, a man-in-the-middle with the ability to inject data into the 
> -TCP connection could stuff some cleartext data into the start of
> -a supposedly encryption-protected database session.
> -
> -This could be abused to send faked SQL commands to the server,
> -although that would only work if the server did not demand any 
> -authentication data.  (However, a server relying on SSL certificate
> -authentication might well not do so.)
> -
> -To fix, throw a protocol-violation error if the internal buffer
> -is not empty after the encryption handshake.
> -
> -Our thanks to Jacob Champion for reporting this problem.
> -
> -Security: CVE-2021-23214
> -
> -Upstream-Status: Backport[https://github.com/postgres/postgres/commit/28e24125541545483093819efae9bca603441951]
> -CVE: CVE-2021-23214
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> -
> ----
> - src/backend/libpq/pqcomm.c          | 11 +++++++++++
> - src/backend/postmaster/postmaster.c | 23 ++++++++++++++++++++++-
> - src/include/libpq/libpq.h           |  1 +
> - 3 files changed, 34 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/backend/libpq/pqcomm.c b/src/backend/libpq/pqcomm.c
> -index ee2cd86..4dd1c02 100644
> ---- a/src/backend/libpq/pqcomm.c
> -+++ b/src/backend/libpq/pqcomm.c
> -@@ -1183,6 +1183,17 @@ pq_getstring(StringInfo s)
> - 	}
> - }
> - 
> -+/* -------------------------------
> -+ *             pq_buffer_has_data              - is any buffered data available to read?
> -+ *
> -+ * This will *not* attempt to read more data.
> -+ * --------------------------------
> -+ */
> -+bool
> -+pq_buffer_has_data(void)
> -+{
> -+	return (PqRecvPointer < PqRecvLength);
> -+}
> - 
> - /* --------------------------------
> -  *		pq_startmsgread - begin reading a message from the client.
> -diff --git a/src/backend/postmaster/postmaster.c b/src/backend/postmaster/postmaster.c
> -index 5775fc0..1fcc3f8 100644
> ---- a/src/backend/postmaster/postmaster.c
> -+++ b/src/backend/postmaster/postmaster.c
> -@@ -2049,6 +2049,17 @@ retry1:
> - 			return STATUS_ERROR;
> - #endif
> - 
> -+		/*
> -+		* At this point we should have no data already buffered.  If we do,
> -+		* it was received before we performed the SSL handshake, so it wasn't
> -+		* encrypted and indeed may have been injected by a man-in-the-middle.
> -+		* We report this case to the client.
> -+		*/
> -+		if (pq_buffer_has_data())
> -+			ereport(FATAL,
> -+				(errcode(ERRCODE_PROTOCOL_VIOLATION),
> -+				errmsg("received unencrypted data after SSL request"),
> -+				errdetail("This could be either a client-software bug or evidence of an attempted man-in-the-middle attack.")));
> - 		/*
> - 		 * regular startup packet, cancel, etc packet should follow, but not
> - 		 * another SSL negotiation request, and a GSS request should only
> -@@ -2080,7 +2091,17 @@ retry1:
> - 		if (GSSok == 'G' && secure_open_gssapi(port) == -1)
> - 			return STATUS_ERROR;
> - #endif
> --
> -+		/*
> -+		* At this point we should have no data already buffered.  If we do,
> -+		* it was received before we performed the GSS handshake, so it wasn't
> -+		* encrypted and indeed may have been injected by a man-in-the-middle.
> -+		* We report this case to the client.
> -+		*/
> -+		if (pq_buffer_has_data())
> -+			ereport(FATAL,
> -+				(errcode(ERRCODE_PROTOCOL_VIOLATION),
> -+				errmsg("received unencrypted data after GSSAPI encryption request"),
> -+				errdetail("This could be either a client-software bug or evidence of an attempted man-in-the-middle attack.")));
> - 		/*
> - 		 * regular startup packet, cancel, etc packet should follow, but not
> - 		 * another GSS negotiation request, and an SSL request should only
> -diff --git a/src/include/libpq/libpq.h b/src/include/libpq/libpq.h
> -index b115247..9969692 100644
> ---- a/src/include/libpq/libpq.h
> -+++ b/src/include/libpq/libpq.h
> -@@ -73,6 +73,7 @@ extern int	pq_getbyte(void);
> - extern int	pq_peekbyte(void);
> - extern int	pq_getbyte_if_available(unsigned char *c);
> - extern int	pq_putbytes(const char *s, size_t len);
> -+extern bool pq_buffer_has_data(void);
> - 
> - /*
> -  * prototypes for functions in be-secure.c
> --- 
> -2.17.1
> -
> diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch
> deleted file mode 100644
> index 42b78539b..000000000
> --- a/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch
> +++ /dev/null
> @@ -1,131 +0,0 @@
> -From 79125ead2a6a234086844bb42f06d49603fe6ca0 Mon Sep 17 00:00:00 2001
> -From: Tom Lane <tgl@sss.pgh.pa.us>
> -Date: Mon, 8 Nov 2021 11:14:56 -0500
> -Subject: [PATCH 1/2] libpq: reject extraneous data after SSL or GSS encryption
> - handshake.
> -
> -libpq collects up to a bufferload of data whenever it reads data from
> -the socket.  When SSL or GSS encryption is requested during startup,
> -any additional data received with the server's yes-or-no reply
> -remained in the buffer, and would be treated as already-decrypted data
> -once the encryption handshake completed.  Thus, a man-in-the-middle
> -with the ability to inject data into the TCP connection could stuff
> -some cleartext data into the start of a supposedly encryption-protected
> -database session.
> -
> -This could probably be abused to inject faked responses to the
> -client's first few queries, although other details of libpq's behavior
> -make that harder than it sounds.  A different line of attack is to
> -exfiltrate the client's password, or other sensitive data that might
> -be sent early in the session.  That has been shown to be possible with
> -a server vulnerable to CVE-2021-23214.
> -
> -To fix, throw a protocol-violation error if the internal buffer
> -is not empty after the encryption handshake.
> -
> -Our thanks to Jacob Champion for reporting this problem.
> -
> -Security: CVE-2021-23222
> -
> -Upstream-Status: Backport[https://github.com/postgres/postgres/commit/160c0258802d10b0600d7671b1bbea55d8e17d45]
> -CVE: CVE-2021-23222
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - doc/src/sgml/protocol.sgml        | 28 ++++++++++++++++++++++++++++
> - src/interfaces/libpq/fe-connect.c | 26 ++++++++++++++++++++++++++
> - 2 files changed, 54 insertions(+)
> -
> -diff --git a/doc/src/sgml/protocol.sgml b/doc/src/sgml/protocol.sgml
> -index e26619e1b5..b692648fca 100644
> ---- a/doc/src/sgml/protocol.sgml
> -+++ b/doc/src/sgml/protocol.sgml
> -@@ -1471,6 +1471,20 @@ SELCT 1/0;<!-- this typo is intentional -->
> -     and proceed without requesting <acronym>SSL</acronym>.
> -    </para>
> - 
> -+   <para>
> -+    When <acronym>SSL</acronym> encryption can be performed, the server
> -+    is expected to send only the single <literal>S</literal> byte and then
> -+    wait for the frontend to initiate an <acronym>SSL</acronym> handshake.
> -+    If additional bytes are available to read at this point, it likely
> -+    means that a man-in-the-middle is attempting to perform a
> -+    buffer-stuffing attack
> -+    (<ulink url="https://www.postgresql.org/support/security/CVE-2021-23222/">CVE-2021-23222</ulink>).
> -+    Frontends should be coded either to read exactly one byte from the
> -+    socket before turning the socket over to their SSL library, or to
> -+    treat it as a protocol violation if they find they have read additional
> -+    bytes.
> -+   </para>
> -+
> -    <para>
> -     An initial SSLRequest can also be used in a connection that is being
> -     opened to send a CancelRequest message.
> -@@ -1532,6 +1546,20 @@ SELCT 1/0;<!-- this typo is intentional -->
> -     encryption.
> -    </para>
> - 
> -+   <para>
> -+    When <acronym>GSSAPI</acronym> encryption can be performed, the server
> -+    is expected to send only the single <literal>G</literal> byte and then
> -+    wait for the frontend to initiate a <acronym>GSSAPI</acronym> handshake.
> -+    If additional bytes are available to read at this point, it likely
> -+    means that a man-in-the-middle is attempting to perform a
> -+    buffer-stuffing attack
> -+    (<ulink url="https://www.postgresql.org/support/security/CVE-2021-23222/">CVE-2021-23222</ulink>).
> -+    Frontends should be coded either to read exactly one byte from the
> -+    socket before turning the socket over to their GSSAPI library, or to
> -+    treat it as a protocol violation if they find they have read additional
> -+    bytes.
> -+   </para>
> -+
> -    <para>
> -     An initial GSSENCRequest can also be used in a connection that is being
> -     opened to send a CancelRequest message.
> -diff --git a/src/interfaces/libpq/fe-connect.c b/src/interfaces/libpq/fe-connect.c
> -index f80f4e98d8..57aee95183 100644
> ---- a/src/interfaces/libpq/fe-connect.c
> -+++ b/src/interfaces/libpq/fe-connect.c
> -@@ -3076,6 +3076,19 @@ keep_going:						/* We will come back to here until there is
> - 				pollres = pqsecure_open_client(conn);
> - 				if (pollres == PGRES_POLLING_OK)
> - 				{
> -+					/*
> -+					 * At this point we should have no data already buffered.
> -+					 * If we do, it was received before we performed the SSL
> -+					 * handshake, so it wasn't encrypted and indeed may have
> -+					 * been injected by a man-in-the-middle.
> -+					 */
> -+					if (conn->inCursor != conn->inEnd)
> -+					{
> -+						appendPQExpBufferStr(&conn->errorMessage,
> -+											 libpq_gettext("received unencrypted data after SSL response\n"));
> -+						goto error_return;
> -+					}
> -+
> - 					/* SSL handshake done, ready to send startup packet */
> - 					conn->status = CONNECTION_MADE;
> - 					return PGRES_POLLING_WRITING;
> -@@ -3175,6 +3188,19 @@ keep_going:						/* We will come back to here until there is
> - 				pollres = pqsecure_open_gss(conn);
> - 				if (pollres == PGRES_POLLING_OK)
> - 				{
> -+					/*
> -+					 * At this point we should have no data already buffered.
> -+					 * If we do, it was received before we performed the GSS
> -+					 * handshake, so it wasn't encrypted and indeed may have
> -+					 * been injected by a man-in-the-middle.
> -+					 */
> -+					if (conn->inCursor != conn->inEnd)
> -+					{
> -+						appendPQExpBufferStr(&conn->errorMessage,
> -+											 libpq_gettext("received unencrypted data after GSSAPI encryption response\n"));
> -+						goto error_return;
> -+					}
> -+
> - 					/* All set for startup packet */
> - 					conn->status = CONNECTION_MADE;
> - 					return PGRES_POLLING_WRITING;
> --- 
> -2.17.1
> -
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_13.5.bb
> similarity index 67%
> rename from meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
> rename to meta-oe/recipes-dbs/postgresql/postgresql_13.5.bb
> index 2ed0fa49b..81193e30e 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql_13.5.bb
> @@ -7,8 +7,6 @@ SRC_URI += "\
>     file://0001-Add-support-for-RISC-V.patch \
>     file://0001-Improve-reproducibility.patch \
>     file://0001-configure.in-bypass-autoconf-2.69-version-check.patch \
> -   file://CVE-2021-23214.patch \
> -   file://CVE-2021-23222.patch \
>  "
>  
> -SRC_URI[sha256sum] = "ea93e10390245f1ce461a54eb5f99a48d8cabd3a08ce4d652ec2169a357bc0cd"
> +SRC_URI[sha256sum] = "9b81067a55edbaabc418aacef457dd8477642827499560b00615a6ea6c13f6b3"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94874): https://lists.openembedded.org/g/openembedded-devel/message/94874
> Mute This Topic: https://lists.openembedded.org/mt/88452186/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


