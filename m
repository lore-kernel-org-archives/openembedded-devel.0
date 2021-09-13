Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web09.26478.1631520567476180265
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Sep 2021 01:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Tz6l5Cvl;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631520565; i=@fujitsu.com;
	bh=iZVcGPDWtSF81Zs84Ye444g69kn5AYost0M9LHt8Qbk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Tz6l5CvljZvU2eFqws6mdHCC/cH4HupeL4VupqxWhewf9BIMflNhh1cP0BGfk45GR
	 5G7dpeBxF996L8vjI1WKVS15U/NcK224lK9ttcBD85nMdJCQIv6z0vIQyzHk0c+KWM
	 HkliV/yK6pahdB+0IvawZJTSklXOv7SwwbYE+XxgJZ7m9qUJNHfRUAAXm+yV5Dxz0n
	 6EdoSPEYox8FSCJaqUGSBq0oI4oaDu3K6AuZluvTA20GzyBl9+lj4F6Vy52N/PJcUL
	 /y6DIoO2GSI6RU6rCNW2T5z5ojjVFxPQ/k8rCt9fBj4KfqoIPyZ6oJ3ZDmdCHjrrF8
	 NB2WZJIMmwcaA==
Received: from [100.113.2.26] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 39/25-29868-5370F316; Mon, 13 Sep 2021 08:09:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0TVlt08
  06LnBanHx8FJmB0aPcxtXMAYwRrFm5iXlVySwZkx8PJ+94DJnxd1pXewNjHs5uhi5OIQEZjNJ
  fO/YxQzhnGCU2HLkEWMXIycHm4CORMeLbhYQW0RAX2Lp7D1ARRwcwgL2EjfORICEWQRUJdY8P
  c0OYvMKuEkcntPMCmJLCChITHn4nhkiLihxcuYTsDHMAhISB1+8YIaoUZTYvvMMC4RdIfH68C
  XmCYw8s5C0zELSsoCRaRWjZVJRZnpGSW5iZo6uoYGBrqGhsa6BrpGpkV5ilW6iXmqpbnJqXkl
  RIlBWL7G8WK+4Mjc5J0UvL7VkEyMwkFIKGf7sYFz95oPeIUZJDiYlUd79v+wShfiS8lMqMxKL
  M+KLSnNSiw8xynBwKEnwKrDZJwoJFqWmp1akZeYAgxomLcHBoyTC+5QRKM1bXJCYW5yZDpE6x
  agoJc6rCtInAJLIKM2Da4NF0iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxVrEBTeDLzSu
  CmvwJazAS0+OspG5DFJYkIKakGJsbzvzs7zp6x1ZAy2jpld965soDD28sFAvm0lz7LOfDx+MV
  nPGra22Z+WTr3eaHg3fMrOq9NuTg1rugtL3eJgXitcCjTtAlTz6jKmhVMk7lmmmDcb+2eLypw
  yLH5jH/Gj8siC450aRr/X8BVsWgJ183NM6UySrqP7kvbFcSt/D2oa/P+Q9Pu7AmW3PVM5/HM+
  ZGzLix/ecRm9zfLnTb8IjMezjRbm55uOPG0nH9MxY4XLWfmnlxTr+fN+vX1bZverCC5/Qf03N
  MXfikXn33EM+DJJ+aEz8k5hxTrEjneWXDeL+AqP87//U1bTfbi1S68pkcMko6o9l6rYg7IOvj
  iRElj5eT9EhpKl3UD3a80LFFiKc5INNRiLipOBAAAW9zIHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-226.messagelabs.com!1631520564!193853!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29443 invoked from network); 13 Sep 2021 08:09:25 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-6.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Sep 2021 08:09:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18D89IjP028765
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Sep 2021 09:09:24 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 13 Sep 2021 09:09:17 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libxmlb: upgrade 0.3.1 -> 0.3.2
Date: Tue, 14 Sep 2021 04:09:10 +0800
Message-ID: <1631563750-4838-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Version 0.3.2
~~~~~~~~~~~~~
Released: 2021-05-24

Bugfixes:
 - Respect XB_BUILDER_NODE_FLAG_IGNORE when exporting (Richard Hughes)
 - Use the chosen chunk size when reading from a stream (Richard Hughes)
 - Use the correct pkgconfig export package name in the GIR file (Richard Hughes)

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../libxmlb/{libxmlb_0.3.1.bb => libxmlb_0.3.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libxmlb/{libxmlb_0.3.1.bb => libxmlb_0.3.2.bb} (90%)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.1.bb b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.2.bb
similarity index 90%
rename from meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.1.bb
rename to meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.2.bb
index 72d3aba44f..cacb493a1d 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.1.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.2.bb
@@ -6,7 +6,7 @@ SRC_URI = "\
     git://github.com/hughsie/libxmlb.git \
     file://run-ptest \
 "
-SRCREV = "98fc241305306de9468249301474820696acb4be"
+SRCREV = "994fd0ec3d28da82b5965949a9d925510f603562"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome
-- 
2.25.1

