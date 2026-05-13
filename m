Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5D2CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:08:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91.1778645306682219796
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D+IR6r45;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645306; x=1810181306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CvIvW4ipLRkp4WfCzSHVI5/L7sT6elS0LSjPa3CaLZ8=;
  b=D+IR6r45RKYqwAuXBNdTMnhpH+QDfe0wmh/yv8Na1qI/TDtQu2tRroZG
   xSVik1HMrh6CbZYl6RJ0dUZLpTKr3gZIwepRe/8lmj8dif/qnxTQtvfDs
   UvioEn1t6/l/GIMXbQur4InF4RPQjpovBD/BTU71z/UIUg1ZfrBmiDmN3
   BV6Nn2MBgnBG29pOCWLmqd1iPp98/J0DAp9ba7IVNbQPzOfhQ1T2d5BSQ
   s92OnoZZ61fjdM1xjQB9ho3LRh2dGQ3MLGIhpz/0sSMjc76z/z5fjCGtF
   gVPUUV+UiYJ1d6vrmBjAfdLMf3oefidKUOM1OoWQSl0YvdClmi+84uZ1x
   A==;
X-CSE-ConnectionGUID: PyHLFM3tRMeU+Od01QjVuQ==
X-CSE-MsgGUID: 0MiTEmq5QwOhYJm5uSd7/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240206063"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240206063"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:08:25 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 051F11C000BA
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:55 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A8A85C000AE
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 254CB140008F;
	Wed, 13 May 2026 04:07:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 10/56] libauthen-sasl-perl: upgrade 2.1800 -> 2.2000
Date: Wed, 13 May 2026 12:05:09 +0800
Message-ID: <20260513040555.377-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126896

From: Wang Mingyu <wangmy@fujitsu.com>

[Added]
   - Documentation for the security layer
[Fixed]
  - CVE-2025-40918 (Insecure source of randomness),
    required addition of dependency on Crypt::URandom
  - Several public functions missing from the API documentation
[Changed]
  - Modules Authen::SASL::Perl::CRAM_MD5, Authen::SASL::Perl::DIGEST_MD5
    and Authen::SASL::CRAM_MD5 marked as deprecated based on the respective
    RFC documents; thanks to @robrwo for the suggestion and @neustradamus
    for the pointers to the documentation
  - Update module metadata to point to the new 'perl-authen-sasl' org
    on GitHub to which the modules moved
  - Use VERSION declarations in 'package' statements, since our minimum
    Perl version is 5.14 anyway

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...authen-sasl-perl_2.1800.bb => libauthen-sasl-perl_2.2000.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libauthen/{libauthen-sasl-perl_2.1800.bb => libauthen-sasl-perl_2.2000.bb} (92%)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb
similarity index 92%
rename from meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
rename to meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb
index 46a8506f10..5b8699e88b 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb
@@ -14,7 +14,7 @@ RDEPENDS:${PN} = "libdigest-hmac-perl"
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/EH/EHUELS/Authen-SASL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "0b03686bddbbf7d5c6548e468d079a4051c9b73851df740ae28cfd2db234e922"
+SRC_URI[sha256sum] = "8cdf5a7f185448b614471675dae5b26f8c6e330b62264c3ff5d91172d6889b99"
 
 S = "${UNPACKDIR}/Authen-SASL-${PV}"
 
-- 
2.43.0


