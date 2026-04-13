Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BD4E64007
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 11:23:30 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.269422.1776079400844329437
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 04:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VYCgKZjB;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=843; q=dns/txt;
  s=iport01; t=1776079400; x=1777289000;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PHJtcWJ5q9GW/WM174NOByLSOvUaECMyE0FBlh4Ag1o=;
  b=VYCgKZjBKhQOyQealgbWponKD/GwVmDqjsVerzyM7+Bvys6/CDxxogYI
   4u5SXrPyggTi7qPiylDvhjctN0h+4o66obpalLlZE8894K2ZbZApHLDgT
   3/qb0/NTLJU/bk9t+QO8oPG6SkzAHFZrVAcsHkDeNbGxrhahgsgsvaWBJ
   yOI6DCNlaKB1rC4iMOSuK0Pij8uwh35C6ah26V4WOBVaDySIPg8C/veia
   uFEEuQ1FaBLHKGaMAVJwhN0SNmfpK/8ae/CKr2iKr7cUtKmuiW+06a4Yq
   tejh77X98BGRuiPn+44pGkhQJ1DkI7PogYpNb1I2gAoRIaie0sVi0tscq
   Q==;
X-CSE-ConnectionGUID: 6VDOAOj3ShCorN6kgwOSEg==
X-CSE-MsgGUID: y+GBIyeZQ9isFX6R8V1Vng==
X-IPAS-Result: =?us-ascii?q?A0DEAgBE0dxp/43/Ja1aglmCV3FeQ0mTWgGhDYF/DwEBA?=
 =?us-ascii?q?Q83GgQBAYUHjSwCJjUIDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGXTYBGAEtMFxEgwIBgnMDsg6CLIEBgygBgVPbJgELFAGBOIU+i?=
 =?us-ascii?q?ByFbicbG4FyhH2FEIV3BIIigQ6BfoETBoxASIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4EMGwcFgUuFR3RtgRODbIECAwsYDUgRLDcUGwQ+bgeKaiOCO?=
 =?us-ascii?q?HQagmmjQoIhoQ4KKIN0jB6VOhozqmsumFikWYRogWoCOIFZcBWDIglJGQ/TU?=
 =?us-ascii?q?yYyAj0HAgcOApNwAQE?=
IronPort-Data: A9a23:dx7N7qzj4B91fCILDtF6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkVVn
 GJJCjuDPqmDa2OketAiaoTl/BxX6pLRx9IwQQc4+1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4iaT/H3Ygf/hWYoazlMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJB8IEaox3eQsOmFl8
 uY+djMCcTe4qu3jldpXSsE07igiBNPgMIVavjRryivUSK56B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOnWjOX9PYH46tOeqj3X4dRVTqUmeouw85G27IAlZj+GxYIKPIYLULSlTtlfbi
 Ujn7mnLO0AbL/KvlwDVzCuSgOCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7FQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:zpkK6Kqy12jVVvfjw4rN4QQaV5odeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjizEht7t2uqUuEimpRGsZd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3AlnIQt2hGpb9KI0xunfVNzpNttzJuLEPx6173IRS?=
 =?us-ascii?q?DCU1uUpvLSlCP35hJnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AgdtjoA7+Dc5Crdq1y3DU3aMVxox5oIuEKVEAo6x?=
 =?us-ascii?q?XutKqBXJKawnEsjK4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,177,1770595200"; 
   d="scan'208";a="714802366"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Apr 2026 11:23:20 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id F054118000182;
	Mon, 13 Apr 2026 11:23:19 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 99112CC1288; Mon, 13 Apr 2026 04:23:19 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-oe] [master] [PATCH] augeas: Add CVE_PRODUCT to support product name
Date: Mon, 13 Apr 2026 04:23:13 -0700
Message-Id: <20260413112313.1825573-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 11:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126274

From: Himanshu Jadon <hjadon@cisco.com>

- Set CVE_PRODUCT to align with the NVD CPE and ensure correct CVE
reporting.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta-oe/recipes-support/augeas/augeas_1.12.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/augeas/augeas_1.12.0.bb b/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
index 14e818253b..10a3cf5fe1 100644
--- a/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
+++ b/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
@@ -33,3 +33,6 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 
 EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "augeas:augeas"
-- 
2.35.6


