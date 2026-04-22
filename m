Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707ACF9B612
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 10:38:48 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79531.1776854323319729354
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 03:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XgMCbz8o;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=41375; q=dns/txt;
  s=iport01; t=1776854323; x=1778063923;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N6be0CBXkuWHO9Ztspz4NnGTacjsK/Ys+WfdZeg5DDc=;
  b=XgMCbz8ou82dT2QeeJyMPzkHoqw2I3GK3tSV3kYVz4pP4MKQELx4faA7
   jXYcttplaEZEjPeQ6rZr3TsNSyOaLPu+Bj8qviG5WwGXqW6u4mkXBloia
   TkUJneq+zUpU4Du1O364p6r1kVy0KxjFZ6Z7dGYdNh3L9HNTjLXI/0rEu
   bbFGsBWhZXOBSffa8KKJJ/Hwe0HXoZ9dF74g1nJRQA3GUR5NpwpSEYLBv
   krxZKOuBSwNnpYK2BxyRIECc3GHs+jLI1Vjmx4Rm/yd70ypMIb7KoWxd6
   6fqOMUNkQAsSDhL/aGV7Xr7OWiv39UwF3L4WS+dfoGCVSyN4d61ei9nRV
   A==;
X-CSE-ConnectionGUID: 4XKRN1EWQUik0WzIAoTe9Q==
X-CSE-MsgGUID: iH8cBf1YToW+UhPjzL2r8w==
X-IPAS-Result: =?us-ascii?q?A0B9AwAYpOhp/5L/Ja1agjQQGoJTcV9CSZQqgiGBFopRk?=
 =?us-ascii?q?jaBfw8BAQEPRA0EAQGFBgKNLAImNgcOAQIEAQEBAQMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NhloBIAEMCwEYAVkDAQJPCyMhHoJkAYI6AzYCA?=
 =?us-ascii?q?RGzK4F5M4EBgygBgVOyKQ0MgkYBCxQBgTiFP4J5hSNbGYNbgR8nGxuBcoEUA?=
 =?us-ascii?q?YE7gTcHb4IfQgKBSD6GHgSCIoEOgWAeIgaCTYIwgQCGX0iBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBDBsHBYFLhBltaoELgzCBOTUDCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB4ohIBCBOAJwAQE8RwoBKgFqBxQMDy0DARQdAhwdCy+SRiQCAQcKkAqCI?=
 =?us-ascii?q?aAdcQoog3SMHo8+hXwaM6prmQaOCYQJkhA3hGiBbwUwRoETcBU7gmcJShkPj?=
 =?us-ascii?q?iwBFhyDQ2rFViM1AgEIMgIHAgcNAwuTZQEB?=
IronPort-Data: A9a23:s2LiNaP8MjJyncvvrR3ilsFynXyQoLVcMsEvi/4bfWQNrUolhjxVx
 mEZWDiHb/yLM2T8Kt91aNjlo05V65OBm4NlG3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmA9knF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVjlV
 e/a+ZWFZgf5gWcsaQr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQrl58R7PSq
 07rldlVz0uBl/sfIorNfoXTLiXmdoXv0T2m0RK6bUQNbi9q/UTe2o5jXBYVhNw+Zz+hx7idw
 /0V3XC8pJtA0qDkwIwgvxdk/y5WYZ1lwpmeDEeGjM2Ql3LUUlLr//g/NRRjVWEY0r4f7WBm7
 /cULnUJKxuEne/zmOP9Qeh3jcNlJ87uVG8dkig/lneCUrB8HM2FGvmUjTNb9G9YasRmEfvTf
 cMFaT1HZxXbaBoJMVASYH47tLjz1ymgI2EC9Dp5o4I2wzjY5gIo4YTqD5noeuSIV+EPhBaH8
 zeuE2PRR0ty2Mak4T2d/3Shg+XCkS/2VMceGaO18tZugUaP3SoUEBAQWF6xrPW1h0L4XMhQQ
 3H44QI0pqQ0sUjuRd7nUljg8TiPvwUXXJxbFOhSBByx95c4Kj2xXgAsJgOtovR83CPqbVTGD
 mO0ou4=
IronPort-HdrOrdr: A9a23:+Ilza6+t+ZhBE5/4P9Juk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: 9a23:lRLAPmGtDgu4lI6oqmI7xG0uPJkITUTgzXSIHF2ZIGFVReysHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AAmNf6Qzxf84x6IZ/6MoGOlg/RPSaqKWOWEsnn8w?=
 =?us-ascii?q?3h867dhFwAzWPqG6tEpByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,192,1770595200"; 
   d="scan'208";a="739878424"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Apr 2026 10:38:41 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 86B441800058E
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 10:38:41 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 2E735CC12B5; Wed, 22 Apr 2026 03:38:41 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH] krb5: Backport additional fixes to build on clang
Date: Wed, 22 Apr 2026 03:38:27 -0700
Message-Id: <20260422103827.3603144-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 10:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126546

From: Khem Raj <raj.khem@gmail.com>

