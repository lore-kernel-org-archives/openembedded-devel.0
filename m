Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36213.1793161534361530954
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=H9x7VQ51;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso318346a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161534; x=1793766334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxAfvYdqH1sviq2SusgO7lY7Omk1Pefkff/vwrWA4uE=;
        b=H9x7VQ51/+cUzDp2VGB18xyQmj1Z3S/vCd9VN9ygcB5Fh/v0xGhpNQTDTVamPKnG4c
         aS+7mTIHtKIMmJab3wBlK1CkC4QJjokmAWXaegMMCdujhEvA8kBmi7C7rdnHPyNjRuGF
         vtyMAlG/1U0NDST+WGk0+S7rCQ3yFYVdzdhwlIsan4IgTFDS2x2CHGOLBqRiAFW12tvF
         TcU8kIYEGuLCJyHostunW2XOImRCiEOr55/e+b8Stj/jIjQI0+LcMXb51hxhoVJBPLLZ
         U6dfgMYZ5CvJXGfEcacnNUgqlfjnX0C/aRg3IohWR7uAaKpbDFUANx8HPZ6VgdZxnP8l
         JgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161534; x=1793766334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fxAfvYdqH1sviq2SusgO7lY7Omk1Pefkff/vwrWA4uE=;
        b=sMlvejL+1TeosDUMSC9JzrClsOmVAMnpLsKXrBFMv7PHh2YeTUKvkKaYKz4yU4IXWR
         4NqmqeOg7gfW6l9QGYKJiR38yLvbpsEUpsl2F9GN/6Y3bupXQJq2beyS5jaOCf+Khuui
         jn+N71U/Y2Ly51dt0yGvqQu7GX4xWk8C1S0VuTfGaLwXz6/NF7TRM6sK5J0/OvZUfvXs
         50nJNk/ZGWiEbiyLxL1x08WCcPqMeHhIkHiVHDRximU/SoeBgdbs0ElGRjbEbTJ/2TT8
         KwZdoZupwnt+9A+m5cPYL7/IEKXyvl3h2VxxAiPTrFiCBbFUxT8YdGNaaxVVbVvN7EzQ
         TOjg==
X-Gm-Message-State: AFq9FYLubJQZTB4Uxf3qcatXSDAocHQNeAIzWFfKcvPsQJqhxAKTmrZY
	6+7PLDyDVh79m1slEAfyqTENkKMJU/dnto1rd4kEN1IcBNjLJ/PC1OwGS5xp1A==
X-Gm-Gg: AYBFou0oRP+3MJORX16ocKJyK4FyvvH1ayVUO3hJkPyO3CY3YeeV6+wVC2WMvvOrJIg
	G0WTVskcEynZSxtN9wq/+GYXYTMXvQhBa+FPg3SdXdIcEwcaDHCiseub1Xbsb5uIUzmKmEQHeXY
	AV2zU0ue10SOns1h5AGVii+v5ZRvvxs4Jg3Q9pzBHd1PHmSJ3L8OCwy7wjbdJjQW5zU+GaL8unQ
	/6xExe6CEYwjzdsEuavBCUIbrtf9bjp+OycVvordK86zcIhNW0NwbeO71blqu2PftL8x8yPSJMp
	p3jbQ3DYcE3IVhYmPeUrPWNVS19MTykfZss+6hOoBBUx5fGL9t0sDR5m97Atzo08aKa/txeVErZ
	HwDrP0vUKFEMANOplzQ+bvjGRUGYcBXLzT9/fxnaW/KamSTgUl+WIwvakplzrB0lP3o0uyBGemc
	UmpEJhRkwcoktznfy/S5Ulbl/LzhkZfRsib4kFuycR2w4RFVKuo3g7jAeKnj7O6xblkTDUdtXCd
	Y0LC1X7aWvplvA8sJ8BLZ4CbdglcyYkpkOeAUtPqkd3N2N019mlwqAao//60ExP+c7cp4lL0Vc4
	Y7YymqVVk3eLAqQXHgoZqgYrSCKKJD8uCB5MluROD7VO+I3guabM4ybs1t7r6mhdbX6q57F/It6
	rFvmEBpdvuw==
X-Received: by 2002:a17:90b:35cb:b0:3ac:8897:7b9f with SMTP id 98e67ed59e1d1-3ae5817ae3fmr783002a91.43.1793161533695;
        Tue, 27 Oct 2026 21:25:33 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Mohammad Abdoli <mominux@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 37/60] nginx: set CVE_STATUS for CVE-2026-95101 and CVE-2026-97629
Date: Wed, 28 Oct 2026 17:23:35 +1300
Message-ID: <ac8179c9b1737817ad2404645f489a2e1a1288ba.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131589
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

These CVEs are fixed in latest release however still show-up in open
CVE reports. Reason is that the DB contains entries:
  {
    "lessThan": "*",
    "status": "affected",
    "version": "1.23.3",
    "versionType": "custom"
  }

Which should mean that the first affected release is 1.23.3, however
without the upper limit it will match all higher releases.
The entry with >= 1.30.0 && < 1.30.6 cannot change the result as it
works by flagging CVEs where at least one version match is present.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 959f4c8f098a90c24a818831a5e3dd8090cee641)
Tested-by: Mohammad Abdoli <mominux@gmail.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
index 5d699e63ce..73204da558 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
@@ -6,6 +6,9 @@ SRC_URI[sha256sum] = "3cf46f5ed7504d460125866b7bea99fb357f31d887e2e63b35503310e9
 
 inherit upstream-version-is-even
 
+CVE_STATUS[CVE-2026-95101] = "fixed-version: Fixed since 1.30.6"
+CVE_STATUS[CVE-2026-97629] = "fixed-version: Fixed since 1.30.6"
+
 # Remove following entries when upgrading recipe to 1.32
 CVE_STATUS[CVE-2026-42055] = "fixed-version: Fixed since 1.30.3"
 CVE_STATUS[CVE-2026-48142] = "fixed-version: Fixed since 1.30.3"
