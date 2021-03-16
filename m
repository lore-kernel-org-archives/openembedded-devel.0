Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.2580.1615858456168838655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 18:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 75/08-49021-51B00506; Tue, 16 Mar 2021 01:34:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYoivKHZB
  gcOuMhsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHqZRdLwST2ioWv9rE1MO5n62Lk4hASmMkk
  0Tn3FSuEc5xR4t/7PvYuRk4ONgF9iYb3r5hBbBEge+nsPWC2sIClxKFvZ5i6GDk4WARUJU4/4
  AYJ8wp4Sxw9do0VxJYQUJCY8vA9M0RcUOLkzCcsIDazgITEwRcvmCFqFCW27zzDAmFXSsx9s5
  BpAiPPLCQts5C0LGBkWsVokVSUmZ5RkpuYmaNraGCga2hopGtoaaZrZGiil1ilm6SXWqpbnlp
  comuol1herFdcmZuck6KXl1qyiREYRikFR67tYDzw+oPeIUZJDiYlUV4/5oAEIb6k/JTKjMTi
  jPii0pzU4kOMMhwcShK8s7iAcoJFqempFWmZOcCQhklLcPAoifBuB0nzFhck5hZnpkOkTjEqS
  onzXuAESgiAJDJK8+DaYHF0iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7wuQKTyZeSVw01
  8BLWYCWmwo7QeyuCQRISXVwJQQJ73D6//HA9wT7+S84LwXX9n49EJUiSs/qxnn+WkzzPSPMKd
  YzWbtZr+9v1M1lmP1g/3/hVyVJnk9TmVrlsk/IvYk2HHzvwUljH6lInccNt2e4cmg2/GsTLg8
  KlH7b2He89IPF60/Rq5L/OS4pv+Ip3bYnnWNSU6d5/faRerMMy82VGJNPrQ+a8tbzQbWpk99F
  4p3R+rLu+5Vqlzsu/RRcN6sULdQg99bNu/X4/w1+999WXvGL5EWskIvl+x9dlljzcILes6tlZ
  1HJB00eudXvUt2s7k5I9VUq3eKmAOvdxrvopra4Ev3nbRO2K8x3xT3KSs+l5NLZd/ZqrtsWde
  OlIhZ9uw/YiGlKb1ZiaU4I9FQi7moOBEA6o6a2h4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-287.messagelabs.com!1615858453!841202!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21355 invoked from network); 16 Mar 2021 01:34:13 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-5.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Mar 2021 01:34:13 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12G1YDis027959
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 01:34:13 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 01:34:11 +0000
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] fio: upgrade 3.25 -> 3.26
Date: Tue, 16 Mar 2021 09:34:05 +0800
Message-ID: <1615858445-108053-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.25.bb => fio_3.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.25.bb => fio_3.26.bb} (96%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.25.bb b/meta-oe/recipes-benchmark/fio/fio_3.26.bb
similarity index 96%
rename from meta-oe/recipes-benchmark/fio/fio_3.25.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.26.bb
index 6ab7ab79dd..6f2464e5ef 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.25.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.26.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG_NUMA_armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "fd80924b22fef6ce0d5580724d91490347445f90"
+SRCREV = "267b164c372d57145880f365bab8d8a52bf8baa7"
 SRC_URI = "git://git.kernel.dk/fio.git \
 "
 
-- 
2.25.1

