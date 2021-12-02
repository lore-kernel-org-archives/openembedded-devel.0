Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1B7C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 09:12:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.6166.1638436355184578828
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 01:12:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=P0C2F82X;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638436353; i=@fujitsu.com;
	bh=5u5o9vh82m6HSt0LUUbScoL7hLAvhpmJ4YPchYw0jF0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=P0C2F82XSWUOXS1QI1zbu4s7NffAwPNKKvYu7GglKdUWfiJZO/pg9svehtBhIckSn
	 0t4hpWtk2uTh4n9CdhHytfThPjznmmBxR8PtF9Z7coKwII6TAqZS3pkGA8+NE99Bfd
	 Q3Mue4o+Rzf2jhH1D3sdkSqq279gsHsVk09fWHufUyODBM43HKOYPUl937tOu0QEOh
	 Nj5K61zE9Tu4rJ4WTKI06NR0GYzxNzlMCi3E3pj9EJyWRAHzDMV9Ioz3VvYArFGWnT
	 GhkyAz4ovuFof/Mcud9kRjTO2ecby8NtREU3GLgDXtLaHJUac4wb5cRU0qaXQaV0aQ
	 LctrOG25hGlEQ==
Received: from [100.115.0.49] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id 79/FB-14731-10E88A16;
 Thu, 02 Dec 2021 09:12:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8MxSZehb0W
  iwcYV+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bjb4vYC36LVExbc4u5gXGPUBcjF4eQwBNG
  ibNdp1ghnAtMEuuXPmeBcE4wSnxeewLI4eRgE1CXeHzzNSOILSKgL7F09h5mEJtZQFWi++Iad
  hBbWMBTovPrPrA4i4CKxIHHr9hAbF4BN4lnZ7+C2RICChJTHr5nhogLSpyc+YQFYo6mROv23+
  wQtrxE89bZzBD1ShInVnxkgrArJF4fvgQVV5O4em4T8wRGgVlIRs1CMmoWklELGJlXMVolFWW
  mZ5TkJmbm6BoaGOgaGprqmukamlnqJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWW
  bGIEhnFKMdvKHYwr+37qHWKU5GBSEuVVSFqRKMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd1EPU
  E6wKDU9tSItMwcYUzBpCQ4eJRFe1V6gNG9xQWJucWY6ROoUozHHhL/zFjFz3Hy/ZBGzEEtefl
  6qlDivL0ipAEhpRmke3CBYrF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMz7F+Qensy8Erh
  9r4BOYQI65fCs5SCnlCQipKQamCRn26ysup01MTibb7p5SXU255/lk648PfPo4eZ/3VxxUucO
  PXrOPO2hg52NTMOcH0WLHVVXfrHcvXCJyfYf99bKrY1jrtFcV7KlPfH/xNtGgrf0EuTSjbwbz
  7N+939S8O3Yoc2/eNecVLc/9MLof1r6HaO6Oz9n3WJUvxPy2z++PObgHb5DAgIs8x8LH1vwfO
  /izmOnNDfYZMgsFZ/YuzbFZcKDJ0uztjQZLFFh59Vs+r2owVnqWav2gX1s3abMdfcvmpVXzuP
  /+6Pr+AvPNysvhfaqmE1XE9tmutTHZ23Cgk75ru49hpdvXGIUP3jt/4EZIozSPxZUxa6zZfkk
  ukJScNFPJW6eFzy/j92Z9OmHEktxRqKhFnNRcSIArU6D4HADAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-591.messagelabs.com!1638436352!222059!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5333 invoked from network); 2 Dec 2021 09:12:32 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Dec 2021 09:12:32 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 351941000FF
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Dec 2021 09:12:34 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 289D11000FD
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Dec 2021 09:12:34 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 2 Dec 2021 09:12:16 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyephem: upgrade 4.1 -> 4.1.1
Date: Thu, 2 Dec 2021 17:11:55 +0800
Message-ID: <1638436315-9778-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 09:12:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94177

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
When you provide PyEphem with a Python datetime that has a time
 zone attached, PyEphem now detects the time zone and converts
the date and time to UTC automatically.

A new search routine had been written and tested to power the
:ref:`transit-rising-setting` methods previous_rising(),
previous_setting(), next_rising(), and next_setting(). They
should no longer be susceptible to getting hung up in a loop.
You should also find them substantially faster.

Fixed the constellation() routine so that it uses astrometric,
rather than apparent, right ascension and declination. This
should make it more accurate along the borders of each
constellation.

Fixed how the underlying =E2=80=9Clibastro=E2=80=9D library computes whether a
body=E2=80=99s image is deflected by gravity when its light passes close
 to the Sun. Previously, users would see coordinates jump
unexpectedly as the deflection formula turned on and off haphazardly.

Fixed the star positions in the ephem.stars star catalog by adding
 8.75 years of proper motion to each star. Previously, each
1991.25 position from the Hipparcos catalog was being incorrectly
treated as a 2000.0 position.

A new routine unrefract() lets you compute the real altitude of
a body that you observe in the sky at a given apparent altitude.

The old cities.lookup() function is now officially deprecated.
Because of a Google API restriction, it stopped working in 2018.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pyephem_4.1.bb =3D> python3-pyephem_4.1.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pyephem/{python3-pyephem_4.1.bb =3D> python3-pyephem_4.1.1.bb} (77%)

diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.1.bb
similarity index 77%
rename from meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.bb
rename to meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.1.bb
index add4458333..ec3cde87d3 100644
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "http://rhodesmill.org/pyephem/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9c930b395b435b00bb13ec83b0c99f40"
 
-SRC_URI[sha256sum] =3D "c076794a511a34b5b91871c1cf6374dbc323ec69fca3f50eb718f20b171259d6"
+SRC_URI[sha256sum] =3D "dba9e05c78ce910ae75a06351a5592479191a8dc570ac0cd6d18a77e98138873"
 
 PYPI_PACKAGE =3D "ephem"
 
-- 
2.25.1


