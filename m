Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12765.1795503408590618577
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ejtGPFPY;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6018; q=dns/txt;
  s=iport01; t=1795503408; x=1796713008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p9DKGTkzz8viqTyngF1YM6Dxl/BZZTvecSxKQHBpdi4=;
  b=ejtGPFPYp6iJOh7iyB2Gqc6VS/obkcfqJ+pLrtXkSxC7uwwT9ru4npve
   RyjTK93UWAQ8b5MEgRBLwT5w6k468c39hJXKn+fFHkg229VMWtuJumQj1
   ff+ecQ9U/hewLkdG7rGhblAdZcXOcYU/EbYRbgEnhcEU9YFcHE2eF2Yn1
   x+h3Cjy8U/v8VQlIU58ERemmlbWM2OVW18C1yfY+BCpyTzh0TL2wCa8L4
   adeYms76ppWAk/nqdp0w95xaprU0Rbc1FBrfsz3m2ulPG3g4exg16xOxe
   umkxUcsgSeHt536Uf9lfQfl/arWoOKwZtAqw0AmbWGniZ6bqC5GUmr8wB
   w==;
X-CSE-ConnectionGUID: CgkSV2GGR66uoRJcGhIFfg==
X-CSE-MsgGUID: fUrbcKr/SJ2CzahA1kRjFA==
X-IPAS-Result: =?us-ascii?q?A0BKAgC/NAVr/9JK/pBaglmCV3VhQkkDlkgDgROKU5JDg?=
 =?us-ascii?q?X4PAQEBDy4WDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMBMQFGEBwDAQIvIAcEIwgZgwIBgjoDNwIBE?=
 =?us-ascii?q?botGzeCLIEBg25AUNhMDYJaAQsUAQWBM4VCgwCFJF0YAYR9JxsbgXKBFYJ0d?=
 =?us-ascii?q?oEFgRpCAQGBOBKGXASCDRWBDIFUGAZkjBUCgU+ISUiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDXYErKF0BIYEIgXYCglGCAAIBS?=
 =?us-ascii?q?UEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kL?=
 =?us-ascii?q?wUaJj4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD5uB5QUgh58Fk0rARMIE?=
 =?us-ascii?q?CKBSRIvERGTMJACgiGgIHEKKIN5jCSNPoIAhXwaM6pyC5h9iRyEbhaDdJFfa?=
 =?us-ascii?q?IRqgWg8gVlwFYMiCUoZD445g2vOWyM1AgkDLwEBBwIHDgMLgWiQAQEmB4FPA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:ywm2E6M4DYQQx/nvrR3ylsFynXyQoLVcMsEvi/4bfWQNrUp2hjcDy
 GRJWmiGbv2MZmPzeN91b4/ioU8E6peBzdQ3HHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gWIsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj695hD3oIZ6I3wLgpHGZ01
 /c3KBEjYB/W0opawJrjIgVtrs0uNozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2M3BPjDS0Un1lM/AYkmlf2tj2PXeDxDo1XTrq0yi4TW5FIrj+CxaYKEEjCMbctohEyTh
 XiBxEajKQMTNPXGygCH3Fv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvuS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6tV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:CdXm2qugUCnQbT+XdcHFXdlj7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:1Gr0b2GVLzmHwl1+qmJM+00vJJoKXUeDkmrXGW2zJmZIZrOaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AhqOwDA0QTte2RG/ygcsIbDxa/jUj7Zm0Aksui9I?=
 =?us-ascii?q?9mZOvJyVwEm6etjaZa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62704109"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 06:56:44 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id 443B41800012A;
	Tue, 24 Nov 2026 06:56:44 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id D6CFFCC2EF1; Mon, 23 Nov 2026 22:56:42 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [meta-oe][wrynose][PATCH 2/2] rsyslog: Fix CVE-2026-61548
Date: Mon, 23 Nov 2026 22:56:38 -0800
Message-Id: <20261124065638.3724216-2-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124065638.3724216-1-asparmar@cisco.com>
References: <20261124065638.3724216-1-asparmar@cisco.com>
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132931
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

Backport the targeted mmpstrucdata parameter-buffer correction
recommended by the rsyslog maintainer for stable branches. Replace the
fixed stack buffer with an allocation bounded by the input length and
free it on all exit paths, preserving rsyslog 8.2512.0 APIs.

Keep the cached structured-data length wide enough for messages above
64 KiB so buffer sizing uses the complete input length.

mmpstrucdata is not enabled by the stock recipe. This source correction
also covers downstream builds that explicitly enable the module and
configure it to parse large structured-data messages.

Upstream fix:
https://github.com/rsyslog/rsyslog/commit/bcda60a3692efdf0c8e44102528f5a0ebe0dec6d
Stable-branch backport guidance:
https://www.openwall.com/lists/oss-security/2026/07/20/1

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsyslog/rsyslog/CVE-2026-61548.patch      | 101 ++++++++++++++++++
 .../rsyslog/rsyslog_8.2512.0.bb               |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-61548.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-61548.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-61548.patch
