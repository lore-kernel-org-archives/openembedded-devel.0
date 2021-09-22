Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.7125.1632316520261032228
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 06:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=a6NOtzVx;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632316518; i=@fujitsu.com;
	bh=xv9n/4+OtXpYqatxaSolACsuEldWOxZfthm3cZ2fs80=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=a6NOtzVxr74FJbnzOuu/bAo5bM+B5rfhR99uej81szGy0FUExa2PzxaFpGnUq7lcg
	 90yMa2mef9d5T/FxT8SPR83sWOndB1yds5iRVAvhp06J5DzQcKAgN5GyVXYLzXTfB/
	 x1MJKMGgaUtV1ZFEqnngaX5L8U1hsFMdUT2rEQLj8MNoah3oSWl3L4LRRQccp+q5n1
	 nqFwb0GOGd9GD7lj5BdCUaXnim6b5OjH1E9+rrmatuetjWsy8NkpIG2t5h22Fum5Jv
	 sv6IjvVkyC0WaJ3HR6vArocWkNG4ceZJzCoLB7Adlt/wJIB6Av640B2iwuCLiAq4yK
	 w6fzfsq+Y2OAg==
Received: from [100.112.195.149] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id AA/5E-08194-66C2B416; Wed, 22 Sep 2021 13:15:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MRqpum451
  o8Hcpj8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtG//DZjwQSuinXfexgbGKdydjFycQgJzGaS
  ePfnCDuEc4JR4unP6WxdjJwcbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdA9TAwSEs4Cmx9
  m8diMkioCqx/loJSAWvgJPEmqOtLCC2hICCxJSH75kh4oISJ2c+YYGYIiFx8MULZogaRYnZl5
  uh6iskZs1qY5rAyDsLScssJC0LGJlWMZonFWWmZ5TkJmbm6BoaGOgaGhrpGlqa6hqb6CVW6Sb
  qpZbqlqcWl+ga6iWWF+sVV+Ym56To5aWWbGIEhlZKwWGlHYzvXn/QO8QoycGkJMordMUrUYgv
  KT+lMiOxOCO+qDQntfgQowwHh5IEr4e2d6KQYFFqempFWmYOMMxh0hIcPEoivIIgad7igsTc4
  sx0iNQpRkUpcd4IkIQASCKjNA+uDRZblxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80qBTO
  HJzCuBm/4KaDET0GL+lR4gi0sSEVJSDUzndHlyWV6uSDFiT5ow9SuzaS+3uLrrq+sHWmLm/D9
  zuqQ/I6Ux72rKo5Dses+ZReczWvg/5FiEOWRKVH8SPMlr8/bIp38KNsdNNDluKXHwsZzaX781
  L89iTc3h3hWz3Zl8ym7fuffnhj/n2s2LJknruLDGRebaZnEve7fWIO1Mv8Vxrcl/Qg4ysxhy7
  2jfVf9khe71NpdCzbkntQ///i2RffzFPe/7diu2T0+KfJ334f7Rk4aPJvj5fGJo0cz/uXVB4v
  4VFh6RH2MObHv2sGhu16VnIdKHIlY2TRNtUSv9o/45762H0/MnSxb/CMpW+nTX0b1JfcejQze
  uKKl4xru3hpw8/foQ47Rv1qvq9T2VWIozEg21mIuKEwFz0u6fKAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-265.messagelabs.com!1632316517!41533!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2740 invoked from network); 22 Sep 2021 13:15:18 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-16.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Sep 2021 13:15:18 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18MDFHFG019974
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 14:15:17 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 22 Sep 2021 14:15:16 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nghttp2: upgrade 1.44.0 -> 1.45.1
Date: Wed, 22 Sep 2021 21:14:59 +0800
Message-ID: <1632316500-58276-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

build: Fix compile error with libressl
build: Always include optional files to EXTRA_DIST
build: Add missing cmake files to EXTRA_DIST

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nghttp2/{nghttp2_1.44.0.bb => nghttp2_1.45.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nghttp2/{nghttp2_1.44.0.bb => nghttp2_1.45.1.bb} (93%)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.44.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.45.1.bb
similarity index 93%
rename from meta-networking/recipes-support/nghttp2/nghttp2_1.44.0.bb
rename to meta-networking/recipes-support/nghttp2/nghttp2_1.45.1.bb
index 6e133ec203..e4a17cbdd6 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.44.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.45.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "5699473b29941e8dafed10de5c8cb37a3581edf62ba7d04b911ca247d4de3c5d"
+SRC_URI[sha256sum] = "abdc4addccadbc7d89abe27c4d6427d78e57d139f69c1f45749227393c68bf79"
 
 inherit cmake manpages python3native
 PACKAGECONFIG[manpages] = ""
-- 
2.25.1

