Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA57784D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 01:51:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAN1pCtf021431
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Nov 2017 17:51:12 -0800 (PST)
Received: from [128.224.162.147] (128.224.162.147) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 17:51:05 -0800
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
References: <bfbfad0b-af40-5448-4aed-fc70eeb95c6c@windriver.com>
	<7bdd24ea-febf-86b4-e770-6f7533205d73@windriver.com>
	<37b787d0-ef5a-d821-0c09-a8547c58c52d@gmail.com>
	<e9e12bfb-1b89-d9f1-619e-1896e83837cb@windriver.com>
	<23178b55-e416-a67f-f90f-041f2ab21080@windriver.com>
	<fef8df4e-613a-2baa-398c-f137ce4f8dd1@linux.intel.com>
	<CAMKF1spQUU6B_O+Ovd6YzZ4pycTJP7jDko5i19e6ww+VBCE5aA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <fbde46fc-4142-ccee-e13e-8b01b29d3cf0@windriver.com>
Date: Thu, 23 Nov 2017 09:53:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spQUU6B_O+Ovd6YzZ4pycTJP7jDko5i19e6ww+VBCE5aA@mail.gmail.com>
Cc: +lpd-cdc-core-dev <lpd-cdc-core-dev@windriver.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] Contribute meta-installer to yocto
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
X-List-Received-Date: Thu, 23 Nov 2017 01:51:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年11月22日 23:40, Khem Raj wrote:
> On Wed, Nov 22, 2017 at 12:58 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> On 11/22/2017 04:26 AM, Hongxu Jia wrote:
>>>> If it is OK, I will send pull request to OE for review, and
>>>> my opinion is to suggest to create meta-installer sub layer in OE.
>>>>
>>> To clarify, I mean to create sub dir meta-installer in
>>> git://git.openembedded.org/meta-openembedded
>>
>> Should the directory be called meta-anaconda then? There are many available
>> installers, and this would make it clear what the directory contains, I
>> think.
>>
>>
> I think meta-installers is more generic and probably good, you could
> create a top level
> repo called meta-installers and put this implementation underneath at
> meta-anaconda
> which leaves room to aggregate other installers under same roof. but
> again I dont
> have strong opinion either way.

The meta-openembedded/meta-installer/meta-anaconda,
there are too many meta-*, with a simple search in OE,
it seems breaking the traditional naming.

How about still name the top level 'meta-insatller', and
change the name of enable setting.

- For the target build, enable it by DISTRO_FEATURES_append = " 
anaconda-support"

- For the host build, enable it by DISTRO = 'anaconda'

Without above setting, the anaconda installer does not work even
though meta-installer included. Which other installer could put
here and work with their ways.

- Rename the existed README -> README.anaconda, and create a
   new one to introduce meta-installer as an installer framework.

- Rename the installation image core-image-installer to core-image-anaconda

One side effect is we have to keep LAYERDEPENDS_meta-installer
with a maximal set (which means for other installer, it may not require
these depends layers), but I think it is acceptable. Other meta-* layer
may have the same issue.

//Hongxu

>> Alex



