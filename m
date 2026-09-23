Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A1AC9830D
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:15 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4151.1790160068701342925
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ChvvPczW;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85a4329731cso436973b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160068; x=1790764868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jM7jxai5MMWzj3o7rFdt9F08P2fE2/Py+HJznOj0i9s=;
        b=ChvvPczWd4VPwV9afSWzE6G+HWicnAVSZMBDcN+mdPm/GoNwHFxgQPtCkBBRcGT7Y4
         MZSS3zOLnbRKQrb+og8djpcTpScEB/ERfsf1Vn7jMAco4T7C3xyMuyE672EnMyEgFXVM
         w1hayx/SeVO9KkENyY7bz8qiniUpp/jVxBiGNX42HEoTQHNtkc9MGCJyavwRXtT0CcyX
         SwqVIhR4NwtGRcbxz0I1hEZqxipxBe0iRg7tPD//oVRsYszRJ1w+DBBRJGFi/sGxdvwf
         +K0bwQQ6AOGqpeMWUOX8DNTqSb+ezSSXob5b0/rD2V6kq3Q6j/KsrSXbd36iCEAHDCKB
         CFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160068; x=1790764868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jM7jxai5MMWzj3o7rFdt9F08P2fE2/Py+HJznOj0i9s=;
        b=ASJ7vL037FJe333l3vJZzwG47eTKW7zTpAXLO0hUt3Oq11mI6+Ux3GIkgp+9itkWxT
         EclAkX7JPMSdwvysVq0LgVFK1aCcoKOBvASOQi3zUJ20RaYAKXjZbse7VuObkPYyDaX+
         O1LGPZapon5UqFmqVBKBc+IyUF7HcshhyDx8w7myeesJwiI1ltln+h15WxtSXlcCZcrE
         o8qjAFIk4J2p3SUHp+PxF/KZYr/Tozy0dorEuzLOoIwHfv+HigXHQC9+wn79gM9+O0I9
         AxcT2S4GRCMycrOhi5oRDZMLPdtwTcztRxX0VO5NuDnVtYXLPsCJpcAcysD1wLHFiAJB
         3DoQ==
X-Gm-Message-State: AFuF++liN7zI+c2+La+pb3KO/tMyAPY12YMlAK/nfb5iNJ7Cyoo3/iRp
	oDf2Qplq6qjRI1l4kPvlb8//VAxGjBYcOQCOvwQqxMq1jk0Dxb0HjRde4HzP2g==
X-Gm-Gg: AYBFou1CwqWLTsCvG7pgtVQ0Rrd7n0xGgsZYjkj5xDAVNnln8y9lTwODNlCFqB3ycRc
	Qm0S/jkpwuecCeiKEYYfWpssgDCBvheK6rvCbafjPmRVGXWiYqrSaeWfWyyPSjyaLHEXFVHUE1j
	6YnK7z/l64j9y4++XcG77RsK1QB7Q9vPxcTNtbPX5d96DuvptxG1Y0ZLe7oWFfdPEarVwPtGOjg
	u5Zk9SkslmONz/L976un/jKNfI2lXQ6jWr7Lcm6qV3CUNJ+tP1oudLqnHh/F090ht5HynrctVR+
	vPINA71oFPs+E1DVOlc8CZQmGGiboZVohUegkTpEgw9FiT8fOiDztlTDmwMgpTznfGcUyCXgK/l
	/8C6ei5Wt2pYlEEnxE6EEaa/kzqlQgpZXPwYW8Q437Pmznv0iWfvX83uKRkEcrWNzkohyT3q+xy
	3UdFyaFzAXCdWNq2lVtqzmH98wXluB8kbeVFgH75gnV4X3hLWua8SSxY4en5Lj3gQoTFVTx4+4T
	axHuF4smiANQJlObO9DQEz/1di9IPmDig==
X-Received: by 2002:a05:6a00:1709:b0:860:507d:503e with SMTP id d2e1a72fcca58-87d1b0b57cfmr2034052b3a.20.1790160068018;
        Wed, 23 Sep 2026 03:41:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 4/42] colord: ignore CVE-2026-85062
Date: Wed, 23 Sep 2026 22:40:18 +1200
Message-ID: <20260923104056.457360-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130191

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-85062

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/colord/colord.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/colord/colord.bb b/meta-oe/recipes-support/colord/colord.bb
index e918500161..f129eb32a9 100644
--- a/meta-oe/recipes-support/colord/colord.bb
+++ b/meta-oe/recipes-support/colord/colord.bb
@@ -54,3 +54,4 @@ do_install:append() {
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --user-group --shell /bin/false --no-create-home --home-dir ${localstatedir}/lib/colord colord"
 
+CVE_STATUS[CVE-2026-85062] = "cpe-incorrect: this CVE is for JavaScript colord tool"

