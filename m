Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.36996.1629799260565205519
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 03:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=qd205Tzc;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629799258; i=@fujitsu.com;
	bh=PSdyhbdKrstsTV08rO3kx5dpC27RLCtSxWEJj8n05lM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=qd205Tzc/zbpQMrYAnwKL4wgaghWZXQfPzYuz/p8fTu2FAXS4B1w1e+7Yt2ULYSBx
	 +O8fRhSaagIGKT2pVd51oDXUqgnFXBjteJV7RZsCHys/Ejb+4LYOEJNqScZi7zjDWj
	 Lebvz/KFli98GY3SfWExC3r6MqNgMm6W0RXWVRimXGG1OPqWiVtCU/uXOxwt3NZNfa
	 +YmF04/xyiIeh67cCGamfpmJCeKDkSok5Pb1h+onR4elf9G3qs03UGiI6b324b0MwQ
	 qFeLQbSFM1RhprhKQQylYF8X8wvEF+5iKf7SwGz9CraDe/YwMbRepf8tLJBUKwPFIM
	 Qx5eTK+B37EjA==
Received: from [100.112.196.227] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id C6/D2-02582-253C4216; Tue, 24 Aug 2021 10:00:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRWlGSWpSXmKPExsViZ8MxVff6PpV
  Eg4Ywi4uHlzI7MHqc27iCMYAxijUzLym/IoE149e+C4wF3/kqZpyZwdTAeJC3i5GLQ0hgNpPE
  +1VnGLsYOYCcPYwSL9O7GDk52AR0Jc49XssOYosI6Essnb2HGcQWFvCTuHtyEZjNIqAqcW/1V
  bBWXgEPiYWnk0HCEgIKElMevgcr4RUQlDg58wkLiM0MVN595CkThC0v0bx1NjNIq4SAosTs6f
  IQrRUSrw9fYp7AyDsLSfcsJN2zkHQvYGRexWiRVJSZnlGSm5iZo2toYKBraGika2hpqWtkZK6
  XWKWbpJdaqlueWlyia6iXWF6sV1yZm5yTopeXWrKJERhuKQXHH+9gXPHmg94hRkkOJiVR3pJt
  KolCfEn5KZUZicUZ8UWlOanFhxhlODiUJHif7ATKCRalpqdWpGXmAEMfJi3BwaMkwjtxL1Cat
  7ggMbc4Mx0idYpRUUqc9/cmoIQASCKjNA+uDRZvlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMC
  oJ884AGc+TmVcCN/0V0GImoMX3JRVBFpckIqSkGphcv397uWn2h8PrdDXrz2/YJnWy2kXATuJ
  GyTsJnuCmy3MmWphZM/7o4Ky67BSzpztU+7kUmx03zz6jy6EqIpbhDHrpjhN8ln/NnDVZ9YCk
  e+/bIptNka85f8/6tahY4eT3dx8fZ1g1np6iNN+8YensbRN8f/psEJgy2e3B467lQinCW5fsE
  3E+1CInFaQW9GBZaY+Tx5K1bk8E8l57f71WMfPOoyT9lOfeDQt+h2l1/xeQd1t8dMfVQ+v+fB
  Zmea4ipVpa0ntvivITc56cndf5H7c5qJkkz800/DPjeUJ7Rev1s0vtxX1Doz73Lnw3I2iV7/f
  G3hta+17pXbUM8lkWf//pnB7XBWVZT153889XYinOSDTUYi4qTgQA1nvrwjIDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-287.messagelabs.com!1629798102!102454!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3028 invoked from network); 24 Aug 2021 09:41:42 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-15.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Aug 2021 09:41:42 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17O9fQGm022852
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Aug 2021 10:41:42 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 24 Aug 2021 10:41:24 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.144 -> 2.4.148
Date: Mon, 23 Aug 2021 14:51:26 +0800
Message-ID: <1629701486-89341-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

New
~~~
- Method `sharing_group_exists` [Jakub Onderka]
- Method `update_sharing_group` [Jakub Onderka]
- Save one REST call when initialize PyMISP class. [Jakub Onderka]
- Method `organisation_exists` [Jakub Onderka]
- Method `sharing_group_exists` [Jakub Onderka]
- Method `update_sharing_group` [Jakub Onderka]
- `to_dict` method supports `json_format` parameter. [Jakub Onderka]
- Method `organisation_exists` [Jakub Onderka]
- Method `sharing_group_exists` [Jakub Onderka]
- Method `update_sharing_group` [Jakub Onderka]
- Save one REST call when initialize PyMISP class. [Jakub Onderka]
- Method `organisation_exists` [Jakub Onderka]
- Method `sharing_group_exists` [Jakub Onderka]
- Method `update_sharing_group` [Jakub Onderka]
- Exclude decayed attributes in search. [Rapha=C3=ABl Vinot]

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pymisp_2.4.144.bb =3D> python3-pymisp_2.4.148.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.144.bb =3D> python3-pymisp_2.4.148.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.144.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.148.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.144.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.148.bb
index 6393078069..e091e8757c 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.144.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.148.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI =3D "git://github.com/MISP/PyMISP.git;protocol=3Dhttps;branch=3Dmain"
-SRCREV =3D "7dbaf665d9288f2a2692bee3d6207bb6abe3c51f"
+SRCREV =3D "6f7157cf26a6b4ec102021c8f1197a40380b12e3"
 S =3D "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.25.1

