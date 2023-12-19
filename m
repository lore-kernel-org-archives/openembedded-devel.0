Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F548C46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:28:07 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.6779.1702967277195810743
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DXhTTy8A;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d3aa0321b5so19911965ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967276; x=1703572076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=up6iqs/I+RGsiluULEdzUjThxX7nACj54j+aPPAU8OU=;
        b=DXhTTy8AMNXs+Oe2+vrVqZLUADALxdcAMVs+J5S3Gl/DQBPsnPh3vGPuKYRZbunZYb
         M1vDg/v5uqYJh3coUybdY1RAc10RJHSzstZznOvI0E+MK9ygUaKQkvtEshRuUxJ89RKj
         WSZqQHocW3kxujCd0uk+I2JdKPvBKMMPPzic9YwUyoEoIDy9cFwq6ODWTYpzuSslk9OK
         2002rUrlKrqwQufhsRA+WOqgeSiDb/ejPTmDEr22Q0WAe14cC0PqJ135bTcDL2iJRFNB
         o+d3n9SMEsaNJ84EV30teTHETSONiScZF5kxxePEbMFnLsOgx3kNZ4hiX2XS2SZExHKW
         FEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967276; x=1703572076;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=up6iqs/I+RGsiluULEdzUjThxX7nACj54j+aPPAU8OU=;
        b=bLGGQimObrojQnVcTgpwFWBy8MZAoPd1uzgypV0tiUudDpP0D76KJiQo87/LcP4Udu
         DPVllKBROFyyMScEMSHy6DFN+kWeiEVM0kQvlUV5xm12W7vcZYbJ0H9aauTPZrA1oTFs
         K9KixrWrgTWiOOohXrvjmLaxqfgBo59As9LnHNzSmRe9TJ2qR/qMeCxwqUOeFjyxyPWR
         EQXbQ+hGu6L5ojfrwZqgx2sFUpp1mHVfml307EL0uiCJaszvS5gU50u8XTRsym0Ef7di
         fjTxJTyerAYJbuClSSCeLk6HfOU5DAhLP5k37mdsoYjucJpHBl87xdUM+6rl7REMnxNb
         oE1g==
X-Gm-Message-State: AOJu0YyTTqSkL49c8el57x2zDclzUP+qm0f9phqWCCGIAYmYo/fRrQ5i
	DGLjvC+D/s48R2t5cVJLjlXc9P2WV2I=
X-Google-Smtp-Source: AGHT+IGtEpzfrGxA8YBrPszvNqQUAE9B4ZyVvTuNbchuF3hddAXT2H7iV5mf1FGEWcb91Sd13k1N7A==
X-Received: by 2002:a17:902:7ec8:b0:1d0:8cbf:39db with SMTP id p8-20020a1709027ec800b001d08cbf39dbmr15449784plb.88.1702967276550;
        Mon, 18 Dec 2023 22:27:56 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, thomas.perrot@bootlin.com
In-Reply-To: <20231215100444.122616-1-thomas.perrot@bootlin.com>
References: <20231215100444.122616-1-thomas.perrot@bootlin.com>
Subject: Re: [meta-networking][PATCH] networkmanager: add missing
 modemmanager rdepends
Message-Id: <170296727604.1627685.16559564723130521543.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:56 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107619


On Fri, 15 Dec 2023 11:04:44 +0100, thomas.perrot@bootlin.com wrote:
> Fix rdepends with modemmanager PACKAGECONFIG enabled.
> 
> 

Applied, thanks!

[1/1] networkmanager: add missing modemmanager rdepends
      commit: 5edb8335dc46450fd6bcdbb3fcf55336b32bd422

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


