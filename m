Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15911CD13DD
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 11:03:44 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.48407.1695035023301857714
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 04:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=BnFcwM9o;
 spf=pass (domain: thaumatec.com, ip: 209.85.167.53, mailfrom: dse@thaumatec.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-503012f4e71so2138692e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1695035021; x=1695639821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6PL+22q+iwDpn/bFREvH65AbjYlLBsW4ubIZqPD69o=;
        b=BnFcwM9oLJHowdbnSruejbEPpupqrAbvPE+1nCWYT0n0OnTaozwBVE2mIjRMRsLDpw
         6JKWWyBrf2XFJcLaYcM8KTgdiJhNWUZes7XgjQuS1ihDsp07w40SD7DnzO72eZPlxUtB
         s7heM06IpA2LY+vn5C6UqHwxryXjcgjvEAQrBmwtqndlLadnvY3OnYjBrtWRoQc05YZ0
         HuPL9jRjr/DT9syehfmX2TIOf/UeN7nKU2148b7IDzrkinc5QFG1GS9oeC0AdyEezEBr
         jWufT7hbrw9xn4bP0s9TTW8uDsM7gLzYouxjn7hHAQqLFpSVQSQ9pEBlOgOulHNCmvMV
         wrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695035021; x=1695639821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6PL+22q+iwDpn/bFREvH65AbjYlLBsW4ubIZqPD69o=;
        b=JYC9MiQFfZRNI81vSKSZJA4yILWMH/PcKOP++LJiu6TJkFbjYN95Aeu/SInkVX2wEB
         52oHu1NAtCJjIbaFyaDaKGQfiRZV+sy1vktgSS4GpnF1Sikf7ui/4pOJrlsdYfH40OJc
         GIkKMoFCXtEeSS6Bkc0pFdgmAjmKqysE8dhW6zkmXHmPmRDAP10oY2tjFfLPuIpSSVhJ
         WNrtgDdxnODuwZ18BQrbT5BFJHe3cu50AScIeJcTE1acflDizdY16TN3Jc2Cc79DbroM
         yzR65egZqAZDuhqk1yFHW8Kc32z4HyiW+FhG92tzIk9Ab+0sh1KOtcv8xMIzffJKe5TY
         lqTA==
X-Gm-Message-State: AOJu0YyTXA/ZgYFmlDbOob+0VDBbk3H6sciqY5CA6Flzg9hFcJ75JgD2
	efEMa7X2g+n3U2SdipVoV2eNDLFkD16gt3WwjYy9vg==
X-Google-Smtp-Source: AGHT+IFQRnw5qQHDm8CFHos83U219f9CbCYu5wHk71y6tHJfnd8yOFzoEmzd9kFlFUDqhR29qZDSRA==
X-Received: by 2002:ac2:4bcc:0:b0:503:a85:5d14 with SMTP id o12-20020ac24bcc000000b005030a855d14mr1347106lfq.17.1695035021221;
        Mon, 18 Sep 2023 04:03:41 -0700 (PDT)
Received: from localhost.localdomain ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id p5-20020a056512328500b004fe0fead9e2sm1040226lfe.165.2023.09.18.04.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 04:03:40 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [meta-webserver][PATCH v1 2/2] cockpit: Move apps to a separate package
Date: Mon, 18 Sep 2023 13:03:02 +0200
Message-ID: <20230918110305.38374-3-dse@thaumatec.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918110305.38374-1-dse@thaumatec.com>
References: <20230918110305.38374-1-dse@thaumatec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 11:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104926

Apps (Applications tab) is an optional Cockpit Project package.
Make it also an optional package in recipe.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb
index 260aaa84e..262302424 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb
@@ -61,6 +61,7 @@ PACKAGES =+ " \
     ${PN}-docker \
     ${PN}-dashboard \
     ${PN}-packagekit \
+    ${PN}-apps \
     ${PN}-bridge \
     ${PN}-ws \
     ${PN}-desktop \
@@ -114,6 +115,7 @@ FILES:${PN}-dashboard = "${datadir}/cockpit/dashboard"
 ALLOW_EMPTY:${PN}-dashboard = "1"
 
 FILES:${PN}-packagekit = "${datadir}/cockpit/packagekit"
+FILES:${PN}-apps = "${datadir}/cockpit/apps"
 
 FILES:${PN}-bridge = " \
     ${bindir}/cockpit-bridge \
-- 
2.41.0


