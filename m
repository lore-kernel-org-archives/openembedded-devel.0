Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85076C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:14:35 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.3832.1675844067066378501
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s4fvZg0r;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675844064; i=@fujitsu.com;
	bh=RgmysUh8OqkSUzTA23Hc1WcbflCz205Yi7bWlmHCD60=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=s4fvZg0rg6jtVTKlspjWiFpRCUT01q6JEPK/FYKV/bA7cQbk3L8B9MkntBX7gqA+6
	 AeZmI2EpOMGKPJW1Uz1729m8mmN+q4L6SVBxRMf/5lhpnLkfoLVnDwyg5JwA5388z6
	 5qb7lDmNn1dj3z0bZaq5BeGWheP+XY4zTIVWv07A8Mv0zSMQurIGK3un8VVHjY7aop
	 meJHecHqH8lS4QIYW3hm4NOFJ7yMznkpe+zQXTb3JZSIOzBfPoWybps7Pcgisxutib
	 hb69usK9G5UsVnAfhuaZ7skmXaccN3D7JB1D0D2t15UjLtcXflpa//2Zn8PnsI0fAf
	 iKbzcRN/mEy5Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORpPsg8nG
  ywcdueYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPpsQXsBVv5K1bdXcvUwLiTt4uRi0NI4CGj
  xKU1b9ghnKtMElN3djFCOHsYJTof3wZyODnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCV6Jx0jAXEZgGKH+h6DGbzCjhJLHi+H6xeQkBBYsrD92A2p4CzxOFTp1lBbCGgmqM9Sx
  gh6gUlTs58wgIxX0Li4IsXUL2KErMvN7NA2JUSrR9+QdlqElfPbWKewCg4C0n7LCTtCxiZVjG
  aF6cWlaUW6Rpa6CUVZaZnlOQmZuboJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWl
  lmxiBAZwSnFi3Q7GFX1/9Q4xSnIwKYnyeoo9ThbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwRsRD
  pQTLEpNT61Iy8wBRhNMWoKDR0mENxIYUUK8xQWJucWZ6RCpU4yKUuK8ByKAEgIgiYzSPLg2WA
  RfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMGxAGNIUnM68EbvoroMVMQItDVB+CLC5JREh
  JNTCV+Vvtvah+5//SHZ1nYywmxkw9dnjikmtnY3qtzS7/Dn7Z3NqpH32N54WOS/aqSTKFh+Yp
  VZ3XUPqXnvNdJLqnxHNhFUN+/gF/6fe5vB7LvHTLtcozbZPTNnpnPvCsMr3ME2u8IOyF809X4
  0CNYy8d+ZhWMN43iptexXRtkyzDIzEN3+QHJkd+fi0Qmbrxxe3lvmEvHx3+Iagh/Xqhs0yTv+
  GEWRVqWhe4JV2sv/a5yFZvqYyfnV1dH+R73dHpp+aEdXZX3c7P0Xh7+3GpYJzU3kNMXy6d+Fo
  pcD2n4vaJxPTtHw33b9v1NHrq4vdyz36bXTgfXybt0rUya+0GxueG3y5Xm+nzcLLNzL9UHKzE
  UpyRaKjFXFScCABoEVm2WwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-745.messagelabs.com!1675844064!177301!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6109 invoked from network); 8 Feb 2023 08:14:24 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:14:24 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id EEF101AF
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:14:23 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E34101AD
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:14:23 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:14:22 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-openpyxl: upgrade 3.0.10 -> 3.1.0
Date: Wed, 8 Feb 2023 16:14:09 +0800
Message-ID: <1675844052-11401-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675844052-11401-1-git-send-email-wangmy@fujitsu.com>
References: <1675844052-11401-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100989

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========

New Features
------------
    Added support for data table formulae
    Mapped chartspace graphical properties to charts for advanced formatting

Bugfixes
---------
    #1156 Table filters are always overriden
    #1360 Can't read some ScatterCharts if the x-axis is not numerical
    #1786 NamedStyles share attributes - mutables gotcha
    #1851 Allow print area to be set to None
    #1852 Worksheet for print title and print areas can't be found
    #1853 Custom document properties that are strings can be empty
    #1858 ConditionalFormatting lost when pivot table updated
    #1864 Better handling of defined names
    #1912 Excel doesn't like xmlns:space on nodes with only whitespace, which it treats as empty.
    #1942 Exception when print areas use table references.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-openpyxl_3.0.10.bb => python3-openpyxl_3.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.10.bb => python3-openpyxl_3.1.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.10.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.10.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.1.0.bb
index 447c86ddb..f93d258f2 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.10.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e47805627aebcf860edb4edf7987b1309c1b3632f3750538ed962bbcc3bd7449"
+SRC_URI[sha256sum] = "eccedbe1cdd8b2494057e73959b496821141038dbb7eb9266ea59e3f34208231"
 
 RDEPENDS:${PN} += "\
 	${PYTHON_PN}-compression \
-- 
2.34.1


