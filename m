Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405DFC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 00:05:14 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web09.5323.1644969912766563394
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 16:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Awu+/aLF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644969910; i=@fujitsu.com;
	bh=kMIpPO7Maab2AqxEmhVj2h4BN4A60r6MSruHDH5UCPU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Awu+/aLFZjuph5vJ5wq8wmGPr8xlRRLMiIMVhgDaDuDSyReA5G8sdlBYiINtfXRlD
	 mmlI7jUaJm0g4oFw2cLVTn28QSYCG355UibfxtXCSR9VBEvI+jYaBn0Wznem/Coj5a
	 j7ZPP8+uPYGlhngQbGERibGazEftfJOXsS7CMvm5tdaoUGsLAtxxlyoZ335u6oS+S6
	 R/Z74R44JCA2rNNtalKO32kvnsiH0GzYdNohgbFdehYVF8gWzYkELe9gtp4d5QRgnq
	 Oyk74SFhqjPdrmJf+/eslL1TMKCeR3QC3FNKzdHb9WgUV5ql9kmiZ50IvxqKVWcle5
	 Yr228V8cmenMQ==
Received: from [100.115.7.114] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 82/1E-12986-6BF3C026;
 Wed, 16 Feb 2022 00:05:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRorvVnif
  J4OV8a4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP0n4CCy/wVvy4+Zmtg3MjbxcjFISQwk0ni
  +5mnzBDOCUaJ9/29TF2MnBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DDmILCzhI3Lq4A
  sjm4GARUJWYud8OJMwr4CgxfeM+sDESAgoSUx6+B2vlFHCSOH/iB1irEFDNyq0LmCDqBSVOzn
  zCAjFeQuLgixfMEL2KErMvN7NA2BUSs2a1MU1g5J+FpGUWkpYFjEyrGK2SijLTM0pyEzNzdA0
  NDHQNDU11jXUNLS31Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L08lJLNjECAzKlmPn4
  DsYpfT/1DjFKcjApifK23eBOEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBy2/DkyQkWJSanlqRl
  pkDjA6YtAQHj5II7ztLoDRvcUFibnFmOkTqFKOilDivnx1QQgAkkVGaB9cGi8hLjLJSwryMDA
  wMQjwFqUW5mSWo8q8YxTkYlYR502yBpvBk5pXATX8FtJgJaLFiIxfI4pJEhJRUAxNzqEqCp97
  xh9JBO0LOBCpN0dX+pFKySPlNsXmvluxC9rWxnw4uSjapO/o6jfWNIOvEN/UWs6yjhJascTi7
  tFC+Zpa+huravHc3f8h/ONmcwHVepeb80xW1v3h/XFwdoRT2/PJOreoHziZVR5+X3vx2JkDhQ
  d2+bS01m3IOsR+afPFUz+KD2++FcxvNY6wUC0/2j1izXlnlmuOcxvenWjwiZF23bfWYtTpeMq
  hhwue5qQFn7E3m3Xqzti5sakeAhsaRvT9tPEUzTqsWZHyQLuXQEb5766LHsf9b7qw35Xn+zuP
  4tbxJ/hO4W7zF5N/euNKVa6TpelN931Y5i0Xi6YHxm1Snb54nwHlYLeqkQ4oSS3FGoqEWc1Fx
  IgDq2rxIQwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1644969909!14182!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3056 invoked from network); 16 Feb 2022 00:05:09 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Feb 2022 00:05:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21G053qZ019255
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 00:05:09 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Feb 2022 00:05:06 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libqmi: upgrade 1.30.2 -> 1.30.4
Date: Wed, 16 Feb 2022 08:04:50 +0800
Message-ID: <1644969891-7677-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644969891-7677-1-git-send-email-wangmy@fujitsu.com>
References: <1644969891-7677-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 00:05:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95324

Changelog:
=========
* Build:
   ** meson: switch to use the new python module in meson.
   ** meson: added a new boolean 'man' option in the meson setup to explicitly
      enable or disable building the man pages.
   ** meson: removed the option to detect if rmnet is supported.
   ** meson: multiple updates to use newer meson features like install_dir(),
      install_mode() or summary().
   ** meson: options 'mbim_qmux' and 'qrtr' are enabled by default and must be
      explicitly disabled if they're not needed, there is no attempt to
      autodetect whether they can be enabled or not.

 * qmi-proxy:
   ** Remove assert when attempting to close ghost device.

 * qmi-firmware-update:
   ** Use defaults if FLASH variables not reported, enabling support to flash
      the new Sierra Wireless EM9190 and EM9191 modules.

 * Several other minor improvements and fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libqmi/{libqmi_1.30.2.bb => libqmi_1.30.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.30.2.bb => libqmi_1.30.4.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.30.2.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
index c337abde37..dee36d7b45 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "be01ece0ea2c2194cbea5744bf5aaf06c04ba5fb7ec7887a13116c76d114fedd"
+SRC_URI[sha256sum] = "00d7da30a4f8d1185f37cba289cfaf1dfcd04a58f2f76d6acfdf5b85312d6ed6"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.25.1


