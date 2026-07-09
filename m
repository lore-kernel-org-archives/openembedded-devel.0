Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F69C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 11:32:40 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7159.1783596751568434479
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2026 04:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WtH1FH/n;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2417; q=dns/txt;
  s=iport01; t=1783596751; x=1784806351;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=47rt0ljYjUtPZiFdiKkceOLkw6zo/gDo/0H1S+jGPwM=;
  b=WtH1FH/nMKQNOm93T53U9KINuf7OiLFGhcZqSxsAClHHnibj/UZDukLR
   i0fBak9akekQcaTzfSgQmhAKgF9VO9cF5a1Xf0QYKsGPsCv8Po/OlUqLh
   e+4ilyqAeGSZxov/Tw+2duTBsOdmD6hxNNOsh/TD3QCrGOOQSrac4hZWv
   E0mpMU8PRwyL1Ds2ZGSTttf1C+jH7NakGNiYmhG/CMAd5QAyozfqthB5T
   gYAHh7drXUTv4UITdKUEzsREXiqh3kMBQvTR+DpRdb70fyBUOk2a7PyaD
   G6HJFh/NuDSDOaVoA8Z/VvkxBz62JA2sFcQt0RtNNLRTy5a+Oi8T4FFRi
   A==;
X-CSE-ConnectionGUID: wmWU1negQGS6AIPCpu8voA==
X-CSE-MsgGUID: rjEsphubTP+KTmdcZhSxpA==
X-IPAS-Result: =?us-ascii?q?A0BEAgCThU9q/5L/Ja1aglmCV3RfQkmUKYIhnh6Bfg8BA?=
 =?us-ascii?q?QEPLhYNBAEBklQCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWgECAQQxAXIDAQJWBCMhgwIBgjoDNgIBEQa5DIIsgQGDWgIMAkNQ2?=
 =?us-ascii?q?EkQglUBCxQBgTiFP4gfWxgBhHwnGxuBcoR+gQWBXAECAQEXgQ2BBoV4BIIig?=
 =?us-ascii?q?QyBWhgGghONWkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdg?=
 =?us-ascii?q?VuBBIR5Ix8DOX+BMHVKeS2BARIeCoFSghYCOgMLGA1IESw3FBsEPm4HjT8XD?=
 =?us-ascii?q?4FxTYEOFBYCqCKhDwoog3WMIY0+h3waM4QElBeSUQuYfY4KllCEaYFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ+OOIh+yUckNQIBCDIBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:ZXU5I6CHp4meixVW/3niw5YqxClBgxIJ4kV8jS/XYbTApD8i1zdRx
 mMaCmjVaKuMYWr9e90kaI20phsO65KAmtNlOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD9i2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE3PBRMRgwMIIh1d0pKEB23
 uQFeC4KR0XW7w626OrTpuhEnM8vKozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYxBPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEpj+G0aYWPKrRmQ+1PnGuDv
 mLb9VjBQTImMdCU+zq+4mqF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MskCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:uy0HmKq73pj4tOsS4u2nL+EaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: 9a23:zYnR2m5QQhVHfNTxuNss60srJ5kjf3Lk40yOCm6AIn50GKOSYArF
X-Talos-MUID: =?us-ascii?q?9a23=3ABEhZvAwC2NYL4X7tU2Sml2rW1BqaqL6sJVsVkYg?=
 =?us-ascii?q?Mh/HHFhB1NzyvjA+nWqZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="507111728"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jul 2026 11:32:30 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 5C503180004BF
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Jul 2026 11:32:30 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 0B0D5CC2EC3; Thu,  9 Jul 2026 04:32:30 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH] libidn: Fix CVE-2026-57053
Date: Thu,  9 Jul 2026 04:32:20 -0700
Message-Id: <20260709113220.3742085-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 11:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128120

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream v1.44 backport for
CVE-2026-57053. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://git.savannah.gnu.org/cgit/libidn.git/commit/?id=f57fab06afc1e328bbe197ad3d4a4e83c829593e
[2] https://www.cve.org/CVERecord?id=CVE-2026-57053

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta-oe/recipes-extended/libidn/libidn/CVE-2026-57053.patch b/meta-oe/recipes-extended/libidn/libidn/CVE-2026-57053.patch
new file mode 100644
index 0000000000..7079f9c429
--- /dev/null
+++ b/meta-oe/recipes-extended/libidn/libidn/CVE-2026-57053.patch
@@ -0,0 +1,28 @@
+From f57fab06afc1e328bbe197ad3d4a4e83c829593e Mon Sep 17 00:00:00 2001
+From: Simon Josefsson <simon@josefsson.org>
+Date: Tue, 16 Jun 2026 17:23:38 +0200
+Subject: [PATCH] Guard against read-out-bounds on some xn-- strings
+
+Report and suggested fix by jiami3us@icloud.com in:
+https://lists.gnu.org/archive/html/help-libidn/2026-05/msg00000.html
+
+CVE: CVE-2026-57053
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libidn.git/commit/?id=f57fab06afc1e328bbe197ad3d4a4e83c829593e]
+
+(cherry picked from commit f57fab06afc1e328bbe197ad3d4a4e83c829593e)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/idna.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/idna.c b/lib/idna.c
+index 27de4489..29664245 100644
+--- a/lib/idna.c
++++ b/lib/idna.c
+@@ -388,4 +388,5 @@ step3:
+-  if (c_strcasecmp (utf8in, tmpout + strlen (IDNA_ACE_PREFIX)) != 0)
++  if (c_strncasecmp (tmpout, IDNA_ACE_PREFIX, strlen (IDNA_ACE_PREFIX)) != 0
++      || c_strcasecmp (utf8in, tmpout + strlen (IDNA_ACE_PREFIX)) != 0)
+     {
+       free (utf8in);
+       return IDNA_ROUNDTRIP_VERIFY_ERROR;
diff --git a/meta-oe/recipes-extended/libidn/libidn_1.43.bb b/meta-oe/recipes-extended/libidn/libidn_1.43.bb
index 7c478a1495..e645ffce20 100644
--- a/meta-oe/recipes-extended/libidn/libidn_1.43.bb
+++ b/meta-oe/recipes-extended/libidn/libidn_1.43.bb
@@ -17,6 +17,7 @@ inherit pkgconfig autotools gettext texinfo gtk-doc
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
+           file://CVE-2026-57053.patch \
            "
 
 SRC_URI[sha256sum] = "bdc662c12d041b2539d0e638f3a6e741130cdb33a644ef3496963a443482d164"
-- 
2.35.6


