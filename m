Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P7k2d-0004vj-Cl
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 09:21:56 +0200
Received: by iwn2 with SMTP id 2so865324iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 00:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=QmA66OwiiLUhDjN13uc+nNAapAQk8Jvpgi/A8r0omF0=;
	b=Qe6r/MQ8x9ac0ZWsNIwB2OAcdn5ROF/GUfqJqtjUAV+iua8dnHYKI289490Ld3Syfo
	wOz48lVZY0J2AxZMajOTexG3ZkqMUTDNjJfC6F93NTHTcuZmjPoxvh1jFaCK8kHM1cJp
	9NPtcKbu5xthtdXN8ww+lVKakhLcMjrOwT62w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Sj2PEni6KQ7xwAiX8Awl5nb7S8DNjZvT71zpUfvghioVEsnIU4Iu3AW9D3GQHbKOCs
	DzIvXpV36imcbp5I1P8AJ/VSxcf4B5q5/B2+haygyhcER7D9Ds8NXrwUL5cBdoCa4UR2
	rWYwoac3LrdCwbJo+3SHDqepSqBMUlyR9K7FY=
MIME-Version: 1.0
Received: by 10.42.164.135 with SMTP id g7mr2032334icy.80.1287386483670; Mon,
	18 Oct 2010 00:21:23 -0700 (PDT)
Received: by 10.231.162.68 with HTTP; Mon, 18 Oct 2010 00:21:23 -0700 (PDT)
In-Reply-To: <AANLkTinUi=O9604uzP_sNSxz3dG1TRn0F=5tTnTtVCz9@mail.gmail.com>
References: <AANLkTim=u-zVopYCjUxyv_ogxxxA3MU_FkUfh5u-LfAP@mail.gmail.com>
	<AANLkTinUi=O9604uzP_sNSxz3dG1TRn0F=5tTnTtVCz9@mail.gmail.com>
Date: Mon, 18 Oct 2010 17:51:23 +1030
Message-ID: <AANLkTino0E3e-4BJashk=_dhHsnCYxgsmvnX0Nb2Dgs-@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: lirc_0.8.6+cvs20100613: do_package hangs
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
X-List-Received-Date: Mon, 18 Oct 2010 07:21:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 October 2010 17:45, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/10/18 Graham Gower <graham.gower@gmail.com>:
>> This is quite reproducible, but nothing has changed in the lirc recipe
>> recently (certainly not since it last built successfully for me).
>>
>> I'm out of my depth with this one.
>>
>> -Graham
>
> I've been peeking at this last week (also bumped into it) and have
> discussed it with and send email to kergoth.
>
> Issue seems to be that there are some tasks (like package_do_package)
> have an empty run file.
> When this file is passed to bitbake eventually it tries to exec these
> files and it seems to hang forever (I'm not too familiar with python
> but my guesstimate is that when exec gets an empty file it will read
> from stdin or so (and so waits forever).
>
> I could not find whether the generated files really should be empty
> (and were empty before) or when the problem was introduced (I did a
> rebuild from scratch a week or two weeks ago and didn't get the
> problem then, but could not spot any suspicious commits during that
> time period, and didn't have the time to do a bisect on this.
>
> Then again I noticed Khem pushed 0.8.7 a few hrs ago. Hope that that
> one will solve the problem. (although we should fix the root cause)
>
> Frans

I spoke with Khem about this on IRC. He tracked the problem down to this change:
http://patchwork.openembedded.org/patch/3189/

-Graham


