Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.5258.1625794259406277085
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jul 2021 18:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oAix2ZLH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625794257; i=@fujitsu.com;
	bh=P4DHBlBpZe9KSYLGrF1MvcFjG7uwR9rIyy9ZdF3uvmA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oAix2ZLHj1U4LHxSOf8J+rad8DfF+/+GhFd2TotSbflITRSTcBoUKey9ygr/wNi3W
	 /uK+lKgRKNdQ7X4cCYNXfwb4n+tOw6xChvz/gdsgACTwVqdFQJgLziWYUy58srg+lx
	 aPoTVjXH2ENIfmMWp0Ry4kmSzN8wbXBhno+dnK8WpiFUEg/IsRcRFZGqm0DSMTNasw
	 6YAKrJvjcBubLubc5Sar+RS/5iLm2Hk9t63nHi6d34DqCtG+DYNJfc1N9lsZeEhcoj
	 VVyFvOsIztkVfuMfMWcLrTHLV9jDROo5J06BfCufAyTfI/kYjxNwULY3CjTdQcvLMn
	 Z3doVizopn+jQ==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id E5/56-07685-1D6A7E06; Fri, 09 Jul 2021 01:30:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYqnth2fM
  Egyt/bSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozV69ewFuzgqri1O7qBcS9nFyMXh5DALCaJ
  w5/uM0M4uxklrvw5xdTFyMnBJqArce7xWnYQW0RAX2Lp7D3MILawgJfE+T+T2LoYOThYBFQkb
  nUEg4R5BTwlFp3rZAWxJQQUJKY8fM8MEReUODnzCQuIzSwgIXHwxQtmkFYJAUWJ2dPlIcorJG
  bM2MY2gZFnFpKOWUg6FjAyrWK0TCrKTM8oyU3MzNE1NDDQNTQ01jXSNTI000us0k3USy3VTU7
  NKylKBMrqJZYX6xVX5ibnpOjlpZZsYgQGUUoh040djN9ef9A7xCjJwaQkyqs143mCEF9Sfkpl
  RmJxRnxRaU5q8SFGGQ4OJQneI0uAcoJFqempFWmZOcCAhklLcPAoifByLgJK8xYXJOYWZ6ZDp
  E4xKkqJ82ouBUoIgCQySvPg2mBRdIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO91kCk8mX
  klcNNfAS1mAlrMcPgpyOKSRISUVANTYfFx271qBmzmX6N2dr8OcOB9cuK74vbDC+8sbO5Ile9
  53FDv8HCdV8Bt28h5d5y/5O4ymuKV3LOLbfdFnyjla8LBInd2L2hpfHJYKiF7+rmCuzpXlzG8
  Oy9777VLhM6Tb0fCVM8pOT6Lmrqqr/QN34ksdu3NC7w/8joUfNkfN4Xr9tHUYyef76pkdOSct
  DVdKGKPU8+V0wbGh9Oe8y59NXnr5WU+3Gu4o7qffrLLOp64qPl/4q89m5N5o6UXCHLUuGX0zz
  2Z1Pxr4gmvriX3bNcd3iJyxFKA76vjsq+L+danHGbc0hrVdebFGl37078mmXSbTTXzP3Fcz+5
  bwKfG4CnJF32cPjz428wj1nRORYmlOCPRUIu5qDgRACyvATYdAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-228.messagelabs.com!1625794256!463021!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21533 invoked from network); 9 Jul 2021 01:30:56 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-4.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jul 2021 01:30:56 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1691UtYu021672
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jul 2021 02:30:55 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 9 Jul 2021 02:30:54 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-tqdm: upgrade 4.61.1 -> 4.61.2
Date: Fri, 9 Jul 2021 09:30:49 +0800
Message-ID: <1625794249-102829-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Add runtime dependency to resolve errors that occurred when import tqdm.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-tqdm_4.61.1.bb => python3-tqdm_4.61.2.bb}     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.61.1.bb => python3-tqdm_4.61.2.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.61.1.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.61.2.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.61.1.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.61.2.bb
index 7fa30e7f9c..1e127f7240 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.61.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.61.2.bb
@@ -5,10 +5,15 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=59e4271a933d33edfe60237db377a14b"
 
-SRC_URI[sha256sum] = "24be966933e942be5f074c29755a95b315c69a91f839a29139bf26ffffe2d3fd"
+SRC_URI[sha256sum] = "8bb94db0d4468fea27d004a0f1d1c02da3cdedc00fe491c0de986b76a04d6b0a"
 
 inherit pypi setuptools3
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
+RDEPENDS_${PN} += " \
+	python3-logging \
+	python3-numbers \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

