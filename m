Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AD4C433F5
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 21:25:17 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.12758.1642281916214218471
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 13:25:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.178.232, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2FEF4200005;
	Sat, 15 Jan 2022 21:25:12 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][PATCH] postgresql: Update to 14.1
Date: Sat, 15 Jan 2022 13:24:49 -0800
Message-Id: <20220115212449.956598-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 21:25:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94873

Refresh patches, since upstream moved from configure.in to configure.ac.
Remove CVE backports that no longer apply to the new version.

Update SRC_URI to use https. Upstream redirects http to https anyway.

Rework PACKAGECONFIG:
 * Reorder PACKAGECONFIG to be the same as the `./configure --help` output
   to make future updates easier.
 * Move zlib to a PACKAGECONFIG. Upstream enables it by default, so keep it
   enabled to preserve existing behavior.
 * Add PACKAGECONFIGs for ldap, systemd, gssapi, xslt, and lz4
 * Update openssl to use `--with-ssl=openssl` because the `--with-openssl`
   form is deprecated.
 * Remove the nls config because gettext.bbclass already appends the
   desired option to EXTRA_OECONF based on the value of USE_NLS.

Enable spinlocks on aarch64. Support was added in version 9.2.5 and
should provide much better performance.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../files/0001-Add-support-for-RISC-V.patch   |  13 +-
 .../files/0001-Improve-reproducibility.patch  |   9 +-
 ...-bypass-autoconf-2.69-version-check.patch} |  22 +--
 .../postgresql/files/CVE-2021-23214.patch     | 116 ----------------
 .../postgresql/files/CVE-2021-23222.patch     | 131 ------------------
 .../postgresql/files/not-check-libperl.patch  |  17 ++-
 meta-oe/recipes-dbs/postgresql/postgresql.inc |  29 ++--
 ...{postgresql_13.4.bb => postgresql_14.1.bb} |   6 +-
 8 files changed, 57 insertions(+), 286 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/files/{0001-configure.in-bypass-autoconf-2.69-version-check.patch => 0001-configure.ac-bypass-autoconf-2.69-version-check.patch} (60%)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_13.4.bb => postgresql_14.1.bb} (53%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
index 0dc6ece6d..90b741949 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
@@ -1,4 +1,4 @@
-From b06a228a5fd1589fc9bed654b3288b321fc21aa1 Mon Sep 17 00:00:00 2001
+From 780fd27ea6f7f2c446c46a7a5e26d94106c67efd Mon Sep 17 00:00:00 2001
 From: "Richard W.M. Jones" <rjones@redhat.com>
 Date: Sun, 20 Nov 2016 15:04:52 +0000
 Subject: [PATCH] Add support for RISC-V.
@@ -9,9 +9,11 @@ extending the existing aarch64 macro works.
  src/include/storage/s_lock.h | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
+diff --git a/src/include/storage/s_lock.h b/src/include/storage/s_lock.h
+index dccbd29..ad60429 100644
 --- a/src/include/storage/s_lock.h
 +++ b/src/include/storage/s_lock.h
-@@ -316,11 +316,12 @@ tas(volatile slock_t *lock)
+@@ -317,11 +317,12 @@ tas(volatile slock_t *lock)
  
  /*
   * On ARM and ARM64, we use __sync_lock_test_and_set(int *, int) if available.
@@ -25,7 +27,7 @@ extending the existing aarch64 macro works.
  #ifdef HAVE_GCC__SYNC_INT32_TAS
  #define HAS_TEST_AND_SET
  
-@@ -337,7 +338,7 @@ tas(volatile slock_t *lock)
+@@ -338,7 +339,7 @@ tas(volatile slock_t *lock)
  #define S_UNLOCK(lock) __sync_lock_release(lock)
  
  #endif	 /* HAVE_GCC__SYNC_INT32_TAS */
@@ -33,4 +35,7 @@ extending the existing aarch64 macro works.
 +#endif	 /* __arm__ || __arm || __aarch64__ || __aarch64 || __riscv */
  
  
- /* S/390 and S/390x Linux (32- and 64-bit zSeries) */
+ /*
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch
index e9bc6240d..02f4c9e51 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch
@@ -1,4 +1,4 @@
-From 71fbee3888ee889a269eded5585ed7591bcbe9dd Mon Sep 17 00:00:00 2001
+From bbba8a5261a99e79c9cd4693ef56021014a9856b Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 28 Dec 2020 16:38:21 +0800
 Subject: [PATCH] Improve reproducibility,
@@ -22,9 +22,11 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  src/common/Makefile | 3 ---
  1 file changed, 3 deletions(-)
 
+diff --git a/src/common/Makefile b/src/common/Makefile
+index 880722f..7a9b9d4 100644
 --- a/src/common/Makefile
 +++ b/src/common/Makefile
-@@ -31,9 +31,6 @@ include $(top_builddir)/src/Makefile.glo
+@@ -31,9 +31,6 @@ include $(top_builddir)/src/Makefile.global
  # don't include subdirectory-path-dependent -I and -L switches
  STD_CPPFLAGS := $(filter-out -I$(top_srcdir)/src/include -I$(top_builddir)/src/include,$(CPPFLAGS))
  STD_LDFLAGS := $(filter-out -L$(top_builddir)/src/common -L$(top_builddir)/src/port,$(LDFLAGS))
@@ -34,3 +36,6 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  override CPPFLAGS += -DVAL_CFLAGS_SL="\"$(CFLAGS_SL)\""
  override CPPFLAGS += -DVAL_LDFLAGS="\"$(STD_LDFLAGS)\""
  override CPPFLAGS += -DVAL_LDFLAGS_EX="\"$(LDFLAGS_EX)\""
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
similarity index 60%
rename from meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
rename to meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index db9769f82..3d969cc7e 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,7 +1,7 @@
-From eba2c940afcd83521f591ccf6b49eca06908ea8e Mon Sep 17 00:00:00 2001
+From 053e8fc51bd9688100ce284a9c7afab88656386f Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
-Subject: [PATCH] configure.in: bypass autoconf 2.69 version check
+Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
 
 for upgrade to autoconf 2.71
 
@@ -9,24 +9,24 @@ Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
- configure.in | 4 ----
+ configure.ac | 4 ----
  1 file changed, 4 deletions(-)
 
-diff --git a/configure.in b/configure.in
-index fb14dcc..a2b4a4f 100644
---- a/configure.in
-+++ b/configure.in
+diff --git a/configure.ac b/configure.ac
+index 7170f26..daf85b9 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [13.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.1], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
--recommended.  You can remove the check from 'configure.in' but it is then
+-recommended.  You can remove the check from 'configure.ac' but it is then
 -your responsibility whether the result works or not.])])
- AC_COPYRIGHT([Copyright (c) 1996-2020, PostgreSQL Global Development Group])
+ AC_COPYRIGHT([Copyright (c) 1996-2021, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
 -- 
-2.17.1
+2.34.1
 
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch
deleted file mode 100644
index 58bf81062..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 24c2b9e42edb6d2f4ef2cead3b0aa1d6196adfce Mon Sep 17 00:00:00 2001
-From: Tom Lane <tgl@sss.pgh.pa.us>
-Date: Mon, 8 Nov 2021 11:01:43 -0500
-Subject: [PATCH 2/2] Reject extraneous data after SSL or GSS encryption
- handshake.
-
-The server collects up to a bufferload of data whenever it reads data
-from the client socket.  When SSL or GSS encryption is requested
-during startup, any additional data received with the initial
-request message remained in the buffer, and would be treated as
-already-decrypted data once the encryption handshake completed.
-Thus, a man-in-the-middle with the ability to inject data into the 
-TCP connection could stuff some cleartext data into the start of
-a supposedly encryption-protected database session.
-
-This could be abused to send faked SQL commands to the server,
-although that would only work if the server did not demand any 
-authentication data.  (However, a server relying on SSL certificate
-authentication might well not do so.)
-
-To fix, throw a protocol-violation error if the internal buffer
-is not empty after the encryption handshake.
-
-Our thanks to Jacob Champion for reporting this problem.
-
-Security: CVE-2021-23214
-
-Upstream-Status: Backport[https://github.com/postgres/postgres/commit/28e24125541545483093819efae9bca603441951]
-CVE: CVE-2021-23214
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- src/backend/libpq/pqcomm.c          | 11 +++++++++++
- src/backend/postmaster/postmaster.c | 23 ++++++++++++++++++++++-
- src/include/libpq/libpq.h           |  1 +
- 3 files changed, 34 insertions(+), 1 deletion(-)
-
-diff --git a/src/backend/libpq/pqcomm.c b/src/backend/libpq/pqcomm.c
-index ee2cd86..4dd1c02 100644
---- a/src/backend/libpq/pqcomm.c
-+++ b/src/backend/libpq/pqcomm.c
-@@ -1183,6 +1183,17 @@ pq_getstring(StringInfo s)
- 	}
- }
- 
-+/* -------------------------------
-+ *             pq_buffer_has_data              - is any buffered data available to read?
-+ *
-+ * This will *not* attempt to read more data.
-+ * --------------------------------
-+ */
-+bool
-+pq_buffer_has_data(void)
-+{
-+	return (PqRecvPointer < PqRecvLength);
-+}
- 
- /* --------------------------------
-  *		pq_startmsgread - begin reading a message from the client.
-diff --git a/src/backend/postmaster/postmaster.c b/src/backend/postmaster/postmaster.c
-index 5775fc0..1fcc3f8 100644
---- a/src/backend/postmaster/postmaster.c
-+++ b/src/backend/postmaster/postmaster.c
-@@ -2049,6 +2049,17 @@ retry1:
- 			return STATUS_ERROR;
- #endif
- 
-+		/*
-+		* At this point we should have no data already buffered.  If we do,
-+		* it was received before we performed the SSL handshake, so it wasn't
-+		* encrypted and indeed may have been injected by a man-in-the-middle.
-+		* We report this case to the client.
-+		*/
-+		if (pq_buffer_has_data())
-+			ereport(FATAL,
-+				(errcode(ERRCODE_PROTOCOL_VIOLATION),
-+				errmsg("received unencrypted data after SSL request"),
-+				errdetail("This could be either a client-software bug or evidence of an attempted man-in-the-middle attack.")));
- 		/*
- 		 * regular startup packet, cancel, etc packet should follow, but not
- 		 * another SSL negotiation request, and a GSS request should only
-@@ -2080,7 +2091,17 @@ retry1:
- 		if (GSSok == 'G' && secure_open_gssapi(port) == -1)
- 			return STATUS_ERROR;
- #endif
--
-+		/*
-+		* At this point we should have no data already buffered.  If we do,
-+		* it was received before we performed the GSS handshake, so it wasn't
-+		* encrypted and indeed may have been injected by a man-in-the-middle.
-+		* We report this case to the client.
-+		*/
-+		if (pq_buffer_has_data())
-+			ereport(FATAL,
-+				(errcode(ERRCODE_PROTOCOL_VIOLATION),
-+				errmsg("received unencrypted data after GSSAPI encryption request"),
-+				errdetail("This could be either a client-software bug or evidence of an attempted man-in-the-middle attack.")));
- 		/*
- 		 * regular startup packet, cancel, etc packet should follow, but not
- 		 * another GSS negotiation request, and an SSL request should only
-diff --git a/src/include/libpq/libpq.h b/src/include/libpq/libpq.h
-index b115247..9969692 100644
---- a/src/include/libpq/libpq.h
-+++ b/src/include/libpq/libpq.h
-@@ -73,6 +73,7 @@ extern int	pq_getbyte(void);
- extern int	pq_peekbyte(void);
- extern int	pq_getbyte_if_available(unsigned char *c);
- extern int	pq_putbytes(const char *s, size_t len);
-+extern bool pq_buffer_has_data(void);
- 
- /*
-  * prototypes for functions in be-secure.c
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch
deleted file mode 100644
index 42b78539b..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From 79125ead2a6a234086844bb42f06d49603fe6ca0 Mon Sep 17 00:00:00 2001
-From: Tom Lane <tgl@sss.pgh.pa.us>
-Date: Mon, 8 Nov 2021 11:14:56 -0500
-Subject: [PATCH 1/2] libpq: reject extraneous data after SSL or GSS encryption
- handshake.
-
-libpq collects up to a bufferload of data whenever it reads data from
-the socket.  When SSL or GSS encryption is requested during startup,
-any additional data received with the server's yes-or-no reply
-remained in the buffer, and would be treated as already-decrypted data
-once the encryption handshake completed.  Thus, a man-in-the-middle
-with the ability to inject data into the TCP connection could stuff
-some cleartext data into the start of a supposedly encryption-protected
-database session.
-
-This could probably be abused to inject faked responses to the
-client's first few queries, although other details of libpq's behavior
-make that harder than it sounds.  A different line of attack is to
-exfiltrate the client's password, or other sensitive data that might
-be sent early in the session.  That has been shown to be possible with
-a server vulnerable to CVE-2021-23214.
-
-To fix, throw a protocol-violation error if the internal buffer
-is not empty after the encryption handshake.
-
-Our thanks to Jacob Champion for reporting this problem.
-
-Security: CVE-2021-23222
-
-Upstream-Status: Backport[https://github.com/postgres/postgres/commit/160c0258802d10b0600d7671b1bbea55d8e17d45]
-CVE: CVE-2021-23222
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- doc/src/sgml/protocol.sgml        | 28 ++++++++++++++++++++++++++++
- src/interfaces/libpq/fe-connect.c | 26 ++++++++++++++++++++++++++
- 2 files changed, 54 insertions(+)
-
-diff --git a/doc/src/sgml/protocol.sgml b/doc/src/sgml/protocol.sgml
-index e26619e1b5..b692648fca 100644
---- a/doc/src/sgml/protocol.sgml
-+++ b/doc/src/sgml/protocol.sgml
-@@ -1471,6 +1471,20 @@ SELCT 1/0;<!-- this typo is intentional -->
-     and proceed without requesting <acronym>SSL</acronym>.
-    </para>
- 
-+   <para>
-+    When <acronym>SSL</acronym> encryption can be performed, the server
-+    is expected to send only the single <literal>S</literal> byte and then
-+    wait for the frontend to initiate an <acronym>SSL</acronym> handshake.
-+    If additional bytes are available to read at this point, it likely
-+    means that a man-in-the-middle is attempting to perform a
-+    buffer-stuffing attack
-+    (<ulink url="https://www.postgresql.org/support/security/CVE-2021-23222/">CVE-2021-23222</ulink>).
-+    Frontends should be coded either to read exactly one byte from the
-+    socket before turning the socket over to their SSL library, or to
-+    treat it as a protocol violation if they find they have read additional
-+    bytes.
-+   </para>
-+
-    <para>
-     An initial SSLRequest can also be used in a connection that is being
-     opened to send a CancelRequest message.
-@@ -1532,6 +1546,20 @@ SELCT 1/0;<!-- this typo is intentional -->
-     encryption.
-    </para>
- 
-+   <para>
-+    When <acronym>GSSAPI</acronym> encryption can be performed, the server
-+    is expected to send only the single <literal>G</literal> byte and then
-+    wait for the frontend to initiate a <acronym>GSSAPI</acronym> handshake.
-+    If additional bytes are available to read at this point, it likely
-+    means that a man-in-the-middle is attempting to perform a
-+    buffer-stuffing attack
-+    (<ulink url="https://www.postgresql.org/support/security/CVE-2021-23222/">CVE-2021-23222</ulink>).
-+    Frontends should be coded either to read exactly one byte from the
-+    socket before turning the socket over to their GSSAPI library, or to
-+    treat it as a protocol violation if they find they have read additional
-+    bytes.
-+   </para>
-+
-    <para>
-     An initial GSSENCRequest can also be used in a connection that is being
-     opened to send a CancelRequest message.
-diff --git a/src/interfaces/libpq/fe-connect.c b/src/interfaces/libpq/fe-connect.c
-index f80f4e98d8..57aee95183 100644
---- a/src/interfaces/libpq/fe-connect.c
-+++ b/src/interfaces/libpq/fe-connect.c
-@@ -3076,6 +3076,19 @@ keep_going:						/* We will come back to here until there is
- 				pollres = pqsecure_open_client(conn);
- 				if (pollres == PGRES_POLLING_OK)
- 				{
-+					/*
-+					 * At this point we should have no data already buffered.
-+					 * If we do, it was received before we performed the SSL
-+					 * handshake, so it wasn't encrypted and indeed may have
-+					 * been injected by a man-in-the-middle.
-+					 */
-+					if (conn->inCursor != conn->inEnd)
-+					{
-+						appendPQExpBufferStr(&conn->errorMessage,
-+											 libpq_gettext("received unencrypted data after SSL response\n"));
-+						goto error_return;
-+					}
-+
- 					/* SSL handshake done, ready to send startup packet */
- 					conn->status = CONNECTION_MADE;
- 					return PGRES_POLLING_WRITING;
-@@ -3175,6 +3188,19 @@ keep_going:						/* We will come back to here until there is
- 				pollres = pqsecure_open_gss(conn);
- 				if (pollres == PGRES_POLLING_OK)
- 				{
-+					/*
-+					 * At this point we should have no data already buffered.
-+					 * If we do, it was received before we performed the GSS
-+					 * handshake, so it wasn't encrypted and indeed may have
-+					 * been injected by a man-in-the-middle.
-+					 */
-+					if (conn->inCursor != conn->inEnd)
-+					{
-+						appendPQExpBufferStr(&conn->errorMessage,
-+											 libpq_gettext("received unencrypted data after GSSAPI encryption response\n"));
-+						goto error_return;
-+					}
-+
- 					/* All set for startup packet */
- 					conn->status = CONNECTION_MADE;
- 					return PGRES_POLLING_WRITING;
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
index ba2ee29f0..fa46912ee 100644
--- a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
@@ -1,7 +1,7 @@
-From 7e2af4de19be58bc9d551c41ce2750396d357f34 Mon Sep 17 00:00:00 2001
+From 56b830edecff1cac5f8a8a956e7a7eeef2aa7c17 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 27 Nov 2018 13:25:15 +0800
-Subject: [PATCH] PATCH] not check libperl under cross compiling
+Subject: [PATCH] not check libperl under cross compiling
 
 Upstream-Status: Inappropriate [configuration]
 
