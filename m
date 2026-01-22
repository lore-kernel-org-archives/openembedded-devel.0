Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0030D6CFAB
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 22:46:32 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51528.1769121991379247550
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 14:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KxcUcIDn;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b9dfc146fso2733827a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 14:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769121989; x=1769726789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d5pm4INzLdR/O+dXRvBZOVATrU4y8fuKMEUlSJ5/LXI=;
        b=KxcUcIDnOA0nd/PXhO6QGNeYNakKQkVBKqx9I0sIu9S3I9kys6unuj8tA+ljv/WiL3
         znvNSrje66nU/3BBpNxrYRQjCe1O6xQ09/5UDO6WTfPlX8D2MbMqlSTmAcM4SKjyDawx
         BEucunRJfqyl78eSt5bi6tfmu0EKUJYWJg5geAgokeaG7q/KIEADdSeQYVMOGPbJ6GiR
         gNq2XSpjEhlouQuSthpSPCcGM/YtuuD+Sd5wvTGwQ9qljPSV3F5fJxcnFBNiffCdfs2K
         AALdpowEI4/HyyiW8KCOPqRAS+1BaxhecQkjXN5qnMe9msOeZA07aJJP5ByKcPlViN2c
         wI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769121989; x=1769726789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5pm4INzLdR/O+dXRvBZOVATrU4y8fuKMEUlSJ5/LXI=;
        b=u2dTC/NW/Ch2VCWbk/ZxIwecMhftwIZYby5f2fN0rm0EdqUAs+ghUzVEHY5LCP1c4i
         c0u6l6IkXTeyiouFqVkK0m3RBO9SaPNBSFBIZBaLDrkHqhkMFju7u8EBLq/FwdNBlglX
         Yxj/pHKyrkAg3EWDxeEzJP9Hr2DKOBxNScMniDtpS3Fb9sidKfXos1Ed1bqgvFbTGiAd
         W80Qhyl7E46xDOTyduDHINxmz2WXGl7gJb3QD8QykKYidui5lOExPPYOPY9vQbvWP5eO
         6EqywvVqp6luqhPW+OYLGz763tBIvMaL3XQXxQGiAXE5zrlwBnd6RUJqa4yKMXk1m4o7
         xuPw==
X-Gm-Message-State: AOJu0YyqdGo5XCT+OSvuAuDEvUv0Jv2NxXxThRvkgkGDlHUssZm+TJs/
	AAxj/3aOjF4uNxR3B2a77FOOj0McuZE+BPo1Nj5boj6YtNAOGuOWng0uJ0ksDQ==
X-Gm-Gg: AZuq6aJ5QO6IWzU7waLuUqP1YwmFHAGTBGBrZFmWsvSjgP52lPpAzpT/X9VloeUpjmp
	ScemUW6WpdPXPw85kiWwvSHu7agrWQI/atAf8dfxbTNpGe6lRDj9a/vcyzwvKhF5ice4tiEBL5+
	c6lmbyzhnGAIpKRyFA0mSi0X/97EN6O+GbM6vcPPKsVzRc0u0d12RUQUbC1feh1K08Fc55Dddjp
	tXXH3u2eWKbUAOelZKMQuDkG7qup0LVaXsXW7rR8HyKIF/decePw0olkWNPUjF3OhYbbpjU3Zwy
	h+ZVbulk3/Ox7BSsqa8Msqz8XU0+mfVgYq1Qj6atzr6GMzFG5dVziaLEjbqtgyZxA6wLkXOKH32
	LHNjXM5r4CbHF7sIjDdoZeK30SqJec+msl4JwItmA+jQUcWj8YEgF72huN72XUuIjfMmSADSzea
	HL95/k49rMsk1AvPDowWFN52+eEdAPP+uSGpekV8OMm5YKxChbICuRobqyW1I48KWs
X-Received: by 2002:aa7:d8d0:0:b0:641:88ff:10ad with SMTP id 4fb4d7f45d1cf-65832eb77bdmr2076066a12.14.1769121988624;
        Thu, 22 Jan 2026 14:46:28 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b92b92csm263296a12.16.2026.01.22.14.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 14:46:27 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] unicode-ucd: adjust to correct checksum values.
Date: Thu, 22 Jan 2026 23:45:57 +0100
Message-ID: <20260122224557.1708389-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 22:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123755

The checksums are wrong and thus this fails to build.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index 890568d727..7a1b463c5d 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${UNPACKDIR}/ucd-license-v3.txt;md5=ea17640caddb659394df50e5db6efd69"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/ucd-license-v3.txt;md5=3049f4ad14be1ebf8c80a93d9d32b2d6"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
     https://www.unicode.org/license.txt;downloadfilename=ucd-license-v3.txt;name=ucd-license \
 "
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
-SRC_URI[ucd-license.sha256sum] = "abf84f74dea2812799e1dbef7f0581adf7db244881e4febb8684f441568da0ad"
+SRC_URI[ucd-license.sha256sum] = "e7a93b009565cfce55919a381437ac4db883e9da2126fa28b91d12732bc53d96"
 
 inherit allarch
 
-- 
2.43.0


