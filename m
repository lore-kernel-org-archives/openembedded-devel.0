Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web11.2158.1617243988696687384
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 6C/D2-53303-25F25606; Thu, 01 Apr 2021 02:26:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeJIrShJLcpLzFFi42Kxs+EI1Q3UT00
  weH3SxuLi4aXMDowe5zauYAxgjGLNzEvKr0hgzZjyprrgMUfFxFd5DYwNHF2MXBxCAluZJO7f
  v8oK4exmlLi0aipLFyMnB5uAgcT+sxfYQWwRAX2JpbP3MIPYwgLeEld7H4HFWQRUJE5s+w9Wz
  wsUX9BzngnElhBQkJjy8D0zRFxQ4uTMJ2A1zAISEgdfvACKcwDVKErMni4PUV4lcXb2F6YJjD
  yzkHTMQtKxgJFpFaN5UlFmekZJbmJmjq6hgYGuoaGRrqGlma6ZiV5ilW6SXmqpbnlqcYmuoV5
  iebFecWVuck6KXl5qySZGYAClFBxx2MF4//UHvUOMkhxMSqK8U6alJAjxJeWnVGYkFmfEF5Xm
  pBYfYpTh4FCS4D2klZogJFiUmp5akZaZAwxmmLQEB4+SCK+NBlCat7ggMbc4Mx0idYpRUUqcl
  0sPKCEAksgozYNrg0XQJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvDIgU3gy80rgpr8CWs
  wEtPjKo0SQxSWJCCmpBianT8dS7u5lF0vd2jh37Wr3suVcj0OP6J69m+cWmD3p9qPLXwRaeUJ
  jnOyOmfvJPlX0ZPvaoTWV//z3yxpbc4+cYBUuFO+ICisX0zHX019RqKT4P3jx1N8btglPOHXZ
  aM6NR+c/Hj1uvP3asZz9T/8LRcUGTdpaPGf5DhW5kwsX7WHeaPxOMO7Th5nqr7ZLGNyUFKy/0
  HKe78PyfdFFOy9N9e4Lr7733vyTy6w5uyr29SUYH+B+eNSP70W+9+yoqglsYn86v7RUfNRS/t
  QU7LIoynbGndLk9/e7DXbk5j1hzXdT5+mvPzZryQSvnzOEku9v2/v79xKHBb+M+F5EhV/+Mpu
  tt5l3mfOU7L+OcvJdSizFGYmGWsxFxYkAIgYbchsDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-291.messagelabs.com!1617243985!94028!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31373 invoked from network); 1 Apr 2021 02:26:25 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-3.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2021 02:26:25 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1312QJ3n005825
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Apr 2021 03:26:25 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 1 Apr 2021 03:26:18 +0100
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] fetchmail: upgrade 6.4.17 -> 6.4.18
Date: Thu, 1 Apr 2021 18:57:59 +0800
Message-ID: <1617274679-49860-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../fetchmail/{fetchmail_6.4.17.bb => fetchmail_6.4.18.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.17.bb => fetchmail_6.4.18.bb} (91%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.17.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.18.bb
similarity index 91%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.17.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.18.bb
index 7c513f62b..7254a4713 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.17.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.18.bb
@@ -12,7 +12,7 @@ DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "a41bcdf11b41aa0682b259aee4717c617c15dadd43fa008b2ed38b770f4d50c6"
+SRC_URI[sha256sum] = "302dc9bcdc6927dedf375d2baaead2347557faa70d98b1da83f2409fa6fb259f"
 
 inherit autotools gettext python3-dir python3native
 
-- 
2.25.1

