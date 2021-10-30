Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAF6C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 11:16:13 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.17981.1635592571834775551
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SROg5zjz;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so9176086pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XnanN53ZjYa263uGbbDoMVO2p5epdyWU8C8X36n6epk=;
        b=SROg5zjz92LFbq+/igkI+n99rSTLKBHg4gpOugWxm7vlqBMixCMDmBtOOqULRiLrdq
         XdgcvV/kL6Az3AhXEyX29RyfsZXcCanyJ/DQF7Lh/sT8zWGjfXOjrb0lG20M+1Sg+Pq+
         IkKIC5qDkhUWslOrLDLRsgSzg1c7DrruuJzE4QOimqET2kbXBlH4AAecc76Zx3LemVmI
         zWYZjtmNl3d7fYhriSRaTiQdnVBxNlKWJOKk4EfRjSFCoZ/nCFTryNpYe+4J/3d3PA0N
         oP0Mf/8gqas0+CeQup+pC3OVNge5lCizuWa73nH3Wx4v6uGgU+I0Pnaghk0BiHIczmDj
         jvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XnanN53ZjYa263uGbbDoMVO2p5epdyWU8C8X36n6epk=;
        b=FdyLRUTd254ECLsk4LC2TPhXh/Rjm6aARJi79ZfoTAFn1OQRpjFBUkAUdXltkJkeuL
         4dm1sQxN9sDJaNz2S/6C2jSxpIpU/8iTXBO7BQFEp7qMMzeqa6k9HPY/BHHmK1yQa8tG
         5BGbEjM38ibFpFf/OhO/wVBTqPDo7Tvg5Hmy7vUxgfBJACNFctveTE9cAhboXNUaMYth
         xYJ+jJD8gc0aqSSF03t5lCF+R94ZWfvnJApL7/xZ4kEH7SXAZINlLNbpkmaf8LWLVVHj
         2Ic4UmGjcFSzdcLQ4BTMpBtNvra28DVbHNgzgzsp/rXXzBJe8jr2IoAOfXUHO5CH1CXn
         IrWA==
X-Gm-Message-State: AOAM531JwBDjAn6bBhSoVAk94w+tHnwZEdoPifg97QOdLRRG4SEI/XQ7
	zs8uxR3Vkkw6UJgqLvXzyzGepIyK568=
X-Google-Smtp-Source: 
 ABdhPJwqb/VnpNO9HauWiTilQLh3QFBPecxaFZHXWLvDrgQovto4h3bW8oU3aibgitT+BZGb7O+99A==
X-Received: by 2002:a17:902:e405:b0:141:b2fa:b00 with SMTP id
 m5-20020a170902e40500b00141b2fa0b00mr7354821ple.22.1635592571183;
        Sat, 30 Oct 2021 04:16:11 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7535:c5d2:16af:d4db])
        by smtp.gmail.com with ESMTPSA id
 w12sm13880162pjq.2.2021.10.30.04.16.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 04:16:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 14/14] Apache: Several CVE fixes
Date: Sat, 30 Oct 2021 04:15:51 -0700
Message-Id: 
 <e886fc0cbac89998f675b70679d0cce6bcebfb7f.1635592420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635592420.git.akuster808@gmail.com>
References: <cover.1635592420.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 11:16:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93671

From: Armin Kuster <akuster@mvista.com>

Source: Apache.org
MR: 113457, 113453
Type: Security Fix
Disposition: Backport from apache.org 2.4.51
ChangeID: 9d7b58f49487baff99bf8f101e53217425a2b81f
Description:

Bug fix only update. LTS version
https://httpd.apache.org/security/vulnerabilities_24.html

Fixes CVEs:
CVE-2021-42013
CVE-2021-41524
CVE-2021-41773

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c59ce3299e8ed52a520a95f0bc0d0996b1cc37df)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../apache2/{apache2_2.4.49.bb => apache2_2.4.51.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.49.bb => apache2_2.4.51.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
index e5d1879578..4b36c50d55 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "65b965d6890ea90d9706595e4b7b9365b5060bec8ea723449480b4769974133b"
+SRC_URI[sha256sum] = "20e01d81fecf077690a4439e3969a9b22a09a8d43c525356e863407741b838f4"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


