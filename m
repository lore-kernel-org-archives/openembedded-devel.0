Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36EEC5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:11:06 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4696.1787137856728755382
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UxA6kwBX;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4549; q=dns/txt;
  s=iport01; t=1787137856; x=1788347456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UMm/Sg/0QBumGTBTu3U6SJIw0cTrVURvaImPUlcwCx4=;
  b=UxA6kwBXjZv3Un4Z7b0TBHQRhjPCY048lqBQfu/clYQnbvIh9hxkgACM
   Qx+6tcSB+3zvzRA/zc0TwAOvp9GvF1d67Ebeaay+TFNrX28xvYGbB+G6i
   vk/T6H4TOmfhW5RSiiw63WUp07KQsjgyakVlgqTzk1n7N7ujVh+gakCo0
   ST0ckP54RhdpC4tiPlgCi2lxmknhLXddqlTgDwf40ICPExwnj8Qy/9zSn
   tE6Xl9XV7DKSBF2TAVit6elrAVf2ukkoiuLjJDR4LhurOwHbzSU8mT9jo
   4RQPfMa5o8lyrn8eqw3WF645JBnKs0rXDurx9yaeJ9jAacR3Coa8RtGzN
   A==;
X-CSE-ConnectionGUID: wxBQjMc3QU6yhXlNBymqqA==
X-CSE-MsgGUID: /TvnSa3CSciE/aOywt7jHg==
X-IPAS-Result: =?us-ascii?q?A0AEAwDSjYVq/5MQJK1aglmCV3ReQ0kDhFSRcwOeG4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo1rAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDIwQLARgBLRAJEwMBAgMCJgICKyMIEAmDAgGCdAMRB?=
 =?us-ascii?q?qgjmyN6fzOBAYMoAT8CQ1DbMAELFAEFgQUuhT+DHwGFAl0YAYR8JxsbgXKBF?=
 =?us-ascii?q?YNpgQWBXAQYhSGCagSCInoSgVqJeodrSIECHANZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPhc1WBsGBYEdgSiENyMZNnqBCV6BKyphARIXgQmCCgKCc4IGAgFJR?=
 =?us-ascii?q?REKCwsYDUgRLDcUGQQ9AW4HjkkggkdkFxMBKxQDCXFYKxgFCQM4pS2hDwoog?=
 =?us-ascii?q?3aMIZU6GjOqbAuYfY4KlgBQhGmBbworgVlwFYMiCUoZD444iH7HJicyAgkDL?=
 =?us-ascii?q?wEBBwIHAQELAQMLgWiRfgEB?=
IronPort-Data: A9a23:kgl0XKzfYmVpTy9kdGl6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUHm
 DMWWD+GPPvYYDSnL991Ptmz9x4HvcSEmIMxTlFrqFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkazNMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJF4mF7Qa3+0sOFwQ5
 PwoLBYnfxWansvjldpXSsE07igiBMDvOIVavjRryivUSK9+B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUifC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZgOG3bouJI4bTLSlTtgGku
 GT99j/SORobGZuW7iua7i2upuCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:KqG4pKw4JTlVtE6N5nbtKrPw8r1zdoMgy1knxilNoNJuHfBw8P
 re+sjztCWE7wr5N0tApTntAsS9qDbnhPxICOoqTNOftXfd2FdARbsKheCJ/9SjIVyaygc378
 ldmsZFZOEYJGIK9PoSmDPIcOoI8Z2g7L2ig/vYwjNGSAFnbLwl0iJCYzzranGfgGJ9dOAE/F
 323Ls9mwad
X-Talos-CUID: =?us-ascii?q?9a23=3A4SmHVGhqU88/D1Oa5TIdH0JHcjJubW339XX1KBS?=
 =?us-ascii?q?BNDh4SI2Rb3WB/bp9up87?=
X-Talos-MUID: 9a23:xHvUSwjOrKe8sJ4o/ebpq8Mpc/t25Z+nU2s2mpQr/MCjJDNsZDW9g2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="812694121"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:10:55 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id C45C31800054D;
	Wed, 19 Aug 2026 11:10:55 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 68528CC12A6; Wed, 19 Aug 2026 04:10:55 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-oe][scarthgap][PATCH 1/5] libssh: Fix CVE-2026-59843
Date: Wed, 19 Aug 2026 04:10:43 -0700
Message-Id: <20260819111047.44043-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260819111047.44043-1-hthakar@cisco.com>
References: <20260819111047.44043-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:11:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129348

