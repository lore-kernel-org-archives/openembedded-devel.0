Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12019.1794070358688818130
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pGeLIluc;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so18139645e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070357; x=1794675157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0yexCb2vXbk8Yq43DE1nEmg99JhEnGmliu5DJSALII=;
        b=pGeLIluc5mqG5YZUZXMD52f56y5aCaQyTeVJQ6TuKuhuvIekgit8W2zkW3lKW+G9+p
         U7gBSzRDYrNX78KkKhy5paC9wX8nXO/UfX6ysRzy2fzIzLAwJuBrUA9QLZnlK/e/N97y
         Yks2aEjq6U0oa3cqbJZ8SP/j++2Xl218j1Yjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070357; x=1794675157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T0yexCb2vXbk8Yq43DE1nEmg99JhEnGmliu5DJSALII=;
        b=fuoPjM8i5yOxp3c+AOKbiQQ0+LIuQ3KjYF03nnnJ2o3U/sH9ywM5ifBPPCj9ZTyIlb
         gxI5tuHwUHZlaHW4Wzu0rjGxRdEa5LtgnTZBGTGa5H3RVrICf9GcqaWL5GI/emh/KO4F
         BNYBCVK31Al0d2FEOKTC+s8DH8iyeL/dbXnpFVPpo+e2s8hOUswyVW8PsGd94i5UpI8t
         dgcT9A3LtiERf7yrEJbw8B2IntQxSJ+QYXafrqrrk2ZPSpE7J38IyZpiesLqZxyReUro
         DD5PkVQpDFDMhIr0HdBnawXg0atuCei68zDOzhqWowQe+TbMcFNRK4V9OGi1LPigpo1k
         /sQA==
X-Gm-Message-State: APuU4Z9MUFbifMzA/JE4riH4gv6w0S2Oqg6XL6pNXcXpK3Gv1Vj61wAf
	0N3Zn49SzPVCeI6km1ZnyE6rBVvmmhjFM9U3bMkf3DW3VMDvULbvnjOw/XO4WYqf7yAhElSelZI
	oKjSB
X-Gm-Gg: AYBFou2NXaynh7ZKYmV2jz0j/TDMt6J/YvexG01FDCYaEK97wk1oKtQvkcKwpwkiLw9
	+Lr+S+dX+Fx2rvnALe4/oK/rYIr/CvWaZk7popcPj/lhqmPaKudz2HfdBN6Qgtr68EfPr0lQbWy
	XOF9Zg3LHL+h1lmhQGuM6LqTpflgx8DaoMN858NjwkVnnMNYmIO0d+FLseWGGbvHA4ZhZyRxkhC
	Dvn4DBjz9PXB1DAMdtfRVS//8ynNlr8CA/RoYgt+8xkYRKLNAyvqzUG8tkryTewROHacS6QhpUs
	lmBqkqAUdG0U+RZYnQbMlrXTKjJHlaIxpsHfPQUmab6/fEpi57iWIFmNMfsY4otJS4uprerWVW9
	wbFCrFvI/T+xHC21FQohnt6Yj0xKgcnGGKveEojkLL2X6mQBqs11cU+govwVwoTVY2BLRUggO19
	CfqD7arHStrCtq1KcbuuLtSKWodG24/bYn/ufystix3l3aA9s9dXzMigpO1IpOxD7tP8PfPUWzc
	U2lkV++sclK+qiFNmP0nbb5z7K+138KKJz3QtOqDhM3v9xQ//IgfL0AMCdR7xhuv0irfBU4OqNI
	bX3ZIpCvIYwIppFd5dLWYMapmnxn4esqaQS8ifrF8MWJ9t089PP3hxUY2m0+pP8XI/dnuRKBb7h
	dlVVcT7Lm2qrH37XnUPuDB6n3NJIqOJQgjUS45epSquonI0vjn04n9sZMhH+bMzx3WsQb1Mh1fe
	Q=
X-Received: by 2002:a05:6000:4312:b0:490:6fbc:9457 with SMTP id ffacd0b85a97d-4927678e068mr12654428f8f.41.1794070356912;
        Sat, 07 Nov 2026 08:52:36 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:36 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 13/22] libdbi-perl: Upgrade 1.651 -> 1.656
Date: Sat,  7 Nov 2026 18:52:12 +0200
Message-ID: <20261107165221.122340-13-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131998
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.656:

- Prevent dbi_profile crash (CVE-2026-108518) (Henrik Teichmann)
- Fix lock file not removed when DBD::DBM check for bad serializer
  class fails. (CVE-2026-111879)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../perl/{libdbi-perl_1.651.bb => libdbi-perl_1.656.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{libdbi-perl_1.651.bb => libdbi-perl_1.656.bb} (95%)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.651.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.656.bb
similarity index 95%
rename from meta-oe/recipes-devtools/perl/libdbi-perl_1.651.bb
rename to meta-oe/recipes-devtools/perl/libdbi-perl_1.656.bb
index 436ee47165..ada346b4e8 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.651.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.656.bb
@@ -10,7 +10,7 @@ LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1a1138dff61f77bbc3d8782caba6758d"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz"
-SRC_URI[sha256sum] = "da621a23fa68e1e04fac824cfd3d41e8ffbab2ab3eba642a12499242e8be5253"
+SRC_URI[sha256sum] = "ab5f2b9aef00951ed4598723d6131a00b03e68193478dd5e5f211015520a6ef0"
 
 S = "${UNPACKDIR}/DBI-${PV}"
 
-- 
2.47.3

