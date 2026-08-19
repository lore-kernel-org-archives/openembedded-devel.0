Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A07FC5DF87
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:11:07 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4701.1787137858007544142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fH04i3L7;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3089; q=dns/txt;
  s=iport01; t=1787137861; x=1788347461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kkw5+OuoK8hy+jWIYH7lccG/oiAQnaFOo2wAiX32ViM=;
  b=fH04i3L7ezubA6cKQTovGUU1f+zhZstYO2he9FBXGFlJGpAG9RbXhn4Q
   heRAVHCvZjBvf4FLI6sREyhwZk6FQQNk84vREtvDs4crySOSnxUn1E509
   SycD4xp9J/+GQ8Ov6AYo2QUCRzAaOWzaFM58HcpK9AatQiWxfHKMEWs/g
   DTzhlGh6oOrTsXg8GKj+N8zimcfhLOyRsjf0lC3BvbkjogRrayiH9OEOJ
   zoXqp2I7/9iZzjOgHXSNq6gu/VrDPaXMndJbhXi/SINMPwveGfHtthmAV
   kKoyn/zZ81N4QyQczyjrvui+Q4m4aK5kPbj9CYBhp/SrUquV9pDpUqn4a
   g==;
X-CSE-ConnectionGUID: Swv2hfimQimtFLjvabhlVQ==
X-CSE-MsgGUID: MQ71PMR7TRW7H3OXe/Dmsw==
X-IPAS-Result: =?us-ascii?q?A0DPAgBMjoVq/48QJK1aglmCV3ReQ0kDhFSRcwOeG4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo1rAiY1CA4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDIwQLARgBLRAJEwMBAgMCJgICKyMIEAmDAgGCdAMRB?=
 =?us-ascii?q?qgjmyN6fzOBAYMoAT8CQ1DbMAELFAEFgQUuhT+DHwGFAl0YAYR8JxsbgXKBF?=
 =?us-ascii?q?YNpgQWBXAQYhSGCagSCInoSgVpukHdIgQIcA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+FzVYGwYFgR2BKIQ3Ixk2eoEJXoErKmEBEheBCYIKAoJzggYCAUlFE?=
 =?us-ascii?q?QoLCxgNSBEsNxQZBD0BbgeOSSCCQAcOVioBK4IUGAUJA5MAkmWhDwoog3aMI?=
 =?us-ascii?q?ZU6GjOqbAuYfY4KllCEaYFqAjiBWXAVgyIJShkPjjiIfscmJzICCQMvAQEHA?=
 =?us-ascii?q?gcBAQsBAwuBaJF+AQE?=
IronPort-Data: A9a23:+nONdq2Y3DfOmhUM5PbD5YVwkn2cJEfYwER7XKvMYLTBsI5bp2ZUy
 2AbWm2PbPjbN2Kked12PYS3o00CuZbWyNNgSgo/3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24tYzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGN14oZ40W++NOAGRS2
 9gaNjkHbhS9vrfjqF67YrEEasULJc3vOsYb/3pn1zycVahgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME+ojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQhieOzYIGOIILiqcN9u3/H/
 1rjxTvFOC5FFIe4+TfC3ne3mbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1jfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:23GTkKw8gBugfLoBVYdUKrPw8r1zdoMgy1knxilNoNJuHfBw8P
 re+sjztCWE7wr5N0tApTntAsS9qDbnhPxICOoqTNOftXfd2FdARbsKheCJ/9SjIVyaygc378
 ldmsZFZOEYJGIK9PoSmDPIcOoI8Z2g7L2ig/vYwjNGSAFnbLwl0iJCYzzranGfgGJ9dOAE/F
 323Ls9mwad
X-Talos-CUID: 9a23:kvTQoW+0s1JimkcCdj+Vv3ULBJolfHzY9XbVP2GcC3hgQr2Rd2bFrQ==
X-Talos-MUID: 9a23:2aBDRgnTxRmic1rsqH8FdnpHDZgx24GUV3w3rsom4O60OGtcPiyC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="813683326"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:11:01 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 47A3B180005BE;
	Wed, 19 Aug 2026 11:11:01 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id DDE03CC12A6; Wed, 19 Aug 2026 04:11:00 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-oe][scarthgap][PATCH 5/5] libssh: Fix CVE-2026-59850
Date: Wed, 19 Aug 2026 04:10:47 -0700
Message-Id: <20260819111047.44043-6-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260819111047.44043-1-hthakar@cisco.com>
References: <20260819111047.44043-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129351

From: Hetvi Thakar <hthakar@cisco.com>

The stable-0.11 commit shown in [1] is the upstream fix selected for
this backport. The upstream advisory [2] documents CVE-2026-59850 and
identifies libssh 0.11.5 as the fixed release for the 0.11 series.

[1] https://git.libssh.org/projects/libssh.git/commit/?id=6edfb52b3b364577d2db0334c0514a977efceed2
[2] https://www.libssh.org/security/advisories/CVE-2026-59850.txt

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libssh/libssh/CVE-2026-59850.patch        | 40 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59850.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-59850.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59850.patch
new file mode 100644
index 0000000000..61e502c796
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59850.patch
@@ -0,0 +1,40 @@
+From a207ee3b4244c0e5da902245f8b81f3617b416f3 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Wed, 1 Jul 2026 16:43:08 +0200
+Subject: [PATCH] CVE-2026-59850 channels: Avoid processing DATA packets on
+ closed channels
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+
+CVE: CVE-2026-59850
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=6edfb52b3b364577d2db0334c0514a977efceed2]
+
+(cherry picked from commit a8a3fa352bb5213e08a35e4494c6e44360e2e38a)
+(cherry picked from commit 6edfb52b3b364577d2db0334c0514a977efceed2)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/channels.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/channels.c b/src/channels.c
+index 3afdcf11..1543c792 100644
+--- a/src/channels.c
++++ b/src/channels.c
+@@ -575,6 +575,13 @@ SSH_PACKET_CALLBACK(channel_rcv_data){
+       channel->local_window,
+       channel->remote_window);
+ 
++    if (channel->flags & SSH_CHANNEL_FLAG_CLOSED_REMOTE) {
++        SSH_LOG(SSH_LOG_WARNING, "Received data on (remotely) closed channel");
++        ssh_set_error(session, SSH_FATAL, "Received data on (remotely) closed channel");
++        SSH_STRING_FREE(str);
++        return SSH_PACKET_USED;
++    }
++
+   /* What shall we do in this case? Let's accept it anyway */
+   if (len > channel->local_window) {
+     SSH_LOG(SSH_LOG_RARE,
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 1a5f521f6a..cc957d62ca 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -37,6 +37,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-59846.patch \
            file://CVE-2026-59848.patch \
            file://CVE-2026-59848-regression.patch \
+           file://CVE-2026-59850.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.35.6


