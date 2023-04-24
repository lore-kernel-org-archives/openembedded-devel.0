Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02720C77B60
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:22:09 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.42793.1682306519297551341
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KkhMLdFz;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306517; i=@fujitsu.com;
	bh=nQi+2bEczc5jrU0M4iqVAXPurn5ev/3/fV78zkl5mvI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KkhMLdFzs1kIrw5sS/sgvKmJjV434RRjF6s2LugwrfOMxHk+RNKOovOLgeGAjBAW6
	 ya6ayIrTy6p0QleskrmX9M7saYY0DZJ+heLn8DtAHWyvxc8KnstDyW4FCLDwCfDvQE
	 p2g9/bAeDJH64hLcXiO+XI0Pc3bB7NYZbw3j3isijFyMVMiIFLf85h3MIGIk9J2Zvg
	 DMpjjBfE5OcF3ehXKANl3HZLzxdAa/K9vn2lfnTPXS1OWHErQl7ms+MxG8O1smLtdw
	 CSf6lHIZYT36xkn1UQxipfA3g+1DU1aio98Gcj1oQKLzLl7UHXlR3PrrkifyIWRvSe
	 q1szOc9gcgPmg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpHvlq2u
  Kwca7LBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bJN4/YCq7zVsze/5y9gfESTxcjF4eQwENG
  ievdB1ggnKtMEh+/b2WGcPYySvy8tAPI4eRgE5CSuHH/PxuILSKgL7F09h6wOLOAisSL3z3sI
  LawQLDEg47ZQJM4OFgEVCUWT7cACfMKOEmc3zELrFVCQEFiysP3YK2cAs4S71YeZwSxhYBqXs
  w4zAxRLyhxcuYTFojxEhIHX7xghuhVlJh9uZkFwq6UaP3wC8pWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRrDi1qCy1SNdSL6koMz2jJDcxM0cvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMHhTilNn72BcvOuv3iFGSQ4mJVHeJRtcUoT4kvJTKjMSizPii0pzUosPMcpwcChJ8
  BZ9ck0REixKTU+tSMvMAUYSTFqCg0dJhHfZF6A0b3FBYm5xZjpE6hSjopQ4byBIQgAkkVGaB9
  cGi95LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5JT8ATeHJzCuBm/4KaDET0OJd3C4gi0s
  SEVJSDUwdpv2c5w+wRCw/zPMs2OrmP4ULx7XXMQdMP5K+Wq5EsVxs3jYB9aU/NY6L2uTGSAcw
  SAo9P/pjYVb+sddndU7WrQq6WS0bf1py/eJ5mzZ89/yxZF7y7XuHv+44E2L2iuu3hITn01dXB
  CV5jvy3mPUjP/Yq61nh9p4r/3Qmt959wfD0JqeW2Ymk31u8X5ZPYLYs15Ls6J4l77A4c+cHuZ
  LM6drdKjEdx3tmnqmOD2PVmna6oz1e2Wl1dtKXlMRNAcXNIb5Xlx+uq5jt8G6prH78lbWzLhf
  dfhF+80eu2ZV5HgL7eDbErMyaVPwi6PjrgErZOQria7+6L85jlraQDNN7dSjS3U2wvX3pyYza
  1QuUWIozEg21mIuKEwHMBIWIWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-728.messagelabs.com!1682306515!288652!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23537 invoked from network); 24 Apr 2023 03:21:56 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:21:56 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 84F041AF
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:21:55 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 791481AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:21:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:21:54 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libmodule-build-tiny-perl: upgrade 0.039 -> 0.043
Date: Mon, 24 Apr 2023 11:21:27 +0800
Message-ID: <1682306487-11783-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306487-11783-1-git-send-email-wangmy@fujitsu.com>
References: <1682306487-11783-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:22:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102158

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 - Fix manification test for perls without man paths

License-Update: remove whitespace of end of the line.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tiny-perl_0.039.bb => libmodule-build-tiny-perl_0.043.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libmodule/{libmodule-build-tiny-perl_0.039.bb => libmodule-build-tiny-perl_0.043.bb} (90%)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.043.bb
similarity index 90%
rename from meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb
rename to meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.043.bb
index ff3f4d694..dd60d01db 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.043.bb
@@ -10,13 +10,12 @@ SECTION = "libs"
 HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=57b8100f0b648cd37fbc3725fe3c111a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6374136f6774db2f51cc116f5efbf705"
 
 DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
-SRC_URI[md5sum] = "2332c90c17454107fea3f2614e11a3a9"
-SRC_URI[sha256sum] = "7d580ff6ace0cbe555bf36b86dc8ea232581530cbeaaea09bccb57b55797f11c"
+SRC_URI[sha256sum] = "68f4e4620e8a75124ce2dadee48d2ba5160b9167012924588d6fb242ff2d7206"
 
 S = "${WORKDIR}/Module-Build-Tiny-${PV}"
 
-- 
2.34.1


