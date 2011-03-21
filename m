Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1Vlq-0002eF-C3
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 04:27:06 +0100
Received: by fxm19 with SMTP id 19so5085472fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Mar 2011 20:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Q9j/sDavQDH4xoBXQt3o0FqHOQvg1XFF/y12W2XhQ7s=;
	b=FQem3eXxpaEkxtbTsgkJ6PhGaE9uIHamOxS+UnddtnD1K7e5SwzQdf2yufx98a+ZWD
	CwlvgE5hhnbkpxP2hOAkFEHW+X0bNa4pmKH0e58nOffF3DBvRt87O/e/jDt+WhmNVc6+
	bVUMRB//ACMz2piH+D/HFFrXjurDBfVr3LMlM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=WtFVZi6QvOzec8SJUgcCVSPtTfxba2Fmo5H0cfd+1fdk3nyWjEnLnticIUkqE8gRwG
	Vf8jW2iAuPnZzwIG8XXKmFB8zfIOv/Q8I72NALYY6JzcaT1xlNrzeUkMfDfo5TQ+MidN
	m8tBNLYyHhRcAh5sQZJiaz3fzC7qOGEuFyW0w=
Received: by 10.223.78.138 with SMTP id l10mr1391834fak.106.1300677918121;
	Sun, 20 Mar 2011 20:25:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Sun, 20 Mar 2011 20:24:48 -0700 (PDT)
In-Reply-To: <4D86B486.6030205@mentor.com>
References: <20110311081950.GG7353@excalibur.local>
	<1300385432.2298.33.camel@saphir> <1300396447.30423.2113.camel@rex>
	<AANLkTi=9DUeh3eyaW=fQciA_Qk51yvqbBP_792n8fwQD@mail.gmail.com>
	<4D86B486.6030205@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Mar 2011 20:24:48 -0700
Message-ID: <AANLkTinw6OQ=RapEaet6zYfGe9tjx-AD6XT1N=cTrdHU@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE Bugzilla Future
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
X-List-Received-Date: Mon, 21 Mar 2011 03:27:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 20, 2011 at 7:14 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 03/18/2011 12:57 AM, Frans Meulenbroeks wrote:
>>
>> 2011/3/17 Richard Purdie<richard.purdie@linuxfoundation.org>:
>>>
>>> On Thu, 2011-03-17 at 19:10 +0100, Michael 'Mickey' Lauer wrote:
>>>>
>>>> I'm in favor of keeping it, cleaning it up, and improve
>>>> the integration with patchwork / git. Throwing it away
>>>> would be a very bad sign to all those countless people
>>>> who've gone through the pains of actually working with
>>>> the bugtracker.
>>>
>>> The simple question is who is actually going to sort out the mess its
>>> in?
>>>
>>> Who is going to look after it on a continuing basis?
>>>
>>> If there isn't ownership, nothing is going to change.
>>
>> Actually I feel the real problem is that:
>> - people did not want to get bugs assigned to them (at least that was
>> what someone told me in the past)
>> - we're lacking a good notion of package or recipe ownership, so even
>> if we had someone acting as a bug manager, (s)he would have a hard
>> time to find out who to assign an issue to.
>>
>> and of course it takes discipline to look at regular intervals in the
>> bug tracker to see if there are issues that affect the recipes you
>> feel responsible for.
>> A discipline that few people have and that is also easy to forget if
>> there is only very rarely something for you.
>>
>> So it is more of a process issue.
>> (btw this may be something that could be picked up by the TSC).
>
> The feeling of the TSC thus far has been "where are the active volunteers=
 to
> use BTS (bugzilla, whatever)". =C2=A0This far in the thread I count one.
>

Yes I think if there is enough interest to take this up probably it
would make sense to form
a interest group and let the group work details on process and
maintenance an recommend
something.

> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


