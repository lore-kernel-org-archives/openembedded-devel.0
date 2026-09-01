Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E0AC624D3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 08:54:27 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3400.1788252856959043929
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2026 01:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=C2emn+LS;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3432; q=dns/txt;
  s=iport01; t=1788252856; x=1789462456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8vYVSt2dSZ6xouMGoBpjAojSor/2RsoDxS8xDXfcMoY=;
  b=C2emn+LS/L4lQ5qcFHHxOzktxgLRCwIYMk3uqXMsTGVA+nqk8OVnc3wI
   Mhn0LrLMaJhd8Ta7jwWDthQvEJyAL30osqXMCozrI40+RQOZfG+bDiqjv
   7WN7vWOGqXPCO9akc0B1MCOvQsTzfwj2oPYJOVLki5HjN5jADTVVo7bfm
   GjRI9zcszXfGytg0QKLG2Xw2FSAZeFzymG+R0e/9FMQbNRAtKIOM1djw6
   K1fFfF5X/CNnrjwijkbkdmzovgf7tpp2O96grsRjBAReGt8lij2nUpENo
   vluIC+3JYmjQvlmrLybY46kIBNeiGvg3XFwmsMKBRjUTJZCczn1/8hFXb
   w==;
X-CSE-ConnectionGUID: qFxXRSjeS0WERrgt/pAyQQ==
X-CSE-MsgGUID: 9hUjM5yVTEyuHvM0vsw25Q==
X-IPAS-Result: =?us-ascii?q?A0BLAgBIkpZq/4wQJK1aHgEBCxIMggULgld0X0JJA4RUk?=
 =?us-ascii?q?XMDnhuBfg8BAQEPRA0EAQGFBQKNdwImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBAyMECwEYAS0QCRMDAQIDAiYCAisjCBAJg?=
 =?us-ascii?q?wIBgnQCAREGoEubI3p/M4EBgygBPwJDUNswAQsUAQWBBS6FP4MfAYUCXRgBh?=
 =?us-ascii?q?HwnGxuBcoEVg2mBBYFcBBiFIYJqBIIiehKBWpIJSIECHANZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPhc1WBsGBYEdgSiDRCMZNnqBCV6BKylgARIXgQmCCAKCV?=
 =?us-ascii?q?4IDAgFJQw4HR1MJKgIJCxgNSBEsNxUZBD0BbgeOXx+CSwdYDBcTAStGgU4YB?=
 =?us-ascii?q?QkDpWWhDwoog3aMIpU6GjOqbAuYfY4KllCEaYFoPIFZcBWDIglKGQ+OOIh+x?=
 =?us-ascii?q?yYkNQIJAy8BAQcCBwEBCwEDC4FokX4BAQ?=
IronPort-Data: A9a23:ZRsXhqzlW8XRM2G7NgR6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUHz
 msZCm7UOP+OYzH2L4p+PY+2/UsFusfUyYcxHldrrVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYlajtMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFgYLb0iweR6Ojlx2
 MYCJyxKdjmSvtvjldpXSsE07igiBMDvOIVavjRryivUSK59B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiYC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZgOKxYYWJJ4TTLSlTtheYm
 2DjonXHPjwLKfyB7GKb6W3229aayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7CQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:NpIpbaiQgW2Ms7PYsO87YtpSKnBQXgQji2hC6mlwRA09TyVXra
 +TdZMgpHnJYVcqKRYdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILXFuFfBOLZqlWKcREWtNQtsJ
 uIGJIRNDSfNzRHZO/BkXCF+q4bsbq62ZHto/vCxHFwSgwvQaRh4wBlTju/KCRNNXF77V5TLu
 vn2iKBzADQAkgqUg==
X-Talos-CUID: =?us-ascii?q?9a23=3AbWgJkmtGITwhf/TsRQSIS/7f6Is8XG3t9kzSLnT?=
 =?us-ascii?q?gNktTUrKJDke56Zpdxp8=3D?=
X-Talos-MUID: 9a23:K2lcegglnWGClE9iCIpW9cMpZcdV4YHzGX4xvIQbm9ehbTJrJG3AtWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,255,1779148800"; 
   d="scan'208";a="824974501"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Sep 2026 08:54:16 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id E0326180001F5;
	Tue,  1 Sep 2026 08:54:15 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 7D651CE1C04; Tue,  1 Sep 2026 01:54:15 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch v2 2/5] libssh: Fix CVE-2026-59844
Date: Tue,  1 Sep 2026 01:53:54 -0700
Message-Id: <20260901085357.1254306-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260901085357.1254306-1-hthakar@cisco.com>
References: <20260901085357.1254306-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 08:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129622

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
index 000000000..ac380622d
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
index 10d063f6d..5c40b80b4 100644
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


