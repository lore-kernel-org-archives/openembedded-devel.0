Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2754C636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 11:19:30 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.80974.1675768765166167350
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Feb 2023 03:19:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dZy6BMVs;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675768763; i=@fujitsu.com;
	bh=x6C2vyKg5nbOvLqPkauJE5QRR0Ff7PKDG8MCsxQLg2o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dZy6BMVsR6B3Py9m2OUf6ZwrG8MLyOUWE7Vb/vtcDdeMI+ayTdn6MuhDWTVDGTtUp
	 UQhXJtbnz2taVxeA1xbwRV+WYRILXacWnkIeg+enU/CmXHmyxqTgGPkGMZz+OfuwsK
	 3EHwOX6RHrnFRp8YRq4hGvAZ60zPY5kSCz7UNdP2FcHVLh1jS85BW/Oes7jsQeZbqS
	 Mr0Yl2f+xNrpSdt+xnFk8N9u73xVX1Oi34hlZQ9pniry1OMC6nZ6fCDLzECaIlOJ4g
	 vLvfAIW/amulzpNNOuZ3aokZxvByt50BGfVMcfriGK8G9E7ZuF5yj82utvV6zQPyUh
	 ewsVpSh1go4YQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqLvL+FG
  ywclVShYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bL2W3sBd0cFU9WLWRqYFzP3sXIxSEk8IRR
  YtOy/awQzg0miRMHLkNl9jBKrL95mbGLkZODTUBK4sb9/2wgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQEbiX+rdrGA2CxA8ROv3wHVc3DwCjhKvPkkDRKWEFCQmPLwPVgrp4CTxLa/vWAjhYBKHs
  xpA1vFKyAocXLmExaI8RISB1+8YIboVZSYfbmZBcKulGj98AvKVpO4em4T8wRGwVlI2mchaV/
  AyLSK0bw4tagstUjX0EgvqSgzPaMkNzEzRy+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMwfFOK09x2MP7u+6t3iFGSg0lJlPe+yqNkIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8XkZAOcGi1PTUirTMHGAswaQlOHiURHjvgbTyFhck5hZnpkOkTjHqcly9cmUvsxBLXn5eqp
  Q4ryvIDAGQoozSPLgRsLi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYN0EPaApPZl4J3KZ
  XQEcwAR0RovoQ5IiSRISUVAOTwvk4Id2r85i27/z8onO29JQfS63+JZ1RrFVYliYc7LPlSIER
  xwXO+3M/OVzr2rLkb+lPVyk1wdpl7ze7vprjJbZ+fXfA7afn+nIaa77PbhRcda9l+gsLvvKvG
  46z6/T5Pn55+GjshOvHpZ70smbKZgZnZUd93Mt1sSpW487nxHX59d4f0uN91vRqW9saRhpc1I
  /V6e2u2iax5dTMJb5BEXMsTncFGD+dlHdEio9Pc//DCdGvHaJupkydN/tCptS5t29kTdODDv0
  rT33gfMXX6rPzi/mH+Bj+Zca4PuMtNmFkUgyfwjCpZHbivE8mgtebvobOuu8054HI+uTltryr
  K6SUX70+t8/VIuL2qd0hSizFGYmGWsxFxYkAPNheDmYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-732.messagelabs.com!1675768762!322613!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31133 invoked from network); 7 Feb 2023 11:19:22 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Feb 2023 11:19:22 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E66A3100188
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Feb 2023 11:19:21 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DA02F100043
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Feb 2023 11:19:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 7 Feb 2023 11:19:20 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cglm: upgrade 0.8.7 -> 0.8.9
Date: Tue, 7 Feb 2023 19:19:02 +0800
Message-ID: <1675768744-3871-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675768744-3871-1-git-send-email-wangmy@fujitsu.com>
References: <1675768744-3871-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 11:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100958

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes and Improvements:
==============================

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/cglm/{cglm_0.8.7.bb => cglm_0.8.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/cglm/{cglm_0.8.7.bb => cglm_0.8.9.bb} (93%)

diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.8.7.bb b/meta-oe/recipes-graphics/cglm/cglm_0.8.9.bb
similarity index 93%
rename from meta-oe/recipes-graphics/cglm/cglm_0.8.7.bb
rename to meta-oe/recipes-graphics/cglm/cglm_0.8.9.bb
index 95a651dd0..fbd267b16 100644
--- a/meta-oe/recipes-graphics/cglm/cglm_0.8.7.bb
+++ b/meta-oe/recipes-graphics/cglm/cglm_0.8.9.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8dc95c4110ba741c43832734b51b7de7"
 
 SRC_URI = "git://github.com/recp/cglm;branch=master;protocol=https"
 # Tag v0.8.5
-SRCREV = "8cfc98d2835a8cd1a9041f257c7ba0bfe4fbc1f3"
+SRCREV = "c51040cd4139b628fba2a0e6751ad4aecbc0c81a"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


