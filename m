Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B406D7C0A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 02:06:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0P26CwK009013
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jan 2019 18:06:12 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 24 Jan 2019 18:06:12 -0800
To: Stefan Agner <stefan@agner.ch>
References: <20190117162629.47677-1-stefan@agner.ch>
	<20190117162629.47677-3-stefan@agner.ch>
	<CALbNGRTLbuAi7czFzrSw4knWDR4t4Nq_pzsuTT6pVeY3vLYTig@mail.gmail.com>
	<d198417638781fb108e77e953ae95550@agner.ch>
	<6021b113-7a55-7bb7-c813-b7d768147f57@windriver.com>
	<CAMKF1spfqh71NCqVa4SweQehNMGMgezBJdnkMdoGAErt5f2g6A@mail.gmail.com>
	<5C47D961.6080605@windriver.com>
	<d24c3fcca886726418acf1eab1e06bf0@agner.ch>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5C4A6F27.3050008@windriver.com>
Date: Fri, 25 Jan 2019 10:06:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <d24c3fcca886726418acf1eab1e06bf0@agner.ch>
X-Originating-IP: [128.224.162.194]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 3/5] xfce4-power-manager: enable polkit depending on distro feature
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
X-List-Received-Date: Fri, 25 Jan 2019 02:06:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年01月24日 20:24, Stefan Agner wrote:
> On 23.01.2019 04:02, Yu, Mingli wrote:
>> On 2019年01月21日 02:07, Khem Raj wrote:
>>> On Thu, Jan 17, 2019 at 4:30 PM Randy MacLeod
>>> <randy.macleod@windriver.com> wrote:
>>>>
>>>> On 1/17/19 1:39 PM, Stefan Agner wrote:
>>>>> On 17.01.2019 18:53, Andreas Müller wrote:
>>>>>> On Thu, Jan 17, 2019 at 5:27 PM Stefan Agner <stefan@agner.ch> wrote:
>>>>>>>
>>>>>>> From: Stefan Agner <stefan.agner@toradex.com>
>>>>>>>
>>>>>>> systemd and polkit are not directly related. It is just fine to build
>>>>>>> with systemd but without polkit.
>>>>>> Surely it builds but is it still usable as unpriviledged user?
>>>>>
>>>>> TBH, I don't know, did not run XFCE.
>>>>
>>>> We do! :)
>>>>
>>>>>
>>>>> If it is unusable, we probably should not make it an option anyway? Just
>>>>> enable it always and make polkit a fixed dependency?
>>>>
>>>> Grace,
>>>> Please apply this series of patches and check if
>>>> xfce4-power-manager is usable as an unprivileged user?
>>>
>>> Thanks for testing it out, I will wait to hear from you
>>
>> Hi Randy and Khem:
>>
>> It's usable as an unprivileged user when project configured with below
>> items altogether:
>> 1, with systemd DISTRO_FEATURES
>> 2, without polkit DISTRO_FEATURES
>> 3, polkit package installed.
>> BTW, if we don't install polkit, there comes below error:
>> Missing or unbuildable dependency chain was:
>> ['packagegroup-xfce-base', 'xfce4-session', 'polkit']
>
> I don't understand this. In this case, you have polkit *not* in
> DISTRO_FEATURES and this patch applied?

Hi Stefan,

Yes, I apply these series patch successfully without polkit in 
DISTRO_FEATURES.
I guess you forget to inherit distro_features_check in your "[oe] [PATCH 
1/5] polkit: add polkit as a required distro feature" make it possible?

Thanks,

>
> In that case, packageconfig polkit should not be enabled, and hence
> polkit should not be a dependency.
>
>
>>
>> And there also comes a question about
>> "[oe] [PATCH 1/5] polkit: add polkit as a required distro feature" as
>> there is a logic as REQUIRED_DISTRO_FEATURES = "polkit" added, but why
>> does it inherit distro_features_check?
>
> polkit does not inherit distro_features_check, but should I guess?
>
> You probably meant to ask "why does it *not* inherit
> distro_features_check?"
>
> Good catch, will send a patch to add distro_features_check.
>
> --
> Stefan
>

