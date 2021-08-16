Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web12.18661.1629077115007991545
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 18:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vZ5vx1D3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: leimaohui@fujitsu.com)
Return-Path: <leimaohui@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629077112; i=@fujitsu.com;
	bh=dJ6HkTErPImPDeNJGawsz6kUwa0EmQR0DEgA9sKqfoA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vZ5vx1D3M7fcWWkvUJaKCz03I6janHVQSOX5JUOUlIX5obqNTcMRcr69pXpr4KSRD
	 hOOgatnqwG5SV/OfBUggNNHlTtp3TF0hkbTh0RK11vmLnkibuN063Aj36PQnt4z1jq
	 MZtLCuUjew2/AA9q7HnJQVpGLITUMI7pLdXj1ghkX2qXzck1B/xPuQanAKuxhLtnmw
	 X3iXEx+8IKca66FEBEoNyrdysCd/9LmhaQQATcMhwaeYvvpVIRJNdF/OY6tVhFMwBP
	 G1veCjUOhvTMchiZDz1mmmx4hVYAe5YDT30ude2dmP1obvZkd0TRqLQeuKHJVKiM09
	 HLQtIRce/S4yA==
Received: from [100.113.1.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id EB/EB-31171-87EB9116; Mon, 16 Aug 2021 01:25:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxRbdin2S
  iwaLlTBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aTX3tZCh6zVvw7nNDA2MTaxcjFISQwm0ni
  e+thFghnL6PEy1Wf2bsYOTnYBDQkdk+9zAxiiwjoSyydvQfMZhZQkzj68ieYLSwQKLF4+hpWE
  JtFQFXi4KGzLCA2r4CrxJKJC8BsCQEFiSkP3zNDxAUlTs58wgIxR0Li4IsXzBA1ShJvL+1hhL
  ArJGbNamOawMg7C0nLLCQtCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6xrqmhrqJVbpJuqlluo
  mp+aVFCUCJfUSy4v1iitzk3NS9PJSSzYxAsMrpZDReAfjwdcf9A4xSnIwKYnyZhySSBTiS8pP
  qcxILM6ILyrNSS0+xCjDwaEkwcuySzJRSLAoNT21Ii0zBxjqMGkJDh4lEd7mLUBp3uKCxNziz
  HSI1ClGRSlxXqW9QAkBkERGaR5cGyy+LjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5rUDmc
  KTmVcCN/0V0GImoMU+BmCLSxIRUlINTL4RwZPrE7dqvP2UOuvxSnbP7bq13c5NTqrJrnkPHrw
  RTgr1OVIkr37HOeqp+sysig6lPxv+GQfIBHRZ6ySz8s/I2NwSasGZ8vTHr3CVjt+ZZQWX2lZx
  x0ltXcP1pStdwOdmXevsgrZ7E41TJF5q3uO/+/4e2w/X6SvSakOLMtdOnHyvSOTznVMJrI4Hl
  3ew6dy4dIDPf3btW3Md+0lvtBn5H205J3J8g9WeLZNO3yy8/PLMEs+9b490MLl+D1DISgq04R
  b5I3DFSDIwosvlhmID2/rHa/Q9Lyb5FV053m/Z2WgVyL9ux2bR+P3yF3rn3n65tLTmb7gDK59
  deALnsi8Fx3beObdcgvH5X+UZSizFGYmGWsxFxYkA789y9ioDAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-4.tower-226.messagelabs.com!1629077111!95532!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25105 invoked from network); 16 Aug 2021 01:25:12 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Aug 2021 01:25:12 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17G1P645019068
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Aug 2021 02:25:11 +0100
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 16 Aug 2021 02:25:04 +0100
From: "leimaohui" <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH] packagegroup-meta-oe: Update ttf-ipa package name.
Date: Mon, 16 Aug 2021 18:24:57 +0800
Message-ID: <1629109498-55444-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index b7abe2197..0e58d9b65 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -524,7 +524,7 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
     ttf-gentium \
     ttf-hunky-sans \
     ttf-hunky-serif \
-    ttf-ipa \
+    ttf-ipag ttf-ipagp ttf-ipamp ttf-ipam \
     ttf-lohit \
     ttf-inconsolata \
     ttf-liberation-sans-narrow \
-- 
2.25.1

