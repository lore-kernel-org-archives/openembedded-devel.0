Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8303.1793918330821549785
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 14:38:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=PnItcaak;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2026110522384742bc9f2c1500020786-ndj1pc@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2026110522384742bc9f2c1500020786
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 05 Nov 2026 23:38:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=UTPiGuhOrlZ8V6noWLvrUdDBUJU8iskDPz4Kii4AM0Y=;
 b=PnItcaakn/fWKMI1a3/dzq43ydqkbG7YierTQ6LtIUn06UHVX9645e9fh3Jbube85vvcvc
 oJnKJ5TvfG1Vng3RRr0P9FZmOTYwmx7NbPU2Io9H0bgVmM9RPEt21eRVqrL+uOYajQsRUYZB
 4CP3i6KWLPbRiWtU6G68lfIMJvCsNUAgGgYZlURknLngM35Gp/Ys/rxWJeWUNbESOkdiOkbr
 qUACQT6QSCBy89S9Y8FhELNupTAacq+b/xawyQgaznW43mqarzI0X4NP1PeqD4RJf9EUAPRi
 +jJiR+UIBUMeeTUesWSG954/GYidEDViVe70V07QCxQ+TNyNLI6CP50Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH 1/2] net-snmp: patch CVE-2026-89147
Date: Thu,  5 Nov 2026 23:38:20 +0100
Message-ID: <20261105223821.3628930-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 22:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131953
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Backport upstream commit ad843e83 ("snmpd: SMUX: Make accepted peer
connection handshake non-blocking") which fixes CVE-2026-89147: an
unauthenticated SMUX client that connects without sending data blocks
the whole snmpd process.

The fix does not apply cleanly on 5.9.4, so backport the six
prerequisite commits it depends on first. The prerequisite patches are
reduced to the files needed by the backport (agent/mibgroup/smux/,
include/net-snmp/types.h and snmpSocketBaseDomain) to avoid pulling in
unrelated treewide changes.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
---
 ...Remove-more-redundant-redeclarations.patch |  26 +
 ...ggested-by-Aisle-Research-to-prevent.patch |  25 +
 ...d-Rename-socket-descriptor-arguments.patch | 240 +++++++
 ...dows-Fix-64-bit-compatibility-issues.patch | 619 ++++++++++++++++++
 ...mp-Move-transport-include-directives.patch |  27 +
 ...Enable-TCP_NODELAY-on-TCP-sockets-to.patch | 119 ++++
 .../net-snmp/net-snmp/CVE-2026-89147.patch    | 389 +++++++++++
 .../net-snmp/net-snmp_5.9.4.bb                |   7 +
 8 files changed, 1452 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-CHANGES-Remove-more-redundant-redeclarations.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0002-fix-1098-as-suggested-by-Aisle-Research-to-prevent.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0003-libsnmp-snmpd-Rename-socket-descriptor-arguments.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0004-Windows-Fix-64-bit-compatibility-issues.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0005-libsnmp-Move-transport-include-directives.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0006-libsnmp-snmpd-Enable-TCP_NODELAY-on-TCP-sockets-to.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2026-89147.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-CHANGES-Remove-more-redundant-redeclarations.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-CHANGES-Remove-more-redundant-redeclarations.patch
new file mode 100644
index 00000000000..0bd5585073d
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-CHANGES-Remove-more-redundant-redeclarations.patch
@@ -0,0 +1,26 @@
+From da5728052f7f1a4ca6764fdf1f740f222175d60a Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Mon, 29 Jan 2024 14:57:24 -0800
+Subject: [PATCH] CHANGES: Remove more redundant redeclarations
+
+Prepare for enabling -Wredundant-decls.
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/da5728052f7f1a4ca6764fdf1f740f222175d60a]
+Backport prerequisite for the CVE-2026-89147 fix; diff limited to agent/mibgroup/smux/.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ agent/mibgroup/smux/smux.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/agent/mibgroup/smux/smux.c b/agent/mibgroup/smux/smux.c
+index 747b6a8eb..078c4c6fa 100644
+--- a/agent/mibgroup/smux/smux.c
++++ b/agent/mibgroup/smux/smux.c
+@@ -81,7 +81,6 @@ int             smux_listen_sd = -1;
+ static struct timeval smux_rcv_timeout;
+ static long   smux_reqid;
+ 
+-void            init_smux(void);
+ static u_char  *smux_open_process(int, u_char *, size_t *, int *);
+ static u_char  *smux_rreq_process(int, u_char *, size_t *);
+ static u_char  *smux_close_process(int, u_char *, size_t *);
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-fix-1098-as-suggested-by-Aisle-Research-to-prevent.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-fix-1098-as-suggested-by-Aisle-Research-to-prevent.patch
new file mode 100644
index 00000000000..f469f0e158c
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-fix-1098-as-suggested-by-Aisle-Research-to-prevent.patch
@@ -0,0 +1,25 @@
+From f77a116425433316d67ada69afc1aaf81868ddac Mon Sep 17 00:00:00 2001
+From: Wes Hardaker <opensource@hardakers.net>
+Date: Sun, 31 May 2026 06:19:12 -0700
+Subject: [PATCH] fix #1098 as suggested by Aisle Research to prevent smux
+ crashes
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/f77a116425433316d67ada69afc1aaf81868ddac]
+Backport prerequisite for the CVE-2026-89147 fix.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ agent/mibgroup/smux/smux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/agent/mibgroup/smux/smux.c b/agent/mibgroup/smux/smux.c
+index ddecf7ac4..cde96a23d 100644
+--- a/agent/mibgroup/smux/smux.c
++++ b/agent/mibgroup/smux/smux.c
+@@ -1103,6 +1103,7 @@ smux_rreq_process(int sd, u_char * ptr, size_t * len)
+              * unregister the mib 
+              */
+             unregister_mib(rptr->sr_name, rptr->sr_name_len);
++            rptr->reginfo = NULL;
+             /*
+              * find a replacement 
+              */
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0003-libsnmp-snmpd-Rename-socket-descriptor-arguments.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0003-libsnmp-snmpd-Rename-socket-descriptor-arguments.patch
new file mode 100644
index 00000000000..93567dd0b47
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0003-libsnmp-snmpd-Rename-socket-descriptor-arguments.patch
@@ -0,0 +1,240 @@
+From ebbf55dc38c2539b11b0951cc497cbd36ff15e4f Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Thu, 30 Jul 2026 09:16:01 -0700
+Subject: [PATCH] libsnmp, snmpd: Rename socket descriptor arguments
+
+Rename socket descriptor arguments (typically 'int fd' or 'int s')
+to 'int sock' across various transport domains and MIB groups to
+improve code clarity and consistency. This change helps distinguish
+socket descriptors from general file descriptors.
+
+The refactoring covers:
+- Transport domains (UDP, IPv4, IPv6, IP Base, Socket Base) where
+  arguments in functions like recvfrom, sendto, and sockopt_set
+  were renamed.
+- SMUX processing functions in agent/mibgroup/smux/smux.c.
+- Interface helpers and ioctl wrappers in if-mib, ip-mib, and mibII.
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/ebbf55dc38c2539b11b0951cc497cbd36ff15e4f]
+Backport prerequisite for the CVE-2026-89147 fix; diff limited to the files needed by that backport.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ agent/mibgroup/smux/smux.c                    | 64 +++++++++----------
+ .../net-snmp/library/snmpSocketBaseDomain.h   |  2 +-
+ 2 files changed, 33 insertions(+), 33 deletions(-)
+
+diff --git a/agent/mibgroup/smux/smux.c b/agent/mibgroup/smux/smux.c
+index cde96a23d6..16b0e8f66f 100644
+--- a/agent/mibgroup/smux/smux.c
++++ b/agent/mibgroup/smux/smux.c
+@@ -734,7 +734,7 @@ smux_accept(int sd)
+ }
+ 
+ int
+-smux_process(int fd)
++smux_process(int sock)
+ {
+     int             length, tmp_length;
+     u_char          data[SMUXMAXPKTSIZE];
+@@ -743,7 +743,7 @@ smux_process(int fd)
+ 
+     do
+     {
+-       length = recvfrom(fd, (char *) data, SMUXMAXPKTSIZE, MSG_PEEK, NULL,
++       length = recvfrom(sock, (char *) data, SMUXMAXPKTSIZE, MSG_PEEK, NULL,
+                          NULL);
+     }
+     while((length == -1) && ((errno == EINTR) || (errno == EAGAIN)));
+@@ -752,7 +752,7 @@ smux_process(int fd)
+     {
+        if (length < 0)
+            snmp_log_perror("[smux_process] peek failed");
+-       smux_peer_cleanup(fd);
++       smux_peer_cleanup(sock);
+        return -1;
+     }
+ 
+@@ -775,7 +775,7 @@ smux_process(int fd)
+     do
+     {
+        length = tmp_length;
+-       length = recvfrom(fd, (char *) data, length, 0, NULL, NULL);
++       length = recvfrom(sock, (char *) data, length, 0, NULL, NULL);
+     }
+     while((length == -1) && ((errno == EINTR) || (errno == EAGAIN)));
+ 
+@@ -786,16 +786,16 @@ smux_process(int fd)
+          */
+         DEBUGMSGTL(("smux",
+                     "[smux_process] peer on fd %d died or timed out\n",
+-                    fd));
+-        smux_peer_cleanup(fd);
++                    sock));
++        smux_peer_cleanup(sock);
+         return -1;
+     }
+ 
+-    return smux_pdu_process(fd, data, length);
++    return smux_pdu_process(sock, data, length);
+ }
+ 
+ static int
+-smux_pdu_process(int fd, u_char * data, size_t length)
++smux_pdu_process(int sock, u_char * data, size_t length)
+ {
+     int             error;
+     size_t          len;
+@@ -817,37 +817,37 @@ smux_pdu_process(int fd, u_char * data, size_t length)
+                     (int) type));
+         switch (type) {
+         case SMUX_OPEN:
+-            smux_send_close(fd, SMUXC_PROTOCOLERROR);
++            smux_send_close(sock, SMUXC_PROTOCOLERROR);
+             DEBUGMSGTL(("smux",
+                         "[smux_pdu_process] peer on fd %d sent duplicate open?\n",
+-                        fd));
+-            smux_peer_cleanup(fd);
++                        sock));
++            smux_peer_cleanup(sock);
+             error = -1;
+             break;
+         case SMUX_CLOSE:
+-            ptr = smux_close_process(fd, ptr, &len);
+-            smux_peer_cleanup(fd);
++            ptr = smux_close_process(sock, ptr, &len);
++            smux_peer_cleanup(sock);
+             error = -1;
+             break;
+         case SMUX_RREQ:
+-            ptr = smux_rreq_process(fd, ptr, &len);
++            ptr = smux_rreq_process(sock, ptr, &len);
+             break;
+         case SMUX_RRSP:
+             error = -1;
+-            smux_send_close(fd, SMUXC_PROTOCOLERROR);
+-            smux_peer_cleanup(fd);
++            smux_send_close(sock, SMUXC_PROTOCOLERROR);
++            smux_peer_cleanup(sock);
+             DEBUGMSGTL(("smux",
+                         "[smux_pdu_process] peer on fd %d sent RRSP!\n",
+-                        fd));
++                        sock));
+             break;
+         case SMUX_SOUT:
+             error = -1;
+-            smux_send_close(fd, SMUXC_PROTOCOLERROR);
+-            smux_peer_cleanup(fd);
++            smux_send_close(sock, SMUXC_PROTOCOLERROR);
++            smux_peer_cleanup(sock);
+             DEBUGMSGTL(("smux", "This shouldn't have happened!\n"));
+             break;
+         case SMUX_TRAP:
+-            DEBUGMSGTL(("smux", "Got trap from peer on fd %d\n", fd));
++            DEBUGMSGTL(("smux", "Got trap from peer on fd %d\n", sock));
+             if (ptr)
+             {
+                DEBUGMSGTL(("smux", "[smux_pdu_process] call smux_trap_process.\n"));
+@@ -863,8 +863,8 @@ smux_pdu_process(int fd, u_char * data, size_t length)
+              */
+             break;
+         default:
+-            smux_send_close(fd, SMUXC_PACKETFORMAT);
+-            smux_peer_cleanup(fd);
++            smux_send_close(sock, SMUXC_PACKETFORMAT);
++            smux_peer_cleanup(sock);
+             DEBUGMSGTL(("smux", "[smux_pdu_process] Wrong type %d\n",
+                         (int) type));
+             error = -1;
+@@ -875,7 +875,7 @@ smux_pdu_process(int fd, u_char * data, size_t length)
+ }
+ 
+ static u_char  *
+-smux_open_process(int fd, u_char * ptr, size_t * len, int *fail)
++smux_open_process(int sock, u_char * ptr, size_t * len, int *fail)
+ {
+     u_char          type;
+     long            version;
+@@ -946,7 +946,7 @@ smux_open_process(int fd, u_char * ptr, size_t * len, int *fail)
+                     "u, type %d\n", *len, (int) type));
+     }
+     passwd[string_len] = '\0';
+-    if (!smux_auth_peer(oid_name, oid_name_len, passwd, fd)) {
++    if (!smux_auth_peer(oid_name, oid_name_len, passwd, sock)) {
+         snmp_log(LOG_WARNING,
+                  "refused smux peer: oid %s, descr %s\n",
+                  oid_print, descr);
+@@ -961,7 +961,7 @@ smux_open_process(int fd, u_char * ptr, size_t * len, int *fail)
+ }
+ 
+ static void
+-smux_send_close(int fd, int reason)
++smux_send_close(int sock, int reason)
+ {
+     u_char          outpacket[3], *ptr;
+ 
+@@ -973,20 +973,20 @@ smux_send_close(int fd, int reason)
+ 
+     if (snmp_get_do_debugging())
+         DEBUGMSGTL(("smux",
+-                    "[smux_close] sending close to fd %d, reason %d\n", fd,
++                    "[smux_close] sending close to fd %d, reason %d\n", sock,
+                     reason));
+ 
+     /*
+      * send a response back 
+      */
+-    if (sendto(fd, (char *) outpacket, 3, 0, NULL, 0) < 0) {
++    if (sendto(sock, (char *) outpacket, 3, 0, NULL, 0) < 0) {
+         snmp_log_perror("[smux_snmp_close] send failed");
+     }
+ }
+ 
+ 
+ static int
+-smux_auth_peer(oid * name, size_t namelen, char *passwd, int fd)
++smux_auth_peer(oid * name, size_t namelen, char *passwd, int sock)
+ {
+     int             i;
+     char            oid_print[SMUXMAXSTRLEN];
+@@ -1015,7 +1015,7 @@ smux_auth_peer(oid * name, size_t namelen, char *passwd, int fd)
+                 /*
+                  * matched, mark the auth 
+                  */
+-                Auths[i]->sa_active_fd = fd;
++                Auths[i]->sa_active_fd = sock;
+                 return 1;
+             }
+         }
+@@ -1032,7 +1032,7 @@ smux_auth_peer(oid * name, size_t namelen, char *passwd, int fd)
+  * Need to catch signal when snmpd goes down and send close pdu to gated 
+  */
+ static u_char  *
+-smux_close_process(int fd, u_char * ptr, size_t * len)
++smux_close_process(int sock, u_char * ptr, size_t * len)
+ {
+     long            down = 0;
+     int             length = *len;
+@@ -1047,8 +1047,8 @@ smux_close_process(int fd, u_char * ptr, size_t * len)
+ 
+     DEBUGMSGTL(("smux",
+                 "[smux_close_process] close from peer on fd %d reason %ld\n",
+-                fd, down));
+-    smux_peer_cleanup(fd);
++                sock, down));
++    smux_peer_cleanup(sock);
+ 
+     return NULL;
+ }
+diff --git a/include/net-snmp/library/snmpSocketBaseDomain.h b/include/net-snmp/library/snmpSocketBaseDomain.h
+index 06001727fc..951fb21c84 100644
+--- a/include/net-snmp/library/snmpSocketBaseDomain.h
++++ b/include/net-snmp/library/snmpSocketBaseDomain.h
+@@ -15,7 +15,7 @@ extern          "C" {
+  * Prototypes
+  */
+     int netsnmp_socketbase_close(netsnmp_transport *t);
+-    int netsnmp_sock_buffer_set(int s, int optname, int local, int size);
++    int netsnmp_sock_buffer_set(int sock, int optname, int local, int size);
+     int netsnmp_set_non_blocking_mode(int sock, int non_blocking_mode);
+ 
+ #ifdef __cplusplus
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-Windows-Fix-64-bit-compatibility-issues.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-Windows-Fix-64-bit-compatibility-issues.patch
new file mode 100644
index 00000000000..ebea81e1bcb
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-Windows-Fix-64-bit-compatibility-issues.patch
@@ -0,0 +1,619 @@
+From ab94dd803c49a97dbc859aa6504809588d5383fe Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Fri, 31 Jul 2026 07:21:54 -0700
+Subject: [PATCH] Windows: Fix 64-bit compatibility issues
+
+On 64-bit Windows systems sizeof(SOCKET) == 8 and sizeof(int) == 4. Avoid
+truncation of socket handles by using the NETSNMP_SOCKET data type
+(which maps to SOCKET on Windows and int on other systems) instead of int.
+Additionally, use NETSNMP_INVALID_SOCKET (which maps to INVALID_SOCKET on
+Windows and -1 on other systems) instead of -1 when checking whether a socket
+handle is invalid, since SOCKET is an unsigned type on Windows.
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/ab94dd803c49a97dbc859aa6504809588d5383fe]
+Backport prerequisite for the CVE-2026-89147 fix; diff limited to the files needed by that backport.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ agent/mibgroup/smux/smux.c                    | 161 +++++++++---------
+ agent/mibgroup/smux/smux.h                    |  16 +-
+ .../net-snmp/library/snmpSocketBaseDomain.h   |   6 +-
+ include/net-snmp/types.h                      |  14 ++
+ 4 files changed, 111 insertions(+), 86 deletions(-)
+
+diff --git a/agent/mibgroup/smux/smux.c b/agent/mibgroup/smux/smux.c
+index 16b0e8f66f..88f8bb72f5 100644
+--- a/agent/mibgroup/smux/smux.c
++++ b/agent/mibgroup/smux/smux.c
+@@ -76,30 +76,31 @@ struct sockaddr_in smux_sa;
+ struct counter64 smux_counter64;
+ oid             smux_objid[MAX_OID_LEN];
+ u_char          smux_str[SMUXMAXSTRLEN];
+-int             smux_listen_sd = -1;
++NETSNMP_SOCKET  smux_listen_sd = NETSNMP_INVALID_SOCKET;
+ 
+ static struct timeval smux_rcv_timeout;
+ static long   smux_reqid;
+ 
+-static u_char  *smux_open_process(int, u_char *, size_t *, int *);
+-static u_char  *smux_rreq_process(int, u_char *, size_t *);
+-static u_char  *smux_close_process(int, u_char *, size_t *);
++static u_char  *smux_open_process(NETSNMP_SOCKET, u_char *, size_t *, int *);
++static u_char  *smux_rreq_process(NETSNMP_SOCKET, u_char *, size_t *);
++static u_char  *smux_close_process(NETSNMP_SOCKET, u_char *, size_t *);
+ static u_char  *smux_trap_process(u_char *, size_t *);
+ static u_char  *smux_parse(u_char *, oid *, size_t *, size_t *, u_char *);
+ static u_char  *smux_parse_var(u_char *, size_t *, oid *, size_t *,
+                                size_t *, u_char *);
+-static void     smux_send_close(int, int);
++static void     smux_send_close(NETSNMP_SOCKET, int);
+ static void     smux_list_detach(smux_reg **, smux_reg *);
+ static void     smux_replace_active(smux_reg *, smux_reg *);
+-static void     smux_peer_cleanup(int);
+-static int      smux_auth_peer(oid *, size_t, char *, int);
++static void     smux_peer_cleanup(NETSNMP_SOCKET);
++static int      smux_auth_peer(oid *, size_t, char *, NETSNMP_SOCKET);
+ static int      smux_build(u_char, long, oid *,
+                            size_t *, u_char, u_char *, size_t, u_char *,
+                            size_t *);
+ static int      smux_list_add(smux_reg **, smux_reg *);
+-static int      smux_pdu_process(int, u_char *, size_t);
+-static int      smux_send_rrsp(int, int);
+-static smux_reg *smux_find_match(smux_reg *, int, oid *, size_t, long);
++static int      smux_pdu_process(NETSNMP_SOCKET, u_char *, size_t);
++static int      smux_send_rrsp(NETSNMP_SOCKET, int);
++static smux_reg *smux_find_match(smux_reg *, NETSNMP_SOCKET, oid *, size_t,
++                                 long);
+ static smux_reg *smux_find_replacement(oid *, size_t);
+ u_char         *var_smux_get(oid *, size_t, oid *, size_t *, int, size_t *,
+                                u_char *);
+@@ -144,7 +145,7 @@ smux_parse_peer_auth(const char *token, char *cptr)
+     /*
+      * oid 
+      */
+-    aptr->sa_active_fd = -1;
++    aptr->sa_active_fd = NETSNMP_INVALID_SOCKET;
+     aptr->sa_oid_len = MAX_OID_LEN;
+     rv = read_objid( cptr, aptr->sa_oid, &aptr->sa_oid_len );
+     DEBUGMSGTL(("smux_conf", "parsing registration for: %s\n", cptr));
+@@ -202,7 +203,7 @@ real_init_smux(void)
+     int             one = 1;
+ 
+     if (netsnmp_ds_get_boolean(NETSNMP_DS_APPLICATION_ID, NETSNMP_DS_AGENT_ROLE) == SUB_AGENT) {
+-        smux_listen_sd = -1;
++        smux_listen_sd = NETSNMP_INVALID_SOCKET;
+         return;
+     }
+ 
+@@ -210,7 +211,7 @@ real_init_smux(void)
+      * Reqid 
+      */
+     smux_reqid = 0;
+-    smux_listen_sd = -1;
++    smux_listen_sd = NETSNMP_INVALID_SOCKET;
+ 
+     /*
+      * Receive timeout 
+@@ -232,7 +233,8 @@ real_init_smux(void)
+ #endif
+     netsnmp_sockaddr_in( &lo_socket, smux_socket, SMUXPORT );
+ 
+-    if ((smux_listen_sd = (int) socket(AF_INET, SOCK_STREAM, 0)) < 0) {
++    smux_listen_sd = socket(AF_INET, SOCK_STREAM, 0);
++    if (!NETSNMP_IS_VALID_SOCKET(smux_listen_sd)) {
+         snmp_log_perror("[init_smux] socket failed");
+         return;
+     }
+@@ -253,30 +255,29 @@ real_init_smux(void)
+     if (bind(smux_listen_sd, (struct sockaddr *) &lo_socket,
+              sizeof(lo_socket)) < 0) {
+         snmp_log_perror("[init_smux] bind failed");
+-        close(smux_listen_sd);
+-        smux_listen_sd = -1;
+-        return;
++        goto close_listen_fd;
+     }
+ #ifdef	SO_KEEPALIVE
+     if (setsockopt(smux_listen_sd, SOL_SOCKET, SO_KEEPALIVE, (char *) &one,
+                    sizeof(one)) < 0) {
+         snmp_log_perror("[init_smux] setsockopt(SO_KEEPALIVE) failed");
+-        close(smux_listen_sd);
+-        smux_listen_sd = -1;
+-        return;
++        goto close_listen_fd;
+     }
+ #endif                          /* SO_KEEPALIVE */
+ 
+     if (listen(smux_listen_sd, SOMAXCONN) == -1) {
+         snmp_log_perror("[init_smux] listen failed");
+-        close(smux_listen_sd);
+-        smux_listen_sd = -1;
+-        return;
++        goto close_listen_fd;
+     }
+ 
+     DEBUGMSGTL(("smux_init",
+-                "[smux_init] done; smux listen sd is %d, smux port is %d\n",
++                "[smux_init] done; smux listen sd is %" NETSNMP_FMT_SKT ", smux port is %d\n",
+                 smux_listen_sd, ntohs(lo_socket.sin_port)));
++    return;
++
++close_listen_fd:
++    close(smux_listen_sd);
++    smux_listen_sd = NETSNMP_INVALID_SOCKET;
+ }
+ 
+ static int
+@@ -537,7 +538,7 @@ var_smux_write(int action,
+ 
+             if (buf[0] == SMUX_TRAP) {
+                 DEBUGMSGTL(("smux", "[var_smux_write] Received trap\n"));
+-                DEBUGMSGTL(("smux", "Got trap from peer on fd %d\n",
++                DEBUGMSGTL(("smux", "Got trap from peer on fd %" NETSNMP_FMT_SKT "\n",
+                          rptr->sr_fd));
+                 ptr = asn_parse_header(buf, &len, &type);
+                 if (ptr == NULL)
+@@ -621,14 +622,14 @@ var_smux_write(int action,
+     return reterr;
+ }
+ 
+-
+-int
+-smux_accept(int sd)
++NETSNMP_SOCKET
++smux_accept(NETSNMP_SOCKET sd)
+ {
+     u_char          data[SMUXMAXPKTSIZE], *ptr, type;
+     struct sockaddr_in in_socket;
+     struct timeval  tv;
+-    int             fail, fd;
++    int             fail;
++    NETSNMP_SOCKET  fd;
+     socklen_t       alen;
+     int             length;
+     size_t          len;
+@@ -645,19 +646,20 @@ smux_accept(int sd)
+      */
+     DEBUGMSGTL(("smux", "[smux_accept] Calling accept()\n"));
+     errno = 0;
+-    if ((fd = (int) accept(sd, (struct sockaddr *) &in_socket, &alen)) < 0) {
++    fd = accept(sd, (struct sockaddr *) &in_socket, &alen);
++    if (!NETSNMP_IS_VALID_SOCKET(fd)) {
+         snmp_log_perror("[smux_accept] accept failed");
+-        return -1;
++        return NETSNMP_INVALID_SOCKET;
+     } else {
+-        DEBUGMSGTL(("smux", "[smux_accept] accepted fd %d from %s:%d\n",
++        DEBUGMSGTL(("smux", "[smux_accept] accepted fd %" NETSNMP_FMT_SKT " from %s:%d\n",
+                  fd, inet_ntoa(in_socket.sin_addr),
+                  ntohs(in_socket.sin_port)));
+         if (npeers + 1 == SMUXMAXPEERS) {
+             snmp_log(LOG_ERR,
+-                     "[smux_accept] denied peer on fd %d, limit %d reached",
++                     "[smux_accept] denied peer on fd %" NETSNMP_FMT_SKT ", limit %d reached",
+                      fd, SMUXMAXPEERS);
+             close(fd);
+-            return -1;
++            return NETSNMP_INVALID_SOCKET;
+         }
+ 
+         /*
+@@ -671,10 +673,10 @@ smux_accept(int sd)
+ 
+         if (length <= 0) {
+             DEBUGMSGTL(("smux",
+-                        "[smux_accept] peer on fd %d died or timed out\n",
++                        "[smux_accept] peer on fd %" NETSNMP_FMT_SKT " died or timed out\n",
+                         fd));
+             close(fd);
+-            return -1;
++            return NETSNMP_INVALID_SOCKET;
+         }
+         /*
+          * try to authorize him 
+@@ -684,40 +686,42 @@ smux_accept(int sd)
+         if ((ptr = asn_parse_header(ptr, &len, &type)) == NULL) {
+             smux_send_close(fd, SMUXC_PACKETFORMAT);
+             close(fd);
+-            DEBUGMSGTL(("smux", "[smux_accept] peer on %d sent bad open", fd));
+-            return -1;
++            DEBUGMSGTL(("smux",
++                        "[smux_accept] peer on %" NETSNMP_FMT_SKT " sent bad open",
++                        fd));
++            return NETSNMP_INVALID_SOCKET;
+         } else if (type != (u_char) SMUX_OPEN) {
+             smux_send_close(fd, SMUXC_PROTOCOLERROR);
+             close(fd);
+             DEBUGMSGTL(("smux",
+-                        "[smux_accept] peer on %d did not send open: (%d)\n",
++                        "[smux_accept] peer on %" NETSNMP_FMT_SKT " did not send open: (%d)\n",
+                         fd, type));
+-            return -1;
++            return NETSNMP_INVALID_SOCKET;
+         }
+         ptr = smux_open_process(fd, ptr, &len, &fail);
+         if (fail) {
+             smux_send_close(fd, SMUXC_AUTHENTICATIONFAILURE);
+             close(fd);
+             DEBUGMSGTL(("smux",
+-                        "[smux_accept] peer on %d failed authentication\n",
++                        "[smux_accept] peer on %" NETSNMP_FMT_SKT " failed authentication\n",
+                         fd));
+-            return -1;
++            return NETSNMP_INVALID_SOCKET;
+         }
+ 
+         /*
+          * he's OK 
+          */
+ #ifdef SO_RCVTIMEO
+-        if (setsockopt
+-            (fd, SOL_SOCKET, SO_RCVTIMEO, (void *) &tv, sizeof(tv)) < 0) {
++        if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, (void *) &tv, sizeof(tv)) <
++            0) {
+             DEBUGMSGTL(("smux",
+-                        "[smux_accept] setsockopt(SO_RCVTIMEO) failed fd %d\n",
++                        "[smux_accept] setsockopt(SO_RCVTIMEO) failed fd %" NETSNMP_FMT_SKT "\n",
+                         fd));
+             snmp_log_perror("smux_accept: setsockopt SO_RCVTIMEO");
+         }
+ #endif
+         npeers++;
+-        DEBUGMSGTL(("smux", "[smux_accept] fd %d\n", fd));
++        DEBUGMSGTL(("smux", "[smux_accept] fd %" NETSNMP_FMT_SKT "\n", fd));
+ 
+         /*
+          * Process other PDUs already read, e.g. a registerRequest. 
+@@ -727,14 +731,14 @@ smux_accept(int sd)
+             /*
+              * Easy come, easy go.  Clean-up is already done. 
+              */
+-            return -1;
++            return NETSNMP_INVALID_SOCKET;
+         }
+     }
+     return fd;
+ }
+ 
+ int
+-smux_process(int sock)
++smux_process(NETSNMP_SOCKET sock)
+ {
+     int             length, tmp_length;
+     u_char          data[SMUXMAXPKTSIZE];
+@@ -785,7 +789,7 @@ smux_process(int sock)
+          * * and delete it from the list
+          */
+         DEBUGMSGTL(("smux",
+-                    "[smux_process] peer on fd %d died or timed out\n",
++                    "[smux_process] peer on fd %" NETSNMP_FMT_SKT " died or timed out\n",
+                     sock));
+         smux_peer_cleanup(sock);
+         return -1;
+@@ -795,7 +799,7 @@ smux_process(int sock)
+ }
+ 
+ static int
+-smux_pdu_process(int sock, u_char * data, size_t length)
++smux_pdu_process(NETSNMP_SOCKET sock, u_char * data, size_t length)
+ {
+     int             error;
+     size_t          len;
+@@ -819,7 +823,7 @@ smux_pdu_process(int sock, u_char * data, size_t length)
+         case SMUX_OPEN:
+             smux_send_close(sock, SMUXC_PROTOCOLERROR);
+             DEBUGMSGTL(("smux",
+-                        "[smux_pdu_process] peer on fd %d sent duplicate open?\n",
++                        "[smux_pdu_process] peer on fd %" NETSNMP_FMT_SKT " sent duplicate open?\n",
+                         sock));
+             smux_peer_cleanup(sock);
+             error = -1;
+@@ -837,7 +841,7 @@ smux_pdu_process(int sock, u_char * data, size_t length)
+             smux_send_close(sock, SMUXC_PROTOCOLERROR);
+             smux_peer_cleanup(sock);
+             DEBUGMSGTL(("smux",
+-                        "[smux_pdu_process] peer on fd %d sent RRSP!\n",
++                        "[smux_pdu_process] peer on fd %" NETSNMP_FMT_SKT " sent RRSP!\n",
+                         sock));
+             break;
+         case SMUX_SOUT:
+@@ -847,7 +851,9 @@ smux_pdu_process(int sock, u_char * data, size_t length)
+             DEBUGMSGTL(("smux", "This shouldn't have happened!\n"));
+             break;
+         case SMUX_TRAP:
+-            DEBUGMSGTL(("smux", "Got trap from peer on fd %d\n", sock));
++            DEBUGMSGTL(("smux",
++                        "Got trap from peer on fd %" NETSNMP_FMT_SKT "\n",
++                        sock));
+             if (ptr)
+             {
+                DEBUGMSGTL(("smux", "[smux_pdu_process] call smux_trap_process.\n"));
+@@ -875,7 +881,7 @@ smux_pdu_process(int sock, u_char * data, size_t length)
+ }
+ 
+ static u_char  *
+-smux_open_process(int sock, u_char * ptr, size_t * len, int *fail)
++smux_open_process(NETSNMP_SOCKET sock, u_char * ptr, size_t * len, int *fail)
+ {
+     u_char          type;
+     long            version;
+@@ -961,7 +967,7 @@ smux_open_process(int sock, u_char * ptr, size_t * len, int *fail)
+ }
+ 
+ static void
+-smux_send_close(int sock, int reason)
++smux_send_close(NETSNMP_SOCKET sock, int reason)
+ {
+     u_char          outpacket[3], *ptr;
+ 
+@@ -973,8 +979,8 @@ smux_send_close(int sock, int reason)
+ 
+     if (snmp_get_do_debugging())
+         DEBUGMSGTL(("smux",
+-                    "[smux_close] sending close to fd %d, reason %d\n", sock,
+-                    reason));
++                    "[smux_close] sending close to fd %" NETSNMP_FMT_SKT ", reason %d\n",
++                    sock, reason));
+ 
+     /*
+      * send a response back 
+@@ -986,7 +992,7 @@ smux_send_close(int sock, int reason)
+ 
+ 
+ static int
+-smux_auth_peer(oid * name, size_t namelen, char *passwd, int sock)
++smux_auth_peer(oid * name, size_t namelen, char *passwd, NETSNMP_SOCKET sock)
+ {
+     int             i;
+     char            oid_print[SMUXMAXSTRLEN];
+@@ -1007,11 +1013,11 @@ smux_auth_peer(oid * name, size_t namelen, char *passwd, int sock)
+         if (snmp_oid_compare(Auths[i]->sa_oid, Auths[i]->sa_oid_len,
+                              name, namelen) == 0) {
+             if (snmp_get_do_debugging()) {
+-                DEBUGMSGTL(("smux:auth", "[smux_auth_peer] Checking P/W: %s (%d)\n",
++                DEBUGMSGTL(("smux:auth", "[smux_auth_peer] Checking P/W: %s (%" NETSNMP_FMT_SKT ")\n",
+                         Auths[i]->sa_passwd, Auths[i]->sa_active_fd));
+             }
+             if (!(strcmp(Auths[i]->sa_passwd, passwd)) &&
+-                (Auths[i]->sa_active_fd == -1)) {
++                !NETSNMP_IS_VALID_SOCKET(Auths[i]->sa_active_fd)) {
+                 /*
+                  * matched, mark the auth 
+                  */
+@@ -1032,7 +1038,7 @@ smux_auth_peer(oid * name, size_t namelen, char *passwd, int sock)
+  * Need to catch signal when snmpd goes down and send close pdu to gated 
+  */
+ static u_char  *
+-smux_close_process(int sock, u_char * ptr, size_t * len)
++smux_close_process(NETSNMP_SOCKET sock, u_char * ptr, size_t * len)
+ {
+     long            down = 0;
+     int             length = *len;
+@@ -1046,7 +1052,7 @@ smux_close_process(int sock, u_char * ptr, size_t * len)
+     }
+ 
+     DEBUGMSGTL(("smux",
+-                "[smux_close_process] close from peer on fd %d reason %ld\n",
++                "[smux_close_process] close from peer on fd %" NETSNMP_FMT_SKT " reason %ld\n",
+                 sock, down));
+     smux_peer_cleanup(sock);
+ 
+@@ -1054,7 +1060,7 @@ smux_close_process(int sock, u_char * ptr, size_t * len)
+ }
+ 
+ static u_char  *
+-smux_rreq_process(int sd, u_char * ptr, size_t * len)
++smux_rreq_process(NETSNMP_SOCKET sd, u_char * ptr, size_t * len)
+ {
+     long            priority, rpriority;
+     long            operation;
+@@ -1148,7 +1154,7 @@ smux_rreq_process(int sd, u_char * ptr, size_t * len)
+                (operation == SMUX_REGOP_REGISTER_RW)) {
+         if (priority < -1) {
+             DEBUGMSGTL(("smux",
+-                        "[smux_rreq_process] peer fd %d invalid priority %ld",
++                        "[smux_rreq_process] peer fd %" NETSNMP_FMT_SKT " invalid priority %ld",
+                         sd, priority));
+             smux_send_rrsp(sd, -1);
+             return NULL;
+@@ -1260,7 +1266,7 @@ smux_rreq_process(int sd, u_char * ptr, size_t * len)
+  * a matching OID, and the highest priority.
+  */
+ static smux_reg *
+-smux_find_match(smux_reg * regs, int sd, oid * oid_name,
++smux_find_match(smux_reg * regs, NETSNMP_SOCKET sd, oid * oid_name,
+                 size_t oid_name_len, long priority)
+ {
+     smux_reg       *rptr, *bestrptr;
+@@ -1456,7 +1462,7 @@ u_char         *
+ smux_snmp_process(int exact,
+                   oid * objid,
+                   size_t * len,
+-                  size_t * return_len, u_char * return_type, int sd)
++                  size_t * return_len, u_char * return_type, NETSNMP_SOCKET sd)
+ {
+     u_char          packet[SMUXMAXPKTSIZE], *ptr, result[SMUXMAXPKTSIZE];
+     ssize_t         length = SMUXMAXPKTSIZE;
+@@ -1551,7 +1557,9 @@ smux_snmp_process(int exact,
+ 
+         if (result[0] == SMUX_TRAP) {
+             DEBUGMSGTL(("smux", "[smux_snmp_process] Received trap\n"));
+-            DEBUGMSGTL(("smux", "Got trap from peer on fd %d\n", sd));
++            DEBUGMSGTL(("smux",
++                        "Got trap from peer on fd %" NETSNMP_FMT_SKT "\n",
++                        sd));
+             ptr = asn_parse_header(result, (size_t *) &length, &type);
+             if (ptr == NULL)
+                 return NULL;
+@@ -1849,7 +1857,7 @@ smux_build(u_char type,
+ }
+ 
+ static void
+-smux_peer_cleanup(int sd)
++smux_peer_cleanup(NETSNMP_SOCKET sd)
+ {
+     smux_reg       *nrptr, *rptr, *rptr2;
+     int             i;
+@@ -1918,7 +1926,7 @@ smux_peer_cleanup(int sd)
+     for (i = 0; i < nauths; i++) {
+         if (Auths[i]->sa_active_fd == sd) {
+             char            oid_name[128];
+-            Auths[i]->sa_active_fd = -1;
++            Auths[i]->sa_active_fd = NETSNMP_INVALID_SOCKET;
+             snprint_objid(oid_name, sizeof(oid_name), Auths[i]->sa_oid,
+                           Auths[i]->sa_oid_len);
+             DEBUGMSGTL(("smux", "peer disconnected: %s\n", oid_name));
+@@ -1927,7 +1935,7 @@ smux_peer_cleanup(int sd)
+ }
+ 
+ int
+-smux_send_rrsp(int sd, int pri)
++smux_send_rrsp(NETSNMP_SOCKET sd, int pri)
+ {
+     u_char          outdata[2 + sizeof(int)];
+     u_char         *ptr = outdata;
+@@ -2173,9 +2181,10 @@ err:
+ }
+ 
+ #define NUM_SOCKETS	32
+-static int      sdlist[NUM_SOCKETS], sdlen = 0;
++static NETSNMP_SOCKET sdlist[NUM_SOCKETS];
++static int sdlen;
+ 
+-int smux_snmp_select_list_add(int sd)
++int smux_snmp_select_list_add(NETSNMP_SOCKET sd)
+ {
+    if (sdlen < NUM_SOCKETS)
+    {
+@@ -2185,14 +2194,14 @@ int smux_snmp_select_list_add(int sd)
+    return(0);
+ }
+ 
+-int smux_snmp_select_list_del(int sd)
++int smux_snmp_select_list_del(NETSNMP_SOCKET sd)
+ {
+    int i, found=0;
+ 
+    for (i = 0; i < (sdlen); i++) {
+       if (sdlist[i] == sd)
+       {
+-         sdlist[i] = 0;
++         sdlist[i] = NETSNMP_INVALID_SOCKET;
+          found = 1;
+       }
+       if ((found) &&(i < (sdlen - 1)))
+@@ -2211,11 +2220,11 @@ int smux_snmp_select_list_get_length(void)
+    return(sdlen);
+ }
+ 
+-int smux_snmp_select_list_get_SD_from_List(int pos)
++NETSNMP_SOCKET smux_snmp_select_list_get_SD_from_List(int pos)
+ {
+    if (pos < NUM_SOCKETS)
+    {
+       return(sdlist[pos]);
+    }
+-   return(0);
++   return NETSNMP_INVALID_SOCKET;
+ }
+diff --git a/agent/mibgroup/smux/smux.h b/agent/mibgroup/smux/smux.h
+index f8f0822cb2..8e9ae456e9 100644
+--- a/agent/mibgroup/smux/smux.h
++++ b/agent/mibgroup/smux/smux.h
+@@ -48,7 +48,7 @@ typedef struct _smux_peer_auth {
+     oid             sa_oid[MAX_OID_LEN];        /* name of peer                 */
+     size_t          sa_oid_len; /* length of peer name          */
+     char            sa_passwd[SMUXMAXSTRLEN];   /* configured passwd            */
+-    int             sa_active_fd;       /* the peer using this auth     */
++    NETSNMP_SOCKET  sa_active_fd;       /* the peer using this auth     */
+ } smux_peer_auth;
+ 
+ /*
+@@ -58,29 +58,29 @@ typedef struct _smux_reg {
+     oid             sr_name[MAX_OID_LEN];       /* name of subtree              */
+     size_t          sr_name_len;        /* length of subtree name       */
+     int             sr_priority;        /* priority of registration     */
+-    int             sr_fd;      /* descriptor of owner          */
++    NETSNMP_SOCKET  sr_fd;      /* descriptor of owner          */
+     struct _smux_reg *sr_next;  /* next one                     */
+     netsnmp_handler_registration *reginfo;
+ } smux_reg;
+ 
+ extern void     init_smux(void);
+ extern void     real_init_smux(void);
+-extern int      smux_accept(int);
++extern NETSNMP_SOCKET smux_accept(NETSNMP_SOCKET);
+ extern u_char  *smux_snmp_process(int, oid *, size_t *, size_t *, u_char *,
+-                                  int);
+-extern int      smux_process(int);
++                                  NETSNMP_SOCKET);
++extern int      smux_process(NETSNMP_SOCKET);
+ extern void     smux_parse_peer_auth(const char *, char *);
+ extern void     smux_free_peer_auth(void);
+ 
+ /* Add socket-fd to list */
+-int smux_snmp_select_list_add(int sd);
++int smux_snmp_select_list_add(NETSNMP_SOCKET sd);
+ 
+ /* Remove socket-fd from list */
+-int smux_snmp_select_list_del(int sd);
++int smux_snmp_select_list_del(NETSNMP_SOCKET sd);
+ 
+ /* Returns the count of added socket-fd's in the list */
+ int smux_snmp_select_list_get_length(void);
+ 
+ /* Returns the socket-fd number from the position of the list */
+-int smux_snmp_select_list_get_SD_from_List(int pos);
++NETSNMP_SOCKET smux_snmp_select_list_get_SD_from_List(int pos);
+ 
+diff --git a/include/net-snmp/library/snmpSocketBaseDomain.h b/include/net-snmp/library/snmpSocketBaseDomain.h
+index 951fb21c84..300fc5f7ba 100644
+--- a/include/net-snmp/library/snmpSocketBaseDomain.h
++++ b/include/net-snmp/library/snmpSocketBaseDomain.h
+@@ -15,8 +15,10 @@ extern          "C" {
+  * Prototypes
+  */
+     int netsnmp_socketbase_close(netsnmp_transport *t);
+-    int netsnmp_sock_buffer_set(int sock, int optname, int local, int size);
+-    int netsnmp_set_non_blocking_mode(int sock, int non_blocking_mode);
++    int netsnmp_sock_buffer_set(NETSNMP_SOCKET sock, int optname, int local,
++                                int size);
++    int netsnmp_set_non_blocking_mode(NETSNMP_SOCKET sock,
++                                      int non_blocking_mode);
+ 
+ #ifdef __cplusplus
+ }
+diff --git a/include/net-snmp/types.h b/include/net-snmp/types.h
+index bb3238dd92..218fec5377 100644
+--- a/include/net-snmp/types.h
++++ b/include/net-snmp/types.h
+@@ -28,9 +28,22 @@
+ #endif
+ 
+ #if defined(WIN32) && !defined(cygwin)
++
++#define NETSNMP_SOCKET         SOCKET
++#define NETSNMP_INVALID_SOCKET INVALID_SOCKET
++#define NETSNMP_IS_VALID_SOCKET(_sock) ((_sock) != INVALID_SOCKET)
++#define NETSNMP_FMT_SKT        "llu"
++
+ typedef HANDLE netsnmp_pid_t;
+ #define NETSNMP_NO_SUCH_PROCESS INVALID_HANDLE_VALUE
++
+ #else
++
++#define NETSNMP_SOCKET         int
++#define NETSNMP_INVALID_SOCKET -1
++#define NETSNMP_IS_VALID_SOCKET(_sock) ((_sock) != -1)
++#define NETSNMP_FMT_SKT        "d"
++
+ /*
+  * Note: on POSIX-compliant systems, pid_t is defined in <sys/types.h>.
+  * And if pid_t has not been defined in <sys/types.h>, AC_TYPE_PID_T ensures
+@@ -38,6 +51,7 @@ typedef HANDLE netsnmp_pid_t;
+  */
+ typedef pid_t netsnmp_pid_t;
+ #define NETSNMP_NO_SUCH_PROCESS -1
++
+ #endif
+ 
+ #include <net-snmp/library/oid.h>
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0005-libsnmp-Move-transport-include-directives.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0005-libsnmp-Move-transport-include-directives.patch
new file mode 100644
index 00000000000..d298f81fc43
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0005-libsnmp-Move-transport-include-directives.patch
@@ -0,0 +1,27 @@
+From b1efa55e0289623f3149afd447f3d54dec315a9e Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Sun, 16 Aug 2026 12:52:10 -0700
+Subject: [PATCH] libsnmp: Move transport include directives
+
+Remove the transport include directives from include/net-snmp/session_api.h
+and move these into the source files that need these include directives.
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/b1efa55e0289623f3149afd447f3d54dec315a9e]
+Backport prerequisite for the CVE-2026-89147 fix; diff limited to agent/mibgroup/smux/.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ agent/mibgroup/smux/smux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/agent/mibgroup/smux/smux.c b/agent/mibgroup/smux/smux.c
+index 88f8bb72f5..f4656c9f0d 100644
+--- a/agent/mibgroup/smux/smux.c
++++ b/agent/mibgroup/smux/smux.c
+@@ -63,6 +63,7 @@
+ 
+ #include <net-snmp/net-snmp-includes.h>
+ #include <net-snmp/agent/net-snmp-agent-includes.h>
++#include <net-snmp/library/snmpIPv4BaseDomain.h>
+ #include <net-snmp/library/tools.h>
+ 
+ #include "smux.h"
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0006-libsnmp-snmpd-Enable-TCP_NODELAY-on-TCP-sockets-to.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0006-libsnmp-snmpd-Enable-TCP_NODELAY-on-TCP-sockets-to.patch
new file mode 100644
index 00000000000..f087b1ac186
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0006-libsnmp-snmpd-Enable-TCP_NODELAY-on-TCP-sockets-to.patch
@@ -0,0 +1,119 @@
+From ac3ff04ceae5f4daea43a15e447a26b70cfab548 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Thu, 20 Aug 2026 19:33:49 -0700
+Subject: [PATCH] libsnmp, snmpd: Enable TCP_NODELAY on TCP sockets to reduce
+ latency
+
+SNMP and subagent protocols (AgentX, SMUX) operate primarily as
+synchronous request-response protocols, transmitting small frames
+that are significantly smaller than the Maximum Segment Size (MSS).
+Without TCP_NODELAY, Nagle's algorithm coalesces packets when there
+is unacknowledged data in flight. In combination with receiver delayed
+ACK timers (typically 40 to 200 ms), this introduces artificial
+latency stalls during request-response cycles and multi-packet
+exchanges (such as TLS handshakes and AgentX transactions).
+
+Introduce netsnmp_set_tcp_nodelay() in snmpSocketBaseDomain to set or
+clear the TCP_NODELAY socket option across POSIX and Windows platforms.
+
+Enable TCP_NODELAY on all TCP-based transports and connections where
+disabling Nagle's algorithm reduces latency:
+- snmpTCPDomain: client-side connect and server-side accept
+- snmpTCPIPv6Domain: client-side connect and server-side accept
+- snmpSSHDomain: client-side connect
+- smux: server-side accept
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/ac3ff04ceae5f4daea43a15e447a26b70cfab548]
+Backport prerequisite for the CVE-2026-89147 fix; diff limited to the files needed by that backport.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ agent/mibgroup/smux/smux.c                    |  2 +
+ .../net-snmp/library/snmpSocketBaseDomain.h   |  1 +
+ snmplib/transports/snmpSocketBaseDomain.c     | 38 +++++++++++++++++++
+ 3 files changed, 41 insertions(+)
+
+diff --git a/agent/mibgroup/smux/smux.c b/agent/mibgroup/smux/smux.c
+index f4656c9f0d..63b67a7e85 100644
+--- a/agent/mibgroup/smux/smux.c
++++ b/agent/mibgroup/smux/smux.c
+@@ -64,6 +64,7 @@
+ #include <net-snmp/net-snmp-includes.h>
+ #include <net-snmp/agent/net-snmp-agent-includes.h>
+ #include <net-snmp/library/snmpIPv4BaseDomain.h>
++#include <net-snmp/library/snmpSocketBaseDomain.h>
+ #include <net-snmp/library/tools.h>
+ 
+ #include "smux.h"
+@@ -652,6 +653,7 @@ smux_accept(NETSNMP_SOCKET sd)
+         snmp_log_perror("[smux_accept] accept failed");
+         return NETSNMP_INVALID_SOCKET;
+     } else {
++        netsnmp_set_tcp_nodelay(fd, 1);
+         DEBUGMSGTL(("smux", "[smux_accept] accepted fd %" NETSNMP_FMT_SKT " from %s:%d\n",
+                  fd, inet_ntoa(in_socket.sin_addr),
+                  ntohs(in_socket.sin_port)));
+diff --git a/include/net-snmp/library/snmpSocketBaseDomain.h b/include/net-snmp/library/snmpSocketBaseDomain.h
+index 300fc5f7ba..8b6fac1a9d 100644
+--- a/include/net-snmp/library/snmpSocketBaseDomain.h
++++ b/include/net-snmp/library/snmpSocketBaseDomain.h
+@@ -19,6 +19,7 @@ extern          "C" {
+                                 int size);
+     int netsnmp_set_non_blocking_mode(NETSNMP_SOCKET sock,
+                                       int non_blocking_mode);
++    int netsnmp_set_tcp_nodelay(NETSNMP_SOCKET sock, int nodelay);
+ 
+ #ifdef __cplusplus
+ }
+diff --git a/snmplib/transports/snmpSocketBaseDomain.c b/snmplib/transports/snmpSocketBaseDomain.c
+index 6a23d29f62..8629f3916f 100644
+--- a/snmplib/transports/snmpSocketBaseDomain.c
++++ b/snmplib/transports/snmpSocketBaseDomain.c
+@@ -30,6 +30,12 @@
+ #ifdef HAVE_SYS_SOCKET_H
+ #include <sys/socket.h>
+ #endif
++#ifdef HAVE_NETINET_IN_H
++#include <netinet/in.h>
++#endif
++#ifdef HAVE_NETINET_TCP_H
++#include <netinet/tcp.h>
++#endif
+ #include <errno.h>
+ 
+ #include <net-snmp/types.h>
+@@ -361,3 +367,35 @@ netsnmp_set_non_blocking_mode(NETSNMP_SOCKET sock, int non_blocking_mode)
+         return -1;
+ #endif
+ }
++
++/**
++ * Sets or clears the TCP_NODELAY option on a socket.
++ *
++ * @param[in] sock Socket descriptor (Unix) or socket handle (Windows).
++ * @param[in] nodelay Non-zero to enable TCP_NODELAY (disable Nagle's algorithm),
++ *                    zero to disable TCP_NODELAY (enable Nagle's algorithm).
++ *
++ * @return zero upon success and a negative value upon error.
++ */
++int
++netsnmp_set_tcp_nodelay(NETSNMP_SOCKET sock, int nodelay)
++{
++    int rc = -1;
++
++#if defined(TCP_NODELAY)
++    if (NETSNMP_IS_VALID_SOCKET(sock)) {
++        rc = setsockopt(sock, IPPROTO_TCP, TCP_NODELAY, (void *)&nodelay,
++                        sizeof(nodelay));
++        if (rc < 0) {
++            DEBUGMSGTL(("socket:nodelay",
++                        "could not set TCP_NODELAY to %d on socket %" NETSNMP_FMT_SKT ": %s\n",
++                        nodelay, sock, strerror(errno)));
++        } else {
++            DEBUGMSGTL(("socket:nodelay",
++                        "set TCP_NODELAY to %d on socket %" NETSNMP_FMT_SKT "\n",
++                        nodelay, sock));
++        }
++    }
++#endif
++    return rc;
++}
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2026-89147.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2026-89147.patch
new file mode 100644
index 00000000000..806c8014414
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2026-89147.patch
@@ -0,0 +1,389 @@
+From ad843e83da1c229847ae7884dc08311fad680389 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Mon, 14 Sep 2026 10:19:57 -0700
+Subject: [PATCH] snmpd: SMUX: Make accepted peer connection handshake
+ non-blocking
+
+When accepting a new SMUX connection, smux_accept() previously executed
+a synchronous, blocking recvfrom() in the main daemon loop to read the
+initial OpenPDU before authenticating the peer. If an unauthenticated
+client connected and sent no data, the entire snmpd process blocked,
+preventing all SNMP request processing (CVE-2026-89147 / Issue #1134).
+
+Make the SMUX connection acceptance and authentication asynchronous:
+- Set accepted SMUX peer sockets to non-blocking mode immediately upon
+  accept() in smux_accept() and return the socket to the select loop
+  without performing any synchronous read.
+- In smux_process(), check whether the peer is authenticated. If not yet
+  authenticated, read and parse the OpenPDU non-blockingly when the
+  socket becomes readable, authenticating the peer and processing any
+  subsequent PDUs in the buffer.
+- Register a 5-second one-shot alarm on accepted connections to close
+  and clean up unauthenticated sockets that fail to complete the
+  handshake in time.
+- In smux_peer_cleanup(), only decrement npeers if the connection was
+  an authenticated peer.
+
+Fixes: https://github.com/net-snmp/net-snmp/issues/1134
+Fixes: ee0daa3b7bcd ("- (smux.c, smux.h): Patch from Nick Amato: - completely re-written smux modules.")
+CVE: CVE-2026-89147
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/ad843e83da1c229847ae7884dc08311fad680389]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ agent/mibgroup/smux/smux.c | 275 +++++++++++++++++++++----------------
+ 1 file changed, 155 insertions(+), 120 deletions(-)
+
+diff --git a/agent/mibgroup/smux/smux.c b/agent/mibgroup/smux/smux.c
+index 63b67a7e85..e38b0b8c3a 100644
+--- a/agent/mibgroup/smux/smux.c
++++ b/agent/mibgroup/smux/smux.c
+@@ -94,6 +94,8 @@ static void     smux_send_close(NETSNMP_SOCKET, int);
+ static void     smux_list_detach(smux_reg **, smux_reg *);
+ static void     smux_replace_active(smux_reg *, smux_reg *);
+ static void     smux_peer_cleanup(NETSNMP_SOCKET);
++static int      smux_peer_is_authenticated(NETSNMP_SOCKET);
++static void     smux_auth_timeout_cb(unsigned int, void *);
+ static int      smux_auth_peer(oid *, size_t, char *, NETSNMP_SOCKET);
+ static int      smux_build(u_char, long, oid *,
+                            size_t *, u_char, u_char *, size_t, u_char *,
+@@ -624,24 +626,47 @@ var_smux_write(int action,
+     return reterr;
+ }
+ 
++static int
++smux_peer_is_authenticated(NETSNMP_SOCKET sd)
++{
++    int i;
++
++    for (i = 0; i < nauths; i++)
++        if (Auths[i]->sa_active_fd == sd)
++            return 1;
++
++    return 0;
++}
++
++static void
++smux_auth_timeout_cb(unsigned int clientreg, void *clientarg)
++{
++    NETSNMP_SOCKET fd = (NETSNMP_SOCKET)(uintptr_t)clientarg;
++    int i, found = 0;
++
++    for (i = 0; i < smux_snmp_select_list_get_length(); i++) {
++        if (smux_snmp_select_list_get_SD_from_List(i) == fd) {
++            found = 1;
++            break;
++        }
++    }
++    if (found && !smux_peer_is_authenticated(fd)) {
++        DEBUGMSGTL(("smux",
++                    "[smux_auth_timeout] closing idle unauthenticated fd %"
++                    NETSNMP_FMT_SKT "\n", fd));
++        close(fd);
++        smux_snmp_select_list_del(fd);
++    }
++}
++
+ NETSNMP_SOCKET
+ smux_accept(NETSNMP_SOCKET sd)
+ {
+-    u_char          data[SMUXMAXPKTSIZE], *ptr, type;
+     struct sockaddr_in in_socket;
+-    struct timeval  tv;
+-    int             fail;
+     NETSNMP_SOCKET  fd;
+     socklen_t       alen;
+-    int             length;
+-    size_t          len;
+ 
+     alen = sizeof(struct sockaddr_in);
+-    /*
+-     * this may be too high 
+-     */
+-    tv.tv_sec = 5;
+-    tv.tv_usec = 0;
+ 
+     /*
+      * connection request 
+@@ -652,91 +677,23 @@ smux_accept(NETSNMP_SOCKET sd)
+     if (!NETSNMP_IS_VALID_SOCKET(fd)) {
+         snmp_log_perror("[smux_accept] accept failed");
+         return NETSNMP_INVALID_SOCKET;
+-    } else {
+-        netsnmp_set_tcp_nodelay(fd, 1);
+-        DEBUGMSGTL(("smux", "[smux_accept] accepted fd %" NETSNMP_FMT_SKT " from %s:%d\n",
+-                 fd, inet_ntoa(in_socket.sin_addr),
+-                 ntohs(in_socket.sin_port)));
+-        if (npeers + 1 == SMUXMAXPEERS) {
+-            snmp_log(LOG_ERR,
+-                     "[smux_accept] denied peer on fd %" NETSNMP_FMT_SKT ", limit %d reached",
+-                     fd, SMUXMAXPEERS);
+-            close(fd);
+-            return NETSNMP_INVALID_SOCKET;
+-        }
+-
+-        /*
+-         * now block for an OpenPDU 
+-         */
+-        do
+-        {
+-           length = recvfrom(fd, (char *) data, SMUXMAXPKTSIZE, 0, NULL, NULL);
+-        }
+-        while((length == -1) && ((errno == EINTR) || (errno == EAGAIN)));
+-
+-        if (length <= 0) {
+-            DEBUGMSGTL(("smux",
+-                        "[smux_accept] peer on fd %" NETSNMP_FMT_SKT " died or timed out\n",
+-                        fd));
+-            close(fd);
+-            return NETSNMP_INVALID_SOCKET;
+-        }
+-        /*
+-         * try to authorize him 
+-         */
+-        ptr = data;
+-        len = length;
+-        if ((ptr = asn_parse_header(ptr, &len, &type)) == NULL) {
+-            smux_send_close(fd, SMUXC_PACKETFORMAT);
+-            close(fd);
+-            DEBUGMSGTL(("smux",
+-                        "[smux_accept] peer on %" NETSNMP_FMT_SKT " sent bad open",
+-                        fd));
+-            return NETSNMP_INVALID_SOCKET;
+-        } else if (type != (u_char) SMUX_OPEN) {
+-            smux_send_close(fd, SMUXC_PROTOCOLERROR);
+-            close(fd);
+-            DEBUGMSGTL(("smux",
+-                        "[smux_accept] peer on %" NETSNMP_FMT_SKT " did not send open: (%d)\n",
+-                        fd, type));
+-            return NETSNMP_INVALID_SOCKET;
+-        }
+-        ptr = smux_open_process(fd, ptr, &len, &fail);
+-        if (fail) {
+-            smux_send_close(fd, SMUXC_AUTHENTICATIONFAILURE);
+-            close(fd);
+-            DEBUGMSGTL(("smux",
+-                        "[smux_accept] peer on %" NETSNMP_FMT_SKT " failed authentication\n",
+-                        fd));
+-            return NETSNMP_INVALID_SOCKET;
+-        }
+-
+-        /*
+-         * he's OK 
+-         */
+-#ifdef SO_RCVTIMEO
+-        if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, (void *) &tv, sizeof(tv)) <
+-            0) {
+-            DEBUGMSGTL(("smux",
+-                        "[smux_accept] setsockopt(SO_RCVTIMEO) failed fd %" NETSNMP_FMT_SKT "\n",
+-                        fd));
+-            snmp_log_perror("smux_accept: setsockopt SO_RCVTIMEO");
+-        }
+-#endif
+-        npeers++;
+-        DEBUGMSGTL(("smux", "[smux_accept] fd %" NETSNMP_FMT_SKT "\n", fd));
+-
+-        /*
+-         * Process other PDUs already read, e.g. a registerRequest. 
+-         */
+-        len = length - (ptr - data);
+-        if (smux_pdu_process(fd, ptr, len) < 0) {
+-            /*
+-             * Easy come, easy go.  Clean-up is already done. 
+-             */
+-            return NETSNMP_INVALID_SOCKET;
+-        }
+     }
++
++    netsnmp_set_tcp_nodelay(fd, 1);
++    netsnmp_set_non_blocking_mode(fd, TRUE);
++    DEBUGMSGTL(("smux", "[smux_accept] accepted fd %" NETSNMP_FMT_SKT " from %s:%d\n",
++             fd, inet_ntoa(in_socket.sin_addr),
++             ntohs(in_socket.sin_port)));
++    if (npeers + 1 == SMUXMAXPEERS) {
++        snmp_log(LOG_ERR,
++                 "[smux_accept] denied peer on fd %" NETSNMP_FMT_SKT ", limit %d reached",
++                 fd, SMUXMAXPEERS);
++        close(fd);
++        return NETSNMP_INVALID_SOCKET;
++    }
++
++    snmp_alarm_register(5, 0, smux_auth_timeout_cb, (void *)(intptr_t)fd);
++
+     return fd;
+ }
+ 
+@@ -746,21 +703,102 @@ smux_process(NETSNMP_SOCKET sock)
+     int             length, tmp_length;
+     u_char          data[SMUXMAXPKTSIZE];
+     u_char          type, *ptr;
+-    size_t          packet_len;
++    size_t          packet_len, len;
++    int             fail;
+ 
+-    do
+-    {
++    if (!smux_peer_is_authenticated(sock)) {
++        /*
++         * Unauthenticated peer: read OpenPDU non-blockingly.
++         */
++        do {
++            length = recvfrom(sock, (char *) data, SMUXMAXPKTSIZE, 0, NULL, NULL);
++        } while (length == -1 && errno == EINTR);
++
++        if (length < 0) {
++            if (errno == EAGAIN ||
++                (EAGAIN != EWOULDBLOCK && errno == EWOULDBLOCK))
++                return 0;
++            DEBUGMSGTL(("smux",
++                        "[smux_process] recvfrom failed on unauthenticated fd %"
++                        NETSNMP_FMT_SKT "\n", sock));
++            close(sock);
++            return -1;
++        }
++        if (length == 0) {
++            DEBUGMSGTL(("smux",
++                        "[smux_process] peer on fd %" NETSNMP_FMT_SKT
++                        " closed connection before auth\n", sock));
++            close(sock);
++            return -1;
++        }
++
++        /*
++         * Try to authorize peer.
++         */
++        ptr = data;
++        len = length;
++        if ((ptr = asn_parse_header(ptr, &len, &type)) == NULL) {
++            smux_send_close(sock, SMUXC_PACKETFORMAT);
++            close(sock);
++            DEBUGMSGTL(("smux",
++                        "[smux_process] peer on %" NETSNMP_FMT_SKT " sent bad open\n",
++                        sock));
++            return -1;
++        } else if (type != (u_char) SMUX_OPEN) {
++            smux_send_close(sock, SMUXC_PROTOCOLERROR);
++            close(sock);
++            DEBUGMSGTL(("smux",
++                        "[smux_process] peer on %" NETSNMP_FMT_SKT " did not send open: (%d)\n",
++                        sock, type));
++            return -1;
++        }
++        ptr = smux_open_process(sock, ptr, &len, &fail);
++        if (fail) {
++            smux_send_close(sock, SMUXC_AUTHENTICATIONFAILURE);
++            close(sock);
++            DEBUGMSGTL(("smux",
++                        "[smux_process] peer on %" NETSNMP_FMT_SKT " failed authentication\n",
++                        sock));
++            return -1;
++        }
++
++        npeers++;
++        DEBUGMSGTL(("smux", "[smux_process] authenticated peer on fd %" NETSNMP_FMT_SKT "\n", sock));
++
++        /*
++         * Process other PDUs already read, e.g. a registerRequest.
++         */
++        len = length - (ptr - data);
++        if (len > 0) {
++            if (smux_pdu_process(sock, ptr, len) < 0) {
++                return -1;
++            }
++        }
++        return 0;
++    }
++
++    /*
++     * Authenticated peer: process incoming data.
++     */
++    do {
+        length = recvfrom(sock, (char *) data, SMUXMAXPKTSIZE, MSG_PEEK, NULL,
+                          NULL);
+-    }
+-    while((length == -1) && ((errno == EINTR) || (errno == EAGAIN)));
++    } while (length == -1 && errno == EINTR);
+ 
+-    if (length <= 0)
+-    {
+-       if (length < 0)
+-           snmp_log_perror("[smux_process] peek failed");
+-       smux_peer_cleanup(sock);
+-       return -1;
++    if (length < 0) {
++        if (errno == EAGAIN ||
++            (EAGAIN != EWOULDBLOCK && errno == EWOULDBLOCK))
++            return 0;
++        snmp_log_perror("[smux_process] peek failed");
++        smux_peer_cleanup(sock);
++        return -1;
++    }
++    if (length == 0) {
++        DEBUGMSGTL(("smux",
++                    "[smux_process] peer on fd %" NETSNMP_FMT_SKT " died or disconnected\n",
++                    sock));
++        smux_peer_cleanup(sock);
++        return -1;
+     }
+ 
+     /*
+@@ -768,10 +806,12 @@ smux_process(NETSNMP_SOCKET sock)
+      */
+     packet_len = length;
+     ptr = asn_parse_header(data, &packet_len, &type);
+-    if (ptr == NULL)
++    if (ptr == NULL) {
++        smux_peer_cleanup(sock);
+         return -1;
++    }
+     packet_len += (ptr - data);
+-    if (length > packet_len) {
++    if ((size_t)length > packet_len) {
+         /*
+          * set length to receive only the first packet 
+          */
+@@ -779,18 +819,16 @@ smux_process(NETSNMP_SOCKET sock)
+     }
+ 
+     tmp_length = length;
+-    do
+-    {
++    do {
+        length = tmp_length;
+        length = recvfrom(sock, (char *) data, length, 0, NULL, NULL);
+-    }
+-    while((length == -1) && ((errno == EINTR) || (errno == EAGAIN)));
++    } while (length == -1 && errno == EINTR);
+ 
+     if (length <= 0) {
+-        /*
+-         * the peer went away, close this descriptor 
+-         * * and delete it from the list
+-         */
++        if (length < 0 &&
++            (errno == EAGAIN ||
++             (EAGAIN != EWOULDBLOCK && errno == EWOULDBLOCK)))
++            return 0;
+         DEBUGMSGTL(("smux",
+                     "[smux_process] peer on fd %" NETSNMP_FMT_SKT " died or timed out\n",
+                     sock));
+@@ -1918,11 +1956,6 @@ smux_peer_cleanup(NETSNMP_SOCKET sd)
+         }
+     }
+ 
+-    /*
+-     * decrement the peer count 
+-     */
+-    npeers--;
+-
+     /*
+      * make his auth available again 
+      */
+@@ -1933,6 +1966,8 @@ smux_peer_cleanup(NETSNMP_SOCKET sd)
+             snprint_objid(oid_name, sizeof(oid_name), Auths[i]->sa_oid,
+                           Auths[i]->sa_oid_len);
+             DEBUGMSGTL(("smux", "peer disconnected: %s\n", oid_name));
++            if (npeers > 0)
++                npeers--;
+         }
+     }
+ }
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 406d609ce38..ec55bd01802 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -31,6 +31,13 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://netsnmp-swinst-crash.patch \
            file://net-snmp-5.9.4-kernel-6.7.patch \
            file://CVE-2025-68615.patch \
+           file://0001-CHANGES-Remove-more-redundant-redeclarations.patch \
+           file://0002-fix-1098-as-suggested-by-Aisle-Research-to-prevent.patch \
+           file://0003-libsnmp-snmpd-Rename-socket-descriptor-arguments.patch \
+           file://0004-Windows-Fix-64-bit-compatibility-issues.patch \
+           file://0005-libsnmp-Move-transport-include-directives.patch \
+           file://0006-libsnmp-snmpd-Enable-TCP_NODELAY-on-TCP-sockets-to.patch \
+           file://CVE-2026-89147.patch \
           "
 SRC_URI[sha256sum] = "8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544"
 