@@ -16,12 +16,14 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
 update patch to version 11.1
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- configure.in | 2 +-
+ configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
---- a/configure.in
-+++ b/configure.in
-@@ -2206,7 +2206,7 @@ Use --without-tcl to disable building PL
+diff --git a/configure.ac b/configure.ac
+index fba79ee..7170f26 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2261,7 +2261,7 @@ Use --without-tcl to disable building PL/Tcl.])
  fi
  
  # check for <perl.h>
@@ -30,3 +32,6 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
    ac_save_CPPFLAGS=$CPPFLAGS
    CPPFLAGS="$CPPFLAGS $perl_includespec"
    AC_CHECK_HEADER(perl.h, [], [AC_MSG_ERROR([header file <perl.h> is required for Perl])],
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index e609ac33e..257d27b11 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -19,11 +19,11 @@ DESCRIPTION = "\
 "
 HOMEPAGE = "http://www.postgresql.com"
 LICENSE = "BSD-0-Clause"
-DEPENDS = "libnsl2 zlib readline tzcode-native"
+DEPENDS = "libnsl2 readline tzcode-native"
 
 ARM_INSTRUCTION_SET = "arm"
 
-SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
+SRC_URI = "https://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
     file://postgresql.init \
     file://postgresql-profile \
     file://postgresql.pam \
@@ -43,7 +43,6 @@ CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.6"
 SYSTEMD_SERVICE:${PN} = "postgresql.service"
 SYSTEMD_AUTO_ENABLE:${PN} = "disable"
 
-DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-systemctl-native', '', d)}"
 pkg_postinst:${PN} () {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd sysvinit', 'true', 'false', d)}; then
         if [ -n "$D" ]; then
@@ -53,23 +52,29 @@ pkg_postinst:${PN} () {
     fi
 }
 
-enable_pam = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
-PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
-PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
-PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl ac_cv_file__dev_urandom=yes,openssl,"
-PACKAGECONFIG[python] = "--with-python,--without-python,python3,python3"
-PACKAGECONFIG[uuid] = "--with-uuid=e2fs,--without-uuid,util-linux,"
+PACKAGECONFIG ??= " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)} \
+    openssl python uuid libxml tcl perl zlib \
+"
 PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl tcl-native,"
-PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
-PACKAGECONFIG[libxml] = "--with-libxml,--without-libxml,libxml2,libxml2"
 PACKAGECONFIG[perl] = "--with-perl,--without-perl,perl,perl"
+PACKAGECONFIG[python] = "--with-python,--without-python,python3,python3"
+PACKAGECONFIG[gssapi] = "--with-gssapi,--without-gssapi,krb5"
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
+PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
+PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd systemd-systemctl-native"
+PACKAGECONFIG[uuid] = "--with-uuid=e2fs,--without-uuid,util-linux"
+PACKAGECONFIG[libxml] = "--with-libxml,--without-libxml,libxml2,libxml2"
+PACKAGECONFIG[libxslt] = "--with-libxslt,--without-libxslt,libxslt"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
+PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4"
+PACKAGECONFIG[openssl] = "--with-ssl=openssl,ac_cv_file__dev_urandom=yes,openssl"
 
 EXTRA_OECONF += "--enable-thread-safety --disable-rpath \
     --datadir=${datadir}/${BPN} \
     --sysconfdir=${sysconfdir}/${BPN} \
 "
 EXTRA_OECONF:sh4 += "--disable-spinlocks"
-EXTRA_OECONF:aarch64 += "--disable-spinlocks"
 
 DEBUG_OPTIMIZATION:remove:mips = " -Og"
 DEBUG_OPTIMIZATION:append:mips = " -O"
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.1.bb
similarity index 53%
rename from meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.1.bb
index 2ed0fa49b..1112cc21d 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.1.bb
@@ -6,9 +6,7 @@ SRC_URI += "\
    file://not-check-libperl.patch \
    file://0001-Add-support-for-RISC-V.patch \
    file://0001-Improve-reproducibility.patch \
-   file://0001-configure.in-bypass-autoconf-2.69-version-check.patch \
-   file://CVE-2021-23214.patch \
-   file://CVE-2021-23222.patch \
+   file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
 "
 
-SRC_URI[sha256sum] = "ea93e10390245f1ce461a54eb5f99a48d8cabd3a08ce4d652ec2169a357bc0cd"
+SRC_URI[sha256sum] = "4d3c101ea7ae38982f06bdc73758b53727fb6402ecd9382006fa5ecc7c2ca41f"
-- 
2.34.1


