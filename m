Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web09.3980.1625189272835279296
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jul 2021 18:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YH5lt2O1;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.84, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625189271; i=@fujitsu.com;
	bh=ZLibFkQ63/YJ1j/m/+bxO4W+mdprP2O57cukF9w1zA8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YH5lt2O1T+t8fOzTka47C+FX9QanBP4Pz1XKcUpDqGL/V3G6HTNlWbWcOdyxZrdDi
	 jq0vm/jSXxp0Ww9K/yfbVPyLIGEd5WDdUei+w63EwpIzGyNBV+YK42FF34fCio3GXw
	 C64ILbj+3v0WAUYM1WIvD5sumMTGCCkjwBZcHtNXAuXFI+M+MWuhcXk+5Loy+q7CdC
	 UOJRly2/4Y31SkPp54wyTd5gis3ihDSJ0JOy+YPln0nQWjWDDfDx3cM8pl4M69NgWT
	 gQus6rQY1U6vHgVI0LYQpumGLTUPd5MEnZD1beBClniN/q3/nI6noWNaYYAMU1gQ8P
	 ROPNV1KMI+DUw==
Received: from [100.112.199.118] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id D4/CA-07373-69B6ED06; Fri, 02 Jul 2021 01:27:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8MRojst+16
  Cwav/ohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8acZzUFMzkq3hy7w9LAeJS9i5GLQ0hgFpPE
  13e3oJzjjBJzV/1j6WLk5GAT0JHoeNENZosI6Essnb2HGcQWFvCX+PjyFpjNIqAicWP5CbAaX
  gF3ibub1jCC2BICChJTHr5nhogLSpyc+QSshllAQuLgixfMEDWKEtt3nmGBsCskZszYxjaBkW
  cWkpZZSFoWMDKtYrRIKspMzyjJTczM0TU0MNA1NDTSNbQ00zUyNNFLrNJN0kst1S1PLS7RNdR
  LLC/WK67MTc5J0ctLLdnECAyjlIIj13YwHnj9Qe8QoyQHk5Io74FzdxOE+JLyUyozEosz4otK
  c1KLDzHKcHAoSfCezbyXICRYlJqeWpGWmQMMaZi0BAePkghvfAZQmre4IDG3ODMdInWKMZzjz
  doli5g53oLJtnt3gWQ7mJy54OBqZo5ZYPJ++yEg+QBECrHk5eelSonzdmYBjRMAGZdRmge3DB
  azlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ834BuZknM68E7qZXQOcyAZ17+uZdkHNLEhF
  SUg1MV5wbNkbs3exceiPg2ZHLB0xT3m7Qkiu5c35KqlHOP5fwIxOXbktbWvytf0PZ5vwE2XmL
  mFPdjtofu/6nlXHn1HXebztMFX7+Ofj1arvm2i2XI5YIB9qVzGnw9W3a2fb4RV3M1GnPOkJkn
  buOrVM4vsaV7VZIVbus0r9UL8mcmnv+8xaKeSafXcaQMN287VO/8TMHKz6fNXtLfEwCv8S6Td
  yQxF8VlV+1ujY+9LmXjwF3lefN1Rlhj5+EG+d5ZrB+5p7we+4MaSmxp+EV0RXLzY1nTzvhXac
  r8YY/4ejZtym/bkgU+5cbnJDUnqQlHi/OxmC/+HjH28cLrSslJLIafS+78d+2Cnyqqu4k4q7E
  UpyRaKjFXFScCAAKFMf8VAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-285.messagelabs.com!1625189270!44057!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19497 invoked from network); 2 Jul 2021 01:27:50 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-12.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Jul 2021 01:27:50 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1621RnGY014676
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Jul 2021 02:27:49 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 2 Jul 2021 02:27:48 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20210620.0 -> 5.9.20210627.0
Date: Fri, 2 Jul 2021 09:27:41 +0800
Message-ID: <1625189261-51130-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../ctags/{ctags_5.9.20210620.0.bb => ctags_5.9.20210627.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20210620.0.bb => ctags_5.9.20210627.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210620.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210627.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20210620.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20210627.0.bb
index 8f4781b177..7d01bba697 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210620.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210627.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "e8457b5021744add677ede6663190f09bd223e82"
+SRCREV = "c436bca61f1fb92d2c6d5767ae4b307efab678f3"
 SRC_URI = "git://github.com/universal-ctags/ctags"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

