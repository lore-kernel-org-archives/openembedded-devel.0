Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.24867.1629941628024800588
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Aug 2021 18:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=grQ6CAYx;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629941625; i=@fujitsu.com;
	bh=ghiUxHtkogbHYc5ULoPGw0C+8+HXXkTeqf/RyYubm8A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=grQ6CAYxi1npHRocRxsJUpMWfqMSA8oj5iyz/GHVxJ5i1ms9bJ63qWBxsGGOBjTpH
	 GE70/zRZpyF1GNE3Ah/L2M78LLkneNr8wIXKM92KwNr/BYjhBZzwiZzXm4psNis2Ra
	 61Iqt9kTpuhfOmc9p4OHtv0+JlDJbY14p8dRbMRemCt5mY76mPoHpUvjZ35661fSoi
	 BkppVFnC33ORISv29pbCQs7gpdGEbrywmgXt/GJ8kfUaq3DLaptoDKb9Pz4WaH2L56
	 +RLKzkUk8JYRZ2P11x/vfOMeOZRO4NUo/nMdAE0InbPpEKHhBqCyqzYrZ6gbNCCsvM
	 xziz0/VkeR/Hg==
Received: from [100.112.198.31] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 44/4C-27439-87FE6216; Thu, 26 Aug 2021 01:33:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxVbfivVq
  iwdNtChYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b+O0/ZCpbxVay8+pStgfE6TxcjF4eQwGwm
  if7+M4wQzglGiWUbJgM5nBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3D3sXIwSEsYC9x6
  lkNSJhFQFXi8LLDYK28Ak4Sv9YdBSuXEFCQmPLwPZjNKeAs8evMaVaQViGgmqtzoyDKBSVOzn
  zCAjFdQuLgixdQrYoSsy83s0DYFRKzZrUxTWDkn4WkZRaSlgWMTKsYzZOKMtMzSnITM3N0DQ0
  MdA0NjXQNLc10zUz0Eqt0k/RSS3XLU4tLdA31EsuL9Yorc5NzUvTyUks2MQJDMaXgiMMOxvuv
  P+gdYpTkYFIS5Z1/UC1RiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvt9dAOcGi1PTUirTMHGBcw
  KQlOHiURHhnvAVK8xYXJOYWZ6ZDpE4xKkqJ824HSQiAJDJK8+DaYLF4iVFWSpiXkYGBQYinIL
  UoN7MEVf4VozgHo5Iw7xKQKTyZeSVw018BLWYCWlzApwqyuCQRISXVwOS1nfVYnYpYp5GOZeh
  yM+5vH2vbp8aGljw+yXrzej/70w81FvdlPnw9/+Tw7Mqzf89fmMS3w1h0ZtScyiUa1RIHL3gx
  Rj526z1nF3psypq47VoebBmn9SIalnz+p2QS8tl6rm4TK4fNPeOYk4FeD89LnM62ZmNoMzVpk
  zr8h8Vk03mTg10p7XnTTiw/s76loPdxza1gtUzTJ/1aH/dovvi56WSU4YFnWW8PnQwV4RV4vs
  5FTsD7e+9Sff/jy+ZtXdW4MYXH6N6z6qZtfCaKRj+alnFMij3mHxs4O/KYZ+zRNSkfnO7IqDb
  wC25f4L2g8X9c2fafJcumT9NtOSh3I87hjhzXlwz2LXkmndtVFiqxFGckGmoxFxUnAgChnPLU
  QAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-44.tower-285.messagelabs.com!1629941624!223615!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1898 invoked from network); 26 Aug 2021 01:33:44 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-44.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Aug 2021 01:33:44 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17Q1XZj3018832
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 02:33:44 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 26 Aug 2021 02:33:40 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] doxygen: upgrade 1.9.1 -> 1.9.2
Date: Thu, 26 Aug 2021 09:33:16 +0800
Message-ID: <1629941597-62033-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1629941597-62033-1-git-send-email-wangmy@fujitsu.com>
References: <1629941597-62033-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Features
issue #2732: Adding support for C++20 concepts (Origin: bugzilla #499352)
Introducing new sidebar layout via FULL_SIDEBAR option.
Added -q commandline-parameter for quiet operation
Add config option SHOW_HEADERFILE
Add config option WARN_IF_INCOMPLETE_DOC
Add config options GENERATE_SQLITE3, SQLITE3_OUTPUT and SQLITE3_RECREATE_DB to better control the sqlite3 output.
Add config option MATHJAX_VERSION to support both MathJax 2.x and 3.x
Allow more fine tuning of semanitic syntax highlighting via CSS classes
Use language name to get code coloring
Extra settings for MathJax V3
Support vertical alignment in multirow table
Add option for an anchor to the image command
Portuguese translators updated to 1.9.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../doxygen/{doxygen_1.9.1.bb => doxygen_1.9.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.9.1.bb => doxygen_1.9.2.bb} (86%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.1.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.9.2.bb
similarity index 86%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.9.1.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.9.2.bb
index 023c8565a6..fc5df4c71f 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.1.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.9.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
            file://0001-build-don-t-look-for-Iconv.patch \
 "
 SRC_URI:append:class-native = " file://doxygen-native-only-check-python3.patch"
-SRC_URI[sha256sum] = "67aeae1be4e1565519898f46f1f7092f1973cce8a767e93101ee0111717091d1"
+SRC_URI[sha256sum] = "060f254bcef48673cc7ccf542736b7455b67c110b30fdaa33512a5b09bbecee5"
 
 inherit cmake python3native
 
-- 
2.25.1

