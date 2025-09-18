Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D35CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 09:53:41 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.9927.1758189220050884009
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 02:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TxLefggK;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso1167920a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758189218; x=1758794018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFOyBFwNFBla+LpoK0BAx9scG8akeVatqnUT+ZQ9CuQ=;
        b=TxLefggKeRicbMqZkeKbfoqdcq2UTO66qIMlNAUiaZZRWpiMl52hb4bvBSYAWtKdtm
         xWUB8sWmlqa/tCGv6y9vDYXl3osVGTpHTPvYrCIuo/qNfHcEUd727j7Z66VWSM1V/sKr
         ElmwwGvMuu1KrbPWwNeR+/Iz7SOVAbY0Y/qO2V9MIejekSlS6xmKBiRy+UDANjdgiINt
         WUV1xPqY2tR6TsT7DG2aRltN6FGJ2puD30zZCcPUvDBA877r7IDYeqoDWwl27/O3cjec
         8/qwc0xDe0N71XUrhZ10jbwkHegHvC4o73KnyHwlF/sC3L/3jrbP2yjoguFSStYQ+PEJ
         779A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189218; x=1758794018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFOyBFwNFBla+LpoK0BAx9scG8akeVatqnUT+ZQ9CuQ=;
        b=eNUM8St+4jw6jXmrXStejQ6Ozr/+QKqIB0xbqT5rChesjp0uwtaJHo2WwrYrzyp9F1
         ZXMLABaWqAPOVGmKBFQpHSIk8yJACqiBJEDvhjnd3QEchQpTTbE0izoaA2AWUuTxLIkl
         QTq+3ObRkTYkYuVTFQC5AERBNz6W4aXwBtiVEMznKhuk2Q8XSzhrULkE6frYjPHqnJKZ
         vvV/EaDfuzkql7SE4l7BMR0LIC9A03yolUX1towrt4gD4Gs/GE5rPZipfJt5uhz10Uo5
         i+25tbIH7JAdroWjsv2OMZOueKknnEx/wE6aOGbJUFYbx072B7Cq91hyFpxoscKKz5Dk
         925A==
X-Gm-Message-State: AOJu0Yxx34JGHLQxF6vY23LkqCaEFekJOCUWNA05pPrhiyRhZqcPFvXR
	VUX3h6W8oaAevA1qcgEECZ4DnIc6aex4eXlnXvdSfNqFNWwp7QzkRNQz6TJfUg==
X-Gm-Gg: ASbGnctDNYpJcRfUjY/bZ8Yzk892bxgZ4a40/q7T70h5XWkVUA8Ow7lme+GzG638bSh
	iIOQun5ian4RBeulujrdUYq+JqkfxYncQ4Huj38J5fYoiGdTNSm+adhnFmzuErGuRX1HUgYkJnn
	CyJsn5WdIiFkDwrzWdKn6n8Pn/ZrI32e1i81EIGcGwbC9aAFBJtJN7w0pFGpXFLjrNohvc2z/oG
	ZvHRDgST7BqSO4Govg+IcYEC8GbdGETsUuMyKPCYGoTMPPnq12ym82pZsSacUX+LBahfOHRFKwx
	RFYucg5QYlIDNjYzcGe129HBWZZd5XIgsuViOmwcQA0u66srNUYha2R/CIjc0gPcEuqFmknZwBl
	UyBUqKmU8c7ssz1uubUhLKequEOr+yXaj7j/4Rr8=
X-Google-Smtp-Source: AGHT+IEFr/on0ZTA6ugO8Y+odkHEkRlFO7URWIBRKuVIO0LUEWe6aD0Rh0EHi+gjeqGyCHeoexl9iw==
X-Received: by 2002:a05:6402:2805:b0:629:8c4d:6a91 with SMTP id 4fb4d7f45d1cf-62f83c32a3amr5149181a12.3.1758189218342;
        Thu, 18 Sep 2025 02:53:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d1a89esm1168184a12.16.2025.09.18.02.53.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:53:38 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 08/10] cukinia: drop allarch
Date: Thu, 18 Sep 2025 11:53:30 +0200
Message-ID: <20250918095332.3369767-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918095332.3369767-1-skandigraun@gmail.com>
References: <20250918095332.3369767-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 09:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119549

From: Martin Jansa <martin.jansa@gmail.com>

* it rdepends on TUNE_PKGARCH libgpiod-tools so it cannot be allarch
  (or cukinia->libgpiod-tools needs to be added to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS)

  bitbake-diffsigs \
    sstate-before/mako/all-webos-linux/cukinia/0.6.2.do_package_write_ipk.sigdata.630262028cb276fdac170d30a265aa72d4249f84a264e11ea676a5ab38f1cacc \
    sstate-before/qemux86-64/all-webos-linux/cukinia/0.6.2.do_package_write_ipk.sigdata.5d193e43c71f1270d36075be6124bb70585bb682771cff644349c4a7ffd13605
  Hash for task dependency libgpiod:do_packagedata changed from d3dffb55884b89470065c3eaf046563e2f306706400be396b022a470ceca1916 to 76e47aed399fdbd14db3c4b75ef2b83298322429f111175d4ca4f3f4c67eebf0

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1db563c31023bb64d94d34807547baf1d4f2923c)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb b/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
index e4ca142c81..2b5b923e47 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
@@ -13,8 +13,6 @@ SRCREV = "a290f2dbb813ce12ba407962655a5d8b57322221"
 
 S = "${WORKDIR}/git"
 
-inherit allarch
-
 RRECOMMENDS:${PN} = "libgpiod-tools"
 
 do_install () {

