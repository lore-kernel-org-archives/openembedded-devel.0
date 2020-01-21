Return-Path: <sumit.garg@linaro.org>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id A05F87FD63
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 08:56:45 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id s21so1047041plr.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 00:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7Rg5sdqUwkqZ/bRuBkQDedOQNej7pBrNWElX3JM05Ow=;
	b=RiCl6Nq0SxwyniAKfNaWXB7M6XGtd5r3jQZ8ijrh+XhX6mb48EqWUhrlqFG8EG1gpn
	SJyoT7zxENOGdvhAcS06nPUuwaTbq+x+Ie1sjuTnmgVQJpq7OQOu+zDO/wPvaOaHsyCq
	TopAwh4T8O/Z732l7wAsx1IDlPjrj8Y7RINK35m5QintWAxBHFfOmkL6nwJjh4frOBpb
	Y5MLiB+piZp5Zb3K6GwquNwD8MKHEU0ohTbPwhBoj3ZErcLhxBfsAj5GmjrXTirmmiph
	yxlVmCIwzmhivPNNvhYTCnuI/9dtE3GyBMoSVQEDvBCflQ7xQwIYdGdIz81E2mgS39VH
	kTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7Rg5sdqUwkqZ/bRuBkQDedOQNej7pBrNWElX3JM05Ow=;
	b=V798SM/o793oHPsmy2h90F5Rz/ghZuM2x7v5em7DRZrYjUd2AoIc8CshHCQ721WjyW
	kWaHO2HW0fPYlrIm4Lkw8dh4kUrxWO/i5wUt58AwkXzwsNy3ClPKnSmeSqyHMU0zDuCL
	OWtRktuHUdtOSObYKvaQvIGUpMdSSWWwoU7592WwYK+Aj/cyfthb1qJemgJuUdf0eH2B
	O1InlGOzhRXbhADG440alyEb68JZet6kRH56c2SsdOhptDmfiVi5zsSxn+wrU76UpLFB
	cjDbl8Oqponj7R/mgRBqBr3lQMQ/eBJZ8hSMhyHwLK0YK00d1OyMhlYu9wt/l6cblWn6
	OJuw==
X-Gm-Message-State: APjAAAUQM1EFLHtB/rkD5YAS0sPa2hTPCF8bOMYpNIdOIFMz+mG2BC7V
	SzcwZf1O6FZDwTHcnWu/I2Mq8IbzPRw=
X-Google-Smtp-Source: APXvYqw44Oy21WZp/CjLGkekvW2fvMNipxj5k2nrdVKNLRsl5ako/1iVIWDc/a0Sxkzk6lfblJzEqw==
X-Received: by 2002:a17:902:407:: with SMTP id 7mr4233162ple.226.1579597006314;
	Tue, 21 Jan 2020 00:56:46 -0800 (PST)
Received: from localhost.localdomain ([117.252.69.227])
	by smtp.gmail.com with ESMTPSA id
	m22sm42546378pgn.8.2020.01.21.00.56.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jan 2020 00:56:45 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 14:26:09 +0530
Message-Id: <1579596971-24752-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579596971-24752-1-git-send-email-sumit.garg@linaro.org>
References: <1579596971-24752-1-git-send-email-sumit.garg@linaro.org>
Cc: daniel.thompson@linaro.org
Subject: [meta-networking][PATCH v2 2/4] unbound: Use HOST_SYS instead of TARGET_PREFIX for libtool
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jan 2020 08:56:45 -0000

As TARGET_PREFIX may vary from source GCC tool-set to external GCC
tool-set. Also, libtool-cross is installed in recipe sysroot using
HOST_SYS variable only.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta-networking/recipes-support/unbound/unbound_1.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb b/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
index 03eb2fa..6200214 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--with-libexpat=${STAGING_EXECPREFIXDIR} \
 		--with-ssl=${STAGING_EXECPREFIXDIR} \
-		libtool=${TARGET_PREFIX}libtool \
+		libtool=${HOST_SYS}-libtool \
 "
 		
 
-- 
2.7.4


