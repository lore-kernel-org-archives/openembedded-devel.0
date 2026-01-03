Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D693FC618C
	for <webhook@archiver.kernel.org>; Sat,  3 Jan 2026 19:02:08 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29806.1767466155197471873
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Jan 2026 10:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M9rU4/KB;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: sanjayembeddedse@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0833b5aeeso174909805ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 10:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767466154; x=1768070954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEHk3gVchn5kUlNn1ias/s2okgxXpSxMuwCTM8zhDXU=;
        b=M9rU4/KBxauRvR7aSmXQ+4Z6pF063ksKksC+wpcc/vwDWYiTNWH7N4uz85HoZxGIBL
         7Yt9WeB7d2nuog970M80m0xzZzRYQGB2tRjmRHObZ/rAg8l7u5zSmQ3DVt3J91UBchj3
         06rB3ETA0HNItO4tHdPPnaIjKPxkBgZGH3OsCwKSvd+cmoB4hzlSn6xzGlL/mjdJNGA2
         z+QAvdxUs7qGWY28aSEwK0MlQ1zkFeuzXDB4/EMMm2skaHIWiO+WiHLrc14be+GW9Gu5
         YCDIDPE2qUT1SQeYSBOFfNl0dkDAWlC0l0/ck4XUhwk2mOqJsY8WYoT1IE1mU7WvDD5m
         bfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767466154; x=1768070954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WEHk3gVchn5kUlNn1ias/s2okgxXpSxMuwCTM8zhDXU=;
        b=ENXoiusVSvzLK28jOemAsdoywwKv8F+ndfexgfXo52fTw2t28wMRvmzxoMC1VLBwgW
         OA8fwMfIpNY3Cw4i/8tJxSq+hYAqM9hNlMgsxjJb6njjEo5Bm4S0pfkLsP82a136ooR9
         0yrgg+Vwyl03eqz21Tvug3YQdxr3ZYzfz222ke0MuT5fz7vj3jdf66eOxLm8gb2Wp4OZ
         MWwmFeflXDA7zTlotgVkjcwyuuB+EXlL5JOEyKJB8C/R0RaGnmDwiVTzZkfAPRLpe4Ih
         feIF1YH2mVrwlm2lPBQWtUFkVXoVUx5Bw8l9DipF46dnWqS2MYNrL7jMTvutI4sA/OMb
         cC1Q==
X-Gm-Message-State: AOJu0YxqY5C5qFo0PQSRKey0NZO5cGUqX1b3mao999ekhTVmdQTi4FmJ
	ak9GfFs0gs2KhkZktij2jzUL0x4aS9AHWhwiigBdU76oC7A0me3KTVuZ
X-Gm-Gg: AY/fxX5FuvMNxMOhJ7cT+enMk5izESgKgtxWMWwRkZpuGKBQUh0Lq2o5Uu3t9kF2Rpy
	7hcay2pldfLYi32zQgIdS7KLHXOenQ/hhhVBjpRwIaxPaliJUZaokiA3vUkDVXOJADUTzCBw8YN
	cyyAJ5RaUImG6Rv8cF8Xce6beYkHrdv2JUnxzZnsFtmWoOt+vZNy5DKPRCUmqeHlxmhcw6MT0Sg
	w31YwmWD7BaukXMm+vtgHOUcm4SuUt1PZUEWMx1rEvbOy94cinJITu1qA8iZ7VDBWd//n5GKuq8
	Dhd4FEUE46sv0ZCvYPzp957rC/EUJoj7uavlEOaMCmQxQPqdrq1RfE36UNWkesB2vjIw85EIWKw
	kD/ib9KZ8RRpN3vdisMJbkWOj+HlkPTS64CyaAu/ynwSXSGNoSVsITXZSrUCqp8P8QmfQsc7Lwj
	bPPpLVxrcfmCMKoqtj3t0W21EF47fX1o/Cr7GW
X-Google-Smtp-Source: AGHT+IH+Tk4SlfLS7oiivtCJuO8RYXMVqrMRFv6XFklnVEFitpEOG1LfgTAoXTdswvcVMOflWyJIRg==
X-Received: by 2002:a17:902:eccb:b0:2a0:8358:88f8 with SMTP id d9443c01a7336-2a2f232c841mr458677175ad.22.1767466154480;
        Sat, 03 Jan 2026 10:49:14 -0800 (PST)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d3e1sm403448335ad.76.2026.01.03.10.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 10:49:13 -0800 (PST)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: sanjayembeddedse@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] recipes-core/toybox: Switch SRC_URI to HTTPS for reliable fetch
Date: Sun,  4 Jan 2026 00:19:10 +0530
Message-Id: <27202d444b49cf83c11bcc9425f145c8cc0b3cc7.1767465901.git.sanjayembeddedse@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <27202d444b49cf83c11bcc9425f145c8cc0b3cc7.1767354024.git.sanjayembeddedse@gmail.com>
References: <27202d444b49cf83c11bcc9425f145c8cc0b3cc7.1767354024.git.sanjayembeddedse@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 19:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123104

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

The upstream site (landley.net) serves inconsistent content when using HTTP,
causing checksum mismatches during do_fetch. Using HTTPS ensures stable
downloads and resolves checksum failures.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 meta-oe/recipes-core/toybox/toybox_0.8.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.13.bb b/meta-oe/recipes-core/toybox/toybox_0.8.13.bb
index 919743135b..6a5a155ba5 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.13.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.13.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 
 inherit cml1 update-alternatives
 
-SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
 SRC_URI[sha256sum] = "9d4c124d7d731a2db399f6278baa2b42c2e3511f610c6ad30cc3f1a52581334b"
 
 SECTION = "base"
-- 
2.34.1


