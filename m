Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D2DCE8E74
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 13:20:37 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.14142.1729775194557775075
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 06:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WaKVLMnf;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso976984276.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 06:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729775193; x=1730379993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hkw1A/IzquqR6nSmFqydBcjarXch/5grPkcb8zeK3/c=;
        b=WaKVLMnf2IUFXn2Bq3Hq5oTaztktAW2o+9VkUUzm9l0qrbPMWG8KVDzb8NxjM/WrzH
         Yvpf2nwlN+uS3W+CkPfCbt+K6p6ZEwXBYW8yZEGh2x+ZLmxMpkHNuhiT+6uxZGBJ7wMi
         zz8oktV3m625paer9wldbGvcYM3ub+TpGiA6VZyi+7Fvgjf6LHpNjRnsn+d7BO43eSu4
         jVGU33jEdGixuWNgpNw4g5LhqlJJ7UnlbFri3zwXYCtdSCOwI1GVVMmpTk9TKXnD4yFb
         RssMtVEAb28B27imcHwtEaaD4v1zlDSZRi7IrYZJq/RVcx9WR73vb2AH2ifaLhBmxg3c
         IkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729775193; x=1730379993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hkw1A/IzquqR6nSmFqydBcjarXch/5grPkcb8zeK3/c=;
        b=uUvrIXkt+6d0P42Cv7Yl3da1d/armAT2FfxijVoxs2I3GPjGQoW2iFKY4VhMFGz2q4
         KepMTRRl4ZQBJsXhIZDHseXUd06LLxSnYoPERnVAeeWryDrNgEjEUCoAnYLsuN5I7WFl
         UlZhtDBd6NkkwfJBrGEdJdrybd+xeG83KnYDk7F8Wg1+9FovcyVNif9BLr56p3VzWd1D
         px687cXJIBFoSrCD7DHbjfLmnhRjXSUzuN1mUsNPWJCrsfbdmqVWf0n41o2wpTlHDvFi
         sHjGhugbgEejRkxCu5+W3jk59JLzc3xr1sCEW2LL5afEXeda7Cwfq5dlg4tKakHa13d6
         XheQ==
X-Gm-Message-State: AOJu0YzayuiAm5ZvQak5G67fMMl7mbRNhGrLHtaEQFwSSJ4TjcxZXPsX
	0q5E1jl3+22Ll4Vs5M8rqDHO7+0JURnth/OtvJ+QpnOny78ca13vWmxVoA==
X-Google-Smtp-Source: AGHT+IGYvXoYpuOYe2VfuJFgJkBYtaOqm+a66R+YfImnY2AaKzHcbYU1xasyv+MRoiGcvBmWJGrQ1A==
X-Received: by 2002:a05:690c:dd3:b0:6dd:cdd7:ce49 with SMTP id 00721157ae682-6e7f0df5d79mr65175947b3.6.1729775193096;
        Thu, 24 Oct 2024 06:06:33 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5ad5a1asm19448897b3.69.2024.10.24.06.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 06:06:32 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libdigest-hmac-perl: upgrade 1.03 -> 1.05
Date: Thu, 24 Oct 2024 09:06:12 -0400
Message-ID: <20241024130612.21656-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113167

This new version brings an updated copyright date and a new maintainer.
This distributes under the Perl license (as it did previously).

Update the HOMEPAGE and SRC_URI to use metacpan.org instead of search.cpan.org

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...gest-hmac-perl_1.03.bb => libdigest-hmac-perl_1.05.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-perl/libdigest/{libdigest-hmac-perl_1.03.bb => libdigest-hmac-perl_1.05.bb} (57%)

diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
similarity index 57%
rename from meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
rename to meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
index 41b4e78c5..7b5980287 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
@@ -1,17 +1,17 @@
 SUMMARY = "Keyed-Hashing for Message Authentication"
 DESCRIPTION = "Keyed-Hashing for Message Authentication"
-HOMEPAGE = "http://search.cpan.org/~gaas/Digest-HMAC-1.03/"
+HOMEPAGE = "https://metacpan.org/pod/Digest::HMAC"
 SECTION = "libs"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://README;beginline=13;endline=17;md5=da980cdc026faa065e5d5004115334e6"
+LIC_FILES_CHKSUM = "file://README;beginline=6;endline=9;md5=6321739e9ccbf74ee5dd2eb82c42d609"
 
 RDEPENDS:${PN} = "libdigest-sha1-perl perl-module-extutils-makemaker perl-module-digest-md5"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-HMAC-${PV}.tar.gz \
+SRC_URI = "https://cpan.metacpan.org/authors/id/A/AR/ARODLAND/Digest-HMAC-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "3bc72c6d3ff144d73aefb90e9a78d33612d58cf1cd1631ecfb8985ba96da4a59"
+SRC_URI[sha256sum] = "215cb59cba610745cfb2d4b3f8ef756d590e57e3ad7986a992e87c4969fcdc7a"
 
 S = "${WORKDIR}/Digest-HMAC-${PV}"
 
-- 
2.43.0


