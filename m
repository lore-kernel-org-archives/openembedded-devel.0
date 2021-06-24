Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web11.1479.1624499927710810267
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 18:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wu79U6D9;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624499925; i=@fujitsu.com;
	bh=cgt4MIFoAbJIqt+5O5eUdRXivnSbiUErQZ1Bnf3PB6s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wu79U6D9/E86aLZGr0XqE23EO+ZTlm9RtMZ9i7hsq3i4GixdugVvLlgaW0UaFMjS9
	 uQOzRCPAdFnDAiEt6TxghVFJUUYKd6DQFqMunp/zgN7baBdmZ0V25yiP7rMaKPkeAR
	 yir8YwhKZ/jcEqAQMu3bHI6lIfaekYagWQ3u9TsrQWna5IL3lW+myWnVb0+7tuS8Iw
	 sjdOYV06fbFxUtc4zfOGorvGZk7cr8Wts3aHHMl4OVoghNvIpgbuinCYrwTJu5A3hD
	 mb9m1ds79U+iOm9l7G2wxMKJt8/6GxH3W++98c9NxflGJw7Tr3IH7IfpPoheoY1h6R
	 OskA+VRwKVCjQ==
Received: from [100.113.2.110] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 21/F5-52906-4D6E3D06; Thu, 24 Jun 2021 01:58:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqnvl2eU
  Eg5OtKhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bX2puMBbM4KvacPsrUwHiMvYuRi0NIYDaT
  xJSZD5m6GDmBnD2MEl8npIPYbAK6Eucer2UHsUUE9CWWzt7DDGILC/hL/Hh1gQXEZhFQlbh6/
  RIriM0r4CFx5MEGsBoJAQWJKQ/fM0PEBSVOznwCVs8sICFx8MULoDgHUI2ixOzp8hDlFRIzZm
  xjm8DIMwtJxywkHQsYmVYxWiYVZaZnlOQmZuboGhoY6BoaGusCSVNDvcQq3US91FLd5NS8kqJ
  EoKxeYnmxXnFlbnJOil5easkmRmAYpRQyTN/BuObNB71DjJIcTEqivKXtlxOE+JLyUyozEosz
  4otKc1KLDzHKcHAoSfBKAANTSLAoNT21Ii0zBxjSMGkJDh4lEV7LJ0Bp3uKCxNzizHSI1ClGR
  Slx3sdPgRICIImM0jy4NlgcXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzNsGMoUnM68Ebv
  oroMVMQIsVfl8EWVySiJCSamCq4vZ6/kJy8d6K377/t4fOeLFm2+PrDiWBBsIinKEHHqjsPhX
  W2enS6XWsaPWF+6cXH1j4/5tVyBvXI8llBk68hszbp7Q9rLhtFhL4yWCfpU6731uG4qMRQv8/
  rdsaHpB4NYidUeLzcWUDwVNn3rgzB29ZmXJcIuWJW9KZZ7c8tRi2hTu7O8zn/iWj5MGlF2599
  nVrRuve2V8s+7vKVSzUQkw3bT6ZtOjwX7VbCbwRl24dWbb71Imq/U4Rt80Vnty2LyyPMOQP2q
  96eKFP/a35fh2B1gw8HHzRpnm8Vxm/F9wyy98r4ae1zqhhc6aI9x8/wZKHFWK/l/93TU7kObE
  xIWLFqYhD/M/3SBR++qLEUpyRaKjFXFScCADYiYkFHgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-228.messagelabs.com!1624499924!174764!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20460 invoked from network); 24 Jun 2021 01:58:44 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-13.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2021 01:58:44 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O1we8j027519
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 02:58:43 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 02:58:39 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20210613.0 -> 5.9.20210620.0
Date: Thu, 24 Jun 2021 09:58:30 +0800
Message-ID: <1624499910-82348-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../ctags/{ctags_5.9.20210613.0.bb => ctags_5.9.20210620.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20210613.0.bb => ctags_5.9.20210620.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210613.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210620.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20210613.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20210620.0.bb
index f0ac4f615c..8f4781b177 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210613.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210620.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "f3ac807427e07f04b3b9225d61c339b3e8b4925f"
+SRCREV = "e8457b5021744add677ede6663190f09bd223e82"
 SRC_URI = "git://github.com/universal-ctags/ctags"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

