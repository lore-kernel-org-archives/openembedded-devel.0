Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web12.7823.1623318718390911459
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 02:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f7YUgKlN;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623318716; i=@fujitsu.com;
	bh=RsuhdbFCbWBGWm1iqDB4GRpH4ExNYwVprv70uN78c90=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=f7YUgKlNDM03+wRt1DZkqj8jnd7PXIIv4lxaN1czeJBzfXTTVkkvA2K0mbvsMK5iN
	 ew91/VRsoPt+5Jxf8h1nsuNnvoF8VXNofUTYua2kMXHRLXvG795o8KtHNfY+ax0JOo
	 KSEZdOE8nKi2AjmimJ5Fp+Qn1H2lc4kqzJRDPlXa8Gb98L1uydot4zsf7LH3O2UoRC
	 aTMpp/ucIaI7iSp8dz6tVBZOp6s3yJ1FMaM/Xj2LtTgfq0RwiglYpzr69lSWo4A+9f
	 LWc8fj+9s+Z5qVYG7t8ubjzQG5gx1ysuv+wBBVacd0vKNr/RPF7ViAxWdQAn6CsE70
	 pIuO4FVYidRdQ==
Received: from [100.113.4.24] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id EE/18-27273-CB0E1C06; Thu, 10 Jun 2021 09:51:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRorvnwcE
  Eg84uFouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPejkmMBXs5KpauPMfUwHiDvYuRi0NIYDaT
  xMfefhYIZw+jRPOzFUAOJwebgK7Eucdr2UFsEQF9iaWz9zCD2MICjhJrG/YygtgsAqoSPb82g
  tm8Au4Sy55vALMlBBQkpjx8zwwRF5Q4OfMJ2ExmAQmJgy9eAMU5gGoUJWZPl4cor5CYMWMb2w
  RGnllIOmYh6VjAyLSK0TKpKDM9oyQ3MTNH19DAQNfQ0FjXTNfIxEAvsUo3SS+1VDc5Na+kKBE
  oq5dYXqxXXJmbnJOil5dasokRGEgphWwfdjBOefNB7xCjJAeTkihv+9WDCUJ8SfkplRmJxRnx
  RaU5qcWHGGU4OJQkeK3uAeUEi1LTUyvSMnOAQQ2TluDgURLh1QcGthBvcUFibnFmOkTqFKMux
  5VVSxYxC7Hk5eelSonzZt8HKhIAKcoozYMbAYuwS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJ
  WEeReBTOHJzCuB2/QK6AgmoCMcjfeBHFGSiJCSamDy/vRWbq7/06SVjlY7WcIkRTx+f8lNMrH
  g/WXjGz3L4Jsqk5NNxLzO8CCnFYVH5EVCDt+8neNQeUzjRO4dp53LF7vutrN88c9Q5HV49bsz
  XN/uGCWIVyeeNmg/PcGcv8kkbVF252amu/aXuTIWJbIaGVdd09+gxHFP+OMOz0VRu+55MLLPb
  59U9lFwCt9d62utC7gu79jyNMlqX0/fpAi3rdfZnF131xWzyE51vfmPU6la66JwulyvuHKHhd
  jPk5vevt/pwFH6qVO37tChRya7SpqyDW+LXX0W5hZp/KR1oYVf9bVtdTox10KtzfYIB+0M0I3
  8bTyR8frch4Wa9s9MtgcKJtgUfqio+pbAqsRSnJFoqMVcVJwIAOObfQorAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-248.messagelabs.com!1623318715!250252!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29101 invoked from network); 10 Jun 2021 09:51:55 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-8.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jun 2021 09:51:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15A9ptKv020417
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jun 2021 10:51:55 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 10:51:53 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-gnome] [PATCH] nautilus: upgrade 40.1 -> 40.2
Date: Fri, 11 Jun 2021 02:51:46 +0800
Message-ID: <1623351106-4643-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../nautilus/{nautilus_40.1.bb => nautilus_40.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_40.1.bb => nautilus_40.2.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_40.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_40.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_40.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_40.2.bb
index 75fc03237d..ee58df2b37 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_40.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_40.2.bb
@@ -22,7 +22,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "8ecfb90174a0bd5815b1ceb9cbfcd91fec0fb5e34907a4f2df2d05e5d6c99d33"
+SRC_URI[archive.sha256sum] = "b71ef2fe07e5eea89a2bb1e5bd30947bd18873bfb30f79cbf17edfbd4d20f60d"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.25.1

