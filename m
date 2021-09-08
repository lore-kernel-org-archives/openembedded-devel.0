Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.5391.1631181451401348616
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 02:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=pDAMbu1d;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631181449; i=@fujitsu.com;
	bh=7AbvxtDhPFRjyM07zVOrO5JhKjx2Te68CCmogXwPTnw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=pDAMbu1dPqj+Yxyp1XNpqKZX2XzBru4cSmejd8p4zuZf0yuZQgqJLQhqVBdw80BKz
	 uwVyUoYXTLv7rc/pzy7xtMO+kXIiVA0l4S3IY99U0vgsHGH2r4SLvBKfLZP/3l612E
	 g9ArkUEu5pT1l7dO6RWEnwIDppO2Ko5BHKXHKAZR08SyNapvWeV+yp3EZ5/uAYhCu9
	 ew/F1vrTIeMz6us7+UHGvt4Lpw6PxF/i42NVeBC0mCUJsY8vocNgBbEN8ygzIgUljJ
	 nQ4nEDnTc9E8gi16B41AJly5NCnpVym1WTzfmcLAuKdidMOnDwmGMJsU2oEXgL5Da3
	 h4IOIKdsKpzFg==
Received: from [100.112.196.248] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 0F/25-30018-98AD9316; Thu, 09 Sep 2021 09:57:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRWlGSWpSXmKPExsViZ8MxRbfzlmW
  iweF1ghYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a0VRuZCpbxVjz9cpKtgXEZdxcjJ4eQwCwm
  iSeHFLsYuYDs3YwSxy+/ZQFJsAnoSpx7vJYdxBYR0JdYOnsPcxcjB4ewgIPEsuk1IGEWARWJ1
  RcugZXzCnhKrJ7UCVYuIaAgMeXhe2aIuKDEyZlPwGqYBVQluo88ZYKw5SWat84GGykhoCgxe7
  o8RGuFxOvDl5gnMPLOQtI9C0n3LCTdCxiZVzFaJBVlpmeU5CZm5ugaGhjoGhoa6RpaWugaGZr
  qJVbpJumlluqWpxaX6BrqJZYX6xVX5ibnpOjlpZZsYgSGXErBses7GK++/qB3iFGSg0lJlNfs
  pmWiEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnehOtAOcGi1PTUirTMHGD4w6QlOHiURHjVQNK8x
  QWJucWZ6RCpU4yKUuK8liAzBUASGaV5cG2wmLvEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZ
  j3MMgUnsy8Erjpr4AWMwEt9r1mAbK4JBEhJdXApKTTc+44d9Wx7R6Zrm5TzS5LzZC78/NS8qx
  Sg3slN7m6972d06d85zDf/V+LambLfWyeUXp8/xn5DrH9ncpdR6UUG7TnvqvT/cGcl+8q+aZd
  OaArY+rt6oNF95K7GIWvJ96+OPP8lE7tlTFSn/s89/3kEmtPnrFt3R6GuOyC20t/CpRs8f38S
  UDonblnTO+s3skThEoYdm6+Fay/hn/pnV2d5iZuutkzNn0xiL4Xe2HCAwbH+C+T2yaZePTfSp
  6uF7csVdVgZvI0Yd5iRXGVxu/qkuzJaQaxRqV9ZVFqHhm+Tap7j7Cd5+3MWiPTl6kYvvijQlt
  o0M79XmZHOjfPKTKpajCZ1Ru6uOLQEU8lluKMREMt5qLiRADd3NChNAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-287.messagelabs.com!1631181448!77345!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31710 invoked from network); 9 Sep 2021 09:57:29 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-8.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Sep 2021 09:57:29 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1899vScT011146
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Sep 2021 10:57:28 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 9 Sep 2021 10:57:27 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libeigen: upgrade 3.3.9 -> 3.4.0
Date: Wed, 8 Sep 2021 15:07:58 +0800
Message-ID: <1631084878-101207-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

-License-Update: Delete empty lines.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libeigen/{libeigen_3.3.9.bb =3D> libeigen_3.4.0.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libeigen/{libeigen_3.3.9.bb =3D> libeigen_3.4.0.bb} (80%)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
similarity index 80%
rename from meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
rename to meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
index 8ce26ff632..54b6f74d8c 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
@@ -3,15 +3,15 @@ AUTHOR =3D "Beno=C3=AEt Jacob and Ga=C3=ABl Guennebaud and others"
 HOMEPAGE =3D "http://eigen.tuxfamily.org/"
 LICENSE =3D "MPL-2.0 & Apache-2.0 & BSD-3-Clause & GPLv3 & LGPLv2.1 & MINPACK"
 LIC_FILES_CHKSUM =3D "file://COPYING.MPL2;md5=3D815ca599c9df247a0c7f619bab123dad \
-                    file://COPYING.BSD;md5=3D543367b8e11f07d353ef894f71b574a0 \
+                    file://COPYING.BSD;md5=3D2dd0510ee95e59ca28834b875bc96596 \
                     file://COPYING.GPL;md5=3Dd32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LGPL;md5=3D4fbd65380cdd255951079008b364516c \
-                    file://COPYING.MINPACK;md5=3D5fe4603e80ef7390306f51ef74449bbd \
+                    file://COPYING.MINPACK;md5=3D71d91b0f75ce79a75d3108a72bef8116 \
 "
 
 SRC_URI =3D "git://gitlab.com/libeigen/eigen.git;protocol=3Dhttp;nobranch=3D1"
 
-SRCREV =3D "0fd6b4f71dd85b2009ee4d1aeb296e2c11fc9d68"
+SRCREV =3D "3147391d946bb4b6c68edd901f2add6ac1f31f8c"
 
 S =3D "${WORKDIR}/git"
 
-- 
2.25.1

