Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A6ECD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 15:39:14 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1302.1780414752685278257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 08:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FRuVdckX;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49068493267so67113315e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 08:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780414751; x=1781019551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpBV3TbczOTM/C8CKE861TAVVrPUQVcPRZh7brdHMYQ=;
        b=FRuVdckXq/9UwTsL2TabaxpBpFg10w3jBYvStonfyJNBHnxCeMc91F+I1GrjBlDd5i
         nz9Am13Oxr6g/ok6UweWzP5R2VQy7RbaVK6XBk+sJw8hGwmB4+Y8Pfysq67kL9OCPxSd
         sK52z3ZrapzeUgKbrblWzoVf9/EqlqeqhrU4ZWxhunUobPVu/gQCUGd5GWdU/0Yrfg1K
         9izaR7aeQ4y+ijBfcabHWoGuQaOznez4XOzdBsO0lHp61Ru+gfcM561l4bUJdex81hQY
         symwaLP7+oERK0g0JhukQtWmSDr5nnz4U60edvGuEVkacXjvfZsGKhBgZCOK5eVVxHi5
         RA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780414751; x=1781019551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GpBV3TbczOTM/C8CKE861TAVVrPUQVcPRZh7brdHMYQ=;
        b=sX3T5rj7zEJ+vUM5ftaCy3HxLwsIISrGNfGuAuMhPYbbAFuBDwc1gDiOT6znF23rn3
         SecqTba83/6Ewm9GYeVpn/czRcHMxF+Dk1/GGkFGWI8bpIsONSJs668tjplvByBwCKoB
         Qgsvoh+6baMnmCGgag/oftIHAQfIsORaWUjKTDqmTQNr5TzSr0Q1+sGyw024r3l+Pmvt
         z33H+WjCHPxAo7FVWhU6dwt2ADME1y86D1KobJBeevBh33UfXc9Eb7R2Plrb4XzhZpcT
         5piPr6ks72HcTrat5lGau5IFqHiZ/4ScxHqQ8myDxOkTCsrHswPOZhTix1BoMlI2xSwF
         SsmA==
X-Gm-Message-State: AOJu0YxuMQAS0M2XwPWjGQHGAuQjpjFa+hZq5HA3ZFIaNKSlpSZfTBOF
	njlYZO6vHiAAJ+9aH+uc6t6VgBfVy25EmfVwSyNK0zUn55y4kNDJfZD25a7L1Q==
X-Gm-Gg: Acq92OG5GVSrtaJagMmYpDxUaHT64MvkF4Ot5CQxiQQWIvsry2hWPC/goNBpbHf1g1D
	F4jCtvu7v3TrFWmdAVs3KdOWiaHjlENs1lITe0kzg/pd4AVLK4takE1XPDBYAr7/yEYVbpvUyZB
	1SWM489Z/O9pL74pYCdC+XAFc2Pt3QAbEjUyIbHcMnVeauGSnNdvhvJbKIMi3nFP4ubn7E9UitW
	QzLIYoLbq2eieqyrbt+sq1qFG0cC7Uah9VCzT+ZHFLAHAK8OBqCRJYmUmbbknyzZjdz2IERW7Xx
	6TYhD/AmMJQgN29iGSBMBlVeblQK2M4Jlo+kPN0ZGYepEXZBmGuysk0xQohcv/5V+gCMpUqpVJv
	3TAv63qijjSNBTXPW4VGdK1ooU2g1iyFPFW2gq4PFl/CXyswfFuAZIseIp5kjMtwsFmcT5W+/3m
	kyPMBpx3H5MRqKdM1xPrLhpbHH9aZyERrgxyWh7Y00zapxprlvM5oPxbc36tYsr13S3ZQlTFYZC
	jf6SzFt5+5W+fIO6nZWDw==
X-Received: by 2002:a05:600c:4e52:b0:490:9d1b:f086 with SMTP id 5b1f17b1804b1-490b50801b0mr4623345e9.14.1780414751024;
        Tue, 02 Jun 2026 08:39:11 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e3431bsm70154115e9.12.2026.06.02.08.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 08:39:10 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 3/3] mdns: Add additional clients
Date: Tue,  2 Jun 2026 16:35:52 +0100
Message-ID: <20260602153548.97549-7-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602153548.97549-3-alex.kiernan@gmail.com>
References: <20260602153548.97549-3-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 15:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127368

Several useful clients are available as part of the overall mDNSResponder
build, package these alongside the main binary.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../recipes-protocols/mdns/mdns_2881.100.56.0.1.bb    | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb b/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
index 391c4898fb47..4bbf012b832e 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
@@ -77,6 +77,10 @@ do_install () {
 	install -d ${D}${INIT_D_DIR}
 
 	install ${B}/mDNSPosix/${MDNS_BUILDDIR}/mdnsd ${D}${sbindir}
+	install ${B}/mDNSPosix/${MDNS_BUILDDIR}/mDNSClientPosix ${D}${bindir}
+	install ${B}/mDNSPosix/${MDNS_BUILDDIR}/mDNSNetMonitor ${D}${bindir}
+	install ${B}/mDNSPosix/${MDNS_BUILDDIR}/mDNSProxyResponderPosix ${D}${bindir}
+	install ${B}/mDNSPosix/${MDNS_BUILDDIR}/mDNSResponderPosix ${D}${bindir}
 
 	install -m 0644 ${B}/mDNSPosix/${MDNS_BUILDDIR}/libdns_sd.so ${D}${libdir}/libdns_sd.so.1
 	ln -s libdns_sd.so.1 ${D}${libdir}/libdns_sd.so
@@ -117,7 +121,7 @@ pkg_prerm:${PN}-libnss-mdns () {
 SYSTEMD_SERVICE:${PN} = "mdns.service"
 INITSCRIPT_NAME = "mdns"
 
-PACKAGE_BEFORE_PN = "${PN}-libnss-mdns"
+PACKAGE_BEFORE_PN = "${PN}-libnss-mdns ${PN}-clients"
 
 RRECOMMENDS:${PN}:append:libc-glibc = " ${PN}-libnss-mdns"
 
@@ -125,4 +129,9 @@ FILES_SOLIBSDEV = "${libdir}/libdns_sd.so"
 FILES:${PN}-libnss-mdns = "${sysconfdir}/nss_mdns.conf ${libdir}/libnss_mdns*.so*"
 RPROVIDES:${PN}-libnss-mdns = "libnss-mdns"
 
+FILES:${PN}-clients = "${bindir}/mDNSClientPosix \
+                       ${bindir}/mDNSNetMonitor \
+                       ${bindir}/mDNSProxyResponderPosix \
+                       ${bindir}/mDNSResponderPosix"
+
 RPROVIDES:${PN} += "libdns-sd"

