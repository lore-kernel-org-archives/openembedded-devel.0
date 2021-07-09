Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.5306.1625794286672086024
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jul 2021 18:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AsFZ/VCQ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625794284; i=@fujitsu.com;
	bh=+k7qKgM2wp/NaP9M2qVABQv73oOHaZflcNMwMMsweZc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AsFZ/VCQBnZ6prJ6ZjZmc1WPbNUMW8paHXjqi4tJHrdsyCxd0u2POXIrCpX/mGGMX
	 JZmlcS+HlaxgoYtTrvTILe4ACdiKk9i+HIF22vuCRs9WNxA6lREH98wMAB7ug20zAt
	 GrGLdHnjhfjwgHf10eH7NfRUfgOXam720Z1xCI6ZKYZIzSECWkRaIImsvtVPpmmCGD
	 IG/LdXRGUrlRK6g7FgEcgYhuHJqbGsJDb+iMob8SYaCkIqnkALhNQD0XXdejPJjoYT
	 nl3hwbRm+LUwA0zce+5kVMftidxVQ9bEQlPpglDCjiWlIWW1Ap56GtnKcWhMDAWPqS
	 mz0LOqHeACh7w==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 79/35-07624-CE6A7E06; Fri, 09 Jul 2021 01:31:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1X2z7Hm
  CwZa7nBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bcP/+YCo5wVsxrvM7awHiHo4uRk0NIYBaT
  xKaj8V2MXED2bkaJWb92soMk2AR0Jc49XgtmiwjoSyydvYcZxBYW8JO4+fI7I4jNIqAicejYN
  DYQm1fAU+LftM9gcQkBBYkpD98zQ8QFJU7OfMICYjMLSEgcfPECKM4BVKMoMXu6PER5hcSMGd
  vYJjDyzELSMQtJxwJGplWMFklFmekZJbmJmTm6hgYGuoaGxrpmuhbmeolVukl6qaW6yal5JUW
  JQEm9xPJiveLK3OScFL281JJNjMAgSilkC9/BeOb1B71DjJIcTEqivFoznicI8SXlp1RmJBZn
  xBeV5qQWH2KU4eBQkuA9sgQoJ1iUmp5akZaZAwxomLQEB4+SCC/nIqA0b3FBYm5xZjpE6hSjo
  pQ4r+ZSoIQASCKjNA+uDRZFlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ814HmcKTmVcCN/
  0V0GImoMUMh5+CLC5JREhJNTD5ngtkPqnId+6zS/KW/ZG5hopiDQcrZ3P/ubsiV/7Ol7yPF1U
  7ndm/yh923lT2ZtOv/3EMB8t2zdfcWva1bkGT9qnsAwxvK9hrq7Y9+Gd7SFrv99dAB8PdukvT
  EwN/VHvz+Lj8ST5zQqVG6XT9gjbHZ51RL9dV6JttS1JKTNf3MpBL3rHz57mb+h53t8xfNcW2f
  92drVJC9v03r1+9tS9qFeu3n8opp26oFtnrb276K3/iyPy0ztpdEjmn/e70FnBelBR7a5JwbG
  LZvYKN8hZL/jsxPVtxeuK+5Rpph4sSNtQsu3Mt7Xh35+zoN4f7nyTIbDBR2p0VYR0TNn9i6KP
  iq7zNeps/LLT3kH+8wlVHiaU4I9FQi7moOBEASrco9R0DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-238.messagelabs.com!1625794283!101418!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12282 invoked from network); 9 Jul 2021 01:31:24 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-3.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jul 2021 01:31:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1691VN8c004228
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jul 2021 02:31:23 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 9 Jul 2021 02:31:21 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 1.4.3 -> 1.4.4
Date: Fri, 9 Jul 2021 09:31:16 +0800
Message-ID: <1625794276-102903-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Release 1.4.4 - July 4 2021
---------------------------

* Added some performance improvements. Performance for larger files should be
  5-10% better.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-xlsxwriter_1.4.3.bb => python3-xlsxwriter_1.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.4.3.bb => python3-xlsxwriter_1.4.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.3.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.4.bb
index e6b196956e..64ab8afa67 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.4.bb
@@ -16,6 +16,6 @@ RDEPENDS_${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "641db6e7b4f4982fd407a3f372f45b878766098250d26963e95e50121168cbe2"
+SRC_URI[sha256sum] = "791567acccc485ba76e0b84bccced2651981171de5b47d541520416f2f9f93e3"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

