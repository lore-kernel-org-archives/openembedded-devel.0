Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B002177D3A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 17:28:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v79HSWeV013501
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Aug 2017 10:28:32 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 9 Aug 2017 10:28:32 -0700
To: <openembedded-devel@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
References: <20170801170152.94586-1-Randy.MacLeod@windriver.com>
	<olqm6a$87a$1@blaine.gmane.org>
	<4aaa2c14-284f-71b4-47d2-fc7e8e27beef@windriver.com>
	<BFE10A87-CF18-46BA-88E4-A795FB20506E@dominion.thruhere.net>
	<f3b1d5bc-6d6f-4fdd-8076-5d856af4b8cf@windriver.com>
	<CAMKF1srRkN_vfF5HkMQy4YM5aa8bUCC+HOX0zALdbweUeT8dCQ@mail.gmail.com>
	<9ec26f7f-f87b-b470-ee15-459ac5712bfd@windriver.com>
	<CALbNGRQQHqg-qWOxJim5Do08VSUCt_F8kSA-75LXeDx=SoDbqA@mail.gmail.com>
	<CAMKF1spVbt=sEkrkrJbPjLJ=SRC7zAkPKy4A9xUK1OR=90pOMQ@mail.gmail.com>
	<20170809081744.GA3394@jama>
	<CA+chaQfufXS=A=V67Kj7_z_OvM12ZZHLYN_dUgrdsHSjXZzXoQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <142d5852-aad4-d8fe-7b86-1e26a5a2f45d@windriver.com>
Date: Wed, 9 Aug 2017 13:28:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQfufXS=A=V67Kj7_z_OvM12ZZHLYN_dUgrdsHSjXZzXoQ@mail.gmail.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [meta-oe][PATCH] imagemagick: upgrade from 7.0.5 to 7.0.6p4
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
X-List-Received-Date: Wed, 09 Aug 2017 17:28:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2017-08-09 12:55 PM, Martin Jansa wrote:
> And jenkins builds won't populate it, because it failed there as well
> already:
> http://errors.yoctoproject.org/Errors/Details/150176/
> 
> I'll drop it from master-next in next update.

I have the simple update to P5 done and I'm confirming that
there are no build problems before submitting it.

There really isn't an alternative source that I've found
other than github and various people have seen that the
github checksums change on occasion.
See the tail of this thread:
    https://www.imagemagick.org/discourse-server/viewtopic.php?t=26962

The mirrors are not a good alternative since they follow the
'delete all but most recent tarball' policy of the main site.

Should I just stay on top of it until the 7.0.6 version stops
churning or should we point the SRC_URI explicitly to
    source.openembedded.org

../Randy

> 
> On Wed, Aug 9, 2017 at 10:17 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> 
>> On Tue, Aug 08, 2017 at 07:42:59PM -0700, Khem Raj wrote:
>>> On Tue, Aug 8, 2017 at 7:28 PM, Andreas Müller
>>> <schnitzeltony@googlemail.com> wrote:
>>>> On Wed, Aug 9, 2017 at 4:02 AM, Randy MacLeod
>>>> <randy.macleod@windriver.com> wrote:
>>>>> On 2017-08-08 08:42 PM, Khem Raj wrote:
>>>>>>
>>>>>> I am seeing
>>>>>>
>>>>>> downloads
>>>>>> 'http://www.imagemagick.org/download/releases/ImageMagick-
>> 7.0.6-4.tar.xz'
>>>>>> --progress=dot -v failed with exit code 8, output:
>>>>>> --2017-08-08 15:05:59--
>>>>>> http://www.imagemagick.org/download/releases/ImageMagick-
>> 7.0.6-4.tar.xz
>>>>>> Resolving www.imagemagick.org... 198.72.81.86
>>>>>> Connecting to www.imagemagick.org|198.72.81.86|:80... connected.
>>>>>> HTTP request sent, awaiting response... 404 Not Found
>>>>>> 2017-08-08 15:05:59 ERROR 404: Not Found.
>>>>>>
>>>>>>
>>>>>> ERROR: imagemagick-7.0.6-r0 do_fetch: Fetcher failure for URL:
>>>>>> 'http://www.imagemagick.org/download/releases/ImageMagick-
>> 7.0.6-4.tar.xz'.
>>>>>> Unable to fetch URL from any source.
>>>>>> ERROR: imagemagick-7.0.6-r0 do_fetch: Function failed: base_do_fetch
>>>>>> ERROR: Logfile of failure stored in:
>>>>>>
>>>>>> /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-
>> linux-gnueabi/imagemagick/7.0.6-r0/temp/log.do_fetch.17282
>>>>>
>>>>>
>>>>> Ugh, the imagemagick devs have moved on to:
>>>>>   http://www.imagemagick.org/download/releases/ImageMagick-
>> 7.0.6-5.tar.gz
>>>>>
>>>>> and deleted the 7.0.6-4 tarball already!
>>>>> I'll send a patch in the morning and also talk to upstream about their
>>>>> archiving policy. I don't see a directory for that at the moment.
>>>>>
>>>>> Thanks for the heads up.
>>>>>
>>>>> ../Randy
>>>>>
>>>> Yes and they will do it again until 7-0.7.x comes up :(
>>>
>>> I think we should copy the tarballs to source.openembedded.org before
>>> accepting imagemagick updates.
>>
>> That's what my jenkins builds do (or at least should do) once they build
>> this.
>>
>>>
>>>>
>>>> Andreas
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

