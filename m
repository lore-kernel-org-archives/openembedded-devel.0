Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzlQM-000818-W2
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 08:45:43 +0100
Received: by pxi1 with SMTP id 1so340708pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 00:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=i8x/7+aEc8oek/cnInM9lgPTB/UfMT7vhhfQDI/UV9A=;
	b=uGemb3owdmE1AZeWT99vzoccGLysVDUguAk2lxZofLY23VLxR+wKnxaTYkPvcwYTfw
	813h6srRTpgfFSocBmBXqLH/I+bcdzfLo2QliW64XitoXpywDH7R7EVGdV85bSDggbDX
	i2AMeI/WkL0Cgsq7yEbbyxWdDARWcQFBMpbAk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=ucj4Z3pDiJ2mQWImA46/7iEiGstfpuZo/fK26tYpaohDYObTcweNJ8F1l42Yn0VB9/
	G/9tj6iOLqiAiIuIw3VHGOlhhrP8g5IBQPCUdryW37nuSgiR/8xdhry7LkhqQ0u2V1hw
	k+I7/WoBq7kF1sEeV8cIhHzpUNjtKjF+JI19U=
Received: by 10.142.150.5 with SMTP id x5mr379076wfd.419.1300261439417;
	Wed, 16 Mar 2011 00:43:59 -0700 (PDT)
Received: from [172.23.0.199] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id p40sm820795wfc.17.2011.03.16.00.43.57
	(version=SSLv3 cipher=OTHER); Wed, 16 Mar 2011 00:43:58 -0700 (PDT)
Message-ID: <4D806A30.1070003@gmail.com>
Date: Wed, 16 Mar 2011 00:43:44 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>	<1300180117.2522.14.camel@eha>
	<20110315220301.GC3042@denix.org>	<1300254477.2818.5.camel@eha>	<989A078976CDAD4CB2DC976EEF70E2A50547990E@eu2-mail.mgc.mentorg.com>	<4D8061DE.6030106@gmail.com>
	<AANLkTikfnLb0XW6B6M0s+w=VuOkaeq0=MrYwUniQ6B_x@mail.gmail.com>
In-Reply-To: <AANLkTikfnLb0XW6B6M0s+w=VuOkaeq0=MrYwUniQ6B_x@mail.gmail.com>
Subject: Re: Python-native dependency in libxml2
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
X-List-Received-Date: Wed, 16 Mar 2011 07:45:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/2011 12:28 AM, Frans Meulenbroeks wrote:
> 2011/3/16 Khem Raj<raj.khem@gmail.com>:
>> On 3/15/2011 11:22 PM, Ahsan, Noor wrote:
>>>
>>> Hello,
>>>
>>> I was looking at the libxml2 package. While going through the recipes I
>>> came to know that its native package depends on python-native package as
>>> well. This dependency is defined in libxml2.inc file.
>>>
>>> DEPENDS_virtclass-native = "python-native"
>>>
>>> This package build fine after removing this dependency. I am not clear
>>> why this dependency is being added in libxml2 package. Can somebody
>>> clear that to me. While looking at the git log I came to know that this
>>> change is coming from libxml2-native.inc file. But I am not clear why
>>> this dependency was added as this package build fine without it.
>>>
>>> Please help me in understanding this dependency. Thanks.
>>
>> Try to build this recipe from scratch and see if it still works then we can
>> remove the dep
>
> I'm not sure if that is the right way.
> It might well be that typically python-native is already there in a
> scratch build because some earlier package needed it (or even because
> of the scheduling of build steps.
>
> Probably a better way is to build with packaged staging (with staging
> dir outside TMPDIR) then rm TMPDIR and bake the package.
> Alternately peek into the package to see if it needs python. If it is
> needed then the DEPENDS should stay.


Did you read carefully what I wrote ?



