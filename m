Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web12.4477.1626255314845332870
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jul 2021 02:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JLARR9Ov;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626255312; i=@fujitsu.com;
	bh=rOACZFS4yBr837RhBTBy9CI04ia8/5sfuGNzE7jvrrA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JLARR9OvhLiOAsUR0hI8B4iIJpe+UBmvFh2SVXxq9Ky8kgBrg8rKeG9Ouf0bj8Qo3
	 896gOmQnQAANJ0gygZOsmubhXuQGvxB8rpPPt+PV9YJMbEQ9/n80UBPgQkWS8Jh7Ku
	 txTlcJ4A2P6TPuLo8kC2U7yVYtyPcXkPPnysI9oYm1Tf6A524BbNR0qRqoI7GDWk+g
	 YJF2aL3jFKNReavXNgz8XdYLH1NiYjDfgRo6rkr4BSDOBv+ym1mUaTyvXbvvQouXzQ
	 BSEVVlkUracwZfHMdYbhUzu4jHg4f/6+wdDN8ZXb5oZcM+XxX1ZwqxSlLgQBn20zfJ
	 6Q4XJnvgI544A==
Received: from [100.112.198.129] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 77/C1-07373-0DFAEE06; Wed, 14 Jul 2021 09:35:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0b2w/l2
  CwbMDMhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bVPevZC47yVLy8PomtgXEFdxcjF4eQwDYm
  iS+t1xghnJOMEvd/v2brYuTkYBPQkeh40c0CYosI6Essnb2HGcQWFvCU+PTrHVgNi4CqxPOzs
  5lAbF4BN4n/N/4wgtgSAgoSUx6+Z4aIC0qcnPkEbA6zgITEwRcvmCFqFCW27zzDAmFXSuyZ1c
  80gZFnFpKWWUhaFjAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0NNc1NDbXS6zSTdJLLdUtTy0
  u0TXUSywv1iuuzE3OSdHLSy3ZxAgMpJSCo507GH+9+qB3iFGSg0lJlPeGz9sEIb6k/JTKjMTi
  jPii0pzU4kOMMhwcShK8jGvfJQgJFqWmp1akZeYAgxomLcHBoyTC6w6S5i0uSMwtzkyHSJ1iV
  JQS5/VeB5QQAElklObBtcEi6RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd6zION5MvNK4K
  a/AlrMBLRYe81bkMUliQgpqQammO1Tlrwu+Z4hFMQ6eUfh5a+/tv/tmKbNyvmgN+z190IJS/9
  5LNJ32wsXGGqffa649JB5a9/mG7O+endXPl+ebDrzj8Hq9c9vLUrT+/u/PiLvqs/fqf1bnyfJ
  d3x0ODzL9vP3QxEsBYm+nj7WDs4VR5tL9bkWzS3Y83S9nbzgm77p5xX+L+ebZed00/ncXRdxx
  iTTY7sTTrP6nn/8fvrTft2gS3//fZ3ZkLRpZYzUvlrfdQU39na/3L8j6Yj/iaPC2ZNuVj/Rel
  X94rHA3GeTlzU+djSy+C3BtLJa7eNHrlyrP+Lfp062/7nV588js8SLd2KEDL5sDd7E6LH0wN6
  Zz7/uiz2hNefVz8KpSyIb0q4psRRnJBpqMRcVJwIAlhBhSR8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-287.messagelabs.com!1626255312!80118!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25603 invoked from network); 14 Jul 2021 09:35:12 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-12.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Jul 2021 09:35:12 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16E9ZCRZ023983
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jul 2021 10:35:12 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 14 Jul 2021 10:35:09 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-isort: upgrade 5.9.1 -> 5.9.2
Date: Thu, 15 Jul 2021 05:35:03 +0800
Message-ID: <1626298503-4783-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Improved behavior of isort --check --atomic against Cython files.
Fixed #1769: Future imports added below assignments when no other imports present.
Fixed #1772: skip-gitignore will check files not in the git repository.
Fixed #1762: in some cases when skip-gitignore is set, isort fails to skip any files.
Fixed #1767: Encoding issues surfacing when invalid characters set in __init__.py files during placement.
Fixed #1771: Improved handling of skips against named streamed in content.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-isort_5.9.1.bb => python3-isort_5.9.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.9.1.bb => python3-isort_5.9.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.9.1.bb b/meta-python/recipes-devtools/python/python3-isort_5.9.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-isort_5.9.1.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.9.2.bb
index 273067c159..5832136dfb 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.9.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "83510593e07e433b77bd5bff0f6f607dbafa06d1a89022616f02d8b699cfcd56"
+SRC_URI[sha256sum] = "f65ce5bd4cbc6abdfbe29afc2f0245538ab358c14590912df638033f157d555e"
 
 inherit pypi setuptools3
 
-- 
2.25.1

