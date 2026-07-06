Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C35C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:19:34 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155375.1783358372729837101
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iSS/DnHp;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2078; q=dns/txt;
  s=iport01; t=1783358372; x=1784567972;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FbiOHkGFKav+J4Qr0PbbQCcMl5QByGdfWdVxbllYwa0=;
  b=iSS/DnHpX3cyuRI5qXfFCrbehy01ooMhQHgVHQWNNP03teEYmeUYOGHS
   NQLy7U9h80jlxOPC/hT5ZRwej1s4ZyaCodMF4ZCtWQCvmFqqtaWCPhRUS
   Qj9aZpH/JVOAwMF15dqyYbSwZZPJ28P4ySVhe2JGjvO8GjEKVDqWNMm31
   aLADr1wPrCkff3n58rRSvE5yvIElE1mYfRBzUmOd1JYy5c2QvxavccC2n
   feuy5aZTLDXOSwFsEJLE9lE2GcATLPGDdQf+MZP9g8+xFx81/HwZwKqAN
   g+ZMjPajzbR8FU+ljUpuQihJtS38upYZqdb6qWcw21b7vlIMxUhEua6hr
   A==;
X-CSE-ConnectionGUID: W761uIx8TYqnj4YaJaxWxQ==
X-CSE-MsgGUID: izVkI0xlRGmD/m1XTnbosQ==
X-IPAS-Result: =?us-ascii?q?A0BCAgBr4ktq/5D/Ja1aglmCV3RfQkmTWgFPgiGeHoF+D?=
 =?us-ascii?q?wEBAQ89FAQBAYRAjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2HCAsBGAFdXEQUgm4BgnMCAREGug+BeTOBAYMoAUNBUNssAQsUA?=
 =?us-ascii?q?YE4hT+IH3MBhHwnGxuBcoR+gmECgSchCVyFeASCIoEMgXiPJ0iBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgWuBAoR5Ix8DOX+BMHVKeS2BA?=
 =?us-ascii?q?xIeCoFSgSkDCxgNSBEsNxQbBD5uB4x7Fw+BcE1hLQErgkOTY5F8oQ8KKIN1j?=
 =?us-ascii?q?CGVOhozqmyZCI4KlXNdhGiBaDyBKBsBDgdwFYMiCUoZD5IjhRPJRyQ1AgE6A?=
 =?us-ascii?q?QEHAgcOAwuBaJAAAiaBVQEB?=
IronPort-Data: A9a23:l/wNOarm1RsdJkAjhgS498X2Q7BeBmJIZBIvgKrLsJaIsI4StFCzt
 garIBmBMquINzGgKdkga43n/R9T7JDQx4NlQVZsqSkxFy9H8ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8E035pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0tkoXzhT1
 OxIFAEUaBLftuuUyaKEWtA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Vo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVPrSn8/w7pX7WyZFpE+Qr6o+y2PS1wd2lrPqNbI5f/TWFJoNwhnC/
 D2uE2LRAwMkN/3H2T6/3XeAweqWrR/9UoUJLejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aJ
 0EK9y4Gqakp6FftScHwWRC9qnOIshMQHd1KHIUHBBql0KHY5UOdQ2MDVDMEMINgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:mZrz2K+7nHqVihrlfgpuk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcLK7WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: 9a23:ceVu329ta4RHwnBubkmVv3FLRJk4U22N8EbJJU3kOG9LQa2qWWbFrQ==
X-Talos-MUID: 9a23:xXKaBgboeU0NkOBTti3ShxA6JMNSzKGCT0VUoakAsc6fDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,151,1779148800"; 
   d="scan'208";a="497047227"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Jul 2026 17:19:31 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id A5C96180003CF
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Jul 2026 17:19:31 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 4B46BCB6A93; Mon,  6 Jul 2026 10:19:31 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] mariadb: upgrade 10.11.16 -> 10.11.18
Date: Mon,  6 Jul 2026 10:18:55 -0700
Message-ID: <20260706171855.4023626-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 17:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128052

From: Sudhir Dumbhare <sudumbha@cisco.com>

This upgrades the 10.11 LTS recipe to the upstream release containing fixes for:

- CVE-2026-44168
- CVE-2026-44170
- CVE-2026-44171
- CVE-2026-44173
- CVE-2026-48163
- CVE-2026-48165
- CVE-2026-49261

Release notes:
- https://mariadb.com/docs/release-notes/community-server/10.11/10.11.18
- https://mariadb.com/docs/release-notes/community-server/10.11/10.11.17

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../{mariadb-native_10.11.16.bb => mariadb-native_10.11.18.bb}  | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
 .../mysql/{mariadb_10.11.16.bb => mariadb_10.11.18.bb}          | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.16.bb => mariadb-native_10.11.18.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.16.bb => mariadb_10.11.18.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.16.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.18.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.16.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.18.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index be310ef80a..ff22b49b47 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
           "
-SRC_URI[sha256sum] = "e4f9f2035d38345464ae8abaeaf68380d1ceadbafb4e84744ed2ed5b7aab64e7"
+SRC_URI[sha256sum] = "a46852c68075be7c31c7b33fee233c5b5a00c8c28117f5204d124e4f2fd56fa8"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.16.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.18.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.16.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.18.bb
-- 
2.35.6


