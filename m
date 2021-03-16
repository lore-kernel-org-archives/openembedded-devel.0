Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web11.2521.1615858097494558758
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 18:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id E7/F5-64503-EA900506; Tue, 16 Mar 2021 01:28:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYqruOMyD
  BYPI/VYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePK8x+MBR1cFV9nBjYwdnF2MXJxCAnMZJLY
  MaWDFcI5ziix+Nkqxi5GTg42AX2JhvevmEFsESB76ew9YLawgKfE4Qfn2boYOThYBFQl2n+Al
  fMKeEssOP2QHcSWEFCQmPLwPTNEXFDi5MwnLCA2s4CExMEXL5ghahQltu88wwJhV0rMfbOQaQ
  IjzywkLbOQtCxgZFrFaJFUlJmeUZKbmJmja2hgoGtoaKRraGmha2RoqpdYpZukl1qqW55aXKJ
  rqJdYXqxXXJmbnJOil5dasokRGEQpBceu72C8+vqD3iFGSQ4mJVFeP+aABCG+pPyUyozE4oz4
  otKc1OJDjDIcHEoSvA/ZgXKCRanpqRVpmTnAgIZJS3DwKInwVrECpXmLCxJzizPTIVKnGBWlx
  HnLOYASAiCJjNI8uDZYFF1ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzbBTKFJzOvBG76K6
  DFTECLDaX9QBaXJCKkpBqYfB43ZRlunCzQcvlXhFn6Br27x0xlP4p/Z9O7+mbzLhsdq2PljTe
  Mrf9JHXH7pT9JNsSAJVw7rOH4g7C5Sx0+GwYt6XvsfzFf/I3y+UU6SWyzolOf25e72fCymdWn
  ZzpJzJyyx6UkNnCVwDvlxH1iduYKqc7Cm1YukijXnx69rSDOUkBufUSW08LbFw6eSDbLjPd6z
  qjZNWtzlWtBkB2XSfSy5AlLezXmtt/TrPtc3zXpvXH9mdAwZy75GQ2l3HfvHWc0Py3z47i6/X
  LxSwuWPk78/GibzeaFTjyNvdcPLr39UPDrlC09rtUvdzBwhDxUzfrqwNF9ufEuy0GnK3M3yPJ
  FVs/uCF3mZix48ooSS3FGoqEWc1FxIgD7zKSyHQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-27.tower-291.messagelabs.com!1615858094!603056!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10802 invoked from network); 16 Mar 2021 01:28:14 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-27.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Mar 2021 01:28:14 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12G1S8SF019174
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 01:28:14 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 01:28:07 +0000
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] dovecot: upgrade 2.3.13 -> 2.3.14
Date: Tue, 16 Mar 2021 09:27:59 +0800
Message-ID: <1615858079-107787-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../dovecot/{dovecot_2.3.13.bb => dovecot_2.3.14.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.3.13.bb => dovecot_2.3.14.bb} (95%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.13.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
similarity index 95%
rename from meta-networking/recipes-support/dovecot/dovecot_2.3.13.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
index c78d283d25..c0f2863dbf 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.13.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://dovecot.org/releases/2.3/dovecot-${PV}.tar.gz \
            file://0001-not-check-pandoc.patch \
            "
 
-SRC_URI[md5sum] = "f512bf1a4dac9ac994fddfb6bc5068ff"
-SRC_URI[sha256sum] = "a3f875b80ec11a452480690108660030978c94fa8e796ad6d943a874b496f1c4"
+SRC_URI[md5sum] = "2f03532cec3280ae45a101a7a55ccef5"
+SRC_URI[sha256sum] = "c8b3d7f3af1e558a3ff0f970309d4013a4d3ce136f8c02a53a3b05f345b9a34a"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
-- 
2.25.1

