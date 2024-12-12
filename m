Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210A0E77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 19:40:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.46.1734032457158783551
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 11:40:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JaIuiipA;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43621d27adeso7339685e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 11:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734032455; x=1734637255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqUnhnPm3NqRWLvcJ3OHV8n2n+aqGQeks/yu6FSsBNU=;
        b=JaIuiipArweRt0EHKgQ+s80CBFD0IXFR1eAz1x7031XMm/dp7hGJIe21px3nrdGIPC
         46vrpG7C9uygg9py5BDN3Ul6SFmjD8T7tPMblQUXivhczptPXss2g62PIwVLJvia0cVY
         iWknAqP9kijB4+1j1sSbbj5JJ7aLrj/xZr3TRcWqOlTl4TyDsVBowIwvoyCXgs0N2+d9
         fxA2x6kma7zZF8nU51yp/7KSQqN0DJMkkZREHk5zJqVqFD84St9zC6Pcq/s7o6SuJHen
         m1HTQnuN0tCT4gB4usrixJ0uFcqGowP/Bet0la2i1v2DKPbYjI2ZRuAuYo6x6PcEJ8Kf
         6aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734032455; x=1734637255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqUnhnPm3NqRWLvcJ3OHV8n2n+aqGQeks/yu6FSsBNU=;
        b=WjcJjBWe51zsLbOarPdXTOB97JYqw5ugyPWvcoiJTe0YiMKDhBpY4zhC47Ap6KXmiC
         AD/FsqbisJi1jwq5YWs1s80JwzeQEMkzaRoXS7kw0BIhtNdSMe87663rKOqXfkS9ms2n
         Gf2Lc9ThC47qR09uJ2cGCBzjMq0EwYVOkLSCaC1lw1Pu+vyCQStj8aPFg70CjmBtA01i
         srhJ03uhhnYj8sawumbb4Lic6v8dNWkUs0Eu5nOilzfBvidneDoSAfUZmUghVU5Dwfv8
         W5MJiN3O6rUABftgC4+XuvqbFZePLhd1Dq6fuUzhVNHcQbUn07HgNLDphBsq33QNSDc1
         WhqQ==
X-Gm-Message-State: AOJu0Yxal5k8ymS5TGnIGcVaTDOkp7lgeNoDaRLRTaDTkBxvGaCj2RPq
	i2/8zjXx0uHJIWCP6LVgDTF5azxqTFXggsmXlPEFVQzXaYDtI/FoK1z3LQ==
X-Gm-Gg: ASbGnctpaIOmoskKzg/F8G3M0Rhbo/Y8Vq3Gvp9b9p1x/xO59O+mFM5/kRGM7GtFLcr
	Gg2nCtePWAT//MqpTvl6UEZmZuhEqBt8LF7X93zZpYtwRgkqnSeVH0ymOFI++oWSqfU1H/tYNmB
	KZNi2Da/Zh1xe02KEh0euKvVQM1Y8VccMgjKCDHQ+Jh84aXjydFzx0ORph9+B9j9Ir8os6JtN5j
	b6Jxc2lZJLiK13jvUjaoOhVomEmh863I1/oWAQlHjJfpDRVrWfNVn/32OvgcM8r8/ChFIMqL8O3
	mxs3ombl9MGghVciSHioksqNE5ITZUmyAwahViXCBjtSvvcNzKlYXvG+oVLZ+n78RF9cdhVuCBQ
	45FZH
X-Google-Smtp-Source: AGHT+IEXgUiaTseCXt5nK1DK+Ts07JwI893n3OS3GITKATC0UZL5S97r6zpZsm4kBDwjc+q2cdDbig==
X-Received: by 2002:a05:600c:468d:b0:434:feb1:adae with SMTP id 5b1f17b1804b1-4361c396ba4mr73976475e9.3.1734032454562;
        Thu, 12 Dec 2024 11:40:54 -0800 (PST)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4362571765dsm25788735e9.39.2024.12.12.11.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 11:40:54 -0800 (PST)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [meta-oe][PATCH 2/3] upower: bump to 1.90.6
Date: Thu, 12 Dec 2024 14:40:45 -0500
Message-Id: <20241212194046.874645-2-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212194046.874645-1-marc.ferland@sonatest.com>
References: <20241212194046.874645-1-marc.ferland@sonatest.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 19:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114296

From: Marc Ferland <marc.ferland@sonatest.com>

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 .../upower/{upower_0.99.17.bb => upower_1.90.6.bb}        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/upower/{upower_0.99.17.bb => upower_1.90.6.bb} (86%)

diff --git a/meta-oe/recipes-support/upower/upower_0.99.17.bb b/meta-oe/recipes-support/upower/upower_1.90.6.bb
similarity index 86%
rename from meta-oe/recipes-support/upower/upower_0.99.17.bb
rename to meta-oe/recipes-support/upower/upower_1.90.6.bb
index 5e2f04f31..2cffdc14f 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.17.bb
+++ b/meta-oe/recipes-support/upower/upower_1.90.6.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 "
 
 SRC_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/archive/v${PV}/${BPN}-v${PV}.tar.bz2"
-SRC_URI[sha256sum] = "de7177deb2ee23d9c505046c74a856564acab8fd1d39aa1541d123af5a99ca8d"
+SRC_URI[sha256sum] = "aed4e42a21307512ad236ad58d7ee4e0196670c8524a168a0edccdc32964ea0c"
 S = "${WORKDIR}/${BPN}-v${PV}"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/tags"
@@ -43,3 +43,9 @@ FILES:${PN} += " \
     ${datadir}/dbus-1/ \
     ${base_libdir}/udev/* \
 "
+
+do_install:append() {
+    # remove integration tests scripts
+    rm -rf ${D}${datadir}/installed-tests
+    rm -rf ${D}${libexecdir}/upower
+}
-- 
2.34.1


