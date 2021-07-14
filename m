Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.4475.1626255301232817051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jul 2021 02:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uMO2rwV0;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626255299; i=@fujitsu.com;
	bh=c+HNeqJhKqZgDZJrioo5/OHjfIbJUkdaxdMaj1OHbyU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uMO2rwV0sTvj6EKlvbmxUC8pPCqQUOxSrP43Oo5u/DJ5CGDXkCeRGzz+5qr9+ihYv
	 9lFQ/9V2ZLW23ZO6uvYF1D3YyvTPjwhUcW+JSIItIxVuvBZNC3srUGfmoAxhecHsvw
	 a5c1i0o0f5Y7E5w9XgL/0WaIW6kF22UK9BWXouea7uCXS/W4A0HHRsfwRk9Swfo0xK
	 kgLkDdSxzDjqwJlyXFGX4kBbhjZu/atUFMlSX24azUTM+72LJKgyu+O3y+PXsRvyXJ
	 lmaTayj85PC0C+lyd0zKSuyTnfUOK14Z6Dg598duvIFxRD3VXKlqCVlNOmCU+2zBu6
	 oG4O7OHPKyOGA==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id A5/BE-03155-3CFAEE06; Wed, 14 Jul 2021 09:34:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqnto/bs
  Eg/6rBhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bnPU1sBRd4Ku7u/MjSwLiCu4uRi0NIYBuT
  RPeJc+wQzklGiSmbDgI5nBxsAjoSHS+6WUBsEQF9iaWz9zCD2MICgRKzdjazgtgsAqoSR+8/B
  7N5Bdwkfsy8zQhiSwgoSEx5+J4ZIi4ocXLmE7A5zAISEgdfvGCGqFGU2L7zDAuEXSmxZ1Y/0w
  RGnllIWmYhaVnAyLSK0TypKDM9oyQ3MTNH19DAQNfQ0EjX0NJS19BCL7FKN0kvtVS3PLW4RNd
  QL7G8WK+4Mjc5J0UvL7VkEyMwjFIKjgvtYHzz+oPeIUZJDiYlUd4bPm8ThPiS8lMqMxKLM+KL
  SnNSiw8xynBwKEnwXlv3LkFIsCg1PbUiLTMHGNIwaQkOHiURXve1QGne4oLE3OLMdIjUKUZFK
  XFeb5A+AZBERmkeXBssji4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuY9CzKeJzOvBG76K6
  DFTECLtde8BVlckoiQkmpgKpj15/Ong0eOvX6g2f287/Ialp/7zi5apPjQZwnfLfO7CuZzPu/
  Y03BEzF1x1qW9lzeGx/a7C7mpq//g/ZG/qCzqRcfzXy/8XkfetY6bU73viI0jV+UjNeX5fv/d
  /uhceCJ5bsce57qqv7+NDA86rHDic39+s0bAvjSJvWvxsvXTJge5XG5fdbk6/COTCY+ovedWd
  Y0Icwn1mIyLZWFs4krb4i6cXpY2M8NLmr3N9847sRyf4M3lz99OjtbZtTmguDL2TvVC6bdSM9
  M0jx/YXiDCxK0oYP12ctKDTDYpbwspwxlfNfyuyOzdccdY5bNemb3Ae93fPG+n198XE0nrn20
  fXSa4YdUaKzV7/nnflViKMxINtZiLihMBkSkvCh4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-291.messagelabs.com!1626255298!9820!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5795 invoked from network); 14 Jul 2021 09:34:58 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-19.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Jul 2021 09:34:58 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16E9YwBo020112
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jul 2021 10:34:58 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 14 Jul 2021 10:34:56 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-gnupg: upgrade 0.4.6 -> 0.4.7
Date: Thu, 15 Jul 2021 05:34:50 +0800
Message-ID: <1626298490-4721-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Released: 2021-03-11

Fixed #129, #141: Added support for no passphrase during key generation.
Fixed #143: Improved permission-denied test. Thanks to Elliot Cameron for the patch.
Fixed #144: Updated logging to only show partial results.
Fixed #146: Allowed a passphrase to be passed to import_keys(). Thanks to Chris de Graaf for the patch.

Add runtime dependency to resolve errors that occurred when import gnupg.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-gnupg_0.4.6.bb => python3-gnupg_0.4.7.bb}     | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gnupg_0.4.6.bb => python3-gnupg_0.4.7.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.4.7.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb
rename to meta-python/recipes-devtools/python/python3-gnupg_0.4.7.bb
index ff0a91c6f6..cc441af0b8 100644
--- a/meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.4.7.bb
@@ -4,8 +4,11 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b0b7ac63b60085b23fa9f7e1951daa1d"
 
 PYPI_PACKAGE = "python-gnupg"
-SRC_URI[sha256sum] = "3aa0884b3bd414652c2385b9df39e7b87272c2eca1b8fcc3089bc9e58652019a"
+SRC_URI[sha256sum] = "2061f56b1942c29b92727bf9aecbd3cea3893acc9cccbdc7eb4604285efe4ac7"
 
 inherit pypi setuptools3
 
-RDEPENDS_${PN} +=  "gnupg-gpg"
+RDEPENDS_${PN} +=  " \
+	gnupg-gpg \
+	python3-logging \
+"
-- 
2.25.1

