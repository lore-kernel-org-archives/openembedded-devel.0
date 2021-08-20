Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web11.81430.1629452353916740696
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Aug 2021 02:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xXLFGRpf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629452352; i=@fujitsu.com;
	bh=Q8+llHRpmMwkrOfY/Sz0CEFlS4UENhUkpQI8F8s9+YI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xXLFGRpfk6r5DnFshnTzFv52pFGOQ90fPWN3FWpAvOlUa7qjiCwEzjwbwISfC5zPk
	 49bPD35YbdYqfOFQ5oJRXnNjr8MmXGykCn/bK+mIlJXxH4H5aFLe9ZGEPmpENfPPP+
	 SfAmuipvnxMuvHvUkNmic34KJvLPdajYJ2Oki/Py0FCGKIoCyVFzk7vh3s8ecUv8x2
	 iY0ykPOrhz5a/aA3Bz39xsAxxjAYavrQ5f19Adh0K/bLhSwG2AO4pA+9u0rm0gvLKO
	 5Oftbg8jbDKwJL+36EeBNDP5nCkb9r9069m4ZJeuSWTb3qUoLXvQEZW4Yhz/kayGGa
	 rADTwB6PNZ2TQ==
Received: from [100.113.0.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 17/8F-17140-0487F116; Fri, 20 Aug 2021 09:39:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0bWvkE8
  0WHfS2uLi4aXMDowe5zauYAxgjGLNzEvKr0hgzWhcUlhwnbOiec915gbGLxxdjFwcQgKzmSS2
  373GBOGcYJT42D4LyOHkYBPQkeh40c0CYosI6Essnb2HGcQWFvCWuPhyBSuIzSKgKrHj0iW2L
  kYODl4Bd4kfM8FaJQQUJKY8fA9WzisgKHFy5hOwMcwCEhIHX7xghqhRlNi+8wwLhF0h8frwJe
  YJjDyzkLTMQtKygJFpFaNlUlFmekZJbmJmjq6hgYGuoaGxrqGukZGZXmKVbqJeaqlucmpeSVE
  iUFYvsbxYr7gyNzknRS8vtWQTIzCMUgoZH+1gPP36g94hRkkOJiVRXlUz+UQhvqT8lMqMxOKM
  +KLSnNTiQ4wyHBxKEryXyoBygkWp6akVaZk5wJCGSUtw8CiJ8BYXAaV5iwsSc4sz0yFSpxgVp
  cR5vcuBEgIgiYzSPLg2WBxdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMGwQyhSczrwRu+i
  ugxUxAi4VUZUEWlyQipKQamBiFMvtYlP9dCwj/3zdfKkVFme+mf2LZ5zfPRA4395vysZvvNX+
  zZG8u+3KW+0Y7avJ09+qr8RRYJ9XuW9t+7TpfyyYnt8NLp03ZvDFyo+Uzh4+Jir/uXrMvtZWw
  sVZPbvGZvspfZufJAJObF+fsDngbJOu1w2xRqMODuG8FX0u5g3NeCSZ3z3ip75kkXTm7YIGTU
  SLDJm257wJ9wTl7i7u7dm9a8jujdjOvpUCves/Evurbb70fMjhVbXPj0Px2obbr9Wmh/Bcf1I
  QZtt6pSz913nuJ3fwNax/fZC12vzJ34wvTMmHOrSoMD3VTpfxknx5f3XHf/n/3ppLZG7dovEp
  d4PVpT3PmdqbsXzkaSizFGYmGWsxFxYkAxh7yIx4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-228.messagelabs.com!1629452351!77782!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1604 invoked from network); 20 Aug 2021 09:39:11 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 09:39:11 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K9dBTX028954
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 10:39:11 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 10:39:10 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-wheel: upgrade 0.36.2 -> 0.37.0
Date: Fri, 20 Aug 2021 17:39:04 +0800
Message-ID: <1629452344-16636-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

**0.37.0 (2021-08-09)**

- Added official Python 3.10 support
- Updated vendored ``packaging`` library to v20.9

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-wheel_0.36.2.bb => python3-wheel_0.37.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wheel_0.36.2.bb => python3-wheel_0.37.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.36.2.bb b/meta-python/recipes-devtools/python/python3-wheel_0.37.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-wheel_0.36.2.bb
rename to meta-python/recipes-devtools/python/python3-wheel_0.37.0.bb
index 9d9a441c01..aae4903d01 100644
--- a/meta-python/recipes-devtools/python/python3-wheel_0.36.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wheel_0.37.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "e11eefd162658ea59a60a0f6c7d493a7190ea4b9a85e335b33489d9f17e0245e"
+SRC_URI[sha256sum] = "e2ef7239991699e3355d54f8e968a21bb940a1dbf34a4d226741e64462516fad"
 
 inherit pypi setuptools3
 
-- 
2.25.1

