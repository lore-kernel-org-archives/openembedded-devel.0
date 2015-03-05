Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 808A16017E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 01:26:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t251QMSq025450
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Mar 2015 17:26:22 -0800 (PST)
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 17:26:21 -0800
Message-ID: <54F7B0BC.7010203@windriver.com>
Date: Thu, 5 Mar 2015 09:26:20 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Andreas Oberritter <obi@opendreambox.org>,
	<openembedded-devel@lists.openembedded.org>
References: <1425449908-22847-1-git-send-email-wenzong.fan@windriver.com>
	<54F6CC88.8080402@opendreambox.org>
	<54F6D3AA.3010302@windriver.com>
	<54F6E640.1010903@opendreambox.org>
In-Reply-To: <54F6E640.1010903@opendreambox.org>
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
X-List-Received-Date: Thu, 05 Mar 2015 01:26:24 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2015 07:02 PM, Andreas Oberritter wrote:
> On 04.03.2015 10:43, wenzong fan wrote:
>> On 03/04/2015 05:12 PM, Andreas Oberritter wrote:
>>> Dear Wenzong Fan,
>>>
>>> On 04.03.2015 07:18, wenzong.fan@windriver.com wrote:
>>>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>>>
>>>> The smb, nmb, winbind services have been disabled for systemd system
>>>> by default, disable them for sysvinit as well.
>>>
>>> why would anybody install these services without the desire for using
>>> them? Did the patch disabling them for systemd get merged by mistake? I
>>> remember Paul objecting to it.
>>
>> The samba is not a common service that required by system, especially in
>> some security environment, it should be configured correctly first -
>> This is why I incline to disable it by default.
>
> This doesn't convince me, as the line you're drawing between samba and
> other services seems to be chosen arbitrarily.
>
> "git grep INITSCRIPT_PARAMS.*disable" shows no results in both
> openembedded-core and meta-openembedded (dizzy). So samba will be the
> first and only service that's disabled by default and requires manual
> intervention by the user? Why don't you ship a safe configuration instead?
>
> As Paul stated, the distro is responsible for correct configuration.
> IMHO there's no reason to deviate from common behaviour just because
> samba seems to be less safe than any other network service in your view.
>

Ok, thanks for your advises, I agree with you.

Please maintainer ignore my patch.

>> Yes, it did - this may give me some hints that it should be disabled ...
>
> Unfortunately I don't understand what you're referring to here.

Sorry for the confusion, it answered you second question about if "the 
patch disabling them for systemd get merged by mistake?".

Yes, the patch for systemd has been merged - It gives me hint that it's 
a proper behavior for samba, but looks it isn't ...

Please refer to the commit: 20a624928c030fa13d8b7d45b4f4d7e1ac624f60

It should be reverted now!

Thanks
Wenzong

>
> Regards,
> Andreas
>
>

