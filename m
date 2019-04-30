Return-Path: <pn@denx.de>
X-Greylist: delayed 487 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Apr 2019 22:53:11 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF087D5B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 22:53:11 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 44txS11f5mz1rbMl;
	Wed,  1 May 2019 00:45:05 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 44txS11Rt5z1qtm4;
	Wed,  1 May 2019 00:45:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id KdQxtCnZGht2; Wed,  1 May 2019 00:45:04 +0200 (CEST)
X-Auth-Info: jw3jfDkcptDeWMH0F7tvVwGo/qEIo5yYRjk6KLrp2a8=
Received: from [192.168.178.26] (unknown [62.91.105.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed,  1 May 2019 00:45:04 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
From: Parthiban Nallathambi <pn@denx.de>
Organization: DENX Software Engineering GmbH
Message-ID: <a5e8ae61-d876-90a7-56c2-b6ccd90c9b69@denx.de>
Date: Wed, 1 May 2019 00:45:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
Subject: Steps for adding new python module to meta-python
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Apr 2019 22:53:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello All,

I am currently trying to add a python module for aiohttp into meta-python.
But this recipes are not detected during bitbake.

Do we have any specific ways to add it or mention about the addition for
it to compile?

Also I would like to know how the package is referenced and cheksums are
calculated.

Thanks in advance for the feedback.

python-aiohttp.inc:
SUMMARY = "Asynchronous HTTP client/server framework for asyncio and Python"
DESCRIPTION = "Asynchronous HTTP client/server framework for asyncio and Python"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"

SRC_URI[md5sum] = "7a152f5236ee3b3ef97b6f1965a7c62c"
SRC_URI[sha256sum] = "9385ff2ea20249be9119236b3367356465cb92dc55b463d12239c7cf36024bba"

PYPI_PACKAGE = "aiohttp"
inherit pypi
RDEPENDS_${PN} = "\
    ${PYTHON_PN}-chardet \
    ${PYTHON_PN}-idna-ssl \
    ${PYTHON_PN}-multidict \
"

python3-aiohttp_3.5.4:
inherit setuptools3
require python-aiohttp.inc


Error:
bitbake python3-aiohttp
Loading cache: 100% |##################################################################################################| Time: 0:00:00
Loaded 3034 entries from dependency cache.
ERROR: Nothing PROVIDES 'python3-aiohttp'. Close matches:
  python3-attr
  python3-isort
  python3-attrs

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

-- 
Thanks,
Parthiban N

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-22 Fax: (+49)-8142-66989-80 Email: pn@denx.de

