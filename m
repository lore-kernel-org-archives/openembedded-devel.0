Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id D39026017E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 11:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 19D9E3151394;
	Wed,  4 Mar 2015 12:02:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id VkBO7noU99MF; Wed,  4 Mar 2015 12:02:25 +0100 (CET)
Received: from [172.22.22.61] (55d473d5.access.ecotel.net [85.212.115.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 13EED3151384;
	Wed,  4 Mar 2015 12:02:25 +0100 (CET)
Message-ID: <54F6E640.1010903@opendreambox.org>
Date: Wed, 04 Mar 2015 12:02:24 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: wenzong fan <wenzong.fan@windriver.com>, 
	openembedded-devel@lists.openembedded.org
References: <1425449908-22847-1-git-send-email-wenzong.fan@windriver.com>
	<54F6CC88.8080402@opendreambox.org>
	<54F6D3AA.3010302@windriver.com>
In-Reply-To: <54F6D3AA.3010302@windriver.com>
Subject: Re: [PATCH][meta-oe] samba: disable services for sysvinit
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
X-List-Received-Date: Wed, 04 Mar 2015 11:02:31 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 04.03.2015 10:43, wenzong fan wrote:
> On 03/04/2015 05:12 PM, Andreas Oberritter wrote:
>> Dear Wenzong Fan,
>>
>> On 04.03.2015 07:18, wenzong.fan@windriver.com wrote:
>>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>>
>>> The smb, nmb, winbind services have been disabled for systemd system
>>> by default, disable them for sysvinit as well.
>>
>> why would anybody install these services without the desire for using
>> them? Did the patch disabling them for systemd get merged by mistake? I
>> remember Paul objecting to it.
> 
> The samba is not a common service that required by system, especially in
> some security environment, it should be configured correctly first -
> This is why I incline to disable it by default.

This doesn't convince me, as the line you're drawing between samba and
other services seems to be chosen arbitrarily.

"git grep INITSCRIPT_PARAMS.*disable" shows no results in both
openembedded-core and meta-openembedded (dizzy). So samba will be the
first and only service that's disabled by default and requires manual
intervention by the user? Why don't you ship a safe configuration instead?

As Paul stated, the distro is responsible for correct configuration.
IMHO there's no reason to deviate from common behaviour just because
samba seems to be less safe than any other network service in your view.

> Yes, it did - this may give me some hints that it should be disabled ...

Unfortunately I don't understand what you're referring to here.

Regards,
Andreas


