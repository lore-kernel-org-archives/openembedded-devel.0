Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B74FC55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:05:31 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33614.1785906324418013883
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IwsZJK6W;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=925; q=dns/txt;
  s=iport01; t=1785906324; x=1787115924;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0Sp5dJI0pOZgMjEW5ZmMWG5K4/nN2i2D7jnFfKqp0L8=;
  b=IwsZJK6WEI3kfOuuKR31vcJl1/B/tRh6xW1hR+1it+lFOpo3tqaWczke
   +Pl+Kf74frN4QWNpoWVvpi61iVI8sUcyEadM+if0tnTMYd0EwhQU1dcZH
   iIBxy9Bs6hEOQHWlvASVwzpZJpzLVdvxgwcUmprh4ksPf1A4ZBDsqtWll
   PERajIe6jtGKTvYTzB9EqfTafcvjy4UPmjnQEkLEm7iq3GlftGNIDn85x
   dJophzil9+hEfBGrJAcSeUNWcuNzlA3Uq16g4Vs4wWvMJTPogt/DNLD7E
   98ibhumuHWYzyxUwSW1/SQqAqeOSTtxcmgHeiAs1mxOHXql1w/5VDN0BW
   Q==;
X-CSE-ConnectionGUID: SIGvCQeOQZGQrAJzgO940g==
X-CSE-MsgGUID: 5P+HU9MyQ+yanbQmsT3zoQ==
X-IPAS-Result: =?us-ascii?q?A0DDAgBrw3Jq/4wQJK1aglmCV3ReQ0mTWQGOV5I3gX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNaAImNQgOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4Zchl02ARgBLTBRC0SDAgGCOgM3A7xsgiyBAYMoAYFU2EkNglgBCxQBB?=
 =?us-ascii?q?YEzhT+CfoUjhXInGxuBcoR+gh+CcYV4BIIigQyBcgaQWUiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBDRsHBYEdgSiEbSMZNnyBCV6BLSpkARIXgQmCe?=
 =?us-ascii?q?wKCem8LGA1IESw3FBkEPm4HjWgggkCBDqYtgiGgHnEKKIN1jCGPPoV8GjOqb?=
 =?us-ascii?q?C6YWpITkkeEaYFpATqBWXAVgyIJShkP3lwnMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:OzIfkasKYYP72xbui3g08QazDufnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWvTMv/YZGGhfoxwOoS+8UxU6JfVyoJlGlRsri00Fi1EgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/Lb9Es11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwwcdYH0p3+
 NshGh80dDmhle2Rke7jRbw57igjBJGD0II3s3Vky3TdSP0hW52GG/6M7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZg9/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9JY3VHZoFzxnBz
 o7A1znBQTEnZfmO8HmU+3Smv+rUoXjpX7tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2YaLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:+l8HSqxv8xkRWkeAvO6OKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AEdUlsGnzIF/0CxLNrck5kLf7t4HXOUb842n7GkK?=
 =?us-ascii?q?fMFRGcae8a02f3/I4y8U7zg=3D=3D?=
X-Talos-MUID: 9a23:D2i2TwixSvUZCc+wea8vvcMpaf8rw5n/LVE00oQPvcO9MDdMYCWatWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,205,1779148800"; 
   d="scan'208";a="797078971"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 05:05:23 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 75158180001F1;
	Wed,  5 Aug 2026 05:05:23 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 1AA9ECC12A6; Tue,  4 Aug 2026 22:05:23 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][scarthgap][PATCH] librelp: add CVE_PRODUCT
Date: Tue,  4 Aug 2026 22:05:23 -0700
Message-Id: <20260805050523.1744780-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 05:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128792

From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>

Add exact CPE name in CVE_PRODUCT.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 09c542c2f4388b4afe848ab1992a0eb3e5e4c021)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
index 9d949c6303..3c1b8d19de 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -18,6 +18,8 @@ SRCREV = "b421f56d9ee31a966058d23bd23c966221c91396"
 
 S = "${WORKDIR}/git"
 
+CVE_PRODUCT = "rsyslog:librelp"
+
 inherit autotools pkgconfig ptest
 
 PACKAGECONFIG ?= "tls-openssl valgrind"
-- 
2.35.6


