Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36086.1793161598401299708
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tASTj9E6;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so341586a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161598; x=1793766398; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F9rXPvfGNYiT4gWAXwbblK7F2TKoV1/vjUjAvRZAT24=;
        b=tASTj9E6umqz/nfpAqqrXyHakfdbgkDSsK1oRZs5PS1twzfCPTxjkEzx7plU8eB1S3
         gxbhPcWuBft89CXUiyWxYZy/vlldYOlr+kIqZSt4ZFbSC0Dn6s7luQ/3xCIqWabODl+I
         JEfjrzvEp/Db3gk4Ignp9znjIqFFzroEdjG1u+Il9wFwo1McWrPDNIs/xHXSCSAuED++
         VZs4REPtWrFY95eg/qxsGOac5HGXJWyrPIn/pooT7CJTSPJtkRe0MSm3Dp04Hvirfy3p
         Ln0H0sJx53GrbSik8FXXrd2tDT0AZ37eW+f3LzuRqPEw8CAmJwqIfGmTDQo1wjkFTUb4
         rJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161598; x=1793766398;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F9rXPvfGNYiT4gWAXwbblK7F2TKoV1/vjUjAvRZAT24=;
        b=N4mkBPb94gA9HCDEMezgvkIRTFiu4bLOHSU9r0n9eBPR1JqAXKYIYOIWtv3enAzMXV
         LzXASEiiIn2i7bnLlbIpAifTZPSMJ9EH6g4mP+WAjz5R7fTze5qFBWjkW6Tn2mg5Fhma
         FMKcu4v842EtDPqiXXiRgeIun1sUGEXBYGhMbPfxE8ql1Km++h/2zdageFvnenvLIaFw
         tIb8j64yQHpw4+KJUhf3VjSzKrbj77igEQ94Jb1IeWuib3leQTubUNT20+HLVtNksrgN
         uV/GrKuUeUDNen7+84TWnyU8MDqkf5LAQbdv9WjQNwB5wVnvcrTwbujZEEcEl6D8MrSQ
         Anug==
X-Gm-Message-State: AFq9FYItsK69dTnQYJ4rM32ETt9li2W0FsNt8tPBv//CV7W06Qtw73Nu
	8tld14DaDLBYNYY3LdHyPQg9WKPavXTO+HBes+q4gcLfYAvY0OiXR0SS52dl9A==
X-Gm-Gg: AYBFou1LyiGnNdIEFy8ki+ZkOkiCLLQCHMtsH9NDHWM/JYVVcR1oibkzDKE5jAJM8qj
	8nGLgxEJBsDSKhkj18zgdSD3GnC2uBhj093Vn9ckU/iScSCeMT4svfC+TNg01U4jmEiOtczj4J5
	Faj2FqUZ9osFMuQXIFf7ffztmAZIa1YxgCYmnSbCRNcTEsAttvJBKmZAKZOWxtBLKbCkP+ZvCfq
	aOwWf0lWDIfFrt7IDO6Cop1ZRhCFwvyHLOA0MGDVmia7cWXQWxxCsrLN0cjj55Cfe8lgrR7RF6X
	7nKCEi9DGf5bYAqARhXZUJfbwu+XyOuO7vI4DNX0lLA7UMvgHGK+em9s+UkWS8nLvLIDPpYFnDT
	bbGaMOFNtbHrP6WkwhBxpnKmuCWLLdAFqm0O2frHDLkrAyj+iTprXF0pumdslSfvi402i8OJ3Ky
	EzBocgmn7ksegPATXjUXRjZX0IbYT5hpyBpuHs/mbR/VBqAChRFnZXZ5aG5wS0S37BJi/H1jiVA
	eLpQYaJD0Amvci+0Aj7rw9sjgkAZ/RmV3ZmGPMmlXU4TiNu/63N7wwP3PD0UwCeUHckVcje+e/E
	oaKNskDbYKWy4ShLDDUXwdyRJin3Mj+Q8mWrDLnfj0P8ggrWcGB844pQj0thFBfxcZeVAC+tq87
	ko8MeNmo=
X-Received: by 2002:a17:90a:e70e:b0:3ab:c674:cad9 with SMTP id 98e67ed59e1d1-3ae582cdc66mr908340a91.54.1793161594360;
        Tue, 27 Oct 2026 21:26:34 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:26:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [blacksail][PATCH 58/60] c-ares: backport security fixes from 1.34.9
Date: Wed, 28 Oct 2026 17:23:56 +1300
Message-ID: <0d9abd6842ad294764f3c7c11791adcb92bd5d10.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131611
Content-Type: text/plain; charset="utf-8"

From: Jason Schonberg <schonm@gmail.com>

Add the eight unique upstream commits that fix the security advisories addressed in c-ares 1.34.9.
Several advisories share commits, so patches are ordered by commit rather than duplicated per advisory; each patch lists the GHSA IDs it resolves.

Assisted-by: opencode (big-pickle)
Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...troy-detach-queries-before-callbacks.patch | 2603 +++++++++++++++++
 ...ed-socket-server-state-notifications.patch |  393 +++
 ...qcache-hand-callbacks-their-own-copy.patch | 1054 +++++++
 ...connections-torn-down-by-application.patch | 1107 +++++++
 ...pt-an-answer-on-the-right-connection.patch |  575 ++++
 ...tions-read-channel-config-under-lock.patch |  243 ++
 ...res_inet_pton-reject-a-prefix-length.patch |  364 +++
 ...nt-drop-UDP-answers-from-server-port.patch |  178 ++
 .../recipes-support/c-ares/c-ares_1.34.8.bb   |    8 +
 9 files changed, 6525 insertions(+)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-ares_cancel-ares_destroy-detach-queries-before-callbacks.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0002-Deliver-deferred-socket-server-state-notifications.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0003-ares_qcache-hand-callbacks-their-own-copy.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0004-Handle-connections-torn-down-by-application.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0005-ares_process-only-accept-an-answer-on-the-right-connection.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0006-ares_save_options-read-channel-config-under-lock.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0007-ares_inet_pton-reject-a-prefix-length.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0008-ares_conn_read-dont-drop-UDP-answers-from-server-port.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-ares_cancel-ares_destroy-detach-queries-before-callbacks.patch b/meta-oe/recipes-support/c-ares/c-ares/0001-ares_cancel-ares_destroy-detach-queries-before-callbacks.patch
