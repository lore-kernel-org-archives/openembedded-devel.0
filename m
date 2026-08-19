Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24951C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 23:57:25 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2974.1787183842301942950
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 16:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G1u+nvXK;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cf50c6f235so16162685ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 16:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787183842; x=1787788642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TgeTST0Vg9eYPiaQ81xnv4NpAQglgOEhAObjWhkY9Y=;
        b=G1u+nvXKop0NgYDiKepW5uUGWdcorDWAARa3qdsQ6GWjzTFkT+grZDt0C7UnrXndyq
         YnQT8GVyEPEme5d2NlZYBuOTJQzLnm96ATEBvzDBKoBL3ga6sXvLUNx4B/qbS0pgVIJt
         Wt8Ud4EyggyK4p9aHbH/AE/OhueBZohU1GD28dIUXQ43Kn1x5z7n55l7DmXoOVYSo7zl
         lfaHtnLfnAOvutIKONcbm65F3+FC2/LloX12Oq11Hqo4QgEDsFkbT17zalnGn3ABFNwN
         /8zFhAgPwPLgbtjwvviWPBXGXDkCKtPXWo63boi8NnUM4o1SQfoAvI+QQHNgyxPWJdw4
         ar3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787183842; x=1787788642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TgeTST0Vg9eYPiaQ81xnv4NpAQglgOEhAObjWhkY9Y=;
        b=P9e/MPI9wf9uMoxpBz0Ce43tK2JMpXynMc+FSgusgfDeMI3tx2UElMC8QGuMoZu4EO
         VehzPpWKKy+OtFntNeItGvax25VrzBzZ/5Qlnu+PVVLjT1Co5Kh15EwYYlSs2qYqVl6X
         dNRhxWxdCLFEyzlYwhQQ94GuI5OkG98cifx0oMOXdm/3io/oaAtqvJNYBjD5cwLl0p7M
         RxdZ+QdD/KrnSazHPOYIVUz96W7jhdxke/lg2FadEB/Yg1i5joheE5cEJalIqp4z5ZbZ
         6xfkiS+l8cHCZFpaLvlJqIZpbynfB9aEWegO9KcxRdrxuENquFa8DBRqo9NtroxdSLbN
         t6RA==
X-Gm-Message-State: AFuF++nuVbPNljXqX1dixgDDtZINhBqY+tB6UITlUHnVAUoM8QxVNNMQ
	QiQblkKclEsrg72mDr6OB7V+5tzp1Z+0qq08PIzCZzY9Q5ziY5L/QE/KB85fKcZM
X-Gm-Gg: AR+sD10CrQ/kDn2ryyNBg4cVQh9d/0sBnRziytiQpNnnlEcFRbJ7KWM3speQvrSdQa/
	YjJ/BxvkWJqQB1MIdW/YtmPDW/9Lh6FiGxoRck13iJwe20KopkFuXvBp7pMW5xguUtafiGvA4iv
	c24b+jeTl9zt7rLxaSuJMZtn9KU0gFBOJE9stlZ0fBMEsAjR4e9yGk5Uc8uNhP2K3n7vPnBx3NJ
	i+ye16zrovMY+6HFrfIaqj2nCtFWxKW3jFYLWTv7HWnN0gto75ciSqsQChqNvso4JnCY+YgorrD
	PBC05TcrJ2/FESc58oCCz085BqkrYnMUeu2oe6uEaQ8ChZgW7BfCz67BM9ISTH1LKkzXs98otjV
	LltkOKdy29Nhtn7nOZEdSU0znJ5F7nPxsCcRhBgf/QHm71FQdBI/atv6QA9T4zaVni4z24vUP02
	HxOZV99IVQ+ANcLhJbCSboptLRdCXkxfUmktX5c4ktHX6SvUcuE2Po29nhdywpPodHyx3X1J3l1
	TTqMs5slw4qTQsCqbP8/luxzb0gI3ECftMhg49LZmRoc79U/HghLJeLZ+Cf8wr6i1jWhbAYyTP8
	JvNJPMCnBBdzc47H3E3KzOEBGkuIO5UMiu4K4ekRiD4cHjD6IE00ExxOUDsP2KgfEm0F225eOEp
	odnmdwalHC/ZZPSwQgqWhi40Um1liw4pgODKW5XzVtecBig==
X-Received: by 2002:a17:902:d2c8:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2d5fd5eb7fbmr149031905ad.1.1787183841455;
        Wed, 19 Aug 2026 16:57:21 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm18411174eec.26.2026.08.19.16.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 16:57:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/3] openl2tp: do not clobber the ptest-runner RRECOMMENDS
Date: Wed, 19 Aug 2026 16:57:16 -0700
Message-ID: <20260819235718.3372843-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 23:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129368

From: Khem Raj <raj.khem@gmail.com>

ptest.bbclass pulls ptest-runner into the -ptest package with

    RRECOMMENDS:${PN}-ptest += "ptest-runner"

but the recipe then used a hard assignment for its own recommendation,
which overwrote that and left openl2tp-ptest recommending only
kernel-module-l2tp-ppp. ptest-runner was therefore never installed in
the ptest image, and meta-networking-image-ptest-openl2tp skipped the
whole run with "Test requires ptest-runner to be installed" instead of
executing any test.

Append instead of assigning, so both recommendations survive. The
openl2tp ptest now runs and passes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 789ffc86ce..0d3953d35c 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -97,4 +97,4 @@ do_install_ptest () {

 RDEPENDS:${PN} = "ppp ppp-l2tp bash"
 RDEPENDS:${PN}-ptest += "rpcbind procps-ps tcl"
-RRECOMMENDS:${PN}-ptest = "kernel-module-l2tp-ppp"
+RRECOMMENDS:${PN}-ptest += "kernel-module-l2tp-ppp"

