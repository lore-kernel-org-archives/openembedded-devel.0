Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A57BC41513
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 11:48:23 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by mx.groups.io with SMTP id smtpd.web10.7516.1716376473240110533
 for <Openembedded-Devel@Lists.Openembedded.Org>;
 Wed, 22 May 2024 04:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: moellendorf.eu, ip: 212.227.126.187, mailfrom: mail@moellendorf.eu)
Received: from localhost ([78.43.203.234]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MpCz1-1st06k2ijv-00qiEr; Wed, 22 May 2024 13:14:29 +0200
From: openembedded@moellendorf.eu
To: Openembedded-Devel@Lists.Openembedded.Org
Cc: =?UTF-8?q?Lars=20M=C3=B6llendorf?= <openembedded@moellendorf.eu>
Subject: [PATCH 0/2] iniparser upgrade
Date: Wed, 22 May 2024 13:13:46 +0200
Message-ID: <20240522111348.6109-1-openembedded@moellendorf.eu>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:8xvqBhP5P7dUkq/dWvfbWxiylTYnKOQD1GWBSuaC7PlL9qSQkut
 JEG+G8S0/XRHF83Bdq2LVZROAzZidSkaaDsibXGfYjq+yFF+w2zriSx1En/bCn1P1tFjBCy
 ADdXvZUtMplOrlEf4ifOuok+HLzHCiH9t9g/lihSgWp5sbxeN/SU8S5Z+xpwBf9mePh/T7B
 AZ2GwATlsE6jDDM3S1Sdw==
UI-OutboundReport: notjunk:1;M01:P0:oEhsLKQue3A=;8uNYpRgS/deJi4LYbZEH/gIXf1y
 R8a+qxAvAZCbC4PbRPe85coYXxsR0c2koBr1Fr/nnMT2VQRQe9uQ9K6LfcegJVhJ3CbE14aQf
 uzs6jQgaXsxm5y2VF1V/pxswXYSTuIo5xkovsGi/QyWRWEpqhNdMA72RM+x+Mgq29VBD+n67+
 BWFPv9ZZZuoDFSKpRaL1f31eJ+PrQqEM022MqvK6awkLXq/9SAtqpcs1ZnuOxwOUe6nXUGe9W
 SpnZDGWskwmgVl+V1VZYj+MmwRCv1pUbtBKGwGsm0kc2f4XOkj/UyLAIBcsjQWE8xReryAfVE
 otlE//Qq0MmmPai1SuDQzm2cFocGkWFSpCkw+0QOqSetEQYbm+3hmIU3qgnpG+vdqGRznjaSB
 qyPSbSDf6tH/HPvfI+DyjaOzX7N7Cx4+tor1HXpe8kcDqqCbd4vm6mOZtbsqq3yjUA70pmDtk
 Htb6DUJkjVpyOBWpFn7BYRF3xrSMeBLfA7tMiqEZujkaq5Byhe+ATlCJlLmsLd45AT+qo2rSC
 m/QPX+5tyUyjUo/uo5qDhmNX98Ph8Zs/MkBBiA4heCTNDlVPSPKYWAZ2WCh9ByV5yVo+ddYWU
 lWP9lyQdIAAjahemQWke0dNQtPqVW/ofaieGItObyJCrlwThjRVRDx2Uno0aDu4Fdj+5OFAAJ
 K5YG7AT0L7upOtuq4UMN7fu3XjzhuxHS9/q35hVHjvhuIDYTXID/49SSyuxyEBaaOm3783t0u
 yc82X7DlIEj3JCdX7kU03qS7ZIw+adoSZhRx4U89WyW3b2A0CaDHKg=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 11:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110484

I am the new upstream iniparser maintainer as
[announced by @ndevilla](https://github.com/ndevilla/iniparser/issues/125#issuecomment-2016557686)

As you can read in the project's
[README](https://github.com/ndevilla/iniparser/blob/main/README.md)
we moved to
[Gitlab](https://gitlab.com/iniparser/iniparser)

Lars Möllendorf (2):
  iniparser: upgrade 4.2 -> 4.2.1
  iniparser: remove dependency on doxygen-native

 ...iniparser.pc-Make-libpath-a-variable.patch | 23 -------
 .../iniparser/Add-CMake-support.patch         | 65 -------------------
 .../iniparser/iniparser_4.2.2.bb              | 18 +++++
 .../iniparser/iniparser_4.2.bb                | 27 --------
 4 files changed, 18 insertions(+), 115 deletions(-)
 delete mode 100644 meta-oe/recipes-support/iniparser/iniparser/0001-iniparser.pc-Make-libpath-a-variable.patch
 delete mode 100644 meta-oe/recipes-support/iniparser/iniparser/Add-CMake-support.patch
 create mode 100644 meta-oe/recipes-support/iniparser/iniparser_4.2.2.bb
 delete mode 100644 meta-oe/recipes-support/iniparser/iniparser_4.2.bb

-- 
2.43.2


