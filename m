Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09818CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:49:17 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15906.1792133353233753834
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bAOfr4uu;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13069; q=dns/txt;
  s=iport01; t=1792133353; x=1793342953;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QbHZGMHJbqSJJLB22feAI+uEzfTPmbwIFyyLMhRtpEQ=;
  b=bAOfr4uuqqaOfPx3xsfIa9cKxMTczpqAyE529S391uLs1JG2jZu0J/Kc
   WCPiLZqH+OoBvcatBZR2Q/AEiOhrh+mH5lShQLXbdIowMkwZVnrg1r3jN
   TVHHrH1OyaMm45AutiKZGMWBxk6Rzyj4ojHDWNpgH1TTCQfDt/Pv8mfTc
   Pgw/qpWea6l+V4AY1c1+d+oCSKa7Iq/6RD1nuBc+TNGv0uxCnTahFkjGg
   go49OFHF2x0+DQvIsQAF1zHCAZjDa5sJntRp44L+CGckzVaa6uXrEvKDy
   8+7OSZxYRUwcpKiIetp6C+6M+w5z4/9He/jaRarnOnNjy8bcQKBIJBRfL
   g==;
X-CSE-ConnectionGUID: V0JIuAXLQg21+aJKalW/0Q==
X-CSE-MsgGUID: OhLfUonVTbaXLWpw5YOA7A==
X-IPAS-Result: =?us-ascii?q?A0BGAgDLxdFq/5T/Ja1aglmCGD91YENJA5ZHkU2MUoF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFjhcCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEqCwEYAS0sAwECWiMhgwIBgnQDEbx6gXkzgQGDCh8BP?=
 =?us-ascii?q?wJDUNsyAQsUAYE4hUCII10YAYR8JxsbgXKBFYNpgQWBXAKBOIZtBIIiehKBW?=
 =?us-ascii?q?h5llERIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjG?=
 =?us-ascii?q?TZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALg?=
 =?us-ascii?q?Rs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6BaUUXIAENCEcxA?=
 =?us-ascii?q?SsgAm88G0QGkxwMCQiSNoE1n1oKKIN2jCKVOhozhASUF5JUC5h9jgqVNQUtG?=
 =?us-ascii?q?ANNhGmBaDyBWXAVO4JnCUoZD44uCwuBFAECgknOWicyAgEIAy8BAQcCBw4DC?=
 =?us-ascii?q?4FokAGBfQEB?=
IronPort-Data: A9a23:kVqXRaCIgxn9ExVW/3niw5YqxClBgxIJ4kV8jS/XYbTApDpw3zMBz
 GFOWjyBbqyMamf9ftsnbt+0/BgBscLRyYcwOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQf8hWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE/a1MLVwfDakh9bwuQmhs1
 vUcF3dVV0XW7w626OrTpuhEnM8vKozveYgYoHwllGifBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY/BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FEqjeOxa4SEIbRmQ+1ynmKWm
 2XAwVjzCyE+C8SAlAui2y2F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++NukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:Ghdlzq+9mx16rOR+pwduk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3AmalOGmtwxSN7OC3zq6yReVk+6IsbKl/80V7gB3a?=
 =?us-ascii?q?3Uz8qQZ+2QFuvv/tdxp8=3D?=
X-Talos-MUID: 9a23:o2WTMAa7ExsiQ+BTkD/IigxlMvlU6a2eLH8Vjsg3nODbHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535343693"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:49:12 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 0ECCD1800014B;
	Fri, 16 Oct 2026 06:49:12 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id ACAB0CC1611; Thu, 15 Oct 2026 23:49:11 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-networking][wrynose][PATCH] net-snmp: fix CVE-2026-89147
Date: Thu, 15 Oct 2026 23:49:08 -0700
Message-Id: <20261016064908.3918952-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131069

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix [1] for CVE-2026-89147
as shown in the advisory identifying the fix [2].

