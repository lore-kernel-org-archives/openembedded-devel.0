Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A79DC433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 09:49:38 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.38442.1639561777752072405
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 01:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tPuRbjLU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639561775; i=@fujitsu.com;
	bh=1nZKL3gBlywtdty4reNz4uChL4wkf8+KXK9nyWf8JWo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tPuRbjLUTFKeIjx46aRUF4xhXPl1rw23gGoLZ5zuj5dta0PeyXYZWsf0Vl7Jw+Vf0
	 pOU1yT/sWSgBz3VmyPpBNTmTqSDhXCf2nIKq9uSkMRc2FZGUT70coLcK8mHrBUr/pz
	 El/kO6AlGD7jIztWBh2137UmRPwU0V/4qCwjQk6pM/OlpKBFv8SUi+aZHTnx7gQKGj
	 /EhZNW8QQ2Q/msnjwvq31/pwvjYblq6TcSWzL40SMFOMUY+FvS58EDrvTWDNIFC6IN
	 JOnybSUclfXi9Etw5WcHx33+/Dmfc4AL+YGm3+rMqcqk4hSBMLSjxClYHWqMLFEcEs
	 rP+X4e78HMb3w==
Received: from [100.115.68.153] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 BC/3F-24146-F2AB9B16; Wed, 15 Dec 2021 09:49:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8MxSVdv185
  Eg7/nDSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ownc2axF9zjqdj9dhl7A+N57i5GLg4hgSeM
  EsentzBDOBeYJPoOHmOCcE4ySvybM4e9i5GTg01AXeLxzdeMILaIgL7E0tl7mEFsZgFVie6La
  8BqhAV8JF5tXApmswDFz1+5xwJi8wq4Szze9gksLiGgIDHl4XtmiLigxMmZT1gg5khIHHzxgh
  miRknixIqPTBB2hcTrw5eg4moSV89tYp7AyD8LSfssJO0LGJlWMdolFWWmZ5TkJmbm6BoaGOg
  aGprqmhvqGloa6CVW6SbqpZbqJqfmlRQlAqX1EsuL9VKLi/WKK3OTc1L08lJLNjECwzOl2H3f
  DsYXfT/1DjFKcjApifLmbdqZKMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCl2MnUE6wKDU9tSItM
  wcYKzBpCQ4eJRHet9uB0rzFBYm5xZnpEKlTjIpS4rxXdwAlBEASGaV5cG2w+LzEKCslzMvIwM
  AgxFOQWpSbWYIq/4pRnINRSZj3DcgUnsy8Erjpr4AWMwEtPpa7HWRxSSJCSqqBaceDqs8aQUz
  idtz1+RzOBnN3sUuLXUx/v2Hfak4Wz2sdHzNM0+eUs+Xf6iuuv/VE21Fm26EdlgxrbhdZfEjY
  sNORc5/25d6D7RwuC9rDr072kXq1MUfSyqXQ0uRy06H8W/uXXHpSlsSnX71CrTtVeZaT06Gnn
  89uLopgYeu7O1XqQLvk5P8yp2srOctENl0MZt+8Mn1rwgqO8HtfZlke6bk23bvYS+u4+UP+il
  1a/xM+8zefu5+ZcMtJjL/t7JPFbUKFmTuStqw4+8LH2ur/4qMiPWdFTtXkm22Kf7H6VHTo2om
  ngmsmT6prPDKLM+G4poBZv+lh8e9HrZ7VWdnrVRjxmWn6HDtrcVC6O9NMiaU4I9FQi7moOBEA
  VrFNqEoDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-532.messagelabs.com!1639561774!17879!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24626 invoked from network); 15 Dec 2021 09:49:34 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Dec 2021 09:49:34 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 416D110044D
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 09:49:34 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2FC73100352
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 09:49:34 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 15 Dec 2021 09:49:12 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-django: upgrade 2.2.24 -> 2.2.25
Date: Wed, 15 Dec 2021 17:48:27 +0800
Message-ID: <1639561707-12180-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Dec 2021 09:49:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94366

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
================================================================================

Django 2.2.25 fixes a security issue with severity "low" in 2.2.24.

CVE-2021-44420: Potential bypass of an upstream access control based on URL paths
=================================================================================

HTTP requests for URLs with trailing newlines could bypass an upstream access
control based on URL paths.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-django_2.2.24.bb => python3-django_2.2.25.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.24.bb => python3-django_2.2.25.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.24.bb b/meta-python/recipes-devtools/python/python3-django_2.2.25.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-django_2.2.24.bb
rename to meta-python/recipes-devtools/python/python3-django_2.2.25.bb
index 982362bdd1..86d21fed06 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.24.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.25.bb
@@ -5,8 +5,7 @@ UPSTREAM_CHECK_REGEX = "/${PYPI_PACKAGE}/(?P<pver>(2\.2\.\d*)+)/"
 
 inherit setuptools3
 
-SRC_URI[md5sum] = "ebf3bbb7716a7b11029e860475b9a122"
-SRC_URI[sha256sum] = "3339ff0e03dee13045aef6ae7b523edff75b6d726adf7a7a48f53d5a501f7db7"
+SRC_URI[sha256sum] = "b1e65eaf371347d4b13eb7e061b09786c973061de95390c327c85c1e2aa2349c"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


