Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A5F9F60621
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 08:20:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5T8KSnE024269
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 01:20:28 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 29 Jun 2016 01:20:27 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1467102993-4925-1-git-send-email-mingli.yu@windriver.com>
	<1467102993-4925-3-git-send-email-mingli.yu@windriver.com>
	<CANx9H-BvJ1ONU6ebaEYR8NSaNdYhAioMuMxNmE6ntWTBn7ZBYQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57738476.20303@windriver.com>
Date: Wed, 29 Jun 2016 16:19:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-BvJ1ONU6ebaEYR8NSaNdYhAioMuMxNmE6ntWTBn7ZBYQ@mail.gmail.com>
X-Originating-IP: [128.224.163.140]
Subject: Re: [PATCH 2/3] python-pbr: add python-pbr bb
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
X-List-Received-Date: Wed, 29 Jun 2016 08:20:29 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年06月28日 22:56, Tim Orling wrote:
> On Tue, Jun 28, 2016 at 1:36 AM, <mingli.yu@windriver.com> wrote:
>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> * Add python-pbr bb file as python-mock depends on
>>    python-pbr-native
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../recipes-devtools/python/python-pbr_1.10.0.bb   | 22
>> ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/
>> python-pbr_1.10.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
>> b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
>> new file mode 100644
>> index 0000000..4a08bde
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
>> @@ -0,0 +1,22 @@
>> +DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects
>> some useful and sensible default behaviors into your setuptools run"
>> +HOMEPAGE = "https://pypi.python.org/pypi/pbr"
>> +SECTION = "devel/python"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>> +
>> +SRCNAME = "pbr"
>> +
>> +SRC_URI = "
>> https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz
>> "
>>
>
> You don't need to do this if you inherit pypi.
Thanks! Update to inherit pypi.
>
>
>> +
>> +SRC_URI[md5sum] = "8e4968c587268f030e38329feb9c8f17"
>> +SRC_URI[sha256sum] =
>> "186428c270309e6fdfe2d5ab0949ab21ae5f7dea831eab96701b86bd666af39c"
>> +
>> +S = "${WORKDIR}/${SRCNAME}-${PV}"
>> +
>> +inherit setuptools
>> +
>> +DEPENDS_class-target += " \
>> +        python-pip \
>> +        "
>> +
>> +BBCLASSEXTEND = "native"
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

