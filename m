Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2ABCA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:31:16 +0000 (UTC)
Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147.1790811067787613992
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 16:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iOoQcxD7;
 spf=pass (domain: gmail.com, ip: 74.125.228.38, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88582e2153eso1871444b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 16:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811067; x=1791415867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1iYh1/K5AziYUd+Sm/WEPVR2U51mLU2plh+50pFCCP0=;
        b=iOoQcxD7XrxaeYUMarA1JheNleJkcemLHoplyeRrFQ/dGpnnjbG/oa1pWVVoTE/Kjd
         g4SBDEUAD5fHiPHsG83JDK0Drp3V+bbHouToyRYTW6PDkGPuADt89NA2URtYC4LY9tCL
         D3B1itgOJYDPSRzF29OvXp+JwHzXMtZtXMOUiRMwLA2fMM+QjbeuNmXWR/oOg/HDmor5
         ZmV6iOTEITOYFI9D2BXjpo1t3rJn2pAqd/zt45vV7Kk/GHRZnRb8Kj4wffQ/Rmutw2vx
         Fe0z/0ydPRsLLLDbXPnPZRSqa6hF/YS7pYK1DrhAtOZvOY1n6/+FcbIcZaWje315LWB0
         pFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811067; x=1791415867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1iYh1/K5AziYUd+Sm/WEPVR2U51mLU2plh+50pFCCP0=;
        b=QfIMoHt2JybQssz+nreBRaPH7882WmTJt+o3FKK6WiZmnGctkBJSDuL1TXPnBkE5xk
         syrm90DG5W6nqb1ZiQogGlLKT6Us/xIOZUWYY51RtII2s2i4IMY8pMtIOXah8RQYo9Ch
         P7rRr3iSW//BdAipsLPZ0uqQ2vQH8PQC0Xa31nq6jzCqj7YrWj4m3UeWAyaF87rPSdGk
         /yOSYS6cjdryFBpt2VTJOeI7HOYfinM18H6U4LzgtGy4G2ck44edU63V3bZZyTOT13Es
         yI0eVsBUWRHcgaCCjpVntxZ52qON4XDjJkmlYPgvhBIbBv3tazLmOxeKGQjdEboFisl2
         iRCw==
X-Gm-Message-State: AFuF++llNzj9YjsERxZqpY9MSL8vy+kUD1dWEqTXQ+hm22p5KQv/zLru
	atXjuTJavV9E/PtWfTKlo7Nl3pXxXuznTVF0ZtUL45ShiOLalvLC0/1JSfPmug==
X-Gm-Gg: AYBFou05q6Hwwa8fNUjYlbMJlY94YSgO3NdpuONUPUubeDKN+6+SAg1wOZunKXDzATR
	NGHLcHe6wGqTzxOe0iNkuwUMh5kXIqUCxvTTiS6jm+KOk3BbC3Fx/LppvZtFNInOtEPkle6xj72
	i4hvyMX56V3ZhxV9K/xQuBkl8OV/8h/SiCOtDuSHxA5vyOnu5zzVRMN6YbWBLLivBJs3Q5Q9iH6
	Ci2V6vBuLsJ1Z1Wjn0R35lfv87D5vQnAp3JUiqPIS7IBgpZ8GAWh7tpjSIEME0OlQekx9A2hX+W
	H2G5rMNGi3wpQ5lUuAINkPBL9VBl1ZaMzRPx2WTv6X9qk7BDqD9SqnTtwVAJbJjpgOxXirSm8Nr
	Mb2V9K0pbaVMyl8G99iGKMyRrwggniU/fAnlnnY694iy0fK56K8Dmt+E53W3DiSy+4+Svj8rBOc
	DIiFYr2u0g5E6fPcGg526Bt5bvs7Ur3YM3BYmU/LixnGLtzd/ZXCF13M9n+o7LLnM+owDDV63M7
	U2kKDAgQ4YrgYtwy6tZq3g=
X-Received: by 2002:a05:6a00:3926:b0:878:37b2:dfaa with SMTP id d2e1a72fcca58-8874c8d8e51mr2159453b3a.58.1790811067093;
        Wed, 30 Sep 2026 16:31:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881589a0c3sm231249b3a.7.2026.09.30.16.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:31:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 12/14] udevil: add UPSTREAM_CHECK variables
Date: Thu,  1 Oct 2026 12:30:32 +1300
Message-ID: <20260930233034.659237-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
References: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 23:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130545

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version udevil
...
INFO: Current version: 0.4.4
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
index c745485a64..ad57ff462d 100644
--- a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
+++ b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
@@ -19,6 +19,9 @@ SRC_URI = "https://github.com/IgnorantGuru/udevil/raw/pkg/${PV}/udevil-${PV}.tar
     file://Fix-build-with-gcc15.patch \
 "
 
+UPSTREAM_CHECK_URI = "https://github.com/IgnorantGuru/udevil/tags"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
+
 SRC_URI[md5sum] = "dc1c489b603a0500a04dc7e1805ac1d9"
 SRC_URI[sha256sum] = "ce8c51fd4d589cda7be56e75b42188deeb258c66fc911a9b3a70a3945c157739"
 

