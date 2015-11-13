Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0BFFB772EE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 10:36:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tADAaSuH009157
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 02:36:28 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 13 Nov 2015 02:36:27 -0800
Message-ID: <5645BD22.7030105@windriver.com>
Date: Fri, 13 Nov 2015 18:36:18 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1447409052-30874-1-git-send-email-hongxu.jia@windriver.com>	<CALbNGRQuQcD54T7raCZdhM3-fTpiiH2Xa2C=0svMq8w+HMrnkg@mail.gmail.com>
	<CA+chaQefhmSve7vJPMAFtzmay=+qgcrW-UJ-M3FY4Yoa8ZiAuQ@mail.gmail.com>
In-Reply-To: <CA+chaQefhmSve7vJPMAFtzmay=+qgcrW-UJ-M3FY4Yoa8ZiAuQ@mail.gmail.com>
Subject: Re: [meta-xfce][PATCH] meta-xfce/layer: explicitly set networkmanager to NETWORK_MANAGER
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Nov 2015 10:36:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/2015 06:19 PM, Martin Jansa wrote:

> Why not use VIRTUAL-RUNTIME variable like in other places?

If use it, I will rename NETWORK_MANAGER with VIRTUAL-RUNTIME_networkmanager
in packagegroup-core-x11-sato, to see oe-core whether accept it or not.

> And if it's
> needed by xfce4-power-manager, then why don't you add it to RDEPENDS there?

It is reasonable, add the variable(NETWORK_MANAGER or
VIRTUAL-RUNTIME_networkmanager) to xfce4-power-manager'S RDEPENDS

//Hongxu

> On Fri, Nov 13, 2015 at 11:13 AM, Andreas Müller <
> schnitzeltony@googlemail.com> wrote:
>
>> On Fri, Nov 13, 2015 at 11:04 AM, Hongxu Jia <hongxu.jia@windriver.com>
>> wrote:
>>> The NETWORK_MANAGER is connman-gnome in oe-core by default,
>>> which conflicts with networkmanager. And networkmanager is
>>> required by xfce4-power-manager in meta-xfce. So we explicitly
>>> set networkmanager to NETWORK_MANAGER for meta-xfce.
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>   meta-xfce/conf/layer.conf | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
>>> index 55bcef6..e38d85d 100644
>>> --- a/meta-xfce/conf/layer.conf
>>> +++ b/meta-xfce/conf/layer.conf
>>> @@ -17,3 +17,6 @@ LAYERDEPENDS_xfce-layer += "openembedded-layer"
>>>   LAYERDEPENDS_xfce-layer += "gnome-layer"
>>>   LAYERDEPENDS_xfce-layer += "openembedded-layer"
>>>   LAYERDEPENDS_xfce-layer += "meta-python"
>>> +
>>> +# It is required by xfce4-power-manager
>>> +NETWORK_MANAGER = "networkmanager"
>>> --
>> I was wondering why I never needed such kind of patch and checked: In
>> my layers It is only used in packagegroup-core-x11-sato.
>>
>> So I am fine with this patch but could you mention
>> packagegroup-core-x11-sato in the commit message please.
>>
>> Andreas
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


