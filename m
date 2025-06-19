Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A888C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 20:45:59 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.361.1750365953956349062
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 13:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dUKLi4Ou;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-453426170b6so13881815e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 13:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750365952; x=1750970752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AnS/yq30XQtsQE/uQLopx5CzlPRPXBnp2425G4wCkX8=;
        b=dUKLi4OuUejb9lGTLYcWXw0oN+IYf39Bj2xpVx5gCvYFy/kQv5KoAnKYXROQ7ZdUfN
         X/1WSHazOgTtWMfCVvJu/C1iGz7W16L7Oe2UNo0eDvc/X9tHZfV6EeO6PL0QDceZ3xHl
         BkD3VoGPenqrFRdQu7wt8JLFHKv2iGk3BqYo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750365952; x=1750970752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnS/yq30XQtsQE/uQLopx5CzlPRPXBnp2425G4wCkX8=;
        b=lYH65GswlFUod9kIvQCFnHAtirMaqAuj+eNTKAUZ6708VP3ILadubG5pf4f5JdVR8S
         hJJwpX/x/jFLYx9jjnlG2o5EeNGyH7h0kgYQoL3cK5ZZz+KZB7QzKe0VePQINfue01VU
         xO0ogPOGCuH0zPtUu6jXiFN8uCQiSXFGsPqe+FQiq3xgyswvNmXXvebwi3b5LOLOZ/p8
         o5p+CzoWSLl6U4RurLZbcj1KQ6WKGnrCG4703iMBGXVrPIctj2+cXY/v1fQRAM34VSPk
         LYV209OVDAwIvvNBpaxqanEutkjepCfT3B5w+zSimDLBmy2/sp3Z1DI+4UOKoGbXJcZw
         wrdw==
X-Gm-Message-State: AOJu0YzZQPoMA7X3xoYLkteAgdg4sIwx0DEX6IlICUkIW6LXYvjPrHad
	q66J85DIEVi+GOlGRUpEcDcqyKHG4+Suoj2lhBTrbLZV+Q35bt/Ut+JizbsKMVmyQtE1grqFtdC
	WzgpuRgQ=
X-Gm-Gg: ASbGncuWV8HNsS2gMfTbyPgFEo9SwDL1OQ/v87vZu8cstdWZHmyinZbRY4SMX78CqCi
	V3WQRUCijQAwK54XClQogngv2NTwDhAsmUhhmYrcJX+4cEsqsttjvQjNDBPDc0SyEO+Rq33Zl9P
	c+lNh0dQfCsHjFaLWyaNroFKErU8yAYDsY29wvV1aC6bXean0svsbddhh/N5oG+iNY8etUiz1Rl
	HyoWxzqfUhZQdEPlOad1r9zAkFIzMMIYDKHLcQqT178eNdpohyYoWYT4hZA25EfEp00aXdKMXT9
	9XK/5hwkwFHpr3QRvNCRSIhevugtmfebHzI/A1fTTmVzCa+n9q9wxns2N8qpSV0eaSHOBnuxQJX
	IeuiCG8W+UdsdKZ4=
X-Google-Smtp-Source: AGHT+IHs0F27NeM9sJlFKpS+Yagmqthzlp4DquNZqL8HAfcshrNB7VWzQoAB5fiQ8cTBK6lsSlu7mw==
X-Received: by 2002:a05:600c:c095:b0:453:60c8:f0e6 with SMTP id 5b1f17b1804b1-45360c8f520mr25596565e9.2.1750365951723;
        Thu, 19 Jun 2025 13:45:51 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f00d:ae89:6621:6889])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647084a5sm4510085e9.38.2025.06.19.13.45.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 13:45:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [PATCH] hdf5-native: Fix recipe task signature
Date: Thu, 19 Jun 2025 21:45:49 +0100
Message-ID: <20250619204549.2394424-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 20:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117956

The task signature for hdf5-native:do_unpack is currently machine specific
due to the use of qemu. This isn't used in the native case but the do_unpack
task was being compromised. Fix this by adding a class-native override.

This helps ensure yocto-check-layer passes for layers referencing meta-oe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index f34e5f183d..edaf5710e1 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -37,6 +37,7 @@ $qemu_binary "\$@"
 EOF
         chmod +x ${WORKDIR}/qemuwrapper
 }
+gen_emu:class-native = ""
 
 do_unpack[postfuncs] += "gen_emu"
 

