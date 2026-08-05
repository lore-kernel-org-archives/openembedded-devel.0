Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6516FC55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:02:11 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33570.1785906128183170730
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=I6Uc/Krw;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1460; q=dns/txt;
  s=iport01; t=1785906128; x=1787115728;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jkxiWSnGA8xuVIekqv4lVANaONqBSHyM1dl4Kmlt6a8=;
  b=I6Uc/Krw82JFeMuFWvQPgOFvEU1JU1CTvse3JIUuBVUgL/jLbz1R3pYo
   mR8IbNHmuBvArbMp0fc4Euu0DH29BHFEcaCwKtE1lIE0i8j1U6dZwyjxI
   CyBmSx0WjyGc2ulisJP8ahW9oOFACFU3klm8S9FakBI29IioJ3ZRby1hO
   vrz4/2ZmKXJkkMbQKiqNI3DfukgCUZPr3ilf1dOn5RCCth5aC3B/kWc1J
   mgqOAV2k4EOa3u8+cYbpRgVuK6R5GAIs0G2FDp1nJ1/YtOM35SLldEpBf
   lvBZjRH78aMm2mEa/POGYQFmwgraqovakN6XsdC3PYbx7hDzDMlGhprcv
   g==;
X-CSE-ConnectionGUID: favo//E4QRKfJI0WVp2ceg==
X-CSE-MsgGUID: +KIwu5pgRqWUaT6PBWEDkg==
X-IPAS-Result: =?us-ascii?q?A0BCAgBuwnJq/5UQJK1aglmCV3ReQ0mTWQGCBJ8KgX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNaAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZdKwsBGAEtMFxEgwIBgnQDvHKBeTOBAYMoAd0CAQsUAQWBM4U/i?=
 =?us-ascii?q?CF1AYR8JxsbgXKEfoJhAoEngQaFeASCIoEMklFIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQ0bBwWBHYEohG0jGTZ8gQlegS0qZAESF4EJgnsCgnpvC?=
 =?us-ascii?q?xgNSBEsNxQZBD5uB41oIIJAgQ4sliaRfKEPCiiDdYwhlToaM6psmQiLJ4Jjl?=
 =?us-ascii?q?lCEaYFoPIFZcBWDIglKGQ+OLhWDYMw5JzICOwIHAgcOAwuRaIF+AQE?=
IronPort-Data: A9a23:igIw7Kwd4TK9AWIAaLp6t+cwxyrEfRIJ4+MujC+fZmUNrF6WrkVSm
 2AeXz+PP6qDNmukfdt0PI+xoU0Fv8DdzoRlQFY+/FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaj5MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJE8/I4pfvcsrOFtt+
 945cA8zdkqIiu3jldpXSsE07igiBMDvOIVavjRryivUSK98B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiRC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZj+m9boWKIozbLSlTtgW7h
 33bonz2OAglCdWjlwKvzV+AheCayEsXX6pXTtVU7MVCn1SVyWkCIBMLV1qnuuT/gUm7M/pYM
 0ES9y8koKQ++UDuQtTjUhmQpH+fogVaXMJdFeA/4gyBxqfYpQGDCQAsTT5MbZo8vc0eQicxk
 EaUltfiAjlq9raSTBqgGqy8pDe2P20RaGQFfyJBFFFD6Nj4q4Z1hRXKJjp+LJOIYhTOMWmY6
 1i3QOIW3t3/UeZjO32HwG36
IronPort-HdrOrdr: A9a23:9/jwK60CNu0XiTpvhwSj1wqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:4fGGrmzb7+FKaKCntEfkBgUaE94iNTrwkE7qAEGaKD5WdqXPQlKfrfY=
X-Talos-MUID: 9a23:1/nFbgrYmHrpaYQQd5sez3JBFdh1vryhMlkyrJw65fGuCgFcODjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,205,1779148800"; 
   d="scan'208";a="798677089"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 05:02:07 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 1283618000162;
	Wed,  5 Aug 2026 05:02:07 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 97F8ECD144F; Tue,  4 Aug 2026 22:02:06 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][wrynose][PATCH 1/2] python3-pyjwt: upgrade 2.12.1 -> 2.13.0
Date: Tue,  4 Aug 2026 21:59:18 -0700
Message-Id: <20260805045919.233514-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 05:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128789

From: Wang Mingyu <wangmy@fujitsu.com>

This upgrade fixes CVE-2026-48522, CVE-2026-48524,
CVE-2026-48525 and CVE-2026-48526.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 0a60a9b758eedcf803b426a3f9327a20a5a7db53)
Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/{python3-pyjwt_2.12.1.bb => python3-pyjwt_2.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.12.1.bb => python3-pyjwt_2.13.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
index eb445f9c91..140d3bf3e4 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
+SRC_URI[sha256sum] = "41571c89ca91598c79e8ef18a2d07367d4810fbbd6f637794879baf1b7703423"
 
 PYPI_PACKAGE = "pyjwt"
 CVE_PRODUCT = "pyjwt"
-- 
2.35.6


