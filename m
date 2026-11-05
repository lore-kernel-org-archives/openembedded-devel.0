Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30270.1793869212002803767
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RasHplzn;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1516; q=dns/txt;
  s=iport01; t=1793869212; x=1795078812;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Y08J+mfayLUwODAdNMY1pkKkCBrtbYXQM7jNUvuBAxc=;
  b=RasHplznpK5crSpPpCLfuBzOV4wFfQ/hFe/m2sBb0myVO4+eknL4Q3zG
   +sWsJ6o/3mtvGlfGzBqEK41WBRIt8J5DIFU41+pG+e0kAHktmlLlrDxGf
   8nQdW88JkNyoMocTKKCQjAYuoy3Dv5ghnQLkQ73amXYHynJYvWpOgCjEj
   ReAN3ebt+USyyOOHWb9fW/kunkuS6/vd9i4GscIehFRA7TjOamdKszQdH
   bWKPbE8KPTMvbolQV0TZzrCrN6LJbaueRZPfbMuICLO60nKo5CDhVxVGg
   7ZgTIRLW0Q0BapwnJNb8jHLScTKaJ/M1of8hIIbPnORoM1WThLpYO9JXt
   g==;
X-CSE-ConnectionGUID: 6yN1YX6UQpi5yT2pjr3jtA==
X-CSE-MsgGUID: 1CakMX2zRNepCBatnH7cCg==
X-IPAS-Result: =?us-ascii?q?A0A5AwBHRexq/43/Ja1aglmCV3VgQ0kDlCeCIQOgHw8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0YCjh0CJjcGDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBMCAQMyARgBPSAxKx0BDRmDAgGCdAMRvDGCLIEBgykBgVTbM?=
 =?us-ascii?q?wELFAGBOIVAiCN1AYR9JxsbgXKBFYNpgQWBXAKCLYV5BIIigQyBeIx6iEVIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyheI?=
 =?us-ascii?q?YEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZAsaB?=
 =?us-ascii?q?WEIAg0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL4MRgQ4sBByCDAWTB?=
 =?us-ascii?q?5JqoREKKIN4ihSCEJU6GjOqcQuYfY4KllGEaYF+JoFZcBWDIglKGQ+OOYNrz?=
 =?us-ascii?q?lsmMgIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:wIIK+q+tPmseEX44DOdbDrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mMYD2mAb/jcZDT9fox+OoSwoxwEu5SGnIU3GwBtri5EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazpIs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2loLKtBy9YpPFhW9
 KEJFGoVbArYhf6flefTpulE3qzPLeHxN48Z/3UlxjbDALN+HdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Qn1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCwbIGLK4bXHJw9ckCw/
 0nP/EHJWAMgEtGH4hCM7nSM2eTkknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjRCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r+z8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:hHgNO6wb0HKuOpUjeru5KrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:jwpgX2FnF9pvQtqIqmI55WhNK/B7T0TFzSrBHxWgC3wySqG8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AzCQ0aQ6hJUsQfCkr1uFeF2mxxowxyK2tLXBXg68?=
 =?us-ascii?q?gttGvHyVsPRfChx+4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="543692511"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 94365180015C2
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id AB87DCBEF7A; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 17/18] python3-virtualenv: Ignore CVE-2026-113718
Date: Thu,  5 Nov 2026 01:00:06 -0800
Message-Id: <20261105090007.351866-18-hthakar@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131894
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- The advisory [1] limits this issue to Xonsh activation in versions
  21.3.0 through 21.14.8.
- Version 21.2.1 has no Xonsh activator, activate.xsh template or
  registered entry point. None of the existing backports adds them.
- The upstream fix [2] changes the absent Xonsh quoting code, so it
  is not applicable to this recipe.

Reference:
[1] https://github.com/pypa/virtualenv/security/advisories/GHSA-394h-qwmc-48pf
[2] https://github.com/pypa/virtualenv/commit/e5fc2e6e189a877ff559af288919e3525d13e5e0

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index 1a8091adcc..b554c3a4f8 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -55,3 +55,4 @@ CVE_PRODUCT = "virtualenv"
 
 # The batch activator only supports Windows interpreters.
 CVE_STATUS[CVE-2026-102937] = "${@'not-applicable-platform: Windows cmd.exe batch activation is not selected for Linux interpreters' if (d.getVar('TARGET_OS') or '').startswith('linux') else ''}"
+CVE_STATUS[CVE-2026-113718] = "not-applicable-config: Xonsh activation was introduced in virtualenv 21.3.0 and is absent from 21.2.1"
-- 
2.35.6

