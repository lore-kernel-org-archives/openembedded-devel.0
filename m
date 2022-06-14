Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297A9C43334
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 01:30:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.25829.1655429453308073083
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 18:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GAzyiukm;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655429451; i=@fujitsu.com;
	bh=pXu2EBFLdUwEYmEoRq7MdLSwzSDSU6TacVlnto/05Jw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GAzyiukmndOZjWSB4d/sFLkqlJPSPSnF4NXrkaUWY+I8vVEwLRGTqArCpKDYNj8sG
	 3E61OFaEfuAQnOMJq+9RlXEe773lDrLuAsrUwGNxSR/gnmKSQwR2pbDzhJ6zAaM27F
	 o2nfDmo5YmOf/FzV0SsPXxPkJcsp56cDLfENjS4f0cTkcqWrgqkCologXxLVL4nKSz
	 nAY85KCvTyVPuEkO41AYT2WrqfWANdiScBV3Ajxd+YhUtwZGhxeZzl7uIqFV2uLXnY
	 MMN7If7hFVvl/wsamSX5U3Q0vPaNiU7bbfCazMxp783CebS1X1kt6aJskKHZvs+o1S
	 aFfQx++E594Fg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORpOt1c3W
  SweWfxhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b2ZytYC77yVOy/Mp+9gfEYdxcjF4eQwENG
  iQ3nWlggnLNMEtfWvmaGcA4wSrw7/oqxi5GTg01AV+LFj8UsILaIgL7E0tl7mEFsYQF/iUfnD
  rKB2CwCqhL35r4Gs3kFPCRuX5zNDmJLCChITHn4nhkiLihxcuYTsDnMAhISB1+8AIpzANUoSs
  yeLg9RXiHx+vAlZghbTeLquU3MExj5ZiHpnoWkewEj0ypG66SizPSMktzEzBxdQwMDXUNDU11
  jCyBlqJdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeXWrKJERh+KcVq+TsY/678qXeI
  UZKDSUmUV+v46iQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwOV4FygkWp6akVaZk5wFiASUtw8
  CiJ8NpfBkrzFhck5hZnpkOkTjHqcsz82naAWYglLz8vVUqc98N1oCIBkKKM0jy4EbC4vMQoKy
  XMy8jAwCDEU5BalJtZgir/ilGcg1FJmFf8BtAUnsy8ErhNr4COYAI6onHfCpAjShIRUlINTFp
  vKhTi/pr83nVR5O3VxMdXxdzVu3yqDGdUsJeuvaw0g63obbPTaqn7AQ/ybwjME6zttwp/0e8i
  bG4it2aZ1CNDhl6WxyuDkmWt5//cd61zY8XxaJPUuTMXrmktCduZ7q28TSbznNbm3a8kDUwmW
  2xUujJJz3f1DaefC7dfsPauuhRQGOMevHD7nIX7NuzMN8nLf6Q38eM/FaPmlPnGYmoPP7GGV3
  87yXz5uMBdudPnGZf+PWJw6tZdn+sh3w5P73jnKr2W6YDBuer5X+e1md2ye9634+ZPk+4Xnyq
  mflM56JtlIODndz1zutX24LZle7b5T/tjkRzO7rDpfIl2x+TDnEv7lrl0Mlv87Djd/VWJpTgj
  0VCLuag4EQCkHYqrRgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-571.messagelabs.com!1655429450!305556!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24576 invoked from network); 17 Jun 2022 01:30:50 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jun 2022 01:30:50 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 7FE801AF
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:30:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 738521AD
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:30:50 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 17 Jun 2022 02:30:32 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.6.6 ->
 2.7.0
Date: Tue, 14 Jun 2022 17:14:38 +0800
Message-ID: <1655198078-24284-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jun 2022 01:30:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97526

Changelog:
==========
Features
----------
    add experimental enterprise cert support (#1052) (dda7dda)
    add experimental GDCH support (#1022) (5367aac)
    Pluggable auth support (#995) (62daa73)

Bug Fixes
----------
    validate urls for external accounts (#1031) (61b1f15)

Reverts
---------
    pluggable auth support #995 (#1039) (513d999)
    revert experimental GDCH support (#1022) (#1042) (c720995)

Documentation
-------------
    fix changelog header to consistent size (#1046) (e64d084)


Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-google-auth_2.6.6.bb => python3-google-auth_2.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.6.6.bb => python3-google-auth_2.7.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.6.6.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.7.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.6.6.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.7.0.bb
index d51790f36..195b668d9 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.6.6.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.7.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1ba4938e032b73deb51e59c4656a00e0939cf0b1112575099f136babb4563312"
+SRC_URI[sha256sum] = "8a954960f852d5f19e6af14dd8e75c20159609e85d8db37e4013cc8c3824a7e1"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


