Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59026C5DF8E
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:35:49 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.660.1787286941984797391
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BzeJ5eBM;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so8652525ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286941; x=1787891741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=arvBdtOs65ulkPZsilhIyQPR2IWJIMu/8jarWTD4yBU=;
        b=BzeJ5eBMxS/a25tZkUSIqaPeWIRYPXSDrJ6bIBlvb4q0h2tPWDnxdGywr4XfzFB1nn
         jdUk4aKRw7ALss5ae68jQOd0c+3QL49Czxfso9D8sz/V3wy+yfuJ7OxF1qkckmgGuiPm
         ZuVHLkkmG8lyXECm0VE0buhYHOLhVPGeXyTo/jvak8ldec1EX3h1lsFIIA2wJksrskte
         /id/A+H+PR0ApiS+CoW9D31zz4G+Z6sz1CUinp7jN0eL/SAepasIwrM47bL0vQ8dEPVs
         +wa4VNxaKCqIAcvNNsbRV4/tiOV5NcOxoaboMoyhgAzTT5AONNxgaBq6qktElHYfMPz9
         twxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286941; x=1787891741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=arvBdtOs65ulkPZsilhIyQPR2IWJIMu/8jarWTD4yBU=;
        b=FCcCYSS3gtKLZGO50PZAj+QZgi1BZFi37NKpWMVsBTjPh0z8UJRejYJUlPa/5EA/qN
         TAvS1h90CJiNTp3tn9Y/FWODxjDcVTTljVWfviRfmYRGDys7Gfh9dPu9yI94vkjIXoTx
         LkBHSu4vqKnaau6sThuFsx9TY6bbqffIXCTRCHVrk3Cl7+fw9c7vir7enlUU8kx+cVIo
         aQlG0x6/mwyUVAWOL9GXexyNcHMf2ObRO5cEDmEx022qDIKD++PTsGYuouRb/Xk6X0Ja
         Kj2YcvefDU6oXgoJbVNvh2X2SDcxYbf4vzIUPUuxdTaF5rMg02L4dy8TSMD3peXTIP9K
         kNVQ==
X-Gm-Message-State: AFuF++ljfqKxheRccw4CjJ1QAEX7auxXmg75vPSI5dTj+OVgXSSlbZok
	f9VjX1lCK6BForKdQclwxpEbBLXQ0W7YvwI2679OehxeCDNNWcR4GyHape6XSg==
X-Gm-Gg: AR+sD11u8uQL7cbaX8C4zgkqE46JjHgkCmuQAa31QlbbVHDxGgpU7l3kLYq2sFNEEy+
	SROSy4eAMOPXb99Oky3TsPre55W+JHOPDnyu6fek4bvR1k5Nc1BJZZ3Xqtkwf//EdrPdt0xV81M
	0to2VuE7ZjTfOe4cZtDpbaU1DndNaJfAo4Rfkn6KRM8k9ga31wkyBLfUHtpWqmSqF1uyzsttxJv
	9lFVlQbnjH7unVTuQLO5suTuwO1zWx7ZMIgYZHNkGlwvBUs5S3xpwUbzh+4DkjK+Cd0oMzx0zUe
	Qi358xB5bzctoXnjt3PiB3aTAJrWUeSeXrGUh+nioCTpc409Tw0NTopdWsmDY+Y8U3zzXd+zRf1
	SGkD1Hi8jf61UEhuRDSejlgPx4ByDDEqn8CRcxYgRMnANARvsdmya431kY0g2mV+aScNNXD4Bj1
	elPX4IKD9LFsYZfszRXmlJUpwptAOYELp4P2VjGmPg7m8X1/65DsVW44qRfZR/+Ca8X84Rot+oW
	66M79LV0GPw40D4Biw=
X-Received: by 2002:a17:902:fc47:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d64adcd93cmr69416365ad.4.1787286941266;
        Thu, 20 Aug 2026 21:35:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:35:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/15] freeipmi: add UPSTREAM_CHECK variables
Date: Fri, 21 Aug 2026 16:35:13 +1200
Message-ID: <20260821043525.448011-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
References: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129399

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version freeipmi
...
INFO: Current version: 1.6.18
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/freeipmi/freeipmi_1.6.18.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.18.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.18.bb
index 92290f5010..f357be2cb3 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.18.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.18.bb
@@ -16,6 +16,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz"
 SRC_URI[sha256sum] = "8098b23820038ad0aa39abf0f9a012e24683d384d9f91e760acb2a68b465e0fe"
 
+UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/freeipmi/"
+UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 DEPENDS = "libgcrypt"
 DEPENDS:append:libc-musl = " argp-standalone"
 

