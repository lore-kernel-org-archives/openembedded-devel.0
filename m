Return-Path: <ignas.anikevicius@realvnc.com>
Received: from SP38.realvnc.ltd (mx.realvnc.com [212.69.41.4])
	by mail.openembedded.org (Postfix) with ESMTP id 62DCC60232
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 14:12:42 +0000 (UTC)
Received: from [10.10.30.155] (10.10.30.155) by SP38.realvnc.ltd (10.10.99.11)
	with Microsoft SMTP Server (TLS) id 15.0.775.38;
	Tue, 2 Dec 2014 14:12:29 +0000
Message-ID: <547DC8CB.7090602@realvnc.com>
Date: Tue, 2 Dec 2014 14:12:27 +0000
From: Ignas Anikevicius <ignas.anikevicius@realvnc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1415111960-5672-1-git-send-email-ignas.anikevicius@realvnc.com>
	<547D369C.7080700@gmail.com>
In-Reply-To: <547D369C.7080700@gmail.com>
X-Originating-IP: [10.10.30.155]
X-ClientProxiedBy: SP38.realvnc.ltd (10.10.99.11) To SP38.realvnc.ltd
	(10.10.99.11)
Subject: Re: [meta-oe][daisy][PATCH] Add a bitbake recipe for Python psutil v2.1.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Dec 2014 14:12:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Since this was my first patch submission for meta-oe, I did not know 
about the development cycle for this. If this can not be applied to 
daisy, is it possible to get it into dizzy?

Thanks very much,

Ignas A.

On 02/12/14 03:48, akuster808 wrote:
>
> I don't think Daisy is taking new packages. I will defer to Martin.
>
> - Armin
>
> On 11/04/2014 06:39 AM, Ignas Anikevicius wrote:
>> This bitbake recipe is based on the existing
>> 'python-psutil_v0.6.9' bitbake recipe in the same folder.
>>
>> I have tested the recipe locally and it work without any issues.
>>
>> Signed-off-by: Ignas Anikevicius <ignas.anikevicius@realvnc.com>
>> ---
>>   meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb | 13 
>> +++++++++++++
>>   1 file changed, 13 insertions(+)
>>   create mode 100644 
>> meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb
>>
>> diff --git a/meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb 
>> b/meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb
>> new file mode 100644
>> index 0000000..76380ba
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/python/python-psutil_2.1.3.bb
>> @@ -0,0 +1,13 @@
>> +SUMMARY = "A cross-platform process and system utilities module for 
>> Python"
>> +SECTION = "devel/python"
>> +HOMEPAGE = "https://github.com/giampaolo/psutil"
>> +LICENSE = "BSD"
>> +LIC_FILES_CHKSUM = 
>> "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
>> +
>> +SRC_URI = 
>> "https://pypi.python.org/packages/source/p/psutil/psutil-${PV}.tar.gz"
>> +SRC_URI[md5sum] = "015a013c46bb9bc30b5c344f26dea0d3"
>> +SRC_URI[sha256sum] = 
>> "b434c75f01715777391f10f456002e33d0ca14633f96fdbd9ff9139b42d9452c"
>> +
>> +S = "${WORKDIR}/psutil-${PV}"
>> +
>> +inherit setuptools
>>


