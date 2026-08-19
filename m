Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E71C5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:11:06 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4701.1787137858007544142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NX21MphS;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3436; q=dns/txt;
  s=iport01; t=1787137858; x=1788347458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0boDgK8ogPbS2d5GO3aCBJ+hraXAjjRSQGl1JN1hSa0=;
  b=NX21MphSNUnk+4eoqG8ludCCZrFdJjLX80PWw5khvHXUm+qaS3SGlU2G
   7HpUqCdc13BJnU9+8fyBgMgQ4+0+ZHlTsVO0uPZD7BJY9Fx2VbKiiWMOr
   IWu/tEy17K7YxFyGHDVRcwkysbLNxOn53h9qr9Brr/LfyslmjHMGxHdwy
   WysPVf/IMzwXpC1Ng/Cq27kdCbyWZ9AhCwe04e7dM/v7CmAXtQ07bfDHr
   i9ieeVdjNKyD3TCs9eKtkbTsjwDkw7YajJzvCMBhZBTfwGA8f7bPbrTJy
   VUBdvwtTUbYvASSRDdJzw6wMwFyt2BUu5AfUY9dYrWNaDbRlcoy9Jow52
   w==;
X-CSE-ConnectionGUID: z2FR/A2cTPK2RHSflQNigg==
X-CSE-MsgGUID: 0JLRA5cYS56W0/7Is14Awg==
X-IPAS-Result: =?us-ascii?q?A0BLAgBMjoVq/5MQJK1aglmCV3ReQ0kDhFSRcwOeG4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo1rAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDIwQLARgBLRAJEwMBAgMCJgICKyMIEAmDAgGCdAMRB?=
 =?us-ascii?q?qgjmyN6fzOBAYMoAT8CQ1DbMAELFAEFgQUuhT+DHwGFAl0YAYR8JxsbgXKBF?=
 =?us-ascii?q?YNpgQWBXAQYhSGCagSCInoSgVqRZUiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XNVgbBgWBHYEohDcjGTZ6gQlegSsqYQESF4EJggoCgnOCBgIBSUURC?=
 =?us-ascii?q?gsLGA1IESw3FBkEPQFuB45JIIJAB1gMFxMBK0aBThgFCQOlZaEPCiiDdowhl?=
 =?us-ascii?q?ToaM6psC5h9jgqWUIRpgWg8gVlwFYMiCUoZD444iH7HJicyAgkDLwEBBwIHA?=
 =?us-ascii?q?QELAQMLgWiRfgEB?=
IronPort-Data: A9a23:TkSoLaIbrXETJIAGFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENS1mMPm
 GNOXG+EOfaJZzHxc4p2b9/joU4Ou8TUzoA2GwMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2clajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN18Vm8MeqRC8dpPIjt01
 ccWLAkrbx+M0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSAVbAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzM3wsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5Fwoi+a9a4CJIbRmQ+0NvGKij
 z/Nzl+kXC5Cc4O+0mPZ222j07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++Nu0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:zdwCZ669njNX35zM8gPXwBbXdLJyesId70hD6qm+c3Nom6uj5q
 aTdZUgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfCFHZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce36m+okcfng9OXL/f6
 DsnfZ6mw==
X-Talos-CUID: =?us-ascii?q?9a23=3Ae5x+kmt/t8qJkwkVfWUfd6Gl6Is3KFPni16KKHO?=
 =?us-ascii?q?AKjxTaIabTWa2+axrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AY/aigQ0AkDZE1WqRta6GpvZ6XTUju4aKMmlQmqQ?=
 =?us-ascii?q?95pe7bWsvGizE0B2oTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="813683243"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:10:57 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id E254018000254;
	Wed, 19 Aug 2026 11:10:56 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 88BE4CC12A6; Wed, 19 Aug 2026 04:10:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-oe][scarthgap][PATCH 2/5] libssh: Fix CVE-2026-59844
Date: Wed, 19 Aug 2026 04:10:44 -0700
Message-Id: <20260819111047.44043-3-hthakar@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129349

From: Hetvi Thakar <hthakar@cisco.com>

The stable-0.11 commit shown in [1] is the upstream fix selected for
this backport. The upstream advisory [2] documents CVE-2026-59844 and
identifies libssh 0.11.5 as the fixed release for the 0.11 series.

[1] https://git.libssh.org/projects/libssh.git/commit/?id=e31f06e5380be4e714d5ad6965981fbf30738da9
[2] https://www.libssh.org/security/advisories/CVE-2026-59844.txt

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libssh/libssh/CVE-2026-59844.patch        | 52 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59844.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-59844.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59844.patch
new file mode 100644
index 0000000000..ac380622d9
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59844.patch
@@ -0,0 +1,52 @@
+From ef7cd6d4aef6d18ca8bf15cb0398b630284f46f4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pavol=20=C5=BD=C3=A1=C4=8Dik?= <pzacik@redhat.com>
+Date: Fri, 6 Mar 2026 18:05:29 +0100
+Subject: [PATCH] CVE-2026-59844 sftpserver: cap accepted values of len in
+ SSH_FXP_READ
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The client-provided length is directly used in
+a malloc in process_read(), so not restricting it
+leads to allocations bounded only by UINT32_MAX.
+
+The new cap is the same as the one currently used
+by OpenSSH.
+
+Signed-off-by: Pavol Žáčik <pzacik@redhat.com>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2026-59844
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=e31f06e5380be4e714d5ad6965981fbf30738da9]
+
+Backport Changes:
+- Replace the upstream goto error path with equivalent direct message cleanup
+  and return because libssh 0.10.6 does not have the refactored
+  sftp_make_client_message() error label.
+
+(cherry picked from commit 6dba2e06f0713c04ad5eca7d4315d0104be7e627)
+(cherry picked from commit e31f06e5380be4e714d5ad6965981fbf30738da9)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/sftpserver.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/sftpserver.c b/src/sftpserver.c
+index 528ef6f9..77290068 100644
+--- a/src/sftpserver.c
++++ b/src/sftpserver.c
+@@ -105,6 +105,13 @@ sftp_client_message sftp_get_client_message(sftp_session sftp) {
+         sftp_client_message_free(msg);
+         return NULL;
+       }
++      if (msg->len > MAX_PACKET_LEN - 1024) {
++        ssh_set_error(sftp->session, SSH_FATAL,
++                      "Too large SSH_FXP_READ length: %" PRIu32,
++                      msg->len);
++        sftp_client_message_free(msg);
++        return NULL;
++      }
+       break;
+     case SSH_FXP_WRITE:
+       rc = ssh_buffer_unpack(payload,
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 381b3efc7d..a9d7729f2c 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -33,6 +33,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-0967.patch \
            file://CVE-2026-0965.patch \
            file://CVE-2026-59843.patch \
+           file://CVE-2026-59844.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.35.6


