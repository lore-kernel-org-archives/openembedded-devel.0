Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.2440.1621473959576857453
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 May 2021 18:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uwnx8MQE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621473957; i=@fujitsu.com;
	bh=PMky14rUUOObkYmRH+GpWrhDTJdUN6hzMfiGcegkvk4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uwnx8MQE0P+qVw9K/Kq7MG0biHfu10MZdxWu5YEPbiQ6idCHW8jSFwOR1I8UJ/ivg
	 DYlllUkDVYquDxEOV+BDXkOl85oyitmbXx6Mw8dD4WFVCeQ9L8Uz+a8LFa2Hsn72rj
	 dqjRNDZGT0FYX25A7nO+Ji1vo68uzBA9bKBeVB0IavrgcFVnKMxtB7M2t4QwlFCELq
	 IUPTRcF87w/h/i8VTRU9q5O7hjYxyScmul1dx8hkKJba0mF0hobdw4kCl1zwh87ua/
	 UchKpjQ4nCIsKpnOOyWVzoDaTXCjW4DB7BK6HSlTVlDTMaAUuTPp9DDKEx/8BPmLy9
	 vFNguFJvT0I1A==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id F1/74-00056-5AAB5A06; Thu, 20 May 2021 01:25:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRWlGSWpSXmKPExsViZ8MxRXfJrqU
  JBsv6zCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owXy9MKlnJUHJ5s2MB4iL2LkYtDSGA2k8SH
  NctZIJwTjBI/fp5l6mLk5GAT0JHoeNHNAmKLCOhLLJ29h7mLkYNDWMBFYvkiUZAwi4CqxJxL1
  9hBbF4Bd4nefbPYQGwJAQWJKQ/fM0PEBSVOznwCNoZZQELi4IsXzBA1ihLbd55hgbArJGbM2M
  Y2gZFnFpKWWUhaFjAyrWI0TyrKTM8oyU3MzNE1NDDQNTQ00jW0NNM1M9FLrNJN0kst1S1PLS7
  RNdRLLC/WK67MTc5J0ctLLdnECAyglIIjDjsY77/+oHeIUZKDSUmU1+z+ogQhvqT8lMqMxOKM
  +KLSnNTiQ4wyHBxKEryGwJAUEixKTU+tSMvMAQYzTFqCg0dJhPf/NqA0b3FBYm5xZjpE6hSjL
  sfl6/MWMQux5OXnpUqJ8+btBCoSACnKKM2DGwGLrEuMslLCvIwMDAxCPAWpRbmZJajyrxjFOR
  iVhHkVQS7hycwrgdv0CugIJpAjGheBHFGSiJCSamDysXFS6fzbOu/x7hMnNYxWrYpdMbck7si
  kPZnHXPR3XzDqNvpx9+lzGYXCJd8ZV0+8O2W5zJzC1lZFd7V3J7psl4rd++ZS/1vN4sJc04c/
  LQ+x+da9tBHIO6v/Wnr7m3oRc90ut9lm9vYfzY9mCrYZltnpxvR3fI1x2bZHUbI/K1mKo+Irg
  5z6Zb1DE1N2V3ftfH8i8OrSFM8dbAof0xhcZrRk5erVcXcctZfVumqlfmFqMaPauY/a3T8P3W
  UrDtlw1vmpeuV/Z0UpqZ3zpso6KZ5SuHJYK/2X1pz1Yowcev5ansnLXbg7d93Ie1mreC28lsH
  lpo3GxA8BD5q51Jrapso9V3zGq+DisCdmjhJLcUaioRZzUXEiABNEc+knAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-291.messagelabs.com!1621473956!378585!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6848 invoked from network); 20 May 2021 01:25:56 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-6.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 01:25:56 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14K1PmWl003398
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 02:25:56 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 02:25:47 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] makedumpfile: upgrade 1.6.8 -> 1.6.9
Date: Thu, 20 May 2021 09:25:38 +0800
Message-ID: <1621473938-11052-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{makedumpfile_1.6.8.bb => makedumpfile_1.6.9.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.8.bb => makedumpfile_1.6.9.bb} (97%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
similarity index 97%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
index 50227ea0f2..79bad0a01c 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPLv2.0"
 
 SRCBRANCH ?= "master"
-SRCREV = "a8250642a4ff50a2559446f4e915a1f59ac7adf7"
+SRCREV = "a9ad811c15e769c8e6d8d915a05cebc32f2ea2f5"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS_${PN}-tools = "perl ${PN}"
-- 
2.25.1

