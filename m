Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E792C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 06:13:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.13448.1678428830043869254
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 22:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xesvQCVp;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678428830; i=@fujitsu.com;
	bh=lpj0F4Ln93Jf0dJPVmeul8fmYG4/QkUknNLGVmOs0Bg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xesvQCVp15AtmOUBfhP2ot6LPSmmwzxWyBWralD0oPsfYs7NqSFc98fdwnNwQW3ih
	 TQlX3UYu0G69kg2MEHfT28qrfTf9uC04eN88Mvf/8uSr7cnBOVP8VftzPtk3Vk0XOv
	 vDcBTTlwIhbrl2zalWfvotJCrLPHcwdrfdzldKchmqYPD/vSFXO2RXRnuXJeCwXeqa
	 ymkqMhOvqF+xIYgquG0fI+rgIM4XATVgL8m5gFINZukGejVG4UuQ7IO8C4HhMwulob
	 /nKQJjLjlYfCb8NrKNrmpulHbDGSDqRoE9GQFDjAZpNYxwE28cXXL6mv9urODqPvI2
	 ppAEiGn0GyVgA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqDv3FFe
  Kwb0HehYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bzmXkF6zgq/n51aWA8zd7FyMUhJPCEUWLO
  6YksEM51Jon3k66xQTh7GCX+XtoF5HBysAlISdy4/x/MFhHQl1g6ew8ziM0soCLx4ncPO4gtL
  OAvMfHNOyYQm0VAVeL04RawOK+Ao8TuWx2sILaEgILElIfvwXo5BZwkeiaeAosLAdVcPfmdCa
  JeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSHROP0QE4StJnH13CbmCYyCs5C0z0LSvoCRaRW
  jWXFqUVlqka6hkV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6KXl5q
  ySZGYOimFKsk72D81vdX7xCjJAeTkiivcipXihBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3r0ng
  HKCRanpqRVpmTnAOIJJS3DwKInwsu4ASvMWFyTmFmemQ6ROMSpKifOyHgdKCIAkMkrz4NpgsX
  uJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvBMh2nsy8Erjpr4AWMwEt3rWFA2RxSSJCSqq
  BKWY69xKeoJZvd+JnFSwQ/1teqvdjsnNZ/LLX2kfNHp/m6knJz5qj/dFUrPz67Isei42yCmfc
  rtoxv3Lu+ou/xKQjOxr+9lzaf92LIXGxaYBJ96GWLeGPbD6FnJhpGqCRtZLd1IJ7mlnexTlWB
  6rVGGbfDXdN8Zlg9zDkOvsJ3dlLru78e89G40LwtdxqPtedmok+jUavVi9Pjg+xvBfS0CW6Kp
  PTwPaakHpPd4gs58tdYc/nzLHmDVg5kWP57/KgvmPvdr90vupuudXneGbYjDU32h6vjPvdbKu
  m2JS9WmQW6xrtyxOuM/2wu1X638VxqpS02OV/7et63DYnmD7Vnf7Xl0uK27RqlgpLww0jJZbi
  jERDLeai4kQA+QdXkVgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-571.messagelabs.com!1678428829!324855!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14532 invoked from network); 10 Mar 2023 06:13:49 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2023 06:13:49 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 74A80100191
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:13:49 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 679D4100182
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:13:49 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 10 Mar 2023 06:13:47 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 02/11] nbdkit: upgrade 1.33.7 -> 1.33.10
Date: Fri, 10 Mar 2023 14:13:29 +0800
Message-ID: <1678428812-7622-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678428812-7622-1-git-send-email-wangmy@fujitsu.com>
References: <1678428812-7622-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101474

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.33.7.bb => nbdkit_1.33.10.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.33.7.bb => nbdkit_1.33.10.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.7.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.10.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.33.7.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.33.10.bb
index 2af649cb4..2a2f01cd8 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.7.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.10.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
-SRCREV = "a5f804180240aea7031470cb8ed294f904268f0a"
+SRCREV = "65fbd0cc87b38f4068c0d973947a82c2d4f9822c"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


