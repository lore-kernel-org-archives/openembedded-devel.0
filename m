Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F483C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 20:13:41 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.4055.1668802417996677481
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 12:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ea+ARacg;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id h193so5884826pgc.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 12:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iM3pYGs+TLw6+qaskGa+7M6aQxyWKBVv+ljqUMkHLts=;
        b=Ea+ARacg9I/WhEIZk7MbLpeioe8b+p3DidL0YJ6tziel12sKL+i54D+iQgO/KO5hyH
         /c9yrZHw72yaghddCOyXBY1DBzncUYDDlZ2ViB0AqHJUD4eQOMd94b56KnT6+9VIige/
         X3Y/SrnIq5nN3pNV5wSgDJpHTOeO+E4RVAod8rX9NkckcemEqFfNK2xrWmw551UFFdRU
         bfrE5yjQr2tJxZluFM+mxv9vwqtptB/dRvOj1A6NhNmmZPFC5AjE8Fg7K17cILnSWJBH
         5Jd/UbpEP8CLo8udLF9WXRWkWmjcyx62l21V51I6wje3QtFgx7sCp0utV+OOZLZBysym
         rUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iM3pYGs+TLw6+qaskGa+7M6aQxyWKBVv+ljqUMkHLts=;
        b=YPuMSQLIovS0ZmceWmvRyPypmUJGsC9lnt2O6MrKlpRHB0+oYleXK3BOYQ+Mr62INa
         1pb/KJDPxBRFs+K663I5pG+GixG+Pgumj+HwgA7CJSE+NgqlKPOlRYCnw4fvNvM3K4Xo
         a2E2u/lkieEpAW3veiSb+f3AieHtnRym944qktVSMVUBX+MUwA+jpT8dm1hzljS5limX
         /j88TEkVc5zW2XUxTBA0XP4/CIK8W33wnYl59H73fZK/FnR60gkLvA4r03dVKdjVcGrQ
         lvWdspwdbdxLj96uJ+R4hvJD+DgI7kg6nCS2f8tfYZu5zSAtjiZDUPZobUjEY19Ir5XN
         4CTg==
X-Gm-Message-State: ANoB5pl7Fd54DZNl/GMLu5JOFsPWBvcNngoeD7mmgaOtQD2Y3tUA9Mu5
	3f3h3400Cw9HPMiS//2X/hYeEmTh0jTYDA==
X-Google-Smtp-Source: AA0mqf7Qa9eHJ+5tvnnvwv3prjEP9StNNnS9+X5UMm05v3bNHxvt/8ALM42gmW4Gc2IqpHg1THk4Lg==
X-Received: by 2002:a63:f925:0:b0:470:88:8c18 with SMTP id h37-20020a63f925000000b0047000888c18mr7984458pgi.23.1668802417020;
        Fri, 18 Nov 2022 12:13:37 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:b88b:808f:8d53:97bd])
        by smtp.gmail.com with ESMTPSA id b7-20020a170902d50700b001869efb722csm4132722plg.215.2022.11.18.12.13.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 12:13:36 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 1/3] libmozilla-ca-perl: add recipe for 20221114
Date: Fri, 18 Nov 2022 12:13:22 -0800
Message-Id: <97d5a9fbf64037303ae5df86920f0879e52afde7.1668802119.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1668802119.git.tim.orling@konsulko.com>
References: <cover.1668802119.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 20:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99618

Mozilla::CA - Mozilla's CA cert bundle in PEM format

Declared runtime dependency for libio-socket-ssl-perl

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../libmozilla/libmozilla-ca-perl_20221114.bb | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20221114.bb

diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20221114.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20221114.bb
new file mode 100644
index 0000000000..c5839b9b67
--- /dev/null
+++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20221114.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Mozilla's CA cert bundle in PEM format"
+DESCRIPTION = "Mozilla::CA provides a copy of Mozilla's bundle of \
+Certificate Authority certificates in a form that can be consumed by  \
+modules and libraries based on OpenSSL."
+HOMEPAGE = "https://metacpan.org/pod/Mozilla::CA"
+BUGTRACKER = "https://github.com/libwww-perl/Mozilla-CA/issues"
+SECTION = "libs"
+
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://README;beginline=32;endline=39;md5=51e666dce556490a1132e937ad3f8729"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Mozilla-CA-${PV}.tar.gz"
+SRC_URI[sha256sum] = "701bea67be670add5a102f9f8c879402b4983096b1cb0e20dd47d52d7a10666b"
+
+S = "${WORKDIR}/Mozilla-CA-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS:${PN}-ptest += "\
+    perl-module-test-more \
+"
+BBCLASSEXTEND = "native"
-- 
2.30.2


