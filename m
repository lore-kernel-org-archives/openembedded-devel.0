Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3964CCA490
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:21:03 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14025.1792120857867434225
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QHoTMpT5;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2710; q=dns/txt;
  s=iport01; t=1792120858; x=1793330458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4OX8hJLE/24o/jomIPkOIuJmt8YTChzpUsmZl7l9NOI=;
  b=QHoTMpT5Ym3G/+YbmdNiD3tOV5Kzv7iGwTLUx/exBkerX9tKMTto5A2C
   Aej7JQyBPoKovJ4NmpN5wt/y48jNaYf4BmmaVKjakywyvi66r+kecvnRL
   XVdjvOvL1kupbwL6FxeeOLEFckDdQDW6Sx2OAcHVklpplzWwBSPIm8fs6
   dVUMXyW8MAqMjYOev5OR4bJE2lva7C2SxAeuGUsKbxyX+GHe60jlI1/Tx
   9WJjkq415ERMIukpZBraRo0o8uPN9xWAWi8LxAqESyLB7JPUB25pW9CIv
   0UyRNp8j8cFanYpB25K/UAZ51CPapBhKp1/dxXYTXCWZpuGtfKDm5LZZ3
   Q==;
X-CSE-ConnectionGUID: PIrYxVWDS8izngKjGfDQvw==
X-CSE-MsgGUID: Txeoo1KnTsqSrQeYKiquKw==
X-IPAS-Result: =?us-ascii?q?A0D8AgCRl9Fq/5P/Ja1aglmCV3VgQ0mVXmwDnhyBfg8BA?=
 =?us-ascii?q?QEPPRQEAQGFBQKOFQImNgcOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEwIBAzIBGAEtECAxKysZgwIBgnQDEQa8dIIsgQGDKQFDQVDbM?=
 =?us-ascii?q?gELFAEFgTOFQIgjdQGEfCcbG4FygRWDaYEFgVwBAQGCLIV4BIIigQyBeJUpS?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJX?=
 =?us-ascii?q?oErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJK?=
 =?us-ascii?q?EEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhMegmVhLQEpAgSCAaYcoQ8KK?=
 =?us-ascii?q?IN2jCKVOhozqm8LmH2OCpZPhGmBbwMygVlwFYMiCUoZD44vCguDYIUTyUcnM?=
 =?us-ascii?q?gI7AQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:Ft/t66JBAPPNG1evFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS0jVTn
 DcaDTzQPKnbMzTzeNpzOouw9BgFv5/TyNZiTAEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1WLVsHLbMn1t0nAHNI+
 t8aBz4hVw6c0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEuojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsi+a0bIGJJ43iqcN9olaVo
 WWf3GLFGQghLuWS+BmE62+Pmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRul7fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:BylQBKnU3ZOkbVkby5YMujKiNAPpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: =?us-ascii?q?9a23=3Atx9W42stUp6L2LblrTdBoGAt6IsdU2fs3EnvD3T?=
 =?us-ascii?q?oCHRvR56XZlG8wb17xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A23T4tgzFPKjJClBsJdCyhcbC5H2aqJi+BUcKyLY?=
 =?us-ascii?q?Ah9KdDjZJNga+jS2qYZByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536143459"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:20:57 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 40BE218000899;
	Fri, 16 Oct 2026 03:20:57 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9B2BACBEF6C; Thu, 15 Oct 2026 20:20:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 11/11] nginx: Ignore CVE-2026-60005
Date: Thu, 15 Oct 2026 20:20:56 -0700
Message-Id: <20261016032056.409095-12-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016032056.409095-1-hthakar@cisco.com>
References: <20261016032056.409095-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 03:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131028

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- CVE-2026-60005 affects the optional ngx_http_slice_module [1].
- The slice module is not built by default and requires the explicit
  --with-http_slice_module configure option, which neither Wrynose nginx
  recipe enables by default [1][2].
- Mark the CVE not applicable only when that option is absent; report it
  as unpatched when a bbappend enables the module.

Reference:
[1] https://github.com/advisories/GHSA-vxcv-h5wj-jxr5
[2] https://nginx.org/en/docs/configure.html

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb | 1 +
 meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index ca8e7129fb..d087ae8804 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -24,3 +24,4 @@ SRC_URI[sha256sum] = "2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee
 CVE_STATUS[CVE-2025-53859] = "cpe-stable-backport: Fix is included in 1.28.1"
 CVE_STATUS[CVE-2026-1642] = "fixed-version: fixed since v1.28.2"
 CVE_STATUS[CVE-2026-40460] = "${@ 'unpatched' if '--with-http_v3_module' in ((d.getVar('EXTRA_OECONF') or '').split() + (d.getVar('PACKAGECONFIG_CONFARGS') or '').split()) else 'not-applicable-config: ngx_http_v3_module is not enabled'}"
+CVE_STATUS[CVE-2026-60005] = "${@ 'unpatched' if '--with-http_slice_module' in ( (d.getVar('EXTRA_OECONF') or '').split() + (d.getVar('PACKAGECONFIG_CONFARGS') or '').split()) else 'not-applicable-config: ngx_http_slice_module is not enabled' }"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index 2aae2091a0..3b57994069 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -26,3 +26,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 SRC_URI[sha256sum] = "673f8fb8c0961c44fbd9410d6161831453609b44063d3f2948253fc2b5692139"
 
 CVE_STATUS[CVE-2026-40460] = "${@ 'unpatched' if '--with-http_v3_module' in ((d.getVar('EXTRA_OECONF') or '').split() + (d.getVar('PACKAGECONFIG_CONFARGS') or '').split()) else 'not-applicable-config: ngx_http_v3_module is not enabled'}"
+CVE_STATUS[CVE-2026-60005] = "${@ 'unpatched' if '--with-http_slice_module' in ( (d.getVar('EXTRA_OECONF') or '').split() + (d.getVar('PACKAGECONFIG_CONFARGS') or '').split()) else 'not-applicable-config: ngx_http_slice_module is not enabled' }"
-- 
2.35.6


