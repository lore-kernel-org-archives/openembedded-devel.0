Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web09.8530.1631784177893246016
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Sep 2021 02:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dvn0LU+O;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631784176; i=@fujitsu.com;
	bh=2hTAYFVDyehGhF936WVO9zV/W51+ICypABAs9NyhQ+c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dvn0LU+O7LnzACirQYtyBMPKVBs5WjKdrZWvTq256OnzR5pgSvd70S8HTYPxv7AV8
	 jJbevLLzJxatODhAUDx6gV1ewCr+i3/7qFOaiLJ0NoBhu5gD5oFDOLxaPo+6O1o/Jw
	 aOUvnLhxweB/nGUzsl7Y264aIDb/CxcZ4EJjkIy+nCOE9ze9RqLOY4UUpekbLWmgX4
	 IbT7XxhhPVpMABGGtF7hV6zjPkt561ox5skUOFr7AJYS3+IB7F1l+VcnQyHsEgUXad
	 tziuBfmkI4QaB1664IxS5VBYvkXcOTWUkPEgFkP5fIvXz5R7Yf0clQTId1BB4sCBO8
	 yIpqxE4LrYr4Q==
Received: from [100.113.2.26] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 97/CA-29877-FEC03416; Thu, 16 Sep 2021 09:22:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0X3P45x
  o8Pq4qsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrH+lUzBA66KGY+PMTYwPuLsYuTkEBKYzSQx
  bYp/FyMXkH2CUeLA7VXMIAk2AR2JjhfdLCC2iIC+xNLZe8DiwgI+EssuzWYFsVkEVCUWNBxmB
  7F5BdwkVqycyAhiSwgoSEx5+J4ZIi4ocXLmE7A5zAISEgdfvGCGqFGU2L7zDAuEXSHx+vAl5g
  mMPLOQtMxC0rKAkWkVo2VSUWZ6RkluYmaOrqGBga6hobGusa6hmaFeYpVuol5qqW5yal5JUSJ
  QVi+xvFivuDI3OSdFLy+1ZBMjMIxSCpkX7mD88fqD3iFGSQ4mJVHegzedEoX4kvJTKjMSizPi
  i0pzUosPMcpwcChJ8D7gck4UEixKTU+tSMvMAYY0TFqCg0dJhLcAJM1bXJCYW5yZDpE6xagoJ
  c47nxsoIQCSyCjNg2uDxdElRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8riDjeTLzSuCmvw
  JazAS0+Mh+B5DFJYkIKakGJgHn3uLcn4dztM6ZML5nMVOQvVLJtq6zOeD6gwJTNQPe2sqry18
  5iYa+77sfssF/ftAvW3apvdtmhqhFb8/PfNs56aUMx6Xwi5KG0mwbtaN0pDLqTrYoboycLavp
  3bfhUlRn/qY/SWHMTCbnpSd/OLhgr/ei+w4PElsM2z2/Rl/XYFQ6FfXqZWfln9ZigcmZdvu3P
  NBONJ9lH3k/6dUsLvkJh5Ubv3ZIbD1v9pl3im1/yT7dBdMZb8rXnn19kM9vZ9/Pzxc7z/v9an
  NYGXo6bA7re8/2V4VBaUz7NOwevmo6F+toxXn7/G57teYHUje9P145HRv67NRpjbVX+AwNt+Q
  F3dLo+vi1fuK5jRFNSizFGYmGWsxFxYkAVjJfax4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-232.messagelabs.com!1631784175!24340!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11967 invoked from network); 16 Sep 2021 09:22:55 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-19.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Sep 2021 09:22:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18G9MtZ9006264
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Sep 2021 10:22:55 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 16 Sep 2021 10:22:54 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.3.3 -> 2.3.4
Date: Fri, 17 Sep 2021 05:22:48 +0800
Message-ID: <1631827368-4496-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

2021-09-12   2.3.4:
-------------------
  * Fix `util.ba2int()` for frozenbitarrays.  A bug was introduced in 2.3.0
    as `.tobytes()` no longer treats pad bits for read-only buffers as zero.
  * add tests

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-bitarray_2.3.3.bb => python3-bitarray_2.3.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.3.3.bb => python3-bitarray_2.3.4.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.3.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.3.4.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.3.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.3.4.bb
index 17b5d931ca..5a674f0097 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.3.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "0edf630a4471a48627aec0b840cf3b8e10901191d328f6511560420459de282e"
+SRC_URI[sha256sum] = "f19c62425576d3d1821ed711b94d1a4e5ede8f05ca121e99b6d978ed49c7a765"
 
 inherit setuptools3 pypi
 
-- 
2.25.1

