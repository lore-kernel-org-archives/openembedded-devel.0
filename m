Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A98C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 14:34:17 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.26710.1640615655818974765
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=h//FdY4H;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640615654; i=@fujitsu.com;
	bh=IrsDIGtt4z/YZcav+G+sERX+chC6Ix77QviS+5F2c1M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=h//FdY4Hoo45NoJYwCJhlSIebzl4A8wH5hkowEaMccVbmIW655tMS3nqFRNtihlx9
	 1vpFjt499hIPvIUQ8aywnBgIa81GptrvyO3YKr2lZuJZGBN/vCBWK76q+Hic6uzCuG
	 zbE6WPwtkwXCPYk4vYrVUlsIkmpwfQuZqSKGZCM849rYGCHCY06IVYUyYnIfDogFu8
	 eJ2+d/lDuxwAX+i7q5q0zozphfk2IuZn1J7D902HCs1w5mvcSfPdaidHukEOOmGLFY
	 LkdGgqztadBJLX9gKhQ7481wjkmdSnSBxfmHp+iNkMaMEA7chvTpKpLZL/Ae7kK4GN
	 ss/idMfO3HSqQ==
Received: from [100.115.70.228] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 78/EB-31213-6EEC9C16; Mon, 27 Dec 2021 14:34:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8ORqPv03Ml
  EgwdHdCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owNn1YwF8zlqjiz/QxjA+MOzi5GTg4hgSeM
  Eq2rZLsYuYDsC0wSv6ZsY4ZwTjBKfN/xgwmkik1ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBP4kZk9+B1bMIqEpsfNsMFucVcJJoOdYLFpcQUJCY8vA9WC+ngLNEw6E9QHEOoGVOEh
  MvO0OUC0qcnPmEBWK8hMTBFy+YIVoVJWZfbmaBsCskZs1qgxqpJnH13CbmCYyCs5C0z0LSvoC
  RaRWjXVJRZnpGSW5iZo6uoYGBrqGhqa6Zma6hpaFeYpVuol5qqW5yal5JUSJQWi+xvFgvtbhY
  r7gyNzknRS8vtWQTIzCUU4qd9u9gfNr3U+8QoyQHk5Io7/cJJxOF+JLyUyozEosz4otKc1KLD
  zHKcHAoSfCuPwuUEyxKTU+tSMvMAcYVTFqCg0dJhPcOSJq3uCAxtzgzHSJ1ilFRSpz3IEhCAC
  SRUZoH1waL5UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmbQKbwZOaVwE1/BbSYCWjxTIf
  jIItLEhFSUg1MdkcDe4LX3uD5GWj9ItonJs0i9P+ZiLVlXMt59kyNbr6id6bnQpSG0uypN6VX
  7Qy9YP/+1cPgmY/XBLt2/9OZHK+0NNJjVbtZgYdTxg6pHbP7mDoqmvJMFboK5ohenB+VELrQ9
  oCb6+NwNSe1oFfzNTezx2XaBe07dDvqTsOhyvX3tfteH/C6/pwhPczro31Vr4bFGYEpoT/Sbe
  1ivXff87lQ2v4n9OaqJZ2XVU4KmayVeR9hyfzn+pHUmBkvSmTTrYOjsz1t1feEvZwd8kJt94o
  VB3Wt3Re6y+yIOOOq4dbaphxYtzqu/emt2DOHmRctfbFhRqPTvr3dcwWvXFAQNf/uczj8t6sF
  S8KTPUJKLMUZiYZazEXFiQD/uwlvYAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-528.messagelabs.com!1640615653!227388!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10670 invoked from network); 27 Dec 2021 14:34:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 14:34:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3FCAB1001A3
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:34:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 32917100183
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:34:13 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 14:33:52 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libfile-slurper-perl: upgrade 0.012 -> 0.013
Date: Mon, 27 Dec 2021 22:33:23 +0800
Message-ID: <1640615604-22927-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640615604-22927-1-git-send-email-wangmy@fujitsu.com>
References: <1640615604-22927-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 14:34:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94511

Changelog:
=========
Always split on newlines in read_lines

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ile-slurper-perl_0.012.bb => libfile-slurper-perl_0.013.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libfile/{libfile-slurper-perl_0.012.bb => libfile-slurper-perl_0.013.bb} (88%)

diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb
similarity index 88%
rename from meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
rename to meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb
index 4a2cb73e8..c7e5c56b6 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb
@@ -13,8 +13,7 @@ file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/File-Slurper-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5742c63096392dfee50b8db314bcca18"
-SRC_URI[sha256sum] = "4efb2ea416b110a1bda6f8133549cc6ea3676402e3caf7529fce0313250aa578"
+SRC_URI[sha256sum] = "e2f6a4029a6a242d50054044f1fb86770b9b5cc4daeb1a967f91ffb42716a8c5"
 RDEPENDS:${PN} = " \
     perl-module-carp \
     perl-module-encode \
-- 
2.25.1


