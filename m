Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.17067.1630894345674248696
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 19:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rXnmA+Aa;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630894343; i=@fujitsu.com;
	bh=oSrkZUenFu7TU4enGvnAmHUR6HR8cpNjdvDx+mY2bMk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rXnmA+AaHWK1toEy3QXyzb/IwLVdB64FIdL93UYtgy2Hr19vXynuaTx9f8VdJj+d6
	 nE+RnV1g74LbGo4zwplW3n7pAM+Gkydau/ktAUn5/YFjO+88LHbQoe3qtSXYeSNxw0
	 UcOcfnESGmp1H9gsdj/0WeOUbzJ8I4uiGOyK0cMtTKbdFGMKH1GvhSb9t4vfP+i0ub
	 YLH8sEkN2n1Sdz2H1iGqJZXuQsfGC2lOmkkbVpAgIY9zzjx+taJqPIBb7y9xvFSL8+
	 PvQ4ByCwUsRislUitL7lPS7ZduEEUXuJaSeccksFMg+P/yCeSH51yK5mIb+PRLOCUN
	 MO+fmTT1ZhmKQ==
Received: from [100.113.3.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 66/4C-24763-60975316; Mon, 06 Sep 2021 02:12:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MxVZet0jT
  RYMNsCYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP7BraCqYIVpydcY2xg3MPfxcjFISQwi0mi
  fd4adghnN6PEiZ2nWLoYOTnYBHQlzj1eyw5iiwjoSyydvYcZxBYWcJHo33aNCcRmEVCR6Ot7w
  wpi8wp4SOzc2cEIYksIKEhMefieGSIuKHFy5hOwmcwCEhIHX7wAinMA1ShKzJ4uD1FeIfH68C
  XmCYw8s5B0zELSsYCRaRWjRVJRZnpGSW5iZo6uoYGBrqGhsa6hrqmhXmKVbqJeaqlucmpeSVE
  iUFIvsbxYr7gyNzknRS8vtWQTIzCIUgoZjXcwHnz9Qe8QoyQHk5Ior4adaaIQX1J+SmVGYnFG
  fFFpTmrxIUYZDg4lCd4D5UA5waLU9NSKtMwcYEDDpCU4eJREeK+UAaV5iwsSc4sz0yFSpxjDO
  d6sXbKImeMtmGy7dxdItoPJmQsOrmbmmAUm77cfApIPQKQQS15+XqqUOO8rkG0CIOMySvPgls
  Ei9hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd6zIFN4MvNK4G56BXQuE9C5bQ9NQM4tSUR
  ISTUweTAozBT+taG0eKeSYX2h7PU8rnCRtrKt3ySbi8yr4mauqZm5g/Wbg3kq9yId23/zbut+
  3FFwTj+67d111oa9Z1z68xo8PgiYbP2zeanGI9EbTb9VBYu+K3YyP99utKH7h132Mb0z16dMZ
  5rec//wpe9Vtzts7WplrhrH6wqezDQ8nT8zLJ2t9vTXoFd3Sv856u94tWOFU+xrr/NTK9j+zO
  ZTLXioyz41PrxWZmNrtrDaUbXNO7+4hcRY8H33s+25LPbt/dvw6viens5JRyfGnLEsSbT1WN/
  myD7n+RrO8qDHsfUfOcp3+c58HFa3xPWUePZbe+FbFZ3lEQfbXiVcyQ7RMr61nl1/5RJd5Vgl
  luKMREMt5qLiRAAZVsUZUwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-226.messagelabs.com!1630894342!196294!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9059 invoked from network); 6 Sep 2021 02:12:22 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-5.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 02:12:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1862CMkY001457
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 03:12:22 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 03:12:20 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] unclutter-xfixes: upgrade 1.5 -> 1.6
Date: Sun, 5 Sep 2021 07:22:50 +0800
Message-ID: <1630797770-44221-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

This release contains the following changes:

[Feature] --start-hidden to hide the cursor initially when unclutter-xfixes starts.
[Feature] --ignore-buttons to specify one or more buttons which do not unhide the cursor.
[Feature] --hide-on-touch to hide the cursor on touch input.
[Fix] --timeout now supports non-integer values.
Various improvements to the man page.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../unclutter-xfixes/0001-build-use-autotools.patch             | 2 +-
 .../{unclutter-xfixes_1.5.bb => unclutter-xfixes_1.6.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/unclutter-xfixes/{unclutter-xfixes_1.5.bb => unclutter-xfixes_1.6.bb} (92%)

diff --git a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes/0001-build-use-autotools.patch b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes/0001-build-use-autotools.patch
index 25771168ce..0c9fe62b1f 100644
--- a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes/0001-build-use-autotools.patch
+++ b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes/0001-build-use-autotools.patch
@@ -60,7 +60,7 @@ index 6264da0..0000000
 +++ /dev/null
 @@ -1,66 +0,0 @@
 -TARGET = unclutter
--VERSION = 1.5
+-VERSION = 1.6
 -SDIR = src
 -IDIR = include
 -ODIR = obj
diff --git a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.5.bb b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
similarity index 92%
rename from meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.5.bb
rename to meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
index e56803e4ea..8a6b6f8142 100644
--- a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.5.bb
+++ b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b25d2c4cca175f44120d1b8e67cb358d"
 
 SRC_URI = "git://github.com/Airblader/unclutter-xfixes.git \
            file://0001-build-use-autotools.patch"
-SRCREV = "10fd337bb77e4e93c3380f630a0555372778a948"
+SRCREV = "160ae3760a51126eb225ce77d83e4706eccd4ed9"
 
 inherit autotools pkgconfig features_check
 
-- 
2.25.1

