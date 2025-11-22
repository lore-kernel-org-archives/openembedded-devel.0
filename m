Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5B8CFD2F0
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 19:31:42 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.966.1763839892657253983
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 11:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aWhQg6OV;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b427cda88so2067482f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 11:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763839891; x=1764444691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9UWz/c4Lv8BCfCw/+xSU3KvclHHjgoZyTcFZvuWDYo=;
        b=aWhQg6OVFZFOC44AzcCeNY+nsn7ehn8DBbdy/zZ1OJwK3q+i7ep1Q65fzoEa5zGCQV
         n7RChaj55Uz0rfwV1puLWYs43/fSVK2qqcurZeY1RmFz/yDUIdTtYL8ldQ/PR17nbwqZ
         reyQYdHbPqO0rZfzy9ZcFDZj8y28vGAWzy/8KI1FWB/xGEv+huQxTsTL1xg4kQCEtvXB
         NZ6NoQZXJyM1tSSA/Mwuo2FlGdUyNfII86+Bs29Qaq6Iz+twsnbfAOBsenROa/IQtyJt
         HL6e8XoBDhAwbHB+5fN0Va4ogEQcg8Vh+PP7MnhshygEzqEwyNUfrF9RDpucQESatEZb
         uSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763839891; x=1764444691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j9UWz/c4Lv8BCfCw/+xSU3KvclHHjgoZyTcFZvuWDYo=;
        b=gbXSufrpqkezNGawdK5hjq/v08FchGmWTx2dz8fiufDAw4LfYiaURtPcfy3vJRFcbw
         tntSg0IbDJYjoJc/1j1lIdedaiq7AKwyP0wMnO63IdF3CvBoD9C0x8hbVv8PJw0tukk9
         5uLvuucU+rDD4eh4a961Isi8ueafCVaLQS7ChE/1k8Lu+OjOivPpr/TYM+qVTxWEeBpG
         mi9PdTYsQEzQf3kIrRm5VGMVr6W5f06kxfhAj4ow3+zCcIxwEjKW1kQ6OiVTkGcma9uH
         HN994JyDw62L4OQmNn19VYN9T/NO/97O0jegmMnm0n40puhigdIyUwmXlPjzbdQR9Kce
         AyoQ==
X-Gm-Message-State: AOJu0YzyPNwVyHb2vNyMH8rLd2t7f3+y5bldjGLqJMADlVtNw8oamApQ
	Jb2TxtQF+lqxdDBNCYDfX2qQAQBhlFkMTW5c5pDYRkPdVx/2HdGvUp/504de7r/K
X-Gm-Gg: ASbGncuAawPdeK6Jl65c2PBe1/uvCYJHrcSmnEwMZyhYRrfWzGiIi/rjSLePYji8K+B
	6RkT/zxVbgqhhavgfQkVGDQ0N1ILt3j5MLar1h8jUU/rqzl2aXrh6rwIeBPQBEX1pDysaiGH5ba
	X0i8T+6GU7zjLwuSIvfv+X4E9ZfdRbRalWkNca6p3VW8O0cAGFP04+Z9EA3pRjzB/gqdkpOdrJB
	Lavp3rUWLy2wgMssoCTj0oMQiOIxTDXadDICTwWaXxNxa/oKm893de7JS7ALj15X7ir01+CUyuL
	veAt6iYpLRbCct+IxP6D6ndUmZklGhffWYJKGWUNaLhLzYo6QeiQ9pYwqeSrYkAxkvpHGJMTJWV
	iOs1GeOmrgdfI6cNhalppb8dTAQBqzGbWMMrUweH9UD9kMr3iar/R3SdsHIJMdFcNLmrlumQcg0
	7AQa7eE7eAA4DKr0s6CKw=
X-Google-Smtp-Source: AGHT+IHqy2dI98fDf9WQRWLzGVUETNsXjwXyXoSyFgcA1wCZ+mhTtuF37H0EdEHuQN5CLRP7s2/aJg==
X-Received: by 2002:a05:6000:420e:b0:426:d5a0:bac8 with SMTP id ffacd0b85a97d-42cc1d19624mr7453387f8f.56.1763839890971;
        Sat, 22 Nov 2025 11:31:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm18314686f8f.32.2025.11.22.11.31.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 11:31:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][kirkstone][PATCH 03/10] logcheck: ignore CVE-2017-20148
Date: Sat, 22 Nov 2025 20:31:21 +0100
Message-ID: <20251122193128.1703871-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122193128.1703871-1-skandigraun@gmail.com>
References: <20251122193128.1703871-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 19:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121981

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-20148

The issue is specific to the postinstall script that Gentoo packages
with this application - we can ignore it.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb b/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
index b40d52ab94..ce6118a12b 100644
--- a/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
+++ b/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
@@ -77,3 +77,6 @@ RDEPENDS:${PN} = "\
 "
 
 FILES:${PN} += "${datadir}/logtail"
+
+# This vulnerability is specific to the way Gentoo packages this application.
+CVE_CHECK_IGNORE += "CVE-2017-20148"

