Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 88EF76E614
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2015 14:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 7BDF93151D12;
	Sun, 29 Mar 2015 16:35:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id T3aaAzX8UYbo; Sun, 29 Mar 2015 16:35:11 +0200 (CEST)
Received: from [172.22.22.61] (55d46b76.access.ecotel.net [85.212.107.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 75EDC3151D11;
	Sun, 29 Mar 2015 16:35:11 +0200 (CEST)
Message-ID: <55180D9F.3020604@opendreambox.org>
Date: Sun, 29 Mar 2015 16:35:11 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1425449908-22847-1-git-send-email-wenzong.fan@windriver.com>
	<54F6CC88.8080402@opendreambox.org>
	<54F6D3AA.3010302@windriver.com>
	<54F6E640.1010903@opendreambox.org>
	<54F7B0BC.7010203@windriver.com>
In-Reply-To: <54F7B0BC.7010203@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sun, 29 Mar 2015 14:35:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Martin,

On 05.03.2015 02:26, wenzong fan wrote:
> On 03/04/2015 07:02 PM, Andreas Oberritter wrote:
>> On 04.03.2015 10:43, wenzong fan wrote:
>>> On 03/04/2015 05:12 PM, Andreas Oberritter wrote:
>>>> Dear Wenzong Fan,
>>>>
>>>> On 04.03.2015 07:18, wenzong.fan@windriver.com wrote:
>>>>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>>>>
>>>>> The smb, nmb, winbind services have been disabled for systemd system
>>>>> by default, disable them for sysvinit as well.
>>>>
>>>> why would anybody install these services without the desire for using
>>>> them? Did the patch disabling them for systemd get merged by mistake? I
>>>> remember Paul objecting to it.
>>>
>>> The samba is not a common service that required by system, especially in
>>> some security environment, it should be configured correctly first -
>>> This is why I incline to disable it by default.
>>
>> This doesn't convince me, as the line you're drawing between samba and
>> other services seems to be chosen arbitrarily.
>>
>> "git grep INITSCRIPT_PARAMS.*disable" shows no results in both
>> openembedded-core and meta-openembedded (dizzy). So samba will be the
>> first and only service that's disabled by default and requires manual
>> intervention by the user? Why don't you ship a safe configuration
>> instead?
>>
>> As Paul stated, the distro is responsible for correct configuration.
>> IMHO there's no reason to deviate from common behaviour just because
>> samba seems to be less safe than any other network service in your view.
>>
> 
> Ok, thanks for your advises, I agree with you.
> 
> Please maintainer ignore my patch.
> 
>>> Yes, it did - this may give me some hints that it should be disabled ...
>>
>> Unfortunately I don't understand what you're referring to here.
> 
> Sorry for the confusion, it answered you second question about if "the
> patch disabling them for systemd get merged by mistake?".
> 
> Yes, the patch for systemd has been merged - It gives me hint that it's
> a proper behavior for samba, but looks it isn't ...
> 
> Please refer to the commit: 20a624928c030fa13d8b7d45b4f4d7e1ac624f60
> 
> It should be reverted now!

You applied this patch to jansa/master. Would you mind reverting
20a624928c030fa13d8b7d45b4f4d7e1ac624f60 instead, as discussed in this
thread?

Regards,
Andreas

