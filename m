Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30267.1793869209536501694
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FYfVxInS;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1785; q=dns/txt;
  s=iport01; t=1793869209; x=1795078809;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Jw3kyOtRWlv3/5EoYOakCtyLkbdiCM0QHpfYskLHZQo=;
  b=FYfVxInSbJJfyTDWXJfTPyzVGsKY+deRJBEHCRO2Bcg00JiNMBxfBIW+
   tfX9BbaS4woSzlP6uH/KFcIE8pI2USf3kBpxVRSgJJmvcNQ3wCxIBZCKA
   /1wlONimro3WdyRXVuhDVnheCSoPdxl8vNcrwTXznAfNFcUbP4MwSJmWK
   UBgUmiPQzeZCOJlX1eeh6kEsbY3QEbfZdes/eWn4fwKz2vUxnBFcPqK1r
   E1Y/dSMqoDcVH9CMu2RyvQE+QurFOBokta5M3qZEu10g8+7cmuj8L3Uc+
   vvYDL6oZZDs8b8MKQLuqxUMSbWiAZzlDDhJhxuDzNqaoFxHag0+rdDRvm
   w==;
X-CSE-ConnectionGUID: NkU8UN7fQ4e5vDtB452Mtw==
X-CSE-MsgGUID: VMLK904US72uFRzeCcQs5A==
X-IPAS-Result: =?us-ascii?q?A0D+AgDGROxq/43/Ja1aglmCV3VgQ0kDlCeCIQOBE50Og?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhD9GAo4dAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZATAgEDMgEYAT0gMSsdAQ0ZgwIBgnQDEbwxgiyBAYMpA?=
 =?us-ascii?q?YFU2zMBCxQBgTiFQIgjdQGEfScbG4FygRWCc3aBBYFcAoEngQaFeQSCIoEMg?=
 =?us-ascii?q?XiMeohFSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESg?=
 =?us-ascii?q?QddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJ?=
 =?us-ascii?q?j8VDGQLGgVhCAINDHI5EDAeJC8FHCZAGwoYGA1IESw3FRkEPm4Hki+DEXsTL?=
 =?us-ascii?q?ASCKAWTB5JqoREKKIN4jCSVOhozqnELmH2OCpZRhGmBbw0ogVlwFYMiCUoZD?=
 =?us-ascii?q?445g2vOWyYyAgkDLwEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:mZkeKaAW9716hBVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApGsr12YBn
 GYcDDzQPq2PNjHzKY8iaork/U9Uv8fUmNNjOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9h2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE5fZTXHwQYoMhpusqH01S3
 6BFchURcUXW7w626OrTpuhEnM8vKozveYgYoHwllW2fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY2BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237kVAqgee3b4WPEjCMbftwumXJ/
 j77xDujHz8gJtG0wgOer1v504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KIpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:cKdf9qC/h50p0m7lHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:YeQhKmwjrPG/25lQd4SDBgUyGf11T1uCwk6MLhKmJXpDFODPbEOPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AkT4rHAxtBuoeEaFfhf3eTyrnq46aqJqLLGNcyck?=
 =?us-ascii?q?7gJbeKAJKKTq2hw2sH6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="543972772"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 95BF3180015C3
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id AF87CCBEF7D; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 18/18] python3-virtualenv: Ignore CVE-2026-113724
Date: Thu,  5 Nov 2026 01:00:07 -0800
Message-Id: <20261105090007.351866-19-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131892
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- The advisory [1] describes a deletion-error callback changing the
  permissions of a symlink target.
- In 21.2.1, safe_delete() always passes ignore_errors=True to
  shutil.rmtree(), which disables the supplied error callback.
  This remains true after the existing security backports.
- Upstream enabled that callback later in [2]. The chmod recovery
  path fixed by [3] is therefore unreachable in this recipe.

Reference:
[1] https://github.com/pypa/virtualenv/security/advisories/GHSA-43mp-35q3-x3fq
[2] https://github.com/pypa/virtualenv/pull/3222
[3] https://github.com/pypa/virtualenv/commit/2bfdc0230d1b2685fedfcfe66c835b9a2ec7c440

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index b554c3a4f8..d5f598e576 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -56,3 +56,4 @@ CVE_PRODUCT = "virtualenv"
 # The batch activator only supports Windows interpreters.
 CVE_STATUS[CVE-2026-102937] = "${@'not-applicable-platform: Windows cmd.exe batch activation is not selected for Linux interpreters' if (d.getVar('TARGET_OS') or '').startswith('linux') else ''}"
 CVE_STATUS[CVE-2026-113718] = "not-applicable-config: Xonsh activation was introduced in virtualenv 21.3.0 and is absent from 21.2.1"
+CVE_STATUS[CVE-2026-113724] = "not-applicable-config: safe_delete() uses ignore_errors=True, so its chmod error callback is unreachable"
-- 
2.35.6

