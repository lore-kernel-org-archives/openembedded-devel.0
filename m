Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.8360.1629854172739227862
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 18:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LIsRX4wD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629854170; i=@fujitsu.com;
	bh=enk1nQev4ktz+fG3aYFdQlIpweva4QUHR8bXSb+4PVw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LIsRX4wDbHieQRb1rvwgHHcPiWXiXaJkgR72a6bt2Y7CBvQp7j6RBjc3ATzJFvwru
	 r7HqI/MKPN6XvXiKuqGEpTTUMqEr2Dzgj/cxNfANYInuRkaZRcAtkzkBsUlX6Thnne
	 vzTYUVl5L58sKOSjCdLaCQCmJ2sSlwq0nLvgiShddxzR3aQhXc6tBT/cmZmWEjw5IZ
	 kMsq8LgZj34kAx/LzPIWbTxLLgffq5dLrrwjJ/orspt9O8mQdCdEm0rIJ1VZtCx+oy
	 a5EPxoeJLZyjvH/yZ3Yv+kT8DvfYqyBQ2uTGE8jk43IVSAWVvgQ2GgfnKbCH9oAFfS
	 T9NIVSq1P79KQ==
Received: from [100.112.192.29] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 1B/EC-25315-AD995216; Wed, 25 Aug 2021 01:16:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYqntzpmq
  iwdpdBhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bftwfsBXe4Kj4v3cXcwHiRs4uRi0NIYDaT
  xJdFb5ggnBOMEh3HNrF2MXJysAnoSHS86GYBsUUE9CWWzt7DDGILC/hLtP9YBBZnEVCVWHxxD
  1g9r4CbxJz/nUwgtoSAgsSUh++ZIeKCEidnPgGrZxaQkDj44gUzRI2ixPadZ1gg7AqJ14cvMU
  9g5JmFpGUWkpYFjEyrGC2SijLTM0pyEzNzdA0NDHQNDY10DS2B2MREL7FKN1EvtVS3PLW4RNd
  QL7G8WK+4Mjc5J0UvL7VkEyMwkFIKDkzYwbj/9Qe9Q4ySHExKoryXtVQThfiS8lMqMxKLM+KL
  SnNSiw8xynBwKEnwfpkOlBMsSk1PrUjLzAEGNUxagoNHSYQ3GiTNW1yQmFucmQ6ROsWoKCXO6
  zMDKCEAksgozYNrg0XSJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvNNApvBk5pXATX8FtJ
  gJaHEBH9jikkSElFQDE0/T/tPS9juqzm08ISXT51x1WXuC9cmZIc84fwlWn+K1tdBiibi325Z
  hmujndx4To44fa7/4+1Dr0ZVbhco0tgaZWwfFPFuVeXDK/BWf7kzrZ+ReVDBFyjPiuvDdd1vf
  RghrrS24lMw1h2mDdN++rZHNZxacu7sz93LuIVmW3uf7eSRW/Fbna5eOOyHa8V9rmeNOgVn5D
  Ftn/i285hD5ffu2WZEHWVr0VCNb/7Nciywol058c2Cp9qN+neK2ZlalIMfcb9IPQhYzzf6zn3
  fZ/lSNaa6VDWcuHDs4a/E2lWebKg/VLd2gdJy7TNLG5/t+4x3f5G0cZ+yXa06eJZ/otvXS+QT
  D3nXSG+LDBI6Y7lBiKc5INNRiLipOBABpze3kHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-29.tower-267.messagelabs.com!1629854169!85329!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2467 invoked from network); 25 Aug 2021 01:16:09 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-29.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 25 Aug 2021 01:16:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17P1G47w016816
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Aug 2021 02:16:09 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 25 Aug 2021 02:16:02 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libio-socket-ssl-perl: upgrade 2.071 -> 2.072
Date: Wed, 25 Aug 2021 09:15:55 +0800
Message-ID: <1629854155-7095-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

2.072
- add PEM_certs2file and PEM_file2certs in IO::Socket::SSL::Utils based
  on idea by rovo89 in #101
- certs/*.p12 used for testing should now work with OpenSSL 3.0 too #108
- update public suffix database

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...-socket-ssl-perl_2.071.bb => libio-socket-ssl-perl_2.072.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.071.bb => libio-socket-ssl-perl_2.072.bb} (94%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.071.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.072.bb
similarity index 94%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.071.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.072.bb
index 4ab5531ce6..d49b2cd5eb 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.071.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.072.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "\
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "40da40948ecc9c787ed39c95715872679eebfd54243721174993a2003e32ab0a"
+SRC_URI[sha256sum] = "b5bee81db3905a9069340a450a48e1e1b32dec4ede0064f5703bafb9a707b89d"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.25.1

