Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web11.3973.1617859675430660609
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=q2FLLtwj;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617859673; i=@fujitsu.com;
	bh=8yJzsUssEW0ReNqP5gprQUgPMExStHP7jqNMKBVPWAE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=q2FLLtwj5b9ZDKHmr7uA7YRw2PZnuN1hE016+1+4NnwWuZPCZFlJrsAFQocsPWkFp
	 aPmeFL61GdkOmlWwkDk7vLsMA9QN1J70XHECu893pDLvTPCrPPJxdzcMdqcWeXHY3s
	 kvztZzPXPx8ml+AWK+6Kc8p4CI/qzCI4vuyrCl+qxv9Pg6NrNz3lvPt91aaPd8LhwV
	 IcRl1jbZmJcZuVJvmE7FRpKeeY3KGMVgFQtIIg5l8/z0BUt75laUiXQAK0F3tzpiPv
	 RZQ0yNQk65kCdEwmxp9pw+hSDOb/33/9zoXdqE0jfVdZxHXkNOcRHvsojlI2U/TEmy
	 SnWzaOj5FJvkw==
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id E4/CD-42359-9549E606; Thu, 08 Apr 2021 05:27:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRWlGSWpSXmKPExsViZ8MRqhsxJS/
  B4ONbE4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePtr+XMBV/ZKx7PPcfewDiRvYuRi0NIYCuT
  RNP390wQznFGiTunrjF3MXJysAnoSHS86GYBsUUE9CWWzt4DFhcW8JDofnuYHcRmEVCRuDNhG
  iOIzSvgJjHhQwtYvYSAgsSUh++ZIeKCEidnPgGLMwtISBx88YIZokZRYvvOM1D1VRJnZ39hms
  DIMwtJyywkLQsYmVYxWiQVZaZnlOQmZuboGhoY6BoaGusa6Zoa6iVW6SbqpZbqJqfmlRQlAiX
  1EsuL9Yorc5NzUvTyUks2MQIDKaWQyXgH47XXH/QOMUpyMCmJ8mZNyksQ4kvKT6nMSCzOiC8q
  zUktPsQow8GhJMF7oQ0oJ1iUmp5akZaZAwxqmLQEB4+SCG8aSCtvcUFibnFmOkTqFKM9x5u1S
  xYxc7TduwskZy44uJqZ4377odXMQix5+XmpUuK8qZOB2gRA2jJK8+CGwqLwEqOslDAvIwMDgx
  BPQWpRbmYJqvwrRnEORiVh3skgy3ky80rgdr8COosJ6KySg7kgZ5UkIqSkGpi8BXQTX/Dqerh
  HyK4wXPpn0hSuAr5tfdP23KrX++P9wNr8ifEUXp4HK5WWTdt/wey2ZMzO00FnCv9P73u3NG9m
  gv2kopser/rcRLLtUg/Xz520tUnmse7ORo0VGQ+4w/zX3AuxkX3qMXlm+BV35hhhI+eaGWmJ8
  ydLfg7rqmrtNJ1o3/J/xh+GqR4R69R4f3wTFz3W3l6zZdVcsbtHLb3mKjgG2W/TTi7MXXzaWG
  bzKfdbxz4lXriypttUojzMi4txfcKqQ8JH31hKvC9f8V3rq2ynywbnA4eTZzy1FzrL2btp6S1
  2xjXTGnZxBcy32mN2SvjRpisuHyU5LZ69Pabc0rTGLVzm60yNMCn3HC8lluKMREMt5qLiRACB
  LXAZPQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-232.messagelabs.com!1617859672!1009737!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27240 invoked from network); 8 Apr 2021 05:27:52 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-13.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:27:52 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385RqRA025710
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Apr 2021 06:27:52 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:27:50 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] usbredir: upgrade 0.8.0 -> 0.9.0
Date: Fri, 9 Apr 2021 01:27:43 +0800
Message-ID: <1617902863-5289-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../spice/{usbredir_0.8.0.bb => usbredir_0.9.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/spice/{usbredir_0.8.0.bb => usbredir_0.9.0.bb} (88%)

diff --git a/meta-networking/recipes-support/spice/usbredir_0.8.0.bb b/meta-networking/recipes-support/spice/usbredir_0.9.0.bb
similarity index 88%
rename from meta-networking/recipes-support/spice/usbredir_0.8.0.bb
rename to meta-networking/recipes-support/spice/usbredir_0.9.0.bb
index 9ee43be1e..079f52f99 100644
--- a/meta-networking/recipes-support/spice/usbredir_0.8.0.bb
+++ b/meta-networking/recipes-support/spice/usbredir_0.9.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "libusb1"
 
-SRCREV = "07b98b8e71f620dfdd57e92ddef6b677b259a092"
+SRCREV = "bca484fc6f206ab9da2f73e8a0118fad45374d4e"
 
 SRC_URI = " \
     git://anongit.freedesktop.org/spice/usbredir \
-- 
2.25.1

