Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web12.6845.1616723577256653969
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 13/0D-24644-77E3D506; Fri, 26 Mar 2021 01:52:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxVbfMLjb
  BoPG5pcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrF6s1PBB86KXYtXsjcwdnB2MXJxCAlsYZI4
  8+w1E4Szh1Fi86ObjF2MnBxsAgYS+89eYAexRQT0JZbO3sMMYgsL+Eg86tvLCmKzCKhKbLxzl
  AXE5hXwlti8ZylYr4SAgsSUh++ZIeKCEidnPgGrYRaQkDj44gVQnAOoRlFi9nR5CLNK4shMtQ
  mMPLOQNMxC0rCAkWkVo0VSUWZ6RkluYmaOrqGBga6hoZGuoSUQm5joJVbpJuqlluqWpxaX6Br
  qJZYX6xVX5ibnpOjlpZZsYgSGUErBgQk7GPe//qB3iFGSg0lJlPfQiZgEIb6k/JTKjMTijPii
  0pzU4kOMMhwcShK82daxCUKCRanpqRVpmTnAcIZJS3DwKInw8lgBpXmLCxJzizPTIVKnGL05v
  qxasoiZ49laELlh3lIg+f/uXSDZv+DgamaOm+2HVjMLseTl56VKifMW2gKNEAAZkVGaB7cAFp
  eXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzWoFM4cnMK4G74xXQiUxAJ278EQlyYkkiQkq
  qgenq6Zkplh1Xfq/z0Nkef9x1RSHvemX3iSF8Gb6S9/Y6HmCuDBb7ITlX+m708e2nziSd9j2X
  15WpEJXmOFttv/6ylB1MkzdMepf2THSLzqcFAhMOz+BO8ty39uvMv/fOzpzTeGPeXpY3Niw6v
  qIeCxem/nt+Vs/q6dLIzTfN9LgXHBX+nb9as0ttx7r3Nucv/e9R276iOaZ5083IlTtfvzOu/9
  2UctlfpXrn5+lxVxhPrCp3SNyQ8jAt+NC0TbtlPZfYL/blivr8nc1PO84p/uJEh7OHMgqkZhW
  dEdhTsWIW6+OS4qc2Kk+feX88LCoo/rLw8cP5ZU/uPG0R1XrFfH/PAdWDtZeSdaZfictdmxpc
  ocRSnJFoqMVcVJwIAO6t8tBGAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-271.messagelabs.com!1616723574!49254!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31906 invoked from network); 26 Mar 2021 01:52:54 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-5.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Mar 2021 01:52:54 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12Q1qsqv012055
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Mar 2021 01:52:54 GMT
Received: from localhost.localdomain (10.167.225.35) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 01:52:53 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] dialog: upgrade 1.3-20210306 -> 1.3-20210319
Date: Fri, 26 Mar 2021 18:24:29 +0800
Message-ID: <1616754269-67770-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../dialog/{dialog_1.3-20210306.bb => dialog_1.3-20210319.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20210306.bb => dialog_1.3-20210319.bb} (88%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20210306.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20210319.bb
similarity index 88%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20210306.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20210319.bb
index 5a293109e..5f165617c 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20210306.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20210319.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
           "
-SRC_URI[md5sum] = "87793125f9bd3b8e84165f99da2a2134"
-SRC_URI[sha256sum] = "a73e7b607b635f63c0202bb3313106e700f91fe4a9f4d26ca7003f6eb2b9cb0f"
+SRC_URI[md5sum] = "45a28836769d52c00c800fa3226c530d"
+SRC_URI[sha256sum] = "42c6c2b35dd6d1c6cf231238e3bd6d3b7af53fc279a1af547ab9890044d46652"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.25.1

