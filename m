Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.3150.1627006245565157720
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jul 2021 19:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=h1sE27AK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627006243; i=@fujitsu.com;
	bh=qqs1HwMatcvSmfVXH4dCon+p3D0XV90IIUXVWqY7+xk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=h1sE27AKU3k0VPq6z58jBBFZOtK6kNFMANXqq4xwmQItEWWCnP41Dlb16RjHVXaKO
	 5B3KPNCQpTnNd3iCSPO6sO+h3+Mvy5QoPMAKB4rvxm4FTHhE23IDW/QcPwFCjW2SQW
	 lRQdh0LEn8EhZR0az4hcA6T+lU1DoUo2Pu8VQDj07m4kDeQ0b4qI+r3iZw6jB1ksTg
	 sA5rN+uETvh3g+p988CUpfl/Upi5okDXdMCRILPRKpYiAwHj6bm5YJaJm3o5/yOu9V
	 UQo/S4R7Qz6LENiL6+osyxGoUqVhvMr/7mveAtsOL3p9SqMRBL543dZ9jX40/TVct0
	 M1ZvFVqUZPVAA==
Received: from [100.113.6.189] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 62/80-03281-2252AF06; Fri, 23 Jul 2021 02:10:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxVVdJ9Ve
  CweLf0hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0b726+sBTe5Kk53f2RuYLzN2cXIxSEkMJtJ
  4u7zQ+wQzglGid3z77F0MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3DzuILSzgLvFjz
  16geg4OFgFVia09fCBhXgFHidU/34O1SggoSEx5+B6slVPASeLt9/tMILYQUE3Ti61MEPWCEi
  dnPmGBGC8hcfDFC2aIXkWJ2ZebWSDsConXhy8xT2Dkn4WkZRaSlgWMTKsYLZOKMtMzSnITM3N
  0DQ0MdA0NjXVNdY1MDPUSq3ST9FJLdZNT80qKEoGyeonlxXrFlbnJOSl6eaklmxiBAZlSyPpx
  B+Oh1x/0DjFKcjApifJKHf6ZIMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd4XMrwQhwaLU9NSKt
  MwcYHTApCU4eJREeEslgNK8xQWJucWZ6RCpU4yKUuK8kspACQGQREZpHlwbLCIvMcpKCfMyMj
  AwCPEUpBblZpagyr9iFOdgVBLmNQGZwpOZVwI3/RXQYiagxae6foIsLklESEk1MK16U2aRkjv
  7me8Juw9X5ieFFBkoFExT/e9h1Fvmz/iTqfvzVgeGZW+jpc8v+3VTzDb3uWn4ooPnMn9+Zv1X
  wuItOqU2PGWJRL+qmufuxYqxX/SfuR7RFTm84XjEjrXicx7cyncKmvXsRojc3tzmsOcir5TPF
  8uqFc1Zdsr1EuuN15Pij1j+k60SDtggL/15pkG0RubM6U9CljHceXvy48evG/gSJPzbDhZMuM
  W4g4VvgyDvrv+8uauecQmwsE1MOmM6ZZnENq3lff/0I+12BdbzsuR7xBlobdD3OMnyJ3mKt9n
  0X1evh1v/XMZaWeK06uXlmwb/LJc9tWNwOPLoes43Vd6YN0HiBTMennC3nq/EUpyRaKjFXFSc
  CAAaCAneQwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-248.messagelabs.com!1627006241!86574!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32495 invoked from network); 23 Jul 2021 02:10:42 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-5.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jul 2021 02:10:42 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16N2AWF6013755
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jul 2021 03:10:41 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 23 Jul 2021 03:10:38 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libnet-dns-perl: upgrade 1.31 -> 1.32
Date: Fri, 23 Jul 2021 10:10:19 +0800
Message-ID: <1627006219-7443-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1627006219-7443-1-git-send-email-wangmy@fujitsu.com>
References: <1627006219-7443-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

**** 1.32 Jul 16, 2021

	Text: Offer both Unicode and escaped-ASCII strings.

	Add LICENSE file to comply with Fedora/RedHat announcement.

Fix rt.cpan.org #136666

	Net::DNS::RR::ZoneFile parser erroneously strips line
	terminators in quoted string forming part of multiline RR.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.31.bb => libnet-dns-perl_1.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.31.bb => libnet-dns-perl_1.32.bb} (95%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.31.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.32.bb
similarity index 95%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.31.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.32.bb
index c806456192..f9fa50603f 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.31.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.32.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "00024a8e371605c6d8422a27a0a87af8b7cf66f26502102e68ddd4baf7cfc615"
+SRC_URI[sha256sum] = "b890a7b44d573f27cc713caadf1e12eaaa4478a6504d1157194df614316b5b50"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1