From: Hetvi Thakar <hthakar@cisco.com>

The stable-0.11 commit shown in [1] is the upstream fix selected for
this backport. The upstream advisory [2] documents CVE-2026-59843 and
identifies libssh 0.11.5 as the fixed release for the 0.11 series.

[1] https://git.libssh.org/projects/libssh.git/commit/?id=687ef1c44b646b9db0b1c6e8f987edb7c9e4d919
[2] https://www.libssh.org/security/advisories/CVE-2026-59843.txt

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libssh/libssh/CVE-2026-59843.patch        | 84 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59843.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-59843.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59843.patch
new file mode 100644
index 0000000000..03d3ce6ea2
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59843.patch
@@ -0,0 +1,84 @@
+From d965eb941a9a83a0643570a93d8997b91e248fc1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pavol=20=C5=BD=C3=A1=C4=8Dik?= <pzacik@redhat.com>
+Date: Fri, 6 Mar 2026 13:58:30 +0100
+Subject: [PATCH] CVE-2026-59843 channels: Fail when receiving max packet size
+ 0
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Do this both for SSH2_MSG_CHANNEL_OPEN and for
+SSH2_MSG_CHANNEL_OPEN_CONFIRMATION. Using the
+max packet size 0 would lead to an infinite loop
+in channel_write_common.
+
+Originally reported by Rinku Das on on 23th February.
+Independently reported by Yi Lin on 26th February and
+Haruto Kimura on 22nd March.
+
+We do not consider this as a security issue as connecting
+to untrusted servers on the internet brings much worse
+security consequences than hanging your clinet.
+
+Signed-off-by: Pavol Žáčik <pzacik@redhat.com>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2026-59843
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=687ef1c44b646b9db0b1c6e8f987edb7c9e4d919]
+
+(cherry picked from commit 44b186fa17aff497dae420c59c003222e438103c)
+(cherry picked from commit 687ef1c44b646b9db0b1c6e8f987edb7c9e4d919)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/channels.c |  7 +++++++
+ src/messages.c | 19 +++++++++++++++----
+ 2 files changed, 22 insertions(+), 4 deletions(-)
+
+diff --git a/src/channels.c b/src/channels.c
+index 8290dbd1..3afdcf11 100644
+--- a/src/channels.c
++++ b/src/channels.c
+@@ -192,6 +192,13 @@ SSH_PACKET_CALLBACK(ssh_packet_channel_open_conf){
+   if (rc != SSH_OK)
+       goto error;
+ 
++  if (channel->remote_maxpacket == 0) {
++      SSH_LOG(SSH_LOG_RARE,
++              "Invalid maximum packet size 0 in "
++              "SSH2_MSG_CHANNEL_OPEN_CONFIRMATION");
++      goto error;
++  }
++
+   SSH_LOG(SSH_LOG_PROTOCOL,
+       "Received a CHANNEL_OPEN_CONFIRMATION for channel %d:%d",
+       channel->local_channel,
+diff --git a/src/messages.c b/src/messages.c
+index 6dadabf0..e79ecec2 100644
+--- a/src/messages.c
++++ b/src/messages.c
+@@ -1160,10 +1160,21 @@ SSH_PACKET_CALLBACK(ssh_packet_channel_open){
+   SSH_LOG(SSH_LOG_PACKET,
+       "Clients wants to open a %s channel", type_c);
+ 
+-  ssh_buffer_unpack(packet,"ddd",
+-          &msg->channel_request_open.sender,
+-          &msg->channel_request_open.window,
+-          &msg->channel_request_open.packet_size);
++  rc = ssh_buffer_unpack(packet,
++                         "ddd",
++                         &msg->channel_request_open.sender,
++                         &msg->channel_request_open.window,
++                         &msg->channel_request_open.packet_size);
++  if (rc != SSH_OK){
++      goto error;
++  }
++
++  if (msg->channel_request_open.packet_size == 0) {
++      ssh_set_error(session,
++                    SSH_FATAL,
++                    "Invalid maximum packet size 0 in SSH2_MSG_CHANNEL_OPEN");
++      goto error;
++  }
+ 
+   if (session->session_state != SSH_SESSION_STATE_AUTHENTICATED){
+     ssh_set_error(session,SSH_FATAL, "Invalid state when receiving channel open request (must be authenticated)");
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 1f64920a50..381b3efc7d 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-0968-2.patch \
            file://CVE-2026-0967.patch \
            file://CVE-2026-0965.patch \
+           file://CVE-2026-59843.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.35.6


