Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A929DD36121
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.27781.1730831953951712233
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SIShakIe;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so49035167b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831953; x=1731436753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDHPbkA9D0kViPLcrWXSBorU1y/NvAX9ojPNIecDQo4=;
        b=SIShakIesVc4GwJ8qGmI0uSFuqOk+BNHU3fDl5JQkMnT/dVTh7DTpYqgp1dEQVAD0n
         Auac1EDZSw+iXMj/ZxFduDxc9ms68re3YPYFc8Lve1a3pfNJ5G510lbBVMjQOvkc1dA+
         Vn1TslgqKW1HVKQONlH9RhW4D5V13IQxnfNf+COuH9YBEQqjrwZ0joLgJfu/HSzISjzT
         6dbzU9jSKph53JC8ZI/s/Zze6lTb+JB98/Eucf6VcEY0F01WydNDF4MhecW12umI/OPB
         ZA1NvJ8cdLayRuarvEbDAPtJwKryGKXzAt2XFtX+QE0+B4iBAAHEWYmfWeqJjfHcUAE7
         wwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831953; x=1731436753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDHPbkA9D0kViPLcrWXSBorU1y/NvAX9ojPNIecDQo4=;
        b=oAW5zz+NbnoiPkbCKuyZ/IHNWx18U619dPEAOAcFPxIJeav3BPQTM9vG1J97A3tRP5
         J73JW2guTznj674J1emwRcCrF/flOAgLqIssPoTC77FTyFpiYZCE8f4oDJYDtrV1RZ25
         p4g8FPRfkP0vOPiAnFtM4P5gr57gLwVBvEQ9nZD5qIVHI83rAArw9y3k/9vuGCVESOdX
         7/2mcG9WVGzmcuklW8n6jgGoFex0TDo8e9006Sqps/Rgd90RXMvyNKMo5WqNXUR8ohJu
         GtYf8rHyf9R7kI2lQgwk9/R3pXB4lBoE1R5DqIT73qq7yb81gfGwNpCHq2dqNaRz1g9G
         siTw==
X-Gm-Message-State: AOJu0Yx92Fqb9O95C7dreEczpnFZ57bs6ooij7bxhoPe7/iLNi3yUuTp
	WBRL47gE7o6aLFuEksJuTYQVitmfDfCcrstzjSKTnDaDYbV7i+qWkT4EVOJY
X-Google-Smtp-Source: AGHT+IHTfyRWkpHHLxfdZ1neY0QivPkdGeXMgGNZsSUjOunVRIc5qh8e8thPYSg+002nctqzk8VgJQ==
X-Received: by 2002:a05:690c:dd3:b0:6e8:497:49cc with SMTP id 00721157ae682-6e9d88d02d8mr369257007b3.2.1730831952664;
        Tue, 05 Nov 2024 10:39:12 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:12 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 091/161] ttf-wqy-zenhei: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:07 -0500
Message-ID: <20241105183658.34982-93-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113606

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
index e2925b6c9..dc85617a9 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
@@ -6,7 +6,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf540fc7d35b5777e36051280b3a911c"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wqy/wqy-zenhei-${PV}.tar.gz"
-SRC_URI[md5sum] = "4c6c3f4e902dd5ee0a121e8c41d040bd"
 SRC_URI[sha256sum] = "e4b7e306475bf9427d1757578f0e4528930c84c44eaa3f167d4c42f110ee75d6"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/wqy/files/wqy-zenhei/"
-- 
2.43.0


