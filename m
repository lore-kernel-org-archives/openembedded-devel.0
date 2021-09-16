Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.8617.1631784371754601791
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Sep 2021 02:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tNjSXFZi;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631784369; i=@fujitsu.com;
	bh=WUmvYz/ZOU7HrZW0MW5Zgl4vhsWWo3III6AqqFiTUQc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tNjSXFZiB+ax0DPD11NcKOxI0z4t5biPazX4zqtSzaJsci24hbIllRp8/x/iyvDok
	 o93yGmDA/rpKuR9Z7iXN5fW3Vhxgerk6V0l1gbXBUUZVkOASJdMg3Ga2l42SARsma3
	 tEo2eaQxSvDFDER4kVTF4hdniD0TNuoWRkMPTqJoEDf9HxagxnuAgfHURv/LfjtYEK
	 sigNPY6eKJcCS264dFedUewhgQUJAwAwWx8/lj3MG1K4M92QvTNowddD7Ed18AYwVm
	 anByD1b0q2NMp80y7g5Y5O5UQUa3K4Oy8vmbr0v0nf/nSf+vjKQPLpMF7LoqK4JZCe
	 t9EfcT1AqWWVw==
Received: from [100.112.197.4] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 73/91-21482-1BD03416; Thu, 16 Sep 2021 09:26:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI0d3I65x
  o8PqxpMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFm0WK2gu+cFTdb/zE1MJ7h6GLk4hASmM0k
  seHRSbYuRk4g5wSjxITp7CA2m4CORMeLbhYQW0RAX2Lp7D3MILawgI/E/X/7GEFsFgFViR87Z
  gDFOTh4BdwkHj5KAwlLCChITHn4HqycV0BQ4uTMJ2BjmAUkJA6+eMEMUaMosX3nGRYIu0Li9e
  FLzBMYeWYhaZmFpGUBI9MqRoukosz0jJLcxMwcXUMDA11DQyNdQ0sLXUNzY73EKt0kvdRS3fL
  U4hJdQ73E8mK94src5JwUvbzUkk2MwCBKKTi2dgdjz5sPeocYJTmYlER5D950ShTiS8pPqcxI
  LM6ILyrNSS0+xCjDwaEkwfuAyzlRSLAoNT21Ii0zBxjQMGkJDh4lEd4CkDRvcUFibnFmOkTqF
  KOilDivODAOhARAEhmleXBtsCi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9zYP0BSezL
  wSuOmvgBYzAS0+st8BZHFJIkJKqoGpJs7jbGZl5q3F9SrrL0/8tvBx7oansxly27bsfCbmEx6
  1/27UdflXZt+4Lrj76vOlNFs6llm81Oxye6F6XkcoebZpeOzvx0ZS4bl7XY7WJP9f9Pjn8a9+
  BpJV+3/Vp/G18Qv61zycfnj/xcZd0sez1R/XndKODJ+41fBq3O8NcurneF+Uc3+bJ/Vt19tVh
  RNdJL845Si5Tk3xnKafr1bFWn5h+9nZjXyOumwLFghMXrlXwqUnm3eN7r+cwzHahV8DXnxIvX
  DZbNWNQmemZYUcalMnpOfO+tD00fJ4yLt0kY7TLoXuNSZZF/6Zqn96+/+2TneS3PszOYGFPTM
  f/1wX/clGqTnj90qrrWKvA7YosRRnJBpqMRcVJwIAK3rDQR0DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-285.messagelabs.com!1631784369!10620!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6972 invoked from network); 16 Sep 2021 09:26:09 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Sep 2021 09:26:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18G9Q98o007743
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Sep 2021 10:26:09 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 16 Sep 2021 10:26:07 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-grpcio: upgrade 1.39.0 -> 1.40.0
Date: Fri, 17 Sep 2021 05:26:01 +0800
Message-ID: <1631827561-4712-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-grpcio_1.39.0.bb => python3-grpcio_1.40.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.39.0.bb => python3-grpcio_1.40.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.39.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.40.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.39.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.40.0.bb
index 76d38a2646..1cfb967493 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.39.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.40.0.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://0001-absl-always-use-asm-sgidefs.h.patch \
 "
-SRC_URI[sha256sum] = "57974361a459d6fe04c9ae0af1845974606612249f467bbd2062d963cb90f407"
+SRC_URI[sha256sum] = "3d172158fe886a2604db1b6e17c2de2ab465fe0fe36aba2ec810ca8441cefe3a"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1

