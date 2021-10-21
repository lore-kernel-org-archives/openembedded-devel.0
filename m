Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5B1C433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 09:09:46 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web12.6735.1634807383922167465
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 02:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rrv0xrWN;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634807375; i=@fujitsu.com;
	bh=rzbpmuhFoGtAGZ2sPc6XlZFLE6Tc79qXXeCe4SJgDbI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rrv0xrWNpIoGCD4bnYmwv8UzbVNBdQ+nAce8JD3Dr47/C1s3WEmm4iUtcqFEpcb8H
	 PdmcbG2qwy2xPb5eTDAyFX849lY7CwGnJjInvqHFG0ohbHqL52ld6cbkYVapnmvld7
	 I0hFlhmPzOmrIp7lU1lsAHYyf9ROFShCpCwsRVCe4rM05esJ8vpcxLU5/u5A/IU79g
	 0N95BVX5A0zJjhQOIs2sm0+qf5JgT+znm7VoWfdkoleByG8x00kJyRG9nZVwDW5hQm
	 BgS5OaRH1gLq2q5dW9yeLmUHTTfnqSywZciJ9uwQo+vAk9Nwk9BGqJe5Wl06Wgs9SV
	 ZMe/BHU0qUDtA==
Received: from [100.113.4.50] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id D9/B2-25178-F4E21716;
 Thu, 21 Oct 2021 09:09:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYouunV5h
  o8H4fk8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHy1zG2gv8iFefbe5gbGPuFuhg5OYQEZjNJ
  PNwnDGGfYJTYtFkDxGYT0JHoeNHNAmKLCOhLLJ29hxnEFhbwlJiz6y8jiM0ioCpx79QeJhCbV
  8BNYvvKe6wgtoSAgsSUh++ZIeKCEidnPgGbwywgIXHwxQtmiBpFie07z7BA2BUSrw9fYp7AyD
  MLScssJC0LGJlWMVomFWWmZ5TkJmbm6BoaGOgaGhrrmusaGRvqJVbpJumlluomp+aVFCUCZfU
  Sy4v1iitzk3NS9PJSSzYxAsMopZD9+Q7GVW8+6B1ilORgUhLl1flVkCjEl5SfUpmRWJwRX1Sa
  k1p8iFGGg0NJgnenemGikGBRanpqRVpmDjCkYdISHDxKIrz+ykBp3uKCxNzizHSI1ClGRSlx3
  nfyQAkBkERGaR5cGyyOLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5p2tAzSFJzOvBG76K6
  DFTECLCywKQBaXJCKkpBqY5uSc2WDj11N/aPGEnbmlabPZ3x2UTT/ActL38oXCHV3TRDYp7G6
  uNG89Gzrj9X9RrqqqZO+vuWqFk2o5f665GX/Ez7jleNOiOV7CW2vS187bsbozNDEpW/uji83E
  aSnnGXTFi5MTZeurrpeoMl+fobOOa4LSJbvuHYx+K3+m2yhfY/zlf2rzU2FTBjez1ccCJlabF
  ThcEFeRub3qfX1TbV9n2qsdf3onH/EQulFTedJu1qMPaV3r6v7evuCiYefLkX2/MPLoL7+0Mx
  P8p1iunv3DLtiMKfX9POson4ZJ6nFVSzk3HEk9JDyfYW3nlcuCDxf7/D/+bIa/Tb+x15mT3Ez
  nOy/zpq+a9utk3StjJZbijERDLeai4kQACo2afh4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-248.messagelabs.com!1634807368!12669!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31791 invoked from network); 21 Oct 2021 09:09:33 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-19.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Oct 2021 09:09:33 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19L99SxD023679
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:09:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Thu, 21 Oct 2021 10:09:27 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-click: upgrade 8.0.1 -> 8.0.3
Date: Fri, 22 Oct 2021 05:09:21 +0800
Message-ID: <1634850561-4548-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Oct 2021 09:09:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93511

Version 8.0.3
-------------
Released 2021-10-10
-   Fix issue with ``Path(resolve_path=True)`` type creating invalid
    paths. :issue:`2088`
-   Importing ``readline`` does not cause the ``confirm()`` prompt to
    disappear when pressing backspace. :issue:`2092`
-   Any default values injected by ``invoke()`` are cast to the
    corresponding parameter's type. :issue:`2089, 2090`

Version 8.0.2
-------------
Released 2021-10-08
-   ``is_bool_flag`` is not set to ``True`` if ``is_flag`` is ``False``.
    :issue:`1925`
-   Bash version detection is locale independent. :issue:`1940`
-   Empty ``default`` value is not shown for ``multiple=True``.
    :issue:`1969`
-   Fix shell completion for arguments that start with a forward slash
    such as absolute file paths. :issue:`1929`
-   ``Path`` type with ``resolve_path=True`` resolves relative symlinks
    to be relative to the containing directory. :issue:`1921`
-   Completion does not skip Python's resource cleanup when exiting,
    avoiding some unexpected warning output. :issue:`1738, 2017`
-   Fix type annotation for ``type`` argument in ``prompt`` function.
    :issue:`2062`
-   Fix overline and italic styles, which were incorrectly added when
    adding underline. :pr:`2058`
-   An option with ``count=True`` will not show "[x>=0]" in help text.
    :issue:`2072`
-   Default values are not cast to the parameter type twice during
    processing. :issue:`2085`
-   Options with ``multiple`` and ``flag_value`` use the flag value
    instead of leaving an internal placeholder. :issue:`2001`

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-click_8.0.1.bb => python3-click_8.0.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-click_8.0.1.bb => python3-click_8.0.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-click_8.0.1.bb b/meta-python/recipes-devtools/python/python3-click_8.0.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-click_8.0.1.bb
rename to meta-python/recipes-devtools/python/python3-click_8.0.3.bb
index c8b9a429e..c31d06567 100644
--- a/meta-python/recipes-devtools/python/python3-click_8.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-click_8.0.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "8c04c11192119b1ef78ea049e0a6f0463e4c48ef00a30160c704337586f3ad7a"
+SRC_URI[sha256sum] = "410e932b050f5eed773c4cda94de75971c89cdb3155a72a0831139a79e5ecb5b"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


