Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEC4E6069C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2019 00:29:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0I0S78p000398
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Jan 2019 16:28:49 -0800
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 17 Jan 2019 16:28:16 -0800
To: Stefan Agner <stefan@agner.ch>, =?UTF-8?Q?Andreas_M=c3=bcller?=
	<schnitzeltony@gmail.com>, "Yu, Mingli" <mingli.yu@windriver.com>
References: <20190117162629.47677-1-stefan@agner.ch>
	<20190117162629.47677-3-stefan@agner.ch>
	<CALbNGRTLbuAi7czFzrSw4knWDR4t4Nq_pzsuTT6pVeY3vLYTig@mail.gmail.com>
	<d198417638781fb108e77e953ae95550@agner.ch>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <6021b113-7a55-7bb7-c813-b7d768147f57@windriver.com>
Date: Thu, 17 Jan 2019 19:28:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <d198417638781fb108e77e953ae95550@agner.ch>
X-Originating-IP: [172.25.44.4]
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
X-List-Received-Date: Fri, 18 Jan 2019 00:29:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 1/17/19 1:39 PM, Stefan Agner wrote:
> On 17.01.2019 18:53, Andreas Müller wrote:
>> On Thu, Jan 17, 2019 at 5:27 PM Stefan Agner <stefan@agner.ch> wrote:
>>>
>>> From: Stefan Agner <stefan.agner@toradex.com>
>>>
>>> systemd and polkit are not directly related. It is just fine to build
>>> with systemd but without polkit.
>> Surely it builds but is it still usable as unpriviledged user?
> 
> TBH, I don't know, did not run XFCE.

We do! :)

> 
> If it is unusable, we probably should not make it an option anyway? Just
> enable it always and make polkit a fixed dependency?

Grace,
Please apply this series of patches and check if
xfce4-power-manager is usable as an unprivileged user?

../Randy

> 
> --
> Stefan
> 
>>
>> Andreas
>>> Rename the systemd package config
>>> to polkit and enable it depending on whether polkit is enabled in
>>> DISTRO_FEATURES.
>>>
>>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>>> ---
>>>   .../recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb     | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
>>> index ed117b0a6..1cdcb4160 100644
>>> --- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
>>> +++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
>>> @@ -20,8 +20,8 @@ EXTRA_OECONF = " \
>>>       --enable-panel-plugins \
>>>   "
>>>
>>> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>>> -PACKAGECONFIG[systemd] = "--enable-polkit, --disable-polkit, polkit"
>>> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
>>> +PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
>>>
>>>   PACKAGES += "xfce4-powermanager-plugin"
>>>
>>> --
>>> 2.13.6
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
# Randy MacLeod
# Wind River Linux

