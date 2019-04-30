Return-Path: <douglas.royds@taitradio.com>
X-Greylist: delayed 380 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Apr 2019 23:51:15 UTC
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 171647DAD1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 23:51:15 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id EC6082202DB;
	Wed,  1 May 2019 11:44:54 +1200 (NZST)
To: Parthiban Nallathambi <pn@denx.de>,
	openembedded-devel@lists.openembedded.org
References: <a5e8ae61-d876-90a7-56c2-b6ccd90c9b69@denx.de>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <6beaf98a-6116-2184-fae8-e6018febaaee@taitradio.com>
Date: Wed, 1 May 2019 11:44:54 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a5e8ae61-d876-90a7-56c2-b6ccd90c9b69@denx.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Steps for adding new python module to meta-python
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
X-List-Received-Date: Tue, 30 Apr 2019 23:51:16 -0000
Content-Language: en-GB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

You need:

    python3-aiohttp_3.5.4.bb

Note the ".bb" extension.


On 1/05/19 10:45 AM, Parthiban Nallathambi wrote:

> Hello All,
>
> I am currently trying to add a python module for aiohttp into meta-python.
> But this recipes are not detected during bitbake.
>
> Do we have any specific ways to add it or mention about the addition for
> it to compile?
>
> Also I would like to know how the package is referenced and cheksums are
> calculated.
>
> Thanks in advance for the feedback.
>
> python-aiohttp.inc:
> SUMMARY = "Asynchronous HTTP client/server framework for asyncio and Python"
> DESCRIPTION = "Asynchronous HTTP client/server framework for asyncio and Python"
> LICENSE = "Apache-2.0"
> LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
>
> SRC_URI[md5sum] = "7a152f5236ee3b3ef97b6f1965a7c62c"
> SRC_URI[sha256sum] = "9385ff2ea20249be9119236b3367356465cb92dc55b463d12239c7cf36024bba"
>
> PYPI_PACKAGE = "aiohttp"
> inherit pypi
> RDEPENDS_${PN} = "\
>      ${PYTHON_PN}-chardet \
>      ${PYTHON_PN}-idna-ssl \
>      ${PYTHON_PN}-multidict \
> "
>
> python3-aiohttp_3.5.4:
> inherit setuptools3
> require python-aiohttp.inc
>
>
> Error:
> bitbake python3-aiohttp
> Loading cache: 100% |##################################################################################################| Time: 0:00:00
> Loaded 3034 entries from dependency cache.
> ERROR: Nothing PROVIDES 'python3-aiohttp'. Close matches:
>    python3-attr
>    python3-isort
>    python3-attrs
>
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>