new file mode 100644
index 0000000000..edd31769b3
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-61548.patch
@@ -0,0 +1,101 @@
+From d68f0cb23e368c3609e9aa67c877ac0395d5d6a3 Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Tue, 2 Jun 2026 12:00:15 +0000
+Subject: [PATCH] mmpstrucdata: support custom SD containers
+
+Why:
+Operators need parsed RFC5424 structured data below a predictable
+JSON object name, and old large structured-data messages could exceed
+module-local assumptions.
+
+Impact:
+Adds two action parameters, expands structured-data length storage,
+and enables mmpstrucdata in the Ubuntu 26.04 TSAN lane.
+
+Before/After:
+Before, mmpstrucdata always wrote `rfc5424-sd` and could fail on very
+large SD. After, the container is configurable and SD size is bounded.
+
+Technical Overview:
+- Add `container` with default `rfc5424-sd`.
+- Add `maxStructuredDataSize`, defaulting to global max message size.
+- Store message structured-data length as `rs_size_t` instead of 16 bit.
+- Allocate parameter-value parse buffers from the actual SD length.
+- Preserve RFC3164/no-SD skip behavior and represent RFC5424 NILVALUE
+  as JSON null under the configured container.
+- Document RainerScript and YAML usage and add parameter reference pages.
+- Add focused regression tests for custom containers, NILVALUE, large SD,
+  oversized SD, and RFC3164 skip behavior.
+- Remove the old mmpstrucdata TSAN suppression and codify container
+  clean/rebuild guidance for local validation.
+
+Special credits:
+Bogoslovskii Fedor provided good analysis that facilitated parts of the
+implementation.
+
+Closes https://github.com/rsyslog/rsyslog/issues/3297
+Closes https://github.com/rsyslog/rsyslog/issues/1891
+
+With the help of AI-Agents: Codex
+
+Co-authored-by: Bogoslovskii Fedor <Fedorasta@gmail.com>
+
+CVE: CVE-2026-61548
+Upstream-Status: Backport [https://github.com/rsyslog/rsyslog/commit/bcda60a3692efdf0c8e44102528f5a0ebe0dec6d]
+
+Backport Changes:
+- Limit this backport to parameter-buffer allocation and cleanup plus
+  cached structured-data length widening, which keeps the allocation
+  length valid for messages above 64 KiB.
+- Omit custom containers, the new structured-data size setting and
+  unrelated module changes from the broader feature commit, together
+  with its documentation, CI and test changes.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ plugins/mmpstrucdata/mmpstrucdata.c | 4 +++-
+ runtime/msg.h                       | 2 +-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/plugins/mmpstrucdata/mmpstrucdata.c b/plugins/mmpstrucdata/mmpstrucdata.c
+index 5228424..445fb8f 100644
+--- a/plugins/mmpstrucdata/mmpstrucdata.c
++++ b/plugins/mmpstrucdata/mmpstrucdata.c
+@@ -240,7 +240,7 @@ static rsRetVal ATTR_NONNULL()
+     parseSD_PARAM(instanceData *const pData, uchar *sdbuf, int lenbuf, int *curridx, struct json_object *jroot) {
+     int i;
+     uchar pName[33];
+-    uchar pVal[32 * 1024];
++    uchar *pVal = NULL;
+     struct json_object *jval;
+     DEFiRet;
+ 
+@@ -254,6 +254,7 @@ static rsRetVal ATTR_NONNULL()
+         ABORT_FINALIZE(RS_RET_STRUC_DATA_INVLD);
+     }
+     ++i;
++    CHKmalloc(pVal = malloc(lenbuf - i + 1));
+     CHKiRet(parsePARAM_VALUE(sdbuf, lenbuf, &i, pVal));
+     if (sdbuf[i] != '"') {
+         ABORT_FINALIZE(RS_RET_STRUC_DATA_INVLD);
+@@ -265,6 +266,7 @@ static rsRetVal ATTR_NONNULL()
+ 
+     *curridx = i;
+ finalize_it:
++    free(pVal);
+     RETiRet;
+ }
+ 
+diff --git a/runtime/msg.h b/runtime/msg.h
+index 9a66e88..0ed6efd 100644
+--- a/runtime/msg.h
++++ b/runtime/msg.h
+@@ -89,7 +89,7 @@ struct msg {
+         char *pszTIMESTAMP_MySQL; /* TIMESTAMP as MySQL formatted string (always 14 characters) */
+         char *pszTIMESTAMP_PgSQL; /* TIMESTAMP as PgSQL formatted string (always 21 characters) */
+         uchar *pszStrucData; /* STRUCTURED-DATA */
+-        uint16_t lenStrucData; /* (cached) length of STRUCTURED-DATA */
++        rs_size_t lenStrucData; /* (cached) length of STRUCTURED-DATA */
+         cstr_t *pCSAPPNAME; /* APP-NAME */
+         cstr_t *pCSPROCID; /* PROCID */
+         cstr_t *pCSMSGID; /* MSGID */
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
index f132f4a764..23fa7b7146 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://CVE-2026-19654.patch \
            file://CVE-2026-19654-regression.patch \
            file://CVE-2026-55556.patch \
+           file://CVE-2026-61548.patch \
 "
 
 SRC_URI:append:libc-musl = " \
-- 
2.35.6

