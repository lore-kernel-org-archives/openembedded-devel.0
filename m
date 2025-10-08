Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D482DCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 14:53:54 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.832.1759935228499405335
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 07:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gbhipOqU;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b41870fef44so1473872066b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 07:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759935227; x=1760540027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GfbY8fGzXQd0q6yM01g82hBsVEWS9zLOBuq0C7IkR1I=;
        b=gbhipOqUQR/Gfs9QPI+xaxObnhgEjmjQ4Sk2i/1gDNvjDfcFBb9dmC2S6mFURU2KBp
         dTX/Qu4MqBLsCdX3CACtIZ/AKoyVwq4bfcMahv5RW2qKq27/d+oRVhpwywRTHdK8gFtH
         pviDErgfYFZs8ZhTRdx98MXYkwubR8XP4vTNl2D8/PUPL39oUlXpXgR5FWicujsLFcJI
         Wd0XYErP3vsv9tapaGbgjvR1Q2IWKutNkbEpTFwaStjIWqmXDyMvQxjZx9lju/I/LdIV
         50+ok49WuhoT8Hw1cxLN54NzNB6tK5ybdTGEm+W68n9yfflCD6bAr5j0UZStqpCK4U2i
         pBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935227; x=1760540027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GfbY8fGzXQd0q6yM01g82hBsVEWS9zLOBuq0C7IkR1I=;
        b=I0GXq50ePPoxZkN4ha19I9fxyPhjBbzjRcC8JMijsSMsQyU8xjSPEFO25zxll6r3of
         HASENDPL7P+ocSBkkdIbUATu23Qppz86EmP9QDBs8CJpQZsThkoSFtrk1uGA+KygXKOm
         yk9N/Lb/ecyEzFvMw2ndhWXQJc913qGh1tasfZV/RzDfkj4YRbVaT6QYpldh6KbxLOD1
         j4cE57d1ePgmRof3MIZ2fZWUFl5epJBpg8wU74KaKFxatZu1KMHrCGruyQQvuLAWcKJ4
         ptisP07GjVEkyATuujkrf7QUSrU+fFB9/8rcETAw+c1li516P20+SToJTJdAnCIJHIrj
         gciw==
X-Gm-Message-State: AOJu0YxBn+ARJ+dFvsj0mSjs3rC4Pscq1XbmhMLOKBK+ycjitJ/asxtZ
	In07O5oz1Bxizt1F74otQuF1wccGeix6ruPv00Wa7lceJa4vpjjlAYvg3Hks0PM9
X-Gm-Gg: ASbGncuWqefhaTkVBaov0iX7Njzhz8RZ0qPbZEnsmXokil/pZLxnxdzH7P2ggsLqxx1
	A/Fi3/Y3ype5oAOWkRvQ3l9clTkHOaFwXYTQ2WhXKkgpBWVBUBRl0JwG4UQASrfntNZmKctEoyD
	T56unpKC+2NLxYUIm82zbixV2gRgB1bUZKa7IQ8L//RQuF9CwNPsMLzTtNIOlcfPTeCFKf5FpgM
	Bfv3igVOXjvQnHILBdhKxnV+eoSMjFYrL1lrrcgZibmunzZ4iP+qMURqaLjtNwogCEZmGZzuEkT
	Ap7N2O7JypRo1SC/46gEwgJlqLzFhZCoEURIqW7FrYt5m+XXasRg31a7dcPDQLayXUFumLlbkdZ
	LpJFHmaghuZPJ2wi5yZ7zZBM2hx0xvrWUhcS7TL6qhxG8
X-Google-Smtp-Source: AGHT+IHjq52hVhHhrV0MtVqbU9BL59l5ZwG89n6qQTSb1oifyCvRbFr46fnU354LhKazoDL+K0+P+A==
X-Received: by 2002:a17:907:3e8c:b0:b49:b75e:6983 with SMTP id a640c23a62f3a-b50ac5d1e21mr409882766b.49.1759935226546;
        Wed, 08 Oct 2025 07:53:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b422sm1687227266b.54.2025.10.08.07.53.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:53:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][walnascar][PATCH] gimp: ignore CVE-2025-8672
Date: Wed,  8 Oct 2025 16:53:45 +0200
Message-ID: <20251008145345.411895-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 14:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120369

The vulnerability only affects MacOS: https://nvd.nist.gov/vuln/detail/CVE-2025-8672

While touching it, also remove an outdated CVE_STATUS, which has been reported against
a very old version of the application.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f516be2c45664c5c03b2245c02995a948e8d2e48)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
index b1e61bf4ec..f30cc9f2ed 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
@@ -132,4 +132,4 @@ FILES:${PN} += "${datadir}/metainfo"
 
 RDEPENDS:${PN} = "mypaint-brushes-1.0 glib-networking python3-pygobject"
 
-CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
+CVE_STATUS[CVE-2025-8672] = "not-applicable-config: the vulnerability only affects MacOS"

