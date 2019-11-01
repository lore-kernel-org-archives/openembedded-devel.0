Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE4CA7FC96
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 17:30:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA1HU89h020099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Nov 2019 10:30:08 -0700 (PDT)
Received: from [128.224.22.123] (128.224.22.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 1 Nov 2019 10:30:06 -0700
To: Khem Raj <raj.khem@gmail.com>, akuster808 <akuster808@gmail.com>
References: <20191031184223.14080-1-Trevor.Gamblin@windriver.com>
	<20191031184223.14080-3-Trevor.Gamblin@windriver.com>
	<84a3f2b5-264d-3f50-1fea-c6b8f6c292b5@gmail.com>
	<CAMKF1srBK7CzoBvNW0vbW2iP0cy3KRRnHr1=uSO926xxM=tRGw@mail.gmail.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <dc2e91d1-02f8-25c8-5240-65d1d72c7e1c@windriver.com>
Date: Fri, 1 Nov 2019 13:30:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srBK7CzoBvNW0vbW2iP0cy3KRRnHr1=uSO926xxM=tRGw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/4] python-h2: add recipe
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
X-List-Received-Date: Fri, 01 Nov 2019 17:30:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 11/1/19 1:04 PM, Khem Raj wrote:

> On Fri, Nov 1, 2019 at 8:40 AM akuster808 <akuster808@gmail.com> wrote:
>> are these V2 or just a miss fire?
>>
> there was no meta-python in the subject line. So there was another set
> which was sent
> which I have picked
Right, sorry for the confusion. I had sent them at first without the 
meta-python label and re-sent to clarify.
>>
>> On 10/31/19 11:42 AM, Trevor Gamblin wrote:
>>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>>
>>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>>> ---
>>>   .../recipes-connectivity/python-h2/python-h2.inc       | 10 ++++++++++
>>>   .../recipes-connectivity/python-h2/python-h2_3.1.1.bb  |  3 +++
>>>   .../recipes-connectivity/python-h2/python3-h2_3.1.1.bb |  3 +++
>>>   3 files changed, 16 insertions(+)
>>>   create mode 100644 meta-python/recipes-connectivity/python-h2/python-h2.inc
>>>   create mode 100644 meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
>>>   create mode 100644 meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
>>>
>>> diff --git a/meta-python/recipes-connectivity/python-h2/python-h2.inc b/meta-python/recipes-connectivity/python-h2/python-h2.inc
>>> new file mode 100644
>>> index 000000000..42629c261
>>> --- /dev/null
>>> +++ b/meta-python/recipes-connectivity/python-h2/python-h2.inc
>>> @@ -0,0 +1,10 @@
>>> +DESCRIPTION = "HTTP/2 State-Machine based protocol implementation"
>>> +HOMEPAGE = "https://github.com/python-hyper/hyper-h2"
>>> +LICENSE = "MIT"
>>> +
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851"
>>> +
>>> +SRC_URI[md5sum] = "950b5a62a2a608dc4547a01edf99aa8f"
>>> +SRC_URI[sha256sum] = "b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4"
>>> +
>>> +inherit pypi
>>> diff --git a/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
>>> new file mode 100644
>>> index 000000000..b84129742
>>> --- /dev/null
>>> +++ b/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
>>> @@ -0,0 +1,3 @@
>>> +require python-h2.inc
>>> +
>>> +inherit setuptools
>>> diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
>>> new file mode 100644
>>> index 000000000..7230a27e8
>>> --- /dev/null
>>> +++ b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
>>> @@ -0,0 +1,3 @@
>>> +require python-h2.inc
>>> +
>>> +inherit setuptools3
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

