Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D1ECB71C3D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 09:10:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8M9AwYe025135
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Sep 2017 02:10:58 -0700 (PDT)
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 22 Sep 2017 02:10:57 -0700
To: Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20170921064721.17250-1-kai.kang@windriver.com>
	<20170921064721.17250-2-kai.kang@windriver.com>
	<CAMKF1sps70RNgvw+nRdp9uSh8Rx16Eisa+Jh5agVcXAH5ctPZw@mail.gmail.com>
	<CAJ86T=UAo6ejGQDQ9WDbRdyDcO7ATcFV9sja4MFW0v0yGugN7w@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <6a594284-e970-e55a-aa02-377821f51a18@windriver.com>
Date: Fri, 22 Sep 2017 17:13:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UAo6ejGQDQ9WDbRdyDcO7ATcFV9sja4MFW0v0yGugN7w@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/1] lvm2: disable thin provisioning support if GPLv3 incompatible
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
X-List-Received-Date: Fri, 22 Sep 2017 09:10:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年09月22日 03:44, Andre McCurdy wrote:
> On Thu, Sep 21, 2017 at 7:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Sep 20, 2017 at 11:47 PM,  <kai.kang@windriver.com> wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> Disable thin provisioning support for lvm2 if it is set GPLv3
>>> incompatible.
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>   meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
>>> index ab8db9cba..9791554a9 100644
>>> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
>>> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
>>> @@ -23,7 +23,7 @@ inherit autotools-brokensep pkgconfig systemd
>>>   LVM2_PACKAGECONFIG = "dmeventd lvmetad"
>>>   LVM2_PACKAGECONFIG_append_class-target = " \
>>>       ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
>>> -    thin-provisioning-tools \
>>> +    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'thin-provisioning-tools', d)} \
>>>       udev \
>>>   "
>> there are other strings like GPL-3.0, as well as other types of GPL 3
>> derivative licenses, I wonder if this will work for all
> Perhaps something like:
>
>    ${@incompatible_license_contains('GPLv3', '', 'thin-provisioning-tools', d)}
>
> would work more reliably?

OK. Thanks. I'll send V2.


--Kai



>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
Regards,
Neil | Kai Kang


