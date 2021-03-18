Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.6464.1616058566169357979
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 02:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
Received: from [100.113.4.174] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id EC/65-38008-4C813506; Thu, 18 Mar 2021 09:09:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqntEIjj
  BYPFVfouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPhwS3sBbM5Ko42PGZpYDzM3sXIxSEksIVJ
  YsWS01DOCUaJq+ueMnUxcnKwCehLNLx/xQxiiwDZS2fvAbOFBTwlfrX1ANVwcLAIqErM/sQFE
  uYFCk+a2MUGYksIKEhMefieGSIuKHFy5hMWEJtZQELi4IsXzBA1ihLbd55hARkjIVAlcWSm2g
  RGnllIOmYh6VjAyLSK0TKpKDM9oyQ3MTNH19DAQNfQ0FjXVNfI2EIvsUo3SS+1VDc5Na+kKBE
  oq5dYXqxXXJmbnJOil5dasokRGEYphazvdjA+e/1B7xCjJAeTkijvX/7gBCG+pPyUyozE4oz4
  otKc1OJDjDIcHEoSvJnAwBQSLEpNT61Iy8wBhjRMWoKDR0mEN1scKM1bXJCYW5yZDpE6xagoJ
  c5rCNInAJLIKM2Da4PF0SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzVION5MvNK4Ka/Al
  rMBLQ4gj8IZHFJIkJKqoFp7nY2038pr9I/PNqyf0/BTLWF0yQXf28s77ytv7Boxj6bjxamucY
  Zt3XY3dzbov1j6306TfbGdO+ZaFy5TSaGafE9Rv3AMO5FyvN2bTwv/ihzlQXL1ijrvz2nrB7d
  b3VuqysNC+H7l+Sg9tjl0NJpDoVWlQ6TRFf89fYKXRJ+vK34sXzWv8S3dpN5eHRypk05dXmj/
  stT1SKfSnqfLZnVv/Tg07aCIj+XVQz/3lnHFihom5R5iH1vlTr+t+nr63dR2iqnXbI6Ju1ekb
  Htfvg72y9FxXcrb1k+fCIWtkn6oISTKns8S+RyH5OJriW5t6o5O+Ylv+qJ9Zgy5aFRk2Zni0S
  t8oWbvn9uTata+VSJpTgj0VCLuag4EQDWfCVyHgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-30.tower-245.messagelabs.com!1616058563!2593192!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27483 invoked from network); 18 Mar 2021 09:09:24 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-30.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Mar 2021 09:09:24 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12I99N1u003906
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 09:09:23 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 09:09:22 +0000
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] wireshark: upgrade 3.4.3 -> 3.4.4
Date: Fri, 19 Mar 2021 05:09:16 +0800
Message-ID: <1616101756-4946-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../wireshark/{wireshark_3.4.3.bb => wireshark_3.4.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.3.bb => wireshark_3.4.4.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.4.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_3.4.3.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.4.4.bb
index e730b18a03..b75f41835b 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.4.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "f467cc77f0fc73fce0b854cdbc292f132d4879fca69d417eccad5f967fbf262b"
+SRC_URI[sha256sum] = "729cd11e9715c600e5ad74ca472bacf8af32c20902192d5f2b271268511d4d29"
 
 PE = "1"
 
-- 
2.25.1

