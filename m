Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web10.7157.1616724542215257893
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 19:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=edE8fzx1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616724540; i=@fujitsu.com;
	bh=/hz1qd47uuHZDCaB0w40GOTHDlsSESWOkBbWdJT5zJU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=edE8fzx12fdROWUDLJNU4/Vytw1VlBVJMTclk1nNhjsdCyAXJuRj33MhfkHAUzHks
	 cUb0eeNRmsxDfAPvXHqRFd889H4NBVPW4v2luXfBcufxOy2CmbF4t/QV5ssfTmGBAh
	 sMk9YMjEdQ8qMcRLEW5oCv6WCjvLullwchSpwkCvIgrObFIXpaE7GK6nDAeB+V8Nha
	 KaaEqiH1rZqdv4IEqZnGubjUZWHrDjmK48PQPh4abnFinqcdncz8d+OMgxPY3uu7JR
	 23/GuSBhHwOApqJPA2pkWlQNmwS179s//f+cijKqcDdEKP+8527d3x+KmN/8En5LAy
	 lbLMQohYt6/aw==
Received: from [100.113.1.157] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id FD/6B-38244-C324D506; Fri, 26 Mar 2021 02:09:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI1bVxik0
  wuL1K2OLi4aXMDowe5zauYAxgjGLNzEvKr0hgzdj4o5ex4D9HxY3OyUwNjMs4uhi5OIQEtjBJ
  dJxYxgrhnGCUeDH5B1MXIycHm4CORMeLbhYQW0RAX2Lp7D3MILawgKPEtH0TgBo4OFgEVCU+H
  OEAMXkF3CV2H6oCqZAQUJCY8vA9WDWvgKDEyZlPwKYwC0hIHHzxghmiRlFi+84zLCCtEgJVEk
  dmqk1g5JmFpGMWko4FjEyrGC2SijLTM0pyEzNzdA0NDHQNDY11jXRNDfUSq3QT9VJLdZNT80q
  KEoGSeonlxXrFlbnJOSl6eaklmxiBIZRSyGS8g/Ha6w96hxglOZiURHkPnYhJEOJLyk+pzEgs
  zogvKs1JLT7EKMPBoSTBO9UhNkFIsCg1PbUiLTMHGM4waQkOHiUR3h+2QGne4oLE3OLMdIjUK
  UZFKXHeYEeghABIIqM0D64NFkOXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzcoFM4cnMK4
  Gb/gpoMRPQ4o0/IkEWlyQipKQamASlk7uvLWEpm/rufDeHwSaNps8NkU5/pK+ZH5Cefd+3+v9
  Tua0MZccErv2ODUx59n9DMHOI7YwXs8y/1189HHBtz9q0j0/DsvYE/at/H5oic0HzctzEin98
  v15u7rj1LPc207dyf2U+DukVuY+Z056mC0z963fj2YEJZ6w2tv5c91Btd8jvRQ3n+PhPMZ+U+
  7NxToh8tcHTm8Ycuv6zqzL/XnZNa3L9nnu/1E9Hj5+VWy/zckTJpev7mLW+rXL8Ir3XQe6B++
  7HLkLlsTObxH7Y7A9c/VnX58DeDCPT4olsH9UOVPrM5iy+6PTgRbTaHitlnV1NbNslpJtehWg
  nTD9bu+9qUgvXJTaOnDsrOJVYijMSDbWYi4oTAV3Fb+McAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-228.messagelabs.com!1616724539!96076!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27210 invoked from network); 26 Mar 2021 02:09:00 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-7.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Mar 2021 02:09:00 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12Q28uW8007813
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Mar 2021 02:08:59 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 02:08:55 +0000
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] uriparser: upgrade 0.9.4 -> 0.9.5
Date: Fri, 26 Mar 2021 10:08:49 +0800
Message-ID: <1616724529-25681-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../uriparser/{uriparser_0.9.4.bb => uriparser_0.9.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_0.9.4.bb => uriparser_0.9.5.bb} (84%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.9.4.bb b/meta-oe/recipes-support/uriparser/uriparser_0.9.5.bb
similarity index 84%
rename from meta-oe/recipes-support/uriparser/uriparser_0.9.4.bb
rename to meta-oe/recipes-support/uriparser/uriparser_0.9.5.bb
index d02cf5de8..f50622358 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_0.9.4.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_0.9.5.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "095e8a358a9ccbbef9d1f10d40495ca0fcb3d4490a948ba6449b213a66e08ef0"
+SRC_URI[sha256sum] = "1987466a798becb5441a491d29e762ab1a4817a525f82ef239e3d38f85605a77"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.25.1

