Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11657CC6B27
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:26:09 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9334.1791969959052091428
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z1FrQ0zH;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-890d52c7c7bso3173617b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969958; x=1792574758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BFzdwDFW7wTV3svdpv55mLXc0xFJAqXCwGrZefnb60=;
        b=Z1FrQ0zHJm5mkSDm+EfoiuWWw4XqW73lMEJMS9d0czxByfwrh+yZsl9meGzndnTZ7k
         2MD2byqdrtw310ekw4pZUawDKkZNnXI/kciAj0WpgYHxS6xVAoIKePoS3uJB3h5u6XkG
         /1logKXwQmX2EP3OdcWqxqjondaB1iUhqEBYG0EDVJ7Iq/l422zuSLoTnIJzR/HrxOIb
         EsCmVJJo8a/IjOOD9CmgPe/WhxpffWLRPAa0oSixH0rIrsNC1YSyIStEYjyRBHMouNMr
         8A4HXliN/5jyvC5SvUxYZb/ezDQ0AB7AOAlmKFhvxg7v2X+9WRRw1wp93bTuNv6cjumh
         NH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969958; x=1792574758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3BFzdwDFW7wTV3svdpv55mLXc0xFJAqXCwGrZefnb60=;
        b=dFaHb8d2lq0nyq2Cuu9fozjOtkPNSvwEipiwpZnkm38nOvkwdZFCnyBv/YOa2HKM+x
         hTQmhnUaOaBK2bHc/haejCvMfRHTLqmck/1dyAsGQ4PgDO1Fc+xgndMGyfTC7BuWlcda
         4d2SIsFzn50ulIyfmy1Q0PIOuy4sUo27ZTX98xOXifcApllYV3ylnisxQt9NECC2EY47
         aNovqqiw5u+UbJS+SuBpEA6mBQw+3nagpbU/pXHpVirlqFyms+Kg29pGqsAs2wgqbKoE
         cSECh0Bs5ekAL9OCoRveT5xNafXmSZC/eDBTYPNO/z9w916sWnk2ww+MZ8h5Kqa01LNU
         CfSw==
X-Gm-Message-State: AFq9FYKYxqNn7TLC/D2LkUXnw74U2dxE1WegtrigyOHyBcBNsawEw/Ri
	J+U6OB6E+XEjgmBOrnZRFvVVa3F40IGO7AfQdlMjXIA4CSXgAAOgMUhYwuDqiQ==
X-Gm-Gg: AYBFou0KzK71y9AzhDGEwo/fgrXwBNnb+aEom3hQpZC07G0sR0Fy+ZYz1fsAUxoImv7
	gkCFmxiBlVacsoSm5K/c/MNgPDupcM+ivpJthWArNYiLoDjk5RCrzKDw/rSdzY1wd62uhknm0sC
	7N8Nz6ySUPjVweu39IIR8v7uIONc9VHH5VhicFX26l7j//1IPOHuwRYBOXV01qOxzbGLsUj6dTK
	gyhcsEackwfhekm1nF8r/dAOLkphFKzFuGMgujoPM97c/1GTLOFkW9csDT2AJtk+iJeqHApz8hk
	L+j+h9Af3Wc/ME43smjwjlFiR9fLV5ODzgqvN0If0+t9R/9M8YIwDjQyxl5bEJn+TldcYbdyeWc
	EcLW0Jlzecy+hyvaVo5pPiH2Asqni11GDqSbsJ4Lmlg0ySECZJD2tnvoYuO4xJLYAQ38lmaHIUi
	914gcLbHviZOwJWCwQqXlF/r+xBWA19zxYL+JPqXOj2j+/Qj1ZxZKPW3bT+FiiNDx1HqjKyauee
	L1GyNJiZFYqmLb+mVEM3twl9/2t7Z4J4q2n/l1fvl7oeEzGJQ==
X-Received: by 2002:a05:6a20:e282:b0:3e0:d508:59b3 with SMTP id adf61e73a8af0-3e16bf071cemr13125407637.71.1791969958340;
        Wed, 14 Oct 2026 02:25:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 15/17] libmikmod: upgrade 3.3.14 -> 3.3.15
Date: Wed, 14 Oct 2026 22:25:11 +1300
Message-ID: <20261014092514.454505-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130883

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://sourceforge.net/p/mikmod/mikmod/ci/libmikmod-3.3.15/tree/libmikmod/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mikmod/{libmikmod_3.3.14.bb => libmikmod_3.3.15.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.3.14.bb => libmikmod_3.3.15.bb} (90%)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.14.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb
similarity index 90%
rename from meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.14.bb
rename to meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb
index 2468943349..bfd15cabe1 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.14.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb
@@ -8,7 +8,7 @@ DEPENDS = "alsa-lib texinfo"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "dffd82b8f254c3489c32098da831f33eac7136843d1e7ccb802f1254ad5b4219"
+SRC_URI[sha256sum] = "dc27b338154b8f88dc9e6317196d42c6abc13bf63c4e055257a18d4e38e1afa2"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mikmod/files/libmikmod/"
 UPSTREAM_CHECK_REGEX = "/(?P<pver>\d+(\.\d+)+)/"
 

