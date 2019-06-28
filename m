Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2ACBF7EB36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 14:24:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5SEO4BB028694
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Jun 2019 07:24:14 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 28 Jun 2019 07:23:53 -0700
To: Adrian Bunk <bunk@stusta.de>, =?UTF-8?Q?Andreas_M=c3=bcller?=
	<schnitzeltony@gmail.com>
References: <fc78dc28-bc7c-2433-871f-3eb5047a0ee8@windriver.com>
	<20190628125845.GA5313@localhost>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <d889a55b-ae41-dd51-c37f-a8114b234753@windriver.com>
Date: Fri, 28 Jun 2019 22:23:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190628125845.GA5313@localhost>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: RFC: Add DISTRO_FEATURES(xfce) to control meta-xfce
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
X-List-Received-Date: Fri, 28 Jun 2019 14:24:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 6/28/19 8:58 PM, Adrian Bunk wrote:
> On Fri, Jun 28, 2019 at 10:20:36AM +0800, Hongxu Jia wrote:
>> Hi all,
>>
>> Currently, I am improving OE to follow Yocto Project Compatible,
>> One rule of Yocto Project Compatible is when a new layer is added,
>> it should not affect other layer, but unfortunately, bbappend in
>> meta-xfce broke the rule.
>>
>> So I suggest to add DISTRO_FEATURES(xfce) as a switch to control,
>> in short term, we could use it to control bbappend in meta-xfce,
>> in long term, we could use it to control more xfce specific features
>>
>> (As a alternative way, I also tried to remove bbappend directly,
>> but I found the existence of bbappend is indeed necessary)
> blueman upstream defaults to installing the files for thunar-sendto.
> Andreas, was there any specific reason why you made this conditional
> instead of keeping it enabled unconditional with only an RSUGGESTS
> on thunar?

Currently DISTRO_FEATURES(xfce) is used to control this bbappend,

if we could merge the bbappend to recipe thunar, I think it is not

necessary to add DISTRO_FEATURES(xfce) in short term

> gdmflexiserver looks like a workaround for something that should be
> fixed properly instead to me.
> But short-term adding it to the normal lxdm recipe in meta-oe might
> be an options?

No need to add extra lxdm, I am working to remove this bbappend,

and modify xfce4-panel to use lxdm to instead of lightdm directly,

we do not need this bbappend to provide a fake gdmflexiserver

//Hongxu

>> //Hongxu
> cu
> Adrian
>


