Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E96C83F18
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 08:55:12 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.4138.1752137701942927164
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 01:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=i/la0Erj;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-558f7472d64so1473998e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 01:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752137700; x=1752742500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiJh54HMA7V6GC01ouX+yvEbgwU4tC9acVcz0sdPN+4=;
        b=i/la0Erjp47VPPW45SjT+Qd3xIkqPg94yNcGVgpRJG/hVejl0p0vStqtN/6IBRuBfR
         NtH8X8ickt3gJ0mzgOeJ5DDycG+L7okLSRN+zpZn5/iyjcjeqLtHzkeZ/aRx/tftbclD
         4/kESfaZINd4l5/kHa5+z2Ur/j7dR23qJe6VPGxpY2UZ/iEiXg4X7V/935wNIFCI6wzX
         FT3QPKQF8Dv9cxre1eKb58Cny1K7G9xN7EqHP3E4FZFZOozN1ap0KLfXMRd36+IHj4fW
         KDbXACI6nWDLS9akemvDDKgeG6XfATLIJTpyWdjrr9pdcVzTH61srzFzo6+ON+dAyMGJ
         ENXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752137700; x=1752742500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiJh54HMA7V6GC01ouX+yvEbgwU4tC9acVcz0sdPN+4=;
        b=LSHFS6l3NLyvgP7zuwcreWgz/7Q9yz4cW79NlQtplGwL6Mbi75F68kx6NDw83C1Mhs
         0k+KFam3rGRBte6FZrSIIvf7NUEo3KxS8oa3C2X1/4rT/K8GSfb/B16VVIPr/b4peYbx
         LZDs0A/WgkA1lnrl+0BHbEcp20LtJBOKpMrXQA6fNEesAZDwZQajMa3QmVBBDgI9YjnD
         yDHQ6Oz3QuPoUW0eS/fvKFvv3QsKNjNVlgiMjuGNOXAkcHYDgeITnwMhj1CNUzbq3BAy
         AuqfZtAbEeEj73ng5nxkhnb6aI/Z/fqIGuYHLC3FYbrlTe8Bany/GLJ88OdxlKqT9qzP
         WGCQ==
X-Gm-Message-State: AOJu0YwUUtrjqrE5RsGlfDXKR48mUGsFaSkZ5glpXNCnq/JSLHlj3reK
	kzEyWPx38MMj5kt6YseRJ9ZlaZUAAa3V8S2CRW36cjIA3k9ZsOymZw0vDkrQO+CO+Di+hgwwjhn
	pMqVN
X-Gm-Gg: ASbGncv+uEwAuTa4MNItaBRoxYo/MLSXOBfF0KmsAlotTCSohUyk156MQo4nbn9YxvO
	gNu+nG7Fe54LLkxxes72a6Qq0zE9hA7j2OPjba/nKqUBpXuHx9r6Pu1yiDQRAsXjr1OHQ30vtUW
	3CneDWXeKPFwHxsvzA+WHpe1/VeQ1zRzBDIakB5U800fKFdXttvJs+DYez0nkPooiA3Qe75oFLH
	W35cSESC4jo7CA06JrAtLM23L4ke55gtoi8epTHLbKgpuV6FMsQr2VeBS5yUY8KDpE8tcY/yhqW
	zt+rdyCFZVGw/pLzUASNJewLv7TBhePLXB0WaCi5DdeLZOMfM22gq+/+MjB9EbO1bicETyngBvm
	KKtlFtJaoE2xj44hC5nMOScNLGqlZWETvbdFj3OJzcdxx00oWKA==
X-Google-Smtp-Source: AGHT+IFfjbBZPwQ9LIob6Ai8uJZeU8dtjkD/DjQQPYcSjzmREVtZ4zQsBiwRMAF4ToWtQfNorxSZbQ==
X-Received: by 2002:a05:6512:3b23:b0:553:2912:cfdc with SMTP id 2adb3069b0e04-559006e068bmr788667e87.9.1752137699696;
        Thu, 10 Jul 2025 01:54:59 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b6bb33sm282286e87.174.2025.07.10.01.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 01:54:59 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 4/4] fwupd: add conditional runtime dependency to udisks2
Date: Thu, 10 Jul 2025 11:54:38 +0300
Message-ID: <20250710085438.270911-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710085438.270911-1-mikko.rapeli@linaro.org>
References: <20250710085438.270911-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 08:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118403

fwupdtool uses udisks2 to setup access to ESP partition.
udisks2 depends on polkit feature so make the dependency
conditional in fwupd too. The dependency is not needed
for all usecases.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb | 3 +++
 1 file changed, 3 insertions(+)

v2: no changes

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
index ce21ad42fed9..e25fbe1f547e 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
@@ -85,4 +85,7 @@ FILES:${PN}-ptest += "${libexecdir}/installed-tests/ \
                       ${datadir}/installed-tests/"
 RDEPENDS:${PN}-ptest += "gnome-desktop-testing python3"
 
+# ESP mounting, not strictly necessary
+RRECOMMENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'udisks2', '', d)}"
+
 INSANE_SKIP:${PN}-ptest += "buildpaths"
-- 
2.43.0


