Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07099C433FE
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 09:04:17 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.26457.1643274255913938827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 01:04:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=jC0fAmKo;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643274254; i=@fujitsu.com;
	bh=pXbspfQda+s0gYHn8sdGXKog8XQF18R0Xcrab4OIU9s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=jC0fAmKoJZPMRX+NdMhJgPBvEDY46+ZWeBBfRe78IB9v+CMa4GQUxpvTC8mmdMmoR
	 0AR7c9Zrdu3SmOkHL5k4/leYT8PMGSvxD4gwVPD+41H/u2nGzlJyEoTS78xECR1/dR
	 SGDs1W0kKWDI7h7tC4n/V7py5BylpBhNsCawD0Ko6pLR5sEbPWeL4FeG/n9dHx6LgE
	 8vn//xDyUvymuKGquouv7sSDEC/amcZjzNrlYfuGSDrIpiE3uBHBMgZO+NNbNHgsVd
	 j/vmyeAObbJ4LSpJAUrBuyDQNcQ0VS7DawPpcgyg1V9zReRfo3/jINZCwWyE8IBekY
	 Q4v4hVurT2H4Q==
Received: from [100.115.34.7] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id B8/0D-29321-D0062F16;
 Thu, 27 Jan 2022 09:04:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8MRosub8Cn
  R4MVTZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP2xkWsBYt5Kyat38zYwNjO08XIxSEkMJNJ
  4sGW/cwQzklGiSvL3wM5nBxsAuoSj2++ZgSxRQT0JZbO3gMWZxZQlei+uIa9i5GDQ1ggXGLSB
  RWQMAtQuOfHNyYQm1fATeL4/03sILaEgILElIcQIzkF3CXmtb9nA2kVAqr5PU8folxQ4uTMJy
  wQ0zUlWrf/Zoew5SWat85mhhijJHFixUcmCLtC4vXhS8wTGAVmIWmfhaR9FpL2BYzMqxitk4o
  y0zNKchMzc3QNDQx0DQ1NdY1NdQ0tTPQSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTy
  Uks2MQJDOKVYeccOxrZVP/UOMUpyMCmJ8i4x/5QoxJeUn1KZkVicEV9UmpNafIhRhoNDSYI3P
  xYoJ1iUmp5akZaZA4wnmLQEB4+SCO+qOKA0b3FBYm5xZjpE6hSjLseEv/MWMQux5OXnpUqJ84
  rGAxUJgBRllObBjYDF9iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxtIKt4MvNK4Da9Ajq
  CCeiI3+ffgRxRkoiQkmpgstJcsqrwX6VoxLHXnd5Xjyz5eCDPZs4s9fP5/B4ab9Lv9Z/6kZr0
  5f+B7y0nbScem3NajNtIdaXjvzU1m7mL/okszTzJ/+3mq+7nl5ek/rj+PPd/1Ok3PdNVHHgKF
  ndltVk2cRxj+tof/sv1KG+8k3y0SY9nzy6X/I4JKuxaD76FsHh4uJeua5Z9EVFl+/ifltuLPd
  V931J/apXr33832UdtiZLLnh9rYrZOvSb5bN1dGZt5lgcd7gRK3euoS7xsLGq7Rv41U7zHg+i
  SYPPYSfenPYppVnwsqpYW769vOjWMMy7+xXKLEz3a1ZyrNoQxfTI1KjGZ06p6Nm7WArWHKjZ/
  l++0zz0s/urKhiA5JZbijERDLeai4kQAjcdniWgDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1643274253!5203!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21847 invoked from network); 27 Jan 2022 09:04:13 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jan 2022 09:04:13 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20R947JL013626
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 09:04:13 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 27 Jan 2022 09:04:05 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 2/3] [oe] [meta-python] [PATCH] python3-pyephem: upgrade 4.1.1
 -> 4.1.3
Date: Thu, 27 Jan 2022 17:04:15 +0800
Message-ID: <1643274256-7015-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643274256-7015-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1643274256-7015-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 09:04:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95118

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Fixed an inadvertent loss of precision in the routine that computes a date=E2=80=99s
hours, minutes, and seconds. It was sometimes returning a small negative number
of seconds, which caused Python=E2=80=99s datetime type to complain
ValueError: second must be in 0..59.
-Users installing from source on Windows are now protected against a possible
encoding error as setup.py reads in two text files.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pyephem_4.1.1.bb =3D> python3-pyephem_4.1.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pyephem/{python3-pyephem_4.1.1.bb =3D> python3-pyephem_4.1.3.bb} (77%)

diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.1.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.3.bb
similarity index 77%
rename from meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.1.bb
rename to meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.3.bb
index ec3cde87d3..29697bc251 100644
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.1.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "http://rhodesmill.org/pyephem/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9c930b395b435b00bb13ec83b0c99f40"
 
-SRC_URI[sha256sum] =3D "dba9e05c78ce910ae75a06351a5592479191a8dc570ac0cd6d18a77e98138873"
+SRC_URI[sha256sum] =3D "7fa18685981ba528edd504052a9d5212a09aa5bf15c11a734edc6a86e8a8b56a"
 
 PYPI_PACKAGE =3D "ephem"
 
-- 
2.25.1


