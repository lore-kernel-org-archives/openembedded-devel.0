Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6788FC433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 05:31:53 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.9658.1634016712617448606
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 22:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=A2Urbboo;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634016711; i=@fujitsu.com;
	bh=NUvCYgoUvDAJZU2nM6RgYnSCDIVdlltmoeH5qmFwJ3M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=A2UrbbooBl5nV6u+Fl/LqHRIL7h/0/o0yP7aL0G5+0yR1NKpV5zjSkdCRktO1dIYl
	 d8yWHPifjrNbcdtyfyHexDF0h/gxSJLco+SxjEkA5uzPYqDQGXL3mO0TeJaahW6SD4
	 5BlY00qQ1nFVH3tCH608jCfEueDIQdBCQGIhFL84f+q+9z0vlMqSamC/si52koGYNs
	 1o0TAfLD8znUy+hNqU83toRrvRKmIWJ8q1B9Lchw/pdnYwFzwEVvDMvGVhmzfIznWi
	 JpuviSEnuXnlZXhVNMETob9pLVjFQsDtfv6rXlL5SMub41NWu6ZRxORiFRKIGd4zGI
	 FDEFvfqpyoWcQ==
Received: from [100.113.7.45] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 14/AC-14220-6CD15616;
 Tue, 12 Oct 2021 05:31:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRqntMNjX
  RYOVcFYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePktg2MBasEKi5vn8DcwHiWr4uRi0NIYDaT
  ROPbr0wQzglGiWXX5zJ2MXJysAnoSHS86GYBsUUE9CWWzt7DDGILCwRIPJ/6DKiGg4NFQFWiq
  18NJMwr4C6xtvcjG4gtIaAgMeXhe2aIuKDEyZlPwMYwC0hIHHzxghmiRlFi+84zLBB2hcTrw5
  eYJzDyzELSMgtJywJGplWMFklFmekZJbmJmTm6hgYGuoaGxrpmQJZeYpVukl5qqW5yal5JUSJ
  QUi+xvFivuDI3OSdFLy+1ZBMjMIxSCtm4djA+ff1B7xCjJAeTkihv0KmURCG+pPyUyozE4oz4
  otKc1OJDjDIcHEoSvJ18qYlCgkWp6akVaZk5wJCGSUtw8CiJ8M6UAUrzFhck5hZnpkOkTjHqc
  jRPWr6dWYglLz8vVUqc94cQUJEASFFGaR7cCFh8XWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwa
  gkzDsHZBVPZl4J3KZXQEcwAR0RGJUCckRJIkJKqoFJ1rHqjEJE2f7LvxqaO6Y2K6zJY6s1+as
  ueTDjemfKNdWHV+2LSupjjp+bW3eRNaaRve0ln5uADvd02X3lz2zbTkwwva62iTVf20DIxPd4
  wAOvYLWJB/IC3qZemtKi7/DuePtKlSV5D4/0895dYVG6evrcVB67W/pn3+lFbVlussJRSYjXn
  1HG+0tEZ6bLbdWTEVw/Dx45O6ty09Gjd5p89tz0lLjRdPzCnBNWDU97XXoORHzy+lPqwXFiQU
  Likwev5oeETilan8X0xmvqF1a1shyHs9qbNrA81+1x187uk+ufV5db1vNrjcLP2uVbPDqc+fZ
  dvJ2yadb/2YwPvIWm9rDOm1zJ0+7r360eYa/EUpyRaKjFXFScCACkaW2qKgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-245.messagelabs.com!1634016710!955962!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25397 invoked from network); 12 Oct 2021 05:31:50 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-4.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Oct 2021 05:31:50 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19C5VoCd014081
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 06:31:50 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 12 Oct 2021 06:31:48 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-transitions: upgrade 0.8.9 ->
 0.8.10
Date: Tue, 12 Oct 2021 13:31:43 +0800
Message-ID: <1634016703-17404-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Oct 2021 05:31:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93251

Release 0.8.10 is a minor release and contains two bug fixes for the HSM extension and changes how the 'self' literal string is handled.

- Feature #545: The literal 'self' (default model parameter of `Machine`) has been replaced by the class variable `Machine.self_literal = 'self'`. `Machine` now performs an identity check (instead of a value check) with `mod is self.self_literal` to determine whether it should act as a model. While 'self' should still work when passed to the `model` parameter, we encourage using `Machine.self_literal` from now on. This was done to enable easier override of `Machine.__eq__` in subclasses (thanks @VKSolovev).
- Bug #547: Introduce `HierarchicalMachine.prefix_path` to resolve global state names since the HSM stack is not reliable when `queued=True` (thanks @jankrejci).
- Bug #548: `HSM` source states were exited even though they are parents of the destination state (thanks @wes-public-apps).

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...thon3-transitions_0.8.9.bb => python3-transitions_0.8.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.8.9.bb => python3-transitions_0.8.10.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.9.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.10.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-transitions_0.8.9.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.8.10.bb
index 178dfad3f3..46292987b1 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.8.9.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.10.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "fc2ec6d6b6f986cd7e28e119eeb9ba1c9cc51ab4fbbdb7f2dedad01983fd2de0"
+SRC_URI[sha256sum] = "b0385975a842e885c1a55c719d2f90164471665794d39d51f9eb3f11e1d9c8ac"
 
 RDEPENDS:${PN} += "python3-six python3-logging"
-- 
2.25.1


