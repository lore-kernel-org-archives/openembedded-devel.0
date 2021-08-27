Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web09.4314.1630042909857234268
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 22:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WqvMjMkk;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630042898; i=@fujitsu.com;
	bh=tsLlHpiSLKPQ2WCqeJqMK372d80yBhsjiFbthDAdmJw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WqvMjMkkhNsz+xQSYvbicBWO7vn5XLRcILqDVSi9yEwetPK4bsrJwy/gIcwZAADu7
	 jhWcg/pNJml49K8FGhUQKe1nwDM4jhnZ80tFLp+XMPbVEiqbRWS27JhPV7gQI+F25p
	 YswWUg7lSlQNJbDLixkwIJbiTPosEcfc59jdHFGz1yhM9Dtcw850uhfRf1W6Ym3+Vv
	 BtaC+tVHy0rukMTnBeTwwQ+1P8wdPvqzMhsLVZgLdSRozdj0w7hd92YEwb5nQdYEmN
	 CmuK5xab3Sf1Yo8RWdPUT9VxUwyL0BW9PyBvtb+SdIoXqUnBYT6o6iNn/O6fBchfyX
	 lnl8BkT9JoAIg==
Received: from [100.112.196.227] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id AF/84-28239-11B78216; Fri, 27 Aug 2021 05:41:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxVVewWiP
  RoHmjgsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH9422mgrdcFesuLmBsYOzg6mLk4hASmM0k
  cfrUOXYI5wSjxLMrd1i7GDk52AR0JDpedLOA2CIC+hJLZ+9hBrGFBfwlLn/5zAhiswioSsy9c
  5kNxOYVcJfY8P84mC0hoCAx5eF7Zoi4oMTJmU/A5jALSEgcfPGCGaJGUWL7zjMsEHaFxOvDl5
  gnMPLMQtIyC0nLAkamVYwWSUWZ6RkluYmZObqGBga6hoZGuoaWZrpGhiZ6iVW6SXqppbrlqcU
  luoZ6ieXFesWVuck5KXp5qSWbGIGBlFJw5NoOxgOvP+gdYpTkYFIS5d2RrpEoxJeUn1KZkVic
  EV9UmpNafIhRhoNDSYJ3XQVQTrAoNT21Ii0zBxjUMGkJDh4lEd6eSqA0b3FBYm5xZjpE6hSjL
  seEv/MWMQux5OXnpUqJ8zJXARUJgBRllObBjYBF2CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHI
  xKwrxhIKt4MvNK4Da9AjqCCeiIAj5VkCNKEhFSUg1MB8MmOPdZXVveUpHlfMHD2EwoxMhcuma
  B6vStxrOkpD43uDnlb5JcF9T0JKlnbdnWORWPPkS8LomfwC24IsB9487koNlRMXMmeLv/PF2x
  ++455qdz23vrtBsKi4yc3UxS6hQdDQP8CmUuiW7evtz0X/XMjbf6t09N132iEGZmc+Xl8c1Xp
  qb925Aw+/e/1aveWs//s9btS033gkePmOX/fn7osWyz9OmQ+xq7vH4yCrv3Xvh+3EpbU1Ixwb
  HH2L0iuPhtusY/A1YBj+5T3ROiI09Z1Ea+nSm76q39hRs1r9nkNTiv6u+Z5u1sfLZS6JyfeWh
  //DrBVP3OJt9XizSu98aff7Hw4vnEdT9eJQcpsRRnJBpqMRcVJwIA4y1K3CsDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-287.messagelabs.com!1630042897!120251!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23505 invoked from network); 27 Aug 2021 05:41:37 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-17.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Aug 2021 05:41:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17R5fbXe027348
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 06:41:37 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 27 Aug 2021 06:41:35 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyephem: upgrade 3.7.7.1 -> 4.0.0.2
Date: Fri, 27 Aug 2021 13:41:30 +0800
Message-ID: <1630042890-53300-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

-License-Update: Change to MIT License.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...ython3-pyephem_3.7.7.1.bb => python3-pyephem_4.0.0.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-extended/python-pyephem/{python3-pyephem_3.7.7.1.bb => python3-pyephem_4.0.0.2.bb} (54%)

diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.0.0.2.bb
similarity index 54%
rename from meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb
rename to meta-python/recipes-extended/python-pyephem/python3-pyephem_4.0.0.2.bb
index 7cf88ec332..ce2a802849 100644
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.0.0.2.bb
@@ -1,10 +1,10 @@
 SUMMARY = "PyEphem astronomical calculations"
 HOMEPAGE = "http://rhodesmill.org/pyephem/"
 
-LICENSE = "LGPL-3.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f288303760f6e5ceaafe3aaa32186ab1"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9c930b395b435b00bb13ec83b0c99f40"
 
-SRC_URI[sha256sum] = "36b51a8dc7cfdeb456dd6b8ab811accab8341b2d562ee3c6f4c86f6d3dbb984e"
+SRC_URI[sha256sum] = "d03de73ebf6a91681d597eb5b5d43bcf6f0c67e292bba2f9a974734b4f15757e"
 
 PYPI_PACKAGE = "ephem"
 
-- 
2.25.1

