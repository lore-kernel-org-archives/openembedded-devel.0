Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09EFC624D1
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 08:54:26 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3403.1788252865978600501
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2026 01:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iofumtu8;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3085; q=dns/txt;
  s=iport01; t=1788252866; x=1789462466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cJsZtq9vPWjPVrwQyFIQ3D0ODUv4JGg3MLylsD2Mg64=;
  b=iofumtu8tXrViAcOFe28zsc5QdMv/djoFDZW3as649+mj33wc2mtHufy
   r9iENRgL8oeP5vH2j7yRy4pYKCWyKOcCDYGoDy2hEgt2ABZyd471MwBlC
   AOqwuXrXkrf3sbdEYOv0j4jfvOQityJFItyIWxkzWyLgnuNXPq9MdjYy8
   0nSP5uYbRZGxiIVqucmcIwAPF0M9V9pDHl+9PjgjGcJsSYRt+POw8Llma
   4O6DCM9du8rGPpArxT0DYpmK7WYxhIyaTxCP7Ljy8Eedn0qlDa6hprZ7w
   EmFqNRUnavqRELzfvn8R9wD+gmQpteBB6+H/qKrnK+utcQwojhf/yFztK
   Q==;
X-CSE-ConnectionGUID: rjgNDP8iRL624I+shAfKgw==
X-CSE-MsgGUID: v93+M20aQGqRo083DKx8WQ==
X-IPAS-Result: =?us-ascii?q?A0BMAgBIkpZq/5AQJK1aglmCV3RfQkkDhFSRcwOeG4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo13AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBAyMECwEYAS0QCRMDAQIDAiYCAisjCBAJgwIBgnQCA?=
 =?us-ascii?q?REGoEubI3p/M4EBgygBPwJDUNswAQsUAQWBBS6FP4MfAYUCXRgBhHwnGxuBc?=
 =?us-ascii?q?oEVg2mBBYFcBBiFIYJqBIIiehKBWm6RG0iBAhwDWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XNVgbBgWBHYEog0QjGTZ6gQlegSspYAESF4EJgggCgleCAwIBS?=
 =?us-ascii?q?UMOB0dTCSoCCQsYDUgRLDcVGQQ9AW4Hjl8fgksHDlYqASuCFBgFCQOTAJJlo?=
 =?us-ascii?q?Q8KKIN2jCKVOhozqmwLmH2OCpZQhGmBaDyBWXAVgyIJShkPjjiIfscmJDUCC?=
 =?us-ascii?q?QMvAQEHAgcBAQsBAwuBaJF+AQE?=
IronPort-Data: A9a23:ZwSaf6w2azodVBLmAN96t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUEx
 mFMXDjQP6rYYzPyf94nYN/l9hkC7ZHXmoMxGgs5rVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYlajtMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFs0Mqs0wrZ2O0UQr
 6A5aysNRx6giP3jldpXSsE07igiBMDvOIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUicC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZgOS3boSJKo3RLSlTtljJ/
 SHjpTzwOz4DDtvHmWGp0WL8udaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYS71Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:j0JX6Kn/tPHkKlzHaChNKgU10pDpDfLy3DAbv31ZSRFFG/FwWf
 rAoB19726TtN9xYgBGpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdAUrsD0WKK+VSJcEfDH6xmpM
 JdmsNFZuEYY2IXsS/S2njALz9Z+qjlzImYwcHD0nxqUQZmL4tk7wt/F0KnN3cefng/OXL8f6
 DsnPauYFGbCA8qUvg=
X-Talos-CUID: 9a23:UDgWvGye/sSkTPerD4fGBgUOGM8DXkWNzU30fRXkKCVySJSbalCPrfY=
X-Talos-MUID: 9a23:7tCQUwrd2fJEVr4xWwcezy8zb4RNufynMW8Uq5Je65KoFjwgBA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,255,1779148800"; 
   d="scan'208";a="842664893"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Sep 2026 08:54:25 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id E7409180001C3;
	Tue,  1 Sep 2026 08:54:24 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 84476CE1C04; Tue,  1 Sep 2026 01:54:24 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch v2 5/5] libssh: Fix CVE-2026-59850
Date: Tue,  1 Sep 2026 01:53:57 -0700
Message-Id: <20260901085357.1254306-6-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260901085357.1254306-1-hthakar@cisco.com>
References: <20260901085357.1254306-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 08:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129625

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
index 000000000..61e502c79
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
index 960621eac..ccfa55e0d 100644
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


