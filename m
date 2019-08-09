Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74BFA7D72F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 01:44:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x791iC4u009077
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Aug 2019 18:44:32 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 18:44:26 -0700
To: Khem Raj <raj.khem@gmail.com>, =?UTF-8?Q?Andreas_M=c3=bcller?=
	<schnitzeltony@gmail.com>
References: <20190807051707.8709-1-kai.kang@windriver.com>
	<CALbNGRQ-e5SvSJVeet6MsZJ9Ux0K06jrxxH_T=YztAgCqGOUug@mail.gmail.com>
	<80d262d5-643d-0ccb-bd6d-1a1207d06833@windriver.com>
	<176921d1-3656-c5a2-b526-f8b5c1bf346a@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <0d42e7fe-f93a-e3e3-0dc6-fc510ea8e40e@windriver.com>
Date: Fri, 9 Aug 2019 09:42:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <176921d1-3656-c5a2-b526-f8b5c1bf346a@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][Patch 0/2] Add recipe of xfce4-datetime-setter
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
X-List-Received-Date: Fri, 09 Aug 2019 01:44:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/8/8 下午11:13, Khem Raj wrote:
>
> On 8/8/19 2:00 AM, Kang Kai wrote:
>> On 2019/8/7 下午10:02, Andreas Müller wrote:
>>> On Wed, Aug 7, 2019 at 7:18 AM <kai.kang@windriver.com> wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> Hi Andreas,
>>>>
>>>> I add recipe of xfce4-datetime-setter which is from your repo from
>>>> github. But I found it requires dbus service org.freedesktop.timedate1
>>>> which is from systemd. So make xfce4-settings requires it only when
>>>> init manger
>>>> is sytemd. Any comment on that please?
>>>>
>>>> Regards,
>>>> Kai
>>> Hi Kai,
>>>
>>> * had short glance on your patches: they look good to me. In the
>>> 'old-days' when datetime-setter was part of xfce-settings, there was a
>>> packageconfig for it. That was enabled if systemd was in distro
>>> features - so your suggestion should behave same.
>> It reminds me that it is better to check distro systemd for
>> xfce4-datetime-setter. v2 will be sent.
>>
>>
>>> * thanks for taking care for meta-xfce for very long time now
>> My pleasure.
>>
>>
>>> * would anybody complain making you maintainer of meta-xfce?
>> It will be my honor if I have chance to take more responsibility and
>> contribute more to oe community.
> Thanks for stepping up. It would be good if you can start looking at all
> the meta-xfce patches, review them and send acks on mailing list, I
> would look out for those, and eventually prepare a pull request for all
> meta-xfce patches to be merged.

OK. I'll begin to do this work. Thanks.

Kai.


>
>> Thanks,
>> Kai
>>
>>> Regards
>>>
>>>
>>> Andreas
>>>

-- 
Kai Kang


