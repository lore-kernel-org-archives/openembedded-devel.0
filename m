Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3092.1795169800065501548
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Mj3hC1aj;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3180; q=dns/txt;
  s=iport01; t=1795169800; x=1796379400;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9egOjv3WhokmS1NsJ9wa+1doG29jIg0rl/ztw3xG9zQ=;
  b=Mj3hC1aj2UHkkDmsZXB5nc6+JzWt9oQfEr6rW2us5Z9dKUxKG7WJvK3p
   s8DkPxCPpEfq6yadNRvXmgCj9tav5nJnv0cL2rWGI1neCdTDIjHOtoVwp
   KJ/CK7SDsmIkwdNZlYY02uFD+M3aSnRR7MeUie1mcOe6tGpPOvEUQ/wJz
   gEPgYPz5PeNXXgwEAY0rjxOIkQF62pQiOK82VGRkY3qFZKNVyZ5RvRLoC
   loZluiv0XQohI3JtEFrRiSx+xcjvISk0wJsv1+UfNgL7ihtiRCEe1VeP+
   FiEKexoij492zvrh5Wew1dYhmaSfMdlb+Z+q39T52LNm+QvlwCt30IILI
   g==;
X-CSE-ConnectionGUID: aLO5DbCHT7SWu/I8sp2B8Q==
X-CSE-MsgGUID: 0IhvKvMdT9OCe1+/S2J41A==
X-IPAS-Result: =?us-ascii?q?A0BHAgDAHABr/9NK/pBaHgEBCxIMggULgld1YUJJA5Vcb?=
 =?us-ascii?q?ItpkkOBfg8BAQEPRA0EAQGFBY4jAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBKgsBGAEtLAMBAk8LIyGDAgGCOgM3AgERu?=
 =?us-ascii?q?QOBeTOBAYMpAYFU2EwNgloBCxQBBYEzhUKDAIUkXRgBhH0nGxuBcoEVg2qBB?=
 =?us-ascii?q?YEaQgKIJgSCIoEMgVSNFwKBT4gmSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdg?=
 =?us-ascii?q?SM7F4EHGwYFgRyBHoESgQNdgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnH?=
 =?us-ascii?q?x4bDgIfEAYNGA1IESw3FRkEPm4Hk2yCeSCBDgEqAXttRAaTa5IEgTWea3EKK?=
 =?us-ascii?q?IN5jCSPPoV8GjOFW6UXC5h9jgqECpF3UIRqgWg8gVlwFYMiCUoZD44vCguDY?=
 =?us-ascii?q?IVkyHcjNQIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:RNfshandndKLTJW5pMgH4Obo5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOWDvTP/2PZGCkKt4gb4+290wA6paEyt81Ggpu+ylgRltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsfra8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYQ83btbC0puy
 aMjFy1KT0CYn7ickIvuH4GAhux7RCXqFIoSoDRkiDreF/tjGMiFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUQWUrsUIMpWcOOAj2LneiddoUi9rqss6G+Vxwt0uFToGISPKoPWHpsE9qqej
 jrn/3raHDQWCI244jfcsTWX3M2TxAquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:NsrprK5OEXUoxhUGdwPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AqSubJGgTV571TXldvAbDcdeOajJue1n6kVvaCG+?=
 =?us-ascii?q?EVl1WVfq0GUSIook0qp87?=
X-Talos-MUID: 9a23:e5K0JAkrMqQ/TjMdS3r7dno6Fcd2wLqLBHxctr4L4orDDnZSZ2602WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="62874369"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:16:36 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id CE70E180001E9;
	Fri, 20 Nov 2026 10:16:35 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 84D9FCC1634; Fri, 20 Nov 2026 02:16:34 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [meta-python][wrynose][PATCH] python3-h2: fix CVE-2026-71554
Date: Fri, 20 Nov 2026 02:16:14 -0800
Message-Id: <20261120101614.2132630-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 12:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132773
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream h2 4.4.1 backport for CVE-2026-71554.
The upstream fix commit is referenced in [1], and the public CVE
advisory is referenced in [2].

[1] https://github.com/python-hyper/h2/commit/292a40829feefda98c8509dcdbbb4a57af9bd6a6
[2] https://github.com/python-hyper/h2/security/advisories/GHSA-6hr6-w5qg-qmwg

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../python-h2/python3-h2/CVE-2026-71554.patch | 37 +++++++++++++++++++
 .../python-h2/python3-h2_4.3.0.bb             |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-h2/python3-h2/CVE-2026-71554.patch

diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2/CVE-2026-71554.patch b/meta-python/recipes-connectivity/python-h2/python3-h2/CVE-2026-71554.patch
new file mode 100644
index 0000000000..298b15c30c
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2/CVE-2026-71554.patch
@@ -0,0 +1,37 @@
+From ee1c64859fcb622f7cc3f0ff428c915ce6448e9b Mon Sep 17 00:00:00 2001
+From: SunandM <sunandm22@gmail.com>
+Date: Mon, 3 Aug 2026 13:28:23 +0200
+Subject: [PATCH] reject duplicate Host headers in request headers
+
+Duplicate Host headers are now rejected with a ProtocolError.
+This addresses a request smuggling primitive where a consumer
+downgrading HTTP/2 to HTTP/1.1 would emit two Host header lines,
+causing backend divergence (CWE-444).
+
+The _validate_host_authority_header() function now counts Host
+headers and raises ProtocolError if more than one is present,
+covering both the receive path (_check_host_authority_header)
+and the send path (_check_sent_host_authority_header).
+
+CVE: CVE-2026-71554
+Upstream-Status: Backport [https://github.com/python-hyper/h2/commit/292a40829feefda98c8509dcdbbb4a57af9bd6a6]
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ src/h2/utilities.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/h2/utilities.py b/src/h2/utilities.py
+index a7409b3..85e7771 100644
+--- a/src/h2/utilities.py
++++ b/src/h2/utilities.py
+@@ -427,6 +427,9 @@ def _validate_host_authority_header(headers: Iterable[Header]) -> Generator[Head
+         if header[0] == b":authority":
+             authority_header_val = header[1]
+         elif header[0] == b"host":
++            if host_header_val is not None:
++                msg = "Request header block has multiple Host headers."
++                raise ProtocolError(msg)
+             host_header_val = header[1]
+ 
+         yield header
diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb
index 4034ffe7c1..dce1b0f150 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aa3b9b4395563dd427be5f022ec321c1"
 
+SRC_URI += "file://CVE-2026-71554.patch"
 SRC_URI[sha256sum] = "6c59efe4323fa18b47a632221a1888bd7fde6249819beda254aeca909f221bf1"
 
 inherit ptest-python-pytest pypi python_setuptools_build_meta
-- 
2.35.6

