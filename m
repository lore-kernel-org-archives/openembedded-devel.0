Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.4807.1626334069517663896
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 00:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xA6vVIdq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626334067; i=@fujitsu.com;
	bh=Sb7RokcaggVvYuLoSFU78BwaaR01oUYr2YST0n2wbDE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xA6vVIdqdvrKeI5Q/41RopNxxdiW6WeiIsQ4WArx/VBPpwqVUhzjYsu6KXitiJjeW
	 6uk+ylOwR1pDyqTMacxBSV40aPOtUuiog1jMCYjCCiyJBlHqE3B5BqSaQsxQWf7MvH
	 yK3Z41b2JErQbBoOAWvzSDg3RvjwiRkD7eH5+gcPcP+DMI6vX0e3TwNh3HxrI97TBC
	 b6qfz8D5zSdeX7c8n6Xxchr40h0FNc/8ALqTTBfY+EzvbDQBWmHj6q9CFR8Q1IP1H7
	 GnkaDgngy+fnY1CEuztxyR53vLTHPZb53KXtweLCnDWrswqh5gd64xCvyUM6w0rENn
	 WQHnPMgSWgblQ==
Received: from [100.113.0.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id AE/01-03136-373EFE06; Thu, 15 Jul 2021 07:27:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MRqlv0+H2
  Cwb9WI4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaO/fQNTwUPOijVPupkbGB9zdDFycQgJbGOS
  OLV6PhOEc5JR4tCrx2xdjJwcbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdww5iCwt4S0x7P
  hUsziKgKrFh61mwOK+Ak8S8tdPAeiUEFCSmPHwPVsMp4Cyx/MQBFhBbCKjm5cnFLBD1ghInZz
  5hgZgvIXHwxQtmiF5FidmXm4HiHEB2pcSNx6kTGPlnIemYhaRjASPTKkbLpKLM9IyS3MTMHF1
  DAwNdQ0NjXWNdQ0sTvcQq3US91FLd5NS8kqJEoKxeYnmxXnFlbnJOil5easkmRmBAphQyH9rB
  +OT1B71DjJIcTEqivJta3ycI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDleASUEyxKTU+tSMvMA
  UYHTFqCg0dJhPfxPaA0b3FBYm5xZjpE6hSjLsfl6/MWMQux5OXnpUqJ89o/BCoSACnKKM2DGw
  GL1EuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmtQS7hycwrgdv0CugIJqAjtNe8BTmiJBE
  hJdXAtDqy7Q6Dx3E9bR/jL5rljgFX0yKTrsoIH3Xq6TrDsMLueoWa33OmnexTz4kHem6O31nk
  WH7smLnK7Z7Nm0qTey8+yXwucy8z+Xt70uPStQrH7v6NNgzd3XP029EvX8tOh69ZwHqqR3kH3
  1370JdsahzzfTo1ZP6/rilqaJgkNM/2AeNk9wlfr5g8k+e9siDRYLODXPjObkcjJdvHazqtPg
  mm1LX2/n21cs6lmENpPHPO2UizXJr++8GJmdtuperunLFAfL7bk4r9EsY/1ky96zPFO/unXuI
  sP9V9e0RWbRfqzt21uz/D6pumfO7eW4oXfVo0Qn/cElkm8Hg1k/8uRT7GOtUpXsbNl/Q3/j4j
  q8RSnJFoqMVcVJwIAKFya9ZPAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-228.messagelabs.com!1626334066!12423!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12950 invoked from network); 15 Jul 2021 07:27:46 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-2.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jul 2021 07:27:46 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16F7RbT4016385
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 08:27:46 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 15 Jul 2021 08:27:37 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfsprogs: upgrade 5.10.0 -> 5.12.0
Date: Thu, 15 Jul 2021 15:27:21 +0800
Message-ID: <1626334041-25250-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626334041-25250-1-git-send-email-wangmy@fujitsu.com>
References: <1626334041-25250-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfsprogs/{xfsprogs_5.10.0.bb => xfsprogs_5.12.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_5.10.0.bb => xfsprogs_5.12.0.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.10.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.12.0.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.10.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.12.0.bb
index 509dbd620b..c2d0595290 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.10.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.12.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            file://0001-support-usrmerge.patch \
            "
-SRC_URI[sha256sum] = "e04017e46d43e4d54b9a560fd7cea922520f8f6ef882404969d20cd4e5c790e9"
+SRC_URI[sha256sum] = "bec44445cf18f49e63971d4f27dc4e90a17b118b852714a1104b621ea30e3507"
 inherit autotools-brokensep
 
 PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
-- 
2.25.1