new file mode 100644
index 0000000000..385760f5bc
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0001-ares_cancel-ares_destroy-detach-queries-before-callbacks.patch
@@ -0,0 +1,2603 @@
+From 7f408deb128fbdcce78122322734ffaa01cad9ae Mon Sep 17 00:00:00 2001
+From: Brad House <brad@brad-house.com>
+Date: Sun, 18 Oct 2026 18:15:41 -0400
+Subject: [PATCH] ares_cancel/ares_destroy: detach queries before running user
+ callbacks
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Backport of dd62bdfca52ba5c37e88a1469c0a4c5e4a568ccb to v1.34.  See that
+commit for the full description; it hardens reentrant teardown from
+callbacks (ares_cancel(), ares_destroy(), server reconfiguration, and
+socket/server state notifications).
+
+Conflicts were whitespace/alignment only (v1.34 predates the clang-format
+reformat in #1238) and were reformatted to v1.34's style.
+
+Also carries the test portion of #1334 that applies to the tests this
+introduces: dead-server tests use 127.0.0.1:53055/53056 instead of
+127.0.0.55/56, which only routes on Linux.
+
+Signed-off-by: Brad House <brad@brad-house.com>
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/7f408deb128fbdcce78122322734ffaa01cad9ae]
+GHSA: GHSA-wpr3-8q3r-4q8c, GHSA-97vq-4mxv-7vhm, GHSA-mw23-pfg6-2x9r, GHSA-rf6g-ww74-97qh, GHSA-v33j-65h4-4ch8, GHSA-pj7p-v3cw-hq66
+---
+ docs/ares_cancel.3                    |   17 +
+ docs/ares_destroy.3                   |    7 +
+ docs/ares_init_options.3              |   15 +
+ docs/ares_set_server_state_callback.3 |   31 +-
+ docs/ares_set_servers_csv.3           |   17 +
+ src/lib/ares_cancel.c                 |   25 +-
+ src/lib/ares_close_sockets.c          |   82 +-
+ src/lib/ares_conn.c                   |  217 ++++-
+ src/lib/ares_conn.h                   |   37 +-
+ src/lib/ares_destroy.c                |   85 +-
+ src/lib/ares_private.h                |  110 ++-
+ src/lib/ares_process.c                |  235 +++++-
+ src/lib/ares_send.c                   |   35 +
+ src/lib/ares_update_servers.c         |   42 +-
+ test/ares-test-mock.cc                | 1068 +++++++++++++++++++++++++
+ 15 files changed, 1959 insertions(+), 64 deletions(-)
+
+diff --git a/docs/ares_cancel.3 b/docs/ares_cancel.3
+index 967a946b49..069f226c10 100644
+--- a/docs/ares_cancel.3
++++ b/docs/ares_cancel.3
+@@ -21,6 +21,23 @@ These calls give the callbacks a chance to clean up any state which might have
+ been stored in their arguments. If such a callback invocation adds a new
+ request to the channel, that request will \fInot\fP be cancelled by the
+ current invocation of \fBares_cancel(3)\fP.
++.SH REENTRANCY
++A callback invoked by
++.BR ares_cancel (3)
++may call c-ares functions on the same channel. The channel lock is recursive,
++and each query is unlinked from the library's internal structures before its
++callback runs, so a reentrant call cannot encounter a query that is part-way
++through being torn down.
++
++This includes starting new lookups, as described above, and reconfiguring the
++server list with
++.BR ares_set_servers_csv (3)
++and related functions.
++
++.SH AVAILABILITY
++The reentrancy guarantee described above applies as of c-ares version 1.35.0,
++and c-ares version 1.34.9 on the 1.34 branch.
++
+ .SH SEE ALSO
+ .BR ares_init (3)
+ .BR ares_destroy (3)
+diff --git a/docs/ares_destroy.3 b/docs/ares_destroy.3
+index d1984b7cc9..0b6380e609 100644
+--- a/docs/ares_destroy.3
++++ b/docs/ares_destroy.3
+@@ -20,6 +20,13 @@ by the channel.
+ channel, passing a status of \fIARES_EDESTRUCTION\fP. These calls give the
+ callbacks a chance to clean up any state which might have been stored in their
+ arguments. A callback must not add new requests to a channel being destroyed.
++Such a request is refused: the request is not started, and its callback is
++invoked with a status of \fIARES_EDESTRUCTION\fP so that any state attached to
++its argument can be released. A request made from within that notification is
++refused without a further notification, so that a callback which responds to
++failure by retrying cannot recurse without bound; its argument is not handed
++back. This applies as of c-ares version 1.35.0, and c-ares version 1.34.9 on
++the 1.34 branch.
+ 
+ There is no ability to make this function thread-safe.  No additional calls
+ using this channel may be made once this function is called.
+diff --git a/docs/ares_init_options.3 b/docs/ares_init_options.3
+index 9b3b481535..e6f6ee8ba6 100644
+--- a/docs/ares_init_options.3
++++ b/docs/ares_init_options.3
+@@ -231,6 +231,21 @@ will be passed the socket whose state has changed;
+ will be set to true if the socket should listen for read events, and
+ .I writable
+ will be set to true if the socket should listen for write events.
++
++This callback may call c-ares functions on the same channel, including
++.BR ares_cancel (3)
++and the server configuration functions. Notifications are delivered once the
++library has finished the work that produced them rather than part-way through
++it, so a reentrant call cannot close a socket the library is still using. They
++arrive in the order the state changes occurred, and always before the
++outermost c-ares call returns. A call made from within a callback is not the
++outermost one, so notifications it produces arrive after it has returned.
++.BR ares_destroy (3)
++is no exception: the closure of every socket the channel still holds is
++reported before it returns, and the callback is never invoked afterwards.
++This applies as of c-ares version 1.35.0, and c-ares version 1.34.9 on the
++1.34 branch.
++
+ The value of
+ .I sock_state_cb_data
+ will be passed as the
+diff --git a/docs/ares_set_server_state_callback.3 b/docs/ares_set_server_state_callback.3
+index 04fbde4c7a..e95db327ce 100644
+--- a/docs/ares_set_server_state_callback.3
++++ b/docs/ares_set_server_state_callback.3
+@@ -47,6 +47,31 @@ the DNS servers used by an ares channel. For example, it can be used to track
+ metrics about the numbers and types of queries sent to each server or to
+ detect when a server is uncontactable or unhealthy.
+ 
++.SH REENTRANCY
++The server state callback may call c-ares functions on the same channel,
++including
++.BR ares_cancel (3)
++and the server configuration functions. The channel lock is recursive and the
++library holds no query, connection or server state across the callback.
++
++Notifications are queued and delivered once the library has finished the work
++that produced them, rather than part-way through it. A notification is
++therefore observed after the processing pass that generated it, not during.
++
++The callback and its
++.I user_data
++are read when the notification is delivered, not when it is queued. An
++application that replaces its callback between those two points will see the
++notification delivered to the new one; unregistering by passing a
++.B NULL
++callback discards any notification still queued.
++
++This applies to a replacement made from within a c-ares callback, where the
++channel lock is held.
++.BR ares_set_server_state_callback (3)
++does not take the channel lock, so replacing the callback from another thread
++while the channel is processing is not synchronized against delivery.
++
+ .SH FLAGS
+ .TP 5
+ .B ARES_SERV_STATE_UDP
+@@ -58,5 +83,9 @@ Indicates that the query was tried over TCP.
+ .SH AVAILABILITY
+ This function was first introduced in c-ares version 1.29.0.
+ 
++The reentrancy guarantee described above applies as of c-ares version 1.35.0,
++and c-ares version 1.34.9 on the 1.34 branch.
++
+ .SH SEE ALSO
+-.BR ares_get_servers_csv (3)
++.BR ares_get_servers_csv (3),
++.BR ares_cancel (3)
+diff --git a/docs/ares_set_servers_csv.3 b/docs/ares_set_servers_csv.3
+index f1435143f5..f9f5b82e28 100644
+--- a/docs/ares_set_servers_csv.3
++++ b/docs/ares_set_servers_csv.3
+@@ -126,6 +126,23 @@ are identical.  Prior versions would simply omit ports in \fBares_set_servers_cs
+ but due to the addition of link local interface support, this difference was
+ removed.
+ 
++.SH REENTRANCY
++These functions may be called from within a c-ares callback. Removing a server
++closes its connections, which ends the lookups that were using it and invokes
++their callbacks, so a reconfiguration can be requested from inside one.
++
++A nested call reconciles the whole server list, and the outer call leaves that
++result in place rather than deleting the servers the nested call installed.
++The consequence is that the outer call's own list does not survive, even
++though it returns
++.B ARES_SUCCESS:
++the last configuration applied is the one the channel keeps. An application
++that reconfigures from a callback should therefore not assume the list it
++passed to the outer call is in effect when that call returns.
++
++This applies as of c-ares version 1.35.0, and c-ares version 1.34.9 on the
++1.34 branch.
++
+ .SH EXAMPLE
+ .nf
+ 192.168.1.100,[fe80::1]:53%eth0,dns://192.168.1.1?tcpport=1153
+diff --git a/src/lib/ares_cancel.c b/src/lib/ares_cancel.c
+index 75600dea6b..aa167e4486 100644
+--- a/src/lib/ares_cancel.c
++++ b/src/lib/ares_cancel.c
+@@ -38,10 +38,10 @@ void ares_cancel(ares_channel_t *channel)
+   }
+ 
+   ares_channel_lock(channel);
++  ares_deferred_cb_enter(channel);
+ 
+   if (ares_llist_len(channel->all_queries) > 0) {
+     ares_llist_node_t *node = NULL;
+-    ares_llist_node_t *next = NULL;
+ 
+     /* Swap list heads, so that only those queries which were present on entry
+      * into this function are cancelled. New queries added by callbacks of
+@@ -57,21 +57,29 @@ void ares_cancel(ares_channel_t *channel)
+       goto done;                        /* LCOV_EXCL_LINE: OutOfMemory */
+     }
+ 
+-    node = ares_llist_node_first(list_copy);
+-    while (node != NULL) {
++    /* Re-read the head each iteration rather than caching the next node: a
++     * callback below may cause other queries in this same list to be ended
++     * and their nodes destroyed. */
++    while ((node = ares_llist_node_first(list_copy)) != NULL) {
+       ares_query_t *query;
+ 
+-      /* Cache next since this node is being deleted */
+-      next = ares_llist_node_next(node);
++      query = ares_llist_node_claim(node);
+ 
+-      query                   = ares_llist_node_claim(node);
++      /* Must come first: node_claim() already destroyed this node, so
++       * ares_detach_query() would otherwise destroy it a second time. */
+       query->node_all_queries = NULL;
+ 
++      /* Detach from queries_by_qid, the connection and the timeout list
++       * before running user code.  Otherwise a reentrant teardown from
++       * within the callback -- ares_set_servers_csv(), or a new query
++       * hitting a connection error -- still finds this query, ends it a
++       * second time and frees it, and the ares_free_query() below then
++       * double-frees. */
++      ares_detach_query(query);
++
+       /* NOTE: its possible this may enqueue new queries */
+       query->callback(query->arg, ARES_ECANCELLED, 0, NULL);
+       ares_free_query(query);
+-
+-      node = next;
+     }
+ 
+     ares_llist_destroy(list_copy);
+@@ -83,5 +91,6 @@ void ares_cancel(ares_channel_t *channel)
+   ares_queue_notify_empty(channel);
+ 
+ done:
++  ares_deferred_cb_leave(channel);
+   ares_channel_unlock(channel);
+ }
+diff --git a/src/lib/ares_close_sockets.c b/src/lib/ares_close_sockets.c
+index 7bb72c31ec..6be662fdd3 100644
+--- a/src/lib/ares_close_sockets.c
++++ b/src/lib/ares_close_sockets.c
+@@ -41,12 +41,47 @@ static void ares_requeue_queries(ares_conn_t  *conn,
+   }
+ }
+ 
++/*! Release a connection's memory.  Split from the unlink below so that the
++ *  two can happen at different times: a caller further up the stack may still
++ *  hold this pointer, and reading a detached connection is safe where reading
++ *  a freed one is not. */
++void ares_conn_reap(ares_conn_t *conn)
++{
++  if (conn == NULL) {
++    return; /* LCOV_EXCL_LINE: DefensiveCoding */
++  }
++
++  ares_buf_destroy(conn->in_buf);
++  ares_buf_destroy(conn->out_buf);
++  ares_llist_destroy(conn->queries_to_conn);
++  ares_free(conn);
++}
++
+ void ares_close_connection(ares_conn_t *conn, ares_status_t requeue_status)
+ {
+-  ares_server_t  *server  = conn->server;
+-  ares_channel_t *channel = server->channel;
++  ares_server_t  *server;
++  ares_channel_t *channel;
++
++  if (conn == NULL) {
++    return; /* LCOV_EXCL_LINE: DefensiveCoding */
++  }
++
++  /* Already torn down and awaiting reclamation.  Reaching here twice is
++   * ordinary once a connection can outlive its teardown: a caller holding it
++   * from before -- handle_conn_error() after a failed write, say -- closes it
++   * again without knowing.  Doing the work twice would requeue queries that
++   * have already moved and would put this connection on the pending list a
++   * second time, which is a double free. */
++  if (conn->flags & ARES_CONN_FLAG_DEAD) {
++    return;
++  }
+ 
+-  /* Unlink */
++  server  = conn->server;
++  channel = server->channel;
++
++  /* Unlink from everything that can find this connection.  After this it is
++   * unreachable by lookup, which is what stops anything new from picking it
++   * up; anything that already holds it is handled by the deferral below. */
+   ares_llist_node_claim(
+     ares_htable_asvp_get_direct(channel->connnode_by_socket, conn->fd));
+   ares_htable_asvp_remove(channel->connnode_by_socket, conn->fd);
+@@ -55,19 +90,40 @@ void ares_close_connection(ares_conn_t *conn, ares_status_t requeue_status)
+     server->tcp_conn = NULL;
+   }
+ 
+-  ares_buf_destroy(conn->in_buf);
+-  ares_buf_destroy(conn->out_buf);
++  /* Marked dead as soon as it is unlinked, before anything below can run
++   * application code.  ares_requeue_queries() ends queries terminally once
++   * their retries are exhausted, which invokes the application's callback; if
++   * the flag were set after that, a second ares_close_connection() reaching
++   * this connection in the meantime would run the body again -- closing the
++   * descriptor twice and listing the connection for reclamation twice, which
++   * is a double free.  It also gives ares_close_sockets() its termination
++   * condition: dead implies unlinked, so its re-read-the-head loop cannot see
++   * a dead connection and spin. */
++  conn->flags |= ARES_CONN_FLAG_DEAD;
+ 
+   /* Requeue queries to other connections */
+   ares_requeue_queries(conn, requeue_status);
+ 
+-  ares_llist_destroy(conn->queries_to_conn);
+-
+-  ares_conn_sock_state_cb_update(conn, ARES_CONN_STATE_NONE);
+-
+-  ares_socket_close(channel, conn->fd);
++  /* Hands the descriptor to the queued notification when one is due, so the
++   * application is told to stop watching it before it is closed.  Otherwise
++   * nothing will carry it and we close it here. */
++  if (!ares_conn_sock_state_cb_close(conn)) {
++    ares_socket_close(channel, conn->fd);
++  }
++  conn->fd = ARES_SOCKET_BAD;
++
++  /* If a library call is in progress it may be holding this connection --
++   * read_answers() and ares_send_query_int() both do, across code that can
++   * reach here.  Keep it readable until that call unwinds.  The buffers and
++   * the query list are freed by ares_conn_reap(), so a stale holder sees an
++   * emptied connection rather than freed memory. */
++  if (channel->deferred_cb_depth > 0) {
++    conn->next_pending     = channel->pending_conns;
++    channel->pending_conns = conn;
++    return;
++  }
+ 
+-  ares_free(conn);
++  ares_conn_reap(conn);
+ }
+ 
+ void ares_close_sockets(ares_server_t *server)
+@@ -76,6 +132,10 @@ void ares_close_sockets(ares_server_t *server)
+ 
+   while ((node = ares_llist_node_first(server->connections)) != NULL) {
+     ares_conn_t *conn = ares_llist_node_val(node);
++    /* This loop re-reads the head each time and relies on the close below
++     * unlinking it.  A dead connection returns early without unlinking, so
++     * one on this list would spin forever holding the channel lock. */
++    assert(!(conn->flags & ARES_CONN_FLAG_DEAD));
+     ares_close_connection(conn, ARES_SUCCESS);
+   }
+ }
+diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c
+index 6b315b0548..78f57e7d10 100644
+--- a/src/lib/ares_conn.c
++++ b/src/lib/ares_conn.c
+@@ -26,19 +26,210 @@
+  */
+ #include "ares_private.h"
+ 
+-void ares_conn_sock_state_cb_update(ares_conn_t            *conn,
+-                                    ares_conn_state_flags_t flags)
++/*! A queued socket-state notification.  Holds the descriptor and the state,
++ *  never the connection, so a queued entry cannot outlive what it refers to.
++ *
++ *  When \c owns_fd is set, this message carries the only remaining reference to
++ *  the descriptor: the connection is gone and the descriptor is deliberately
++ *  left open until after the application has been told to stop watching it.
++ *  Closing first would let the number be reused -- by application code running
++ *  from a deferred query callback, for instance -- before the notification
++ *  naming it is delivered. */
++typedef struct {
++  ares_socket_t fd;
++  ares_bool_t   readable;
++  ares_bool_t   writable;
++  ares_bool_t   owns_fd;
++} ares_sock_state_msg_t;
++
++static ares_bool_t ares_sock_state_queue(ares_channel_t              *channel,
++                                         const ares_sock_state_msg_t *msg)
+ {
+-  ares_channel_t *channel = conn->server->channel;
++  if (channel->sock_state_queue == NULL) {
++    channel->sock_state_queue = ares_array_create(sizeof(*msg), NULL);
++    if (channel->sock_state_queue == NULL) {
++      return ARES_FALSE; /* LCOV_EXCL_LINE: OutOfMemory */
++    }
++  }
++
++  if (ares_array_insertdata_last(channel->sock_state_queue, msg) !=
++      ARES_SUCCESS) {
++    return ARES_FALSE; /* LCOV_EXCL_LINE: OutOfMemory */
++  }
++
++  return ARES_TRUE;
++}
++
++/*! Deliver every socket-state notification the channel has queued.  Loops
++ *  rather than snapshotting: a callback is allowed to re-enter the library and
++ *  queue more, and those belong to this same delivery point. */
++static void ares_sock_state_dispatch(ares_channel_t *channel)
++{
++  while (ares_array_len(channel->sock_state_queue) > 0) {
++    ares_sock_state_msg_t msg;
++
++    if (ares_array_claim_at(&msg, sizeof(msg), channel->sock_state_queue, 0) !=
++        ARES_SUCCESS) {
++      break; /* LCOV_EXCL_LINE: DefensiveCoding */
++    }
+ 
+-  if ((conn->state_flags & ARES_CONN_STATE_CBFLAGS) != flags &&
+-      channel->sock_state_cb) {
+-    channel->sock_state_cb(channel->sock_state_cb_data, conn->fd,
+-                           flags & ARES_CONN_STATE_READ ? 1 : 0,
+-                           flags & ARES_CONN_STATE_WRITE ? 1 : 0);
++    if (channel->sock_state_cb != NULL) {
++      /* The public callback takes ints. */
++      channel->sock_state_cb(channel->sock_state_cb_data, msg.fd,
++                             msg.readable ? 1 : 0, msg.writable ? 1 : 0);
++    }
++
++    /* Told first, closed second -- the ordering the application depends on to
++     * keep its descriptor set honest. */
++    if (msg.owns_fd) {
++      ares_socket_close(channel, msg.fd);
++    }
++  }
++
++  ares_array_destroy(channel->sock_state_queue);
++  channel->sock_state_queue = NULL;
++}
++
++static void ares_deferred_cb_flush(ares_channel_t *channel)
++{
++  /* Only the outermost frame delivers: anything above us on the stack may
++   * still be holding the connection a reentrant call from one of these
++   * callbacks could free.
++   *
++   * The dispatch below counts as a nesting level of its own.  Without that, a
++   * callback that calls back into the library re-enters here through the
++   * enter/leave pair on that call, drains the rest of the queue and destroys
++   * it underneath the loop -- and hands the next notification to the
++   * application from inside the current one.  With the counter held, the
++   * nested leave returns immediately and whatever it queued is picked up by
++   * the loop that is already running. */
++  if (channel->deferred_cb_depth > 0) {
++    return;
++  }
++  channel->deferred_cb_depth++;
++
++  /* Both kinds of deferred notification share this one delivery point.  Loop
++   * rather than calling each once: a socket-state callback may put the library
++   * on a path that queues a server-state notification, and the reverse, and
++   * both belong to this delivery point rather than the next one. */
++  while (ares_array_len(channel->sock_state_queue) > 0 ||
++         ares_array_len(channel->server_state_queue) > 0) {
++    ares_sock_state_dispatch(channel);
++    ares_server_state_dispatch(channel);
++  }
++
++  /* The outermost call is unwinding and the callbacks above have run, so
++   * nothing can still be holding a server or connection that was unlinked
++   * during it.  Now they can be freed. */
++  ares_deferred_reclaim(channel);
++
++  channel->deferred_cb_depth--;
++}
++
++void ares_deferred_reclaim(ares_channel_t *channel)
++{
++  /* Connections first: a pending server's connection list is already empty,
++   * but this keeps the ordering obvious rather than incidental. */
++  while (channel->pending_conns != NULL) {
++    ares_conn_t *conn      = channel->pending_conns;
++    channel->pending_conns = conn->next_pending;
++    conn->next_pending     = NULL;
++    ares_conn_reap(conn);
++  }
++
++  while (channel->pending_servers != NULL) {
++    ares_server_t *server    = channel->pending_servers;
++    channel->pending_servers = server->next_pending;
++    server->next_pending     = NULL;
++    ares_server_reap(server);
++  }
++}
++
++void ares_deferred_cb_enter(ares_channel_t *channel)
++{
++  channel->deferred_cb_depth++;
++}
++
++void ares_deferred_cb_leave(ares_channel_t *channel)
++{
++  if (channel->deferred_cb_depth > 0) {
++    channel->deferred_cb_depth--;
++  }
++  ares_deferred_cb_flush(channel);
++}
++
++ares_bool_t ares_conn_sock_state_cb_close(ares_conn_t *conn)
++{
++  ares_channel_t       *channel = conn->server->channel;
++  ares_sock_state_msg_t msg;
++
++  /* No callback to run, so nothing will ever carry this descriptor: the
++   * caller closes it itself, exactly as before. */
++  if (channel->sock_state_cb == NULL) {
++    return ARES_FALSE;
++  }
++
++  /* Already reported as unwatched, so no notification is due and no message
++   * will be queued to hold the descriptor. */
++  if ((conn->state_flags & ARES_CONN_STATE_CBFLAGS) == ARES_CONN_STATE_NONE) {
++    return ARES_FALSE;
++  }
++
++  msg.fd       = conn->fd;
++  msg.readable = ARES_FALSE;
++  msg.writable = ARES_FALSE;
++  msg.owns_fd  = ARES_TRUE;
++
++  if (!ares_sock_state_queue(channel, &msg)) {
++    return ARES_FALSE; /* LCOV_EXCL_LINE: OutOfMemory */
+   }
+ 
+   conn->state_flags &= ~((unsigned int)ARES_CONN_STATE_CBFLAGS);
++
++  return ARES_TRUE;
++}
++
++void ares_conn_sock_state_cb_update(ares_conn_t            *conn,
++                                    ares_conn_state_flags_t flags)
++{
++  ares_channel_t       *channel = conn->server->channel;
++  ares_sock_state_msg_t msg;
++  ares_bool_t           changed = ARES_FALSE;
++
++  if ((conn->state_flags & ARES_CONN_STATE_CBFLAGS) != flags) {
++    changed = ARES_TRUE;
++  }
++
++  msg.fd       = conn->fd;
++  msg.readable = flags & ARES_CONN_STATE_READ ? ARES_TRUE : ARES_FALSE;
++  msg.writable = flags & ARES_CONN_STATE_WRITE ? ARES_TRUE : ARES_FALSE;
++  msg.owns_fd  = ARES_FALSE; /* the connection still owns it */
++
++  if (!changed || channel->sock_state_cb == NULL) {
++    conn->state_flags &= ~((unsigned int)ARES_CONN_STATE_CBFLAGS);
++    conn->state_flags |= flags;
++    return;
++  }
++
++  /* Queue rather than dispatch.  This runs in the middle of opening, writing
++   * to or closing a connection, and every caller keeps using that connection
++   * afterwards.  The callback is application code that may reentrantly call
++   * ares_cancel() or ares_set_servers_csv(), either of which frees the
++   * connection -- the first through the idle-connection sweep, the second by
++   * destroying the server that owns it.  Deliver once no frame still holds
++   * it.
++   *
++   * Only the descriptor and the state are captured, never the connection, and
++   * insertion order is preserved so the application observes the same
++   * sequence it would have seen inline. */
++  if (!ares_sock_state_queue(channel, &msg)) {
++    return; /* LCOV_EXCL_LINE: OutOfMemory */
++  }
++
++  /* Recorded as reported only now: on either failure above the connection
++   * stays eligible to notify again, rather than remembering a state the
++   * application was never told about. */
++  conn->state_flags &= ~((unsigned int)ARES_CONN_STATE_CBFLAGS);
+   conn->state_flags |= flags;
+ }
+ 
+@@ -435,6 +626,16 @@ ares_status_t ares_open_connection(ares_conn_t   **conn_out,
+     conn->flags |= ARES_CONN_FLAG_TFO_INITIAL;
+   }
+ 
++  /* The socket-configure and socket-create callbacks above are application
++   * code, and either may reconfigure the servers -- which destroys the ones
++   * the new configuration omits, including possibly this one.  Everything
++   * below dereferences it, starting with conn->server in
++   * ares_conn_set_self_ip(). */
++  if (!ares_server_in_channel(channel, server)) {
++    status = ARES_ECONNREFUSED;
++    goto done;
++  }
++
+   /* Need to store our own ip for DNS cookie support */
+   status = ares_conn_set_self_ip(conn, ARES_TRUE);
+   if (status != ARES_SUCCESS) {
+diff --git a/src/lib/ares_conn.h b/src/lib/ares_conn.h
+index c332de14b1..fc177b84f6 100644
+--- a/src/lib/ares_conn.h
++++ b/src/lib/ares_conn.h
+@@ -49,7 +49,14 @@ typedef enum {
+    *  it).  Its in-flight queries continue to drain and it is cleaned up once
+    *  idle.  This is a per-connection signal so that a transient failure does
+    *  not evict otherwise-healthy connections to the same server. */
+-  ARES_CONN_FLAG_NONEW = 1 << 3
++  ARES_CONN_FLAG_NONEW = 1 << 3,
++  /*! Connection has been torn down: unlinked from every lookup structure, its
++   *  descriptor closed or handed to a pending notification, and its queries
++   *  requeued.  It survives only so that a caller further up the stack which
++   *  captured it before the teardown can still read it; see
++   *  ares_deferred_reclaim().  Teardown is idempotent -- a second
++   *  ares_close_connection() on a dead connection does nothing. */
++  ARES_CONN_FLAG_DEAD = 1 << 4
+ } ares_conn_flags_t;
+ 
+ typedef enum {
+@@ -84,6 +91,10 @@ struct ares_conn {
+ 
+   /* list of outstanding queries to this connection */
+   ares_llist_t           *queries_to_conn;
++
++  /*! Next connection awaiting reclamation.  Set only while this connection is
++   *  on channel->pending_conns; see ares_deferred_reclaim(). */
++  ares_conn_t            *next_pending;
+ };
+ 
+ /*! Various buckets for grouping history */
+@@ -168,6 +179,10 @@ struct ares_server {
+ 
+   /* Link back to owning channel */
+   ares_channel_t       *channel;
++
++  /*! Next server awaiting reclamation.  Set only while this server is on
++   *  channel->pending_servers; see ares_deferred_reclaim(). */
++  ares_server_t        *next_pending;
+ };
+ 
+ void ares_close_connection(ares_conn_t *conn, ares_status_t requeue_status);
+@@ -185,8 +200,24 @@ ares_status_t   ares_conn_flush(ares_conn_t *conn);
+ ares_conn_err_t ares_conn_read(ares_conn_t *conn, void *data, size_t len,
+                                size_t *read_bytes);
+ ares_conn_t *ares_conn_from_fd(const ares_channel_t *channel, ares_socket_t fd);
+-void         ares_conn_sock_state_cb_update(ares_conn_t            *conn,
+-                                            ares_conn_state_flags_t flags);
++
++/*! Queue the "stop watching this descriptor" notification for a connection
++ *  being torn down, handing the descriptor to that queued message.
++ *
++ *  The application must be told to stop watching a descriptor while it is
++ *  still open -- close first and the number can be handed to something else,
++ *  including by application code running from a deferred query callback,
++ *  before the notification naming it is delivered.
++ *
++ *  \param[in] conn  Connection being closed.
++ *  \return ARES_TRUE if the queued notification took the descriptor, in which
++ *          case the caller must not close it; ARES_FALSE if no notification is
++ *          due, and the caller closes the descriptor itself.
++ */
++ares_bool_t     ares_conn_sock_state_cb_close(ares_conn_t *conn);
++
++void            ares_conn_sock_state_cb_update(ares_conn_t            *conn,
++                                               ares_conn_state_flags_t flags);
+ ares_conn_err_t ares_socket_recv(ares_channel_t *channel, ares_socket_t s,
+                                  ares_bool_t is_tcp, void *data,
+                                  size_t data_len, size_t *read_bytes);
+diff --git a/src/lib/ares_destroy.c b/src/lib/ares_destroy.c
+index 1e5706e0e0..e0534c800d 100644
+--- a/src/lib/ares_destroy.c
++++ b/src/lib/ares_destroy.c
+@@ -69,17 +69,31 @@ void ares_destroy(ares_channel_t *channel)
+    * callbacks need to hold a channel lock. */
+   ares_channel_lock(channel);
+ 
+-  /* Destroy all queries */
+-  node = ares_llist_node_first(channel->all_queries);
+-  while (node != NULL) {
+-    ares_llist_node_t *next  = ares_llist_node_next(node);
+-    ares_query_t      *query = ares_llist_node_claim(node);
+-
++  /* Destroy all queries.
++   *
++   * The queries are detached before their callbacks run.  Claiming the node
++   * only unlinks a query from all_queries; it stays in queries_by_qid, on
++   * conn->queries_to_conn and in queries_by_timeout.  A reentrant teardown
++   * from inside the callback -- ares_set_servers_csv(), or a new query
++   * hitting a connection error -- would otherwise still find the query, end
++   * it a second time (invoking the application callback twice for one
++   * lookup) and free it, and the ares_free_query() below would double-free.
++   *
++   * The loop re-reads the first node each iteration rather than caching the
++   * next one, since a callback can cause other queries in this same list to
++   * be ended and their nodes destroyed.  No list swap is needed: sys_up is
++   * already cleared above, so ares_send_nolock() refuses new queries and
++   * nothing can be added while we drain. */
++  while ((node = ares_llist_node_first(channel->all_queries)) != NULL) {
++    ares_query_t *query = ares_llist_node_claim(node);
++
++    /* Must come first: node_claim() already destroyed this node, so
++     * ares_detach_query() would otherwise destroy it a second time. */
+     query->node_all_queries = NULL;
++    ares_detach_query(query);
++
+     query->callback(query->arg, ARES_EDESTRUCTION, 0, NULL);
+     ares_free_query(query);
+-
+-    node = next;
+   }
+ 
+   ares_queue_notify_empty(channel);
+@@ -93,7 +107,28 @@ void ares_destroy(ares_channel_t *channel)
+   assert(ares_slist_len(channel->queries_by_timeout) == 0);
+ #endif
+ 
++  /* Tearing down the servers closes every remaining connection.  Applications
++   * rely on being told about those closures so they can drop the descriptors
++   * from their own event loop, so the notifications are still delivered here
++   * rather than discarded -- just after the teardown instead of during it. */
++  ares_deferred_cb_enter(channel);
+   ares_destroy_servers_state(channel);
++  ares_deferred_cb_leave(channel);
++
++  /* The leave above delivered and destroyed both queues and reclaimed
++   * everything the teardown unlinked, so these are normally no-ops.  They are
++   * not redundant: if the first insert into a freshly created queue fails,
++   * the array is left allocated and empty, the flush loop never runs because
++   * both queues are empty, and nothing else would ever free it. */
++  ares_array_destroy(channel->sock_state_queue);
++  channel->sock_state_queue = NULL;
++  ares_array_destroy(channel->server_state_queue);
++  channel->server_state_queue = NULL;
++
++#ifndef NDEBUG
++  assert(channel->pending_servers == NULL);
++  assert(channel->pending_conns == NULL);
++#endif
+ 
+ #ifndef NDEBUG
+   assert(ares_htable_asvp_num_keys(channel->connnode_by_socket) == 0);
+@@ -134,17 +169,47 @@ void ares_destroy(ares_channel_t *channel)
+   ares_free(channel);
+ }
+ 
+-void ares_destroy_server(ares_server_t *server)
++/*! Release a server's memory.  Split from ares_destroy_server() for the same
++ *  reason ares_conn_reap() is split out: a caller further up the stack may
++ *  still hold this pointer. */
++void ares_server_reap(ares_server_t *server)
+ {
+   if (server == NULL) {
+     return; /* LCOV_EXCL_LINE: DefensiveCoding */
+   }
+ 
+-  ares_close_sockets(server);
+   ares_llist_destroy(server->connections);
+   ares_free(server);
+ }
+ 
++void ares_destroy_server(ares_server_t *server)
++{
++  ares_channel_t *channel;
++
++  if (server == NULL) {
++    return; /* LCOV_EXCL_LINE: DefensiveCoding */
++  }
++
++  channel = server->channel;
++
++  /* Closes and unlinks every connection; each is deferred or reaped by
++   * ares_close_connection() on the same rule applied below. */
++  ares_close_sockets(server);
++
++  /* The caller has already unlinked this server from channel->servers, so it
++   * can no longer be found -- ares_server_in_channel() and
++   * ares_slist_node_find() both report it gone, which is what callers check
++   * before acting on one.  But a library call in progress may still be
++   * holding the pointer, so keep it readable until that call unwinds. */
++  if (channel != NULL && channel->deferred_cb_depth > 0) {
++    server->next_pending     = channel->pending_servers;
++    channel->pending_servers = server;
++    return;
++  }
++
++  ares_server_reap(server);
++}
++
+ void ares_destroy_servers_state(ares_channel_t *channel)
+ {
+   ares_slist_node_t *node;
+diff --git a/src/lib/ares_private.h b/src/lib/ares_private.h
+index 04d4576ed2..0a1029e0f8 100644
+--- a/src/lib/ares_private.h
++++ b/src/lib/ares_private.h
+@@ -147,7 +147,10 @@ typedef struct ares_query ares_query_t;
+ struct ares_query {
+   /* Query ID from qbuf, for faster lookup, and current timeout */
+   unsigned short       qid; /* host byte order */
+-  ares_timeval_t       ts;  /*!< Timestamp query was sent */
++  /*! Distinguishes this query from any later one handed the same qid.
++   *  Query ids are 16-bit and recycled; this counter is not. */
++  size_t               serial;
++  ares_timeval_t       ts; /*!< Timestamp query was sent */
+   ares_timeval_t       timeout;
+   ares_channel_t      *channel;
+ 
+@@ -227,6 +230,9 @@ struct ares_channeldata {
+   /* Server addresses and communications state. Sorted by least consecutive
+    * failures, followed by the configuration order if failures are equal. */
+   ares_slist_t        *servers;
++  /*! Bumped by each ares_servers_update().  Lets the stale-server removal loop
++   *  tell that a nested reconfiguration reconciled the list underneath it. */
++  size_t               servers_generation;
+ 
+   /* random state to use when generating new ids and generating retry penalties
+    */
+@@ -237,6 +243,10 @@ struct ares_channeldata {
+   /* Queries bucketed by qid, for quickly dispatching DNS responses: */
+   ares_htable_szvp_t  *queries_by_qid;
+ 
++  /*! Monotonic source for ares_query_t.serial.  Never reused for the life of
++   *  the channel, so a recycled query id cannot impersonate an older query. */
++  size_t               query_serial;
++
+   /* Queries bucketed by timeout, for quickly handling timeouts: */
+   ares_slist_t        *queries_by_timeout;
+ 
+@@ -248,6 +258,29 @@ struct ares_channeldata {
+ 
+   ares_sock_state_cb   sock_state_cb;
+   void                *sock_state_cb_data;
++  /*! Socket-state notifications queued during processing, delivered once the
++   *  library is no longer holding a connection a reentrant call could free.
++   *  Insertion order is preserved, so an application observes the same
++   *  sequence of state changes it would have seen inline. */
++  ares_array_t        *sock_state_queue;
++  /*! Depth of nested library entry points that may produce a deferred
++   *  application notification.  Queues are delivered as this returns to
++   *  zero.  Shared by every deferred callback kind rather than one counter
++   *  per kind, so the delivery rule exists in exactly one place. */
++  size_t               deferred_cb_depth;
++
++  /*! Servers and connections that have been unlinked from every lookup
++   *  structure but not yet freed, because a library call was in progress and
++   *  may still hold a pointer to them.  Drained by the same flush that
++   *  delivers deferred notifications, once no frame can still be holding one.
++   *
++   *  This is what makes a stale ares_server_t or ares_conn_t readable rather
++   *  than freed for the remainder of the call that captured it.  Callers
++   *  still revalidate before *acting* on one -- ares_server_in_channel() and
++   *  friends -- but a missed check is now "used a server that was removed"
++   *  rather than a use-after-free. */
++  ares_server_t       *pending_servers;
++  ares_conn_t         *pending_conns;
+ 
+   ares_sock_create_callback           sock_create_cb;
+   void                               *sock_create_cb_data;
+@@ -295,6 +328,10 @@ struct ares_channeldata {
+   /* Callback triggered when a server has a successful or failed response */
+   ares_server_state_callback          server_state_cb;
+   void                               *server_state_cb_data;
++  /*! Server-state notifications queued during processing, dispatched once the
++   *  library is no longer holding pointers a reentrant callback could free.
++   *  See ares_deferred_cb_leave(). */
++  ares_array_t                       *server_state_queue;
+ 
+   /* TRUE if a reinit is pending.  Reinit spawns a thread to read the system
+    * configuration and then apply the configuration since configuration
+@@ -308,6 +345,11 @@ struct ares_channeldata {
+    * system config changes might get triggered and we need a flag to make
+    * sure we don't take action. */
+   ares_bool_t                         sys_up;
++
++  /*! Set while ares_send_nolock() is running the refusal notification for a
++   *  channel being destroyed.  Bounds the recursion at one frame when the
++   *  application's callback responds by starting another lookup. */
++  ares_bool_t                         in_shutdown_refusal;
+ };
+ 
+ /* Does the domain end in ".onion" or ".onion."? Case-insensitive. */
+@@ -351,6 +393,16 @@ void         *ares_dnsrec_convert_arg(ares_callback callback, void *arg);
+ void ares_dnsrec_convert_cb(void *arg, ares_status_t status, size_t timeouts,
+                             const ares_dns_record_t *dnsrec);
+ 
++/*! Unlink a query from every list and table that tracks it.
++ *
++ *  Must be called before running application code that could reach the query
++ *  again, so a reentrant teardown cannot find it and end it a second time.
++ *
++ *  \param[in] query  Query to detach.  Safe to call more than once on the
++ *                    same query.
++ */
++void ares_detach_query(ares_query_t *query);
++
+ void ares_free_query(ares_query_t *query);
+ 
+ unsigned short ares_generate_new_id(ares_rand_state *state);
+@@ -390,7 +442,6 @@ ares_status_t ares_sysconfig_set_options(ares_sysconfig_t *sysconfig,
+ 
+ ares_status_t ares_init_by_environment(ares_sysconfig_t *sysconfig);
+ 
+-
+ typedef ares_status_t (*ares_sysconfig_line_cb_t)(const ares_channel_t *channel,
+                                                   ares_sysconfig_t     *sysconfig,
+                                                   ares_buf_t           *line);
+@@ -589,6 +640,60 @@ ares_status_t ares_dns_name_write(ares_buf_t *buf, ares_llist_t **list,
+  */
+ void          ares_queue_notify_empty(ares_channel_t *channel);
+ 
++/*! Is this server still installed on the channel?
++ *
++ *  Application callbacks may reconfigure the servers, which destroys any that
++ *  the new configuration omits.  A raw ares_server_t captured before such a
++ *  callback must be revalidated before it is used again.
++ *
++ *  \param[in] channel  Initialized ares channel.
++ *  \param[in] server   Server pointer captured earlier.
++ *  \return ARES_TRUE if still present.
++ */
++ares_bool_t   ares_server_in_channel(const ares_channel_t *channel,
++                                     const ares_server_t  *server);
++
++/*! Free everything awaiting reclamation on the channel.
++ *
++ *  Called only from the deferred-callback flush, at the point where the
++ *  outermost library call is unwinding and no frame can still hold a pointer
++ *  to an unlinked server or connection.
++ *
++ *  \param[in] channel  Initialized ares channel.
++ */
++void          ares_deferred_reclaim(ares_channel_t *channel);
++
++/*! Free one connection's memory.  Only for the deferred-reclaim path and the
++ *  immediate path in ares_close_connection(). */
++void          ares_conn_reap(ares_conn_t *conn);
++
++/*! Free one server's memory.  Only for the deferred-reclaim path and the
++ *  immediate path in ares_destroy_server(). */
++void          ares_server_reap(ares_server_t *server);
++
++/*! Enter a region that may produce application notifications the library is
++ *  not in a position to deliver yet -- socket-state and server-state changes.
++ *  Nesting is counted; queued notifications are delivered by the outermost
++ *  leave.
++ *
++ *  \param[in] channel  Initialized ares channel.
++ */
++void          ares_deferred_cb_enter(ares_channel_t *channel);
++
++/*! Leave such a region.  The outermost leave delivers the queues, at which
++ *  point the library holds no connection a reentrant call could free.
++ *
++ *  \param[in] channel  Initialized ares channel.
++ */
++void          ares_deferred_cb_leave(ares_channel_t *channel);
++
++/*! Deliver every server-state notification the channel has queued.  Called
++ *  only from the shared deferred-callback flush.
++ *
++ *  \param[in] channel  Initialized ares channel.
++ */
++void          ares_server_state_dispatch(ares_channel_t *channel);
++
+ #define ARES_CONFIG_CHECK(x)                                              \
+   (x && x->lookups && ares_slist_len(x->servers) > 0 && x->timeout > 0 && \
+    x->tries > 0)
+@@ -636,7 +741,6 @@ typedef struct ares_event_thread ares_event_thread_t;
+ void          ares_event_thread_destroy(ares_channel_t *channel);
+ ares_status_t ares_event_thread_init(ares_channel_t *channel);
+ 
+-
+ #ifdef _WIN32
+ #  define HOSTENT_ADDRTYPE_TYPE short
+ #  define HOSTENT_LENGTH_TYPE   short
+diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
+index b2316c4b33..82f53610fb 100644
+--- a/src/lib/ares_process.c
++++ b/src/lib/ares_process.c
+@@ -69,7 +69,6 @@ static ares_status_t ares_send_query_int(ares_server_t        *requested_server,
+                                          ares_query_t         *query,
+                                          const ares_timeval_t *now,
+                                          ares_array_t        **requeue);
+-static void          ares_detach_query(ares_query_t *query);
+ 
+ static void        ares_query_remove_from_conn(ares_query_t *query)
+ {
+@@ -81,14 +80,32 @@ static void        ares_query_remove_from_conn(ares_query_t *query)
+   query->conn                    = NULL;
+ }
+ 
++/*! A queued server-state notification.  Holds the formatted address rather
++ *  than the server, so it stays valid however the server list changes. */
++typedef struct {
++  char       *server_string;
++  ares_bool_t success;
++  int         flags;
++} ares_server_state_msg_t;
++
++static void ares_server_state_msg_free(void *arg)
++{
++  ares_server_state_msg_t *msg = arg;
++  if (msg == NULL) {
++    return; /* LCOV_EXCL_LINE: DefensiveCoding */
++  }
++  ares_free(msg->server_string);
++}
++
+ /* Invoke the server state callback after a success or failure */
+ static void invoke_server_state_cb(const ares_server_t *server,
+                                    ares_bool_t success, int flags)
+ {
+-  const ares_channel_t *channel = server->channel;
+-  ares_buf_t           *buf;
+-  ares_status_t         status;
+-  char                 *server_string;
++  ares_channel_t         *channel = server->channel;
++  ares_buf_t             *buf;
++  ares_status_t           status;
++  char                   *server_string;
++  ares_server_state_msg_t msg;
+ 
+   if (channel->server_state_cb == NULL) {
+     return;
+@@ -111,9 +128,57 @@ static void invoke_server_state_cb(const ares_server_t *server,
+     return; /* LCOV_EXCL_LINE: OutOfMemory */
+   }
+ 
+-  channel->server_state_cb(server_string, success, flags,
+-                           channel->server_state_cb_data);
+-  ares_free(server_string);
++  /* Queue rather than dispatch.  This runs in the middle of processing, and
++   * every caller keeps using its query / connection / server afterwards.  The
++   * callback is application code that may reentrantly call ares_cancel(),
++   * which frees those objects -- so dispatch once the library is no longer
++   * holding them.  Same philosophy as the deferred query-callback dispatch.
++   *
++   * Only the formatted address is captured, never the ares_server_t, so a
++   * queued entry cannot outlive anything it points at. */
++  if (channel->server_state_queue == NULL) {
++    channel->server_state_queue = ares_array_create(
++      sizeof(ares_server_state_msg_t), ares_server_state_msg_free);
++    if (channel->server_state_queue == NULL) {
++      /* LCOV_EXCL_START: OutOfMemory */
++      ares_free(server_string);
++      return;
++      /* LCOV_EXCL_STOP */
++    }
++  }
++
++  msg.server_string = server_string;
++  msg.success       = success;
++  msg.flags         = flags;
++
++  if (ares_array_insertdata_last(channel->server_state_queue, &msg) !=
++      ARES_SUCCESS) {
++    ares_free(server_string); /* LCOV_EXCL_LINE: OutOfMemory */
++  }
++}
++
++/*! Deliver every server-state notification the channel has queued.  Loops
++ *  rather than snapshotting: a callback is allowed to re-enter the library and
++ *  queue more, and those belong to this same delivery point. */
++void ares_server_state_dispatch(ares_channel_t *channel)
++{
++  while (ares_array_len(channel->server_state_queue) > 0) {
++    ares_server_state_msg_t msg;
++
++    if (ares_array_claim_at(&msg, sizeof(msg), channel->server_state_queue,
++                            0) != ARES_SUCCESS) {
++      break; /* LCOV_EXCL_LINE: DefensiveCoding */
++    }
++
++    if (channel->server_state_cb != NULL) {
++      channel->server_state_cb(msg.server_string, msg.success, msg.flags,
++                               channel->server_state_cb_data);
++    }
++    ares_free(msg.server_string);
++  }
++
++  ares_array_destroy(channel->server_state_queue);
++  channel->server_state_queue = NULL;
+ }
+ 
+ static void server_increment_failures(ares_server_t *server,
+@@ -204,6 +269,8 @@ static ares_status_t ares_process_fds_nolock(ares_channel_t         *channel,
+     return ARES_EFORMERR; /* LCOV_EXCL_LINE: DefensiveCoding */
+   }
+ 
++  ares_deferred_cb_enter(channel);
++
+   ares_tvnow(&now);
+ 
+   /* Process write events */
+@@ -244,6 +311,8 @@ static ares_status_t ares_process_fds_nolock(ares_channel_t         *channel,
+   }
+ 
+ done:
++  ares_deferred_cb_leave(channel);
++
+   if (status == ARES_ENOMEM) {
+     return ARES_ENOMEM;
+   }
+@@ -553,6 +622,8 @@ typedef enum {
+ typedef struct {
+   requeue_type_t     type;   /* type of entry, requeue or endquery */
+   unsigned short     qid;    /* query id */
++  size_t             serial; /* identifies the query the qid meant when
++                              * this entry was appended */
+   ares_server_t     *server; /* requeue only: optional */
+   ares_status_t      status; /* endquery only */
+   ares_dns_record_t *dnsrec; /* endquery only: optional */
+@@ -578,6 +649,7 @@ static ares_status_t ares_append_requeue_int(ares_array_t     **requeue,
+ 
+   entry.type   = type;
+   entry.qid    = query->qid;
++  entry.serial = query->serial;
+   entry.server = server;
+   entry.status = status;
+   entry.dnsrec = dnsrec;
+@@ -601,6 +673,53 @@ static ares_status_t ares_append_endqueue(ares_array_t     **requeue,
+     dnsrec);
+ }
+ 
++/*! Is the query the caller captured still the one holding \a qid?
++ *
++ *  A query id is a 16-bit wire value reissued as soon as the query holding it
++ *  is detached, so it names a slot rather than a query, and comparing the
++ *  pointer as well does not help: the replacement is often allocated at the
++ *  address the freed one had.  The serial is a channel-wide counter that is
++ *  never reused. */
++static ares_bool_t ares_query_is_live(const ares_channel_t *channel,
++                                      unsigned short qid, size_t serial)
++{
++  const ares_query_t *query =
++    ares_htable_szvp_get_direct(channel->queries_by_qid, qid);
++
++  if (query == NULL || query->serial != serial) {
++    return ARES_FALSE;
++  }
++
++  return ARES_TRUE;
++}
++
++/*! Is this exact server object still in the channel's server list?
++ *
++ *  Compares pointers only and never dereferences \a server.  Deferred
++ *  reclamation keeps an unlinked server readable for the rest of the call
++ *  that captured it, so reading through it is no longer a use-after-free --
++ *  but it has been removed from the configuration and must not be acted on,
++ *  which is what this reports.  A channel has a handful of servers, so the
++ *  linear scan does not matter. */
++ares_bool_t ares_server_in_channel(const ares_channel_t *channel,
++                                   const ares_server_t  *server)
++{
++  ares_slist_node_t *node;
++
++  if (server == NULL) {
++    return ARES_FALSE;
++  }
++
++  for (node = ares_slist_node_first(channel->servers); node != NULL;
++       node = ares_slist_node_next(node)) {
++    if (ares_slist_node_val(node) == server) {
++      return ARES_TRUE;
++    }
++  }
++
++  return ARES_FALSE;
++}
++
+ /* Drain the deferred requeue/endqueue list iteratively.  All flush sites
+  * (read_answers(), process_timeouts(), and ares_send_query()) funnel through
+  * here so that:
+@@ -636,11 +755,35 @@ static ares_status_t ares_flush_requeue(ares_channel_t       *channel,
+ 
+     query = ares_htable_szvp_get_direct(channel->queries_by_qid, entry.qid);
+ 
++    /* A query id is a 16-bit wire value and generate_unique_qid() only avoids
++     * ids that are live when it runs.  Within a single drain, a callback can
++     * cancel a query whose entry is still in this array -- releasing its id --
++     * and start a new lookup that is handed the same id.  The lookup above
++     * would then resolve this entry to a completely different query: an
++     * endquery entry would deliver one lookup's answer to another and free it,
++     * a requeue entry would put an in-flight query on the wire twice.  The
++     * serial is a channel-wide counter that is never reused, so it tells the
++     * two apart. */
++    if (query != NULL && query->serial != entry.serial) {
++      query = NULL;
++    }
++
+     if (entry.type == REQUEUE_REQUEUE) {
+       /* Query disappeared (e.g. a prior callback in this drain cancelled it) */
+       if (query == NULL) {
+         continue;
+       }
++      /* entry.server is a raw pointer captured before any callback in this
++       * drain ran.  A callback may legally re-enter the public API -- the
++       * channel lock is recursive -- and ares_set_servers*() destroys servers
++       * that are absent from the new configuration, so it may already be
++       * freed.  The query above is revalidated by qid for exactly this
++       * reason; do the same for the server, falling back to ordinary
++       * selection when it has gone. */
++      if (!ares_server_in_channel(channel, entry.server)) {
++        entry.server = NULL;
++      }
++
+       /* Re-dispatch via the internal entrypoint so any further requeues are
+        * appended back onto this same list and drained by the loop above,
+        * rather than recursing. */
+@@ -1377,6 +1520,7 @@ ares_status_t ares_send_query(ares_server_t *requested_server,
+   ares_channel_t *channel = query->channel;
+   ares_array_t   *requeue = NULL;
+   unsigned short  qid     = query->qid;
++  size_t          serial  = query->serial;
+   ares_status_t   status;
+ 
+   status = ares_send_query_int(requested_server, query, now, &requeue);
+@@ -1393,8 +1537,7 @@ ares_status_t ares_send_query(ares_server_t *requested_server,
+    * been freed.  Do not dereference 'query' here.  If it is no longer tracked
+    * it ended, so don't report success to the caller (which would, e.g., cause
+    * ares_send_nolock() to write to a now-freed *qid). */
+-  if (status == ARES_SUCCESS &&
+-      ares_htable_szvp_get_direct(channel->queries_by_qid, qid) == NULL) {
++  if (status == ARES_SUCCESS && !ares_query_is_live(channel, qid, serial)) {
+     status = ARES_ETIMEOUT;
+   }
+ 
+@@ -1412,6 +1555,9 @@ static ares_status_t ares_send_query_int(ares_server_t        *requested_server,
+   size_t          timeplus;
+   ares_status_t   status;
+   ares_bool_t     probe_downed_server = ARES_TRUE;
++  /* Captured before any application callback below, which may free the query */
++  unsigned short  qid    = query->qid;
++  size_t          serial = query->serial;
+ 
+   /* Choose the server to send the query to */
+   if (requested_server != NULL) {
+@@ -1443,6 +1589,32 @@ static ares_status_t ares_send_query_int(ares_server_t        *requested_server,
+   conn = ares_fetch_connection(channel, server, query);
+   if (conn == NULL) {
+     status = ares_open_connection(&conn, channel, server, query->using_tcp);
++
++    /* Opening a connection runs application code -- the socket-open function
++     * from ares_set_socket_functions_ex(), and the ares_set_socket_callback()
++     * and ares_set_socket_configure_callback() callbacks -- any of which may
++     * reentrantly call ares_cancel() and free this query.  Re-check liveness
++     * by the qid captured at entry rather than dereferencing a possibly-freed
++     * query. */
++    if (!ares_query_is_live(channel, qid, serial)) {
++      return ARES_ECANCELLED;
++    }
++
++    /* Those same callbacks may have reconfigured the servers, which frees the
++     * ones the new configuration omits.  'server' was captured before the
++     * open; everything below reads it, including server_increment_failures()
++     * on the failure paths of the switch.
++     *
++     * Requeue rather than return: every exit from this function must either
++     * enqueue the query or end it, and the query is still live here -- it has
++     * not been written, is not attached to a connection, and on a first send
++     * has no timeout node, so returning would strand it forever.
++     * query->conn is NULL, so this does not read through the freed server. */
++    if (!ares_server_in_channel(channel, server)) {
++      return ares_requeue_query(query, now, ARES_ECONNREFUSED, ARES_TRUE, NULL,
++                                requeue);
++    }
++
+     switch (status) {
+       /* Good result, continue on */
+       case ARES_SUCCESS:
+@@ -1464,6 +1636,14 @@ static ares_status_t ares_send_query_int(ares_server_t        *requested_server,
+ 
+   /* Write the query */
+   status = ares_conn_query_write(conn, query, now);
++
++  /* Writing runs application code too: ares_conn_query_write() reaches the
++   * send function installed by ares_set_socket_functions_ex(), which may
++   * reentrantly call ares_cancel() with the same hazard as above. */
++  if (!ares_query_is_live(channel, qid, serial)) {
++    return ARES_ECANCELLED;
++  }
++
+   switch (status) {
+     /* Good result, continue on */
+     case ARES_SUCCESS:
+@@ -1479,6 +1659,17 @@ static ares_status_t ares_send_query_int(ares_server_t        *requested_server,
+     case ARES_ECONNREFUSED:
+     case ARES_EBADFAMILY:
+       handle_conn_error(conn, ARES_TRUE, status);
++      /* handle_conn_error() -> ares_close_connection() ->
++       * ares_requeue_queries() walks conn->queries_to_conn and may terminally
++       * end other queries on this connection.  If one of their callbacks
++       * reentrantly calls ares_cancel(), this query is freed too -- it is still
++       * linked in all_queries, since it only joins conn->queries_to_conn on the
++       * success path below.  Re-check liveness by the qid captured at entry
++       * rather than dereferencing a possibly-freed query.  Mirrors the guard in
++       * ares_send_query(). */
++      if (!ares_query_is_live(channel, qid, serial)) {
++        return ARES_ECONNREFUSED;
++      }
+       status = ares_requeue_query(query, now, status, ARES_TRUE, NULL, requeue);
+       if (status == ARES_ETIMEOUT) {
+         status = ARES_ECONNREFUSED;
+@@ -1597,11 +1788,18 @@ static ares_bool_t same_questions(const ares_query_t      *query,
+   return rv;
+ }
+ 
+-static void ares_detach_query(ares_query_t *query)
++void ares_detach_query(ares_query_t *query)
+ {
+   /* Remove the query from all the lists in which it is linked */
+   ares_query_remove_from_conn(query);
+-  ares_htable_szvp_remove(query->channel->queries_by_qid, query->qid);
++  /* Only release the qid slot if it is still ours.  A query detached before
++   * its callback can have its qid reissued to a lookup started from within
++   * that callback, and the ares_free_query() that follows detaches a second
++   * time -- which would otherwise evict the new lookup instead. */
++  if (ares_htable_szvp_get_direct(query->channel->queries_by_qid, query->qid) ==
++      query) {
++    ares_htable_szvp_remove(query->channel->queries_by_qid, query->qid);
++  }
+   ares_llist_node_destroy(query->node_all_queries);
+   query->node_all_queries = NULL;
+ }
+@@ -1624,6 +1822,16 @@ static void end_query(ares_channel_t *channel, ares_server_t *server,
+     return;
+   }
+ 
++  /* Detach from all lookup lists before the callback, otherwise a reentrant
++   * ares_cancel() from within it would find this query still linked, free it,
++   * and the ares_free_query() below would double-free.  Mirrors
++   * ares_flush_requeue() for every synchronous path that reaches here with a
++   * NULL requeue: connection teardown via handle_conn_error(), and server
++   * removal via ares_servers_update() and ares_destroy_servers_state(), both
++   * of which reach ares_close_sockets().
++   * ares_detach_query() may safely run twice on the same query. */
++  ares_detach_query(query);
++
+   /* Invoke the callback. */
+   query->callback(query->arg, status, query->timeouts, dnsrec);
+   ares_free_query(query);
+@@ -1631,7 +1839,8 @@ static void end_query(ares_channel_t *channel, ares_server_t *server,
+   /* Check and notify if no other queries are enqueued on the channel.  This
+    * must come after the callback and freeing the query for 2 reasons.
+    *  1) The callback itself may enqueue a new query
+-   *  2) Technically the current query isn't detached until it is free()'d.
++   *  2) The current query is detached above, before the callback, so by this
++   *     point it is no longer tracked.
+    */
+   ares_queue_notify_empty(channel);
+ }
+diff --git a/src/lib/ares_send.c b/src/lib/ares_send.c
+index 6efa9580b2..2e0482bf19 100644
+--- a/src/lib/ares_send.c
++++ b/src/lib/ares_send.c
+@@ -117,6 +117,27 @@ ares_status_t ares_send_nolock(ares_channel_t *channel, ares_server_t *server,
+   unsigned short           id          = generate_unique_qid(channel);
+   const ares_dns_record_t *dnsrec_resp = NULL;
+ 
++  /* A channel being destroyed accepts no new queries.  ares_destroy(3)
++   * documents that a callback must not add new requests to a channel being
++   * destroyed.  Refuse it, but still notify: ARES_EDESTRUCTION is documented
++   * in ares_query(3), ares_send(3), ares_search(3) and ares_getaddrinfo(3) as
++   * a status delivered to the callback, and every caller frees its own
++   * context from there.
++   *
++   * Not notified if we are already inside such a notification: an application
++   * whose callback starts a replacement lookup on every invocation would
++   * otherwise re-enter here from within the callback without bound and
++   * exhaust the stack.  At that depth it is already past the contract
++   * ares_destroy(3) documents. */
++  if (!channel->sys_up) {
++    if (!channel->in_shutdown_refusal) {
++      channel->in_shutdown_refusal = ARES_TRUE;
++      callback(arg, ARES_EDESTRUCTION, 0, NULL);
++      channel->in_shutdown_refusal = ARES_FALSE;
++    }
++    return ARES_EDESTRUCTION;
++  }
++
+   ares_tvnow(&now);
+ 
+   if (ares_slist_len(channel->servers) == 0) {
+@@ -145,6 +166,7 @@ ares_status_t ares_send_nolock(ares_channel_t *channel, ares_server_t *server,
+ 
+   query->channel      = channel;
+   query->qid          = id;
++  query->serial       = ++channel->query_serial;
+   query->timeout.sec  = 0;
+   query->timeout.usec = 0;
+   query->using_tcp =
+@@ -209,6 +231,12 @@ ares_status_t ares_send_nolock(ares_channel_t *channel, ares_server_t *server,
+    */
+   if (!ares_htable_szvp_insert(channel->queries_by_qid, query->qid, query)) {
+     /* LCOV_EXCL_START: OutOfMemory */
++    /* The query is already chained into all_queries, so a reentrant
++     * ares_cancel() from the callback below would find it, run the
++     * application callback a second time for one lookup, and free it -- and
++     * the ares_free_query() here would then double-free.  Same ordering as
++     * ares_cancel() and ares_destroy(): unlink first, notify second. */
++    ares_detach_query(query);
+     callback(arg, ARES_ENOMEM, 0, NULL);
+     ares_free_query(query);
+     return ARES_ENOMEM;
+@@ -217,10 +245,17 @@ ares_status_t ares_send_nolock(ares_channel_t *channel, ares_server_t *server,
+ 
+   /* Perform the first query action. */
+ 
++  /* Sending opens and writes to connections and can mark a server down, both
++   * of which notify.  Deliver those once we are done with the connection and
++   * the server, not part-way through. */
++  ares_deferred_cb_enter(channel);
+   status = ares_send_query(server, query, &now);
++  ares_deferred_cb_leave(channel);
++
+   if (status == ARES_SUCCESS && qid) {
+     *qid = id;
+   }
++
+   return status;
+ }
+ 
+diff --git a/src/lib/ares_update_servers.c b/src/lib/ares_update_servers.c
+index f8d441accf..50a9c27925 100644
+--- a/src/lib/ares_update_servers.c
++++ b/src/lib/ares_update_servers.c
+@@ -740,17 +740,36 @@ static ares_bool_t ares_servers_remove_stale(ares_channel_t *channel,
+ {
+   ares_bool_t        stale_removed = ARES_FALSE;
+   ares_slist_node_t *snode         = ares_slist_node_first(channel->servers);
++  size_t             generation    = channel->servers_generation;
+ 
++  /* Re-read from the head each pass rather than caching the next node.
++   * ares_slist_node_destroy() below reaches application callbacks, by way of
++   * ares_destroy_server() -> ares_close_sockets() -> ares_requeue_queries(),
++   * and a nested reconfiguration from one of those destroys the remaining
++   * stale servers -- including whichever one a cached pointer referred to. */
+   while (snode != NULL) {
+-    ares_slist_node_t   *snext  = ares_slist_node_next(snode);
+     const ares_server_t *server = ares_slist_node_val(snode);
+-    if (!ares_server_in_newconfig(server, srvlist)) {
+-      /* This will clean up all server state via the destruction callback and
+-       * move any queries to new servers */
+-      ares_slist_node_destroy(snode);
+-      stale_removed = ARES_TRUE;
++
++    if (ares_server_in_newconfig(server, srvlist)) {
++      snode = ares_slist_node_next(snode);
++      continue;
+     }
+-    snode = snext;
++
++    /* This will clean up all server state via the destruction callback and
++     * move any queries to new servers */
++    ares_slist_node_destroy(snode);
++    stale_removed = ARES_TRUE;
++
++    /* A callback reached from the destroy above may have reconfigured the
++     * server list against a newer configuration.  That call has already
++     * reconciled the whole list, so whatever remains belongs to it and not to
++     * srvlist -- stop rather than deleting its servers. */
++    if (channel->servers_generation != generation) {
++      break;
++    }
++
++    /* The callbacks above may have removed further servers, so restart. */
++    snode = ares_slist_node_first(channel->servers);
+   }
+   return stale_removed;
+ }
+@@ -775,6 +794,14 @@ ares_status_t ares_servers_update(ares_channel_t *channel,
+     return ARES_EFORMERR; /* LCOV_EXCL_LINE: DefensiveCoding */
+   }
+ 
++  /* Removing servers closes their connections, which notifies.  Deliver
++   * once this call is done rather than from inside the teardown. */
++  ares_deferred_cb_enter(channel);
++
++  /* Bumped before anything below can reach an application callback, so a
++   * nested reconfiguration is distinguishable from our own work. */
++  channel->servers_generation++;
++
+   /* NOTE: a NULL or zero entry server list is considered valid due to
+    *       real-world people needing support for this for their test harnesses
+    */
+@@ -843,6 +870,7 @@ ares_status_t ares_servers_update(ares_channel_t *channel,
+   status = ARES_SUCCESS;
+ 
+ done:
++  ares_deferred_cb_leave(channel);
+   return status;
+ }
+ 
+diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc
+index c0c0279abb..2158c5a913 100644
+--- a/test/ares-test-mock.cc
++++ b/test/ares-test-mock.cc
+@@ -31,6 +31,11 @@
+ #include <sys/stat.h>
+ #endif
+ 
++#ifndef _WIN32
++#  include <errno.h>
++#  include <fcntl.h>
++#endif
++
+ #include <sstream>
+ #include <vector>
+ 
+@@ -1914,6 +1919,7 @@ TEST_P(MockRetryDepthChannelTest, HighRetryNoStackOverflow) {
+ struct CancelInCbData {
+   ares_channel_t *channel;
+   bool            done;
++  size_t          cbs;
+ };
+ 
+ static void CancelChannelCallback(void *arg, ares_status_t status,
+@@ -1925,10 +1931,1071 @@ static void CancelChannelCallback(void *arg, ares_status_t status,
+   (void)timeouts;
+   (void)dnsrec;
+   data->done = true;
++  data->cbs++;
+   /* Reentrant cancel from within the callback.  Must not double-free. */
+   ares_cancel(data->channel);
+ }
+ 
++// ares_destroy() notifies each still-running query that the channel is going
++// away, and holds a pointer to the next one in its list while doing so.  A
++// reentrant ares_cancel() from one of those callbacks frees every remaining
++// query -- including that cached next, which ares_destroy() then follows.
++//
++// ares_cancel() is immune to the same pattern because it swaps the list head
++// before walking it; ares_destroy() did not.  Two queries are required: with
++// only one in flight there is no next to cache and nothing goes wrong.
++// tries=1 so a teardown ends the query outright instead of retrying it, which
++// is the precondition this family of bugs shares.
++class MockUDPSingleTryTest : public MockChannelOptsTest,
++                             public ::testing::WithParamInterface<int> {
++public:
++  MockUDPSingleTryTest()
++    : MockChannelOptsTest(1, GetParam(), false, false, FillOptions(&opts_),
++                          ARES_OPT_TRIES)
++  {
++  }
++
++  static struct ares_options *FillOptions(struct ares_options *opts)
++  {
++    memset(opts, 0, sizeof(struct ares_options));
++    opts->tries = 1;
++    return opts;
++  }
++
++private:
++  struct ares_options opts_;
++};
++
++// ares_cancel() and ares_destroy() free a query themselves rather than going
++// through end_query().  Both used to invoke the application callback while the
++// query was still in queries_by_qid, on conn->queries_to_conn and in
++// queries_by_timeout -- only all_queries was unlinked first.  A reentrant
++// teardown from within that callback therefore still found the query, ended it
++// a second time, and freed it; the ares_free_query() that followed then
++// double-freed.  One query in flight is enough.
++static void ReconfigureServersCallback(void *arg, ares_status_t status,
++                                       size_t                   timeouts,
++                                       const ares_dns_record_t *dnsrec) {
++  CancelInCbData *data = static_cast<CancelInCbData *>(arg);
++  (void)status;
++  (void)timeouts;
++  (void)dnsrec;
++  data->done = true;
++  data->cbs++;
++  /* Frees every server absent from the new configuration, closing their
++   * connections -- which still hold the queries being torn down. */
++  ares_set_servers_csv(data->channel, "127.0.0.1:53055");
++}
++
++// Reconfiguring the server list from a cancellation callback.
++TEST_P(MockUDPSingleTryTest, ReconfigureInCancelCallbackNoDoubleFree) {
++  CancelInCbData data;
++  data.channel = channel_;
++  data.done    = false;
++  data.cbs     = 0;
++
++  QueryResult result;
++  /* Left unanswered, so both stay attached to the connection. */
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
++                              ARES_REC_TYPE_A, ReconfigureServersCallback,
++                              &data, NULL));
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_query_dnsrec(channel_, "www.example.com", ARES_CLASS_IN,
++                              ARES_REC_TYPE_A, QueryCallback, &result, NULL));
++
++  ares_cancel(channel_);
++  EXPECT_TRUE(data.done);
++  EXPECT_TRUE(result.done_);
++  /* Each lookup must be notified exactly once, not twice. */
++  EXPECT_EQ((size_t)1, data.cbs);
++}
++
++/* The replacement lookup's result outlives the callback that starts it. */
++static QueryResult g_replacement_result;
++
++static void NewQueryOnFailingWriteCallback(void *arg, ares_status_t status,
++                                           size_t                   timeouts,
++                                           const ares_dns_record_t *dnsrec) {
++  /* ares_set_socket_functions() stores the pointer rather than copying it, so
++   * this must outlive the call. */
++  static ares_socket_functions sock_funcs;
++  CancelInCbData              *data = static_cast<CancelInCbData *>(arg);
++  (void)status;
++  (void)timeouts;
++  (void)dnsrec;
++
++  data->cbs++;
++
++  /* Only the first cancellation callback starts a replacement lookup. */
++  if (data->done) {
++    return;
++  }
++  data->done = true;
++
++  memset(&sock_funcs, 0, sizeof(sock_funcs));
++  sock_funcs.asendv = LibraryTest::ares_sendv_fail;
++  ares_set_socket_functions(data->channel, &sock_funcs, NULL);
++  LibraryTest::SetFailSend();
++
++  ares_query_dnsrec(data->channel, "www.probe.com", ARES_CLASS_IN,
++                    ARES_REC_TYPE_A, QueryCallback, &g_replacement_result,
++                    NULL);
++}
++
++// No reconfiguration at all: the cancellation callback simply starts a
++// replacement lookup -- an ordinary retry pattern -- and that lookup's write
++// fails.  ares_close_connection() then walks conn->queries_to_conn, which
++// still holds the queries ares_cancel() is in the middle of.  Wider than the
++// case above: it needs nothing more than a connection error.
++TEST_P(MockUDPSingleTryTest, NewQueryInCancelCallbackConnErrorNoDoubleFree) {
++  CancelInCbData data;
++  data.channel = channel_;
++  data.done    = false;
++  data.cbs     = 0;
++
++  g_replacement_result.done_ = false;
++
++  QueryResult result;
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
++                              ARES_REC_TYPE_A, NewQueryOnFailingWriteCallback,
++                              &data, NULL));
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_query_dnsrec(channel_, "www.example.com", ARES_CLASS_IN,
++                              ARES_REC_TYPE_A, QueryCallback, &result, NULL));
++
++  ares_cancel(channel_);
++  EXPECT_TRUE(data.done);
++  EXPECT_TRUE(result.done_);
++  /* Each lookup must be notified exactly once, not twice. */
++  EXPECT_EQ((size_t)1, data.cbs);
++  /* Pins that the replacement lookup ran and its write failed, which is what
++   * drives the connection teardown this test is about. */
++  EXPECT_TRUE(g_replacement_result.done_);
++}
++
++// The same shape through ares_destroy() rather than ares_cancel().  Swapping
++// the all_queries head does not help here: the reentrant teardown reaches the
++// query through the connection, not through all_queries.
++TEST_P(MockUDPSingleTryTest, ReconfigureInDestroyCallbackNoDoubleFree) {
++  CancelInCbData data;
++  data.channel = channel_;
++  data.done    = false;
++  data.cbs     = 0;
++
++  QueryResult result;
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
++                              ARES_REC_TYPE_A, ReconfigureServersCallback,
++                              &data, NULL));
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_query_dnsrec(channel_, "www.example.com", ARES_CLASS_IN,
++                              ARES_REC_TYPE_A, QueryCallback, &result, NULL));
++
++  ares_destroy(channel_);
++  channel_ = nullptr; /* destroyed here, don't let the fixture repeat it */
++
++  EXPECT_TRUE(data.done);
++  EXPECT_TRUE(result.done_);
++  /* Each lookup must be notified exactly once, not twice. */
++  EXPECT_EQ((size_t)1, data.cbs);
++}
++
++// Once ares_destroy() has begun, a lookup started from a destruction callback
++// is refused rather than allocated into a channel being torn down -- and the
++// refusal still runs the caller's callback with ARES_EDESTRUCTION, so context
++// attached to `arg` can be reclaimed.  ares_cancel() leaves sys_up true, so a
++// destruction callback is the only way to reach this.
++struct DestroyReentryData {
++  ares_channel_t *channel;
++  size_t          outer_cbs;
++  size_t          replacement_cbs;
++  ares_status_t   replacement_status;
++};
++
++static void DestroyReplacementCallback(void *arg, ares_status_t status,
++                                       size_t                   timeouts,
++                                       const ares_dns_record_t *dnsrec) {
++  DestroyReentryData *data = static_cast<DestroyReentryData *>(arg);
++  (void)timeouts;
++  (void)dnsrec;
++  data->replacement_cbs++;
++  data->replacement_status = status;
++}
++
++static void DestroyReentryCallback(void *arg, ares_status_t status,
++                                   size_t                   timeouts,
++                                   const ares_dns_record_t *dnsrec) {
++  DestroyReentryData *data = static_cast<DestroyReentryData *>(arg);
++  (void)status;
++  (void)timeouts;
++  (void)dnsrec;
++  data->outer_cbs++;
++  ares_query_dnsrec(data->channel, "www.example.com", ARES_CLASS_IN,
++                    ARES_REC_TYPE_A, DestroyReplacementCallback, data, NULL);
++}
++
++TEST_F(LibraryTest, NewQueryInDestroyCallbackIsRefusedAndNotified) {
++  ares_channel_t     *channel = nullptr;
++  struct ares_options opts;
++  int                 optmask = 0;
++
++  memset(&opts, 0, sizeof(opts));
++  opts.tries  = 1;
++  optmask    |= ARES_OPT_TRIES;
++  opts.flags  = ARES_FLAG_NOSEARCH;
++  optmask    |= ARES_OPT_FLAGS;
++
++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&channel, &opts, optmask));
++  // Nothing listens here; no traffic is needed.
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel, "127.0.0.1:53055"));
++
++  DestroyReentryData data;
++  data.channel            = channel;
++  data.outer_cbs          = 0;
++  data.replacement_cbs    = 0;
++  data.replacement_status = ARES_SUCCESS;
++
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_query_dnsrec(channel, "www.google.com", ARES_CLASS_IN,
++                              ARES_REC_TYPE_A, DestroyReentryCallback, &data,
++                              NULL));
++
++  ares_destroy(channel);
++
++  EXPECT_EQ((size_t)1, data.outer_cbs);
++  // Refused -- but notified, so the caller can release whatever it attached.
++  EXPECT_EQ((size_t)1, data.replacement_cbs);
++  EXPECT_EQ(ARES_EDESTRUCTION, data.replacement_status);
++}
++
++INSTANTIATE_TEST_SUITE_P(AddressFamilies, MockUDPSingleTryTest,
++                         ::testing::ValuesIn(ares::test::families),
++                         PrintFamily);
++
++TEST_P(MockUDPChannelTest, CancelInDestroyCallbackNoUseAfterFree) {
++  CancelInCbData data;
++  data.channel = channel_;
++  data.done    = false;
++  data.cbs     = 0;
++
++  /* Left unanswered, so both are still pending when the channel goes down. */
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
++                              ARES_REC_TYPE_A, CancelChannelCallback, &data,
++                              NULL));
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_query_dnsrec(channel_, "www.example.com", ARES_CLASS_IN,
++                              ARES_REC_TYPE_A, CancelChannelCallback, &data,
++                              NULL));
++  /* Without this the test can pass vacuously if a query failed to start. */
++  EXPECT_EQ(2, ares_queue_active_queries(channel_));
++
++  ares_destroy(channel_);
++  channel_ = nullptr; /* destroyed here, don't let the fixture repeat it */
++
++  EXPECT_TRUE(data.done);
++  /* Every query must be notified exactly once. */
++  EXPECT_EQ((size_t)2, data.cbs);
++}
++
++// Fixture with tries=1 so the first failure ends the query outright instead of
++// retrying it -- that is what drives execution into end_query()'s synchronous
++// (requeue==NULL) branch.
++// The tests below use the MockUDPSingleTryTest fixture defined above: tries=1,
++// so the first failure ends the query outright instead of retrying it, which
++// is what drives execution into end_query()'s synchronous (requeue==NULL)
++// branch.
++//
++
++// Connection-teardown route into the synchronous branch.  A malformed reply
++// makes process_answer() return EBADRESP, so handle_conn_error() tears the
++// connection down and ares_close_connection() requeues its queries with a NULL
++// requeue; with tries=1 the query is ended right there.  CVE-2026-33630 fixed
++// the deferred flush path only, so this one still double-freed.
++TEST_P(MockUDPSingleTryTest, CancelInCallbackConnTeardownNoDoubleFree) {
++  /* Too short to be a DNS header, so it fails to parse. */
++  std::vector<byte> malformed = {0x00, 0x00, 0x00, 0x00};
++  ON_CALL(server_, OnRequest("www.google.com", T_A))
++    .WillByDefault(SetReplyData(&server_, malformed));
++
++  CancelInCbData data;
++  data.channel = channel_;
++  data.done    = false;
++  data.cbs     = 0;
++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    CancelChannelCallback, &data, NULL);
++  Process();
++  EXPECT_TRUE(data.done);
++}
++
++// Server-removal route into the same synchronous branch, which the
++// connection-teardown test above does not cover.  Reconfiguring the server list
++// destroys the servers that are gone, and ares_close_sockets() closes their
++// connections with a NULL requeue -- a second way to reach end_query() with the
++// query still linked.  No Process() call is needed: the query is attached to a
++// connection by ares_query_dnsrec() itself, and nothing has replied to it.
++TEST_P(MockUDPSingleTryTest, CancelInCallbackServerRemovalNoDoubleFree) {
++  CancelInCbData data;
++  data.channel = channel_;
++  data.done    = false;
++  data.cbs     = 0;
++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    CancelChannelCallback, &data, NULL);
++
++  /* Drops the server the in-flight query is attached to. */
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel_, "127.0.0.1:53055"));
++  EXPECT_TRUE(data.done);
++}
++
++// ares_send_query_int() calls handle_conn_error() on a retryable write failure
++// and then keeps using its own query.  That teardown requeues the *other*
++// queries on the connection, and with tries=1 they are ended outright; if one
++// of their callbacks reentrantly cancels the channel, this query is freed too
++// -- it is still linked in all_queries, having only joined
++// conn->queries_to_conn on the success path further down.  Using it afterwards
++// is a use-after-free.
++//
++// The first query is left unanswered so it stays on the connection, then the
++// next write is made to fail with ECONNREFUSED so the second query takes the
++// error path while the first is still attached.
++//
++// Note this is masked on code that has not fixed the end_query() double-free:
++// that aborts inside handle_conn_error() before control returns here.
++TEST_P(MockUDPSingleTryTest, CancelInSiblingCallbackConnErrorNoUseAfterFree) {
++  CancelInCbData data;
++  data.channel = channel_;
++  data.done    = false;
++  data.cbs     = 0;
++
++  /* No reply configured for this one, so it stays attached to the connection. */
++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    CancelChannelCallback, &data, NULL);
++
++  ares_socket_functions sock_funcs;
++  memset(&sock_funcs, 0, sizeof(sock_funcs));
++  sock_funcs.asendv = ares_sendv_fail;
++  ares_set_socket_functions(channel_, &sock_funcs, NULL);
++  LibraryTest::SetFailSend();
++
++  QueryResult result;
++  ares_query_dnsrec(channel_, "www.example.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    QueryCallback, &result, NULL);
++
++  /* The write failure above tears the connection down, which ends the first
++   * query, whose callback cancels the channel and frees this one. */
++  EXPECT_TRUE(data.done);
++  /* The sibling is cancelled from the first query's callback rather than
++   * requeued; pin that rather than leaving it unstated. */
++  EXPECT_TRUE(result.done_);
++  EXPECT_EQ(ARES_ECANCELLED, result.status_);
++}
++
++// The socket-state callback -- registered with ARES_OPT_SOCK_STATE_CB, the
++// usual way c-ares is driven from an event loop -- used to be dispatched from
++// the middle of opening a connection, and ares_open_connection() keeps using
++// that connection afterwards.  A reentrant ares_cancel() from the callback
++// frees both the connection (through the idle sweep) and the in-flight query,
++// leaving the library using either.
++struct SockStateCancelData {
++  ares_channel_t *channel;
++  size_t          calls;
++};
++
++static void SockStateCancelCallback(void *data, ares_socket_t socket_fd,
++                                    int readable, int writable)
++{
++  SockStateCancelData *d = static_cast<SockStateCancelData *>(data);
++  (void)socket_fd;
++  (void)readable;
++  (void)writable;
++  d->calls++;
++  // Reentrant cancel from the socket-state notification.
++  if (d->channel != nullptr) {
++    ares_cancel(d->channel);
++  }
++}
++
++TEST_F(LibraryTest, CancelInSockStateCallbackNoUseAfterFree) {
++  SockStateCancelData data;
++  ares_channel_t     *chan = nullptr;
++  struct ares_options opts;
++  int                 optmask = 0;
++
++  data.channel = nullptr;
++  data.calls   = 0;
++
++  memset(&opts, 0, sizeof(opts));
++  opts.sock_state_cb      = SockStateCancelCallback;
++  opts.sock_state_cb_data = &data;
++  optmask                 = ARES_OPT_SOCK_STATE_CB;
++
++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&chan, &opts, optmask));
++  ASSERT_NE(nullptr, chan);
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan, "127.0.0.1:53055"));
++
++  /* Armed only now, so channel setup itself does not cancel. */
++  data.channel = chan;
++
++  QueryResult result;
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    QueryCallback, &result, NULL);
++
++  /* Opening the connection notifies, the notification cancels, and the
++   * library must still be able to finish -- and the lookup must actually be
++   * cancelled rather than the cancel quietly doing nothing. */
++  EXPECT_GT(data.calls, (size_t)0);
++  EXPECT_TRUE(result.done_);
++  EXPECT_EQ(ARES_ECANCELLED, result.status_);
++
++  data.channel = nullptr; /* don't cancel from teardown notifications */
++  ares_destroy(chan);
++}
++
++// Deferring the notification must not reorder it past the close of the
++// descriptor it names.  An event loop is told "stop watching fd N"; if fd N is
++// already closed by then, the number can have been handed to something else --
++// including to application code running from a deferred query callback -- and
++// the application ends up setting and clearing interest in a descriptor it now
++// owns for another purpose.
++//
++// The invariant is checked directly: while the callback naming the descriptor
++// runs, that descriptor must still be open.
++#ifndef _WIN32
++struct SockStateCloseOrderData {
++  size_t closes_seen;
++  size_t closed_while_already_shut;
++};
++
++static void SockStateCloseOrderCallback(void *data, ares_socket_t socket_fd,
++                                        int readable, int writable)
++{
++  SockStateCloseOrderData *d = static_cast<SockStateCloseOrderData *>(data);
++  if (readable || writable) {
++    return;
++  }
++  d->closes_seen++;
++  // F_GETFD on a closed descriptor fails with EBADF.  c-ares must not have
++  // closed it yet at this point.
++  if (fcntl(static_cast<int>(socket_fd), F_GETFD) == -1 && errno == EBADF) {
++    d->closed_while_already_shut++;
++  }
++}
++
++TEST_F(LibraryTest, SockStateCloseIsReportedBeforeDescriptorCloses) {
++  SockStateCloseOrderData data;
++  ares_channel_t         *chan = nullptr;
++  struct ares_options     opts;
++
++  data.closes_seen               = 0;
++  data.closed_while_already_shut = 0;
++
++  memset(&opts, 0, sizeof(opts));
++  opts.sock_state_cb      = SockStateCloseOrderCallback;
++  opts.sock_state_cb_data = &data;
++
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_init_options(&chan, &opts, ARES_OPT_SOCK_STATE_CB));
++  ASSERT_NE(nullptr, chan);
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan, "127.0.0.1:53055"));
++
++  QueryResult result;
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    QueryCallback, &result, NULL);
++  ares_destroy(chan);
++
++  EXPECT_GT(data.closes_seen, (size_t)0);
++  EXPECT_EQ((size_t)0, data.closed_while_already_shut)
++    << "the application was told to stop watching a descriptor c-ares had "
++       "already closed";
++}
++#endif
++
++// Reconfiguring the servers from an I/O hook frees the server and its
++// connection while the library is still holding both.  Deferred reclamation is
++// what makes these safe: the objects are unlinked from every lookup structure
++// immediately, so nothing can find them, but their memory survives until the
++// outermost call unwinds.  Without it these are heap-use-after-free in
++// ares_conn_connect() and handle_conn_error() respectively.
++//
++// This is the class behind CVE-2025-31498 and CVE-2025-62408 -- a connection
++// cleaned up while a caller further up the stack still held it.
++struct ReconfigureFromHookData {
++  ares_channel_t *channel;
++  bool            done;
++  int             status;
++};
++
++static int ReconfigureConfigureCallback(ares_socket_t fd, int type, void *data)
++{
++  ReconfigureFromHookData *d = static_cast<ReconfigureFromHookData *>(data);
++  (void)fd;
++  (void)type;
++  // Frees the server this connection is being opened for.
++  ares_set_servers_csv(d->channel, "127.0.0.1:53056");
++  return 0;
++}
++
++static void ReconfigureFromHookCallback(void *arg, ares_status_t status,
++                                        size_t                   timeouts,
++                                        const ares_dns_record_t *dnsrec)
++{
++  ReconfigureFromHookData *d = static_cast<ReconfigureFromHookData *>(arg);
++  (void)timeouts;
++  (void)dnsrec;
++  d->done   = true;
++  d->status = static_cast<int>(status);
++}
++
++TEST_F(LibraryTest, ReconfigureInConfigureHookNoUseAfterFree) {
++  ares_channel_t         *chan = nullptr;
++  struct ares_options     opts;
++  int                     optmask = 0;
++  ReconfigureFromHookData data;
++
++  memset(&opts, 0, sizeof(opts));
++  opts.tries  = 1;
++  optmask    |= ARES_OPT_TRIES;
++  opts.flags  = ARES_FLAG_NOSEARCH;
++  optmask    |= ARES_OPT_FLAGS;
++
++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&chan, &opts, optmask));
++  ASSERT_NE(nullptr, chan);
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan, "127.0.0.1:53055"));
++
++  data.channel = chan;
++  data.done    = false;
++  data.status  = ARES_SUCCESS;
++  ares_set_socket_configure_callback(chan, ReconfigureConfigureCallback, &data);
++
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    ReconfigureFromHookCallback, &data, NULL);
++
++  // Must complete rather than be stranded -- every exit from the send path
++  // either enqueues the query or ends it.
++  EXPECT_TRUE(data.done);
++  EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));
++  ares_destroy(chan);
++}
++
++// The second route to the same freed connection, and the one that drove the
++// change from suppressing the idle sweep to deferring the notification:
++// reconfiguring the servers from the socket-state callback destroys the server
++// and with it the connection ares_open_connection() is still using.  Nothing
++// covered this route, so a regression in it would have gone unnoticed.
++struct SockStateReconfigureData {
++  ares_channel_t *channel;
++  size_t          calls;
++};
++
++static void SockStateReconfigureCallback(void *data, ares_socket_t socket_fd,
++                                         int readable, int writable)
++{
++  SockStateReconfigureData *d =
++    static_cast<SockStateReconfigureData *>(data);
++  (void)socket_fd;
++  (void)readable;
++  (void)writable;
++  d->calls++;
++  if (d->channel != nullptr) {
++    // Destroys the server, and with it the connection being opened.
++    ares_set_servers_csv(d->channel, "127.0.0.1:53056");
++  }
++}
++
++TEST_F(LibraryTest, ReconfigureInSockStateCallbackNoUseAfterFree) {
++  SockStateReconfigureData data;
++  ares_channel_t          *chan = nullptr;
++  struct ares_options      opts;
++
++  data.channel = nullptr;
++  data.calls   = 0;
++
++  memset(&opts, 0, sizeof(opts));
++  opts.sock_state_cb      = SockStateReconfigureCallback;
++  opts.sock_state_cb_data = &data;
++
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_init_options(&chan, &opts, ARES_OPT_SOCK_STATE_CB));
++  ASSERT_NE(nullptr, chan);
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan, "127.0.0.1:53055"));
++
++  /* Armed only now, so channel setup itself does not reconfigure. */
++  data.channel = chan;
++
++  QueryResult result;
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    QueryCallback, &result, NULL);
++
++  EXPECT_GT(data.calls, (size_t)0);
++
++  data.channel = nullptr; /* don't reconfigure from teardown notifications */
++  ares_destroy(chan);
++}
++
++// Deferring the notifications must not lose them: every public entry point
++// that closes a socket still has to tell the application about it before it
++// returns, or an event loop is left polling a descriptor that c-ares closed.
++struct SockStateRecordData {
++  std::vector<std::pair<ares_socket_t, bool>> events; /* fd, still-armed */
++};
++
++static void SockStateRecordCallback(void *data, ares_socket_t socket_fd,
++                                    int readable, int writable)
++{
++  SockStateRecordData *d = static_cast<SockStateRecordData *>(data);
++  d->events.push_back(std::make_pair(socket_fd, readable || writable));
++}
++
++static bool SawClose(const SockStateRecordData &d)
++{
++  for (size_t i = 0; i < d.events.size(); i++) {
++    if (!d.events[i].second) {
++      return true;
++    }
++  }
++  return false;
++}
++
++class SockStateDeliveryTest : public LibraryTest {
++protected:
++  void OpenConnection(ares_channel_t **chan, SockStateRecordData *data,
++                      QueryResult *result)
++  {
++    struct ares_options opts;
++    memset(&opts, 0, sizeof(opts));
++    opts.sock_state_cb      = SockStateRecordCallback;
++    opts.sock_state_cb_data = data;
++
++    ASSERT_EQ(ARES_SUCCESS,
++              ares_init_options(chan, &opts, ARES_OPT_SOCK_STATE_CB));
++    ASSERT_NE(nullptr, *chan);
++    /* TEST-NET-1, guaranteed not to answer, so the socket is still open when
++     * the call under test runs. */
++    ASSERT_EQ(ARES_SUCCESS, ares_set_servers_csv(*chan, "192.0.2.1:53"));
++
++    ares_query_dnsrec(*chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                      QueryCallback, result, NULL);
++    ASSERT_FALSE(result->done_);
++    ASSERT_FALSE(data->events.empty());
++    ASSERT_TRUE(data->events.back().second); /* opened, armed for read */
++    data->events.clear();
++  }
++};
++
++TEST_F(SockStateDeliveryTest, CancelReportsSocketClose) {
++  ares_channel_t     *chan = nullptr;
++  SockStateRecordData data;
++  QueryResult         result;
++
++  OpenConnection(&chan, &data, &result);
++  ares_cancel(chan);
++  EXPECT_TRUE(SawClose(data)) << "ares_cancel() closed the socket without "
++                                 "telling the application";
++  ares_destroy(chan);
++}
++
++TEST_F(SockStateDeliveryTest, SetServersReportsSocketClose) {
++  ares_channel_t     *chan = nullptr;
++  SockStateRecordData data;
++  QueryResult         result;
++
++  OpenConnection(&chan, &data, &result);
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan, "198.51.100.1:53"));
++  EXPECT_TRUE(SawClose(data)) << "ares_set_servers_csv() closed the socket "
++                                 "without telling the application";
++  ares_destroy(chan);
++}
++
++TEST_F(SockStateDeliveryTest, DestroyReportsSocketClose) {
++  ares_channel_t     *chan = nullptr;
++  SockStateRecordData data;
++  QueryResult         result;
++
++  OpenConnection(&chan, &data, &result);
++  ares_destroy(chan);
++  EXPECT_TRUE(SawClose(data)) << "ares_destroy() closed the socket without "
++                                 "telling the application";
++}
++
++// The server-state callback is dispatched from the middle of processing, and
++// every caller keeps using its query afterwards.  Nothing documents the
++// callback as non-reentrant, and the channel lock is recursive precisely so
++// API calls from callbacks are allowed -- so an application that cancels from
++// it left the library using a freed query.
++//
++// No hostile input is needed: an ordinary timeout reaches the same place.  A
++// SERVFAIL is used here because it is deterministic in the harness.
++struct ServerStateCancelData {
++  ares_channel_t *channel;
++  int             server_cb_calls;
++  bool            query_done;
++};
++
++static void ServerStateCancelCallback(const char *server_string,
++                                      ares_bool_t success, int flags,
++                                      void *data) {
++  ServerStateCancelData *d = static_cast<ServerStateCancelData *>(data);
++  (void)server_string;
++  (void)success;
++  (void)flags;
++  d->server_cb_calls++;
++  // Reentrant cancel from the notification.
++  ares_cancel(d->channel);
++}
++
++static void ServerStateQueryCallback(void *arg, ares_status_t status,
++                                     size_t timeouts,
++                                     const ares_dns_record_t *dnsrec) {
++  ServerStateCancelData *d = static_cast<ServerStateCancelData *>(arg);
++  (void)status;
++  (void)timeouts;
++  (void)dnsrec;
++  d->query_done = true;
++}
++
++// The advisory's headline claim is that no hostile input is needed, because an
++// ordinary timeout reaches the same place.  The SERVFAIL test below does not
++// show that; this one does.
++class ServerStateTimeoutCancelTest
++  : public MockChannelOptsTest,
++    public ::testing::WithParamInterface<int> {
++ public:
++  ServerStateTimeoutCancelTest()
++    : MockChannelOptsTest(1, GetParam(), false, false, FillOptions(&opts_),
++                          ARES_OPT_TIMEOUTMS | ARES_OPT_TRIES) {}
++  static struct ares_options *FillOptions(struct ares_options *opts) {
++    memset(opts, 0, sizeof(struct ares_options));
++    opts->timeout = 100;
++    opts->tries   = 3;
++    return opts;
++  }
++
++ private:
++  struct ares_options opts_;
++};
++
++TEST_P(ServerStateTimeoutCancelTest, CancelInServerStateCallbackOnTimeout) {
++  ServerStateCancelData data;
++  data.channel         = channel_;
++  data.server_cb_calls = 0;
++  data.query_done      = false;
++
++  ares_set_server_state_callback(channel_, ServerStateCancelCallback, &data);
++
++  // No reply configured, so the query times out and the notification comes
++  // from process_timeouts() rather than from a response.
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
++                              ARES_REC_TYPE_A, ServerStateQueryCallback, &data,
++                              NULL));
++  Process();
++
++  EXPECT_GT(data.server_cb_calls, 0);
++  EXPECT_TRUE(data.query_done);
++}
++
++INSTANTIATE_TEST_SUITE_P(AddressFamilies, ServerStateTimeoutCancelTest,
++                         ::testing::ValuesIn(ares::test::families),
++                         PrintFamily);
++
++// Unregistering with a NULL callback discards whatever is still queued -- the
++// documented behaviour of deferring delivery, and the only way an application
++// can opt back out once notifications are in flight.
++struct ServerStateUnregisterData {
++  ares_channel_t *channel;
++  size_t          server_cb_calls;
++  bool            query_done;
++};
++
++static void ServerStateUnregisterCallback(const char *server_string,
++                                          ares_bool_t success,
++                                          int flags, void *user_data)
++{
++  ServerStateUnregisterData *d =
++    static_cast<ServerStateUnregisterData *>(user_data);
++  (void)server_string;
++  (void)success;
++  (void)flags;
++  d->server_cb_calls++;
++  // Clear ourselves from inside the first notification.  Any notification
++  // still queued behind this one must be dropped rather than delivered.
++  ares_set_server_state_callback(d->channel, NULL, NULL);
++}
++
++static void ServerStateUnregisterQueryCallback(void *arg, ares_status_t status,
++                                               size_t timeouts,
++                                               const ares_dns_record_t *dnsrec)
++{
++  ServerStateUnregisterData *d =
++    static_cast<ServerStateUnregisterData *>(arg);
++  (void)status;
++  (void)timeouts;
++  (void)dnsrec;
++  d->query_done = true;
++}
++
++TEST_P(ServerStateTimeoutCancelTest, UnregisterInCallbackDiscardsQueued) {
++  ServerStateUnregisterData data;
++  data.channel         = channel_;
++  data.server_cb_calls = 0;
++  data.query_done      = false;
++
++  ares_set_server_state_callback(channel_, ServerStateUnregisterCallback,
++                                 &data);
++
++  // No reply configured: the query times out on every try, so more than one
++  // notification is queued before the flush point is reached.
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
++                              ARES_REC_TYPE_A,
++                              ServerStateUnregisterQueryCallback, &data, NULL));
++  Process();
++
++  EXPECT_EQ((size_t)1, data.server_cb_calls);
++  EXPECT_TRUE(data.query_done);
++}
++
++TEST_P(MockUDPChannelTest, CancelInServerStateCallbackNoUseAfterFree) {
++  DNSPacket servfail;
++  servfail.set_response().set_aa().set_rcode(SERVFAIL)
++    .add_question(new DNSQuestion("www.google.com", T_A));
++  ON_CALL(server_, OnRequest("www.google.com", T_A))
++    .WillByDefault(SetReply(&server_, &servfail));
++
++  ServerStateCancelData data;
++  data.channel         = channel_;
++  data.server_cb_calls = 0;
++  data.query_done      = false;
++
++  ares_set_server_state_callback(channel_, ServerStateCancelCallback, &data);
++
++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    ServerStateQueryCallback, &data, NULL);
++  Process();
++
++  EXPECT_GT(data.server_cb_calls, 0);
++  EXPECT_TRUE(data.query_done);
++}
++
++// The deferred requeue list records the target server as a raw pointer, and
++// the drain never revalidated it -- although it does revalidate the query, by
++// qid, for exactly the same reason.  Application callbacks run from inside that
++// drain, and a callback may legally reconfigure the servers, which frees the
++// ones no longer in the list.  A later entry in the same drain then dispatches
++// through a freed ares_server_t.
++//
++// Two replies must be read in one batch: an ordinary answer whose callback
++// reconfigures, and a FORMERR carrying no OPT record, which is what makes
++// process_answer() queue a retry *to the same server* (the EDNS fallback --
++// the only site that records a server pointer at all).
++struct ReconfigureInCbData {
++  ares_channel_t *channel;
++  bool            done;
++};
++
++static void ReconfigureChannelCallback(void *arg, ares_status_t status,
++                                       size_t timeouts,
++                                       const ares_dns_record_t *dnsrec) {
++  ReconfigureInCbData *data = static_cast<ReconfigureInCbData *>(arg);
++  (void)status;
++  (void)timeouts;
++  (void)dnsrec;
++  data->done = true;
++  /* Frees every server absent from the new configuration. */
++  ares_set_servers_csv(data->channel, "127.0.0.1:53055");
++}
++
++TEST_P(MockUDPChannelTest, ReconfigureInCallbackStaleRequeueServer) {
++  DNSPacket okrsp;
++  okrsp.set_response().set_aa()
++    .add_question(new DNSQuestion("www.google.com", T_A))
++    .add_answer(new DNSARR("www.google.com", 100, {1, 2, 3, 4}));
++  ON_CALL(server_, OnRequest("www.google.com", T_A))
++    .WillByDefault(SetReply(&server_, &okrsp));
++
++  /* FORMERR with no OPT record: the server looks like it does not understand
++   * EDNS, so the query is queued for retry to this same server. */
++  DNSPacket formerr;
++  formerr.set_response().set_aa().set_rcode(FORMERR)
++    .add_question(new DNSQuestion("www.example.com", T_A));
++  ON_CALL(server_, OnRequest("www.example.com", T_A))
++    .WillByDefault(SetReply(&server_, &formerr));
++
++  ReconfigureInCbData data;
++  data.channel = channel_;
++  data.done    = false;
++
++  QueryResult second;
++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    ReconfigureChannelCallback, &data, NULL);
++  ares_query_dnsrec(channel_, "www.example.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    QueryCallback, &second, NULL);
++
++  /* Both replies have to be consumed in a single pass so they share one
++   * deferred-requeue scope -- that is what puts the ENDQUERY entry whose
++   * callback reconfigures ahead of the REQUEUE entry holding a server
++   * pointer.  The usual Process() loop lets c-ares read between the two, so
++   * they never share a batch; answer both first, then read once. */
++  for (int i = 0; i < 4; i++) {
++    std::set<ares_socket_t> server_fds = fds();
++    fd_set                  r;
++    struct timeval          tv   = {0, 20000};
++    int                     nfds = 0;
++    FD_ZERO(&r);
++    for (ares_socket_t fd : server_fds) {
++      FD_SET(fd, &r);
++      if ((int)fd >= nfds) {
++        nfds = (int)fd + 1;
++      }
++    }
++    if (select(nfds, &r, nullptr, nullptr, &tv) <= 0) {
++      break;
++    }
++    for (ares_socket_t fd : server_fds) {
++      if (FD_ISSET(fd, &r)) {
++        ProcessFD(fd);
++      }
++    }
++  }
++  {
++    fd_set         readers;
++    fd_set         writers;
++    struct timeval tv = {0, 0};
++    int            nfds;
++    FD_ZERO(&readers);
++    FD_ZERO(&writers);
++    nfds = ares_fds(channel_, &readers, &writers);
++    select(nfds, &readers, &writers, nullptr, &tv);
++    ares_process(channel_, &readers, &writers);
++  }
++
++  EXPECT_TRUE(data.done);
++
++  /* With the fix the FORMERR query is correctly re-dispatched (to the newly
++   * configured, unreachable server) rather than going through a freed one, so
++   * it is still outstanding here.  Cancel it so its callback runs while its
++   * result object is still in scope. */
++  ares_cancel(channel_);
++  EXPECT_TRUE(second.done_);
++}
++
++// ares_servers_remove_stale() destroys each stale server in turn, and that
++// reaches application callbacks (ares_destroy_server() -> ares_close_sockets()
++// -> ares_requeue_queries() -> end_query()).  A callback that reconfigures the
++// servers again destroys the servers the outer loop has not visited yet, so a
++// cached "next" node points at freed memory.
++struct NestedReconfigureData {
++  ares_channel_t *channel;
++  bool            nested;
++};
++
++static void NestedReconfigureCallback(void *arg, ares_status_t status,
++                                      size_t                   timeouts,
++                                      const ares_dns_record_t *dnsrec) {
++  NestedReconfigureData *data = static_cast<NestedReconfigureData *>(arg);
++  (void)status;
++  (void)timeouts;
++  (void)dnsrec;
++  if (data->nested) {
++    return;
++  }
++  data->nested = true;
++  // Destroys the stale servers the outer removal loop has not reached yet.
++  ares_set_servers_csv(data->channel, "");
++}
++
++TEST_F(LibraryTest, NestedReconfigureInCallbackRemoveStale) {
++  ares_channel_t     *channel = nullptr;
++  struct ares_options opts;
++  int                 optmask = 0;
++
++  memset(&opts, 0, sizeof(opts));
++  /* One try per server, so tearing them down exhausts the query's retries and
++   * runs its callback from inside the removal loop. */
++  opts.tries  = 1;
++  optmask    |= ARES_OPT_TRIES;
++  opts.flags  = ARES_FLAG_NOSEARCH;
++  optmask    |= ARES_OPT_FLAGS;
++
++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&channel, &opts, optmask));
++  /* Three servers, so the loop still has entries after destroying the first.
++   * Nothing listens on these ports; no traffic is needed. */
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_set_servers_csv(channel, "127.0.0.1:53101,127.0.0.1:53102,"
++                                          "127.0.0.1:53103"));
++
++  NestedReconfigureData data;
++  data.channel = channel;
++  data.nested  = false;
++
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_query_dnsrec(channel, "www.example.com", ARES_CLASS_IN,
++                              ARES_REC_TYPE_A, NestedReconfigureCallback,
++                              &data, NULL));
++
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel, ""));
++  EXPECT_TRUE(data.nested);
++
++  ares_destroy(channel);
++}
++
++// The same nesting, but the nested reconfiguration *installs* a server rather
++// than clearing the list.  Restarting the removal walk from the head then
++// re-judges that server against the outer call's list, decides it is stale and
++// deletes it -- so ares_set_servers_csv() returns success and leaves the
++// channel with no servers at all.  Memory-safe and still wrong.
++static void NestedReplaceCallback(void *arg, ares_status_t status,
++                                  size_t                   timeouts,
++                                  const ares_dns_record_t *dnsrec) {
++  NestedReconfigureData *data = static_cast<NestedReconfigureData *>(arg);
++  (void)status;
++  (void)timeouts;
++  (void)dnsrec;
++  if (data->nested) {
++    return;
++  }
++  data->nested = true;
++  // Installs a server the outer loop has never seen.
++  ares_set_servers_csv(data->channel, "127.0.0.1:53201");
++}
++
++TEST_F(LibraryTest, NestedReconfigureInCallbackKeepsNestedServers) {
++  ares_channel_t     *channel = nullptr;
++  struct ares_options opts;
++  int                 optmask = 0;
++
++  memset(&opts, 0, sizeof(opts));
++  opts.tries  = 1;
++  optmask    |= ARES_OPT_TRIES;
++  opts.flags  = ARES_FLAG_NOSEARCH;
++  optmask    |= ARES_OPT_FLAGS;
++
++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&channel, &opts, optmask));
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel, "127.0.0.1:53101"));
++
++  NestedReconfigureData data;
++  data.channel = channel;
++  data.nested  = false;
++
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_query_dnsrec(channel, "www.example.com", ARES_CLASS_IN,
++                              ARES_REC_TYPE_A, NestedReplaceCallback, &data,
++                              NULL));
++
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel, "127.0.0.1:53301"));
++  EXPECT_TRUE(data.nested);
++
++  // The nested call reconciled the whole list; what it installed must survive.
++  char *csv = ares_get_servers_csv(channel);
++  ASSERT_NE(nullptr, csv);
++  EXPECT_STREQ("127.0.0.1:53201", csv);
++  ares_free_string(csv);
++
++  ares_destroy(channel);
++}
++
+ TEST_P(MockUDPChannelTest, CancelInCallbackNoDoubleFree) {
+   DNSPacket reply;
+   reply.set_response().set_aa()
+@@ -1940,6 +3007,7 @@ TEST_P(MockUDPChannelTest, CancelInCallbackNoDoubleFree) {
+   CancelInCbData data;
+   data.channel = channel_;
+   data.done    = false;
++  data.cbs     = 0;
+   ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
+                     CancelChannelCallback, &data, NULL);
+   Process();
diff --git a/meta-oe/recipes-support/c-ares/c-ares/0002-Deliver-deferred-socket-server-state-notifications.patch b/meta-oe/recipes-support/c-ares/c-ares/0002-Deliver-deferred-socket-server-state-notifications.patch
new file mode 100644
index 0000000000..c34d3ab7c7
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0002-Deliver-deferred-socket-server-state-notifications.patch
@@ -0,0 +1,393 @@
+From f944c4718fd672c9c0befd65a340abb2ccfc1a31 Mon Sep 17 00:00:00 2001
+From: Brad House <brad@brad-house.com>
+Date: Sun, 18 Oct 2026 20:28:11 -0400
+Subject: [PATCH] Deliver deferred socket/server-state notifications only from
+ the outermost public call (#1340)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Backport of f023a52a (#1340) to v1.34.
+
+The recent change that queues socket-state and server-state
+notifications delivers them, and runs the deferred cleanup, only from
+the outermost `ares_deferred_cb_leave()`. `ares_send_nolock()` brackets
+`ares_send_query()` itself, but most public lookup functions never
+opened a region of their own. When reached from `ares_getaddrinfo()`,
+`ares_query_dnsrec()` and similar, the bracket inside
+`ares_send_nolock()` was therefore the outermost one. Notifications were
+then delivered from inside an internal call while the library was still
+in the middle of the public call, and its callers were still using their
+lookup state (the host query, the query id out-pointer, ...). A
+server-state callback that reconfigures the servers, which
+`ares_set_server_state_callback(3)` documents as allowed, could end that
+lookup before the caller was done with it.
+
+This is a regression in unreleased code. No released version is
+affected.
+
+The outermost region is now opened by the public entry points
+themselves, under the channel lock:
+
+- `ares_send_dnsrec()` (also used by `ares_send()`)
+- `ares_query_dnsrec()` (also used by `ares_query()`)
+- `ares_search()`, `ares_search_dnsrec()`
+- `ares_getaddrinfo()` (also used by `ares_gethostbyname()`)
+- `ares_gethostbyaddr()`, `ares_getnameinfo()`
+- `ares_process_pending_write()`: a failed flush closes the connection
+and fails its queries over, and this function had no bracket at all.
+
+`ares_process_fds()` (and through it
+`ares_process()`/`ares_process_fd()`), `ares_cancel()`, `ares_destroy()`
+and the server configuration functions already had their own. The nested
+bracket in `ares_send_nolock()` stays, because it keeps connections and
+servers unlinked during the send readable until the send returns.
+Internal sends made from query callbacks (search next domain,
+getaddrinfo next lookup, requeue, server probes) already run inside the
+processing bracket.
+
+The comments on `ares_deferred_cb_enter()` and the flush now state the
+rule: the outermost region belongs to the public entry point, never to
+an internal helper.
+
+The documented behaviour (notifications arrive before the outermost
+c-ares call returns) does not change, so no man page changes.
+
+Two new `LibraryTest` cases in `test/ares-test-mock.cc`. The IPv6 server
+cannot get a socket, so the first send fails over to the IPv4 server,
+and a server-state callback then reconfigures the servers:
+
+- `ServerFailoverDuringGetAddrInfo`: the lookup completes cleanly. It
+fails under ASAN without this change.
+- `ServerFailoverDuringQuery`: the query id from `ares_query_dnsrec()`
+is already reported by the time the query callback runs. It fails
+without this change.
+
+The full non-live suite passes under ASAN/UBSAN and with
+`-DCARES_WERROR=ON`.
+
+Signed-off-by: Brad House <brad@brad-house.com>
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/f944c4718fd672c9c0befd65a340abb2ccfc1a31]
+GHSA: GHSA-wpr3-8q3r-4q8c, GHSA-97vq-4mxv-7vhm, GHSA-mw23-pfg6-2x9r, GHSA-rf6g-ww74-97qh, GHSA-v33j-65h4-4ch8, GHSA-pj7p-v3cw-hq66
+---
+ src/lib/ares_conn.c          |   4 +-
+ src/lib/ares_getaddrinfo.c   |   5 ++
+ src/lib/ares_gethostbyaddr.c |   5 ++
+ src/lib/ares_getnameinfo.c   |   5 ++
+ src/lib/ares_private.h       |  10 ++++
+ src/lib/ares_process.c       |   6 ++
+ src/lib/ares_query.c         |   5 ++
+ src/lib/ares_search.c        |  10 ++++
+ src/lib/ares_send.c          |  13 ++++-
+ test/ares-test-mock.cc       | 106 +++++++++++++++++++++++++++++++++++
+ 10 files changed, 166 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c
+index 78f57e7d10..4cc0d1871d 100644
+--- a/src/lib/ares_conn.c
++++ b/src/lib/ares_conn.c
+@@ -94,7 +94,9 @@ static void ares_deferred_cb_flush(ares_channel_t *channel)
+ {
+   /* Only the outermost frame delivers: anything above us on the stack may
+    * still be holding the connection a reentrant call from one of these
+-   * callbacks could free.
++   * callbacks could free, or lookup state of its own that a callback could
++   * end.  That is why the outermost frame belongs to the public entry point
++   * and never to an internal helper; see ares_deferred_cb_enter().
+    *
+    * The dispatch below counts as a nesting level of its own.  Without that, a
+    * callback that calls back into the library re-enters here through the
+diff --git a/src/lib/ares_getaddrinfo.c b/src/lib/ares_getaddrinfo.c
+index 6d9e21af4b..5d9ddb311e 100644
+--- a/src/lib/ares_getaddrinfo.c
++++ b/src/lib/ares_getaddrinfo.c
+@@ -762,7 +762,12 @@ void ares_getaddrinfo(ares_channel_t *channel, const char *name,
+     return;
+   }
+   ares_channel_lock(channel);
++  /* Notifications raised along the way are delivered once this whole call
++   * has unwound, not from inside the internals it runs.  See
++   * ares_deferred_cb_enter(). */
++  ares_deferred_cb_enter(channel);
+   ares_getaddrinfo_int(channel, name, service, hints, callback, arg);
++  ares_deferred_cb_leave(channel);
+   ares_channel_unlock(channel);
+ }
+ 
+diff --git a/src/lib/ares_gethostbyaddr.c b/src/lib/ares_gethostbyaddr.c
+index 69c509ab11..b314359331 100644
+--- a/src/lib/ares_gethostbyaddr.c
++++ b/src/lib/ares_gethostbyaddr.c
+@@ -112,7 +112,12 @@ void ares_gethostbyaddr(ares_channel_t *channel, const void *addr, int addrlen,
+     return;
+   }
+   ares_channel_lock(channel);
++  /* Notifications raised along the way are delivered once this whole call
++   * has unwound, not from inside the internals it runs.  See
++   * ares_deferred_cb_enter(). */
++  ares_deferred_cb_enter(channel);
+   ares_gethostbyaddr_nolock(channel, addr, addrlen, family, callback, arg);
++  ares_deferred_cb_leave(channel);
+   ares_channel_unlock(channel);
+ }
+ 
+diff --git a/src/lib/ares_getnameinfo.c b/src/lib/ares_getnameinfo.c
+index 0159354530..7365e9ed82 100644
+--- a/src/lib/ares_getnameinfo.c
++++ b/src/lib/ares_getnameinfo.c
+@@ -194,7 +194,12 @@ void ares_getnameinfo(ares_channel_t *channel, const struct sockaddr *sa,
+   }
+ 
+   ares_channel_lock(channel);
++  /* Notifications raised along the way are delivered once this whole call
++   * has unwound, not from inside the internals it runs.  See
++   * ares_deferred_cb_enter(). */
++  ares_deferred_cb_enter(channel);
+   ares_getnameinfo_int(channel, sa, salen, flags_int, callback, arg);
++  ares_deferred_cb_leave(channel);
+   ares_channel_unlock(channel);
+ }
+ 
+diff --git a/src/lib/ares_private.h b/src/lib/ares_private.h
+index 0a1029e0f8..9610ba7dab 100644
+--- a/src/lib/ares_private.h
++++ b/src/lib/ares_private.h
+@@ -676,6 +676,16 @@ void          ares_server_reap(ares_server_t *server);
+  *  Nesting is counted; queued notifications are delivered by the outermost
+  *  leave.
+  *
++ *  The outermost region must be opened by the public entry point itself
++ *  (ares_send_dnsrec(), ares_query_dnsrec(), ares_search(), ares_getaddrinfo(),
++ *  ares_process_fds(), ares_set_servers_*(), ...), with the channel lock
++ *  held, around everything it does.  Internal helpers such as
++ *  ares_send_nolock() open nested regions of their own, but their callers
++ *  often keep using lookup state afterwards -- a host or search query, a
++ *  query id out-pointer -- that a callback reentering the library may end
++ *  and free.  If such a helper were the outermost region, its leave would
++ *  run the callbacks while that state is still in use.
++ *
+  *  \param[in] channel  Initialized ares channel.
+  */
+ void          ares_deferred_cb_enter(ares_channel_t *channel);
+diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
+index 82f53610fb..1569408b1b 100644
+--- a/src/lib/ares_process.c
++++ b/src/lib/ares_process.c
+@@ -490,6 +490,11 @@ void ares_process_pending_write(ares_channel_t *channel)
+     return;
+   }
+ 
++  /* A failed flush closes the connection and fails its queries over, which
++   * notifies.  Deliver once we are done walking the servers, and keep
++   * anything unlinked meanwhile readable until then. */
++  ares_deferred_cb_enter(channel);
++
+   /* Set as untriggerd before calling into ares_conn_flush(), this is
+    * because its possible ares_conn_flush() might cause additional data to
+    * be enqueued if there is some form of exception so it will need to recurse.
+@@ -513,6 +518,7 @@ void ares_process_pending_write(ares_channel_t *channel)
+     }
+   }
+ 
++  ares_deferred_cb_leave(channel);
+   ares_channel_unlock(channel);
+ }
+ 
+diff --git a/src/lib/ares_query.c b/src/lib/ares_query.c
+index ca3b6a9b73..0cf7f70760 100644
+--- a/src/lib/ares_query.c
++++ b/src/lib/ares_query.c
+@@ -125,7 +125,12 @@ ares_status_t ares_query_dnsrec(ares_channel_t *channel, const char *name,
+   }
+ 
+   ares_channel_lock(channel);
++  /* Notifications raised along the way are delivered once this whole call
++   * has unwound, not from inside the internals it runs.  See
++   * ares_deferred_cb_enter(). */
++  ares_deferred_cb_enter(channel);
+   status = ares_query_nolock(channel, name, dnsclass, type, callback, arg, qid);
++  ares_deferred_cb_leave(channel);
+   ares_channel_unlock(channel);
+   return status;
+ }
+diff --git a/src/lib/ares_search.c b/src/lib/ares_search.c
+index c605caf42c..ebc3d91e20 100644
+--- a/src/lib/ares_search.c
++++ b/src/lib/ares_search.c
+@@ -463,7 +463,12 @@ void ares_search(ares_channel_t *channel, const char *name, int dnsclass,
+   }
+ 
+   ares_channel_lock(channel);
++  /* Notifications raised along the way are delivered once this whole call
++   * has unwound, not from inside the internals it runs.  See
++   * ares_deferred_cb_enter(). */
++  ares_deferred_cb_enter(channel);
+   ares_search_int(channel, dnsrec, ares_dnsrec_convert_cb, carg);
++  ares_deferred_cb_leave(channel);
+   ares_channel_unlock(channel);
+ 
+   ares_dns_record_destroy(dnsrec);
+@@ -481,7 +486,12 @@ ares_status_t ares_search_dnsrec(ares_channel_t          *channel,
+   }
+ 
+   ares_channel_lock(channel);
++  /* Notifications raised along the way are delivered once this whole call
++   * has unwound, not from inside the internals it runs.  See
++   * ares_deferred_cb_enter(). */
++  ares_deferred_cb_enter(channel);
+   status = ares_search_int(channel, dnsrec, callback, arg);
++  ares_deferred_cb_leave(channel);
+   ares_channel_unlock(channel);
+ 
+   return status;
+diff --git a/src/lib/ares_send.c b/src/lib/ares_send.c
+index 2e0482bf19..dd4a28544b 100644
+--- a/src/lib/ares_send.c
++++ b/src/lib/ares_send.c
+@@ -246,8 +246,12 @@ ares_status_t ares_send_nolock(ares_channel_t *channel, ares_server_t *server,
+   /* Perform the first query action. */
+ 
+   /* Sending opens and writes to connections and can mark a server down, both
+-   * of which notify.  Deliver those once we are done with the connection and
+-   * the server, not part-way through. */
++   * of which notify.  This bracket keeps any connection or server unlinked
++   * during the send readable until it returns.  It is never the outermost
++   * one: every public entry point that can get here, and query processing,
++   * holds its own, so delivery waits until the caller -- which may still be
++   * holding its own lookup state, as ares_getaddrinfo() does -- has unwound
++   * too. */
+   ares_deferred_cb_enter(channel);
+   status = ares_send_query(server, query, &now);
+   ares_deferred_cb_leave(channel);
+@@ -271,9 +275,14 @@ ares_status_t ares_send_dnsrec(ares_channel_t          *channel,
+   }
+ 
+   ares_channel_lock(channel);
++  /* Notifications raised along the way are delivered once this whole call
++   * has unwound, not from inside the internals it runs.  See
++   * ares_deferred_cb_enter(). */
++  ares_deferred_cb_enter(channel);
+ 
+   status = ares_send_nolock(channel, NULL, 0, dnsrec, callback, arg, qid);
+ 
++  ares_deferred_cb_leave(channel);
+   ares_channel_unlock(channel);
+ 
+   return status;
+diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc
+index 2158c5a913..b848c02434 100644
+--- a/test/ares-test-mock.cc
++++ b/test/ares-test-mock.cc
+@@ -2533,6 +2533,112 @@ TEST_F(LibraryTest, ReconfigureInSockStateCallbackNoUseAfterFree) {
+   data.channel = nullptr; /* don't reconfigure from teardown notifications */
+   ares_destroy(chan);
+ }
++// Server-state notifications raised while a public call is issuing its first
++// request must not be delivered until that whole call has unwound.  A
++// failover handler that reconfigures the servers ends the in-flight request,
++// and with it the state the issuing call still has to finish with.  The IPv6
++// server cannot get a socket, so the first send fails over to the IPv4 one
++// and queues a failure notification for the handler below.
++static ares_socket_t FailoverNoIPv6Socket(int af, int type, int protocol,
++                                          void *user_data)
++{
++  (void)user_data;
++  if (af == AF_INET6) {
++    return ARES_SOCKET_BAD;
++  }
++  return socket(af, type, protocol);
++}
++
++static void FailoverOnServerDown(const char *server_string, ares_bool_t success,
++                                 int flags, void *data)
++{
++  (void)server_string;
++  (void)flags;
++  if (!success) {
++    ares_set_servers_csv(static_cast<ares_channel_t *>(data),
++                         "127.0.0.1:53063");
++  }
++}
++
++static ares_channel_t *FailoverChannel(ares_socket_functions *funcs)
++{
++  ares_channel_t     *chan = nullptr;
++  struct ares_options opts;
++
++  memset(&opts, 0, sizeof(opts));
++  opts.tries = 1;
++  opts.flags = ARES_FLAG_NOSEARCH;
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_init_options(&chan, &opts, ARES_OPT_TRIES | ARES_OPT_FLAGS));
++  if (chan == nullptr) {
++    return nullptr;
++  }
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_set_servers_csv(chan, "[::1]:53061,127.0.0.1:53062"));
++  ares_set_server_state_callback(chan, FailoverOnServerDown, chan);
++
++  memset(funcs, 0, sizeof(*funcs));
++  funcs->asocket = FailoverNoIPv6Socket;
++  ares_set_socket_functions(chan, funcs, NULL);
++  return chan;
++}
++
++TEST_F(LibraryTest, ServerFailoverDuringGetAddrInfo) {
++  ares_socket_functions      funcs;
++  struct ares_addrinfo_hints hints;
++  AddrInfoResult             result;
++  ares_channel_t            *chan = FailoverChannel(&funcs);
++  ASSERT_NE(nullptr, chan);
++
++  memset(&hints, 0, sizeof(hints));
++  hints.ai_family = AF_INET;
++  ares_getaddrinfo(chan, "www.google.com", NULL, &hints, AddrInfoCallback,
++                   &result);
++
++  ares_cancel(chan);
++  EXPECT_TRUE(result.done_);
++  ares_destroy(chan);
++}
++
++// Same, through ares_query_dnsrec(): the query id must already have been
++// reported to the caller by the time the query can complete.
++struct FailoverQueryData {
++  unsigned short qid;
++  unsigned short qid_at_callback;
++  bool           done;
++};
++
++static void FailoverQueryCallback(void *data, ares_status_t status,
++                                  size_t                   timeouts,
++                                  const ares_dns_record_t *dnsrec)
++{
++  FailoverQueryData *d = static_cast<FailoverQueryData *>(data);
++  (void)status;
++  (void)timeouts;
++  (void)dnsrec;
++  d->qid_at_callback = d->qid;
++  d->done            = true;
++}
++
++TEST_F(LibraryTest, ServerFailoverDuringQuery) {
++  ares_socket_functions funcs;
++  FailoverQueryData     data;
++  ares_channel_t       *chan = FailoverChannel(&funcs);
++  ASSERT_NE(nullptr, chan);
++
++  data.qid             = 0;
++  data.qid_at_callback = 0;
++  data.done            = false;
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
++                              ARES_REC_TYPE_A, FailoverQueryCallback, &data,
++                              &data.qid));
++
++  EXPECT_TRUE(data.done);
++  EXPECT_EQ(data.qid, data.qid_at_callback);
++  ares_destroy(chan);
++}
++
+ 
+ // Deferring the notifications must not lose them: every public entry point
+ // that closes a socket still has to tell the application about it before it
diff --git a/meta-oe/recipes-support/c-ares/c-ares/0003-ares_qcache-hand-callbacks-their-own-copy.patch b/meta-oe/recipes-support/c-ares/c-ares/0003-ares_qcache-hand-callbacks-their-own-copy.patch
new file mode 100644
index 0000000000..02039e92e0
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0003-ares_qcache-hand-callbacks-their-own-copy.patch
@@ -0,0 +1,1054 @@
+From a21160045f9d7039225fa285be7cb1b02173a3a5 Mon Sep 17 00:00:00 2001
+From: Brad House <brad@brad-house.com>
+Date: Sun, 18 Oct 2026 22:12:09 -0400
+Subject: [PATCH] [Backport v1.34] ares_qcache: hand callbacks their own copy
+ of a cached answer (#1339)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Backport of 31e2f51e8715d418fa8272a6c3a1ee651917fec5 (`ares_qcache: hand
+callbacks their own copy of a cached answer`) to `v1.34`. See that
+commit for the full description.
+
+**Conflicts:**
+- `ares_private.h`: alignment only; formatted with `v1.34`'s
+`.clang-format`.
+- `test/ares-test-internal.cc`: context only — on `main` the new
+`QcacheKeyDistinguishesQuestions` test follows the IDNA/punycode tests
+(#1031), which are not on `v1.34`, so it is placed after the URI test
+instead.
+
+**Test fixes from #1334:** carries the part of #1334 that applies to the
+tests this introduces — `ReentrantFlushInCallbackNoUseAfterFree`
+reconfigures to `127.0.0.1:53055` instead of `127.0.0.55` (only routable
+on Linux), and `UnknownQueryTypesDoNotShareCacheEntries` drops
+`static_cast<ns_type>`, which does not compile on OpenBSD.
+
+Test file contents match `main`. Independent of the dd62bdfc backport
+(#1338); applies cleanly with or without it.
+
+The full non-live suite passes 650/650 under ASAN+UBSAN and with
+`-DCARES_WERROR=ON` on macOS. `ReentrantFlushInCallbackNoUseAfterFree`
+is a heap-use-after-free in `ares_dns_record_rr_cnt()` on `v1.34`
+without this change, and passes with it.
+
+Signed-off-by: Brad House <brad@brad-house.com>
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/a21160045f9d7039225fa285be7cb1b02173a3a5]
+GHSA: GHSA-grv7-fq5q-9vfc, GHSA-wrgc-prmw-27xh
+---
+ docs/ares_init_options.3   |  11 +-
+ src/lib/ares_private.h     |  44 +++-
+ src/lib/ares_process.c     |   1 +
+ src/lib/ares_qcache.c      | 212 ++++++++++++++++---
+ src/lib/ares_send.c        |  47 ++++-
+ test/ares-test-internal.cc |  54 +++++
+ test/ares-test-mock.cc     | 419 +++++++++++++++++++++++++++++++++++++
+ 7 files changed, 743 insertions(+), 45 deletions(-)
+
+diff --git a/docs/ares_init_options.3 b/docs/ares_init_options.3
+index e6f6ee8ba6..1ce7fb8e30 100644
+--- a/docs/ares_init_options.3
++++ b/docs/ares_init_options.3
+@@ -324,7 +324,16 @@ with the maximum number of seconds a query result may be cached which will
+ override a larger TTL in the response message. This must be a non-zero value
+ otherwise the cache will be disabled. Choose a reasonable value for your
+ application such as 300 (5 minutes) or 3600 (1 hour).  The query cache is
+-automatically flushed if a server configuration change is made.
++automatically flushed if a server configuration change is made.  As of c-ares
++1.35.0, and c-ares 1.34.9 on the 1.34 branch, a cached answer reports its
++remaining time to live rather than the
++original value received from the server, so TTLs returned on a cache hit
++decrease as the entry ages.  Two lookups share a cached answer only if their
++EDNS state matches: the version, the flag bits including DNSSEC OK, and every
++EDNS option other than the DNS cookie and the advertised UDP payload size,
++which are both ignored.  Options are compared in the order the application
++added them.  An application that attaches its own options and varies them
++between otherwise identical lookups gets a separate cache entry for each.
+ .br
+ .TP 18
+ .B ARES_OPT_EVENT_THREAD
+diff --git a/src/lib/ares_private.h b/src/lib/ares_private.h
+index 9610ba7dab..dd06d303b8 100644
+--- a/src/lib/ares_private.h
++++ b/src/lib/ares_private.h
+@@ -153,6 +153,9 @@ struct ares_query {
+   ares_timeval_t       ts; /*!< Timestamp query was sent */
+   ares_timeval_t       timeout;
+   ares_channel_t      *channel;
++  /*! Query cache key, derived from the caller's request before the send path
++   *  can mutate query->query.  NULL when the cache is disabled. */
++  char                *qcache_key;
+ 
+   /*
+    * Node object for each list entry the query belongs to in order to
+@@ -718,14 +721,47 @@ ares_status_t ares_qcache_create(ares_rand_state *rand_state,
+                                  unsigned int     max_ttl,
+                                  ares_qcache_t  **cache_out);
+ void          ares_qcache_flush(ares_qcache_t *cache);
++/*! Derive the query cache key for a request.  Caller owns the result.
++ *
++ *  \param[in] dnsrec  Request to derive the key from.
++ *  \return allocated key, or NULL on failure.
++ */
++char         *ares_qcache_calc_key(const ares_dns_record_t *dnsrec);
++
++/*! Insert a response into the query cache.
++ *
++ *  \param[in] channel  Initialized channel object.
++ *  \param[in] now      Current timestamp.
++ *  \param[in] query    Query the response answers.  Its cache key, derived
++ *                      when the query was created, becomes the entry key; a
++ *                      NULL key means caching is switched off.
++ *  \param[in] dnsrec   Response to cache.  Duplicated internally; the caller
++ *                      retains ownership.
++ *  \return ARES_SUCCESS if cached, ARES_ENOTIMP if caching is off or the
++ *          response is not cacheable, otherwise another status.
++ */
+ ares_status_t ares_qcache_insert(ares_channel_t          *channel,
+                                  const ares_timeval_t    *now,
+                                  const ares_query_t      *query,
+                                  const ares_dns_record_t *dnsrec);
+-ares_status_t ares_qcache_fetch(ares_channel_t           *channel,
+-                                const ares_timeval_t     *now,
+-                                const ares_dns_record_t  *dnsrec,
+-                                const ares_dns_record_t **dnsrec_resp);
++/*! Fetch a cached answer for a request.
++ *
++ *  \param[in]  channel      Initialized channel object.
++ *  \param[in]  now          Current timestamp.
++ *  \param[in]  key          Cache key for the request, as produced by
++ *                           ares_qcache_calc_key().  Owned by the caller.
++ *  \param[out] dnsrec_resp  On ARES_SUCCESS, the cached answer, owned by the
++ *                           caller and destroyed with
++ *                           ares_dns_record_destroy().  Set to NULL on any
++ *                           other status, except ARES_EFORMERR, which is
++ *                           returned by the argument check before this is
++ *                           touched.
++ *  \return ARES_SUCCESS on a hit, ARES_ENOTFOUND on a miss, ARES_EFORMERR on
++ *          invalid arguments.
++ */
++ares_status_t ares_qcache_fetch(ares_channel_t       *channel,
++                                const ares_timeval_t *now, const char *key,
++                                ares_dns_record_t **dnsrec_resp);
+ 
+ void   ares_metrics_record(const ares_query_t *query, ares_server_t *server,
+                            ares_status_t status, const ares_dns_record_t *dnsrec);
+diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
+index 1569408b1b..88536704ad 100644
+--- a/src/lib/ares_process.c
++++ b/src/lib/ares_process.c
+@@ -1859,6 +1859,7 @@ void ares_free_query(ares_query_t *query)
+   query->arg      = NULL;
+   /* Deallocate the memory associated with the query */
+   ares_dns_record_destroy(query->query);
++  ares_free(query->qcache_key);
+ 
+   ares_free(query);
+ }
+diff --git a/src/lib/ares_qcache.c b/src/lib/ares_qcache.c
+index ad3bc83505..f48669b56c 100644
+--- a/src/lib/ares_qcache.c
++++ b/src/lib/ares_qcache.c
+@@ -38,7 +38,7 @@ typedef struct {
+   time_t             insert_ts;
+ } ares_qcache_entry_t;
+ 
+-static char *ares_qcache_calc_key(const ares_dns_record_t *dnsrec)
++char *ares_qcache_calc_key(const ares_dns_record_t *dnsrec)
+ {
+   ares_buf_t      *buf = ares_buf_create();
+   size_t           i;
+@@ -49,7 +49,22 @@ static char *ares_qcache_calc_key(const ares_dns_record_t *dnsrec)
+     return NULL; /* LCOV_EXCL_LINE: DefensiveCoding */
+   }
+ 
+-  /* Format is OPCODE|FLAGS[|QTYPE1|QCLASS1|QNAME1]... */
++  /* Format is
++   * OPCODE|FLAGS[|EDNS|VER|FLAGS[|ID:HEX]...]|QDCOUNT[|TYPE|CLASS|LEN:QNAME]...
++   *
++   * The EDNS section matters: an answer fetched under one set of EDNS options
++   * is not interchangeable with one fetched under another.  A request with no
++   * OPT record appends nothing; note that EDNS is on by default, so ordinary
++   * lookups do carry one and their keys did change with this.
++   *
++   * Everything a caller does not control is emitted before the questions, so
++   * the names are always last.  A name reaches the key unescaped, so anything
++   * keyed after it could otherwise be imitated by a name containing that same
++   * text, giving two different requests one key.  The question count is part
++   * of that: without it, a request with two questions and a request with one
++   * whose name spells out the second produce identical keys.  Each name is
++   * also length-prefixed, so adjacent names cannot be made to run together
++   * even when the question counts match. */
+ 
+   status = ares_buf_append_str(
+     buf, ares_dns_opcode_tostr(ares_dns_record_get_opcode(dnsrec)));
+@@ -63,7 +78,11 @@ static char *ares_qcache_calc_key(const ares_dns_record_t *dnsrec)
+   }
+ 
+   flags = ares_dns_record_get_flags(dnsrec);
+-  /* Only care about RD and CD */
++  /* RD, CD and AD.  AD is here because RFC 6840 section 5.7 defines it in a
++   * request as a signal that the requester wants the AD bit evaluated in the
++   * response, and section 5.8 says a validating resolver should only set AD
++   * in a response when the request carried DO or AD -- so an answer fetched
++   * without it can legitimately differ from one fetched with it. */
+   if (flags & ARES_FLAG_RD) {
+     status = ares_buf_append_str(buf, "rd");
+     if (status != ARES_SUCCESS) {
+@@ -76,6 +95,95 @@ static char *ares_qcache_calc_key(const ares_dns_record_t *dnsrec)
+       goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
+     }
+   }
++  if (flags & ARES_FLAG_AD) {
++    status = ares_buf_append_str(buf, "ad");
++    if (status != ARES_SUCCESS) {
++      goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++    }
++  }
++
++  /* EDNS state.  Skipped entirely when the request carries no OPT record. */
++  {
++    const ares_dns_rr_t *opt = ares_dns_get_opt_rr_const(dnsrec);
++
++    if (opt != NULL) {
++      size_t opt_cnt = ares_dns_rr_get_opt_cnt(opt, ARES_RR_OPT_OPTIONS);
++      size_t j;
++
++      status = ares_buf_append_str(buf, "|EDNS|");
++      if (status != ARES_SUCCESS) {
++        goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++      }
++      status = ares_buf_append_num_hex(
++        buf, ares_dns_rr_get_u8(opt, ARES_RR_OPT_VERSION), 0);
++      if (status != ARES_SUCCESS) {
++        goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++      }
++      status = ares_buf_append_byte(buf, '|');
++      if (status != ARES_SUCCESS) {
++        goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++      }
++      /* Carries the DO bit, so a DNSSEC-aware request cannot be served an
++       * answer that was fetched without it. */
++      status = ares_buf_append_num_hex(
++        buf, ares_dns_rr_get_u16(opt, ARES_RR_OPT_FLAGS), 0);
++      if (status != ARES_SUCCESS) {
++        goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++      }
++
++      /* The advertised UDP payload size is deliberately excluded: it
++       * constrains how a response is transported, not what it says.  A server
++       * that cannot fit the additional section may omit it without setting
++       * the TC bit (RFC 2181 section 9), so two sizes can produce answers
++       * that differ outside the answer section; that is accepted here. */
++      for (j = 0; j < opt_cnt; j++) {
++        const unsigned char *val     = NULL;
++        size_t               val_len = 0;
++        unsigned short       optid =
++          ares_dns_rr_get_opt(opt, ARES_RR_OPT_OPTIONS, j, &val, &val_len);
++
++        /* DNS cookies are per-server transport state and say nothing about
++         * the content of an answer.  A cookie c-ares adds never reaches here
++         * -- ares_cookie_apply() writes to query->query, after this key has
++         * been derived -- so this only ever skips one the caller supplied. */
++        if (optid == ARES_OPT_PARAM_COOKIE) {
++          continue;
++        }
++
++        status = ares_buf_append_byte(buf, '|');
++        if (status != ARES_SUCCESS) {
++          goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++        }
++        status = ares_buf_append_num_hex(buf, optid, 0);
++        if (status != ARES_SUCCESS) {
++          goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++        }
++        status = ares_buf_append_byte(buf, ':');
++        if (status != ARES_SUCCESS) {
++          goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++        }
++        if (val != NULL) {
++          size_t k;
++          for (k = 0; k < val_len; k++) {
++            status = ares_buf_append_num_hex(buf, val[k], 2);
++            if (status != ARES_SUCCESS) {
++              goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++            }
++          }
++        }
++      }
++    }
++  }
++
++  status = ares_buf_append_byte(buf, '|');
++  if (status != ARES_SUCCESS) {
++    goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++  }
++
++  status = ares_buf_append_num_dec(buf, ares_dns_record_query_cnt(dnsrec), 0);
++  if (status != ARES_SUCCESS) {
++    goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++  }
+ 
+   for (i = 0; i < ares_dns_record_query_cnt(dnsrec); i++) {
+     const char         *name;
+@@ -93,7 +201,13 @@ static char *ares_qcache_calc_key(const ares_dns_record_t *dnsrec)
+       goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
+     }
+ 
+-    status = ares_buf_append_str(buf, ares_dns_rec_type_tostr(qtype));
++    /* Numeric, not the mnemonic: ares_dns_rec_type_tostr() returns "UNKNOWN"
++     * for every type outside its table, and ares_dns_record_query_add() does
++     * not validate the type, so any 16-bit value reaches here through the
++     * ordinary public API.  Two such lookups -- LOC and DNAME, say -- would
++     * otherwise key identically and be answered with each other's records.
++     * The key only has to be injective, not readable. */
++    status = ares_buf_append_num_dec(buf, (size_t)qtype, 0);
+     if (status != ARES_SUCCESS) {
+       goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
+     }
+@@ -103,7 +217,10 @@ static char *ares_qcache_calc_key(const ares_dns_record_t *dnsrec)
+       goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
+     }
+ 
+-    status = ares_buf_append_str(buf, ares_dns_class_tostr(qclass));
++    /* Numeric for the same reason.  ares_dns_record_query_add() does reject
++     * classes outside its list today, so the mnemonic is safe -- but the key
++     * should not depend on that validation staying where it is. */
++    status = ares_buf_append_num_dec(buf, (size_t)qclass, 0);
+     if (status != ARES_SUCCESS) {
+       goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
+     }
+@@ -121,6 +238,21 @@ static char *ares_qcache_calc_key(const ares_dns_record_t *dnsrec)
+       name_len--;
+     }
+ 
++    /* Length-prefix the name so it is self-delimiting.  The question count
++     * above stops one question imitating two, but with the counts equal the
++     * boundary between adjacent names is still guessable, since names reach
++     * the key unescaped separated only by '|'.  A length makes each name
++     * unambiguous for any question count. */
++    status = ares_buf_append_num_dec(buf, name_len, 0);
++    if (status != ARES_SUCCESS) {
++      goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++    }
++
++    status = ares_buf_append_byte(buf, ':');
++    if (status != ARES_SUCCESS) {
++      goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++    }
++
+     if (name_len > 0) {
+       status = ares_buf_append(buf, (const unsigned char *)name, name_len);
+       if (status != ARES_SUCCESS) {
+@@ -301,10 +433,10 @@ static unsigned int ares_qcache_soa_minimum(ares_dns_record_t *dnsrec)
+ }
+ 
+ /* On success, takes ownership of dnsrec */
+-static ares_status_t ares_qcache_insert_int(ares_qcache_t           *qcache,
+-                                            ares_dns_record_t       *qresp,
+-                                            const ares_dns_record_t *qreq,
+-                                            const ares_timeval_t    *now)
++static ares_status_t ares_qcache_insert_int(ares_qcache_t        *qcache,
++                                            ares_dns_record_t    *qresp,
++                                            const char           *key,
++                                            const ares_timeval_t *now)
+ {
+   ares_qcache_entry_t *entry;
+   unsigned int         ttl;
+@@ -350,11 +482,11 @@ static ares_status_t ares_qcache_insert_int(ares_qcache_t           *qcache,
+   entry->expire_ts = (time_t)now->sec + (time_t)ttl;
+   entry->insert_ts = (time_t)now->sec;
+ 
+-  /* We can't guarantee the server responded with the same flags as the
+-   * request had, so we have to re-parse the request in order to generate the
+-   * key for caching, but we'll only do this once we know for sure we really
+-   * want to cache it */
+-  entry->key = ares_qcache_calc_key(qreq);
++  /* The key was derived from the caller's request when the query was created.
++   * It must not be recomputed from query->query here: the EDNS fallback path
++   * strips the OPT record from that record before a successful retry, so a
++   * key derived from it would not match the one a later lookup computes. */
++  entry->key = ares_strdup(key);
+   if (entry->key == NULL) {
+     goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
+   }
+@@ -382,31 +514,25 @@ static ares_status_t ares_qcache_insert_int(ares_qcache_t           *qcache,
+   /* LCOV_EXCL_STOP */
+ }
+ 
+-ares_status_t ares_qcache_fetch(ares_channel_t           *channel,
+-                                const ares_timeval_t     *now,
+-                                const ares_dns_record_t  *dnsrec,
+-                                const ares_dns_record_t **dnsrec_resp)
++ares_status_t ares_qcache_fetch(ares_channel_t       *channel,
++                                const ares_timeval_t *now, const char *key,
++                                ares_dns_record_t **dnsrec_resp)
+ {
+-  char                *key = NULL;
+   ares_qcache_entry_t *entry;
+   ares_status_t        status = ARES_SUCCESS;
+ 
+-  if (channel == NULL || dnsrec == NULL || dnsrec_resp == NULL) {
++  if (channel == NULL || key == NULL || dnsrec_resp == NULL) {
+     return ARES_EFORMERR;
+   }
+ 
++  *dnsrec_resp = NULL;
++
+   if (channel->qcache == NULL) {
+     return ARES_ENOTFOUND;
+   }
+ 
+   ares_qcache_expire(channel->qcache, now);
+ 
+-  key = ares_qcache_calc_key(dnsrec);
+-  if (key == NULL) {
+-    status = ARES_ENOMEM; /* LCOV_EXCL_LINE: OutOfMemory */
+-    goto done;            /* LCOV_EXCL_LINE: OutOfMemory */
+-  }
+-
+   entry = ares_htable_strvp_get_direct(channel->qcache->cache, key);
+   if (entry == NULL) {
+     status = ARES_ENOTFOUND;
+@@ -416,10 +542,24 @@ ares_status_t ares_qcache_fetch(ares_channel_t           *channel,
+   ares_dns_record_ttl_decrement(entry->dnsrec,
+                                 (unsigned int)(now->sec - entry->insert_ts));
+ 
+-  *dnsrec_resp = entry->dnsrec;
++  /* Hand back a copy the caller owns rather than the cache's own record.
++   * This is passed straight into an application callback, and that callback
++   * is allowed to re-enter c-ares.  Any lookup it starts runs the expiry
++   * reaper first, and changing the server list flushes the cache outright --
++   * either would destroy this entry while the callback still held a pointer
++   * into it.  Mirrors the ownership fix already made on the insert side. */
++  status = ares_dns_record_duplicate_ex(dnsrec_resp, entry->dnsrec);
++  if (status != ARES_SUCCESS) {
++    /* Could not hand back a private copy.  Report a miss so the lookup falls
++     * through to a real query rather than failing outright: duplication
++     * writes and re-parses the record, so it can fail for reasons other than
++     * memory exhaustion, and none of them are a reason to fail a lookup that
++     * would have gone to a server a moment earlier. */
++    status = ARES_ENOTFOUND; /* LCOV_EXCL_LINE: UntestablePath */
++    goto done;               /* LCOV_EXCL_LINE: UntestablePath */
++  }
+ 
+ done:
+-  ares_free(key);
+   return status;
+ }
+ 
+@@ -428,13 +568,25 @@ ares_status_t ares_qcache_insert(ares_channel_t          *channel,
+                                  const ares_query_t      *query,
+                                  const ares_dns_record_t *dnsrec)
+ {
+-  ares_dns_record_t *dupdns = ares_dns_record_duplicate(dnsrec);
++  ares_dns_record_t *dupdns;
+   ares_status_t      status;
+ 
++  /* Checked before the duplicate below, which is a full write and re-parse:
++   * no key means caching is switched off, so the copy would be thrown away.
++   * ares_init_options() always creates the cache object -- it is disabled by
++   * a zero maximum TTL, not by a NULL pointer -- so this is the only place
++   * the distinction is visible here. */
++  if (query->qcache_key == NULL) {
++    return ARES_ENOTIMP;
++  }
++
++  dupdns = ares_dns_record_duplicate(dnsrec);
+   if (dupdns == NULL) {
+     return ARES_ENOMEM;
+   }
+-  status = ares_qcache_insert_int(channel->qcache, dupdns, query->query, now);
++
++  status =
++    ares_qcache_insert_int(channel->qcache, dupdns, query->qcache_key, now);
+   if (status != ARES_SUCCESS) {
+     ares_dns_record_destroy(dupdns);
+   }
+diff --git a/src/lib/ares_send.c b/src/lib/ares_send.c
+index dd4a28544b..117745ce28 100644
+--- a/src/lib/ares_send.c
++++ b/src/lib/ares_send.c
+@@ -111,11 +111,12 @@ ares_status_t ares_send_nolock(ares_channel_t *channel, ares_server_t *server,
+                                ares_callback_dnsrec callback, void *arg,
+                                unsigned short *qid)
+ {
+-  ares_query_t            *query;
+-  ares_timeval_t           now;
+-  ares_status_t            status;
+-  unsigned short           id          = generate_unique_qid(channel);
+-  const ares_dns_record_t *dnsrec_resp = NULL;
++  ares_query_t      *query;
++  ares_timeval_t     now;
++  ares_status_t      status;
++  unsigned short     id          = generate_unique_qid(channel);
++  ares_dns_record_t *dnsrec_resp = NULL;
++  char              *qcache_key  = NULL;
+ 
+   /* A channel being destroyed accepts no new queries.  ares_destroy(3)
+    * documents that a callback must not add new requests to a channel being
+@@ -145,13 +146,28 @@ ares_status_t ares_send_nolock(ares_channel_t *channel, ares_server_t *server,
+     return ARES_ENOSERVER;
+   }
+ 
+-  if (!(flags & ARES_SEND_FLAG_NOCACHE)) {
++  /* Derive the cache key once, from the caller's request, and only when the
++   * cache is actually on.  The send path may mutate query->query afterwards
++   * -- the EDNS fallback strips its OPT record -- and a key derived from it
++   * later would not match.  ares_init_options() always creates the cache
++   * object, so a zero maximum TTL is what "off" means. */
++  if (channel->qcache_max_ttl > 0) {
++    qcache_key = ares_qcache_calc_key(dnsrec);
++    if (qcache_key == NULL) {
++      callback(arg, ARES_ENOMEM, 0, NULL); /* LCOV_EXCL_LINE: OutOfMemory */
++      return ARES_ENOMEM;                  /* LCOV_EXCL_LINE: OutOfMemory */
++    }
++  }
++
++  if (qcache_key != NULL && !(flags & ARES_SEND_FLAG_NOCACHE)) {
+     /* Check query cache */
+-    status = ares_qcache_fetch(channel, &now, dnsrec, &dnsrec_resp);
++    status = ares_qcache_fetch(channel, &now, qcache_key, &dnsrec_resp);
+     if (status != ARES_ENOTFOUND) {
+       /* ARES_SUCCESS means we retrieved the cache, anything else is a critical
+        * failure, all result in termination */
++      ares_free(qcache_key);
+       callback(arg, status, 0, dnsrec_resp);
++      ares_dns_record_destroy(dnsrec_resp);
+       return status;
+     }
+   }
+@@ -159,8 +175,11 @@ ares_status_t ares_send_nolock(ares_channel_t *channel, ares_server_t *server,
+   /* Allocate space for query and allocated fields. */
+   query = ares_malloc(sizeof(ares_query_t));
+   if (!query) {
+-    callback(arg, ARES_ENOMEM, 0, NULL); /* LCOV_EXCL_LINE: OutOfMemory */
+-    return ARES_ENOMEM;                  /* LCOV_EXCL_LINE: OutOfMemory */
++    /* LCOV_EXCL_START: OutOfMemory */
++    ares_free(qcache_key);
++    callback(arg, ARES_ENOMEM, 0, NULL);
++    return ARES_ENOMEM;
++    /* LCOV_EXCL_STOP */
+   }
+   memset(query, 0, sizeof(*query));
+ 
+@@ -173,6 +192,10 @@ ares_status_t ares_send_nolock(ares_channel_t *channel, ares_server_t *server,
+     (channel->flags & ARES_FLAG_USEVC) ? ARES_TRUE : ARES_FALSE;
+ 
+   /* Duplicate Query */
++  /* The query adopts the key derived above; ares_free_query() releases it. */
++  query->qcache_key = qcache_key;
++  qcache_key        = NULL;
++
+   status = ares_dns_record_duplicate_ex(&query->query, dnsrec);
+   if (status != ARES_SUCCESS) {
+     /* Sometimes we might get a EBADRESP response from duplicate due to
+@@ -180,7 +203,11 @@ ares_status_t ares_send_nolock(ares_channel_t *channel, ares_server_t *server,
+     if (status == ARES_EBADRESP) {
+       status = ARES_EBADQUERY;
+     }
+-    ares_free(query);
++    /* ares_free_query() rather than ares_free(): the query was zeroed above,
++     * so detaching finds every node NULL and the qid not yet registered, and
++     * it also releases qcache_key.  Reachable without memory pressure -- a
++     * name that is not a valid hostname fails the duplicate. */
++    ares_free_query(query);
+     callback(arg, status, 0, NULL);
+     return status;
+   }
+diff --git a/test/ares-test-internal.cc b/test/ares-test-internal.cc
+index 8881f3b7cc..5ba5d2b39b 100644
+--- a/test/ares-test-internal.cc
++++ b/test/ares-test-internal.cc
+@@ -502,6 +502,60 @@ TEST_F(LibraryTest, URI) {
+   EXPECT_NE(ARES_SUCCESS, ares_uri_parse_buf(NULL, NULL));
+   EXPECT_NE(ARES_SUCCESS, ares_uri_parse_buf(NULL, NULL));
+ }
++
++// The cache key must distinguish requests whose answers are not
++// interchangeable.  Two shapes are easy to get wrong because names reach the
++// key unescaped: a request with two questions versus one whose name spells out
++// the second, and two requests with the same question count whose names can be
++// made to run together.  Both are narrow to reach -- they need a hand-built
++// record with more than one question, which real servers reject -- but the key
++// asserts they are distinct, so pin it.
++TEST_F(LibraryTest, QcacheKeyDistinguishesQuestions) {
++  struct qcase {
++    const char *n1;
++    const char *n2; /* nullptr for a single-question record */
++  };
++  const qcase cases[] = {
++    { "one.example.net",                      "two.example.net"                        },
++    { "one.example.net|A|IN|two.example.net", nullptr                                  },
++    { "one.example.net",                      "two.example.net|A|IN|three.example.net" },
++    { "one.example.net|A|IN|two.example.net", "three.example.net"                      },
++  };
++  std::vector<std::string> keys;
++
++  for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
++    ares_dns_record_t *req = nullptr;
++    char              *key = nullptr;
++
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_record_create(&req, 0, ARES_FLAG_RD, ARES_OPCODE_QUERY,
++                                     ARES_RCODE_NOERROR));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_record_query_add(req, cases[i].n1, ARES_REC_TYPE_A,
++                                        ARES_CLASS_IN));
++    if (cases[i].n2 != nullptr) {
++      EXPECT_EQ(ARES_SUCCESS,
++                ares_dns_record_query_add(req, cases[i].n2, ARES_REC_TYPE_A,
++                                          ARES_CLASS_IN));
++    }
++
++    key = ares_qcache_calc_key(req);
++    ASSERT_NE(nullptr, key);
++    keys.push_back(std::string(key));
++    ares_free_string(key);
++    ares_dns_record_destroy(req);
++  }
++
++  /* Every one of these is a different request, so every key must differ. */
++  for (size_t i = 0; i < keys.size(); i++) {
++    for (size_t j = i + 1; j < keys.size(); j++) {
++      EXPECT_NE(keys[i], keys[j])
++        << "cache key collision between case " << i << " and case " << j
++        << ": " << keys[i];
++    }
++  }
++}
++
+ #endif /* !CARES_SYMBOL_HIDING */
+ 
+ TEST_F(LibraryTest, InetPtoN) {
+diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc
+index b848c02434..4b409db7c3 100644
+--- a/test/ares-test-mock.cc
++++ b/test/ares-test-mock.cc
+@@ -611,6 +611,425 @@ class CacheQueriesTest
+   struct ares_options opts_;
+ };
+ 
++// A cache hit used to hand the callback a pointer to the cache's own record.
++// That is fine only while the callback does nothing else -- but re-entering
++// c-ares from a callback is documented as allowed, and two ordinary things a
++// callback might do destroy the entry underneath it: changing the server list
++// flushes the whole cache, and starting another lookup runs the expiry reaper
++// first.  The record must therefore be the caller's own copy.
++//
++// Here the callback changes the server list, which flushes the cache, and then
++// reads the record it was handed.
++struct QcacheReentrantCbData {
++  ares_channel_t *channel;
++  bool            done;
++  size_t          ancount;
++};
++
++static void QcacheReentrantCallback(void *arg, ares_status_t status,
++                                    size_t timeouts,
++                                    const ares_dns_record_t *dnsrec) {
++  QcacheReentrantCbData *data = static_cast<QcacheReentrantCbData *>(arg);
++  (void)timeouts;
++  data->done = true;
++  if (status != ARES_SUCCESS || dnsrec == NULL) {
++    return;
++  }
++  /* Documented re-entry.  Reconfiguring servers flushes the query cache. */
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_set_servers_csv(data->channel, "127.0.0.1:53055"));
++  /* Still inside the callback, so this record must still be readable. */
++  data->ancount = ares_dns_record_rr_cnt(dnsrec, ARES_SECTION_ANSWER);
++}
++
++TEST_P(CacheQueriesTest, ReentrantFlushInCallbackNoUseAfterFree) {
++  DNSPacket rsp;
++  rsp.set_response().set_aa()
++    .add_question(new DNSQuestion("www.google.com", T_A))
++    .add_answer(new DNSARR("www.google.com", 100, {2, 3, 4, 5}));
++  ON_CALL(server_, OnRequest("www.google.com", T_A))
++    .WillByDefault(SetReply(&server_, &rsp));
++
++  /* Populate the cache. */
++  QueryResult first;
++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    QueryCallback, &first, NULL);
++  Process();
++  EXPECT_TRUE(first.done_);
++
++  /* Served from the cache, so the callback runs synchronously holding the
++   * record the cache handed it. */
++  QcacheReentrantCbData data;
++  data.channel = channel_;
++  data.done    = false;
++  data.ancount = 0;
++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    QcacheReentrantCallback, &data, NULL);
++
++  EXPECT_TRUE(data.done);
++  EXPECT_EQ((size_t)1, data.ancount);
++}
++
++// The cache key covered the question and a couple of header flags but ignored
++// the request's OPT record entirely, so two requests differing only in their
++// EDNS options collided.  An answer obtained under one set of options is not
++// interchangeable with one obtained under another -- most obviously, a request
++// with the DO bit set must not be handed an answer fetched without it.
++//
++// Both requests here ask the identical question; only the EDNS state differs,
++// so the server must see two of them.
++TEST_P(CacheQueriesTest, EdnsOptionsSeparateCacheEntries) {
++  DNSPacket rsp;
++  rsp.set_response().set_aa()
++    .add_question(new DNSQuestion("www.google.com", T_A))
++    .add_answer(new DNSARR("www.google.com", 100, {2, 3, 4, 5}));
++  EXPECT_CALL(server_, OnRequest("www.google.com", T_A))
++    .Times(2)
++    .WillRepeatedly(SetReply(&server_, &rsp));
++
++  /* First: no OPT record at all. */
++  ares_dns_record_t *req1 = nullptr;
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_dns_record_create(&req1, 0, ARES_FLAG_RD, ARES_OPCODE_QUERY,
++                                   ARES_RCODE_NOERROR));
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_dns_record_query_add(req1, "www.google.com", ARES_REC_TYPE_A,
++                                      ARES_CLASS_IN));
++  QueryResult r1;
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_send_dnsrec(channel_, req1, QueryCallback, &r1, nullptr));
++  Process();
++  EXPECT_TRUE(r1.done_);
++  EXPECT_EQ(ARES_SUCCESS, r1.status_);
++
++  /* Second: same question, but carrying EDNS with the DO bit set. */
++  ares_dns_record_t *req2 = nullptr;
++  ares_dns_rr_t     *opt  = nullptr;
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_dns_record_create(&req2, 0, ARES_FLAG_RD, ARES_OPCODE_QUERY,
++                                   ARES_RCODE_NOERROR));
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_dns_record_query_add(req2, "www.google.com", ARES_REC_TYPE_A,
++                                      ARES_CLASS_IN));
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_dns_record_rr_add(&opt, req2, ARES_SECTION_ADDITIONAL, "",
++                                   ARES_REC_TYPE_OPT, ARES_CLASS_IN, 0));
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_dns_rr_set_u16(opt, ARES_RR_OPT_UDP_SIZE, 1232));
++  EXPECT_EQ(ARES_SUCCESS, ares_dns_rr_set_u8(opt, ARES_RR_OPT_VERSION, 0));
++  /* DO */
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_dns_rr_set_u16(opt, ARES_RR_OPT_FLAGS, 0x8000));
++
++  QueryResult r2;
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_send_dnsrec(channel_, req2, QueryCallback, &r2, nullptr));
++  Process();
++  EXPECT_TRUE(r2.done_);
++  EXPECT_EQ(ARES_SUCCESS, r2.status_);
++
++  ares_dns_record_destroy(req1);
++  ares_dns_record_destroy(req2);
++}
++
++// The test above sets the DO bit, which lives in the OPT flags -- it never
++// reaches the loop that keys the individual EDNS options.  That loop is what
++// separates two client subnets, so it needs its own coverage.
++// The mirror image of the tests above: two things are deliberately left out
++// of the cache key, and leaving them out is a security-relevant judgement --
++// it declares that two requests differing only in these still have
++// interchangeable answers.  Without a test, keying on either one later would
++// turn every request from an affected application into a permanent cache miss
++// and nothing would fail.
++
++// A DNS cookie is per-server transport state and says nothing about the
++// content of an answer, so two requests differing only in their cookie share
++// an entry.  The server must therefore be asked exactly once.
++// Two query types with no mnemonic in ares_dns_rec_type_tostr() both render as
++// "UNKNOWN", so keying the mnemonic made every such type share one entry -- a
++// lookup answered with a record of a type it never asked for.  Any 16-bit
++// value reaches here through ares_query_dnsrec(); LOC (29) and DNAME (39) are
++// both real and both outside the table.
++TEST_P(CacheQueriesTest, UnknownQueryTypesDoNotShareCacheEntries) {
++  DNSPacket rsp29;
++  rsp29.set_response().set_aa().add_question(
++    new DNSQuestion("example.net", 29));
++  DNSPacket rsp39;
++  rsp39.set_response().set_aa().add_question(
++    new DNSQuestion("example.net", 39));
++
++  // One call per type: neither may be served the other's answer.
++  EXPECT_CALL(server_, OnRequest("example.net", 29))
++    .Times(1)
++    .WillRepeatedly(SetReply(&server_, &rsp29));
++  EXPECT_CALL(server_, OnRequest("example.net", 39))
++    .Times(1)
++    .WillRepeatedly(SetReply(&server_, &rsp39));
++
++  QueryResult r1;
++  ares_query_dnsrec(channel_, "example.net", ARES_CLASS_IN,
++                    static_cast<ares_dns_rec_type_t>(29), QueryCallback, &r1,
++                    nullptr);
++  Process();
++  EXPECT_TRUE(r1.done_);
++
++  QueryResult r2;
++  ares_query_dnsrec(channel_, "example.net", ARES_CLASS_IN,
++                    static_cast<ares_dns_rec_type_t>(39), QueryCallback, &r2,
++                    nullptr);
++  Process();
++  EXPECT_TRUE(r2.done_);
++}
++
++// Handing back a duplicate materialises the pending TTL decrement, so a
++// callback that reads the TTL off the record it is given sees the remaining
++// lifetime rather than the value the server sent.  docs/ares_init_options.3
++// states this, so pin it.  Only visible to a caller that does not duplicate
++// first -- QueryResult does, which is why the other cache tests cannot see it.
++static unsigned int g_qcache_hit_ttl = 0;
++
++static void QcacheTtlCallback(void *arg, ares_status_t status, size_t timeouts,
++                              const ares_dns_record_t *dnsrec) {
++  const ares_dns_rr_t *rr;
++  (void)arg;
++  (void)timeouts;
++  if (status != ARES_SUCCESS || dnsrec == NULL) {
++    return;
++  }
++  rr = ares_dns_record_rr_get_const(dnsrec, ARES_SECTION_ANSWER, 0);
++  g_qcache_hit_ttl = rr ? ares_dns_rr_get_ttl(rr) : 0;
++}
++
++TEST_P(CacheQueriesTest, CacheHitReportsRemainingTtl) {
++  DNSPacket rsp;
++  rsp.set_response().set_aa()
++    .add_question(new DNSQuestion("www.google.com", T_A))
++    .add_answer(new DNSARR("www.google.com", 100, {2, 3, 4, 5}));
++  EXPECT_CALL(server_, OnRequest("www.google.com", T_A))
++    .Times(1)
++    .WillRepeatedly(SetReply(&server_, &rsp));
++
++  g_qcache_hit_ttl = 0;
++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    QcacheTtlCallback, nullptr, nullptr);
++  Process();
++  EXPECT_EQ((unsigned int)100, g_qcache_hit_ttl);
++
++  ares_sleep_time(2100);
++
++  g_qcache_hit_ttl = 0;
++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    QcacheTtlCallback, nullptr, nullptr);
++  Process();
++  // Served from the cache, and reporting what is left rather than the
++  // original 100.
++  EXPECT_GT(g_qcache_hit_ttl, (unsigned int)0);
++  EXPECT_LT(g_qcache_hit_ttl, (unsigned int)100);
++}
++
++TEST_P(CacheQueriesTest, CookieDoesNotSplitCacheEntries) {
++  DNSPacket rsp;
++  rsp.set_response().set_aa()
++    .add_question(new DNSQuestion("www.google.com", T_A))
++    .add_answer(new DNSARR("www.google.com", 100, {2, 3, 4, 5}));
++  EXPECT_CALL(server_, OnRequest("www.google.com", T_A))
++    .Times(1)
++    .WillRepeatedly(SetReply(&server_, &rsp));
++
++  const unsigned char  ck1[]   = {1, 2, 3, 4, 5, 6, 7, 8};
++  const unsigned char  ck2[]   = {8, 7, 6, 5, 4, 3, 2, 1};
++  const unsigned char *ck[2]   = {ck1, ck2};
++  QueryResult          r[2];
++
++  for (int i = 0; i < 2; i++) {
++    ares_dns_record_t *req = nullptr;
++    ares_dns_rr_t     *opt = nullptr;
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_record_create(&req, 0, ARES_FLAG_RD, ARES_OPCODE_QUERY,
++                                     ARES_RCODE_NOERROR));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_record_query_add(req, "www.google.com", ARES_REC_TYPE_A,
++                                        ARES_CLASS_IN));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_record_rr_add(&opt, req, ARES_SECTION_ADDITIONAL, "",
++                                     ARES_REC_TYPE_OPT, ARES_CLASS_IN, 0));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_rr_set_u16(opt, ARES_RR_OPT_UDP_SIZE, 1232));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_rr_set_opt(opt, ARES_RR_OPT_OPTIONS,
++                                  ARES_OPT_PARAM_COOKIE, ck[i], sizeof(ck1)));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_send_dnsrec(channel_, req, QueryCallback, &r[i], nullptr));
++    Process();
++    EXPECT_TRUE(r[i].done_);
++    EXPECT_EQ(ARES_SUCCESS, r[i].status_);
++    ares_dns_record_destroy(req);
++  }
++}
++
++// The advertised UDP payload size constrains how a response is transported,
++// not what it says, so it is excluded too.  Same expectation: one request.
++TEST_P(CacheQueriesTest, UdpPayloadSizeDoesNotSplitCacheEntries) {
++  DNSPacket rsp;
++  rsp.set_response().set_aa()
++    .add_question(new DNSQuestion("www.google.com", T_A))
++    .add_answer(new DNSARR("www.google.com", 100, {2, 3, 4, 5}));
++  EXPECT_CALL(server_, OnRequest("www.google.com", T_A))
++    .Times(1)
++    .WillRepeatedly(SetReply(&server_, &rsp));
++
++  const unsigned short sizes[2] = {512, 1232};
++  QueryResult          r[2];
++
++  for (int i = 0; i < 2; i++) {
++    ares_dns_record_t *req = nullptr;
++    ares_dns_rr_t     *opt = nullptr;
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_record_create(&req, 0, ARES_FLAG_RD, ARES_OPCODE_QUERY,
++                                     ARES_RCODE_NOERROR));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_record_query_add(req, "www.google.com", ARES_REC_TYPE_A,
++                                        ARES_CLASS_IN));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_record_rr_add(&opt, req, ARES_SECTION_ADDITIONAL, "",
++                                     ARES_REC_TYPE_OPT, ARES_CLASS_IN, 0));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_rr_set_u16(opt, ARES_RR_OPT_UDP_SIZE, sizes[i]));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_send_dnsrec(channel_, req, QueryCallback, &r[i], nullptr));
++    Process();
++    EXPECT_TRUE(r[i].done_);
++    EXPECT_EQ(ARES_SUCCESS, r[i].status_);
++    ares_dns_record_destroy(req);
++  }
++}
++
++TEST_P(CacheQueriesTest, EdnsClientSubnetSeparateCacheEntries) {
++  DNSPacket rsp;
++  rsp.set_response().set_aa()
++    .add_question(new DNSQuestion("www.google.com", T_A))
++    .add_answer(new DNSARR("www.google.com", 100, {2, 3, 4, 5}));
++  EXPECT_CALL(server_, OnRequest("www.google.com", T_A))
++    .Times(2)
++    .WillRepeatedly(SetReply(&server_, &rsp));
++
++  /* 192.0.2.0/24 and 198.51.100.0/24 */
++  const unsigned char  ecs1[]  = {0x00, 0x01, 0x18, 0x00, 0xc0, 0x00, 0x02};
++  const unsigned char  ecs2[]  = {0x00, 0x01, 0x18, 0x00, 0xc6, 0x33, 0x64};
++  const unsigned char *ecs[2]  = {ecs1, ecs2};
++  QueryResult          r[2];
++
++  for (int i = 0; i < 2; i++) {
++    ares_dns_record_t *req = nullptr;
++    ares_dns_rr_t     *opt = nullptr;
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_record_create(&req, 0, ARES_FLAG_RD, ARES_OPCODE_QUERY,
++                                     ARES_RCODE_NOERROR));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_record_query_add(req, "www.google.com", ARES_REC_TYPE_A,
++                                        ARES_CLASS_IN));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_record_rr_add(&opt, req, ARES_SECTION_ADDITIONAL, "",
++                                     ARES_REC_TYPE_OPT, ARES_CLASS_IN, 0));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_rr_set_u16(opt, ARES_RR_OPT_UDP_SIZE, 1232));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_dns_rr_set_opt(opt, ARES_RR_OPT_OPTIONS,
++                                  ARES_OPT_PARAM_EDNS_CLIENT_SUBNET, ecs[i],
++                                  sizeof(ecs1)));
++    EXPECT_EQ(ARES_SUCCESS,
++              ares_send_dnsrec(channel_, req, QueryCallback, &r[i], nullptr));
++    Process();
++    EXPECT_TRUE(r[i].done_);
++    EXPECT_EQ(ARES_SUCCESS, r[i].status_);
++    ares_dns_record_destroy(req);
++  }
++}
++
++// A server answering an EDNS query with FORMERR makes c-ares strip the OPT
++// record from query->query and retry.  The cache key must not be derived from
++// that record afterwards, or the entry is stored under a key no later lookup
++// computes and the cache silently stops working for that name.
++TEST_P(CacheQueriesTest, EdnsFallbackStillCaches) {
++  DNSPacket rspfail;
++  rspfail.set_response().set_aa().set_rcode(FORMERR)
++    .add_question(new DNSQuestion("www.google.com", T_A));
++  DNSPacket rspok;
++  rspok.set_response().set_aa()
++    .add_question(new DNSQuestion("www.google.com", T_A))
++    .add_answer(new DNSARR("www.google.com", 100, {1, 2, 3, 4}));
++  /* Two: the FORMERR and the retry.  The second lookup must be a cache hit. */
++  EXPECT_CALL(server_, OnRequest("www.google.com", T_A))
++    .Times(2)
++    .WillOnce(SetReply(&server_, &rspfail))
++    .WillRepeatedly(SetReply(&server_, &rspok));
++
++  HostResult r1;
++  ares_gethostbyname(channel_, "www.google.com.", AF_INET, HostCallback, &r1);
++  Process();
++  EXPECT_TRUE(r1.done_);
++  EXPECT_EQ(ARES_SUCCESS, r1.status_);
++
++  HostResult r2;
++  ares_gethostbyname(channel_, "www.google.com.", AF_INET, HostCallback, &r2);
++  Process();
++  EXPECT_TRUE(r2.done_);
++  EXPECT_EQ(ARES_SUCCESS, r2.status_);
++}
++
++// The question name is caller-supplied and unescaped, so anything keyed after
++// it could be imitated by a name containing that same text.  A request for
++// "example.net|EDNS|0|8000" with no OPT record must not collide with a request
++// for "example.net" carrying EDNS with the DNSSEC OK bit set.
++TEST_P(CacheQueriesTest, EdnsSectionCannotBeImitatedByName) {
++  DNSPacket rsp;
++  rsp.set_response().set_aa()
++    .add_question(new DNSQuestion("example.net", T_A))
++    .add_answer(new DNSARR("example.net", 100, {5, 6, 7, 8}));
++  ON_CALL(server_, OnRequest("example.net", T_A))
++    .WillByDefault(SetReply(&server_, &rsp));
++
++  /* Cache an answer for the real name, with EDNS and the DO bit set. */
++  ares_dns_record_t *req = nullptr;
++  ares_dns_rr_t     *opt = nullptr;
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_dns_record_create(&req, 0, ARES_FLAG_RD, ARES_OPCODE_QUERY,
++                                   ARES_RCODE_NOERROR));
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_dns_record_query_add(req, "example.net", ARES_REC_TYPE_A,
++                                      ARES_CLASS_IN));
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_dns_record_rr_add(&opt, req, ARES_SECTION_ADDITIONAL, "",
++                                   ARES_REC_TYPE_OPT, ARES_CLASS_IN, 0));
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_dns_rr_set_u16(opt, ARES_RR_OPT_UDP_SIZE, 1232));
++  EXPECT_EQ(ARES_SUCCESS, ares_dns_rr_set_u16(opt, ARES_RR_OPT_FLAGS, 0x8000));
++  QueryResult r1;
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_send_dnsrec(channel_, req, QueryCallback, &r1, nullptr));
++  Process();
++  EXPECT_TRUE(r1.done_);
++  EXPECT_EQ(ARES_SUCCESS, r1.status_);
++  ares_dns_record_destroy(req);
++
++  /* A different name that spells out the EDNS suffix, with no OPT record.
++   * It must not be served the entry above; with the cache keyed correctly it
++   * is refused, because '|' is not valid in a hostname. */
++  ares_dns_record_t *req2 = nullptr;
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_dns_record_create(&req2, 0, ARES_FLAG_RD, ARES_OPCODE_QUERY,
++                                   ARES_RCODE_NOERROR));
++  EXPECT_EQ(ARES_SUCCESS,
++            ares_dns_record_query_add(req2, "example.net|EDNS|0|8000",
++                                      ARES_REC_TYPE_A, ARES_CLASS_IN));
++  QueryResult r2;
++  ares_send_dnsrec(channel_, req2, QueryCallback, &r2, nullptr);
++  Process();
++  EXPECT_TRUE(r2.done_);
++  EXPECT_NE(ARES_SUCCESS, r2.status_);
++  ares_dns_record_destroy(req2);
++}
++
+ TEST_P(CacheQueriesTest, GetHostByNameCache) {
+   DNSPacket rsp;
+   rsp.set_response().set_aa()
diff --git a/meta-oe/recipes-support/c-ares/c-ares/0004-Handle-connections-torn-down-by-application.patch b/meta-oe/recipes-support/c-ares/c-ares/0004-Handle-connections-torn-down-by-application.patch
new file mode 100644
index 0000000000..f78e9726b0
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0004-Handle-connections-torn-down-by-application.patch
@@ -0,0 +1,1107 @@
+From 13a10dddbabc30b6fca8e23f9efff73fedba9401 Mon Sep 17 00:00:00 2001
+From: Brad House <brad@brad-house.com>
+Date: Sun, 18 Oct 2026 22:51:53 -0400
+Subject: [PATCH] [Backport v1.34] Handle connections torn down by application
+ socket functions (#1343)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Backport of cb25d8bf297aed0aad8f6e0777ca0635cacc6cb1 to `v1.34`. See
+that commit for the full description.
+
+Application code that c-ares calls while using a connection can
+reconfigure the servers and so tear that connection down. That includes
+the socket functions from `ares_set_socket_functions_ex()` and the older
+`ares_set_socket_functions()`, and the pending-write callback. c-ares
+now notices this while opening, writing to, reading from or closing a
+connection. It requeues the affected queries, or drops the stale data,
+instead of continuing to use the connection.
+
+It applied cleanly on top of the dd62bdfc and #1340 backports (#1338).
+Test file contents match `main`.
+
+Each of the 11 new tests fails on `v1.34` without this change: nine with
+an ASAN heap-use-after-free, and the two receive tests on their
+assertions. All 11 pass with it. The full non-live suite passes 674/674
+under ASAN+UBSAN and with `-DCARES_WERROR=ON` on macOS.
+
+Signed-off-by: Brad House <brad@brad-house.com>
+Co-authored-by: Mar <mardgez13@gmail.com>
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/13a10dddbabc30b6fca8e23f9efff73fedba9401]
+GHSA: GHSA-pj7p-v3cw-hq66
+---
+ src/lib/ares_close_sockets.c |   7 +-
+ src/lib/ares_conn.c          |  29 ++
+ src/lib/ares_process.c       |  65 ++-
+ test/ares-test-mock.cc       | 842 +++++++++++++++++++++++++++++++++++
+ 4 files changed, 935 insertions(+), 8 deletions(-)
+
+diff --git a/src/lib/ares_close_sockets.c b/src/lib/ares_close_sockets.c
+index 6be662fdd3..a3af721bc6 100644
+--- a/src/lib/ares_close_sockets.c
++++ b/src/lib/ares_close_sockets.c
+@@ -148,6 +148,7 @@ void ares_check_cleanup_conns(const ares_channel_t *channel)
+     return; /* LCOV_EXCL_LINE: DefensiveCoding */
+   }
+ 
++restart:
+   /* Iterate across each server */
+   for (snode = ares_slist_node_first(channel->servers); snode != NULL;
+        snode = ares_slist_node_next(snode)) {
+@@ -190,8 +191,12 @@ void ares_check_cleanup_conns(const ares_channel_t *channel)
+         continue;
+       }
+ 
+-      /* Clean it up */
++      /* Clean it up.  The close function is application code and may have
++       * reconfigured the servers, freeing the list nodes this walk holds --
++       * the server's, and the next connection's.  Start over; connections
++       * already closed are no longer listed, so this ends. */
+       ares_close_connection(conn, ARES_SUCCESS);
++      goto restart;
+     }
+   }
+ }
+diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c
+index 4cc0d1871d..5e0827fbdf 100644
+--- a/src/lib/ares_conn.c
++++ b/src/lib/ares_conn.c
+@@ -262,6 +262,15 @@ ares_conn_err_t ares_conn_read(ares_conn_t *conn, void *data, size_t len,
+     err = ares_socket_recv(channel, conn->fd, ARES_TRUE, data, len, read_bytes);
+   }
+ 
++  /* The receive function is application code and may have reconfigured the
++   * servers, tearing this connection down.  Nothing read from it can be
++   * matched any more -- its queries have moved to the new configuration --
++   * and its descriptor is gone, so it must not be read again. */
++  if (conn->flags & ARES_CONN_FLAG_DEAD) {
++    *read_bytes = 0;
++    return ARES_CONN_ERR_CONNCLOSED;
++  }
++
+   /* Toggle connected state if needed */
+   if (err == ARES_CONN_ERR_SUCCESS) {
+     conn->state_flags |= ARES_CONN_STATE_CONNECTED;
+@@ -408,6 +417,19 @@ ares_conn_err_t ares_conn_write(ares_conn_t *conn, const void *data, size_t len,
+   }
+ 
+ done:
++  /* The send function -- from ares_set_socket_functions_ex() or the legacy
++   * ares_set_socket_functions() -- and on the first TCP Fast Open write the
++   * getsockname function, are application code and may have reconfigured the
++   * servers, tearing this connection down.  Whatever the write returned,
++   * nothing written here can be answered any more, and the descriptor has
++   * already been closed or handed to the close notification, so there is no
++   * socket state left to report.  Say so, so every caller treats it as the
++   * connection failure it is. */
++  if (conn->flags & ARES_CONN_FLAG_DEAD) {
++    *written = 0;
++    return ARES_CONN_ERR_CONNCLOSED;
++  }
++
+   if (err == ARES_CONN_ERR_SUCCESS && len == *written) {
+     /* Wrote all data, make sure we're not listening for write events unless
+      * using TFO, in which case we'll need a write event to know when
+@@ -644,6 +666,13 @@ ares_status_t ares_open_connection(ares_conn_t   **conn_out,
+     goto done; /* LCOV_EXCL_LINE: UntestablePath */
+   }
+ 
++  /* The getsockname function is application code as well, and may have
++   * reconfigured the servers the same way. */
++  if (!ares_server_in_channel(channel, server)) {
++    status = ARES_ECONNREFUSED;
++    goto done;
++  }
++
+   /* TCP connections are thrown to the end as we don't spawn multiple TCP
+    * connections. UDP connections are put on front where the newest connection
+    * can be quickly pulled */
+diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
+index 88536704ad..5686b077a6 100644
+--- a/src/lib/ares_process.c
++++ b/src/lib/ares_process.c
+@@ -189,7 +189,9 @@ static void server_increment_failures(ares_server_t *server,
+   ares_timeval_t        next_retry_time;
+ 
+   node = ares_slist_node_find(channel->servers, server);
+-  if (node == NULL) {
++  /* Matches by sort key, not identity, so a removed server can match the live
++   * one that replaced it at the same configuration index. */
++  if (node == NULL || ares_slist_node_val(node) != server) {
+     return; /* LCOV_EXCL_LINE: DefensiveCoding */
+   }
+ 
+@@ -220,7 +222,9 @@ static void server_set_good(ares_server_t *server, ares_bool_t used_tcp)
+   const ares_channel_t *channel = server->channel;
+ 
+   node = ares_slist_node_find(channel->servers, server);
+-  if (node == NULL) {
++  /* Matches by sort key, not identity, so a removed server can match the live
++   * one that replaced it at the same configuration index. */
++  if (node == NULL || ares_slist_node_val(node) != server) {
+     return; /* LCOV_EXCL_LINE: DefensiveCoding */
+   }
+ 
+@@ -501,21 +505,39 @@ void ares_process_pending_write(ares_channel_t *channel)
+    */
+   channel->notify_pending_write = ARES_FALSE;
+ 
+-  for (node = ares_slist_node_first(channel->servers); node != NULL;
+-       node = ares_slist_node_next(node)) {
+-    ares_server_t *server = ares_slist_node_val(node);
+-    ares_conn_t   *conn   = server->tcp_conn;
++  node = ares_slist_node_first(channel->servers);
++  while (node != NULL) {
++    ares_server_t *server     = ares_slist_node_val(node);
++    ares_conn_t   *conn       = server->tcp_conn;
++    size_t         generation = channel->servers_generation;
+     ares_status_t  status;
+ 
+     if (conn == NULL) {
++      node = ares_slist_node_next(node);
+       continue;
+     }
+ 
+-    /* Enqueue any pending data if there is any */
++    /* Enqueue any pending data if there is any.  The flush runs the
++     * application's send function, which may have reconfigured the servers
++     * and removed this one; its connection is then already closed, which
++     * handle_conn_error() ignores. */
+     status = ares_conn_flush(conn);
+     if (status != ARES_SUCCESS) {
+       handle_conn_error(conn, ARES_TRUE, status);
+     }
++
++    /* Tearing down a connection runs the callbacks of the queries it ends,
++     * and those may reconfigure the servers too, destroying the ones the new
++     * configuration omits along with their list nodes.  A failure also moves
++     * this server further down the list.  So when either may have happened,
++     * start over from the head rather than step from this node; flushing a
++     * connection again is harmless. */
++    if (status != ARES_SUCCESS || channel->servers_generation != generation) {
++      node = ares_slist_node_first(channel->servers);
++      continue;
++    }
++
++    node = ares_slist_node_next(node);
+   }
+ 
+   ares_deferred_cb_leave(channel);
+@@ -902,6 +924,13 @@ static ares_status_t process_read(ares_channel_t       *channel,
+     return status;
+   }
+ 
++  /* A later call to the receive function may have reconfigured the servers,
++   * tearing this connection down after earlier calls buffered answers on it.
++   * Its queries have moved to the new configuration, so drop the answers. */
++  if (conn->flags & ARES_CONN_FLAG_DEAD) {
++    return ARES_SUCCESS;
++  }
++
+   status = read_answers(conn, now);
+   if (status != ARES_SUCCESS) {
+     return status;
+@@ -1192,6 +1221,15 @@ static void handle_conn_error(ares_conn_t *conn, ares_bool_t critical_failure,
+ {
+   ares_server_t *server = conn->server;
+ 
++  /* Already torn down, most likely by a reconfiguration from application code
++   * the failing call ran, such as the send function.  Its queries have been
++   * requeued, and its server did not fail -- it was removed, or the
++   * connection was closed deliberately -- so there is nothing to record and
++   * nothing left to close. */
++  if (conn->flags & ARES_CONN_FLAG_DEAD) {
++    return;
++  }
++
+   /* Increment failures first before requeue so it is unlikely to requeue
+    * to the same server */
+   if (critical_failure) {
+@@ -1508,6 +1546,14 @@ static ares_status_t ares_conn_query_write(ares_conn_t          *conn,
+       conn->flags & ARES_CONN_FLAG_TCP) {
+     channel->notify_pending_write = ARES_TRUE;
+     channel->notify_pending_write_cb(channel->notify_pending_write_cb_data);
++
++    /* The callback is application code and may have reconfigured the
++     * servers, closing this connection with the query already buffered on
++     * it.  Report it as a connection failure so the query is requeued rather
++     * than attached to the closed connection. */
++    if (conn->flags & ARES_CONN_FLAG_DEAD) {
++      return ARES_ECONNREFUSED;
++    }
+     return ARES_SUCCESS;
+   }
+ 
+@@ -1650,6 +1696,11 @@ static ares_status_t ares_send_query_int(ares_server_t        *requested_server,
+     return ARES_ECANCELLED;
+   }
+ 
++  /* Application code that tore this connection down during the write -- the
++   * send function, or the pending-write callback when the write is deferred,
++   * reconfiguring the servers, say -- surfaces here as ARES_ECONNREFUSED,
++   * even if the send itself reported success or never happened, so the query
++   * is requeued below rather than attached to the closed connection. */
+   switch (status) {
+     /* Good result, continue on */
+     case ARES_SUCCESS:
+diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc
+index 4b409db7c3..f1d9d360e7 100644
+--- a/test/ares-test-mock.cc
++++ b/test/ares-test-mock.cc
+@@ -2593,6 +2593,86 @@ INSTANTIATE_TEST_SUITE_P(AddressFamilies, MockUDPSingleTryTest,
+                          ::testing::ValuesIn(ares::test::families),
+                          PrintFamily);
+ 
++// ares_process_pending_write() flushes each server's TCP connection.  A flush
++// that fails tears the connection down, which ends a query that is out of
++// retries and runs its callback right there.  A callback that reconfigures the
++// servers removes the one being flushed, and the walk must not go on to use
++// that server, its connection or its place in the list.
++class MockTCPSingleTryStayOpenTest
++  : public MockChannelOptsTest,
++    public ::testing::WithParamInterface<int> {
++public:
++  MockTCPSingleTryStayOpenTest()
++    : MockChannelOptsTest(1, GetParam(), true, false, FillOptions(&opts_),
++                          ARES_OPT_TRIES | ARES_OPT_FLAGS)
++  {
++  }
++
++  static struct ares_options *FillOptions(struct ares_options *opts)
++  {
++    memset(opts, 0, sizeof(struct ares_options));
++    opts->tries = 1;
++    /* ARES_OPT_FLAGS replaces the defaults, which include EDNS. */
++    opts->flags = ARES_FLAG_STAYOPEN | ARES_FLAG_EDNS;
++    return opts;
++  }
++
++private:
++  struct ares_options opts_;
++};
++
++static void PendingWriteNotifyCallback(void *data)
++{
++  *static_cast<bool *>(data) = true;
++}
++
++TEST_P(MockTCPSingleTryStayOpenTest, ReconfigureInPendingWriteFailureCallback) {
++  DNSPacket rsp;
++  rsp.set_response().set_aa()
++    .add_question(new DNSQuestion("www.google.com", T_A))
++    .add_answer(new DNSARR("www.google.com", 100, {2, 3, 4, 5}));
++  ON_CALL(server_, OnRequest("www.google.com", T_A))
++    .WillByDefault(SetReply(&server_, &rsp));
++
++  /* Answered, so the TCP connection is connected; STAYOPEN keeps it. */
++  QueryResult first;
++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    QueryCallback, &first, NULL);
++  Process();
++  EXPECT_TRUE(first.done_);
++
++  /* From here writes on that connection wait for ares_process_pending_write. */
++  bool pending = false;
++  ares_set_pending_write_cb(channel_, PendingWriteNotifyCallback, &pending);
++
++  CancelInCbData data;
++  data.channel = channel_;
++  data.done    = false;
++  data.cbs     = 0;
++  ares_query_dnsrec(channel_, "www.example.com", ARES_CLASS_IN,
++                    ARES_REC_TYPE_A, ReconfigureServersCallback, &data, NULL);
++  EXPECT_TRUE(pending);
++  EXPECT_FALSE(data.done);
++
++  /* ares_set_socket_functions() stores the pointer rather than copying it. */
++  static ares_socket_functions sock_funcs;
++  memset(&sock_funcs, 0, sizeof(sock_funcs));
++  sock_funcs.asendv = ares_sendv_fail;
++  ares_set_socket_functions(channel_, &sock_funcs, NULL);
++  LibraryTest::SetFailSend();
++
++  ares_process_pending_write(channel_);
++
++  EXPECT_TRUE(data.done);
++  EXPECT_EQ((size_t)1, data.cbs);
++
++  ares_set_pending_write_cb(channel_, NULL, NULL);
++}
++
++INSTANTIATE_TEST_SUITE_P(AddressFamilies, MockTCPSingleTryStayOpenTest,
++                         ::testing::ValuesIn(ares::test::families),
++                         PrintFamily);
++
+ TEST_P(MockUDPChannelTest, CancelInDestroyCallbackNoUseAfterFree) {
+   CancelInCbData data;
+   data.channel = channel_;
+@@ -2898,6 +2978,768 @@ TEST_F(LibraryTest, ReconfigureInConfigureHookNoUseAfterFree) {
+   ares_destroy(chan);
+ }
+ 
++// Reconfiguring the servers from the application's own send function.  The
++// write itself goes through: the send function reports every byte sent.  But
++// the reconfiguration has already closed the connection being written to and
++// removed its server, so the query must be moved to the new configuration
++// rather than attached to the closed connection -- where it would sit on a
++// list that is freed once the call unwinds, in flight on no socket.
++struct ReconfigureFromSendData {
++  ares_channel_t *channel;
++  bool            done;
++  int             status;
++};
++
++static ares_ssize_t ReconfigureSendv(ares_socket_t fd, const struct iovec *iov,
++                                     int iovcnt, void *user_data)
++{
++  ReconfigureFromSendData *d =
++    static_cast<ReconfigureFromSendData *>(user_data);
++  ares_ssize_t len = 0;
++  (void)fd;
++  for (int i = 0; i < iovcnt; i++) {
++    len += static_cast<ares_ssize_t>(iov[i].iov_len);
++  }
++  // Frees the server this connection belongs to.  Reconfiguring to the same
++  // list again is a no-op, so the retry is written normally.
++  ares_set_servers_csv(d->channel, "127.0.0.1:53056");
++  return len;
++}
++
++static void ReconfigureFromSendCallback(void *arg, ares_status_t status,
++                                        size_t                   timeouts,
++                                        const ares_dns_record_t *dnsrec)
++{
++  ReconfigureFromSendData *d = static_cast<ReconfigureFromSendData *>(arg);
++  (void)timeouts;
++  (void)dnsrec;
++  d->done   = true;
++  d->status = static_cast<int>(status);
++}
++
++TEST_F(LibraryTest, ReconfigureInSuccessfulSendNoUseAfterFree) {
++  ares_channel_t         *chan = nullptr;
++  struct ares_options     opts;
++  int                     optmask = 0;
++  ares_socket_functions   funcs;
++  ReconfigureFromSendData data;
++  ares_socket_t           socks[ARES_GETSOCK_MAXNUM];
++
++  memset(&opts, 0, sizeof(opts));
++  opts.flags  = ARES_FLAG_NOSEARCH;
++  optmask    |= ARES_OPT_FLAGS;
++
++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&chan, &opts, optmask));
++  ASSERT_NE(nullptr, chan);
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan, "127.0.0.1:53055"));
++
++  data.channel = chan;
++  data.done    = false;
++  data.status  = ARES_SUCCESS;
++  memset(&funcs, 0, sizeof(funcs));
++  funcs.asendv = ReconfigureSendv;
++  ares_set_socket_functions(chan, &funcs, &data);
++
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    ReconfigureFromSendCallback, &data, NULL);
++
++  // Moved to the new server and written there, so it is in flight on a
++  // socket the application can watch.
++  EXPECT_FALSE(data.done);
++  EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));
++  EXPECT_NE(0, ares_getsock(chan, socks, ARES_GETSOCK_MAXNUM));
++
++  ares_cancel(chan);
++  EXPECT_TRUE(data.done);
++  EXPECT_EQ(ARES_ECANCELLED, data.status);
++  EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));
++  ares_destroy(chan);
++}
++
++// The connection the send function tore down has already been reported as
++// closed, and its descriptor closed or handed to that notification.  Nothing
++// after the send may report socket state for it: doing so names
++// ARES_SOCKET_BAD, a descriptor the application was never given.
++struct BadSocketStateData {
++  size_t calls;
++  size_t bad;
++};
++
++static void BadSocketStateCallback(void *data, ares_socket_t socket_fd,
++                                   int readable, int writable)
++{
++  BadSocketStateData *d = static_cast<BadSocketStateData *>(data);
++  (void)readable;
++  (void)writable;
++  d->calls++;
++  if (socket_fd == ARES_SOCKET_BAD) {
++    d->bad++;
++  }
++}
++
++TEST_F(LibraryTest, ReconfigureInSendReportsNoBadSocket) {
++  ares_channel_t         *chan = nullptr;
++  struct ares_options     opts;
++  int                     optmask = 0;
++  ares_socket_functions   funcs;
++  ReconfigureFromSendData data;
++  BadSocketStateData      sock;
++
++  memset(&opts, 0, sizeof(opts));
++  memset(&sock, 0, sizeof(sock));
++  opts.flags               = ARES_FLAG_NOSEARCH;
++  optmask                 |= ARES_OPT_FLAGS;
++  opts.sock_state_cb       = BadSocketStateCallback;
++  opts.sock_state_cb_data  = &sock;
++  optmask                 |= ARES_OPT_SOCK_STATE_CB;
++
++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&chan, &opts, optmask));
++  ASSERT_NE(nullptr, chan);
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan, "127.0.0.1:53055"));
++
++  data.channel = chan;
++  data.done    = false;
++  data.status  = ARES_SUCCESS;
++  memset(&funcs, 0, sizeof(funcs));
++  funcs.asendv = ReconfigureSendv;
++  ares_set_socket_functions(chan, &funcs, &data);
++
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    ReconfigureFromSendCallback, &data, NULL);
++  ares_cancel(chan);
++  EXPECT_TRUE(data.done);
++
++  EXPECT_NE((size_t)0, sock.calls);
++  EXPECT_EQ((size_t)0, sock.bad);
++  ares_destroy(chan);
++}
++
++// The same reconfiguration from the send function, reached through the
++// deferred TCP write: ares_set_pending_write_cb() queues the write and the
++// application later flushes it with ares_process_pending_write().  That flush
++// is its own outermost library call, so the connection and server the
++// reconfiguration closes must stay readable until it returns, and its walk of
++// the server list must not step from a list node the reconfiguration freed.
++// Covers both a send that reports success and one that fails.  A failure
++// on the removed server must not be charged to the server that replaced it.
++struct PendingWriteReconfigureData {
++  ares_channel_t *channel;
++  bool            reconfigure;
++  bool            fail;
++  bool            pending;
++  size_t          done;
++  size_t          server_failures;
++};
++
++static int PendingWriteConnect(ares_socket_t fd, const struct sockaddr *addr,
++                               ares_socklen_t addrlen, void *user_data)
++{
++  (void)fd;
++  (void)addr;
++  (void)addrlen;
++  (void)user_data;
++  // Pretend the connection is in progress; the test signals it writable.
++  return 0;
++}
++
++static ares_ssize_t PendingWriteSendv(ares_socket_t fd, const struct iovec *iov,
++                                      int iovcnt, void *user_data)
++{
++  PendingWriteReconfigureData *d =
++    static_cast<PendingWriteReconfigureData *>(user_data);
++  ares_ssize_t len = 0;
++  (void)fd;
++  for (int i = 0; i < iovcnt; i++) {
++    len += static_cast<ares_ssize_t>(iov[i].iov_len);
++  }
++  if (!d->reconfigure) {
++    return len;
++  }
++  d->reconfigure = false;
++  // Closes this connection and frees its server.
++  ares_set_servers_csv(d->channel, "127.0.0.1:53056");
++  if (d->fail) {
++#ifdef USE_WINSOCK
++    WSASetLastError(WSAECONNREFUSED);
++#else
++    errno = ECONNREFUSED;
++#endif
++    return -1;
++  }
++  return len;
++}
++
++static void PendingWriteNotify(void *user_data)
++{
++  PendingWriteReconfigureData *d =
++    static_cast<PendingWriteReconfigureData *>(user_data);
++  d->pending = true;
++}
++
++static void PendingWriteServerState(const char *server_string,
++                                    ares_bool_t success, int flags,
++                                    void *user_data)
++{
++  PendingWriteReconfigureData *d =
++    static_cast<PendingWriteReconfigureData *>(user_data);
++  (void)server_string;
++  (void)flags;
++  if (!success) {
++    d->server_failures++;
++  }
++}
++
++static void PendingWriteCallback(void *arg, ares_status_t status,
++                                 size_t                   timeouts,
++                                 const ares_dns_record_t *dnsrec)
++{
++  PendingWriteReconfigureData *d =
++    static_cast<PendingWriteReconfigureData *>(arg);
++  (void)timeouts;
++  (void)dnsrec;
++  EXPECT_EQ(ARES_ECANCELLED, status);
++  d->done++;
++}
++
++static void ReconfigureInPendingWrite(bool fail)
++{
++  ares_channel_t             *chan = nullptr;
++  struct ares_options         opts;
++  int                         optmask = 0;
++  ares_socket_functions       funcs;
++  PendingWriteReconfigureData data;
++  ares_socket_t               socks[ARES_GETSOCK_MAXNUM];
++  int                         bitmask;
++
++  memset(&opts, 0, sizeof(opts));
++  opts.flags  = ARES_FLAG_NOSEARCH | ARES_FLAG_USEVC;
++  optmask    |= ARES_OPT_FLAGS;
++
++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&chan, &opts, optmask));
++  ASSERT_NE(nullptr, chan);
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan, "127.0.0.1:53055"));
++
++  data.channel         = chan;
++  data.reconfigure     = false;
++  data.fail            = fail;
++  data.pending         = false;
++  data.done            = 0;
++  data.server_failures = 0;
++  memset(&funcs, 0, sizeof(funcs));
++  funcs.aconnect = PendingWriteConnect;
++  funcs.asendv   = PendingWriteSendv;
++  ares_set_socket_functions(chan, &funcs, &data);
++  ares_set_pending_write_cb(chan, PendingWriteNotify, &data);
++  ares_set_server_state_callback(chan, PendingWriteServerState, &data);
++
++  // The first query opens the connection; its write waits for it to connect.
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    PendingWriteCallback, &data, NULL);
++  bitmask = ares_getsock(chan, socks, ARES_GETSOCK_MAXNUM);
++  ASSERT_NE(0, ARES_GETSOCK_WRITABLE(bitmask, 0));
++
++  // Report it connected, which writes the first query.
++  ares_process_fd(chan, ARES_SOCKET_BAD, socks[0]);
++  EXPECT_FALSE(data.pending);
++
++  // Now connected, so the second query's write is deferred to the
++  // application.
++  ares_query_dnsrec(chan, "www.example.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    PendingWriteCallback, &data, NULL);
++  EXPECT_TRUE(data.pending);
++
++  data.reconfigure = true;
++  ares_process_pending_write(chan);
++  EXPECT_FALSE(data.reconfigure);
++
++  // Both queries were moved to the new server, which has not failed.
++  EXPECT_EQ((size_t)0, data.done);
++  EXPECT_EQ((size_t)0, data.server_failures);
++  EXPECT_EQ((size_t)2, ares_queue_active_queries(chan));
++
++  ares_cancel(chan);
++  EXPECT_EQ((size_t)2, data.done);
++  EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));
++  ares_destroy(chan);
++}
++
++TEST_F(LibraryTest, ReconfigureInSuccessfulPendingWriteNoUseAfterFree) {
++  ReconfigureInPendingWrite(false);
++}
++
++TEST_F(LibraryTest, ReconfigureInFailedPendingWriteNoUseAfterFree) {
++  ReconfigureInPendingWrite(true);
++}
++
++// The pending-write callback is application code too, and runs once the query
++// has been buffered on the connection.  Reconfiguring from it closes that
++// connection, so the query must be requeued rather than attached to it.
++static void PendingWriteReconfigureNotify(void *user_data)
++{
++  PendingWriteReconfigureData *d =
++    static_cast<PendingWriteReconfigureData *>(user_data);
++  d->pending = true;
++  if (d->reconfigure) {
++    d->reconfigure = false;
++    // Closes the connection the query was just buffered on.
++    ares_set_servers_csv(d->channel, "127.0.0.1:53056");
++  }
++}
++
++TEST_F(LibraryTest, ReconfigureInPendingWriteCallbackNoUseAfterFree) {
++  ares_channel_t             *chan = nullptr;
++  struct ares_options         opts;
++  int                         optmask = 0;
++  ares_socket_functions       funcs;
++  PendingWriteReconfigureData data;
++  ares_socket_t               socks[ARES_GETSOCK_MAXNUM];
++  int                         bitmask;
++
++  memset(&opts, 0, sizeof(opts));
++  opts.flags  = ARES_FLAG_NOSEARCH | ARES_FLAG_USEVC;
++  optmask    |= ARES_OPT_FLAGS;
++
++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&chan, &opts, optmask));
++  ASSERT_NE(nullptr, chan);
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan, "127.0.0.1:53055"));
++
++  data.channel         = chan;
++  data.reconfigure     = false;
++  data.fail            = false;
++  data.pending         = false;
++  data.done            = 0;
++  data.server_failures = 0;
++  memset(&funcs, 0, sizeof(funcs));
++  funcs.aconnect = PendingWriteConnect;
++  funcs.asendv   = PendingWriteSendv;
++  ares_set_socket_functions(chan, &funcs, &data);
++  ares_set_pending_write_cb(chan, PendingWriteReconfigureNotify, &data);
++
++  // The first query opens the connection; its write waits for it to connect.
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    PendingWriteCallback, &data, NULL);
++  bitmask = ares_getsock(chan, socks, ARES_GETSOCK_MAXNUM);
++  ASSERT_NE(0, ARES_GETSOCK_WRITABLE(bitmask, 0));
++
++  // Report it connected, which writes the first query.
++  ares_process_fd(chan, ARES_SOCKET_BAD, socks[0]);
++  EXPECT_FALSE(data.pending);
++
++  // Now connected, so the second query is buffered and the pending-write
++  // callback runs, reconfiguring the servers.
++  data.reconfigure = true;
++  ares_query_dnsrec(chan, "www.example.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    PendingWriteCallback, &data, NULL);
++  EXPECT_TRUE(data.pending);
++  EXPECT_FALSE(data.reconfigure);
++
++  // Both queries were moved to the new server.
++  EXPECT_EQ((size_t)0, data.done);
++  EXPECT_EQ((size_t)2, ares_queue_active_queries(chan));
++
++  ares_cancel(chan);
++  EXPECT_EQ((size_t)2, data.done);
++  EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));
++  ares_destroy(chan);
++}
++
++// Fake socket functions, installed with ares_set_socket_functions_ex(), that
++// never touch a real descriptor.  Each test arms one of them to reconfigure
++// the servers part-way through c-ares's use of a connection, and they count
++// every call that names ARES_SOCKET_BAD, which a closed connection must never
++// pass to application code.
++struct FakeSockData {
++  ares_channel_t    *channel;
++  ares_socket_t      next_fd;
++  bool               tfo;
++  bool               getsockname_fail_first;
++  ares_socket_t      getsockname_last_fd;
++  bool               getsockname_reconfigure;
++  bool               recv_reconfigure;
++  bool               recv_answer_then_reconfigure;
++  bool               recv_answered;
++  bool               recv_answer;
++  bool               close_reconfigure;
++  unsigned char      query[512];
++  size_t             query_len;
++  struct sockaddr_in peer;
++  size_t             recv_calls;
++  size_t             bad_fd_calls;
++  size_t             sock_state_bad;
++  bool               done;
++  int                status;
++};
++
++static void FakeSockSetErrno(bool wouldblock)
++{
++#ifdef USE_WINSOCK
++  WSASetLastError(wouldblock ? WSAEWOULDBLOCK : WSAENOTCONN);
++#else
++  errno = wouldblock ? EAGAIN : ENOTCONN;
++#endif
++}
++
++static ares_socket_t FakeSockSocket(int domain, int type, int protocol,
++                                    void *user_data)
++{
++  FakeSockData *d = static_cast<FakeSockData *>(user_data);
++  (void)domain;
++  (void)type;
++  (void)protocol;
++  return d->next_fd++;
++}
++
++static int FakeSockClose(ares_socket_t sock, void *user_data)
++{
++  FakeSockData *d = static_cast<FakeSockData *>(user_data);
++  if (sock == ARES_SOCKET_BAD) {
++    d->bad_fd_calls++;
++  }
++  if (d->close_reconfigure) {
++    d->close_reconfigure = false;
++    // Frees the server this connection belonged to.
++    ares_set_servers_csv(d->channel, "127.0.0.1:53056");
++  }
++  return 0;
++}
++
++static int FakeSockSetsockopt(ares_socket_t sock, ares_socket_opt_t opt,
++                              const void *val, ares_socklen_t val_size,
++                              void *user_data)
++{
++  FakeSockData *d = static_cast<FakeSockData *>(user_data);
++  (void)sock;
++  (void)val;
++  (void)val_size;
++  if (opt == ARES_SOCKET_OPT_TCP_FASTOPEN && !d->tfo) {
++    return -1;
++  }
++  return 0;
++}
++
++static int FakeSockConnect(ares_socket_t sock, const struct sockaddr *address,
++                           ares_socklen_t address_len, unsigned int flags,
++                           void *user_data)
++{
++  FakeSockData *d = static_cast<FakeSockData *>(user_data);
++  (void)sock;
++  (void)flags;
++  if (address->sa_family == AF_INET && address_len >= sizeof(d->peer)) {
++    memcpy(&d->peer, address, sizeof(d->peer));
++  }
++  return 0;
++}
++
++static ares_ssize_t FakeSockRecvfrom(ares_socket_t sock, void *buffer,
++                                     size_t length, int flags,
++                                     struct sockaddr *address,
++                                     ares_socklen_t  *address_len,
++                                     void            *user_data)
++{
++  FakeSockData *d = static_cast<FakeSockData *>(user_data);
++  (void)flags;
++  d->recv_calls++;
++  if (sock == ARES_SOCKET_BAD) {
++    d->bad_fd_calls++;
++  }
++  if (d->query_len < 12 || length < d->query_len) {
++    FakeSockSetErrno(true);
++    return -1;
++  }
++  if (d->recv_answer_then_reconfigure) {
++    // Answer first; reconfigure on the next call, which has nothing to read.
++    if (d->recv_answered) {
++      d->recv_answer_then_reconfigure = false;
++      ares_set_servers_csv(d->channel, "127.0.0.1:53056");
++      FakeSockSetErrno(true);
++      return -1;
++    }
++    d->recv_answered = true;
++  } else if (d->recv_reconfigure) {
++    d->recv_reconfigure = false;
++    // Frees the server this connection belongs to.
++    ares_set_servers_csv(d->channel, "127.0.0.1:53056");
++  } else if (d->recv_answer) {
++    d->recv_answer = false;
++  } else {
++    FakeSockSetErrno(true);
++    return -1;
++  }
++  // Answer the query: the same message with QR set, no records.
++  memcpy(buffer, d->query, d->query_len);
++  static_cast<unsigned char *>(buffer)[2] |= 0x80;
++  if (address != NULL && address_len != NULL &&
++      *address_len >= (ares_socklen_t)sizeof(d->peer)) {
++    memcpy(address, &d->peer, sizeof(d->peer));
++    *address_len = sizeof(d->peer);
++  }
++  return static_cast<ares_ssize_t>(d->query_len);
++}
++
++static ares_ssize_t FakeSockSendto(ares_socket_t sock, const void *buffer,
++                                   size_t length, int flags,
++                                   const struct sockaddr *address,
++                                   ares_socklen_t address_len, void *user_data)
++{
++  FakeSockData *d = static_cast<FakeSockData *>(user_data);
++  (void)flags;
++  (void)address;
++  (void)address_len;
++  if (sock == ARES_SOCKET_BAD) {
++    d->bad_fd_calls++;
++  }
++  if (length <= sizeof(d->query)) {
++    memcpy(d->query, buffer, length);
++    d->query_len = length;
++  }
++  return static_cast<ares_ssize_t>(length);
++}
++
++static int FakeSockGetsockname(ares_socket_t sock, struct sockaddr *address,
++                               ares_socklen_t *address_len, void *user_data)
++{
++  FakeSockData      *d = static_cast<FakeSockData *>(user_data);
++  struct sockaddr_in sin;
++  if (sock == ARES_SOCKET_BAD) {
++    d->bad_fd_calls++;
++  }
++  // As during TCP Fast Open, before the first write has connected.
++  if (d->getsockname_fail_first && sock != d->getsockname_last_fd) {
++    d->getsockname_last_fd = sock;
++    FakeSockSetErrno(false);
++    return -1;
++  }
++  if (d->getsockname_reconfigure) {
++    d->getsockname_reconfigure = false;
++    // Frees the server this connection belongs to.
++    ares_set_servers_csv(d->channel, "127.0.0.1:53056");
++  }
++  if (*address_len < (ares_socklen_t)sizeof(sin)) {
++    FakeSockSetErrno(false);
++    return -1;
++  }
++  memset(&sin, 0, sizeof(sin));
++  sin.sin_family      = AF_INET;
++  sin.sin_port        = htons(40000);
++  sin.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
++  memcpy(address, &sin, sizeof(sin));
++  *address_len = sizeof(sin);
++  return 0;
++}
++
++static void FakeSockStateCallback(void *data, ares_socket_t socket_fd,
++                                  int readable, int writable)
++{
++  FakeSockData *d = static_cast<FakeSockData *>(data);
++  (void)readable;
++  (void)writable;
++  if (socket_fd == ARES_SOCKET_BAD) {
++    d->sock_state_bad++;
++  }
++}
++
++static void FakeSockQueryCallback(void *arg, ares_status_t status,
++                                  size_t                   timeouts,
++                                  const ares_dns_record_t *dnsrec)
++{
++  FakeSockData *d = static_cast<FakeSockData *>(arg);
++  (void)timeouts;
++  (void)dnsrec;
++  d->done   = true;
++  d->status = static_cast<int>(status);
++}
++
++static void FakeSockInit(ares_channel_t **chan, FakeSockData *data,
++                         int extra_flags, unsigned int sockfunc_flags,
++                         bool sock_state = true)
++{
++  struct ares_options             opts;
++  int                             optmask = 0;
++  struct ares_socket_functions_ex funcs;
++
++  memset(&opts, 0, sizeof(opts));
++  opts.flags  = ARES_FLAG_NOSEARCH | extra_flags;
++  optmask    |= ARES_OPT_FLAGS;
++  // A socket-state callback defers the close of a connection's descriptor
++  // until the outermost call unwinds; without one it is closed inline.
++  if (sock_state) {
++    opts.sock_state_cb       = FakeSockStateCallback;
++    opts.sock_state_cb_data  = data;
++    optmask                 |= ARES_OPT_SOCK_STATE_CB;
++  }
++  ASSERT_EQ(ARES_SUCCESS, ares_init_options(chan, &opts, optmask));
++  ASSERT_NE(nullptr, *chan);
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(*chan, "127.0.0.1:53055"));
++
++  data->channel             = *chan;
++  data->next_fd             = 100;
++  data->getsockname_last_fd = ARES_SOCKET_BAD;
++
++  memset(&funcs, 0, sizeof(funcs));
++  funcs.version      = 1;
++  funcs.flags        = sockfunc_flags;
++  funcs.asocket      = FakeSockSocket;
++  funcs.aclose       = FakeSockClose;
++  funcs.asetsockopt  = FakeSockSetsockopt;
++  funcs.aconnect     = FakeSockConnect;
++  funcs.arecvfrom    = FakeSockRecvfrom;
++  funcs.asendto      = FakeSockSendto;
++  funcs.agetsockname = FakeSockGetsockname;
++  EXPECT_EQ(ARES_SUCCESS, ares_set_socket_functions_ex(*chan, &funcs, data));
++}
++
++// The getsockname function runs for every new connection, after the checks
++// that follow the socket-configure and socket-create callbacks.  Reconfiguring
++// from it must not leave the connection registered on the removed server.
++TEST_F(LibraryTest, ReconfigureInGetsocknameNoUseAfterFree) {
++  ares_channel_t *chan = nullptr;
++  FakeSockData    data;
++
++  memset(&data, 0, sizeof(data));
++  FakeSockInit(&chan, &data, 0, 0);
++  data.getsockname_reconfigure = true;
++
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    FakeSockQueryCallback, &data, NULL);
++  EXPECT_FALSE(data.getsockname_reconfigure);
++
++  // The first connection's descriptor: no longer known to the channel.
++  ares_process_fd(chan, 100, ARES_SOCKET_BAD);
++
++  // Moved to the new server.
++  EXPECT_FALSE(data.done);
++  EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));
++
++  ares_cancel(chan);
++  EXPECT_TRUE(data.done);
++  EXPECT_EQ(ARES_ECANCELLED, data.status);
++  EXPECT_EQ((size_t)0, data.bad_fd_calls);
++  EXPECT_EQ((size_t)0, data.sock_state_bad);
++  ares_destroy(chan);
++}
++
++// With TCP Fast Open the first getsockname may fail, and is retried after the
++// first write -- from inside ares_conn_write(), after the send function has
++// returned.  Reconfiguring from that retry closes the connection the query was
++// just written on.
++TEST_F(LibraryTest, ReconfigureInFastOpenGetsocknameNoUseAfterFree) {
++  ares_channel_t *chan = nullptr;
++  FakeSockData    data;
++
++  memset(&data, 0, sizeof(data));
++  FakeSockInit(&chan, &data, ARES_FLAG_USEVC, 0);
++  data.tfo                     = true;
++  data.getsockname_fail_first  = true;
++  data.getsockname_reconfigure = true;
++
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    FakeSockQueryCallback, &data, NULL);
++  EXPECT_FALSE(data.getsockname_reconfigure);
++
++  // Moved to the new server.
++  EXPECT_FALSE(data.done);
++  EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));
++  EXPECT_EQ((size_t)0, data.sock_state_bad);
++
++  ares_cancel(chan);
++  EXPECT_TRUE(data.done);
++  EXPECT_EQ(ARES_ECANCELLED, data.status);
++  EXPECT_EQ((size_t)0, data.bad_fd_calls);
++  ares_destroy(chan);
++}
++
++// A non-blocking receive function that reconfigures the servers and returns
++// an answer.  The connection it read from is closed, so the answer must be
++// dropped -- the query has already moved to the new server -- and the
++// receive function must not be called again on the closed connection.
++TEST_F(LibraryTest, ReconfigureInRecvDropsStaleAnswer) {
++  ares_channel_t *chan = nullptr;
++  FakeSockData    data;
++
++  memset(&data, 0, sizeof(data));
++  FakeSockInit(&chan, &data, 0, ARES_SOCKFUNC_FLAG_NONBLOCKING);
++
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    FakeSockQueryCallback, &data, NULL);
++  ASSERT_NE((size_t)0, data.query_len);
++
++  data.recv_reconfigure = true;
++  ares_process_fd(chan, 100, ARES_SOCKET_BAD);
++  EXPECT_FALSE(data.recv_reconfigure);
++
++  EXPECT_EQ((size_t)1, data.recv_calls);
++  EXPECT_EQ((size_t)0, data.bad_fd_calls);
++  // Still in flight on the new server.
++  EXPECT_FALSE(data.done);
++  EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));
++
++  ares_cancel(chan);
++  EXPECT_TRUE(data.done);
++  EXPECT_EQ(ARES_ECANCELLED, data.status);
++  ares_destroy(chan);
++}
++
++// As above, but the answer comes from an earlier receive call, and a later
++// call -- which has nothing more to read -- reconfigures the servers.  The
++// answer is already buffered on the connection that call tore down, and must
++// be dropped with it.
++TEST_F(LibraryTest, ReconfigureInRecvDropsBufferedAnswer) {
++  ares_channel_t *chan = nullptr;
++  FakeSockData    data;
++
++  memset(&data, 0, sizeof(data));
++  FakeSockInit(&chan, &data, 0, ARES_SOCKFUNC_FLAG_NONBLOCKING);
++
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    FakeSockQueryCallback, &data, NULL);
++  ASSERT_NE((size_t)0, data.query_len);
++
++  data.recv_answer_then_reconfigure = true;
++  ares_process_fd(chan, 100, ARES_SOCKET_BAD);
++  EXPECT_FALSE(data.recv_answer_then_reconfigure);
++
++  EXPECT_EQ((size_t)2, data.recv_calls);
++  EXPECT_EQ((size_t)0, data.bad_fd_calls);
++  // Still in flight on the new server.
++  EXPECT_FALSE(data.done);
++  EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));
++
++  ares_cancel(chan);
++  EXPECT_TRUE(data.done);
++  EXPECT_EQ(ARES_ECANCELLED, data.status);
++  ares_destroy(chan);
++}
++
++// The close function is application code too.  With no socket-state callback
++// to carry the descriptor, it runs inline while ares_check_cleanup_conns()
++// walks the server list and each server's connections, closing idle ones.
++// Reconfiguring from it frees the list nodes that walk holds.
++TEST_F(LibraryTest, ReconfigureInCloseNoUseAfterFree) {
++  ares_channel_t *chan = nullptr;
++  FakeSockData    data;
++
++  memset(&data, 0, sizeof(data));
++  FakeSockInit(&chan, &data, 0, 0, false);
++
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    FakeSockQueryCallback, &data, NULL);
++  ASSERT_NE((size_t)0, data.query_len);
++
++  // Answer it; the now idle connection is then closed.
++  data.recv_answer       = true;
++  data.close_reconfigure = true;
++  ares_process_fd(chan, 100, ARES_SOCKET_BAD);
++  EXPECT_FALSE(data.recv_answer);
++  EXPECT_FALSE(data.close_reconfigure);
++
++  EXPECT_TRUE(data.done);
++  // The fake answer carries no records.
++  EXPECT_EQ(ARES_ENODATA, data.status);
++  EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));
++  EXPECT_EQ((size_t)0, data.bad_fd_calls);
++  ares_destroy(chan);
++}
++
+ // The second route to the same freed connection, and the one that drove the
+ // change from suppressing the idle sweep to deferring the notification:
+ // reconfiguring the servers from the socket-state callback destroys the server
diff --git a/meta-oe/recipes-support/c-ares/c-ares/0005-ares_process-only-accept-an-answer-on-the-right-connection.patch b/meta-oe/recipes-support/c-ares/c-ares/0005-ares_process-only-accept-an-answer-on-the-right-connection.patch
new file mode 100644
index 0000000000..20fef5d2f0
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0005-ares_process-only-accept-an-answer-on-the-right-connection.patch
@@ -0,0 +1,575 @@
+From c8bd9ab53329f66ec0c395a11002a5696669b147 Mon Sep 17 00:00:00 2001
+From: Brad House <brad@brad-house.com>
+Date: Mon, 19 Oct 2026 11:53:54 -0400
+Subject: [PATCH] [Backport v1.34] ares_process: only accept an answer on the
+ connection its query was sent on (#1361)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Backport of b6f8a9b47e17c681e092a74d05d73bbb35c89a39 to `v1.34`. See
+that commit for the full description.
+
+**Conflicts:** `src/lib/ares_socket.h` only — v1.34 aligns the
+neighbouring prototypes differently. Resolved by taking the new doc
+comments and the `ares_sockaddr_addr_port_eq()` prototype, then
+re-running clang-format for the v1.34 alignment (which also re-wraps the
+new `SendData()` declaration in `test/ares-test.h`). All other files
+applied unchanged; the `test/` diffs match main exactly.
+
+**Tests (local, macOS, Debug, Ninja):**
+- ASAN+UBSAN and `-DCARES_WERROR=ON` builds: `arestest -4
+--gtest_filter='-*Live*'` — 693/693 passed in both.
+- With the `src/` changes reverted, the 4 new test instances fail
+(`UDPAnswerFromWrongPortDropped`, `AnswerOnOtherServerConnectionDropped`
+UDP/TCP, `CookielessAnswerOnOtherServerDropped`); they pass with them.
+- `git clang-format --diff upstream/v1.34` clean. Also tested together
+with the other two v1.34 backports (both orders apply cleanly): 699/699
+passed under ASAN+UBSAN and `-Werror`.
+
+Signed-off-by: Brad House <brad@brad-house.com>
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/c8bd9ab53329f66ec0c395a11002a5696669b147]
+GHSA: GHSA-fqh5-3x7m-wp44
+---
+ src/lib/ares_conn.c    |  11 ++-
+ src/lib/ares_process.c |  18 ++++
+ src/lib/ares_socket.c  |  24 +++++
+ src/lib/ares_socket.h  |  21 ++++
+ test/ares-test-mock.cc | 218 +++++++++++++++++++++++++++++++++++++++++
+ test/ares-test.cc      |  86 +++++++++-------
+ test/ares-test.h       |  12 +++
+ 7 files changed, 355 insertions(+), 35 deletions(-)
+
+diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c
+index 5e0827fbdf..b868053e62 100644
+--- a/src/lib/ares_conn.c
++++ b/src/lib/ares_conn.c
+@@ -252,9 +252,16 @@ ares_conn_err_t ares_conn_read(ares_conn_t *conn, void *data, size_t len,
+                            (struct sockaddr *)&sa_storage, &salen, read_bytes);
+ 
+ #ifdef HAVE_RECVFROM
++    /* The socket is connect()ed, so the kernel normally drops datagrams from
++     * any other address or port already.  Application-provided socket
++     * functions might not filter on connect, so also check here that the
++     * datagram came from the server's address and UDP port.  RFC 5452
++     * section 9.1 only requires the address to match; matching the port too
++     * keeps one server from answering for another on the same address. */
+     if (err == ARES_CONN_ERR_SUCCESS &&
+-        !ares_sockaddr_addr_eq((struct sockaddr *)&sa_storage,
+-                               &conn->server->addr)) {
++        !ares_sockaddr_addr_port_eq((struct sockaddr *)&sa_storage,
++                                    &conn->server->addr,
++                                    conn->server->udp_port)) {
+       err = ARES_CONN_ERR_WOULDBLOCK;
+     }
+ #endif
+diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
+index 5686b077a6..06d0ca507c 100644
+--- a/src/lib/ares_process.c
++++ b/src/lib/ares_process.c
+@@ -1117,6 +1117,24 @@ static ares_status_t process_answer(ares_channel_t      *channel,
+     goto cleanup;
+   }
+ 
++  /* RFC 5452 section 9.1: only accept a response that arrives on the
++   * connection the query was sent on, and so from the server it was sent to.
++   * For UDP, ares_conn_read() also drops a datagram whose source address or
++   * port is not the server's; matching the port is hardening beyond RFC 5452
++   * section 9.1, which only requires the address to match.  Otherwise any
++   * server we hold a connection to could answer, and get cached, a query that
++   * was only ever sent to some other server, and the cookie check below would
++   * run against the wrong server's cookie state.  Treat it like an unknown
++   * query id, before anything acts on it (cookies, server health, the cache).
++   * Our caller has already consumed the message from the connection's buffer,
++   * so TCP framing stays in sync.  A query not attached to any connection
++   * (query->conn == NULL) never matches.  This also drops a late answer from
++   * a server tried before a retry. */
++  if (query->conn != conn) {
++    status = ARES_SUCCESS;
++    goto cleanup;
++  }
++
+   /* Validate DNS cookie in response. This function may need to requeue the
+    * query. */
+   if (ares_cookie_validate(query, rdnsrec, conn, now, requeue)
+diff --git a/src/lib/ares_socket.c b/src/lib/ares_socket.c
+index 4ad3034021..0a12935ab7 100644
+--- a/src/lib/ares_socket.c
++++ b/src/lib/ares_socket.c
+@@ -127,6 +127,30 @@ ares_bool_t ares_sockaddr_addr_eq(const struct sockaddr  *sa,
+   return ARES_FALSE; /* different */
+ }
+ 
++ares_bool_t ares_sockaddr_addr_port_eq(const struct sockaddr  *sa,
++                                       const struct ares_addr *aa,
++                                       unsigned short          port)
++{
++  unsigned short sa_port;
++
++  if (!ares_sockaddr_addr_eq(sa, aa)) {
++    return ARES_FALSE;
++  }
++
++  /* ares_sockaddr_addr_eq() only matches AF_INET and AF_INET6 */
++  if (sa->sa_family == AF_INET) {
++    sa_port = (CARES_INADDR_CAST(const struct sockaddr_in *, sa))->sin_port;
++  } else {
++    sa_port = (CARES_INADDR_CAST(const struct sockaddr_in6 *, sa))->sin6_port;
++  }
++
++  if (ntohs(sa_port) != port) {
++    return ARES_FALSE;
++  }
++
++  return ARES_TRUE;
++}
++
+ ares_conn_err_t ares_socket_write(ares_channel_t *channel, ares_socket_t fd,
+                                   const void *data, size_t len, size_t *written,
+                                   const struct sockaddr *sa,
+diff --git a/src/lib/ares_socket.h b/src/lib/ares_socket.h
+index 24a99ab331..f7128e3493 100644
+--- a/src/lib/ares_socket.h
++++ b/src/lib/ares_socket.h
+@@ -139,8 +139,29 @@ typedef enum {
+   ARES_CONN_ERR_FAILURE      = 99  /*!< Generic failure */
+ } ares_conn_err_t;
+ 
++/*! Compare the IP address of a socket address with an ares_addr.  The port
++ *  in the socket address is ignored.
++ *
++ *  \param[in] sa  Socket address (AF_INET or AF_INET6)
++ *  \param[in] aa  Address to compare against
++ *  \return ARES_TRUE if the address families and IP addresses are equal,
++ *          ARES_FALSE otherwise
++ */
+ ares_bool_t     ares_sockaddr_addr_eq(const struct sockaddr  *sa,
+                                       const struct ares_addr *aa);
++
++/*! Compare the IP address and port of a socket address with an ares_addr and
++ *  port.
++ *
++ *  \param[in] sa    Socket address (AF_INET or AF_INET6)
++ *  \param[in] aa    Address to compare against
++ *  \param[in] port  Port to compare against, in host byte order
++ *  \return ARES_TRUE if the address families, IP addresses and ports are
++ *          equal, ARES_FALSE otherwise
++ */
++ares_bool_t     ares_sockaddr_addr_port_eq(const struct sockaddr  *sa,
++                                           const struct ares_addr *aa,
++                                           unsigned short          port);
+ ares_status_t   ares_socket_configure(ares_channel_t *channel, int family,
+                                       ares_bool_t is_tcp, ares_socket_t fd);
+ ares_conn_err_t ares_socket_enable_tfo(const ares_channel_t *channel,
+diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc
+index d233f9070f..058dc93001 100644
+--- a/test/ares-test-mock.cc
++++ b/test/ares-test-mock.cc
+@@ -3363,6 +3363,7 @@ struct FakeSockData {
+   unsigned char      query[512];
+   size_t             query_len;
+   struct sockaddr_in peer;
++  unsigned short     recv_port; /* network order; 0 reports the peer's port */
+   size_t             recv_calls;
+   size_t             bad_fd_calls;
+   size_t             sock_state_bad;
+@@ -3471,6 +3472,9 @@ static ares_ssize_t FakeSockRecvfrom(ares_socket_t sock, void *buffer,
+   if (address != NULL && address_len != NULL &&
+       *address_len >= (ares_socklen_t)sizeof(d->peer)) {
+     memcpy(address, &d->peer, sizeof(d->peer));
++    if (d->recv_port != 0) {
++      reinterpret_cast<struct sockaddr_in *>(address)->sin_port = d->recv_port;
++    }
+     *address_len = sizeof(d->peer);
+   }
+   return static_cast<ares_ssize_t>(d->query_len);
+@@ -3710,6 +3714,42 @@ TEST_F(LibraryTest, ReconfigureInRecvDropsBufferedAnswer) {
+   ares_destroy(chan);
+ }
+ 
++// Socket functions need not filter on connect(), so ares_conn_read() checks
++// a UDP datagram's source itself.  An answer reported from the server's
++// address but another port (here 127.0.0.1:53 for a server at
++// 127.0.0.1:53055) must be dropped, so that one server cannot answer for
++// another on the same address.  The same answer from the right port is then
++// accepted.
++TEST_F(LibraryTest, UDPAnswerFromWrongPortDropped) {
++  ares_channel_t *chan = nullptr;
++  FakeSockData    data;
++
++  memset(&data, 0, sizeof(data));
++  FakeSockInit(&chan, &data, 0, ARES_SOCKFUNC_FLAG_NONBLOCKING);
++
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    FakeSockQueryCallback, &data, NULL);
++  ASSERT_NE((size_t)0, data.query_len);
++  ASSERT_EQ(htons(53055), data.peer.sin_port);
++
++  data.recv_port   = htons(53);
++  data.recv_answer = true;
++  ares_process_fd(chan, 100, ARES_SOCKET_BAD);
++  EXPECT_FALSE(data.recv_answer);
++  EXPECT_FALSE(data.done);
++  EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));
++
++  data.recv_port   = 0;
++  data.recv_answer = true;
++  ares_process_fd(chan, 100, ARES_SOCKET_BAD);
++  EXPECT_FALSE(data.recv_answer);
++  EXPECT_TRUE(data.done);
++  // The fake answer carries no records.
++  EXPECT_EQ(ARES_ENODATA, data.status);
++  EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));
++  ares_destroy(chan);
++}
++
+ // The close function is application code too.  With no socket-state callback
+ // to carry the descriptor, it runs inline while ares_check_cleanup_conns()
+ // walks the server list and each server's connections, closing idle ones.
+@@ -5530,5 +5570,183 @@ INSTANTIATE_TEST_SUITE_P(TransportModes, ServerRecoveryMultiMockTest, ::testing:
+ 
+ INSTANTIATE_TEST_SUITE_P(TransportModes, ServerRecoveryNoProbeMultiMockTest, ::testing::ValuesIn(ares::test::families_modes), PrintFamilyMode);
+ 
++// An answer is only accepted on the connection its query was sent on
++// (RFC 5452 section 9.1).  Two servers: #0 is demoted by a SERVFAIL so a later
++// query goes only to #1, while #0's connection stays open (STAYOPEN).  Server
++// #0 then answers that query on its own connection.  The answer must be
++// dropped without side effects, and the query must then complete normally.
++class ReplyConnMultiMockTest
++  : public MockChannelOptsTest,
++    public ::testing::WithParamInterface< std::pair<int, bool> > {
++ public:
++  ReplyConnMultiMockTest()
++    : MockChannelOptsTest(2, GetParam().first, GetParam().second, false,
++                          FillOptions(&opts_),
++                          ARES_OPT_FLAGS | ARES_OPT_TRIES |
++                          ARES_OPT_SERVER_FAILOVER | ARES_OPT_NOROTATE) {}
++
++  static struct ares_options* FillOptions(struct ares_options *opts) {
++    memset(opts, 0, sizeof(struct ares_options));
++    /* Keep the demoted server's connection open; no DNS 0x20 so the replies
++     * built here match the question exactly */
++    opts->flags = ARES_FLAG_STAYOPEN | ARES_FLAG_EDNS;
++    /* One try per server: the query goes to #1, then on timeout to #0 */
++    opts->tries = 1;
++    /* Never probe the demoted server, so the query is sent only to #1 */
++    opts->server_failover_opts.retry_chance = 0;
++    opts->server_failover_opts.retry_delay  = 10000;
++    return opts;
++  }
++ private:
++  struct ares_options opts_;
++};
++
++static std::string ReplyConnFirstA(const QueryResult &result)
++{
++  const ares_dns_rr_t *rr;
++  char                 addr[64];
++
++  if (result.dnsrec_.dnsrec_ == nullptr ||
++      ares_dns_record_rr_cnt(result.dnsrec_.dnsrec_, ARES_SECTION_ANSWER) == 0) {
++    return "";
++  }
++  rr = ares_dns_record_rr_get_const(result.dnsrec_.dnsrec_,
++                                    ARES_SECTION_ANSWER, 0);
++  if (ares_dns_rr_get_type(rr) != ARES_REC_TYPE_A ||
++      ares_inet_ntop(AF_INET, ares_dns_rr_get_addr(rr, ARES_RR_A_ADDR), addr,
++                     sizeof(addr)) == nullptr) {
++    return "";
++  }
++  return addr;
++}
++
++TEST_P(ReplyConnMultiMockTest, AnswerOnOtherServerConnectionDropped) {
++  DNSPacket warm_servfail;
++  warm_servfail.set_response().set_aa().set_rcode(SERVFAIL)
++    .add_question(new DNSQuestion("warmup.example", T_A));
++  DNSPacket warm_ok;
++  warm_ok.set_response().set_aa()
++    .add_question(new DNSQuestion("warmup.example", T_A))
++    .add_answer(new DNSARR("warmup.example", 100, {1, 1, 1, 1}));
++  DNSPacket forged;
++  forged.set_response().set_aa()
++    .add_question(new DNSQuestion("victim.example", T_A))
++    .add_answer(new DNSARR("victim.example", 100, {6, 6, 6, 6}));
++  DNSPacket genuine;
++  genuine.set_response().set_aa()
++    .add_question(new DNSQuestion("victim.example", T_A))
++    .add_answer(new DNSARR("victim.example", 100, {1, 2, 3, 4}));
++  unsigned short qid = 0;
++
++  /* Demote #0, leaving a connection to it open */
++  EXPECT_CALL(*servers_[0], OnRequest("warmup.example", T_A))
++    .WillOnce(SetReply(servers_[0].get(), &warm_servfail));
++  EXPECT_CALL(*servers_[1], OnRequest("warmup.example", T_A))
++    .WillOnce(SetReply(servers_[1].get(), &warm_ok));
++  QueryResult warm;
++  ares_query_dnsrec(channel_, "warmup.example", ARES_CLASS_IN,
++                    ARES_REC_TYPE_A, QueryCallback, &warm, NULL);
++  Process();
++  ASSERT_TRUE(warm.done_);
++  ASSERT_EQ(ARES_SUCCESS, warm.status_);
++
++  /* The query goes only to #1, which does not answer.  Meanwhile #0 answers
++   * it on #0's own connection.  That answer must be dropped, so the query
++   * times out on #1 and is retried on #0, whose genuine answer is accepted on
++   * the same (still in sync, for TCP) connection. */
++  EXPECT_CALL(*servers_[1], OnRequest("victim.example", T_A))
++    .WillOnce(InvokeWithoutArgs([&]() {
++      servers_[0]->SendUnsolicited(&forged, qid);
++      servers_[1]->SetReplyData(std::vector<byte>());
++    }));
++  EXPECT_CALL(*servers_[0], OnRequest("victim.example", T_A))
++    .WillOnce(SetReply(servers_[0].get(), &genuine));
++  QueryResult result;
++  ares_query_dnsrec(channel_, "victim.example", ARES_CLASS_IN,
++                    ARES_REC_TYPE_A, QueryCallback, &result, &qid);
++  Process();
++  ASSERT_TRUE(result.done_);
++  EXPECT_EQ(ARES_SUCCESS, result.status_);
++  EXPECT_EQ("1.2.3.4", ReplyConnFirstA(result));
++  EXPECT_EQ(1, (int)result.timeouts_);
++}
++
++// DNS cookies (RFC 7873) are per-server state, validated against the server
++// the query was sent to.  #1 supports cookies, #0 does not.  A cookie-less
++// answer arriving on #0's connection for a query sent only to #1 must not be
++// accepted: it would otherwise be checked against #0's cookie state and pass.
++class ReplyConnCookieMultiMockTest
++  : public MockChannelOptsTest,
++    public ::testing::WithParamInterface<int> {
++ public:
++  ReplyConnCookieMultiMockTest()
++    : MockChannelOptsTest(2, GetParam(), false, false,
++                          ReplyConnMultiMockTest::FillOptions(&opts_),
++                          ARES_OPT_FLAGS | ARES_OPT_TRIES |
++                          ARES_OPT_SERVER_FAILOVER | ARES_OPT_NOROTATE) {}
++ private:
++  struct ares_options opts_;
++};
++
++TEST_P(ReplyConnCookieMultiMockTest, CookielessAnswerOnOtherServerDropped) {
++  std::vector<byte> server_cookie = { 1, 2, 3, 4, 5, 6, 7, 8 };
++  DNSPacket warm_servfail;
++  warm_servfail.set_response().set_aa().set_rcode(SERVFAIL)
++    .add_question(new DNSQuestion("warmup.example", T_A));
++  DNSPacket warm_ok;
++  warm_ok.set_response().set_aa()
++    .add_question(new DNSQuestion("warmup.example", T_A))
++    .add_answer(new DNSARR("warmup.example", 100, {1, 1, 1, 1}))
++    .add_additional(new DNSOptRR(0, 0, 0, 1280, { }, server_cookie, false));
++  DNSPacket forged;
++  forged.set_response().set_aa()
++    .add_question(new DNSQuestion("victim.example", T_A))
++    .add_answer(new DNSARR("victim.example", 100, {6, 6, 6, 6}));
++  DNSPacket genuine;
++  genuine.set_response().set_aa()
++    .add_question(new DNSQuestion("victim.example", T_A))
++    .add_answer(new DNSARR("victim.example", 100, {1, 2, 3, 4}));
++  unsigned short qid = 0;
++
++  /* #0 answers without a cookie (and is demoted); #1 answers with one, so
++   * #1's cookie state becomes SUPPORTED */
++  EXPECT_CALL(*servers_[0], OnRequest("warmup.example", T_A))
++    .WillOnce(SetReply(servers_[0].get(), &warm_servfail));
++  EXPECT_CALL(*servers_[1], OnRequest("warmup.example", T_A))
++    .WillOnce(SetReply(servers_[1].get(), &warm_ok));
++  QueryResult warm;
++  ares_query_dnsrec(channel_, "warmup.example", ARES_CLASS_IN,
++                    ARES_REC_TYPE_A, QueryCallback, &warm, NULL);
++  Process();
++  ASSERT_TRUE(warm.done_);
++  ASSERT_EQ(ARES_SUCCESS, warm.status_);
++  size_t cookie_len = 0;
++  fetch_server_cookie(warm.dnsrec_.dnsrec_, &cookie_len);
++  ASSERT_EQ(server_cookie.size(), cookie_len);
++
++  /* The cookie-protected query goes only to #1; a cookie-less answer for it
++   * arrives on #0's connection and must be dropped.  The retry to #0 is then
++   * legitimately answered by #0, which does not use cookies. */
++  EXPECT_CALL(*servers_[1], OnRequest("victim.example", T_A))
++    .WillOnce(InvokeWithoutArgs([&]() {
++      servers_[0]->SendUnsolicited(&forged, qid);
++      servers_[1]->SetReplyData(std::vector<byte>());
++    }));
++  EXPECT_CALL(*servers_[0], OnRequest("victim.example", T_A))
++    .WillOnce(SetReply(servers_[0].get(), &genuine));
++  QueryResult result;
++  ares_query_dnsrec(channel_, "victim.example", ARES_CLASS_IN,
++                    ARES_REC_TYPE_A, QueryCallback, &result, &qid);
++  Process();
++  ASSERT_TRUE(result.done_);
++  EXPECT_EQ(ARES_SUCCESS, result.status_);
++  EXPECT_EQ("1.2.3.4", ReplyConnFirstA(result));
++  EXPECT_EQ(1, (int)result.timeouts_);
++}
++
++INSTANTIATE_TEST_SUITE_P(TransportModes, ReplyConnMultiMockTest, ::testing::ValuesIn(ares::test::families_modes), PrintFamilyMode);
++
++INSTANTIATE_TEST_SUITE_P(AddressFamilies, ReplyConnCookieMultiMockTest, ::testing::ValuesIn(ares::test::families), PrintFamily);
++
+ }  // namespace test
+ }  // namespace ares
+diff --git a/test/ares-test.cc b/test/ares-test.cc
+index d333ee9419..0b3ac12c09 100644
+--- a/test/ares-test.cc
++++ b/test/ares-test.cc
+@@ -448,6 +448,9 @@ MockServer::MockServer(int family, unsigned short port)
+   // Create a TCP socket to receive data on.
+   tcp_data_ = NULL;
+   tcp_data_len_ = 0;
++  last_fd_ = ARES_SOCKET_BAD;
++  memset(&last_addr_, 0, sizeof(last_addr_));
++  last_addrlen_ = 0;
+   tcpfd_ = socket(family, SOCK_STREAM, 0);
+   EXPECT_NE(ARES_SOCKET_BAD, tcpfd_);
+   int optval = 1;
+@@ -710,6 +713,50 @@ std::set<ares_socket_t> MockServer::fds() const {
+   return result;
+ }
+ 
++void MockServer::SendData(ares_socket_t fd, struct sockaddr_storage *addr,
++                          ares_socklen_t addrlen, int qid,
++                          std::vector<byte> reply) {
++  int flags = 0;
++
++  if (reply.size() >=  2) {
++    // Overwrite the query ID if space to do so.
++    reply[0] = (byte)((qid >> 8) & 0xff);
++    reply[1] = (byte)(qid & 0xff);
++  }
++  if (verbose) {
++    std::cerr << "sending reply " << PacketToString(reply)
++              << " on port " << ((fd == udpfd_) ? udpport_ : tcpport_)
++              << ":" << getaddrport(addr) << std::endl;
++  }
++
++  // Prefix with 2-byte length if TCP.
++  if (fd != udpfd_) {
++    int len = (int)reply.size();
++    std::vector<byte> vlen = {(byte)((len & 0xFF00) >> 8), (byte)(len & 0xFF)};
++    reply.insert(reply.begin(), vlen.begin(), vlen.end());
++    // Also, don't bother with the destination address.
++    addr = nullptr;
++    addrlen = 0;
++  }
++
++#ifdef MSG_NOSIGNAL
++  flags |= MSG_NOSIGNAL;
++#endif
++
++  ares_ssize_t rc = (ares_ssize_t)sendto(fd, BYTE_CAST reply.data(), (SEND_TYPE_ARG3)reply.size(), flags,
++                                         (struct sockaddr *)addr, addrlen);
++  if (rc < static_cast<ares_ssize_t>(reply.size())) {
++    std::cerr << "Failed to send full reply, rc=" << rc << std::endl;
++  }
++}
++
++void MockServer::SendUnsolicited(const DNSPacket *reply, unsigned short qid) {
++  ASSERT_NE(ARES_SOCKET_BAD, last_fd_);
++  ASSERT_TRUE(last_fd_ == udpfd_ || connfds_.count(last_fd_) != 0)
++    << "the most recent requester's connection has closed";
++  SendData(last_fd_, &last_addr_, last_addrlen_, qid, reply->data());
++}
++
+ void MockServer::ProcessRequest(ares_socket_t fd, struct sockaddr_storage* addr,
+                                 ares_socklen_t addrlen, const std::vector<byte> &req,
+                                 const std::string &reqstr,
+@@ -717,10 +764,14 @@ void MockServer::ProcessRequest(ares_socket_t fd, struct sockaddr_storage* addr,
+ 
+   /* DNS 0x20 will mix case, do case-insensitive matching of name in request */
+   char lower_name[256];
+-  int flags = 0;
+ 
+   arestest_strtolower(lower_name, name, sizeof(lower_name));
+ 
++  // Remember the requester so SendUnsolicited() can reach it.
++  last_fd_ = fd;
++  memcpy(&last_addr_, addr, sizeof(last_addr_));
++  last_addrlen_ = addrlen;
++
+   // Before processing, let gMock know the request is happening.
+   OnRequest(lower_name, rrtype);
+ 
+@@ -747,43 +798,12 @@ void MockServer::ProcessRequest(ares_socket_t fd, struct sockaddr_storage* addr,
+     return;
+   }
+ 
+-  // Make a local copy of the current pending reply.
+-  std::vector<byte> reply = exact_reply_;
+-
+   if (qid_ >= 0) {
+     // Use the explicitly specified query ID.
+     qid = qid_;
+   }
+-  if (reply.size() >=  2) {
+-    // Overwrite the query ID if space to do so.
+-    reply[0] = (byte)((qid >> 8) & 0xff);
+-    reply[1] = (byte)(qid & 0xff);
+-  }
+-  if (verbose) {
+-    std::cerr << "sending reply " << PacketToString(reply)
+-              << " on port " << ((fd == udpfd_) ? udpport_ : tcpport_)
+-              << ":" << getaddrport(addr) << std::endl;
+-  }
+-
+-  // Prefix with 2-byte length if TCP.
+-  if (fd != udpfd_) {
+-    int len = (int)reply.size();
+-    std::vector<byte> vlen = {(byte)((len & 0xFF00) >> 8), (byte)(len & 0xFF)};
+-    reply.insert(reply.begin(), vlen.begin(), vlen.end());
+-    // Also, don't bother with the destination address.
+-    addr = nullptr;
+-    addrlen = 0;
+-  }
+ 
+-#ifdef MSG_NOSIGNAL
+-  flags |= MSG_NOSIGNAL;
+-#endif
+-
+-  ares_ssize_t rc = (ares_ssize_t)sendto(fd, BYTE_CAST reply.data(), (SEND_TYPE_ARG3)reply.size(), flags,
+-                                         (struct sockaddr *)addr, addrlen);
+-  if (rc < static_cast<ares_ssize_t>(reply.size())) {
+-    std::cerr << "Failed to send full reply, rc=" << rc << std::endl;
+-  }
++  SendData(fd, addr, addrlen, qid, exact_reply_);
+ 
+   if (disconnect_after_reply_ && fd != udpfd_) {
+     disconnect_after_reply_ = false;
+diff --git a/test/ares-test.h b/test/ares-test.h
+index 2b973c3982..170c284f26 100644
+--- a/test/ares-test.h
++++ b/test/ares-test.h
+@@ -303,6 +303,12 @@ class MockServer {
+     disconnect_after_reply_ = true;
+   }
+ 
++  // Send reply, with the given query ID, to the client of the most recent
++  // request this server received, on the socket that request arrived on.  The
++  // client did not send this server a request with that query ID: this models
++  // a server answering a query that was only sent to some other server.
++  void SendUnsolicited(const DNSPacket *reply, unsigned short qid);
++
+   // The set of file descriptors that the server handles.
+   std::set<ares_socket_t> fds() const;
+ 
+@@ -327,6 +333,8 @@ class MockServer {
+                                 int rrtype);
+   void           ProcessPacket(ares_socket_t fd, struct sockaddr_storage *addr,
+                                ares_socklen_t addrlen, byte *data, int len);
++  void SendData(ares_socket_t fd, struct sockaddr_storage *addr,
++                ares_socklen_t addrlen, int qid, std::vector<byte> reply);
+   unsigned short udpport_;
+   unsigned short tcpport_;
+   ares_socket_t  udpfd_;
+@@ -339,6 +347,10 @@ class MockServer {
+   bool                    disconnect_after_reply_;
+   unsigned char          *tcp_data_;
+   size_t                  tcp_data_len_;
++  // Where the most recent request came from, for SendUnsolicited().
++  ares_socket_t           last_fd_;
++  struct sockaddr_storage last_addr_;
++  ares_socklen_t          last_addrlen_;
+ };
+ 
+ // Test fixture that uses a mock DNS server.
diff --git a/meta-oe/recipes-support/c-ares/c-ares/0006-ares_save_options-read-channel-config-under-lock.patch b/meta-oe/recipes-support/c-ares/c-ares/0006-ares_save_options-read-channel-config-under-lock.patch
new file mode 100644
index 0000000000..76c072dd7e
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0006-ares_save_options-read-channel-config-under-lock.patch
@@ -0,0 +1,243 @@
+From 25a6911370878d4b617b44b142ea0e49d1ccede6 Mon Sep 17 00:00:00 2001
+From: Brad House <brad@brad-house.com>
+Date: Mon, 19 Oct 2026 11:53:59 -0400
+Subject: [PATCH] [Backport v1.34] ares_save_options: read channel
+ configuration under the channel lock (#1362)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Backport of 5d878a580a8b57b51d15e2725cf6775c8e7bca0e to `v1.34`. See
+that commit for the full description.
+
+**Conflicts:** none; cherry-picked cleanly.
+
+**Tests (local, macOS, Debug, Ninja):**
+- ASAN+UBSAN and `-DCARES_WERROR=ON` builds: `arestest -4
+--gtest_filter='-*Live*'` — 691/691 passed in both.
+- With the `src/` changes reverted, the new `DupConcurrentSetServers` /
+`SaveOptionsConcurrentSetServers` tests abort with an ASAN
+heap-buffer-overflow; they pass with them.
+- `git clang-format --diff upstream/v1.34` clean. Also tested together
+with the other two v1.34 backports (both orders apply cleanly): 699/699
+passed under ASAN+UBSAN and `-Werror`.
+
+Signed-off-by: Brad House <brad@brad-house.com>
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/25a6911370878d4b617b44b142ea0e49d1ccede6]
+GHSA: GHSA-ph6c-3cvx-mq6v
+---
+ src/lib/ares_init.c    |  3 +-
+ src/lib/ares_options.c | 45 ++++++++++++++++++----
+ test/ares-test-init.cc | 87 ++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 126 insertions(+), 9 deletions(-)
+
+diff --git a/src/lib/ares_init.c b/src/lib/ares_init.c
+index 4758c5de56..85b2e13050 100644
+--- a/src/lib/ares_init.c
++++ b/src/lib/ares_init.c
+@@ -483,7 +483,8 @@ int ares_dup(ares_channel_t **dest, const ares_channel_t *src)
+   *dest = NULL; /* in case of failure return NULL explicitly */
+ 
+   /* First get the options supported by the old ares_save_options() function,
+-     which is most of them */
++   * which is most of them.  ares_save_options() takes the src channel lock
++   * itself.  No lock is held across ares_init_options(). */
+   rc = (ares_status_t)ares_save_options(src, &opts, &optmask);
+   if (rc != ARES_SUCCESS) {
+     ares_destroy_options(&opts);
+diff --git a/src/lib/ares_options.c b/src/lib/ares_options.c
+index 2b5624bbea..5ea35b732e 100644
+--- a/src/lib/ares_options.c
++++ b/src/lib/ares_options.c
+@@ -55,8 +55,8 @@ static struct in_addr *ares_save_opt_servers(const ares_channel_t *channel,
+                                              int                  *nservers)
+ {
+   ares_slist_node_t *snode;
+-  struct in_addr    *out =
+-    ares_malloc_zero(ares_slist_len(channel->servers) * sizeof(*out));
++  size_t             cnt = ares_slist_len(channel->servers);
++  struct in_addr    *out = ares_malloc_zero_array(cnt, sizeof(*out));
+ 
+   *nservers = 0;
+ 
+@@ -64,7 +64,11 @@ static struct in_addr *ares_save_opt_servers(const ares_channel_t *channel,
+     return NULL;
+   }
+ 
+-  for (snode = ares_slist_node_first(channel->servers); snode != NULL;
++  /* Never write more entries than were allocated.  The caller holds the
++   * channel lock so the server list cannot change underneath us; this is
++   * purely defensive. */
++  for (snode = ares_slist_node_first(channel->servers);
++       snode != NULL && (size_t)*nservers < cnt;
+        snode = ares_slist_node_next(snode)) {
+     const ares_server_t *server = ares_slist_node_val(snode);
+ 
+@@ -79,9 +83,11 @@ static struct in_addr *ares_save_opt_servers(const ares_channel_t *channel,
+   return out;
+ }
+ 
+-/* Save options from initialized channel */
+-int ares_save_options(const ares_channel_t *channel,
+-                      struct ares_options *options, int *optmask)
++/* Save options from initialized channel.  Caller must hold the channel lock
++ * (if channel is not NULL). */
++static ares_status_t ares_save_options_nolock(const ares_channel_t *channel,
++                                              struct ares_options  *options,
++                                              int                  *optmask)
+ {
+   size_t i;
+ 
+@@ -150,7 +156,8 @@ int ares_save_options(const ares_channel_t *channel,
+   if (channel->optmask & ARES_OPT_DOMAINS) {
+     options->domains = NULL;
+     if (channel->ndomains) {
+-      options->domains = ares_malloc(channel->ndomains * sizeof(char *));
++      options->domains =
++        ares_malloc_zero_array(channel->ndomains, sizeof(char *));
+       if (!options->domains) {
+         return ARES_ENOMEM;
+       }
+@@ -176,7 +183,8 @@ int ares_save_options(const ares_channel_t *channel,
+   if (channel->optmask & ARES_OPT_SORTLIST) {
+     options->sortlist = NULL;
+     if (channel->nsort) {
+-      options->sortlist = ares_malloc(channel->nsort * sizeof(struct apattern));
++      options->sortlist =
++        ares_malloc_zero_array(channel->nsort, sizeof(*options->sortlist));
+       if (!options->sortlist) {
+         return ARES_ENOMEM;
+       }
+@@ -238,6 +246,27 @@ int ares_save_options(const ares_channel_t *channel,
+   return ARES_SUCCESS;
+ }
+ 
++int ares_save_options(const ares_channel_t *channel,
++                      struct ares_options *options, int *optmask)
++{
++  ares_status_t status;
++
++  if (channel == NULL) {
++    /* Preserve historic behavior: initialize the pointers so
++     * ares_destroy_options() is safe, then return ARES_ENODATA */
++    return (int)ares_save_options_nolock(NULL, options, optmask);
++  }
++
++  /* The configuration may be modified concurrently by other threads (e.g.
++   * ares_set_servers_csv()), so it must only be read with the channel lock
++   * held. */
++  ares_channel_lock(channel);
++  status = ares_save_options_nolock(channel, options, optmask);
++  ares_channel_unlock(channel);
++
++  return (int)status;
++}
++
+ static ares_status_t ares_init_options_servers(ares_channel_t       *channel,
+                                                const struct in_addr *servers,
+                                                size_t                nservers)
+diff --git a/test/ares-test-init.cc b/test/ares-test-init.cc
+index b44211a1e4..1c5d0f2171 100644
+--- a/test/ares-test-init.cc
++++ b/test/ares-test-init.cc
+@@ -25,6 +25,8 @@
+  */
+ #include "ares-test.h"
+ 
++#include <atomic>
++
+ extern "C" {
+   #include "ares_private.h"
+ }
+@@ -295,6 +297,91 @@ TEST_F(LibraryTest, FailChannelInit) {
+   ares_library_cleanup();
+ }
+ 
++// CARES_THREADS implies ares_threadsafety() is true
++#ifdef CARES_THREADS
++// Build a CSV list of n distinct IPv4 servers.
++static std::string ConfigRaceServerCsv(size_t n)
++{
++  std::string csv;
++  for (size_t i = 0; i < n; i++) {
++    if (i != 0) {
++      csv += ",";
++    }
++    csv += "127.0." + std::to_string((i / 250) + 1) + "." +
++           std::to_string((i % 250) + 1) + ":5353";
++  }
++  return csv;
++}
++
++// Readers snapshot the channel configuration (via ares_dup() or
++// ares_save_options()) while a writer thread keeps swapping the server list
++// between a short and a long one.  The configuration must only be read under
++// the channel lock; otherwise the saved server array is sized from one list
++// and filled from another (heap-buffer-overflow under ASAN).
++static void ConfigRaceRun(bool use_dup, size_t reader_loops)
++{
++  const size_t        nreaders  = 4;
++  const std::string   small_csv = ConfigRaceServerCsv(4);
++  const std::string   large_csv = ConfigRaceServerCsv(400);
++  ares_channel_t     *channel   = nullptr;
++  std::atomic<size_t> readers_done(0);
++
++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&channel, nullptr, 0));
++  ASSERT_NE(nullptr, channel);
++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel, small_csv.c_str()));
++
++  // Writer runs until every reader finished; readers are bounded so the
++  // whole test is bounded.
++  std::thread              writer([&]() {
++    size_t i = 0;
++    while (readers_done.load() < nreaders) {
++      ares_set_servers_csv(channel,
++                           (i++ & 1) ? large_csv.c_str() : small_csv.c_str());
++    }
++  });
++
++  std::vector<std::thread> readers;
++  for (size_t r = 0; r < nreaders; r++) {
++    readers.emplace_back([&]() {
++      for (size_t i = 0; i < reader_loops; i++) {
++        if (use_dup) {
++          ares_channel_t *dup = nullptr;
++          EXPECT_EQ(ARES_SUCCESS, ares_dup(&dup, channel));
++          if (dup != nullptr) {
++            ares_destroy(dup);
++          }
++        } else {
++          struct ares_options opts;
++          int                 optmask = 0;
++          memset(&opts, 0, sizeof(opts));
++          EXPECT_EQ(ARES_SUCCESS, ares_save_options(channel, &opts, &optmask));
++          EXPECT_NE(0, optmask & ARES_OPT_SERVERS);
++          EXPECT_TRUE(opts.nservers == 4 || opts.nservers == 400);
++          ares_destroy_options(&opts);
++        }
++      }
++      readers_done++;
++    });
++  }
++
++  for (auto &t : readers) {
++    t.join();
++  }
++  writer.join();
++  ares_destroy(channel);
++}
++
++TEST_F(LibraryTest, DupConcurrentSetServers)
++{
++  ConfigRaceRun(true, 20);
++}
++
++TEST_F(LibraryTest, SaveOptionsConcurrentSetServers)
++{
++  ConfigRaceRun(false, 20000);
++}
++#endif
++
+ #ifndef WIN32
+ TEST_F(LibraryTest, EnvInit) {
+   ares_channel_t *channel = nullptr;
diff --git a/meta-oe/recipes-support/c-ares/c-ares/0007-ares_inet_pton-reject-a-prefix-length.patch b/meta-oe/recipes-support/c-ares/c-ares/0007-ares_inet_pton-reject-a-prefix-length.patch
new file mode 100644
index 0000000000..2cd1ea8c24
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0007-ares_inet_pton-reject-a-prefix-length.patch
@@ -0,0 +1,364 @@
+From 7e65b381c0b915aa5671ddc713080c87e15fc42f Mon Sep 17 00:00:00 2001
+From: Brad House <brad@brad-house.com>
+Date: Mon, 19 Oct 2026 12:24:52 -0400
+Subject: [PATCH] [Backport v1.34] ares_inet_pton: reject a prefix length,
+ always write the full address (#1363)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Backport of 7b4ef8e555b611be6af39d913aa280cd1a348102 to `v1.34`. See
+that commit for the full description.
+
+**Conflicts:** `test/ares-test-mock-ai.cc` only — the neighbouring
+`FamilyV6IgnoresARecords` test (added on main by an unrelated change)
+does not exist on v1.34. Resolved by adding only the new
+`NumericHostRejectsPrefixLength` test at the same position. Other files
+applied unchanged.
+
+**Also includes** the comment spelling fix from #1364
+(ead5557d1301328536c3920bd01759a1bff5ca9a): "unparseable" ->
+"unparsable" in `src/lib/inet_net_pton.c` and
+`test/ares-test-internal.cc`, so Codespell passes and the text matches
+main.
+
+**Tests (local, macOS, Debug, Ninja):**
+- ASAN+UBSAN and `-DCARES_WERROR=ON` builds: `arestest -4
+--gtest_filter='-*Live*'` — 693/693 passed in both.
+- With the `src/` changes reverted, the 4 new test instances fail
+(`InetNetPtoNPrefixZeroFills`, `InetPtoNRejectsPrefixLength`,
+`NumericHostRejectsPrefixLength` UDP/TCP); they pass with them.
+- `git clang-format --diff upstream/v1.34` clean. Also tested together
+with the other two v1.34 backports (both orders apply cleanly): 699/699
+passed under ASAN+UBSAN and `-Werror`.
+
+Signed-off-by: Brad House <brad@brad-house.com>
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/7e65b381c0b915aa5671ddc713080c87e15fc42f]
+GHSA: GHSA-cfcv-8v2j-qj6r
+---
+ docs/ares_inet_pton.3        | 18 ++++++++--
+ src/lib/ares_inet_net_pton.h | 28 ++++++++++++++++
+ src/lib/inet_net_pton.c      | 65 ++++++++++++++++++++----------------
+ test/ares-test-internal.cc   | 54 ++++++++++++++++++++++++++++++
+ test/ares-test-mock-ai.cc    | 23 +++++++++++++
+ 5 files changed, 157 insertions(+), 31 deletions(-)
+
+diff --git a/docs/ares_inet_pton.3 b/docs/ares_inet_pton.3
+index 34b2df063c..19c5fdfda3 100644
+--- a/docs/ares_inet_pton.3
++++ b/docs/ares_inet_pton.3
+@@ -12,8 +12,9 @@ ares_inet_pton \- convert an IPv4 or IPv6 address from text to binary form
+ int ares_inet_pton(int \fIaf\fP, const char *\fIsrc\fP, void *\fIdst\fP);
+ .fi
+ .SH DESCRIPTION
+-This is a portable version with the identical functionality of the commonly
+-available \fIinet_pton\fP.
++This is a portable version of the commonly available \fIinet_pton\fP.  It
++behaves the same for AF_INET6, and for AF_INET it additionally accepts the
++legacy forms described below.
+ 
+ The ares_inet_pton() function converts the address in its standard text
+ presentation form into its numeric binary form. The \fBaf\fP argument shall
+@@ -23,9 +24,20 @@ in. The \fBdst\fP argument points to a buffer into which the function stores
+ the numeric address; this shall be large enough to hold the numeric address
+ (32 bits for AF_INET, 128 bits for AF_INET6).
+ 
++The \fBsrc\fP argument must be an address, not a network: a "/bits" prefix
++length suffix (CIDR notation) is not accepted and the function returns 0 for
++such input.  On success, the whole address (4 bytes for AF_INET, 16 bytes for
++AF_INET6) is always written to \fBdst\fP.  Versions of c-ares before 1.34.9
++accepted a prefix length here.
++
++Unlike POSIX \fIinet_pton\fP, AF_INET also accepts shortened forms such as
++"10.1" and hexadecimal forms such as "0x0a000001".  Octets that are not given
++are set to zero, so "10.1" is 10.1.0.0.
++
+ It returns 1 if the address was valid for the specified address family, or 0
+ if the address was not parseable in the specified address family, or -1 if
+-some system error occurred (in which case errno will have been set).
++the address family is not supported (in which case errno will have been set
++to EAFNOSUPPORT).
+ 
+ .SH SEE ALSO
+ .BR ares_init (3),
+diff --git a/src/lib/ares_inet_net_pton.h b/src/lib/ares_inet_net_pton.h
+index e3ed83a3cb..e1a6f2d71e 100644
+--- a/src/lib/ares_inet_net_pton.h
++++ b/src/lib/ares_inet_net_pton.h
+@@ -26,6 +26,34 @@
+ #ifndef HEADER_CARES_INET_NET_PTON_H
+ #define HEADER_CARES_INET_NET_PTON_H
+ 
++/*! Parse a network (an address with an optional "/bits" prefix length) from
++ *  its text form.  This is not an address parser: for an address use
++ *  ares_inet_pton(), which rejects a prefix length and always writes the
++ *  whole address.
++ *
++ *  How it differs from ares_inet_pton():
++ *   - A "/bits" prefix length is accepted (0-32 for IPv4, 0-128 for IPv6).
++ *   - The return value is the prefix length, not 1.  Without "/bits", IPv6
++ *     returns 128 and IPv4 infers it from the address class, widened to
++ *     cover every octet given ("10" is 8, "130.155" is 16, "1.2.3.4" is 32,
++ *     and a lone "224" is 4).  0 is a valid result ("::1/0").
++ *   - What is written to dst differs by family.  On success all size bytes
++ *     are zeroed first.  IPv4 then writes every octet given, including bits
++ *     beyond the prefix ("1.2.3.4/8" writes 1.2.3.4).  IPv6 writes only the
++ *     (bits+7)/8 bytes covering the prefix ("2001:db8::1/64" writes
++ *     2001:db8::).
++ *
++ *  \param[in]  af    AF_INET or AF_INET6.
++ *  \param[in]  src   NUL-terminated network in text form.
++ *  \param[out] dst   Buffer to receive the network, in network byte order.
++ *  \param[in]  size  Size of dst in bytes.
++ *  \return Prefix length in bits on success.  -1 on failure, with SOCKERRNO
++ *          set to ENOENT if src is not a valid network, or EMSGSIZE if it
++ *          does not fit in size bytes or (IPv6) src is too long to be a
++ *          network.  On Windows these are the WSA equivalents.  An
++ *          unsupported af returns -1 without setting SOCKERRNO.  On failure
++ *          dst may be partially written.
++ */
+ int ares_inet_net_pton(int af, const char *src, void *dst, size_t size);
+ 
+ #endif /* HEADER_CARES_INET_NET_PTON_H */
+diff --git a/src/lib/inet_net_pton.c b/src/lib/inet_net_pton.c
+index e1f76ef834..f60823023b 100644
+--- a/src/lib/inet_net_pton.c
++++ b/src/lib/inet_net_pton.c
+@@ -51,14 +51,15 @@ const struct ares_in6_addr ares_in6addr_any = { { { 0, 0, 0, 0, 0, 0, 0, 0, 0,
+ 
+ /*
+  * static int
+- * inet_net_pton_ipv4(src, dst, size)
++ * inet_net_pton_ipv4(src, dst, size, allow_cidr)
+  *      convert IPv4 network number from presentation to network format.
+- *      accepts hex octets, hex strings, decimal octets, and /CIDR.
+- *      "size" is in bytes and describes "dst".
++ *      accepts hex octets, hex strings, decimal octets, and, if
++ *      "allow_cidr" is true, /CIDR.  "size" is in bytes and describes "dst".
+  * return:
+  *      number of bits, either imputed classfully or specified with /CIDR,
+  *      or -1 if some failure occurred (check errno).  ENOENT means it was
+- *      not an IPv4 network specification.
++ *      not an IPv4 network specification (including a /CIDR suffix when
++ *      "allow_cidr" is false).
+  * note:
+  *      network byte order assumed.  this means 192.5.5.240/28 has
+  *      0b11110000 in its fourth octet.
+@@ -71,7 +72,7 @@ const struct ares_in6_addr ares_in6addr_any = { { { 0, 0, 0, 0, 0, 0, 0, 0, 0,
+  *      Paul Vixie (ISC), June 1996
+  */
+ static int ares_inet_net_pton_ipv4(const char *src, unsigned char *dst,
+-                                   size_t size)
++                                   size_t size, ares_bool_t allow_cidr)
+ {
+   static const char    xdigits[] = "0123456789abcdef";
+   static const char    digits[]  = "0123456789";
+@@ -147,7 +148,8 @@ static int ares_inet_net_pton_ipv4(const char *src, unsigned char *dst,
+   }
+ 
+   bits = -1;
+-  if (ch == '/' && ares_isascii(src[0]) && ares_isdigit(src[0]) && dst > odst) {
++  if (allow_cidr && ch == '/' && ares_isascii(src[0]) && ares_isdigit(src[0]) &&
++      dst > odst) {
+     /* CIDR width specifier.  Nothing can follow it. */
+     ch   = *src++; /* Skip over the /. */
+     bits = 0;
+@@ -317,7 +319,7 @@ static int ares_inet_pton6(const char *src, unsigned char *dst)
+       continue;
+     }
+     if (ch == '.' && ((tp + NS_INADDRSZ) <= endp) &&
+-        ares_inet_net_pton_ipv4(curtok, tp, NS_INADDRSZ) > 0) {
++        ares_inet_net_pton_ipv4(curtok, tp, NS_INADDRSZ, ARES_FALSE) > 0) {
+       tp         += NS_INADDRSZ;
+       saw_xdigit  = 0;
+       break; /* '\0' was seen by inet_pton4(). */
+@@ -400,29 +402,23 @@ static int ares_inet_net_pton_ipv6(const char *src, unsigned char *dst,
+     SET_SOCKERRNO(EMSGSIZE);
+     return -1;
+   }
++  /* Only the first (bits+7)/8 bytes carry the network, zero the remainder of
++   * the caller's buffer so it never holds uninitialized data. */
++  memset(dst, 0, size);
+   memcpy(dst, &in6, bytes);
+   return (int)bits;
+ }
+ 
+-/*
+- * int
+- * inet_net_pton(af, src, dst, size)
+- *      convert network number from presentation to network format.
+- *      accepts hex octets, hex strings, decimal octets, and /CIDR.
+- *      "size" is in bytes and describes "dst".
+- * return:
+- *      number of bits, either imputed classfully or specified with /CIDR,
+- *      or -1 if some failure occurred (check errno).  ENOENT means it was
+- *      not a valid network specification.
++/* Parse a network, not an address.  See ares_inet_net_pton.h for the
++ * contract and how it differs from ares_inet_pton().
+  * author:
+  *      Paul Vixie (ISC), June 1996
+- *
+  */
+ int ares_inet_net_pton(int af, const char *src, void *dst, size_t size)
+ {
+   switch (af) {
+     case AF_INET:
+-      return ares_inet_net_pton_ipv4(src, dst, size);
++      return ares_inet_net_pton_ipv4(src, dst, size, ARES_TRUE);
+     case AF_INET6:
+       return ares_inet_net_pton_ipv6(src, dst, size);
+     default:
+@@ -430,22 +426,35 @@ int ares_inet_net_pton(int af, const char *src, void *dst, size_t size)
+   }
+ }
+ 
++/*
++ * int
++ * inet_pton(af, src, dst)
++ *      convert an address (not a network) from presentation to network
++ *      format, like POSIX inet_pton().  A "/bits" prefix length denotes a
++ *      prefix, not an address (RFC 4291 Section 2.3 vs. the address text
++ *      forms of Section 2.2), and is rejected; dst is always fully written
++ *      on success (4 bytes for AF_INET, 16 bytes for AF_INET6).
++ *      For a network with a prefix length, use ares_inet_net_pton().
++ * return:
++ *      1 on success, 0 if src is not a valid address for af (as POSIX
++ *      inet_pton() does for any unparsable input), or -1 with errno set to
++ *      EAFNOSUPPORT if af is not supported.
++ */
+ int ares_inet_pton(int af, const char *src, void *dst)
+ {
+-  int    result;
+-  size_t size;
++  int result;
+ 
+   if (af == AF_INET) {
+-    size = sizeof(struct in_addr);
++    result =
++      ares_inet_net_pton_ipv4(src, dst, sizeof(struct in_addr), ARES_FALSE);
+   } else if (af == AF_INET6) {
+-    size = sizeof(struct ares_in6_addr);
++    result = ares_inet_pton6(src, dst);
+   } else {
+     SET_SOCKERRNO(EAFNOSUPPORT);
+     return -1;
+   }
+-  result = ares_inet_net_pton(af, src, dst, size);
+-  if (result == -1 && SOCKERRNO == ENOENT) {
+-    return 0;
+-  }
+-  return (result > -1) ? 1 : -1;
++  /* Neither parser can fail for a system reason: any failure (ENOENT, or
++   * EMSGSIZE for too many IPv4 octets as in "1.2.3.4.5") means src is not a
++   * valid address. */
++  return (result > -1) ? 1 : 0;
+ }
+diff --git a/test/ares-test-internal.cc b/test/ares-test-internal.cc
+index bf06a74605..294e3f4555 100644
+--- a/test/ares-test-internal.cc
++++ b/test/ares-test-internal.cc
+@@ -274,6 +274,23 @@ TEST_F(LibraryTest, InetNetPtoN) {
+   EXPECT_EQ(-1, ares_inet_net_pton(AF_INET, "253", &a4, sizeof(a4) - 1));
+ }
+ 
++// An IPv6 network with a prefix length only carries (bits+7)/8 bytes; the
++// rest of the destination must be zeroed rather than left as it was.
++TEST_F(LibraryTest, InetNetPtoNPrefixZeroFills) {
++  unsigned char a6[16];
++
++  memset(a6, 0x41, sizeof(a6));
++  EXPECT_EQ(0, ares_inet_net_pton(AF_INET6, "::1/0", a6, sizeof(a6)));
++  EXPECT_EQ("0000:0000:0000:0000:0000:0000:0000:0000",
++            AddressToString(a6, 16));
++
++  memset(a6, 0x41, sizeof(a6));
++  EXPECT_EQ(64, ares_inet_net_pton(AF_INET6, "2001:db8:1:2:3:4:5:6/64", a6,
++                                   sizeof(a6)));
++  EXPECT_EQ("2001:0db8:0001:0002:0000:0000:0000:0000",
++            AddressToString(a6, 16));
++}
++
+ TEST_F(LibraryTest, FreeLongChain) {
+   struct ares_addr_node *data = nullptr;
+   for (int ii = 0; ii < 100000; ii++) {
+@@ -600,9 +617,46 @@ TEST_F(LibraryTest, InetPtoN) {
+   EXPECT_EQ(1, ares_inet_pton(AF_INET6, "12:34::ff", &a6));
+   EXPECT_EQ(1, ares_inet_pton(AF_INET6, "12:34::ffff:1.2.3.4", &a6));
+   EXPECT_EQ(0, ares_inet_pton(AF_INET, "xyzzy", &a4));
++  // Too many octets is unparsable input, not a system error.
++  EXPECT_EQ(0, ares_inet_pton(AF_INET, "1.2.3.4.5", &a4));
++  EXPECT_EQ(0, ares_inet_pton(AF_INET, "0x0102030405", &a4));
+   EXPECT_EQ(-1, ares_inet_pton(AF_INET+AF_INET6, "1.2.3.4", &a4));
+ }
+ 
++// ares_inet_pton() parses addresses, not networks: like inet_pton(3) it must
++// reject a "/bits" prefix length.  It used to accept one and, for IPv6, write
++// only (bits+7)/8 bytes of dst while still returning 1.
++TEST_F(LibraryTest, InetPtoNRejectsPrefixLength) {
++  const char *cases6[] = { "::1/0", "ffff::1/16", "2001:db8::1/64",
++                           "2001:db8::1/128", "::ffff:1.2.3.4/8",
++                           "::ffff:1.2.3.4/32" };
++  const char *cases4[] = { "1.2.3.4/8", "1.2.3.4/0", "1.2.3.4/32", "10/8",
++                           "0x0a000000/8" };
++  unsigned char a4[4];
++  unsigned char a6[16];
++  size_t        i;
++
++  for (i = 0; i < sizeof(cases6) / sizeof(*cases6); i++) {
++    EXPECT_EQ(0, ares_inet_pton(AF_INET6, cases6[i], a6)) << cases6[i];
++  }
++  for (i = 0; i < sizeof(cases4) / sizeof(*cases4); i++) {
++    EXPECT_EQ(0, ares_inet_pton(AF_INET, cases4[i], a4)) << cases4[i];
++  }
++
++  // Without a prefix length, the whole destination is written.
++  memset(a6, 0x41, sizeof(a6));
++  EXPECT_EQ(1, ares_inet_pton(AF_INET6, "ffff::1", a6));
++  EXPECT_EQ("ffff:0000:0000:0000:0000:0000:0000:0001",
++            AddressToString(a6, 16));
++  memset(a6, 0x41, sizeof(a6));
++  EXPECT_EQ(1, ares_inet_pton(AF_INET6, "::ffff:1.2.3.4", a6));
++  EXPECT_EQ("0000:0000:0000:0000:0000:ffff:0102:0304",
++            AddressToString(a6, 16));
++  memset(a4, 0x41, sizeof(a4));
++  EXPECT_EQ(1, ares_inet_pton(AF_INET, "1.2.3.4", a4));
++  EXPECT_EQ("1.2.3.4", AddressToString(a4, 4));
++}
++
+ TEST_F(LibraryTest, FreeCorruptData) {
+   // ares_free_data(p) expects that there is a type field and a marker
+   // field in the memory before p.  Feed it incorrect versions of each.
+diff --git a/test/ares-test-mock-ai.cc b/test/ares-test-mock-ai.cc
+index ae45c45527..43d0b89175 100644
+--- a/test/ares-test-mock-ai.cc
++++ b/test/ares-test-mock-ai.cc
+@@ -617,6 +617,29 @@ TEST_P(MockChannelTestAI, FamilyV6) {
+   EXPECT_THAT(result.ai_, IncludesV6Address("2121:0000:0000:0000:0000:0000:0000:0303"));
+ }
+ 
++// A numeric host with a "/bits" prefix length is a network, not an address.
++// It used to be accepted, returning uninitialized stack memory as the address.
++TEST_P(MockChannelTestAI, NumericHostRejectsPrefixLength) {
++  struct ares_addrinfo_hints hints = {0, 0, 0, 0};
++  hints.ai_family = AF_INET6;
++  hints.ai_flags  = ARES_AI_NUMERICHOST;
++
++  AddrInfoResult result;
++  ares_getaddrinfo(channel_, "::1/0", NULL, &hints, AddrInfoCallback, &result);
++  Process();
++  EXPECT_TRUE(result.done_);
++  EXPECT_NE(ARES_SUCCESS, result.status_);
++
++  AddrInfoResult result2;
++  ares_getaddrinfo(channel_, "::1", NULL, &hints, AddrInfoCallback, &result2);
++  Process();
++  EXPECT_TRUE(result2.done_);
++  EXPECT_EQ(ARES_SUCCESS, result2.status_);
++  EXPECT_THAT(result2.ai_, IncludesNumAddresses(1));
++  EXPECT_THAT(result2.ai_,
++              IncludesV6Address("0000:0000:0000:0000:0000:0000:0000:0001"));
++}
++
+ // Test case for Issue #662
+ TEST_P(MockChannelTestAI, PartialQueryCancel) {
+   std::vector<byte> nothing;
diff --git a/meta-oe/recipes-support/c-ares/c-ares/0008-ares_conn_read-dont-drop-UDP-answers-from-server-port.patch b/meta-oe/recipes-support/c-ares/c-ares/0008-ares_conn_read-dont-drop-UDP-answers-from-server-port.patch
new file mode 100644
index 0000000000..f4f182b995
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0008-ares_conn_read-dont-drop-UDP-answers-from-server-port.patch
@@ -0,0 +1,178 @@
+From c7fa9ebcb0c0086730c53bf03191c03f03706246 Mon Sep 17 00:00:00 2001
+From: "c-ares-backport-gha[bot]"
+ <299594594+c-ares-backport-gha[bot]@users.noreply.github.com>
+Date: Tue, 20 Oct 2026 02:25:59 +0000
+Subject: [PATCH] [Backport v1.34] ares_conn_read: don't drop UDP answers whose
+ source port isn't reported (#1371)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+# Description
+Backport of #1370 to `v1.34`.
+
+Signed-off-by: Brad House <brad@brad-house.com>
+Co-authored-by: Brad House <brad@brad-house.com>
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/c7fa9ebcb0c0086730c53bf03191c03f03706246]
+GHSA: GHSA-fqh5-3x7m-wp44
+---
+ docs/ares_set_socket_functions.3 | 20 ++++++++++++++++++++
+ src/lib/ares_conn.c              |  9 ++++++++-
+ src/lib/ares_socket.c            |  4 +++-
+ src/lib/ares_socket.h            |  8 +++++---
+ test/ares-test-mock.cc           | 32 +++++++++++++++++++++++++++++++-
+ 5 files changed, 67 insertions(+), 6 deletions(-)
+
+diff --git a/docs/ares_set_socket_functions.3 b/docs/ares_set_socket_functions.3
+index 605beb26ef..75c621cb48 100644
+--- a/docs/ares_set_socket_functions.3
++++ b/docs/ares_set_socket_functions.3
+@@ -149,6 +149,20 @@ a socket. Additional flags controlling behavior are in
+ address, the callback should fill this in. The \fIflags\fP parameter is
+ currently unused. See \fBrecvfrom(2)\fP.
+ 
++For UDP, the callback must fill in the full source address, including the
++source port, exactly as \fBrecvfrom(2)\fP does. c-ares discards a datagram
++whose source address does not match the server it queried, or whose source
++port does not match that server's port.
++
++\fBSecurity:\fP for compatibility with older callbacks, a reported source port
++of 0 is treated as unknown and only the address is checked. A callback that
++does not fill in the source port is therefore insecure: c-ares will accept
++answers sent from any port on the server's address, for example from another
++DNS server or any other service or user able to send UDP from that host, and
++those answers are cached and returned to the application. Such an
++implementation is non-compliant and should be fixed to report the real source
++port.
++
+ .TP 8
+ .B ares_ssize_t (*\fIasendto\fP)(ares_socket_t \fIfd\fP, const void * \fIbuffer\fP, size_t \fIlength\fP, int \fIflags\fP, const struct sockaddr * \fIaddress\fP, ares_socklen_t \fIaddress_len\fP, void * \fIuser_data\fP)
+ .br
+@@ -305,6 +319,12 @@ Receives data from remote socket endpoint, if available. If the \fIaddr\fP
+ parameter is not NULL and the connection protocol provides the source address,
+ the callback should fill this in. See \fBrecvfrom(2)\fP
+ 
++For UDP, the callback must fill in the full source address, including the
++source port, as described above for \fIarecvfrom\fP in
++\fBares_set_socket_functions_ex\fP. \fBSecurity:\fP a callback that
++does not fill in the source port is insecure, and c-ares will accept answers
++sent from any port on the server's address.
++
+ .TP 8
+ .B ares_ssize_t (*\fIasendv\fP)(ares_socket_t \fIfd\fP, const struct iovec * \fIdata\fP, int \fIlen\fP, void * \fIuser_data\fP)
+ .br
+diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c
+index b868053e62..7711d8649e 100644
+--- a/src/lib/ares_conn.c
++++ b/src/lib/ares_conn.c
+@@ -257,7 +257,14 @@ ares_conn_err_t ares_conn_read(ares_conn_t *conn, void *data, size_t len,
+      * functions might not filter on connect, so also check here that the
+      * datagram came from the server's address and UDP port.  RFC 5452
+      * section 9.1 only requires the address to match; matching the port too
+-     * keeps one server from answering for another on the same address. */
++     * keeps one server from answering for another on the same address.
++     * Socket functions that fill in the source address but leave the port 0
++     * predate the port check, so for those only the address is checked.  A
++     * sender cannot use this to skip the port check: the default socket
++     * functions connect() the socket, so the kernel drops a datagram from
++     * port 0, and an unprivileged process on the server's host cannot send
++     * from port 0, while an off-path attacker able to forge port 0 can forge
++     * the server's real port just as easily. */
+     if (err == ARES_CONN_ERR_SUCCESS &&
+         !ares_sockaddr_addr_port_eq((struct sockaddr *)&sa_storage,
+                                     &conn->server->addr,
+diff --git a/src/lib/ares_socket.c b/src/lib/ares_socket.c
+index 0a12935ab7..29d595e1a9 100644
+--- a/src/lib/ares_socket.c
++++ b/src/lib/ares_socket.c
+@@ -144,7 +144,9 @@ ares_bool_t ares_sockaddr_addr_port_eq(const struct sockaddr  *sa,
+     sa_port = (CARES_INADDR_CAST(const struct sockaddr_in6 *, sa))->sin6_port;
+   }
+ 
+-  if (ntohs(sa_port) != port) {
++  /* A port of 0 means the source port was not reported, so only the address
++   * can be checked. */
++  if (sa_port != 0 && ntohs(sa_port) != port) {
+     return ARES_FALSE;
+   }
+ 
+diff --git a/src/lib/ares_socket.h b/src/lib/ares_socket.h
+index f7128e3493..1ede6987ee 100644
+--- a/src/lib/ares_socket.h
++++ b/src/lib/ares_socket.h
+@@ -151,13 +151,15 @@ ares_bool_t     ares_sockaddr_addr_eq(const struct sockaddr  *sa,
+                                       const struct ares_addr *aa);
+ 
+ /*! Compare the IP address and port of a socket address with an ares_addr and
+- *  port.
++ *  port.  A port of 0 in the socket address means the port is unknown, so it
++ *  matches any port.
+  *
+  *  \param[in] sa    Socket address (AF_INET or AF_INET6)
+  *  \param[in] aa    Address to compare against
+  *  \param[in] port  Port to compare against, in host byte order
+- *  \return ARES_TRUE if the address families, IP addresses and ports are
+- *          equal, ARES_FALSE otherwise
++ *  \return ARES_TRUE if the address families and IP addresses are equal and
++ *          the ports are equal or the socket address port is 0, ARES_FALSE
++ *          otherwise
+  */
+ ares_bool_t     ares_sockaddr_addr_port_eq(const struct sockaddr  *sa,
+                                            const struct ares_addr *aa,
+diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc
+index 058dc93001..cc5e6482f2 100644
+--- a/test/ares-test-mock.cc
++++ b/test/ares-test-mock.cc
+@@ -3364,6 +3364,7 @@ struct FakeSockData {
+   size_t             query_len;
+   struct sockaddr_in peer;
+   unsigned short     recv_port; /* network order; 0 reports the peer's port */
++  bool               recv_no_port; /* report the peer's address with port 0 */
+   size_t             recv_calls;
+   size_t             bad_fd_calls;
+   size_t             sock_state_bad;
+@@ -3472,7 +3473,9 @@ static ares_ssize_t FakeSockRecvfrom(ares_socket_t sock, void *buffer,
+   if (address != NULL && address_len != NULL &&
+       *address_len >= (ares_socklen_t)sizeof(d->peer)) {
+     memcpy(address, &d->peer, sizeof(d->peer));
+-    if (d->recv_port != 0) {
++    if (d->recv_no_port) {
++      reinterpret_cast<struct sockaddr_in *>(address)->sin_port = 0;
++    } else if (d->recv_port != 0) {
+       reinterpret_cast<struct sockaddr_in *>(address)->sin_port = d->recv_port;
+     }
+     *address_len = sizeof(d->peer);
+@@ -3750,6 +3753,33 @@ TEST_F(LibraryTest, UDPAnswerFromWrongPortDropped) {
+   ares_destroy(chan);
+ }
+ 
++// Socket functions written before the port check may fill in the source
++// address but leave the port 0.  The address is still checked, but the answer
++// must not be dropped for its port.
++TEST_F(LibraryTest, UDPAnswerWithoutPortAccepted)
++{
++  ares_channel_t *chan = nullptr;
++  FakeSockData    data;
++
++  memset(&data, 0, sizeof(data));
++  FakeSockInit(&chan, &data, 0, ARES_SOCKFUNC_FLAG_NONBLOCKING);
++
++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN, ARES_REC_TYPE_A,
++                    FakeSockQueryCallback, &data, NULL);
++  ASSERT_NE((size_t)0, data.query_len);
++  ASSERT_EQ(htons(53055), data.peer.sin_port);
++
++  data.recv_no_port = true;
++  data.recv_answer  = true;
++  ares_process_fd(chan, 100, ARES_SOCKET_BAD);
++  EXPECT_FALSE(data.recv_answer);
++  EXPECT_TRUE(data.done);
++  // The fake answer carries no records.
++  EXPECT_EQ(ARES_ENODATA, data.status);
++  EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));
++  ares_destroy(chan);
++}
++
+ // The close function is application code too.  With no socket-state callback
+ // to carry the descriptor, it runs inline while ares_check_cleanup_conns()
+ // walks the server list and each server's connections, closing idle ones.
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
index 058f3666e7..1d0f3eb343 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
@@ -6,6 +6,14 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
+           file://0001-ares_cancel-ares_destroy-detach-queries-before-callbacks.patch \
+           file://0002-Deliver-deferred-socket-server-state-notifications.patch \
+           file://0003-ares_qcache-hand-callbacks-their-own-copy.patch \
+           file://0004-Handle-connections-torn-down-by-application.patch \
+           file://0005-ares_process-only-accept-an-answer-on-the-right-connection.patch \
+           file://0006-ares_save_options-read-channel-config-under-lock.patch \
+           file://0007-ares_inet_pton-reject-a-prefix-length.patch \
+           file://0008-ares_conn_read-dont-drop-UDP-answers-from-server-port.patch \
            file://run-ptest"
 SRC_URI[sha256sum] = "c222b6d681096f9444d2c4863d2c1174019e27cacca0a4a5c114d36dd7d7bf78"
 
