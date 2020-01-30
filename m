Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBD396023A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 19:03:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 00UJ34Dm025485
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 30 Jan 2020 11:03:04 -0800 (PST)
Received: from [128.224.56.226] (128.224.56.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 30 Jan 2020 11:03:03 -0800
To: akuster808 <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20200130153405.26756-1-Trevor.Gamblin@windriver.com>
	<20200130153405.26756-2-Trevor.Gamblin@windriver.com>
	<d9645f32-3c76-5fe6-2fe6-8cc49ef81a51@gmail.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <fe8227c4-ecdc-35a9-7b59-8a409f63c656@windriver.com>
Date: Thu, 30 Jan 2020 14:03:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d9645f32-3c76-5fe6-2fe6-8cc49ef81a51@gmail.com>
Subject: Re: [meta-python][zeus][PATCH v2 2/2] pyhamcrest: add python3 version of recipe
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 1/30/20 2:00 PM, akuster808 wrote:
> What is the diff in v2 ?
My mistake, no change in v2 for this patch - meant to only send the 
patch to update RDEPENDS.
>
> On 1/30/20 7:34 AM, Trevor Gamblin wrote:
>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>
>> Twisted requires pyhamcrest for /usr/bin/twistd to work, but in zeus
>> there is only a python2 recipe for this package, thus the twistd daemon
>> won't be able to run properly for python3.
>>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>   .../python/python3-pyhamcrest_1.9.0.bb                 | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
>> new file mode 100644
>> index 000000000..04aa9b47f
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
>> @@ -0,0 +1,10 @@
>> +SUMMARY = "Hamcrest framework for matcher objects"
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6df1318c6071dd1707f5e3b6c11f24f"
>> +
>> +PYPI_PACKAGE = "PyHamcrest"
>> +
>> +SRC_URI[md5sum] = "8b833a3fa30197455df79424f30c8c3f"
>> +SRC_URI[sha256sum] = "8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd"
>> +
>> +inherit pypi setuptools3

