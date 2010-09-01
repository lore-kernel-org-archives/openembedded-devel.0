Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OquiU-0000GA-L4
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 23:19:36 +0200
Received: by gya6 with SMTP id 6so3447935gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 14:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=lF5xDNPUTCiAfG9TCASy3umxKfpidmb5qhVsmDPGQFU=;
	b=QAHrirQwMQAcafmnRY1jtuI9VYBjt7YMY5GycDI3T7IFgWLWZnf357HgG02XEp1X1P
	57zOdVA1aHK89BcLWnhZGueLvbNAIJVpBqerU/s9lSyRAA/djeYXyPIsLLTewEKplFeW
	2HGERHcQux1CZ/cZb/Ui1ONOVA4aDf4ZOUby8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UD9YkMIsh09tWhCPKD0+rDiARBR0DZqkaTyoC1U17jio7ipSDeO3HpYQCeyG82Phyo
	4+cDb4CmFHrtBJ/tF11dZv7X+RJxt6AA36YL9iVsytJNsloRNbmNjUsKV7HgzukV2HPs
	sonJiR1gthFt6rB1pHklOeUpOEL5d4alIc2Fg=
MIME-Version: 1.0
Received: by 10.151.79.18 with SMTP id g18mr4668565ybl.166.1283375936159; Wed,
	01 Sep 2010 14:18:56 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 1 Sep 2010 14:18:56 -0700 (PDT)
In-Reply-To: <AANLkTimEE4VSR3C6XSQUCYXTgbA1m=Zdw1f8w9vm76_X@mail.gmail.com>
References: <AANLkTimeV1FbwQCMYL7WH3tuo_zwcYX1o9cs1H66VPhu@mail.gmail.com>
	<AANLkTinqVEs+Uh6jNJJVzqjE2SXMbM1ni60nUx+qtXka@mail.gmail.com>
	<AANLkTimamK0_tQw32zWAuANT2fBTDgSHUdPZPWbe-E-3@mail.gmail.com>
	<AANLkTimEE4VSR3C6XSQUCYXTgbA1m=Zdw1f8w9vm76_X@mail.gmail.com>
Date: Wed, 1 Sep 2010 23:18:56 +0200
Message-ID: <AANLkTimwWFkDscFgDvQQzNbXm+t4SXKnCbWQobK2nu9U@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libxml-namespacesupport-perl stuck in do configure
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
X-List-Received-Date: Wed, 01 Sep 2010 21:19:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/1 J. L. <vwyodapink@gmail.com>:
> Thanks Frans that fixed it by setting up CPAN on the build machine :)

J.L, thanks for reporting this back.

Actually we do need a real fix for this.
any perl wizards that can take this up?

Frans
>
>
>
> On Wed, Sep 1, 2010 at 1:16 PM, J. L. <vwyodapink@gmail.com> wrote:
>> so if i set up CPAN properly on the build machine that should get
>> through that part? Did I understand that properly? I will try that out
>> though, thanks a ton for the response. I will post if that works or
>> doesnt regardless
>>
>>
>>
>> On Wed, Sep 1, 2010 at 1:08 PM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> 2010/9/1 J. L. <vwyodapink@gmail.com>:
>>>> I am trying to get this to build and it seems to be stuck on the
>>>> do_configure part, I let it run for over 24 hours before killing it
>>>> and when I tried to alt C to kill it, it endlessly looped showing
>>>> something about selecting the country your in and loops through the
>>>> choices endlessly the only way I could kill it fully was to close the
>>>> terminal. I noticed in May someone else brought up this or a very
>>>> similar issue, what is the work around and or fix for this? Thanks for
>>>> any help or tips
>>>
>>>
>>> I think I had this once too.
>>> Not sure how I solved it, it is quite some time ago.
>>> However, it could be that I configured cpan manually on the host system
>>>
>>> No idea how to fix this permanently.
>>>
>>> Frans
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


