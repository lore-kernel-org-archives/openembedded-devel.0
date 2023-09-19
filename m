Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5160EEDE989
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:29:19 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2215.1695108558245426372
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="120646906"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="120646906"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:29:15 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D74ACD6DE
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:29:13 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C546F81A
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:29:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id BBD5E86F10;
	Tue, 19 Sep 2023 16:29:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] dovecot: upgrade 2.3.20 -> 2.3.21
Date: Tue, 19 Sep 2023 15:29:01 +0800
Message-Id: <1695108541-6828-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.006
X-TMASE-Result: 10--32.378900-10.000000
X-TMASE-MatchedRID: CuF97AeNZaqjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfP4HcLZnPRnUxos
	txYsQaDCimyY0YAT/Km9Ub6aXMsdHm94Ipa1otxoxkszn8tNF/+8NF18zPVqzcRaF1V1c2e/tIz
	sK5XDrWX93kA1ImA+YMChIPDmKHlTdvvbftTsJSejC9ni38xhboOeZuUUsCzCCcZNgd9olGFMlX
	cCcrBItkBy/H4Uu/FktBM/r/AC4T6eVvse0gj6Fs/qPrPmHSlsqxxYRyql7kuHHkVhe72VXyDzT
	XgipUFwUUJNrrF6kU/M576oNNC2cHzLTypR/JvICtzGvPCy/m6/d317BwwdB6aKmPIBNMKq75W2
	nV8jKR+Fgt2tSPnIRtoERduHBJe+1xJl5LjpEzeC+Y2uxPjociz3IJiNRHpLMoh6scCF9jFGiwd
	XEohR/vmPW+fVmRgKkbXd/BrUE3cxgGuH6sDPS7nHu4BcYSmtVygUxIepc5xUjspoiX02F2uJBm
	9xk0JCQL9QhueYgL/7Z/b6xfryz195pl80vP6vcFSPyuy3EQQU1xbljbMa+VGJGXffuLdvbjQ2n
	mm3r6jUfDN4HgVzsrDft91/XBmuoFSvoJ1g6FX+xRIVoKNMvEfLPdsHmQbnS1jK4vkKprGbA0f1
	ACOU81/nsucvAlJTw0tSLTMDTxVjAEhhEuKD9irLqyE6Ur/jMaP9SSz/VBnozDhGeQC9Eppj+XN
	qU6N7iz7f22dNkWGN4JEWHjHTPj7m56g9ly8I8t4fUUGeErRxCcahBdJAzjP3WYNhkszl5Vznr0
	BycocpbZgFL6tkMPnbroaoFP6m8plQwfMmRJSeAiCmPx4NwJuJ+Pb8n/VxLzP5snaeb1Qqtq5d3
	cxkNQP90fJP9eHt
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104960

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* lib-oauth2: Allow JWT tokens to be validated with missing typ field.
+ auth: Auth passdb and userdb reply can contain "event_<name>=value"
  which will be added to login event and mail user event respectively.
+ lib-master: Set process title during various initialization stages to
  clearly describe what the process is waiting on.
+ lib-storage: The mail_temp_scan_interval is now fuzzed incrementing it
  by 0..30% based on username's hash to reduce the chance of load spikes.
+ lib-storage: The temp file scan has been moved from the open of the
  mailbox to the close, to reduce the latency perceived by users.
+ stats: If metric has fields specified, all these fields are
  exported as counters to prometheus exposition.
- *-login: Processes might have crashed when a SSL connection disconnects
  uncleanly.
- acl: When plugin was loaded \HasChildren and \HasNoChildren flags
  were calculated incorrectly for mailboxes containing '*' and '%'
  in their names.
- auth: Crash occured if a connection to PostgreSQL database server
  failed during startup.
- auth: Logins with invalid passwords (e.g. unknown scheme) in passdb
  were failing with "password mismatch" instead of "internal error".
- auth: XOAUTH2 and OAUTHBEARER mechanisms were not giving out protocol
  specific error message on all errors. This especially broke OIDC
  discovery.
- dbox: When last_temp_file_scan header wasn't set (especially after
  dsync migration), the next mailbox open always triggers the temp file
  scan. 
