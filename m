Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07F367FAAD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 01:44:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xA81igAb026107
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Nov 2019 17:44:42 -0800
Received: from [128.224.158.209] (128.224.158.209) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 7 Nov 2019 17:44:41 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20191106074935.46751-1-hongxu.jia@windriver.com>
	<CALbNGRSyJYthd3zWWXfVBCzTNXhdNBA9K-MKAGFqHYVEuLNWYg@mail.gmail.com>
	<620c7105-97cf-0595-0c72-fb6bcc660348@windriver.com>
	<CAMKF1spQOVXGcitE__xXrfB1G54tEqau4JEaVXW4xEiBo521nw@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <4d5c9cfa-5d7f-7a6b-6227-64fe9126bdf9@windriver.com>
Date: Fri, 8 Nov 2019 09:44:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spQOVXGcitE__xXrfB1G54tEqau4JEaVXW4xEiBo521nw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 1/8] python-more-itertools: downgrade 7.2.0 -> 5.0.0
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
X-List-Received-Date: Fri, 08 Nov 2019 01:44:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 11/8/19 9:40 AM, Khem Raj wrote:
> On Wed, Nov 6, 2019 at 1:30 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> On 11/6/19 5:07 PM, Andreas Müller wrote:
>>> On Wed, Nov 6, 2019 at 8:59 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>>> Python 2.7 is no longer supported. The 5.0.0 release will be the last
>>>> version targeting Python 2.7. [1]
>>>>
>>>> [1] https://github.com/erikrose/more-itertools/commit/560b045b430e8292c18cf5283de4fdc3e13e56f7
>>>>
>>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> * Version going backwards
>>> * Such a patch at times python2 is eol - really?
>> All these patches just make python2 module work.
>>
>> Should we clarify that we do not support python2? If yes, we could clean
>> up them.
> as long as we have python2 in OE-core, IMO we should not drop the support.
>
Agree
>> In this case, if we do not support python2 more-itertools, we should also
>>
>> clean up these python2 recipes (python-pytest,python-pluggy,python-zipp)
>>
>> that runtime depends on more-itertools.
>>
>>
>> As above upstream commits [1] said, the old version 5.0.0 is the last
>> version
>>
>> to support python2. Two choice: going backwards or cleaning up, it is
>> impossible
>>
>> to patch latest more-itertools to support python2
> this recipe was just added in last release ( zeus ) so I think its
> fine to downgrade
> since I dont think we have folks with feeds from previous releases
> that will have to
> maintain upgradable feeds.
>
> But I think we should also apply these changes to zeus more importantly.
>
Agree

//Hongxu

>>
>> //Hongxu
>>
>>> Andreas
>>


