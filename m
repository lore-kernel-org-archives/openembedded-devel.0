Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF23C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 09:36:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.21382.1641980212612149013
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 01:36:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=y4hMOqhz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641980210; i=@fujitsu.com;
	bh=TMQcWCpnbInP45SgvLw1u54OeYfGJadwhNs8bfsRqrk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=y4hMOqhzn+k8J0T2zllM3o8f3j+1OVSQR4jIAlrHknwV2CFrxjrz7lJMAW1fjPdNT
	 6rl/0eHu3OwVlEBfH1cFNfLLIus7H++gEuMALyhGq+y16033zF7W0ULoxZGEU5B79K
	 mROUWf8PZaApZdL+6NQpTo2soqjBtEwSb7PsR6vIwOJLY5oTXpa7yhdJeWlqs0C2Bt
	 Cl9u7Gm8rRRavv8oXpZyeC+aUG1FcKzvuh1TDqIqBlRar22J/Z2kVd23lTG8Ab7itS
	 d2WnIKVzk0qRmw+MY/qItVXhHZKUa+QvDuyZ2rPUP6VMwrzrsgD6IxFLJW2BnjfnEi
	 WZEwn4iGGyZag==
Received: from [100.115.37.212] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id DF/DC-23453-231AED16;
 Wed, 12 Jan 2022 09:36:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqGu08F6
  iwe/F/BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aJR+8YC17wVCw++Y25gfEWdxcjF4eQwBNG
  ic2PZ7NDOBeYJGbNnsbYxcgJ5JxklPixIwbEZhNQl3h88zVYXERAX2Lp7D3MIDazgKpE98U1Q
  M0cHMICXhJrjoaDhFmAwus/b2cDsXkF3CWu3dzBAmJLCChITHn4HqyVU8BD4vqNmWwQq9wl3r
  UuYIGoF5Q4OfMJC8R4CYmDL14wQ/QqSZxY8ZEJwq6QeH34ElRcTeLquU3MExgFZyFpn4WkfQE
  j0ypG66SizPSMktzEzBxdQwMDXUNDU11jY11Dc0u9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3i
  ytzknBS9vNSSTYzAIE4pVty8g3Hiyp96hxglOZiURHlzeu8lCvEl5adUZiQWZ8QXleakFh9il
  OHgUJLgjZoPlBMsSk1PrUjLzAFGFExagoNHSYQ3by5Qmre4IDG3ODMdInWKUVFKnPcISJ8ASC
  KjNA+uDRbFlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80YvAJrCk5lXAjf9FdBiJqDFyRy
  3QRaXJCKkpBqYSneHFXiyLfoufKlyjdjcY3adx6ZsidaoymNpWXz99+p5fkmrvx9r2JAcbXq/
  duL3iC3OohNObN4c0vzivX5jUxqrzaWqG68+l255yDw5v3FnquyjK6dqZ18VF3T8/8xRweCx1
  u2wuWuZCh765s/3/rlkj+z9OT1J0k1C0rktBxftDy9iKFl3yf93/lZf6y9x+d5/vvh+fPb++5
  0dFkqrQ5pNNGdJ9S09J/l9UvYt1pp35d7Tis3O3cyT+rfZmltiTV3Z8q1a6n8NGtSaQrZr7Zm
  hkXb/20WJJSd4tM/xLwvcsPLNossJ5t1MT3yykh723Zw5a3Xm0raay5Nm6/w317radb1/YZJS
  sGVahEfQKSWW4oxEQy3mouJEAKEmUS9dAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1641980210!57180!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22355 invoked from network); 12 Jan 2022 09:36:50 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jan 2022 09:36:50 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D299B100199
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:36:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C4B4310018A
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:36:49 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 09:36:37 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pynacl: upgrade 1.4.0 -> 1.5.0
Date: Wed, 12 Jan 2022 17:36:22 +0800
Message-ID: <1641980182-11598-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641980182-11598-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1641980182-11598-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 09:36:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94784

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
===============================================================================
BACKWARDS INCOMPATIBLE: Removed support for Python 2.7 and Python 3.5.
BACKWARDS INCOMPATIBLE: We no longer distribute manylinux1 wheels.
Added manylinux2014, manylinux_2_24, musllinux, and macOS universal2 wheels
(the latter supports macOS arm64).
Update libsodium to 1.0.18-stable (July 25, 2021 release).
Add inline type hints.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pynacl_1.4.0.bb => python3-pynacl_1.5.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pynacl_1.4.0.bb => python3-pynacl_1.5.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
index b4a6b7af6f..10f624b484 100644
--- a/meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/pyca/pynacl"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8cc789b082b3d97e1ccc5261f8594d3f"
 
-SRC_URI[md5sum] = "8c6c57893327a694c72510fb620e4744"
-SRC_URI[sha256sum] = "54e9a2c849c742006516ad56a88f5c74bf2ce92c9f67435187c3c5953b346505"
+SRC_URI[sha256sum] = "8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08fb9220ba"
 
 PYPI_PACKAGE = "PyNaCl"
 
-- 
2.25.1


