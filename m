Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00980CCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 14:26:36 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.6582.1761402385960747029
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Oct 2025 07:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nqNlHakw;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4283be7df63so1357624f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 07:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761402384; x=1762007184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fwelrRzIIin2ARlyFzBxCdxlFiu+PZ97uI2clpo1Sc=;
        b=nqNlHakwhVbl/P+HXxdEr2b0hbFE8gNPn0tEsG7QZeWlXcSb3le4VTel1slbGgau4t
         DP+dQGqtxSITf/KYeXNu+hPJ4RSrhjLV7omrlflAawLQ/FKg8/WQu+hXMQb0SXyP9N6l
         /x/PpgEJ9U7Cl+gS08CpwPB03I1pj1Q278uFSbR2IVbYH2qMmbjUru8WUA4HvSskNsOG
         /F4FfRcbii0FG08Umu7xXjFXDUZdXrwZRMt2ju8aHg5Yn0PjKJBllNntgBH246p4ibBK
         Mk7Zlfdgq74oy8raD//47GAIsqdEbJyAzaFBGiKfzgTDJV9/90XGvgM90sHdrGSMDJXI
         UdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761402384; x=1762007184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fwelrRzIIin2ARlyFzBxCdxlFiu+PZ97uI2clpo1Sc=;
        b=lUL8I/7lkfthhVaflQYoD01L7H+Ed/aFL8/Mg0vB8DGRhuAwWh+QRgyOn3QMs+uDtI
         rQjvHIIb77Bf0Ur9UZ7w13C8Loq54X4LK3LQbV3CCidDZxFe0qe72v3shNLsfs5khFR7
         RnpLI3pEe/ArkSkwixBaES32Hn6srY+LvdLR5ZPwotOipBzb1HantIakiz4KyGZZRcw3
         N4u9KOUUaZAYuRc8EHzVzhDk5PKQ3sS0waHjJjw4jXZiGYLjCRoRVZuRk3WDNUQj3K50
         +2L40D2Jm6kkMo4uyniU1Tk5Okt4pB7V8v1nMukJJAzBeJUvwMtNf5lFIRGEb0ODwLfd
         62pg==
X-Gm-Message-State: AOJu0YxPr932EkPcFnB4+CzFPa60nD4S+ocZKrFycoYNPsC3Rp2hoK3x
	ey5zIZKIu5DqL0nMxpTGSzUfEskhQCDTBgffor0jvmfAZKVPIcpILS7kL7qlhg==
X-Gm-Gg: ASbGncsCso+hTsFOF2il9UoPPNFyzglMgaqgb6H9a/1G0uD6vrCmhjT4fABY6n/cByu
	RlGbc7mKss5n/iK3ODoeYGVgkKOBNt4FJITVTezvMO11i5wq9X0nuebjOqmSwCvJ9nL9l42AnZK
	WxYiNvIjM5wL1ZyXez8XQPbZqSvESP/YgzXoQGQQxVCU2lvEIt1A5w/jLcPmvDKImkOhePI4VWL
	yxkBhVP/Kl0KFATAeFdqMGmzp4WwOdMd8nFkO/4jmlTT0BxP0DKP+Y3l629f6ZrIg0/AWtLWjpk
	KX6TnargaNLbmU3NLbASPmSrlfK7tDWZYL2RaIpn09pHK1S+FDZXFbFXf/R5QSL2X3inbx7z/tH
	Xa+Q4hO03SJNMQ2pKF6eLt1RY2Cfej9ywkqG6zcn/441szGR/Rdvx5dgSBvbQmSCLj8v5sne2Vi
	xiXN39+M+k
X-Google-Smtp-Source: AGHT+IGwivK9O2cYkRQ8yFXKZVOgIgqj+oIyP/wAOTDQEsS2nuG/Ks99cF3VhEp35uw+d6gvVzm8Nw==
X-Received: by 2002:a05:6000:186e:b0:3e0:c28a:abbb with SMTP id ffacd0b85a97d-42704d51e46mr25111204f8f.13.1761402384304;
        Sat, 25 Oct 2025 07:26:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7ce1sm3867482f8f.0.2025.10.25.07.26.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 07:26:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 3/5] cpan-requirements-dynamic: add recipe
Date: Sat, 25 Oct 2025 16:26:19 +0200
Message-ID: <20251025142621.1566114-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025142621.1566114-1-skandigraun@gmail.com>
References: <20251025142621.1566114-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 14:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121003

It's a runtime requirement for libmodule-build-tiny-perl-ptest

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../cpan-requirements-dynamic_0.002.bb              | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-perl/recipes-extended/requirements-dynamic/cpan-requirements-dynamic_0.002.bb

diff --git a/meta-perl/recipes-extended/requirements-dynamic/cpan-requirements-dynamic_0.002.bb b/meta-perl/recipes-extended/requirements-dynamic/cpan-requirements-dynamic_0.002.bb
new file mode 100644
index 0000000000..4ee221a8a0
--- /dev/null
+++ b/meta-perl/recipes-extended/requirements-dynamic/cpan-requirements-dynamic_0.002.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Dynamic prerequisites in meta files"
+DESCRIPTION = "This module implements a format for describing dynamic prerequisites \
+of a distribution.cts and (by default) mails MIME messages."
+HOMEPAGE = "https://metacpan.org/pod/CPAN::Requirements::Dynamic"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=818dfe6ef2e2204af6c824ca00e2b485"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/CPAN-Requirements-Dynamic-${PV}.tar.gz"
+SRC_URI[sha256sum] = "9e290179fd1ab8574f7a2297baf015ea4fef3703a99d48798f61ec9347b4905b"
+
+S = "${UNPACKDIR}/CPAN-Requirements-Dynamic-${PV}"
+
+inherit cpan

