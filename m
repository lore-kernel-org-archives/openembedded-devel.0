Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CADEC5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 09:12:48 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12709.1787562766910326294
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2026 02:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T52YO5rH;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c169ae1cb26so843455166b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 02:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787562765; x=1788167565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=spzJcEkJPfz1VrTbYAKExzY95hh1/gRXtQPWUEio4To=;
        b=T52YO5rHnFcSBo3LZ9b1lQ6o0HvGdH1XdTF7aMi1rRAZzYdORHA3S9ijPwQp2/5s1p
         f92Ow3zbC8PNF8KZeJWjWVPCxgMn9vzQG2NV5A1PWtk/RFZKsDvtbIBMgP+SjwUP4IIT
         5ozaQLWn0NfMq8TeVRzUsF4DsAy062eA7HVL7/A+aKRwebtk3zFLhceoGoNX8eKebOL2
         CdDIH+Wg2CiTUZCpqQyFIgvKgfwYXGUeiqaaLUStlJff4x5V5J1FGSGvPLKR+itaY4Zn
         AvvkURHff25TAyiRfnxMKho7+RaLxCm4uZdbfcZqN3RpnmMV0+rIkMJlOnnla0TyteFz
         uTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562765; x=1788167565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=spzJcEkJPfz1VrTbYAKExzY95hh1/gRXtQPWUEio4To=;
        b=bc9LuVb1e/c6JF0g19UtwG6REOrhSMynOTtipm5r5H++qkY7YCHZosw6PqcCGTKMxs
         8yAN3IfjzV3jKBuprrkV6ru0TV/xCL34g9ORezV1cBv7zqE89Ut8xZ7vlmXBAx+P+nKo
         8rKX+iYe4g256qA7swVm8X8xIwCwsfaJeoMGq3tyd0+D/ZlNJ4sjYQskTfm2jLtPS+aR
         OVikhrnIYVSHwGK54uLyUJ7QKT+t9Xu1LtPv7VXurr7k8fS8cqsl+3PFOJxE3SFbcROS
         qfkMbPyvSYIiioWTGgXjN7dfEzTYkslZW7d9DEaTtTIQo6HybXXID7+m/PWH/hCjudbV
         2IoA==
X-Gm-Message-State: AFuF++khhT5RIlbRkJlm1QjaBhv9XQP4SY0l5qsnsas2fBO76sgo1JHB
	EfPWT1pvHGJnJiFbZzyMAzdz4S521+36hdO85ZF6KUs1k5h5rKEVvg06GxHIi11DScE=
X-Gm-Gg: AR+sD11NbiMsrXDakf8EZ53Ug+i2mMGYcMsMh60bScgdFXaVJ42D2YjErYdRDP2Fj6/
	XzR2Ubyn3sjKvNwS6uuhGmbqDukynhG4SR0CTWIHKfVZxGteadFfuP/0qPCEoVj49cqR9ojt6sN
	w8tI7AvImdj7hvJynZEu3kuWwPQTj4im9soGcldS3DGKSghrAFK8it/CPG75ClERPv/JJS9HE6t
	VQOziaI8cqQYn2qyQGk1GgICba1vr3Iw6gcF0459Gfe9CW+GhHAL4NQlRh69SEFD3hUnLcGJnbY
	A/E7za3KNPE+cm1xUs3KNwolMiieDeI3ZaP3asY39i4NVvAcVMSSjujk4hnlkZ7auKJ/M5QA3x4
	8YNCfuMoyWkY1YrpL8H7L8tC+bpwSk88vzCagI4GBWEFL1E44EPya6CswnRnJTDlQwhSBfYU3XE
	fZWJ5Ta+0az//hl+Fn+BG/ZcA/qjjE6I41grCrZSmhrpwJh8oS7z/f6ILbcc0rHiPV5a+34+wDd
	JHCqMMw
X-Received: by 2002:a17:907:a01:b0:c20:7cb0:f33c with SMTP id a640c23a62f3a-c244d86d229mr2697678066b.16.1787562764948;
        Mon, 24 Aug 2026 02:12:44 -0700 (PDT)
Received: from dld58y9k4-lin.dl.net ([2a02:b025:10:2b61:2067:3222:ac59:1d40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm1285311466b.46.2026.08.24.02.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:12:44 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <locutusofborg@debian.org>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] vboxguestdrivers: Upgrade to 7.2.16
Date: Mon, 24 Aug 2026 11:12:39 +0200
Message-ID: <20260824091240.1405722-1-locutusofborg@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 09:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129456

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../{vboxguestdrivers_7.2.14.bb => vboxguestdrivers_7.2.16.bb}    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.2.14.bb => vboxguestdrivers_7.2.16.bb} (100%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb
similarity index 100%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb
-- 
2.43.0


