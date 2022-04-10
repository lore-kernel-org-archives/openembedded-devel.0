Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E96C4708B
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.3819.1649837434207524644
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V30wdajI;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649837432; i=@fujitsu.com;
	bh=9vEUZ8lUuS4S/58f25pC9Qoe9Fxrj5F9G+WzAH7rDFA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=V30wdajIszUyD766N4IciFoWPAqG8qMmlk3iZO4mwo5xv0H7RO7bFqmrW9lwrraNw
	 vj6Cg3uZYJnKeAFIQz7Ca+FjzGzj3dpoAt1ahfPCA909ViL7xxlEuFCIdRjlI0mlEI
	 U8iRoEOIuAVeiP/dDwExyoRUroUJFC5GrFTZZ+/V60N05zkrdZeaCvyPwblAmLVoVG
	 ttVnNk20RHr6+qyqDcEPYMvNuSMxQNbbRXlE9S+nMO4ku+deG3VWjP26/VG1GE26K1
	 BgWwcnCE9GG29XhdN2cOskwuTkwMYWz+UghLwZtOlbLmctZYgEXC0jiQz8pAc1t3q6
	 zz39JVSYUtYkg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MRolvRGpZ
  k8Os5u8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH142X2gs2cFZMX3mBsYNzD0cXIxSEkMJtJ
  4s7aJkYIZw+jxPe+66xdjJwcbAJqEtNv3QCzRQT0JZbO3sMMYjMLqEi8+N3DDmILC7hIHGhdD
  RZnEVCVaN96Fqieg4NXwEniwxd1kLCEgILElIfvwUo4BZwlGiadYgKxhYBKFs94DzaeV0BQ4u
  TMJywQ4yUkDr54wQzRqygx+3IzC4RdITFrVhvTBEb+WUhaZiFpWcDItIrROqkoMz2jJDcxM0f
  X0MBA19DQVNfYVNfQxFIvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwKFOK
  lafuYDy96qfeIUZJDiYlUd7rNaFJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4TzaFJQkJFqWmp
  1akZeYAIwQmLcHBoyTC694AlOYtLkjMLc5Mh0idYlSUEuc1bwFKCIAkMkrz4NpgUXmJUVZKmJ
  eRgYFBiKcgtSg3swRV/hWjOAejkjBvH8gUnsy8Erjpr4AWMwEt/rYqFGRxSSJCSqqB6YT+RtF
  pf+50LOj76WVz+A7zn2OMKfU35nX5LfN459Wq8efhnw06XEr+9U9qFTevMZq49MHLSMVYcf+g
  xvrlXCo+VVFx2ju8zT1W/1aIW1xTUvIige+027Xep9s0cz7WtSUVHdue8lCs38Z7QV7q4/uli
  94tXrI8lVH0wfx5Bjl7La/suvoxUqWc8YHo9I2/dB+sFllo7dJ5ib36uJVFJO9GM6d9NSKPZZ
  +uFLnDps+yW+dUTPniqcvN1q6oE1PN/HZ5tkJF7z6ncH2pQ3rdG3cWVq2/a93oeNTzS/uijUZ
  vUy+cfCazL+4no8gS0artPyuuZ2pZH2EsWPHZvPRM+PqHt/P8PW/Pykzz2i77TomlOCPRUIu5
  qDgRANPrXYVFAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-571.messagelabs.com!1649837431!44241!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19263 invoked from network); 13 Apr 2022 08:10:32 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-19.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Apr 2022 08:10:32 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23D8AOt7018439
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:10:31 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 13 Apr 2022 09:10:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] linuxconsole: upgrade 1.7.0 -> 1.7.1
Date: Sun, 10 Apr 2022 23:06:58 +0800
Message-ID: <1649603220-12209-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649603220-12209-1-git-send-email-wangmy@fujitsu.com>
References: <1649603220-12209-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96609

Changelog:
=========
* inputattach supports the Gunze protocol
* Three missing dependencies were added in the Makefile
* An overflow in ffcfstress was fixed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{linuxconsole_1.7.0.bb => linuxconsole_1.7.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/linuxconsole/{linuxconsole_1.7.0.bb => linuxconsole_1.7.1.bb} (97%)

diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.0.bb b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
similarity index 97%
rename from meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.0.bb
rename to meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
index b706f634ed..f213b7859e 100644
--- a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.0.bb
+++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "\
     file://inputattach.service \
 "
 
-SRC_URI[sha256sum] = "95d112f06393806116341d593bda002c8bc44119c1538407623268fed90d8c34"
+SRC_URI[sha256sum] = "bd4d4b7e37da02fc67e47ddf20b6f1243c0a7af7b02b918d5e72138ea8727547"
 
 S = "${WORKDIR}/linuxconsoletools-${PV}"
 
-- 
2.25.1


