Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6683772D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 11:45:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tADBjh3j026004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Nov 2015 03:45:43 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 13 Nov 2015 03:45:42 -0800
Message-ID: <5645CD5C.8040908@windriver.com>
Date: Fri, 13 Nov 2015 19:45:32 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <schnitzeltony@googlemail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <1447409052-30874-1-git-send-email-hongxu.jia@windriver.com>	<CALbNGRQuQcD54T7raCZdhM3-fTpiiH2Xa2C=0svMq8w+HMrnkg@mail.gmail.com>	<CA+chaQefhmSve7vJPMAFtzmay=+qgcrW-UJ-M3FY4Yoa8ZiAuQ@mail.gmail.com>
	<CALbNGRSt0Ws2KpBmqL9xuMGEj-CaZN+DXqg1N6Z8Cqj7frR3SA@mail.gmail.com>
In-Reply-To: <CALbNGRSt0Ws2KpBmqL9xuMGEj-CaZN+DXqg1N6Z8Cqj7frR3SA@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 13 Nov 2015 11:45:46 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/2015 06:36 PM, Andreas Müller wrote:
> On Fri, Nov 13, 2015 at 11:19 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Why not use VIRTUAL-RUNTIME variable like in other places? And if it's
>> needed by xfce4-power-manager, then why don't you add it to RDEPENDS there?
>>
> networkmanager is already in RDEPENDS of xfce4-power-manager. I think
> when building an image packagegroup-core-x11-sato there is a conflict.
>
> I looked into this a bit more and think:
> 1. networkmanger support is optional so a packagroup would allow
> conman and xfce4-power-manager live together in harmony
> 2. I think the patch goes much to far: To have networkmanager in
> images based on packagegroup-core-x11-sato the correct way would be to
> write NETWORK_MANAGER = "networkmanager" in the image recipe.

Hi Andreas,

The condition of writing  NETWORK_MANAGER = "networkmanager" is
packagegroup-core-x11-sato + xfce4-power-manager, I think it is not
proper to test the existence of them in an image recipe.

Hi Martin & Andreas,

How about we still do the setting in meta-xfce's local.conf and replace
networkmanager with variable ${NETWORK_MANAGER} in
xfce4-power-manager's RDEPENDS.

So we could globally control network manager by variable
${NETWORK_MANAGER} for the similar issue.

//Hongxu
> Andreas


