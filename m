Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D297C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 15:38:04 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.798.1632757083316416421
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 08:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mU8YRDT8;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id s75so1650222pgs.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xq28zo4oWG6D8ZoLjeRW6OXiDwO21zXvWM8565PsXJU=;
        b=mU8YRDT8tFHBZZMOErdMo+KwaHECTur/KndwwaEdClE/RFXLfS/hyl6oOXmRGwecIy
         MWl+XBw++BWm9bG8mwIEjtTvzcvFzigqFgKqqS8wgHPosOFwguQ2FNweIMtttydkOCo+
         x2FcuKY6uq8htQHxdjicD+RjK9BwTXpjqGg0fbnY+5nOLwnfe8PBNbe5pFSrso9r3Tf+
         84k72AF+alPIDkXWg/WBYQkkWhCpyM7qcWFH44jRi6Jk24UezIc/wHQNCTXJK+Tio8nh
         g7zmE8+lUcREBoJojcjobnsMJALQJAEwO+EMTT++NHO11abpJ6Shu/am3OLlnjY5GUS0
         EraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xq28zo4oWG6D8ZoLjeRW6OXiDwO21zXvWM8565PsXJU=;
        b=XGlrjMXUiO+yu9yYdiCRalnem9xkmOKzgp+qIj3V9cCiOmVDmEvi7elOjHFc0JEryw
         KAq/k1c2rYxpttIWfAHBssaw4UQ600aV4NLeLpyns4ylD0/Ntq0uhN6H3dlwDfEl1ook
         DbWDl/vLlJJWwHyi0PUriJlasYaIf2Dz/pqpgt8o+dGWYyKyVyHPK95j/i2l0hnZHWuh
         1gFf1cuP5A6Bts5TPXG56zx6kllc58FgG6Z/l2B2tVWZo+v6CKY6OrYrd+DZVPiSa8Vy
         FOu7mt2Rx82jOppLkK5L+7nSNgla9kMYPDci/C95ZyArjmlKTwwPW5RcLUnTXeMynLsc
         6nRw==
X-Gm-Message-State: AOAM531ttij/2EabAkncSRcYwutNp4l8MxwsRTrMyjwmUS7pt61wW3sP
	0pjfqZ3EDdzyoeZM/VYOan5IvGvZvbU=
X-Google-Smtp-Source: 
 ABdhPJxP5Yshi/yWJUA5b6dzMYEa2J/ZjHx2ZuIdkfGPoQW5WgIS2hK/Dnpd5bBzKRez9hxA+wruVg==
X-Received: by 2002:a65:45cd:: with SMTP id m13mr312274pgr.26.1632757082503;
        Mon, 27 Sep 2021 08:38:02 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:6ef1:b2cb:b226:747b])
        by smtp.gmail.com with ESMTPSA id
 2sm19805169pjt.23.2021.09.27.08.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 08:38:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [hardknott][PATCH 1/4] can-utils: rrecommend iproute2 to make it
 possible to configure can interfaces
Date: Mon, 27 Sep 2021 08:37:57 -0700
Message-Id: <20210927153800.1842931-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 15:38:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93150

From: Alexander Kanavin <alex.kanavin@gmail.com>

This replicates the fix from canutils.bb, for the same issue. See the link
in the comment for details.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 020b87add3368b259662c5994a5a9d7edaa58085)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index 3b2b6a9da1..78caa5be26 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -45,3 +45,8 @@ ALTERNATIVE_${PN} = "candump cansend cansequence"
 ALTERNATIVE_LINK_NAME[candump] = "${bindir}/candump"
 ALTERNATIVE_LINK_NAME[cansend] = "${bindir}/cansend"
 ALTERNATIVE_LINK_NAME[cansequence] = "${bindir}/cansequence"
+
+# busybox ip fails to configure can interfaces, so we need iproute2 to do so.
+# See details in http://www.armadeus.com/wiki/index.php?title=CAN_bus_Linux_driver.
+RRECOMMENDS:${PN} += "iproute2"
+
-- 
2.25.1


