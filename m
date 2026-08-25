Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF47BC61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 21:35:38 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30045.1787686014822602532
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 12:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nkent-net.20251104.gappssmtp.com header.s=20251104 header.b=U10RNaT/;
 spf=none, err=SPF record not found (domain: nkent.net, ip: 209.85.208.53, mailfrom: nate@nkent.net)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a17cb94b26so205110a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 12:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nkent-net.20251104.gappssmtp.com; s=20251104; t=1787686013; x=1788290813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhXEMuyiNf9w5pUcL3gUQMsAWuPUtlAhdkZRXm/htf8=;
        b=U10RNaT/4z9fgj6XxI5jXBtXc52C81l8iGF4s4WwQayAV/doi3CJ08FbkOK0jutQcH
         Mn+0kPnebBmiDvSfHfHQFMz+Dq4tgpjMZEE12uLtCUDAheJPVVrJZWqiyNWodn0EzvE4
         a2tn7i0UAEWsyvx4T5kPT9YWqP0X421uiJoQEdTn/i/c6F4vs6STzDb4DcPwvlyGhQvX
         rtpxGY01TyDMuv9EZL0XpN7zz7KFJz4hNW5rGjAmEbRodKsDxGyTMMyYijGCNx0hI5hx
         ZVtoCngyeEOG/NeQ1DjYrC+jwuh4crrHk/9Pa+3o9zWtjfi9hYDz2uqFgjpEIrrocReX
         +apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787686013; x=1788290813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DhXEMuyiNf9w5pUcL3gUQMsAWuPUtlAhdkZRXm/htf8=;
        b=qpdgirTNUt4CJ6GabMH+4UlG+PfVC/uajpvWbpuxcQSd2DXIEopG7UHKK7N8AVFYTc
         AmaJEsFkF+UJ5tzJUS/ih1ZidGeA6bgh8tnotp44BxRYMzj946X3z+Z+RowlskgMVNEX
         tzcmQP8F1kMxoDdros0ivc0d6RHDdSkK4YBb+O2wFlC34jEdi1RNX1pDJnZF9TSN5m7Y
         ZB+z8b9nnl6f17MeaElvR/ReBvSj50IYZ6efIQoSXNbiy6L6TRa6xanV98DZqz4P/i9a
         WkY3n1YPG0fJj0O65oy9PG7qeO5zl4aEgtlas4sSMvcRdXta5N3g2lxiVTW3OSErae+F
         l61A==
X-Gm-Message-State: AFuF++kwPgqpRXqvtuZ1rPLdMaTpdJgKoRKzubJTrOUSGe6PJM/O+KqG
	eaDHiPT8Dvvp7CtUL1V92MSt/6kW8CYnjukTVQB0iTmGWJdC53ambEDWrZXSVX6iXkf9rQQJ4Ie
	HzBRzJvo=
X-Gm-Gg: AR+sD11CFF/VEvlIY5WsWy5PhEBL3AmU5MdXlvXnlFPNJtQageVXSieidN+CyU0VDuk
	mebhR8MtdEdP5b+faXbLrNOqBcAWZqppaEG3aztY3yR8WROCJr8DdthLM48FeH1tTFjFWKWMdAS
	SqGFqUQS4d/lBnFXgiGaNkKAuUcSqTUsW+6pbkSinur+i4Cw25+pHqTzlHurTTIM4OmyP6ZH416
	Q8/ryJ9Fv1A+Q9gC/+VEbcGYLaaPK/Jkdr766xoBpHUHneTxrGu9fUQ9CikDGb8ypmMlMIxNsra
	3xt11Srmw90NWxgpxHZYIIAYUIB6bOxTu9ReTiRVkJcpnsjAMlLk6/iql1wRM0yVxOem0FpdVZG
	M14ynHSfVqlQdb434Tw9MJCE8BGukZpcwaB11zixJd9SoXi+DOPjXCMGmyC52+8PmqPqU26kVXI
	WcIRqE0tAE1W5TVv6V3y1emoxXciARk8xT7V1aMtdBfmKtJjD7MTorIzBJrETbNRzQxdBUdpVPe
	ruHMnpEE2YhD1wC8BQSXjh+wvRfrQLiq0XMDnXI5RqDeEFzzR5DYsNRw7Uz++rMxfsX70u2Iot5
	sEroP3+TEdcdsk98zLxmGr0=
X-Received: by 2002:a05:600c:19c9:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-499dc6f5916mr12533455e9.3.1787685622494;
        Tue, 25 Aug 2026 12:20:22 -0700 (PDT)
Received: from akatosh.telenet.be (2a02-1811-e507-d800-9ae4-d494-8afd-3e84.ip6.access.telenet.be. [2a02:1811:e507:d800:9ae4:d494:8afd:3e84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dcada8absm2380565e9.13.2026.08.25.12.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 12:20:21 -0700 (PDT)
From: Nate Kent <nate@nkent.net>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Nate Kent <nate@nkent.net>
Subject: [meta-networking][PATCH] MAINTAINERS: add entry for nanomsg/nng
Date: Tue, 25 Aug 2026 21:20:09 +0200
Message-ID: <20260825192009.32589-1-nate@nkent.net>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 21:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129475

I am hoping to start contributing more to OpenEmbedded and this seems
like a very obvious place to start. I am on the NNG advisory board [1]
and actively working on NNG, while using Yocto for both my day job and
several hobby projects.

[1]: https://github.com/nanomsg/nng/discussions/1782

Signed-off-by: Nate Kent <nate@nkent.net>
---
 meta-networking/MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index dc549d7582..0974d24a06 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -34,6 +34,10 @@ S:      Maintained
 F:      conf
 F:      recipes-*
 
+NANOMSG
+M:      Nate Kent <nate@nkent.net>
+F:      recipes-connectivity/nanomsg/
+
 OPENTHREAD
 M:      Stefan Schmidt <stefan@datenfreihafen.org>
 F:      recipes-connectivity/openthread/
-- 
2.54.0