- dict-redis: A crash would occur on transaction rollback.
- dsync: Infinite loop causing out of memory would occur when handling
  mailbox deletion from remote end and hierarchy separators would differ.
- dsync: Incremental dsync failed for folder names ending with '%',
  unless BROKENCHAR was set. Also folder names with '%' elsewhere in
  them caused each incremental dsync to unnecessarily rename the folder
  to a temporary name and back. v2.3.19 regression.
- imap-hibernate: If an IMAP client unhibernation timed out with
  "(version received)", the unhibernation could still have successfully
  finished later on and continued working normally. This was rather
  confusing, because imap-hibernate already logged that the client got
  disconnected. 
- imapc: Crashed when a folder mapped through the virtual plugin
  disappears from the storage.
- imapc: EXPUNGE, EXISTS or FETCH replies from a server for a previously
  selected mailbox could have been processed as if they belonged to the
  new mailbox currently being selected.
- lib-http: Dovecot HTTP server (doveadm, stats/openmetrics) may have
  disconnected HTTP clients before the response is fully sent. This
  happened only on busy servers where kernel's socket buffers were
  rather full.
- lib-http: Fixed a potential crash on http-server if a client
  disconnected early. v2.3.18 regression.
- lib-index: Index file corruption could have caused a crash. Fixes:
  Panic: file mail-transaction-log-view.c: line 165 (mail_transaction_log_view_set):
  assertion failed: (min_file_seq <= max_file_seq).
- lib-index: Purging an existing >1GB cache file can crash. Now cache
  files still above 1GB after purging are removed. Fixes:
  Panic: file mail-index-util.c: line 10 (mail_index_uint32_to_offset):
  assertion failed: (offset < 0x40000000)
- lib-lua: A HTTP client could not resolve DNS names in mail processes,
  because it expected "the dns-client" socket to exist in the current
  directory.
- lib-oauth2: Dovecot would send client_id and client_secret as POST
  parameters to the introspection server. These need to be optionally in
  Basic auth instead.
- lib-oauth2: JWT aud validation was not performed if aud was missing
  from a token, but was configured on Dovecot.
- lib-oauth2: JWT key type check was too strict.
- lib-oauth2: JWT token audience was not validated against client_id as
  required by the specification.
- lib-ssl-iostream: Using the ssl_require_crl=yes setting may have caused
  CRL check failures for outgoing SSL/TLS connections, although it was
  supposed to affect checking CRLs only for client-side SSL
  certificates. v2.3.17 regression.
- lib-sql: MySQL driver leaked memory when connection failed.
- lib-storage: Various fixes when running into out of disk space.
- master: Service idle_kill setting didn't work properly on busy
  servers.
- mdbox: Temp file scan was done for always empty directories.
- mdbox: The fdatasync() call was done in wrong parent directory when
  writing mails. Also on a failure it crashed instead of logging an error.
- notify_status: The plugin crashes if any user initialization fails.
- pop3: Sending command with the ':' character caused an assert-crash.
  v2.3.18 regression. Fixes: Panic: event_reason_code_prefix(): name has ':'
- stats: Fix panic when a nonexistent event exporter was referenced while
  adding a new metric dynamically via doveadm stats add.
- stats: If process exported a lot of events and then exited, some of
  the last events may have become lost.
- stats: Invalid Prometheus label names were created with specific
  histogram group_by configurations. Prometheus rejected these labels.
- welcome: The plugin didn't execute in some situations that created
  INBOX but didn't open it.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dovecot/{dovecot_2.3.20.bb => dovecot_2.3.21.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.3.20.bb => dovecot_2.3.21.bb} (97%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
similarity index 97%
rename from meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
index e41dd93f5d..17fbd789b6 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://dovecot.org/releases/2.3/dovecot-${PV}.tar.gz \
            file://0001-not-check-pandoc.patch \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
            "
-SRC_URI[sha256sum] = "caa832eb968148abdf35ee9d0f534b779fa732c0ce4a913d9ab8c3469b218552"
+SRC_URI[sha256sum] = "05b11093a71c237c2ef309ad587510721cc93bbee6828251549fc1586c36502d"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
-- 
2.34.1


