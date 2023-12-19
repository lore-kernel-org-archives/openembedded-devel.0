Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA78C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:25 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.6747.1702967237243429800
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LBIhmEIZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d3aa0321b5so19908265ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967237; x=1703572037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbNLlOtiAsFJaK+1zgTEef7NszlpDkI1BYSxgUaFTAY=;
        b=LBIhmEIZgwpAAQ4dJURJxfuUH0KVtX5mjwdSio3fCWGFgY61OUpRa32p0eESZOVh/f
         lSYLhqnN0qf2P/Z0CZ6W1lh7NyYD5dLCHw8F4tEnY0B/cR5oi4Yp0g3+Jb+onOPlDRd+
         wIl6HeTE1S4qZhjHgXUUNzoL/FCO042XeH11IWoXHZGGKziF4saHO2fwkAHBUYmtFSKF
         77tFHvIiy0nXfs0oLg43rZSjPeRIUPjvJnoOq0GDgdaGT3Rl/txJXAadZkOdTi+mElye
         5qkd2JbPhH4/I5OFpdtcucN87s2QFOT6Dw31UEFY4vn6+R/IG9CV81cHrPi3ibcQCGzg
         X+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967237; x=1703572037;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbNLlOtiAsFJaK+1zgTEef7NszlpDkI1BYSxgUaFTAY=;
        b=A06t2d/XO/LM/d52mLRK27QyVMS6NXbix0iQLN6wU4+yGKrbaHJJcEzMWATbWXXa4U
         36vCWN6uGnqBHtmcr36XAdy2/Ll0eyLyc7SbTcy+CSqaZI2p6h+LUmT87uWTImyzoeYR
         Y9SaqwXJYFSVgMwSD0OnUkwBrpNsDjdFwaxRX5qM1pSkLFNPxMM3DcSWJDIrU+EQ1pZ8
         MGUGTXFBL0eJNTCFXfBwk48bcigNaxlQGnH5A50kmM2lJnS/2SPJ/kLYTaAGEacKK/Zl
         7WmW/nd58JBXGgsk2ioT6u1TPBaNy4tSjDYh51s2/XXAGV0LNa5aWCF8QdvDix7Fr2sB
         ilrQ==
X-Gm-Message-State: AOJu0Yyz+abpJKIdGnFcLSxQr8Hz9Rx4K8pq1HSPJLdXCrNJjLZvQXmx
	+jY6AN9DnxUT86RhfBhp6fM=
X-Google-Smtp-Source: AGHT+IFbXrhxaM/58EFpjosNfKRPcgQigkmQ5slK4howAqpZQZpc55dFUzQ1dSNGwJrzK/N0r1+rhA==
X-Received: by 2002:a17:902:db12:b0:1d3:d9ed:f97a with SMTP id m18-20020a170902db1200b001d3d9edf97amr1117787plx.27.1702967236665;
        Mon, 18 Dec 2023 22:27:16 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214053348.1213663-1-derek@asterius.io>
References: <20231214053348.1213663-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-asyncinotify: update to version
 4.0.4
Message-Id: <170296723606.1627685.4495090220931142644.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:16 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107573


On Thu, 14 Dec 2023 05:33:48 +0000, Derek Straka wrote:
> NOTE: License changed from MIT -> MPL-2.0 in version 4.0.3
> 
> 

Applied, thanks!

[1/1] python3-asyncinotify: update to version 4.0.4
      commit: 8f276a9bae3c92114a12d6005f76cc041dc783dc

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


