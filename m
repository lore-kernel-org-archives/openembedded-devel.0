Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F009FC624D4
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 08:54:26 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3399.1788252849698623592
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2026 01:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eriD7cJQ;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4545; q=dns/txt;
  s=iport01; t=1788252849; x=1789462449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KTVBUOA1fGEYZD3D6S1xT3jXOIsACxhHqmFoB3gno4M=;
  b=eriD7cJQDTdvJwEQQ3UwSvlIroJNGrPGfgeq1vZVIpf3EUMdkrcNjzl6
   lPBtamGFqZJRgkmk40y1gIP0S/5SlTPbg6t462I6wbHiaj58ivm3y7x9h
   YdlZDhz5qK7DDRtFvs7PTkYjGUw61T6t7bgidE5vW8GkrEsQTEDbLNj9b
   reDUt8kOAGn+pm8B1qdWPgWSfC30xRJhXgRhB5xBBqxcBPEYC/OGue0KD
   Hz18PRV6ymDaidoGchgXXXQiZE97/05rm97i8729nj1+M3Zl9dIxIcCAG
   hmJafMW1gfvb3PJvltUaCG5Y97KEgvzBABiQ9YfqKRVai9p0ygW9z9H12
   A==;
X-CSE-ConnectionGUID: /QCksJx/S3G5JflD+CY5CQ==
X-CSE-MsgGUID: 0lWk54IqQjOmNrEgoMvCng==
X-IPAS-Result: =?us-ascii?q?A0BLAgCMkZZq/4sQJK1aglmCV3RfQkkDhFSRcwOeG4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo13AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDIwQLARgBLRAJEwMBAgMCJgICKyMIEAmDAgGCdAIBE?=
 =?us-ascii?q?QagY5sjen8zgQGDKAE/AkNQ2zABCxQBBYEFLoU/gx8BhQJdGAGEfCcbG4Fyg?=
 =?us-ascii?q?RWDaYEFgVwEGIUhgmoEgiJ6EoFaiSiIYUiBAhwDWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XNVgbBgWBHYEog0QjGTZ6gQlegSspYAESF4EJgggCgleCAwIBS?=
 =?us-ascii?q?UMOB0dTCSoCCQsYDUgRLDcVGQQ9AW4Hjl8fglJkFxMBKxQDCXFYKxgFCQM4p?=
 =?us-ascii?q?S2hDwoog3aMIpU6GjOqbAuYfY4KlgBQhGmBaDyBWXAVgyIJShkPjjiIfscmJ?=
 =?us-ascii?q?DUCCQMvAQEHAgcBAQsBAwuBaJF+AQE?=
IronPort-Data: A9a23:0LJZqq954qkE1SkFt9P5DrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2ZLD2jUOPzeNmqgL9ojPd7i9B9V757VnN9nTQU6/3pEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYzpNs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lxBKYb4cRnRloV2
 qE6JjQhLTuy2smPlefTpulE3qzPLeHiOIcZ/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2bMnWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oi3bYWJJIHaGq25mG7Ao
 l3FojjYGygYE9m50xeK9VeyrenAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:seZs5K8C2SgiNsrnbCFuk+AGI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HJoB17726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykCsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfiLqWzLzM2f6bQ0/
 Gnl7F6mwY=
X-Talos-CUID: =?us-ascii?q?9a23=3Ahx2semvmVlzabEJlhS8RwXnh6ItiS1be11XAZHT?=
 =?us-ascii?q?jJjtLRrm5CnShpYhdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A60fHeA9kt0q0Hr807OtBwvSQf59s3KfzVGEUqJc?=
 =?us-ascii?q?hvu+eGCN3Him2ijviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,255,1779148800"; 
   d="scan'208";a="825746587"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Sep 2026 08:54:08 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id 919701800020D;
	Tue,  1 Sep 2026 08:54:08 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 2EA04CE1C04; Tue,  1 Sep 2026 01:54:08 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch v2 1/5] libssh: Fix CVE-2026-59843
Date: Tue,  1 Sep 2026 01:53:53 -0700
Message-Id: <20260901085357.1254306-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260901085357.1254306-1-hthakar@cisco.com>
References: <20260901085357.1254306-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 08:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129621

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
index 000000000..03d3ce6ea
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
index 1e1b5fb0a..10d063f6d 100644
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