Enabling additional warning tightens the function prototype checks
and clang goes a step ahead to flag void foo() as well it should be
void foo(void)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
(cherry picked from commit 37cc472e44ef5b2b8c0ae8b5bcebf875fa9dd5be)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-Fix-more-non-prototype-functions.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-Fix-more-non-prototype-functions.patch
new file mode 100644
index 0000000000..d4267b3bf7
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/0001-Fix-more-non-prototype-functions.patch
@@ -0,0 +1,862 @@
+From 5a9aa1607ff2bc94369c89f4c99725125b923977 Mon Sep 17 00:00:00 2001
+From: Arjun <pkillarjun@protonmail.com>
+Date: Thu, 9 May 2024 20:47:08 +0530
+Subject: [PATCH 1/2] Fix more non-prototype functions
+
+Add "void" designations to more function declarations and definitions
+not changed by commits 3ae9244cd021a75eba909d872a92c25db490714d and
+4b9d7f7c107f01a61600fddcd8cde3812d0366a2.
+
+[ghudson@mit.edu: change additional functions; split into two commits;
+rewrote commit message]
+
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/623d649ba852839ba4822934bad9f97c184bf3ab]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ccapi/common/win/OldCC/ccutils.c          |  2 +-
+ src/ccapi/common/win/OldCC/ccutils.h          |  2 +-
+ src/ccapi/common/win/OldCC/util.h             |  2 +-
+ src/ccapi/common/win/win-utils.c              |  2 +-
+ src/ccapi/common/win/win-utils.h              |  4 +-
+ src/ccapi/lib/ccapi_context.h                 |  2 +-
+ src/ccapi/lib/win/dllmain.h                   |  2 +-
+ src/ccapi/server/ccs_server.c                 |  2 +-
+ src/ccapi/server/ccs_server.h                 |  2 +-
+ src/ccapi/server/win/WorkQueue.h              |  8 +--
+ src/ccapi/test/pingtest.c                     |  2 +-
+ src/include/gssrpc/netdb.h                    |  4 +-
+ src/include/port-sockets.h                    |  2 +-
+ src/kadmin/cli/getdate.y                      |  2 +-
+ src/kadmin/dbutil/kdb5_util.c                 |  2 +-
+ src/kprop/kprop.c                             |  2 +-
+ src/lib/crypto/crypto_tests/t_pkcs5.c         |  4 +-
+ src/lib/crypto/crypto_tests/vectors.c         | 10 ++--
+ src/lib/gssapi/generic/maptest.c              |  2 +-
+ src/lib/krb5/ccache/ccapi/stdcc.c             |  6 +-
+ src/lib/krb5/ccache/ccapi/winccld.c           |  9 ++-
+ src/lib/krb5/ccache/ccbase.c                  |  2 +-
+ src/lib/krb5/krb/bld_princ.c                  |  4 +-
+ src/lib/krb5/krb/conv_creds.c                 |  2 +-
+ src/lib/krb5/krb/init_ctx.c                   |  2 +-
+ src/lib/krb5/os/dnsglue.c                     |  4 +-
+ src/lib/krb5/os/localaddr.c                   |  6 +-
+ src/lib/rpc/getrpcent.c                       |  6 +-
+ src/lib/win_glue.c                            |  8 +--
+ src/plugins/kdb/db2/kdb_db2.c                 |  4 +-
+ src/plugins/kdb/db2/libdb2/hash/dbm.c         |  2 +-
+ .../kdb/ldap/libkdb_ldap/kdb_ldap_conn.c      |  4 +-
+ src/tests/threads/gss-perf.c                  |  4 +-
+ src/tests/threads/init_ctx.c                  |  2 +-
+ src/tests/threads/profread.c                  |  2 +-
+ src/tests/threads/t_rcache.c                  |  2 +-
+ src/util/et/com_err.c                         |  4 +-
+ src/util/et/error_message.c                   |  2 +-
+ src/util/profile/prof_file.c                  |  4 +-
+ src/util/support/secure_getenv.c              |  2 +-
+ src/windows/include/leashwin.h                | 60 +++++++++----------
+ 41 files changed, 100 insertions(+), 99 deletions(-)
+
+diff --git a/src/ccapi/common/win/OldCC/ccutils.c b/src/ccapi/common/win/OldCC/ccutils.c
+index 403c67e..7abaefa 100644
+--- a/src/ccapi/common/win/OldCC/ccutils.c
++++ b/src/ccapi/common/win/OldCC/ccutils.c
+@@ -30,7 +30,7 @@
+ #include "cci_debugging.h"
+ #include "util.h"
+ 
+-BOOL isNT() {
++BOOL isNT(void) {
+     OSVERSIONINFO osvi;
+     DWORD   status              = 0;
+     BOOL    bSupportedVersion   = FALSE;
+diff --git a/src/ccapi/common/win/OldCC/ccutils.h b/src/ccapi/common/win/OldCC/ccutils.h
+index 9da3d87..0fb7e14 100644
+--- a/src/ccapi/common/win/OldCC/ccutils.h
++++ b/src/ccapi/common/win/OldCC/ccutils.h
+@@ -33,7 +33,7 @@ extern "C" {
+ #define REPLY_SUFFIX    (char*)"reply"
+ #define LISTEN_SUFFIX   (char*)"listen"
+ 
+-BOOL    isNT();
++BOOL    isNT(void);
+ char*   allocEventName   (char* uuid, char* suffix);
+ HANDLE  createThreadEvent(char* uuid, char* suffix);
+ HANDLE  openThreadEvent  (char* uuid, char* suffix);
+diff --git a/src/ccapi/common/win/OldCC/util.h b/src/ccapi/common/win/OldCC/util.h
+index 45e069a..7ee5319 100644
+--- a/src/ccapi/common/win/OldCC/util.h
++++ b/src/ccapi/common/win/OldCC/util.h
+@@ -30,7 +30,7 @@
+ extern "C" {
+ #endif
+ 
+-BOOL isNT();
++BOOL isNT(void);
+ 
+ void*
+ user_allocate(
+diff --git a/src/ccapi/common/win/win-utils.c b/src/ccapi/common/win/win-utils.c
+index b49cca8..d9018a6 100644
+--- a/src/ccapi/common/win/win-utils.c
++++ b/src/ccapi/common/win/win-utils.c
+@@ -60,7 +60,7 @@ char* serverEndpoint(const char* user) {
+     return _serverEndpoint;
+     }
+ 
+-char* timestamp() {
++char* timestamp(void) {
+     SYSTEMTIME  _stime;
+     GetSystemTime(&_stime);
+     GetTimeFormat(LOCALE_SYSTEM_DEFAULT, 0, &_stime, "HH:mm:ss", _ts, sizeof(_ts)-1);
+diff --git a/src/ccapi/common/win/win-utils.h b/src/ccapi/common/win/win-utils.h
+index 41cab24..94d0a9f 100644
+--- a/src/ccapi/common/win/win-utils.h
++++ b/src/ccapi/common/win/win-utils.h
+@@ -50,6 +50,6 @@ char*                   clientEndpoint(const char* UUID);
+ char*                   serverEndpoint(const char* UUID);
+ extern unsigned char*   pszProtocolSequence;
+ 
+-char* timestamp();
++char* timestamp(void);
+ 
+-#endif // _win_utils_h
+\ No newline at end of file
++#endif // _win_utils_h
+diff --git a/src/ccapi/lib/ccapi_context.h b/src/ccapi/lib/ccapi_context.h
+index 51b8982..88f0ee8 100644
+--- a/src/ccapi/lib/ccapi_context.h
++++ b/src/ccapi/lib/ccapi_context.h
+@@ -79,7 +79,7 @@ cc_int32 ccapi_context_compare (cc_context_t  in_context,
+                                 cc_uint32    *out_equal);
+ 
+ #ifdef WIN32
+-void cci_thread_init__auxinit();
++void cci_thread_init__auxinit(void);
+ #endif
+ 
+ 
+diff --git a/src/ccapi/lib/win/dllmain.h b/src/ccapi/lib/win/dllmain.h
+index 8238566..28ca34e 100644
+--- a/src/ccapi/lib/win/dllmain.h
++++ b/src/ccapi/lib/win/dllmain.h
+@@ -32,7 +32,7 @@
+ extern "C" {          // we need to export the C interface
+ #endif
+ 
+-DWORD GetTlsIndex();
++DWORD GetTlsIndex(void);
+ 
+ #ifdef __cplusplus
+ }
+diff --git a/src/ccapi/server/ccs_server.c b/src/ccapi/server/ccs_server.c
+index 1fc8d2c..de74b71 100644
+--- a/src/ccapi/server/ccs_server.c
++++ b/src/ccapi/server/ccs_server.c
+@@ -402,7 +402,7 @@ cc_int32 ccs_server_send_reply (ccs_pipe_t     in_reply_pipe,
+ 
+ /* ------------------------------------------------------------------------ */
+ 
+-cc_uint64 ccs_server_client_count ()
++cc_uint64 ccs_server_client_count (void)
+ {
+     return ccs_client_array_count (g_client_array);
+ }
+diff --git a/src/ccapi/server/ccs_server.h b/src/ccapi/server/ccs_server.h
+index e920ad9..f71ab06 100644
+--- a/src/ccapi/server/ccs_server.h
++++ b/src/ccapi/server/ccs_server.h
+@@ -48,6 +48,6 @@ cc_int32 ccs_server_send_reply (ccs_pipe_t     in_reply_pipe,
+                                 cc_int32       in_reply_err,
+                                 k5_ipc_stream   in_reply_data);
+ 
+-cc_uint64 ccs_server_client_count ();
++cc_uint64 ccs_server_client_count (void);
+ 
+ #endif /* CCS_SERVER_H */
+diff --git a/src/ccapi/server/win/WorkQueue.h b/src/ccapi/server/win/WorkQueue.h
+index 68aa8b1..66a2960 100644
+--- a/src/ccapi/server/win/WorkQueue.h
++++ b/src/ccapi/server/win/WorkQueue.h
+@@ -29,14 +29,14 @@
+ #include "windows.h"
+ #include "ccs_pipe.h"
+ 
+-EXTERN_C    int worklist_initialize();
++EXTERN_C    int worklist_initialize(void);
+ 
+-EXTERN_C    int worklist_cleanup();
++EXTERN_C    int worklist_cleanup(void);
+ 
+ /* Wait for work to be added to the list (via worklist_add) from another thread */
+-EXTERN_C    void worklist_wait();
++EXTERN_C    void worklist_wait(void);
+ 
+-EXTERN_C    BOOL worklist_isEmpty();
++EXTERN_C    BOOL worklist_isEmpty(void);
+ 
+ EXTERN_C    int worklist_add(  const long          rpcmsg,
+                                 const ccs_pipe_t    pipe,
+diff --git a/src/ccapi/test/pingtest.c b/src/ccapi/test/pingtest.c
+index 0ffc15e..24327c2 100644
+--- a/src/ccapi/test/pingtest.c
++++ b/src/ccapi/test/pingtest.c
+@@ -23,7 +23,7 @@ extern cc_int32 cci_os_ipc_msg( cc_int32        in_launch_server,
+ 
+ static DWORD    dwTlsIndex;
+ 
+-DWORD GetTlsIndex()    {return dwTlsIndex;}
++DWORD GetTlsIndex(void)    {return dwTlsIndex;}
+ 
+ RPC_STATUS send_test(char* endpoint) {
+     unsigned char*  pszNetworkAddress   = NULL;
+diff --git a/src/include/gssrpc/netdb.h b/src/include/gssrpc/netdb.h
+index f933fbb..2f62edf 100644
+--- a/src/include/gssrpc/netdb.h
++++ b/src/include/gssrpc/netdb.h
+@@ -53,6 +53,8 @@ struct rpcent {
+ };
+ #endif /*STRUCT_RPCENT_IN_RPC_NETDB_H*/
+ 
+-struct rpcent *getrpcbyname(), *getrpcbynumber(), *getrpcent();
++struct rpcent *getrpcbyname(const char *name);
++struct rpcent *getrpcbynumber(int number);
++struct rpcent *getrpcent(void);
+ 
+ #endif
+diff --git a/src/include/port-sockets.h b/src/include/port-sockets.h
+index 57e5d1d..228e4cf 100644
+--- a/src/include/port-sockets.h
++++ b/src/include/port-sockets.h
+@@ -111,7 +111,7 @@ static __inline void TranslatedWSASetLastError(int posix_error)
+  * Translate Winsock errors to their POSIX counterparts.  This is necessary for
+  * MSVC 2010+, where both Winsock and POSIX errors are defined.
+  */
+-static __inline int TranslatedWSAGetLastError()
++static __inline int TranslatedWSAGetLastError(void)
+ {
+     int err = WSAGetLastError();
+     switch (err) {
+diff --git a/src/kadmin/cli/getdate.y b/src/kadmin/cli/getdate.y
+index 3d69f0b..b69e26e 100644
+--- a/src/kadmin/cli/getdate.y
++++ b/src/kadmin/cli/getdate.y
+@@ -775,7 +775,7 @@ LookupWord(char *buff)
+ 
+ 
+ static int
+-yylex()
++yylex(void)
+ {
+     char		c;
+     char		*p;
+diff --git a/src/kadmin/dbutil/kdb5_util.c b/src/kadmin/dbutil/kdb5_util.c
+index 55d529f..3a07fd5 100644
+--- a/src/kadmin/dbutil/kdb5_util.c
++++ b/src/kadmin/dbutil/kdb5_util.c
+@@ -74,7 +74,7 @@ int exit_status = 0;
+ krb5_context util_context;
+ kadm5_config_params global_params;
+ 
+-void usage()
++void usage(void)
+ {
+     fprintf(stderr,
+             _("Usage: kdb5_util [-r realm] [-d dbname] "
+diff --git a/src/kprop/kprop.c b/src/kprop/kprop.c
+index 8f9fd69..e8f7feb 100644
+--- a/src/kprop/kprop.c
++++ b/src/kprop/kprop.c
+@@ -80,7 +80,7 @@ static void send_error(krb5_context context, krb5_creds *my_creds, int fd,
+                        char *err_text, krb5_error_code err_code);
+ static void update_last_prop_file(char *hostname, char *file_name);
+ 
+-static void usage()
++static void usage(void)
+ {
+     fprintf(stderr, _("\nUsage: %s [-r realm] [-f file] [-d] [-P port] "
+                       "[-s keytab] replica_host\n\n"), progname);
+diff --git a/src/lib/crypto/crypto_tests/t_pkcs5.c b/src/lib/crypto/crypto_tests/t_pkcs5.c
+index 8e87a80..f4bb33e 100644
+--- a/src/lib/crypto/crypto_tests/t_pkcs5.c
++++ b/src/lib/crypto/crypto_tests/t_pkcs5.c
+@@ -38,7 +38,7 @@ static void printdata (krb5_data *d) {
+     printhex (d->length, d->data);
+ }
+ 
+-static void test_pbkdf2_rfc3211()
++static void test_pbkdf2_rfc3211(void)
+ {
+     char x[100];
+     krb5_error_code err;
+@@ -92,7 +92,7 @@ static void test_pbkdf2_rfc3211()
+     }
+ }
+ 
+-int main ()
++int main(void)
+ {
+     test_pbkdf2_rfc3211();
+     return 0;
+diff --git a/src/lib/crypto/crypto_tests/vectors.c b/src/lib/crypto/crypto_tests/vectors.c
+index bcf5c91..314d5c7 100644
+--- a/src/lib/crypto/crypto_tests/vectors.c
++++ b/src/lib/crypto/crypto_tests/vectors.c
+@@ -56,7 +56,7 @@ static void printdata (krb5_data *d) { printhex (d->length, d->data); }
+ 
+ static void printkey (krb5_keyblock *k) { printhex (k->length, k->contents); }
+ 
+-static void test_nfold ()
++static void test_nfold (void)
+ {
+     int i;
+     static const struct {
+@@ -96,7 +96,7 @@ static void test_nfold ()
+    so try to generate them. */
+ 
+ static void
+-test_mit_des_s2k ()
++test_mit_des_s2k (void)
+ {
+     static const struct {
+         const char *pass;
+@@ -190,7 +190,7 @@ test_s2k (krb5_enctype enctype)
+     }
+ }
+ 
+-static void test_des3_s2k () { test_s2k (ENCTYPE_DES3_CBC_SHA1); }
++static void test_des3_s2k (void) { test_s2k (ENCTYPE_DES3_CBC_SHA1); }
+ 
+ static void
+ keyToData (krb5_keyblock *k, krb5_data *d)
+@@ -227,7 +227,7 @@ void DR (krb5_data *out, krb5_keyblock *in, const krb5_data *usage) {
+ #define KEYBYTES  21
+ #define KEYLENGTH 24
+ 
+-void test_dr_dk ()
++void test_dr_dk (void)
+ {
+     static const struct {
+         unsigned char keydata[KEYLENGTH];
+@@ -371,7 +371,7 @@ static void printk(const char *descr, krb5_keyblock *k) {
+ 
+ 
+ static void
+-test_pbkdf2()
++test_pbkdf2(void)
+ {
+     static struct {
+         int count;
+diff --git a/src/lib/gssapi/generic/maptest.c b/src/lib/gssapi/generic/maptest.c
+index 566d88c..ab3ed90 100644
+--- a/src/lib/gssapi/generic/maptest.c
++++ b/src/lib/gssapi/generic/maptest.c
+@@ -42,7 +42,7 @@ static void intprt(int v, FILE *f)
+ 
+ foo foo1;
+ 
+-int main ()
++int main (void)
+ {
+     elt v1 = { 1, 2 }, v2 = { 3, 4 };
+     const elt *vp;
+diff --git a/src/lib/krb5/ccache/ccapi/stdcc.c b/src/lib/krb5/ccache/ccapi/stdcc.c
+index 427b329..9cd2ad3 100644
+--- a/src/lib/krb5/ccache/ccapi/stdcc.c
++++ b/src/lib/krb5/ccache/ccapi/stdcc.c
+@@ -101,7 +101,7 @@ krb5_cc_ops krb5_cc_stdcc_ops = {
+  * changes made.  We register a unique message type with which
+  * we'll communicate to all other processes.
+  */
+-static void cache_changed()
++static void cache_changed(void)
+ {
+     static unsigned int message = 0;
+ 
+@@ -112,7 +112,7 @@ static void cache_changed()
+ }
+ #else /* _WIN32 */
+ 
+-static void cache_changed()
++static void cache_changed(void)
+ {
+     return;
+ }
+@@ -242,7 +242,7 @@ static krb5_error_code stdccv3_setup (krb5_context context,
+ }
+ 
+ /* krb5_stdcc_shutdown is exported; use the old name */
+-void krb5_stdcc_shutdown()
++void krb5_stdcc_shutdown(void)
+ {
+     if (gCntrlBlock) { cc_context_release(gCntrlBlock); }
+     gCntrlBlock = NULL;
+diff --git a/src/lib/krb5/ccache/ccapi/winccld.c b/src/lib/krb5/ccache/ccapi/winccld.c
+index 8b2e90c..62b1bd7 100644
+--- a/src/lib/krb5/ccache/ccapi/winccld.c
++++ b/src/lib/krb5/ccache/ccapi/winccld.c
+@@ -18,8 +18,8 @@ extern const krb5_cc_ops krb5_fcc_ops;
+ 
+ static int krb5_win_ccdll_loaded = 0;
+ 
+-extern void krb5_win_ccdll_load();
+-extern int krb5_is_ccdll_loaded();
++extern void krb5_win_ccdll_load(krb5_context context);
++extern int krb5_is_ccdll_loaded(void);
+ 
+ /*
+  * return codes
+@@ -81,8 +81,7 @@ static int LoadFuncs(const char* dll_name, FUNC_INFO fi[],
+     return LF_OK;
+ }
+ 
+-void krb5_win_ccdll_load(context)
+-    krb5_context    context;
++void krb5_win_ccdll_load(krb5_context context)
+ {
+     krb5_cc_register(context, &krb5_fcc_ops, 0);
+     if (krb5_win_ccdll_loaded)
+@@ -93,7 +92,7 @@ void krb5_win_ccdll_load(context)
+     krb5_cc_dfl_ops = &krb5_cc_stdcc_ops; /* Use stdcc! */
+ }
+ 
+-int krb5_is_ccdll_loaded()
++int krb5_is_ccdll_loaded(void)
+ {
+     return krb5_win_ccdll_loaded;
+ }
+diff --git a/src/lib/krb5/ccache/ccbase.c b/src/lib/krb5/ccache/ccbase.c
+index 5a01320..696b681 100644
+--- a/src/lib/krb5/ccache/ccbase.c
++++ b/src/lib/krb5/ccache/ccbase.c
+@@ -614,7 +614,7 @@ k5_cccol_unlock(krb5_context context)
+ 
+ /* necessary to make reentrant locks play nice with krb5int_cc_finalize */
+ void
+-k5_cccol_force_unlock()
++k5_cccol_force_unlock(void)
+ {
+     /* sanity check */
+     if ((&cccol_lock)->refcount == 0) {
+diff --git a/src/lib/krb5/krb/bld_princ.c b/src/lib/krb5/krb/bld_princ.c
+index ff8265a..701454f 100644
+--- a/src/lib/krb5/krb/bld_princ.c
++++ b/src/lib/krb5/krb/bld_princ.c
+@@ -170,13 +170,13 @@ const krb5_principal_data anon_princ = {
+ };
+ 
+ const krb5_data * KRB5_CALLCONV
+-krb5_anonymous_realm()
++krb5_anonymous_realm(void)
+ {
+     return &anon_realm_data;
+ }
+ 
+ krb5_const_principal KRB5_CALLCONV
+-krb5_anonymous_principal()
++krb5_anonymous_principal(void)
+ {
+     return &anon_princ;
+ }
+diff --git a/src/lib/krb5/krb/conv_creds.c b/src/lib/krb5/krb/conv_creds.c
+index 6f46088..8d0a317 100644
+--- a/src/lib/krb5/krb/conv_creds.c
++++ b/src/lib/krb5/krb/conv_creds.c
+@@ -55,7 +55,7 @@ krb524_convert_creds_kdc(krb5_context context, krb5_creds *v5creds,
+     return KRB524_KRB4_DISABLED;
+ }
+ 
+-void KRB5_CALLCONV krb524_init_ets ()
++void KRB5_CALLCONV krb524_init_ets (void)
+ {
+ }
+ #endif
+diff --git a/src/lib/krb5/krb/init_ctx.c b/src/lib/krb5/krb/init_ctx.c
+index a6c2bbe..8fd9403 100644
+--- a/src/lib/krb5/krb/init_ctx.c
++++ b/src/lib/krb5/krb/init_ctx.c
+@@ -66,7 +66,7 @@ static krb5_enctype default_enctype_list[] = {
+ };
+ 
+ #if (defined(_WIN32))
+-extern krb5_error_code krb5_vercheck();
++extern krb5_error_code krb5_vercheck(void);
+ extern void krb5_win_ccdll_load(krb5_context context);
+ #endif
+ 
+diff --git a/src/lib/krb5/os/dnsglue.c b/src/lib/krb5/os/dnsglue.c
+index 668a7a6..5da550c 100644
+--- a/src/lib/krb5/os/dnsglue.c
++++ b/src/lib/krb5/os/dnsglue.c
+@@ -439,7 +439,7 @@ cleanup:
+ }
+ 
+ char *
+-k5_primary_domain()
++k5_primary_domain(void)
+ {
+     return NULL;
+ }
+@@ -497,7 +497,7 @@ errout:
+ }
+ 
+ char *
+-k5_primary_domain()
++k5_primary_domain(void)
+ {
+     char *domain;
+     DECLARE_HANDLE(h);
+diff --git a/src/lib/krb5/os/localaddr.c b/src/lib/krb5/os/localaddr.c
+index 92d765f..4e9d07f 100644
+--- a/src/lib/krb5/os/localaddr.c
++++ b/src/lib/krb5/os/localaddr.c
+@@ -363,7 +363,7 @@ struct linux_ipv6_addr_list {
+     struct linux_ipv6_addr_list *next;
+ };
+ static struct linux_ipv6_addr_list *
+-get_linux_ipv6_addrs ()
++get_linux_ipv6_addrs (void)
+ {
+     struct linux_ipv6_addr_list *lst = 0;
+     FILE *f;
+@@ -1082,7 +1082,7 @@ static int print_addr (/*@unused@*/ void *dataptr, struct sockaddr *sa)
+     return 0;
+ }
+ 
+-int main ()
++int main (void)
+ {
+     int r;
+ 
+@@ -1417,7 +1417,7 @@ get_localaddrs (krb5_context context, krb5_address ***addr, int use_profile)
+  * by Robert Quinn
+  */
+ #if defined(_WIN32)
+-static struct hostent *local_addr_fallback_kludge()
++static struct hostent *local_addr_fallback_kludge(void)
+ {
+     static struct hostent   host;
+     static SOCKADDR_IN      addr;
+diff --git a/src/lib/rpc/getrpcent.c b/src/lib/rpc/getrpcent.c
+index ad6793f..b3d94bc 100644
+--- a/src/lib/rpc/getrpcent.c
++++ b/src/lib/rpc/getrpcent.c
+@@ -56,10 +56,10 @@ struct rpcdata {
+ 	char	line[BUFSIZ+1];
+ 	char	*domain;
+ } *rpcdata;
+-static struct rpcdata *get_rpcdata();
++static struct rpcdata *get_rpcdata(void);
+ 
+-static	struct rpcent *interpret();
+-struct	hostent *gethostent();
++static	struct rpcent *interpret(void);
++struct	hostent *gethostent(void);
+ 
+ static char RPCDB[] = "/etc/rpc";
+ 
+diff --git a/src/lib/win_glue.c b/src/lib/win_glue.c
+index d650cc3..011acda 100644
+--- a/src/lib/win_glue.c
++++ b/src/lib/win_glue.c
+@@ -6,7 +6,7 @@
+ #include "asn1_err.h"
+ #include "kdb5_err.h"
+ #include "profile.h"
+-extern void krb5_stdcc_shutdown();
++extern void krb5_stdcc_shutdown(void);
+ #endif
+ #ifdef GSSAPI
+ #include "gssapi/generic/gssapi_err_generic.h"
+@@ -233,7 +233,7 @@ static int CallVersionServer(app_title, app_version, app_ini, code_cover)
+ #endif
+ 
+ #ifdef TIMEBOMB
+-static krb5_error_code do_timebomb()
++static krb5_error_code do_timebomb(void)
+ {
+ 	char buf[1024];
+ 	long timeleft;
+@@ -276,7 +276,7 @@ static krb5_error_code do_timebomb()
+  * doesn't allow you to make messaging calls from LibMain.  So, we now
+  * do the timebomb/version server stuff from krb5_init_context().
+  */
+-krb5_error_code krb5_vercheck()
++krb5_error_code krb5_vercheck(void)
+ {
+ 	static int verchecked = 0;
+ 	if (verchecked)
+@@ -314,7 +314,7 @@ krb5_error_code krb5_vercheck()
+ 
+ static HINSTANCE hlibinstance;
+ 
+-HINSTANCE get_lib_instance()
++HINSTANCE get_lib_instance(void)
+ {
+     return hlibinstance;
+ }
+diff --git a/src/plugins/kdb/db2/kdb_db2.c b/src/plugins/kdb/db2/kdb_db2.c
+index 2c163d9..381228e 100644
+--- a/src/plugins/kdb/db2/kdb_db2.c
++++ b/src/plugins/kdb/db2/kdb_db2.c
+@@ -1165,13 +1165,13 @@ krb5_db2_set_lockmode(krb5_context context, krb5_boolean mode)
+  *     DAL API functions
+  */
+ krb5_error_code
+-krb5_db2_lib_init()
++krb5_db2_lib_init(void)
+ {
+     return 0;
+ }
+ 
+ krb5_error_code
+-krb5_db2_lib_cleanup()
++krb5_db2_lib_cleanup(void)
+ {
+     /* right now, no cleanup required */
+     return 0;
+diff --git a/src/plugins/kdb/db2/libdb2/hash/dbm.c b/src/plugins/kdb/db2/libdb2/hash/dbm.c
+index 2dca256..8e23d4c 100644
+--- a/src/plugins/kdb/db2/libdb2/hash/dbm.c
++++ b/src/plugins/kdb/db2/libdb2/hash/dbm.c
+@@ -95,7 +95,7 @@ kdb2_fetch(datum key)
+ }
+ 
+ datum
+-kdb2_firstkey()
++kdb2_firstkey(void)
+ {
+ 	datum item;
+ 
+diff --git a/src/plugins/kdb/ldap/libkdb_ldap/kdb_ldap_conn.c b/src/plugins/kdb/ldap/libkdb_ldap/kdb_ldap_conn.c
+index cee4b7b..5e77d5e 100644
+--- a/src/plugins/kdb/ldap/libkdb_ldap/kdb_ldap_conn.c
++++ b/src/plugins/kdb/ldap/libkdb_ldap/kdb_ldap_conn.c
+@@ -314,13 +314,13 @@ krb5_ldap_rebind(krb5_ldap_context *ldap_context,
+  *     DAL API functions
+  */
+ krb5_error_code
+-krb5_ldap_lib_init()
++krb5_ldap_lib_init(void)
+ {
+     return 0;
+ }
+ 
+ krb5_error_code
+-krb5_ldap_lib_cleanup()
++krb5_ldap_lib_cleanup(void)
+ {
+     /* right now, no cleanup required */
+     return 0;
+diff --git a/src/tests/threads/gss-perf.c b/src/tests/threads/gss-perf.c
+index f3630c2..0ca6d84 100644
+--- a/src/tests/threads/gss-perf.c
++++ b/src/tests/threads/gss-perf.c
+@@ -78,7 +78,7 @@ static void usage (void) __attribute__((noreturn));
+ static void set_target (char *);
+ 
+ static void
+-usage ()
++usage (void)
+ {
+     fprintf (stderr, "usage: %s [ options ] service-name\n", prog);
+     fprintf (stderr, "  service-name\tGSSAPI host-based service name (e.g., 'host@FQDN')\n");
+@@ -249,7 +249,7 @@ do_accept (gss_buffer_desc *msg, int iter)
+ }
+ 
+ static gss_buffer_desc
+-do_init ()
++do_init (void)
+ {
+     OM_uint32 maj_stat, min_stat;
+     gss_ctx_id_t ctx = GSS_C_NO_CONTEXT;
+diff --git a/src/tests/threads/init_ctx.c b/src/tests/threads/init_ctx.c
+index 42619a9..dc3d417 100644
+--- a/src/tests/threads/init_ctx.c
++++ b/src/tests/threads/init_ctx.c
+@@ -57,7 +57,7 @@ static int do_pause;
+ static void usage (void) __attribute__((noreturn));
+ 
+ static void
+-usage ()
++usage (void)
+ {
+     fprintf (stderr, "usage: %s [ options ]\n", prog);
+     fprintf (stderr, "options:\n");
+diff --git a/src/tests/threads/profread.c b/src/tests/threads/profread.c
+index be28ba4..69bdb05 100644
+--- a/src/tests/threads/profread.c
++++ b/src/tests/threads/profread.c
+@@ -59,7 +59,7 @@ static int do_pause;
+ static void usage (void) __attribute__((noreturn));
+ 
+ static void
+-usage ()
++usage (void)
+ {
+     fprintf (stderr, "usage: %s [ options ]\n", prog);
+     fprintf (stderr, "options:\n");
+diff --git a/src/tests/threads/t_rcache.c b/src/tests/threads/t_rcache.c
+index 07c45cc..8121429 100644
+--- a/src/tests/threads/t_rcache.c
++++ b/src/tests/threads/t_rcache.c
+@@ -51,7 +51,7 @@ int n_threads = DEFAULT_N_THREADS;
+ int interval = DEFAULT_INTERVAL;
+ int *ip;
+ 
+-static void wait_for_tick ()
++static void wait_for_tick (void)
+ {
+     time_t now, next;
+     now = time(0);
+diff --git a/src/util/et/com_err.c b/src/util/et/com_err.c
+index c1e3be7..2e74a4f 100644
+--- a/src/util/et/com_err.c
++++ b/src/util/et/com_err.c
+@@ -35,7 +35,7 @@ static /*@null@*/ et_old_error_hook_func com_err_hook = 0;
+ k5_mutex_t com_err_hook_lock = K5_MUTEX_PARTIAL_INITIALIZER;
+ 
+ #if defined(_WIN32)
+-BOOL  isGuiApp() {
++BOOL  isGuiApp(void) {
+     DWORD mypid;
+     HANDLE myprocess;
+     mypid = GetCurrentProcessId();
+@@ -161,7 +161,7 @@ et_old_error_hook_func set_com_err_hook (et_old_error_hook_func new_proc)
+     return x;
+ }
+ 
+-et_old_error_hook_func reset_com_err_hook ()
++et_old_error_hook_func reset_com_err_hook (void)
+ {
+     et_old_error_hook_func x;
+ 
+diff --git a/src/util/et/error_message.c b/src/util/et/error_message.c
+index 13ad3af..94445a9 100644
+--- a/src/util/et/error_message.c
++++ b/src/util/et/error_message.c
+@@ -303,7 +303,7 @@ remove_error_table(const struct error_table *et)
+     return ENOENT;
+ }
+ 
+-int com_err_finish_init()
++int com_err_finish_init(void)
+ {
+     return CALL_INIT_FUNCTION(com_err_initialize);
+ }
+diff --git a/src/util/profile/prof_file.c b/src/util/profile/prof_file.c
+index aa951df..c10a368 100644
+--- a/src/util/profile/prof_file.c
++++ b/src/util/profile/prof_file.c
+@@ -509,11 +509,11 @@ void profile_dereference_data_locked(prf_data_t data)
+         profile_free_file_data(data);
+ }
+ 
+-void profile_lock_global()
++void profile_lock_global(void)
+ {
+     k5_mutex_lock(&g_shared_trees_mutex);
+ }
+-void profile_unlock_global()
++void profile_unlock_global(void)
+ {
+     k5_mutex_unlock(&g_shared_trees_mutex);
+ }
+diff --git a/src/util/support/secure_getenv.c b/src/util/support/secure_getenv.c
+index 6df0591..c9b34b6 100644
+--- a/src/util/support/secure_getenv.c
++++ b/src/util/support/secure_getenv.c
+@@ -68,7 +68,7 @@ static int elevated_privilege = 0;
+ MAKE_INIT_FUNCTION(k5_secure_getenv_init);
+ 
+ int
+-k5_secure_getenv_init()
++k5_secure_getenv_init(void)
+ {
+     int saved_errno = errno;
+ 
+diff --git a/src/windows/include/leashwin.h b/src/windows/include/leashwin.h
+index 08b9c7d..c85e6df 100644
+--- a/src/windows/include/leashwin.h
++++ b/src/windows/include/leashwin.h
+@@ -160,51 +160,51 @@ void Leash_reset_defaults(void);
+ #define GOOD_TICKETS 1
+ 
+ /* Leash Configuration functions - alters Current User Registry */
+-DWORD Leash_get_default_lifetime();
++DWORD Leash_get_default_lifetime(void);
+ DWORD Leash_set_default_lifetime(DWORD minutes);
+-DWORD Leash_reset_default_lifetime();
+-DWORD Leash_get_default_renew_till();
++DWORD Leash_reset_default_lifetime(void);
++DWORD Leash_get_default_renew_till(void);
+ DWORD Leash_set_default_renew_till(DWORD minutes);
+-DWORD Leash_reset_default_renew_till();
+-DWORD Leash_get_default_renewable();
++DWORD Leash_reset_default_renew_till(void);
++DWORD Leash_get_default_renewable(void);
+ DWORD Leash_set_default_renewable(DWORD onoff);
+-DWORD Leash_reset_default_renewable();
+-DWORD Leash_get_default_forwardable();
++DWORD Leash_reset_default_renewable(void);
++DWORD Leash_get_default_forwardable(void);
+ DWORD Leash_set_default_forwardable(DWORD onoff);
+-DWORD Leash_reset_default_forwardable();
+-DWORD Leash_get_default_noaddresses();
++DWORD Leash_reset_default_forwardable(void);
++DWORD Leash_get_default_noaddresses(void);
+ DWORD Leash_set_default_noaddresses(DWORD onoff);
+-DWORD Leash_reset_default_noaddresses();
+-DWORD Leash_get_default_proxiable();
++DWORD Leash_reset_default_noaddresses(void);
++DWORD Leash_get_default_proxiable(void);
+ DWORD Leash_set_default_proxiable(DWORD onoff);
+-DWORD Leash_reset_default_proxiable();
+-DWORD Leash_get_default_publicip();
++DWORD Leash_reset_default_proxiable(void);
++DWORD Leash_get_default_publicip(void);
+ DWORD Leash_set_default_publicip(DWORD ipv4addr);
+-DWORD Leash_reset_default_publicip();
+-DWORD Leash_get_hide_kinit_options();
++DWORD Leash_reset_default_publicip(void);
++DWORD Leash_get_hide_kinit_options(void);
+ DWORD Leash_set_hide_kinit_options(DWORD onoff);
+-DWORD Leash_reset_hide_kinit_options();
+-DWORD Leash_get_default_life_min();
++DWORD Leash_reset_hide_kinit_options(void);
++DWORD Leash_get_default_life_min(void);
+ DWORD Leash_set_default_life_min(DWORD minutes);
+-DWORD Leash_reset_default_life_min();
+-DWORD Leash_get_default_life_max();
++DWORD Leash_reset_default_life_min(void);
++DWORD Leash_get_default_life_max(void);
+ DWORD Leash_set_default_life_max(DWORD minutes);
+-DWORD Leash_reset_default_life_max();
+-DWORD Leash_get_default_renew_min();
++DWORD Leash_reset_default_life_max(void);
++DWORD Leash_get_default_renew_min(void);
+ DWORD Leash_set_default_renew_min(DWORD minutes);
+-DWORD Leash_reset_default_renew_min();
+-DWORD Leash_get_default_renew_max();
++DWORD Leash_reset_default_renew_min(void);
++DWORD Leash_get_default_renew_max(void);
+ DWORD Leash_set_default_renew_max(DWORD minutes);
+-DWORD Leash_reset_default_renew_max();
+-DWORD Leash_get_default_uppercaserealm();
++DWORD Leash_reset_default_renew_max(void);
++DWORD Leash_get_default_uppercaserealm(void);
+ DWORD Leash_set_default_uppercaserealm(DWORD onoff);
+-DWORD Leash_reset_default_uppercaserealm();
+-DWORD Leash_get_default_mslsa_import();
++DWORD Leash_reset_default_uppercaserealm(void);
++DWORD Leash_get_default_mslsa_import(void);
+ DWORD Leash_set_default_mslsa_import(DWORD onoffmatch);
+-DWORD Leash_reset_default_mslsa_import();
+-DWORD Leash_get_default_preserve_kinit_settings();
++DWORD Leash_reset_default_mslsa_import(void);
++DWORD Leash_get_default_preserve_kinit_settings(void);
+ DWORD Leash_set_default_preserve_kinit_settings(DWORD onoff);
+-DWORD Leash_reset_default_preserve_kinit_settings();
++DWORD Leash_reset_default_preserve_kinit_settings(void);
+ #ifdef __cplusplus
+ }
+ #endif
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0002-Avoid-strict-prototype-compiler-errors.patch b/meta-oe/recipes-connectivity/krb5/krb5/0002-Avoid-strict-prototype-compiler-errors.patch
new file mode 100644
index 0000000000..63072c790c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/0002-Avoid-strict-prototype-compiler-errors.patch
@@ -0,0 +1,379 @@
+From 422c63a716a55da5c750396c0f215b5be9e060b6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Steffen=20Kie=C3=9F?=
+ <steffen.kiess@cis.iti.uni-stuttgart.de>
+Date: Tue, 13 Feb 2024 18:39:27 +0100
+Subject: [PATCH 2/2] Avoid strict-prototype compiler errors
+
+Commit 4b9d7f7c107f01a61600fddcd8cde3812d0366a2 added the
+-Werror=strict-prototypes parameter to the build process, but left
+behind 28 function definitions using "()" instead of "(void)".  Most
+of these definitions could not cause compiler errors for various
+reasons (such as an accompanying prototype), but a few could cause
+errors in gcc depending on the build configuration.
+
+For consistency and safety, add "(void)" to all 28 definitions.
+
+[ghudson@mit.edu: rewrote commit message]
+
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/3ae9244cd021a75eba909d872a92c25db490714d]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/clients/kcpytkt/kcpytkt.c                      | 2 +-
+ src/clients/kdeltkt/kdeltkt.c                      | 2 +-
+ src/clients/kinit/kinit.c                          | 4 ++--
+ src/clients/kinit/kinit_kdb.c                      | 2 +-
+ src/clients/klist/klist.c                          | 4 ++--
+ src/kadmin/cli/kadmin.c                            | 2 +-
+ src/kadmin/dbutil/kdb5_util.c                      | 4 ++--
+ src/kdc/main.c                                     | 2 +-
+ src/kprop/kpropd.c                                 | 4 ++--
+ src/lib/crypto/builtin/enc_provider/aes.c          | 2 +-
+ src/lib/crypto/openssl/hmac.c                      | 2 +-
+ src/lib/krb5/ccache/t_memory.c                     | 4 ++--
+ src/lib/krb5/ccache/t_stdio.c                      | 4 ++--
+ src/plugins/kdb/db2/libdb2/btree/bt_debug.c        | 2 +-
+ src/plugins/kdb/db2/libdb2/btree/bt_open.c         | 4 ++--
+ src/plugins/kdb/db2/libdb2/hash/dbm.c              | 2 +-
+ src/plugins/kdb/db2/libdb2/test/btree.tests/main.c | 2 +-
+ src/plugins/kdb/db2/libdb2/test/dbtest.c           | 2 +-
+ src/plugins/preauth/pkinit/pkinit_crypto_openssl.c | 2 +-
+ src/plugins/tls/k5tls/openssl.c                    | 2 +-
+ src/tests/asn.1/make-vectors.c                     | 2 +-
+ 21 files changed, 28 insertions(+), 28 deletions(-)
+
+diff --git a/src/clients/kcpytkt/kcpytkt.c b/src/clients/kcpytkt/kcpytkt.c
+index 0b88022..f1d50e5 100644
+--- a/src/clients/kcpytkt/kcpytkt.c
++++ b/src/clients/kcpytkt/kcpytkt.c
+@@ -10,7 +10,7 @@ static char *prog;
+ static int quiet = 0;
+ 
+ static void
+-xusage()
++xusage(void)
+ {
+     fprintf(stderr, "xusage: %s [-c from_ccache] [-e etype] [-f flags] "
+             "dest_ccache service1 service2 ...\n", prog);
+diff --git a/src/clients/kdeltkt/kdeltkt.c b/src/clients/kdeltkt/kdeltkt.c
+index cd0bf63..66a32a8 100644
+--- a/src/clients/kdeltkt/kdeltkt.c
++++ b/src/clients/kdeltkt/kdeltkt.c
+@@ -10,7 +10,7 @@ static char *prog;
+ static int quiet = 0;
+ 
+ static void
+-xusage()
++xusage(void)
+ {
+     fprintf(stderr, "xusage: %s [-c ccache] [-e etype] [-f flags] service1 "
+             "service2 ...\n", prog);
+diff --git a/src/clients/kinit/kinit.c b/src/clients/kinit/kinit.c
+index 7a33ffa..b27b723 100644
+--- a/src/clients/kinit/kinit.c
++++ b/src/clients/kinit/kinit.c
+@@ -55,7 +55,7 @@ get_name_from_os(void)
+ #else /* HAVE_PWD_H */
+ #ifdef _WIN32
+ static char *
+-get_name_from_os()
++get_name_from_os(void)
+ {
+     static char name[1024];
+     DWORD name_size = sizeof(name);
+@@ -69,7 +69,7 @@ get_name_from_os()
+ }
+ #else /* _WIN32 */
+ static char *
+-get_name_from_os()
++get_name_from_os(void)
+ {
+     return NULL;
+ }
+diff --git a/src/clients/kinit/kinit_kdb.c b/src/clients/kinit/kinit_kdb.c
+index fbd174b..4e7cd50 100644
+--- a/src/clients/kinit/kinit_kdb.c
++++ b/src/clients/kinit/kinit_kdb.c
+@@ -69,7 +69,7 @@ kinit_kdb_init(krb5_context *pcontext, char *realm)
+ }
+ 
+ void
+-kinit_kdb_fini()
++kinit_kdb_fini(void)
+ {
+     kadm5_destroy(server_handle);
+ }
+diff --git a/src/clients/klist/klist.c b/src/clients/klist/klist.c
+index c797b16..27cf0ee 100644
+--- a/src/clients/klist/klist.c
++++ b/src/clients/klist/klist.c
+@@ -359,7 +359,7 @@ do_keytab(const char *name)
+ }
+ 
+ static void
+-list_all_ccaches()
++list_all_ccaches(void)
+ {
+     krb5_error_code ret;
+     krb5_ccache cache;
+@@ -451,7 +451,7 @@ show_all_ccaches(void)
+ }
+ 
+ static void
+-do_ccache()
++do_ccache(void)
+ {
+     krb5_error_code ret;
+     krb5_ccache cache;
+diff --git a/src/kadmin/cli/kadmin.c b/src/kadmin/cli/kadmin.c
+index 23b64b0..c1256f7 100644
+--- a/src/kadmin/cli/kadmin.c
++++ b/src/kadmin/cli/kadmin.c
+@@ -607,7 +607,7 @@ kadmin_startup(int argc, char *argv[], char **request_out, char ***args_out)
+ }
+ 
+ int
+-quit()
++quit(void)
+ {
+     kadm5_ret_t retval;
+ 
+diff --git a/src/kadmin/dbutil/kdb5_util.c b/src/kadmin/dbutil/kdb5_util.c
+index 3a07fd5..187428e 100644
+--- a/src/kadmin/dbutil/kdb5_util.c
++++ b/src/kadmin/dbutil/kdb5_util.c
+@@ -367,7 +367,7 @@ main(int argc, char *argv[])
+  * program is run).
+  */
+ static int
+-open_db_and_mkey()
++open_db_and_mkey(void)
+ {
+     krb5_error_code retval;
+     krb5_data scratch, pwd, seed;
+@@ -489,7 +489,7 @@ open_db_and_mkey()
+ #endif
+ 
+ int
+-quit()
++quit(void)
+ {
+     krb5_error_code retval;
+     static krb5_boolean finished = 0;
+diff --git a/src/kdc/main.c b/src/kdc/main.c
+index bfdfef5..ad1d1bf 100644
+--- a/src/kdc/main.c
++++ b/src/kdc/main.c
+@@ -854,7 +854,7 @@ write_pid_file(const char *path)
+ }
+ 
+ static void
+-finish_realms()
++finish_realms(void)
+ {
+     int i;
+ 
+diff --git a/src/kprop/kpropd.c b/src/kprop/kpropd.c
+index 1b530fc..b11f3a9 100644
+--- a/src/kprop/kpropd.c
++++ b/src/kprop/kpropd.c
+@@ -376,7 +376,7 @@ get_wildcard_addr(struct addrinfo **res)
+ }
+ 
+ static void
+-do_standalone()
++do_standalone(void)
+ {
+     struct sockaddr_in frominet;
+     struct addrinfo *res;
+@@ -630,7 +630,7 @@ full_resync(CLIENT *clnt)
+  * Returns non-zero on failure due to errors.
+  */
+ krb5_error_code
+-do_iprop()
++do_iprop(void)
+ {
+     kadm5_ret_t retval;
+     krb5_principal iprop_svc_principal = NULL;
+diff --git a/src/lib/crypto/builtin/enc_provider/aes.c b/src/lib/crypto/builtin/enc_provider/aes.c
+index 7fa9449..39e2a84 100644
+--- a/src/lib/crypto/builtin/enc_provider/aes.c
++++ b/src/lib/crypto/builtin/enc_provider/aes.c
+@@ -69,7 +69,7 @@ void k5_iEnc256_CBC(struct aes_data *data);
+ void k5_iDec256_CBC(struct aes_data *data);
+ 
+ static krb5_boolean
+-aesni_supported_by_cpu()
++aesni_supported_by_cpu(void)
+ {
+     unsigned int a, b, c, d;
+ 
+diff --git a/src/lib/crypto/openssl/hmac.c b/src/lib/crypto/openssl/hmac.c
+index bf12b8d..799d700 100644
+--- a/src/lib/crypto/openssl/hmac.c
++++ b/src/lib/crypto/openssl/hmac.c
+@@ -70,7 +70,7 @@
+ 
+ #define HMAC_CTX_new compat_hmac_ctx_new
+ static HMAC_CTX *
+-compat_hmac_ctx_new()
++compat_hmac_ctx_new(void)
+ {
+     HMAC_CTX *ctx;
+ 
+diff --git a/src/lib/krb5/ccache/t_memory.c b/src/lib/krb5/ccache/t_memory.c
+index 6d103a0..0f94e82 100644
+--- a/src/lib/krb5/ccache/t_memory.c
++++ b/src/lib/krb5/ccache/t_memory.c
+@@ -85,7 +85,7 @@ krb5_creds test_creds = {
+ };
+ 
+ void
+-init_test_cred()
++init_test_cred(void)
+ {
+     test_creds.client = (krb5_principal) malloc(sizeof(krb5_data *)*3);
+     test_creds.client[0] = &client1;
+@@ -104,7 +104,7 @@ init_test_cred()
+     };
+ 
+ void
+-mcc_test()
++mcc_test(void)
+ {
+     krb5_ccache id;
+     krb5_creds creds;
+diff --git a/src/lib/krb5/ccache/t_stdio.c b/src/lib/krb5/ccache/t_stdio.c
+index 15185e3..06a9c2d 100644
+--- a/src/lib/krb5/ccache/t_stdio.c
++++ b/src/lib/krb5/ccache/t_stdio.c
+@@ -98,7 +98,7 @@ krb5_creds test_creds = {
+ };
+ 
+ void
+-init_test_cred()
++init_test_cred(void)
+ {
+     test_creds.client = (krb5_principal) malloc(sizeof(krb5_data *)*3);
+     test_creds.client[0] = &client1;
+@@ -118,7 +118,7 @@ init_test_cred()
+ 
+ int flags = 0;
+ void
+-scc_test()
++scc_test(void)
+ {
+     krb5_ccache id;
+     krb5_creds creds;
+diff --git a/src/plugins/kdb/db2/libdb2/btree/bt_debug.c b/src/plugins/kdb/db2/libdb2/btree/bt_debug.c
+index bc71076..5a955e0 100644
+--- a/src/plugins/kdb/db2/libdb2/btree/bt_debug.c
++++ b/src/plugins/kdb/db2/libdb2/btree/bt_debug.c
+@@ -56,7 +56,7 @@ static FILE *tracefp;
+  *	initialize debugging.
+  */
+ static void
+-__bt_dinit()
++__bt_dinit(void)
+ {
+ 	static int first = 1;
+ 
+diff --git a/src/plugins/kdb/db2/libdb2/btree/bt_open.c b/src/plugins/kdb/db2/libdb2/btree/bt_open.c
+index 0bb19d7..56bab19 100644
+--- a/src/plugins/kdb/db2/libdb2/btree/bt_open.c
++++ b/src/plugins/kdb/db2/libdb2/btree/bt_open.c
+@@ -390,7 +390,7 @@ nroot(BTREE *t)
+ }
+ 
+ static int
+-tmp()
++tmp(void)
+ {
+ #ifdef SIG_BLOCK
+ 	sigset_t set, oset;
+@@ -437,7 +437,7 @@ tmp()
+ }
+ 
+ static int
+-byteorder()
++byteorder(void)
+ {
+ 	u_int32_t x;
+ 	u_char *p;
+diff --git a/src/plugins/kdb/db2/libdb2/hash/dbm.c b/src/plugins/kdb/db2/libdb2/hash/dbm.c
+index 8e23d4c..6e5e96b 100644
+--- a/src/plugins/kdb/db2/libdb2/hash/dbm.c
++++ b/src/plugins/kdb/db2/libdb2/hash/dbm.c
+@@ -143,7 +143,7 @@ kdb2_store(datum key, datum dat)
+ }
+ 
+ static void
+-no_open_db()
++no_open_db(void)
+ {
+ 	(void)fprintf(stderr, "dbm: no open database.\n");
+ }
+diff --git a/src/plugins/kdb/db2/libdb2/test/btree.tests/main.c b/src/plugins/kdb/db2/libdb2/test/btree.tests/main.c
+index 088f903..eec843d 100644
+--- a/src/plugins/kdb/db2/libdb2/test/btree.tests/main.c
++++ b/src/plugins/kdb/db2/libdb2/test/btree.tests/main.c
+@@ -908,7 +908,7 @@ keydata(key, data)
+ }
+ 
+ void
+-usage()
++usage(void)
+ {
+ 	(void)fprintf(stderr,
+ 	    "usage: %s [-bdluw] [-c cache] [-i file] [-p page] [file]\n",
+diff --git a/src/plugins/kdb/db2/libdb2/test/dbtest.c b/src/plugins/kdb/db2/libdb2/test/dbtest.c
+index 04bf34b..a2866b4 100644
+--- a/src/plugins/kdb/db2/libdb2/test/dbtest.c
++++ b/src/plugins/kdb/db2/libdb2/test/dbtest.c
+@@ -792,7 +792,7 @@ xmalloc(char *text, size_t len)
+ }
+ 
+ void
+-usage()
++usage(void)
+ {
+ 	(void)fprintf(stderr,
+ 	    "usage: dbtest [-l] [-f file] [-i info] [-o file] type script\n");
+diff --git a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
+index 4c81256..4a8b6d9 100644
+--- a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
++++ b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
+@@ -3075,7 +3075,7 @@ cleanup:
+ }
+ 
+ int
+-pkinit_openssl_init()
++pkinit_openssl_init(void)
+ {
+     /* Initialize OpenSSL. */
+     ERR_load_crypto_strings();
+diff --git a/src/plugins/tls/k5tls/openssl.c b/src/plugins/tls/k5tls/openssl.c
+index 99fda7f..aab67c0 100644
+--- a/src/plugins/tls/k5tls/openssl.c
++++ b/src/plugins/tls/k5tls/openssl.c
+@@ -49,7 +49,7 @@ static int ex_handle_id = -1;
+ MAKE_INIT_FUNCTION(init_openssl);
+ 
+ int
+-init_openssl()
++init_openssl(void)
+ {
+     SSL_library_init();
+     SSL_load_error_strings();
+diff --git a/src/tests/asn.1/make-vectors.c b/src/tests/asn.1/make-vectors.c
+index 2fc8546..6f2b7dd 100644
+--- a/src/tests/asn.1/make-vectors.c
++++ b/src/tests/asn.1/make-vectors.c
+@@ -224,7 +224,7 @@ printbuf(void)
+ }
+ 
+ int
+-main()
++main(void)
+ {
+     /* Initialize values which can't use static initializers. */
+     asn_long2INTEGER(&otp_format, 2);  /* Alphanumeric */
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
index caba01c2ab..9d75592ed6 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
@@ -22,6 +22,8 @@ SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://debian-suppress-usr-lib-in-krb5-config.patch;striplevel=2 \
            file://0001-Eliminate-old-style-function-declarations.patch;patchdir=.. \
+           file://0001-Fix-more-non-prototype-functions.patch;patchdir=.. \
+           file://0002-Avoid-strict-prototype-compiler-errors.patch;patchdir=.. \
            file://crosscompile_nm.patch \
            file://etc/init.d/krb5-kdc \
            file://etc/init.d/krb5-admin-server \
-- 
2.35.6


