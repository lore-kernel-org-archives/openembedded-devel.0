Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DD1C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:19:19 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7432.1785316752662374560
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 02:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=b3zu5Qnp;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3135; q=dns/txt;
  s=iport01; t=1785316752; x=1786526352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xcPrByut4RzP3lv45qvkv9vrbN3jcozvyd5vVqM3y5A=;
  b=b3zu5QnpUZIowdT2yg3R5hwYPa9kcHD8CQN60gGYwQmpxZJUwwl6SUk8
   nIV3AvJcEwDN19z/kr5b0GcRKiKm3A9esrdSwgE7D+IcFTHXfAz0TTNnH
   K8FohnpqYtGoZtmyiX/LszQZjo1imOP+or6NU0072h/4niTdF6hZguMLy
   FnDDtPTieI+F56QfkoXgvaed1g8i9AcEKf7HsBDSfrEK8pH9K/hHubeY1
   xfaboTjpAbe3jZ+ZWPHhISvVRaLJZkyuyYnRzxdr0QdIs1L8xm3haTHQC
   ih15oKtRYd1mqPBSQDmSXiMfjlTu42bzSZrxCKnDUtjiP+roaFa81ENWy
   w==;
X-CSE-ConnectionGUID: NABTDODhRLejXHtslQ1sWg==
X-CSE-MsgGUID: rE3dv2nqSlqYTqYC2C4kFw==
X-IPAS-Result: =?us-ascii?q?A0BHAgB8xGlq/5MQJK1aglmCV3ReQ0mVXmwDnhuBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKNZgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLAUYQHAMBAi8rIwgZgwIBgnQDEb4TgXkzgQGDaAJDU?=
 =?us-ascii?q?NsuAQsUAQWBM4U/iCBcGAGEfCcbG4FyhAh2gQWBXAEBgSeGfgSCIoEMgVoek?=
 =?us-ascii?q?DdIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBwWBHYEsP4RXIxk2f?=
 =?us-ascii?q?4EvdUp3LWkBEheBGoM5AoJBAwsYDUgRLDcUGQQ+bgeNbyGCRYEOASuBGzUKK?=
 =?us-ascii?q?ZNWkkmhDwoog3WMIZU6GjOFW6URC5h9jgqWUIRpgWg8gUcLB3AVgyIJShkPj?=
 =?us-ascii?q?i4KC4NggX+DSMkTJzILMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:6oYv8KlhiK50LWuAv99Ommzo5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNC2GEPayDZmGnL4wgb9vgp0oGvZfRydBgSgNv+39kFltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfPb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fasx0NpbJk1Oz
 9gVKgAtcguHvrut/73uH4GAhux7RCXqFIobvnclyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEQUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3Fb4uLIIHUG5UE9qqej
 njrpGjnWBcDD9iG+Aacw1n2rbPMszyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzFcCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:YWmFG68lNCl6i5lsYY1uk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: 9a23:C0QaD2DyyOMEqbv6Ew9O3nI4PewlSFnQzkfwP1S8MD9yd7LAHA==
X-Talos-MUID: 9a23:k3U7KApdnjX6LNJdRh0ezytPb8t2uaK3M0QUoKkfiuLeHnBzFSjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="796256689"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 09:19:11 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id C0CF018000254;
	Wed, 29 Jul 2026 09:19:11 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9D077CD144F; Wed, 29 Jul 2026 02:19:10 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-oe][wrynose][PATCH 3/5] libdbi-perl: Fix CVE-2026-14380
Date: Wed, 29 Jul 2026 02:18:38 -0700
Message-Id: <20260729091840.84531-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260729091840.84531-1-hthakar@cisco.com>
References: <20260729091840.84531-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 09:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128553

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

The upstream fix replaces a string eval used to load profile packages
with Module::Load::load. Since Perl core modules are packaged
separately, add perl-module-load to RDEPENDS to provide Module/Load.pm
at runtime.

[1] https://github.com/perl5-dbi/dbi/commit/b73d5d9901767fc1d16b6661ef08fbed4532e259
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-14380

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-14380.patch     | 37 +++++++++++++++++++
 .../perl/libdbi-perl_1.647.bb                 |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380.patch
new file mode 100644
index 0000000000..844885d936
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380.patch
@@ -0,0 +1,37 @@
+From 509bbfcff36b1b1e1d81cc3ca435974448b9835c Mon Sep 17 00:00:00 2001
+From: Robert Rothenberg <perl@rhizomnic.com>
+Date: Wed, 1 Jul 2026 22:31:56 +0100
+Subject: [PATCH] Load profile packages using Module::Load [CVE-2026-14380]
+
+CVE: CVE-2026-14380
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/b73d5d9901767fc1d16b6661ef08fbed4532e259]
+
+(cherry picked from commit b73d5d9901767fc1d16b6661ef08fbed4532e259)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ lib/DBI/Profile.pm | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/DBI/Profile.pm b/lib/DBI/Profile.pm
+index 9b16c53..66f39ec 100644
+--- a/lib/DBI/Profile.pm
++++ b/lib/DBI/Profile.pm
+@@ -679,6 +679,7 @@ use warnings;
+ use Exporter ();
+ use UNIVERSAL ();
+ use Carp;
++use Module::Load ();
+ 
+ use DBI qw(dbi_time dbi_profile dbi_profile_merge_nodes dbi_profile_merge);
+ 
+@@ -758,7 +759,9 @@ sub _auto_new {
+         }
+     }
+ 
+-    eval "require $package" if $package; # silently ignores errors
++    eval {
++        Module::Load::load $package if $package; # silently ignores errors
++    };
+     $package ||= $class;
+ 
+     return $package->new(Path => \@Path, @args);
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
index 5a76924560..a852dc276a 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=65f65488c774efe1da488e36ad6c4a36"
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz \
            file://CVE-2026-9698.patch \
            file://CVE-2026-10879.patch \
+           file://CVE-2026-14380.patch \
            "
 SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
 
@@ -41,6 +42,7 @@ RDEPENDS:${PN}:class-target = " \
     perl-module-exporter-heavy \
     perl-module-dynaloader \
     perl-module-io-dir \
+    perl-module-load \
     perl-module-scalar-util \
     perl-module-universal \
 "
-- 
2.35.6


