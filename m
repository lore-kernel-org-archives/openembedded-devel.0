Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA6CCA5FAD
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:42 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63551.1790617414307827365
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IWhQ8/IU;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3842; q=dns/txt;
  s=iport01; t=1790617414; x=1791827014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3OtC1uqMDPlv7sfhKLheWMaTnjKivARoEd9XMAR+nqc=;
  b=IWhQ8/IUglaKXdBGPkCYOIcfAj8/BXnEzAiLM26uUQh8+YtqhFUBnJzh
   UDf+dGjH2LUYWD+APOwEwMuIpDH2Mfo0Kkt6RKi2DvXaSLwytWx7DL3uG
   LBAU1T+Fzyl0vqF6KMl84gRrsRBBNgiTG2BKEyjhYfvcBEqhbGNCbYir9
   Hb2yAeKm6xKASF67EUm+9eSN5K8ZGW9xjSzbbnFrLmIzjftDNvPoe2Dan
   91cN4g+1YCynJFtjr0jf156ijn323vaMHq6jpmWoViRXYj9SVs41nQlKQ
   /WyRhUDagnx+hlhM5/1VamcD1udUpaBAGCMqUPY9ZHjK7bRCu6WZ5LF62
   A==;
X-CSE-ConnectionGUID: K9M+lodJQr+yzM7fPPLzhg==
X-CSE-MsgGUID: AIq3dWXBSQSSPjZ1IGUavA==
X-IPAS-Result: =?us-ascii?q?A0BHAgC9prpq/47/Ja1aHgEBCxIMggULgld1YENJlkoDn?=
 =?us-ascii?q?hqBfg8BAQEPRA0EAQGEP0YCjgkCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDMgEYAS0QHAMBAi8rIwgZgwIBgnQDEcJFg?=
 =?us-ascii?q?iyBAYMpAT8CQ1DbMgELFAGBOIVAiCNdGAGEfCcbG4FyhH6BBYFcAQGIJQSCI?=
 =?us-ascii?q?oEMgVqTQ0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBBxsGBYEdgSCCG?=
 =?us-ascii?q?SMZNnqBCV6BKylgARAXgQeCBwKCVIIBAgFJQw4HRVMJJUEKEkcmIggSCQETG?=
 =?us-ascii?q?jALgSE4QQkoERgNSBEsNxUZBD5uB5AuHoJlAYENAQohf4EVKQ2TNJADgiGhD?=
 =?us-ascii?q?woog3aMIpU6GjOEBIFXkkCSVAuYfY4KllCEaYFoPIEoGwQLB3AVgyIJShkPj?=
 =?us-ascii?q?jmDa4F/yjonMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:dtbcd6CpAhxLzRVW/3niw5YqxClBgxIJ4kV8jS/XYbTApDol02QFn
 TZLWjuFbqrcZjCjKI1xa9u1pk8Ou5HdzIM2OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYA7/i2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE4KRLT0UxMa8h4KVmE0QR+
 8QgDCINYUXW7w626OrTpuhEnM8vKozveYgYoHwllWyfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY1BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FErj+m3a4OPIbRmQ+18v1/Dq
 l321V/AOSoiNu7G6BW4+2yF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvkCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXEIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:TlnUQKBn1T6TKAblHemO55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: 9a23:F99CL25W1sgpH05gEtss1x8xWcQifl/k1jTBMWrnB15RbK+VRgrF
X-Talos-MUID: 9a23:cYni+QkGSJG2pdUybHgcdnpLFd4z75ueIns0qq4+ufvdFANNMim02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="527923123"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 17:43:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 85AA318000357;
	Mon, 28 Sep 2026 17:43:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 2EAD1CBF203; Mon, 28 Sep 2026 10:43:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 03/13] python3-aiohttp: fix CVE-2026-34517
Date: Mon, 28 Sep 2026 10:43:13 -0700
Message-Id: <20260928174323.1810308-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260928174323.1810308-1-dkelaiya@cisco.com>
References: <20260928174323.1810308-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130454

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix shown in [1]. The
advisory identifying the fix is referenced in [2].

[1] https://github.com/aio-libs/aiohttp/commit/cbb774f38330563422ca0c413a71021d7b944145
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-34517

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-34517.patch      | 65 +++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34517.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34517.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34517.patch
new file mode 100644
index 0000000000..577df52b0a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34517.patch
@@ -0,0 +1,65 @@
+From 70f4c611ec466b6a33f1bce57d5776fac964919f Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Tue, 10 Mar 2026 22:14:02 +0000
+Subject: [PATCH] [PR #12216/9cc4b917 backport][3.13] Check multipart max_size
+ during iteration (#12229)
+
+**This is a backport of PR #12216 as merged into master
+(9cc4b917c54833a22f65edae7963d16a6eeb1f54).**
+
+---------
+
+CVE: CVE-2026-34517
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/cbb774f38330563422ca0c413a71021d7b944145]
+
+Backport Changes:
+- Replaced BodyPartReader.decode_iter() with aiohttp 3.9.5's
+  synchronous decode() API. Form-data does not support content
+  compression, so this preserves upstream's single-decode behavior
+  after bounded chunk reads.
+
+Co-authored-by: Sam Bull <git@sambull.org>
+(cherry picked from commit cbb774f38330563422ca0c413a71021d7b944145)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ aiohttp/web_request.py | 19 +++++++++++++------
+ 1 file changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/aiohttp/web_request.py b/aiohttp/web_request.py
+index 2ec09565c..f9de59573 100644
+--- a/aiohttp/web_request.py
++++ b/aiohttp/web_request.py
+@@ -760,17 +760,24 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+                         out.add(field.name, ff)
+                     else:
+                         # deal with ordinary data
+-                        value = await field.read(decode=True)
++                        raw_data = bytearray()
++                        while chunk := await field.read_chunk():
++                            size += len(chunk)
++                            if 0 < max_size < size:
++                                raise HTTPRequestEntityTooLarge(
++                                    max_size=max_size, actual_size=size
++                                )
++                            raw_data.extend(chunk)
++
++                        # aiohttp 3.9.5 has synchronous BodyPartReader.decode()
++                        # and form-data does not support content compression.
++                        value = field.decode(raw_data)
++
+                         if field_ct is None or field_ct.startswith("text/"):
+                             charset = field.get_charset(default="utf-8")
+                             out.add(field.name, value.decode(charset))
+                         else:
+                             out.add(field.name, value)
+-                        size += len(value)
+-                        if 0 < max_size < size:
+-                            raise HTTPRequestEntityTooLarge(
+-                                max_size=max_size, actual_size=size
+-                            )
+                 else:
+                     raise ValueError(
+                         "To decode nested multipart you need " "to use custom reader",
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index d7c7a5014a..fecf871d9f 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -23,6 +23,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-34518.patch \
            file://CVE-2026-34519.patch \
            file://CVE-2026-34516.patch \
+           file://CVE-2026-34517.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6


