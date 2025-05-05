Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6B8C3ABBC
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 18:10:19 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.57716.1746468618932670210
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 11:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gp1jJRyg;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ff1e375a47so43859047b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 11:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746468618; x=1747073418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qSa5EVPCyn20FEEo/Koi3IbpiCGyfkgeOrM7mixmKxo=;
        b=gp1jJRygKrYYZLZxIfLRtLXfE5ahyEuMhnq7MTuRug013dNqkSNyaCHyqAEBrUNaOn
         Sjtl4JjFSZbTU7og71Trli8I46C5OEVHnqYKPbbOMZ1ib7lVpWg8xexJoyOp8LQ/0K3b
         Hj9PoJNtPGOdXPu8KyvY14iJKgNvBaeU3DJafbyX/womZ5Ls7fDsb2ZjgRIKgvosR4Ng
         DK1seMBsoNg2mmogu7i2WOzTZe950zcA+9h/pIbM16waMQF/4tMOJgkIFPv7pfKA+2Ev
         aU69wSAp3tNcZbxIVs3pBge3nyB1RDnHMGJkFRtGbVTtbBV1/uhAVAqp+waxtOyD3IEK
         cRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746468618; x=1747073418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSa5EVPCyn20FEEo/Koi3IbpiCGyfkgeOrM7mixmKxo=;
        b=IaynxvsTFvRKMduwxakHEQt1sQ2ACP5LvB44P67kpIkTjHczbpWMh1277a7SskMpoY
         ydmL5e/xJQjzBOssyv6PapMre5v+5+23/XCon7uxfatygkl60CIS8dE27/LHrjo7RcvB
         gGJXqil67CR7nDSl8Q3oCX7k8e0y4SlagayASSGxZDmJyCnjbOCuHekT1/mOKBJT/E0s
         Bb84A91NQC2PIS3zhSn7nMMymHOva+fGMqx/nGLDPbRSxI6/a2WPigrOas4P4NzFya82
         1oqUgVkFSMUpK5gQPSCzSwcQ3YOraGFnwSfBRGzZVst1lzhEz+LXxke7pxdI9t85wRuu
         3KZA==
X-Gm-Message-State: AOJu0YyC7Re8Z7uE17yngiaf743u7eEw7kcTxiBiqq58C1QECB1wPYmp
	UBmww3EXsnPVe5y0XlqFdg6CB+MRuSUsqB6HUJsSus5Nams3C0EO+zFZ/07u
X-Gm-Gg: ASbGncumTXgv6rEqOG5uFP18joiYPd0Zosn7Oc0Wkh02otaKXlbkdnT+QTy1gIaogx+
	9oKcqd0LM44lj9lXG8l4C7oeL8Lg4IwS/qRqai/QTyBzewK0yr+kEnFRcAMSZjXv3yOmvvdFqOW
	OQf43xOj0JIKH8IAP126gfH8Cz8YaOQxATzWTSRMO9vj/APkQYnOCAIE+dRXhZ95Ahq9DRZJwak
	tkreW4nBxVrEak/Ww11ctD84BMATWfCqGwNiiYIu5Y+6qu6zrPDu9WBsrhqoBlfEsIxyxazhs3R
	r0uysZYkaXuhIHphnFGUr7HmFo4k2Hqz+fQ5TbyflctvrQ==
X-Google-Smtp-Source: AGHT+IFruTd1Y/Fky0hSm45bH3AHXI7JME8HpkcwZps+F/dwvYtC+nuLkQ1AxaSTPCkJOWDNHjyHYA==
X-Received: by 2002:a05:690c:7012:b0:703:b930:97c7 with SMTP id 00721157ae682-709197c5011mr2946707b3.9.1746468617495;
        Mon, 05 May 2025 11:10:17 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70913abd32esm2029677b3.31.2025.05.05.11.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 11:10:17 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] libdbi-perl: upgrade 1.646 -> 1.647
Date: Mon,  5 May 2025 14:10:10 -0400
Message-ID: <20250505181010.206077-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 18:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117329

Changelog:
===========
 * Spellcheck
 * Fix Makefile rules for Changes (Windows case issue)
 * Another example to bind columns (issue#159)
 * Fix fetchall_arrayref for undefined NAME (issue#156)

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../perl/{libdbi-perl_1.646.bb => libdbi-perl_1.647.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libdbi-perl_1.646.bb => libdbi-perl_1.647.bb} (88%)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.646.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
similarity index 88%
rename from meta-oe/recipes-devtools/perl/libdbi-perl_1.646.bb
rename to meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
index 947353c17c..f70f737ba2 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.646.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -4,13 +4,13 @@ DESCRIPTION = "DBI is a database access Application Programming Interface \
 of functions, variables and conventions that provide a consistent \
 database interface independent of the actual database being used. \
 "
-HOMEPAGE = "http://search.cpan.org/dist/DBI/"
+HOMEPAGE = "https://metacpan.org/dist/DBI"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65f65488c774efe1da488e36ad6c4a36"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/DBI-${PV}.tar.gz"
-SRC_URI[sha256sum] = "53ab32ac8c30295a776dde658df22be760936cdca5a3c003a23bda6d829fa184"
+SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz"
+SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
 
 S = "${WORKDIR}/DBI-${PV}"
 
-- 
2.43.0


