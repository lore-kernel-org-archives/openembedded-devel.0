Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340ADC38A2D
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 08:26:18 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.4236.1666859174676084947
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Oct 2022 01:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=OytXlDq5;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dX90WbAL/8dxo+6skbHbSnsOtQhdLHZKzkyEEn5yN94=; b=OytXlDq5CvE/kSIx5exViC+KBs
	VQnYZHaqIXawGgBnzemEXxTBOusdQ7n3gGU2uo6MqDcngCkq9lyf9ODkWBcHdFuEAj9573g6NfomB
	UDt2oDqVvAXFTzq1eAcIdBuWvcXnX/Csw42lMs6Q9Vn0WnJFN2C9iKN73KrN2mfTAT9VgYr6uEnXA
	hsZuBcJhR9Of1QIl8p1iLnRY/AuvRt1dL4UK9f/YPn5CVy+CigMDscI+O4GWmdg7589alHHbMXtRL
	OQIeRJOK/Gg11vSxchgqDJo5zm5gZ7eAtAneI4Uz4y6QD1ChTU1qjQ1bqLiDN+cJPN5ioUJdmVtL4
	HvhEWNJA==;
Received: from lan.nucleusys.com ([92.247.61.126]:45606 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1onyEQ-0006Ba-73;
	Thu, 27 Oct 2022 11:26:13 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-py-cpuinfo: Upgrade 8.0.0 -> 9.0.0
Date: Thu, 27 Oct 2022 11:26:02 +0300
Message-Id: <20221027082602.602758-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027082602.602758-1-leon.anavi@konsulko.com>
References: <20221027082602.602758-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 08:26:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99319

Upgrade to release 9.0.0:

- Changes to lscpu breaks parsing of cache info
- CPU stepping, model, and family values are blank if 0
- Officially drop support for Python 2
- Replace Python 3.11 deprecated unittest.makeSuite
- Fix lgtm.com alerts
- Support Wheel
- Add support for RISC-V

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-py-cpuinfo_8.0.0.bb => python3-py-cpuinfo_9.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-py-cpuinfo_8.0.0.bb => python3-py-cpuinfo_9.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb
rename to meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
index 6de2f1745..5fbac03ac 100644
--- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
@@ -4,9 +4,9 @@
 SUMMARY = "Get CPU info with pure Python 2 & 3"
 HOMEPAGE = "https://github.com/workhorsy/py-cpuinfo"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b0b97c022f12b14d9e02de0b283ee9e9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2379ecb0d7a8299101b1e4c160cd1f7"
 
-SRC_URI[sha256sum] = "5f269be0e08e33fd959de96b34cd4aeeeacac014dd8305f70eb28d06de2345c5"
+SRC_URI[sha256sum] = "3cdbbf3fac90dc6f118bfd64384f309edeadd902d7c8fb17f02ffa1fc3f49690"
 
 inherit ptest pypi setuptools3
 
-- 
2.30.2


