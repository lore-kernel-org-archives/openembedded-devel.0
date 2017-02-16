Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7DBA0731AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 09:50:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1G9omMl006710
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 01:50:49 -0800
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Feb 2017 01:50:47 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <1487209321-200180-1-git-send-email-wenzong.fan@windriver.com>
	<CAMKF1srP4fx93ndPMNSEc1r+9C4+mnsNk18srTyOhCajQg1XqQ@mail.gmail.com>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <ccd3be81-62af-e5ac-cc8f-e0c06f0941bc@windriver.com>
Date: Thu, 16 Feb 2017 17:50:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srP4fx93ndPMNSEc1r+9C4+mnsNk18srTyOhCajQg1XqQ@mail.gmail.com>
Subject: Re: [PATCH][meta-python] python-networkx: add package
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
X-List-Received-Date: Thu, 16 Feb 2017 09:50:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/16/2017 10:54 AM, Khem Raj wrote:
> On Wed, Feb 15, 2017 at 5:42 PM,  <wenzong.fan@windriver.com> wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> Python package for creating and manipulating graphs and networks.
>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>  meta-python/recipes-devtools/python/python-networkx_1.11.bb | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python-networkx_1.11.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-networkx_1.11.bb b/meta-python/recipes-devtools/python/python-networkx_1.11.bb
>> new file mode 100644
>> index 0000000..5bc062f
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-networkx_1.11.bb
>> @@ -0,0 +1,8 @@
>> +DESCRIPTION = "Python package for creating and manipulating graphs and networks"
>> +LICENSE = "BSD"
>
> would be nice if we could say BSD with clause

Ok, I'll update it and send V2.

Thanks
Wenzong

>
>> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=925586ea588eb990de840dc71ea3752f"
>> +
>> +SRC_URI[md5sum] = "6ef584a879e9163013e9a762e1cf7cd1"
>> +SRC_URI[sha256sum] = "0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f80638fef91d54dd1e4b8"
>> +
>> +inherit pypi setuptools
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

