Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6A9C41513
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 11:19:39 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.9209.1718363973528725802
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jun 2024 04:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=a4JLBIj3;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.222.52, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-80b9c393c8cso553053241.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 04:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1718363972; x=1718968772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xA0dsHKCU9VNAoOdVyHx+XxpzBO60gjmbiYk2cz5xNU=;
        b=a4JLBIj3rIWk3vUw07WB0ysqIlRwHEVHNva8/6upsJCz5LUhcPTTKZuZRTpd55JjO8
         LGU5BDufuk9odgV6bTWUvIfYMOX83+RQk4+NAu5qCAEay6EvT6HLcscnFnpYfeeZZFk0
         5HdlNjGdoJqD/rAuPGr2UVF1qlxtR1IAa94xjvsDxlm2+1TOcieHYc4uAPZo0cXqGum6
         gmfLi917mH633GNGdYoSdHk/KaQk34rshkLuIlJ2ZqmOiv0CrO2KcMa28RP2dHIiJa0A
         8R1lVpZky6g0YClnNkqeWlQ8uGJqqn+idomE9wtp3Sv9PIKugJ5L5q7FiqxWrLx6gSPy
         9/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718363972; x=1718968772;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xA0dsHKCU9VNAoOdVyHx+XxpzBO60gjmbiYk2cz5xNU=;
        b=kKnL99ymgvjhrshJBMylGM0noiwk8z1oTt6c35QNl3sRKIKUDbFZyfrQcabk/B9Umc
         Pm3XsO/5gqUOz76ZPpYzLW0fPDQ+AWAEM4PF/7GpLbWpmw9vLZd4cR1+s1nyUqDsyO20
         KL7MOswKxzLhCRdWg69TSMGHbUxGXvssGg1T5flIJxeFvIPgvvvEZ93gmmzW9WGlTYYX
         66YhLZ30MWhbreGwmRVEcs+2WHn9KRHr5t9yryRbGNoyGdYsEM99bC6Zchjt8EJEhtUu
         k3NiPxnLvRX6r1gktbfOL+1UVN3p0GUOEI2DsCFY3ORB+NrzN2u/N5M5NU3NiM3K64NO
         Af2Q==
X-Gm-Message-State: AOJu0YxDNvtPy7nwULjxyD0C2/B5N4wqY9ltOEFzNAgIMi6aTcwn73uW
	Uw81zvuuppZ5tW1ackDBiOsX/0maNY8+U79DUa9g/hVBrg+U7HqDcdfmSV5LcIfcp2l0MWgZwgF
	4HTV2sw==
X-Google-Smtp-Source: AGHT+IE9pwOj3tQAtOhAOtzdVRLyrfATF/1d7+oEJbkuNdVvQm3efNTSK6C1mqmlvPV+XHRSS9NJeg==
X-Received: by 2002:a05:6102:2333:b0:48d:c123:60b7 with SMTP id ada2fe7eead31-48dc123687cmr69579137.0.1718363972449;
        Fri, 14 Jun 2024 04:19:32 -0700 (PDT)
Received: from Ninettes-MBP.home ([174.89.68.185])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aacb1e6dsm134668485a.13.2024.06.14.04.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 04:19:32 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] smarty: Update status for CVE-2020-10375
Date: Fri, 14 Jun 2024 07:19:11 -0400
Message-ID: <20240614111911.46353-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240614111911.46353-1-ninette@thehoodiefirm.com>
References: <20240614111911.46353-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 11:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110905

The recipe used in the meta-openembedded is a different package compared to the one which has the CVE issue.
Package used in meta-embedded: https://www.smarty.net/
Package with CVE issue is from newmediacompany: https://www.smarty-online.de
No action required.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-support/smarty/smarty_4.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/smarty/smarty_4.4.1.bb b/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
index 1caa4cd1b..e0979bb5a 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
@@ -24,3 +24,5 @@ do_install() {
         install -m 0644 ${S}/libs/sysplugins/*.php ${D}${datadir}/php/smarty3/libs/sysplugins/
 }
 FILES:${PN} = "${datadir}/php/smarty3/"
+
+CVE_STATUS[CVE-2020-10375] = "cpe-incorrect: The recipe used in the meta-openembedded is a different smarty package compared to the one which has the CVE issue."
--
2.44.0


