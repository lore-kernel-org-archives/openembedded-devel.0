Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web10.8564.1631784199667173883
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Sep 2021 02:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=nzzBuBRB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631784197; i=@fujitsu.com;
	bh=dRl4gj6zhc0Nu5M/W/YcnPEcAwnRUz/TnmfYM/OLjMQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=nzzBuBRBZdvji0ttqyqZqkHVUND5Mu8RGse0H9C1YWTJaobZdKFy+Irs0Eccojp92
	 1Cigojde04fAkA7NF+3cZK8OfBbbpYMV+HB6ewIxichkNVSKKDlQbATL31rAP/91mV
	 6+V8VW65ANH2wA/L6w9JeG/w+yOtcGYMsrXlxzsQqvPEZsOPO63HblQILjDlxXdV/U
	 x+OmyYJFPAYZhXLREak621A+ChJjZ73NgA7oUs5PCox+NYIy54i8YmriPzkPSobhp1
	 1Lro4OmYzkelFnoK56j8k8x1+eRvBU5v6/dWo4Dx+amH3XtKAJwTUN4BmEFS98KF4z
	 6ejLr9qwnzJ0g==
Received: from [100.113.2.26] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id B8/98-32481-50D03416; Thu, 16 Sep 2021 09:23:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MxVZeF1zn
  R4N5GOYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPfuVlsBdN4Ko5e+8LawNjC3cXIxSEkMJtJ
  YtabPUwQzglGiXVvdrN1MXJysAnoSHS86GYBsUUE9CWWzt7DDGILC/hKbPh0nwnEZhFQlVhz7
  yhYnFfATWL307NgcQkBBYkpD99DxQUlTs58AjaHWUBTonX7b3YIW16ieetsZoh6RYntO8+wQN
  gVEq8PX2KewMg7C0n7LCTts5C0L2BkXsVomVSUmZ5RkpuYmaNraGCga2horGusa2hmqJdYpZu
  ol1qqm5yaV1KUCJTVSywv1iuuzE3OSdHLSy3ZxAgMvZRC5oU7GH+8/qB3iFGSg0lJlPfgTadE
  Ib6k/JTKjMTijPii0pzU4kOMMhwcShK8D7icE4UEi1LTUyvSMnOAcQCTluDgURLhLQBJ8xYXJ
  OYWZ6ZDpE4xKkqJ887nBkoIgCQySvPg2mCxd4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK
  8ryHiezLwSuOmvgBYzAS0+st8BZHFJIkJKqoHJZeKj598YRGat+eWeu1XDgE1Hcfu2L6/1OLo
  LEi1uWAZxxeZW3mDxvm6btLPa1D7mFG/76lXnuPu36maFi95+KP5kb+kvOc0poX/cd+mdn3n+
  WvVGfbsdO55/V66aGvt4ukr7CcvD/ypftVzpK9q4ab4ps1X3hP/z53ZyVF/QXWoqvJDBuD7Yj
  cVMdn6ds2sL7yvuL2Jij45PrUnkfyg7TaFRze9U617nQ1dj9DckiV0yu6ngelH9i4Nrx4pLZX
  bN7yZZT3z7PFz62mZld6GnQWqrkvrs7fWMOoMU73n/OLAv/umXxVtqzvlbha/btGfJyp57RvN
  0o7yumRgEuTevd/xpkbfoxmWRgPtpn08rsRRnJBpqMRcVJwIA/yC4TTgDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-226.messagelabs.com!1631784195!69303!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3329 invoked from network); 16 Sep 2021 09:23:16 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-6.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Sep 2021 09:23:16 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18G9NFsF025634
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Sep 2021 10:23:15 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 16 Sep 2021 10:23:14 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-decorator: upgrade 5.0.9 -> 5.1.0
Date: Fri, 17 Sep 2021 05:23:09 +0800
Message-ID: <1631827389-4558-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Added a function `decoratorx` using the `FunctionMaker` and thus
preserving the signature of `__code__` objects. Then fixed three small bugs:
- Sphinx was printing a few warnings when building the documentation, as
  signaled by Tomasz K=C5=82oczko
- functions decorated with `decorator.contextmanager` were one-shot,
  as discovered by Alex Pizarro.
- `decorator.decorator` was not passing the kwsyntax argument.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-decorator_5.0.9.bb =3D> python3-decorator_5.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-decorator_5.0.9.bb =3D> python3-decorator_5.1.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-decorator_5.0.9.bb b/meta-python/recipes-devtools/python/python3-decorator_5.1.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-decorator_5.0.9.bb
rename to meta-python/recipes-devtools/python/python3-decorator_5.1.0.bb
index f7594e87e2..2e44c3d801 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_5.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.1.0.bb
@@ -9,7 +9,7 @@ decorator, just because you can."
 LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbe2fd2007972bf96c08af3293d728b22"
 
-SRC_URI[sha256sum] =3D "72ecfba4320a893c53f9706bebb2d55c270c1e51a28789361aa93e4a21319ed5"
+SRC_URI[sha256sum] =3D "e59913af105b9860aa2c8d3272d9de5a56a4e608db9a2f167a8480b323d529a7"
 
 inherit pypi setuptools3
 
-- 
2.25.1

