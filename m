Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PnBYx-0004l9-I6
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 16:02:35 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PnBXm-0007jB-QV from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 07:01:22 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 9 Feb 2011 07:01:22 -0800
Received: from [172.30.80.130] ([172.30.80.130]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 9 Feb 2011 08:01:21 -0700
Message-ID: <4D52AC3D.4050906@mentor.com>
Date: Wed, 09 Feb 2011 08:01:17 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>	<201102091039.27832.marcin@juszkiewicz.com.pl>	<AANLkTikDHBWTnf2S3j-P9_rpscdRQ7GZHVxrNLbLCXZW@mail.gmail.com>
	<iiu4qb$8st$1@dough.gmane.org>
In-Reply-To: <iiu4qb$8st$1@dough.gmane.org>
X-OriginalArrivalTime: 09 Feb 2011 15:01:21.0861 (UTC)
	FILETIME=[369E1750:01CBC86A]
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in PACKAGES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Feb 2011 15:02:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2011 06:28 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 09-02-11 13:59, Filip Zyzniewski wrote:
>> On 2/9/11, Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>  wrote:
>>
>>> This change is bogus. You just remove building of BT/Wifi support for
>>> "bitbake
>>> bootstrap-image" for your machine not distro. Use DISTRO_FEATURES instead
>>> and
>>> then remove "bluetooth wifi" from DISTRO_FEATURES in your distribution
>>> config
>>> file.
>>
>> The whole point of this patch is to make task-base honour features.
>> Without this change bluez (and in consequence avahi, gstreamer, gtk, x
>> libs) gets built regardless of features setting.
>
> That's the whole point of task-base, to get things built. You can then
> use machine_features to install them by default or not.
>
> Again, noone is forcing you to use task-base, so no need to break it for
> everyone else like your patch is doing.

But it's also kinda annoying when you opt out of task-base.

So let me put on the apparently stupid hat today.  Looking at task-base 
today.  PACKAGES always has task-base-{wifi,bluetooth}.  task-base will 
RDEPEND on it iff DISTRO and MACHINE set the appropriate feature.  Then 
in task-base-extended RDEPENDS we have logic to do the common $bus I/O 
thing I was talking about.

So... wouldn't making the patch be DISTRO_FEATURES rather than 
MACHINE_FEATURES be what people want?

-- 
Tom Rini
Mentor Graphics Corporation