[1] https://github.com/net-snmp/net-snmp/commit/ad843e83da1c229847ae7884dc08311fad680389
[2] https://ubuntu.com/security/CVE-2026-89147

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../net-snmp/net-snmp/CVE-2026-89147.patch    | 399 ++++++++++++++++++
 .../net-snmp/net-snmp_5.9.5.2.bb              |   1 +
 2 files changed, 400 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2026-89147.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2026-89147.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2026-89147.patch
new file mode 100644
index 0000000000..b158a92791
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2026-89147.patch
@@ -0,0 +1,399 @@
+From 6d5668341de9d91f0e4e9d71e36f4141fdb9a528 Mon Sep 17 00:00:00 2001
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
+
+CVE: CVE-2026-89147
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/ad843e83da1c229847ae7884dc08311fad680389]
+
+Backport Changes:
+- Retain int sockets, -1 errors, and the older accept() check.
+- Use %d because 5.9.5.2 lacks NETSNMP_FMT_SKT.
+- Omit netsnmp_set_tcp_nodelay(), absent in 5.9.5.2.
+- Include snmpSocketBaseDomain.h for the nonblocking helper.
+
+(cherry picked from commit ad843e83da1c229847ae7884dc08311fad680389)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ agent/mibgroup/smux/smux.c | 245 +++++++++++++++++++++----------------
+ 1 file changed, 141 insertions(+), 104 deletions(-)
+
+diff --git a/agent/mibgroup/smux/smux.c b/agent/mibgroup/smux/smux.c
+index 078c4c6fa..5778f3590 100644
+--- a/agent/mibgroup/smux/smux.c
++++ b/agent/mibgroup/smux/smux.c
+@@ -64,6 +64,7 @@
+ #include <net-snmp/net-snmp-includes.h>
+ #include <net-snmp/agent/net-snmp-agent-includes.h>
+ #include <net-snmp/library/tools.h>
++#include <net-snmp/library/snmpSocketBaseDomain.h>
+ 
+ #include "smux.h"
+ #include "snmpd.h"
+@@ -92,6 +93,8 @@ static void     smux_send_close(int, int);
+ static void     smux_list_detach(smux_reg **, smux_reg *);
+ static void     smux_replace_active(smux_reg *, smux_reg *);
+ static void     smux_peer_cleanup(int);
++static int      smux_peer_is_authenticated(int);
++static void     smux_auth_timeout_cb(unsigned int, void *);
+ static int      smux_auth_peer(oid *, size_t, char *, int);
+ static int      smux_build(u_char, long, oid *,
+                            size_t *, u_char, u_char *, size_t, u_char *,
+@@ -623,138 +626,175 @@ var_smux_write(int action,
+ }
+ 
+ 
++static int
++smux_peer_is_authenticated(int sd)
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
++    int fd = (int)(uintptr_t)clientarg;
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
++                    "[smux_auth_timeout] closing idle unauthenticated fd %d\n", fd));
++        close(fd);
++        smux_snmp_select_list_del(fd);
++    }
++}
++
+ int
+ smux_accept(int sd)
+ {
+-    u_char          data[SMUXMAXPKTSIZE], *ptr, type;
+     struct sockaddr_in in_socket;
+-    struct timeval  tv;
+-    int             fail, fd;
++    int  fd;
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
+      */
+     DEBUGMSGTL(("smux", "[smux_accept] Calling accept()\n"));
+     errno = 0;
+-    if ((fd = (int) accept(sd, (struct sockaddr *) &in_socket, &alen)) < 0) {
++    fd = accept(sd, (struct sockaddr *) &in_socket, &alen);
++    if (fd < 0) {
+         snmp_log_perror("[smux_accept] accept failed");
+         return -1;
+-    } else {
+-        DEBUGMSGTL(("smux", "[smux_accept] accepted fd %d from %s:%d\n",
+-                 fd, inet_ntoa(in_socket.sin_addr),
+-                 ntohs(in_socket.sin_port)));
+-        if (npeers + 1 == SMUXMAXPEERS) {
+-            snmp_log(LOG_ERR,
+-                     "[smux_accept] denied peer on fd %d, limit %d reached",
+-                     fd, SMUXMAXPEERS);
+-            close(fd);
+-            return -1;
+-        }
++    }
++
++    netsnmp_set_non_blocking_mode(fd, TRUE);
++    DEBUGMSGTL(("smux", "[smux_accept] accepted fd %d from %s:%d\n",
++             fd, inet_ntoa(in_socket.sin_addr),
++             ntohs(in_socket.sin_port)));
++    if (npeers + 1 == SMUXMAXPEERS) {
++        snmp_log(LOG_ERR,
++                 "[smux_accept] denied peer on fd %d, limit %d reached",
++                 fd, SMUXMAXPEERS);
++        close(fd);
++        return -1;
++    }
++
++    snmp_alarm_register(5, 0, smux_auth_timeout_cb, (void *)(intptr_t)fd);
++
++    return fd;
++}
++
++int
++smux_process(int sock)
++{
++    int             length, tmp_length;
++    u_char          data[SMUXMAXPKTSIZE];
++    u_char          type, *ptr;
++    size_t          packet_len, len;
++    int             fail;
+ 
++    if (!smux_peer_is_authenticated(sock)) {
+         /*
+-         * now block for an OpenPDU 
++         * Unauthenticated peer: read OpenPDU non-blockingly.
+          */
+-        do
+-        {
+-           length = recvfrom(fd, (char *) data, SMUXMAXPKTSIZE, 0, NULL, NULL);
+-        }
+-        while((length == -1) && ((errno == EINTR) || (errno == EAGAIN)));
++        do {
++            length = recvfrom(sock, (char *) data, SMUXMAXPKTSIZE, 0, NULL, NULL);
++        } while (length == -1 && errno == EINTR);
+ 
+-        if (length <= 0) {
++        if (length < 0) {
++            if (errno == EAGAIN ||
++                (EAGAIN != EWOULDBLOCK && errno == EWOULDBLOCK))
++                return 0;
+             DEBUGMSGTL(("smux",
+-                        "[smux_accept] peer on fd %d died or timed out\n",
+-                        fd));
+-            close(fd);
++                        "[smux_process] recvfrom failed on unauthenticated fd %d\n", sock));
++            close(sock);
++            return -1;
++        }
++        if (length == 0) {
++            DEBUGMSGTL(("smux",
++                        "[smux_process] peer on fd %d closed connection before auth\n", sock));
++            close(sock);
+             return -1;
+         }
++
+         /*
+-         * try to authorize him 
++         * Try to authorize peer.
+          */
+         ptr = data;
+         len = length;
+         if ((ptr = asn_parse_header(ptr, &len, &type)) == NULL) {
+-            smux_send_close(fd, SMUXC_PACKETFORMAT);
+-            close(fd);
+-            DEBUGMSGTL(("smux", "[smux_accept] peer on %d sent bad open", fd));
++            smux_send_close(sock, SMUXC_PACKETFORMAT);
++            close(sock);
++            DEBUGMSGTL(("smux",
++                        "[smux_process] peer on %d sent bad open\n",
++                        sock));
+             return -1;
+         } else if (type != (u_char) SMUX_OPEN) {
+-            smux_send_close(fd, SMUXC_PROTOCOLERROR);
+-            close(fd);
++            smux_send_close(sock, SMUXC_PROTOCOLERROR);
++            close(sock);
+             DEBUGMSGTL(("smux",
+-                        "[smux_accept] peer on %d did not send open: (%d)\n",
+-                        fd, type));
++                        "[smux_process] peer on %d did not send open: (%d)\n",
++                        sock, type));
+             return -1;
+         }
+-        ptr = smux_open_process(fd, ptr, &len, &fail);
++        ptr = smux_open_process(sock, ptr, &len, &fail);
+         if (fail) {
+-            smux_send_close(fd, SMUXC_AUTHENTICATIONFAILURE);
+-            close(fd);
++            smux_send_close(sock, SMUXC_AUTHENTICATIONFAILURE);
++            close(sock);
+             DEBUGMSGTL(("smux",
+-                        "[smux_accept] peer on %d failed authentication\n",
+-                        fd));
++                        "[smux_process] peer on %d failed authentication\n",
++                        sock));
+             return -1;
+         }
+ 
+-        /*
+-         * he's OK 
+-         */
+-#ifdef SO_RCVTIMEO
+-        if (setsockopt
+-            (fd, SOL_SOCKET, SO_RCVTIMEO, (void *) &tv, sizeof(tv)) < 0) {
+-            DEBUGMSGTL(("smux",
+-                        "[smux_accept] setsockopt(SO_RCVTIMEO) failed fd %d\n",
+-                        fd));
+-            snmp_log_perror("smux_accept: setsockopt SO_RCVTIMEO");
+-        }
+-#endif
+         npeers++;
+-        DEBUGMSGTL(("smux", "[smux_accept] fd %d\n", fd));
++        DEBUGMSGTL(("smux", "[smux_process] authenticated peer on fd %d\n", sock));
+ 
+         /*
+-         * Process other PDUs already read, e.g. a registerRequest. 
++         * Process other PDUs already read, e.g. a registerRequest.
+          */
+         len = length - (ptr - data);
+-        if (smux_pdu_process(fd, ptr, len) < 0) {
+-            /*
+-             * Easy come, easy go.  Clean-up is already done. 
+-             */
+-            return -1;
++        if (len > 0) {
++            if (smux_pdu_process(sock, ptr, len) < 0) {
++                return -1;
++            }
+         }
++        return 0;
+     }
+-    return fd;
+-}
+ 
+-int
+-smux_process(int fd)
+-{
+-    int             length, tmp_length;
+-    u_char          data[SMUXMAXPKTSIZE];
+-    u_char          type, *ptr;
+-    size_t          packet_len;
+-
+-    do
+-    {
+-       length = recvfrom(fd, (char *) data, SMUXMAXPKTSIZE, MSG_PEEK, NULL,
++    /*
++     * Authenticated peer: process incoming data.
++     */
++    do {
++       length = recvfrom(sock, (char *) data, SMUXMAXPKTSIZE, MSG_PEEK, NULL,
+                          NULL);
+-    }
+-    while((length == -1) && ((errno == EINTR) || (errno == EAGAIN)));
++    } while (length == -1 && errno == EINTR);
+ 
+-    if (length <= 0)
+-    {
+-       if (length < 0)
+-           snmp_log_perror("[smux_process] peek failed");
+-       smux_peer_cleanup(fd);
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
++                    "[smux_process] peer on fd %d died or disconnected\n",
++                    sock));
++        smux_peer_cleanup(sock);
++        return -1;
+     }
+ 
+     /*
+@@ -762,10 +802,12 @@ smux_process(int fd)
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
+@@ -773,26 +815,24 @@ smux_process(int fd)
+     }
+ 
+     tmp_length = length;
+-    do
+-    {
++    do {
+        length = tmp_length;
+-       length = recvfrom(fd, (char *) data, length, 0, NULL, NULL);
+-    }
+-    while((length == -1) && ((errno == EINTR) || (errno == EAGAIN)));
++       length = recvfrom(sock, (char *) data, length, 0, NULL, NULL);
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
+@@ -1907,11 +1947,6 @@ smux_peer_cleanup(int sd)
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
+@@ -1922,6 +1957,8 @@ smux_peer_cleanup(int sd)
+             snprint_objid(oid_name, sizeof(oid_name), Auths[i]->sa_oid,
+                           Auths[i]->sa_oid_len);
+             DEBUGMSGTL(("smux", "peer disconnected: %s\n", oid_name));
++            if (npeers > 0)
++                npeers--;
+         }
+     }
+ }
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
index d5e2931969..1e3d1eba9a 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
@@ -25,6 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://0010-net-snmp-Reproducibility-Don-t-check-build-host-for.patch \
            file://0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch \
            file://netsnmp-swinst-crash.patch \
+           file://CVE-2026-89147.patch \
            "
 SRC_URI[sha256sum] = "16707719f833184a4b72835dac359ae188123b06b5e42817c00790d7dc1384bf"
 
-- 
2.35.6


