Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06936F417F6
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 15:01:40 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16677.1773068490917731598
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 08:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VVCunzC4;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=792; q=dns/txt;
  s=iport01; t=1773068490; x=1774278090;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hYe1ndueOVllxsAC07dMp8Pqcl2nW1fvQUJM+UHZNdw=;
  b=VVCunzC4r7M0O/5I0auGHCX0aggbM4VkwsA8QcH/h5iDP/0phVG5nrim
   3yBQJn+N/3RLZ8KYBpXn2N1ci7vHF2ugYlv1rqHa8Pl1XSd5Oqdb/V5Aj
   cIuPe95926JOQdHTQMcQ7hbbO/EahKBsjPAg+3beYEPYHOM7iPHW34/70
   m5HNLQ6AQ25fvjMnvYGPRcoys0kixu/OCCRixtz2Uk0FH5kUVxXe6ymwa
   fjqErFnmKUGMeFGyfgmEaFMLDAYb0Ptqo/3uhdNJLOlH5wHC6DaxrTz4i
   VAejnEdmSrqhbGKwdR1/FLa/7XACuuBFXuK4N9paT6GJGL4QfoIxYSZ/6
   w==;
X-CSE-ConnectionGUID: 8EneZ/8ARcCxnhRPiHJI2Q==
X-CSE-MsgGUID: QhNNBz3bRXm29WeNhR+1Ow==
X-IPAS-Result: =?us-ascii?q?A0DZCgC6365p/4z/Ja1aglmCSA9xX0JJk1tPhSKIZpI2g?=
 =?us-ascii?q?X8PAQEBDzEgBAEBkikCJjUIDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThlyHEwEYAV1RCxkrgwIBgjoDNgIBrQKCLIEBgygBgVPYRw2CU?=
 =?us-ascii?q?gELFAGBOIU8gnmFIHSCAIJ6JxsbgXKEfYIfgnGFdwSCIoEOgXmRIkiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYUgD4hydG6BE4MDAwsYDUgRL?=
 =?us-ascii?q?DcUGwQ+bgeNaj6VfgmDHpJpgTWeaHEKKIN0jB6PPgaFdhozqmuZBpISkWpdh?=
 =?us-ascii?q?GiBaQE6gVlwFYMiCUkZD45fzGkjNQI6AgcLAQEDCZNnAQE?=
IronPort-Data: A9a23:q0PUhak7/VJxEeLpF5nmylLo5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNDD/QMveKZWOneox1OYrl8BkA7J/Szd9rTgA6+X1hHltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpPs/Pb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fd01/OtFRjFnz
 /czODYNVCiCp8CXmovuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKLKobbHZUPwRrwS
 mTuxmTfJDsIb9al+T/fo02hoO/13nrcR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmUHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:PR1u9aAGAC9by57lHem555DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEGmnhrGSpwEJ3EbFh4tg6Z
 s=
X-Talos-CUID: 9a23:o+NYdWHH1KoY7h1+qmI32UgZKId1W0fW52fWI3WACEZLaeesHAo=
X-Talos-MUID: 9a23:lGFEBgivN8sqv3G8EKfGKcMpDcdOxY68U0o3oZBc6vaJEyxKeG66k2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,109,1770595200"; 
   d="scan'208";a="682908274"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Mar 2026 15:01:30 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 18AC718000588
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Mar 2026 15:01:30 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id B418CCC12B5; Mon,  9 Mar 2026 08:01:29 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][scarthgap][PATCH 2/2] nativesdk-pistache: dependency with brotli
Date: Mon,  9 Mar 2026 08:00:54 -0700
Message-Id: <20260309150054.3436741-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 15:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124999

From: Christos Gavros <gavrosc@yahoo.com>

Building of nativesdk-pistache aborted due to
missing dependency with brotli.
Fixed by extending brotli recipe to build nativesdk

Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cf95ee0ff541289c9423e463b1ee607b642ad1f0)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb b/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
index 83f44833b6..32524094c6 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
@@ -20,4 +20,4 @@ do_install:append () {
 	done
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.44.1


