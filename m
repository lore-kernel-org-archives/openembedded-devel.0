Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E27DE60670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 09:25:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6B9PMtC019665
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 02:25:22 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 11 Jul 2016 02:25:21 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1467619576-13899-1-git-send-email-mingli.yu@windriver.com>
	<1467619576-13899-6-git-send-email-mingli.yu@windriver.com>
	<CANx9H-DVRsHZGBJVkc2k1p4fTdWOchBhQBnm3Y8HuhTtiuzwMA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57836590.7@windriver.com>
Date: Mon, 11 Jul 2016 17:23:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-DVRsHZGBJVkc2k1p4fTdWOchBhQBnm3Y8HuhTtiuzwMA@mail.gmail.com>
X-Originating-IP: [128.224.163.140]
Subject: Re: [meta-python][PATCH v2 5/5] python-setuptools-scm: Add python-setuptools-scm bb
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
X-List-Received-Date: Mon, 11 Jul 2016 09:25:22 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年07月09日 01:09, Tim Orling wrote:
> Built ok for beaglebone.
>
> NOTE: SRC_URI probably not required with Derek's pypi.bbclass patch
> https://patchwork.openembedded.org/patch/125551/ but I did not test for
> that.
We still need this SRC_URI as we do translation for the package 
python-setuptools-scm as the previous packages name as 
python-setuptools_scm which includes underline， but the package name 
part can't include underline for a recipe name.

Thanks,
Grace
>
>
> Acked-by: Tim Orling (Intel OpenSource Technology Center) <
> ticotimo@gmail.com>
>
> On Mon, Jul 4, 2016 at 1:06 AM, <mingli.yu@windriver.com> wrote:
>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> * Add python-setuptools-scm bb as python-pytest-runner depends
>>    on python-setuptools-scm
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../python/python-setuptools-scm_1.11.1.bb             | 18
>> ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/
>> python-setuptools-scm_1.11.1.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python-setuptools-scm_1.11.1.bb b/meta-python/recipes-devtools/python/
>> python-setuptools-scm_1.11.1.bb
>> new file mode 100644
>> index 0000000..2a3b97d
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb
>> @@ -0,0 +1,18 @@
>> +SUMMARY = "the blessed package to manage your versions by scm tags"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
>> +
>> +inherit pypi setuptools
>> +
>> +SRCNAME = "setuptools_scm"
>> +
>> +SRC_URI = "
>> https://pypi.python.org/packages/84/aa/c693b5d41da513fed3f0ee27f1bf02a303caa75bbdfa5c8cc233a1d778c4/${SRCNAME}-${PV}.tar.gz
>> "
>> +
>> +SRC_URI[md5sum] = "4d19b2bc9580016d991f665ac20e2e8f"
>> +SRC_URI[sha256sum] =
>> "8c45f738a23410c5276b0ed9294af607f491e4260589f1eb90df8312e23819bf"
>> +
>> +S = "${WORKDIR}/${SRCNAME}-${PV}"
>> +
>> +RDEPENDS_${PN} = "python-py python-setuptools python-argparse
>> python-debugger python-json"
>> +
>> +
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

