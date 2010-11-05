Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PER1P-00024v-5b
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 19:28:20 +0100
Received: by gyf3 with SMTP id 3so2519842gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 11:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=kLOn5ovH2GdtRlkrG91Bg6ojA0WWB4KVq70B3ER3oI0=;
	b=PuPcGHPXEEuts4XVf/1XmFaDVRPoaKSFtGabWwF01FuSJVkCHgSvePpJh0DoAhe0SE
	gTIOQzT7xJNDEZd/bMMUgBbdQhXHtZUvJopmJzI1ginsIgIAdhgkr+aM0lB9euTzuWiz
	1f3Y+RWGERgOid+jxwmjBtKb68HT0GGjag7aw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=l++KdPXi5e3BZK54dvMvThl7lVj4ReDUogyrYOpgz5ECKUxKrO6oCmA8mSjIeon0w2
	YXi3aMOlLASs1TQu6tg6UTvOHjHqoL+eoqm9fP0Ko/UmF2NaFWFDUCIjckFTZAXCxbJ6
	y0/0DjKEYngoc3AJeKaZG+l9DSqPZYAfXWnOE=
Received: by 10.90.15.31 with SMTP id 31mr1708185ago.10.1288981644740; Fri, 05
	Nov 2010 11:27:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 5 Nov 2010 11:27:04 -0700 (PDT)
In-Reply-To: <20101105165711.GC6115@denix.org>
References: <AANLkTin8J-vi624U2Z4Emr=Zajq0+CsSnFR=a8+kjuOv@mail.gmail.com>
	<20101105010014.GA6115@denix.org>
	<20101105073448.GD3702@excalibur.local>
	<20101105165711.GC6115@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Nov 2010 11:27:04 -0700
Message-ID: <AANLkTinxOZKKWT-p9fScB7sQ4ku8MrTEPVwmk-XQD4Tf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Moving to layered structure of openembedded metadata
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
X-List-Received-Date: Fri, 05 Nov 2010 18:28:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 5, 2010 at 9:57 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Nov 05, 2010 at 08:34:48AM +0100, Stefan Schmidt wrote:
>> Hello.
>>
>> On Thu, 2010-11-04 at 21:00, Denys Dmytriyenko wrote:
>> >
>> > That is already being discussed and decided. See the following previou=
s topics
>> > on the mailing list...
>>
>> To clear this up a bit. There can't be a real decision for now. Not all
>> developers have been present at the OEDEM and we haven't discussed =C2=
=A0every detail
>> their either. :)
>>
>> Most, if not all, people liked the idea during the OEDEM discussions, bu=
t we
>> would need more input on problem that this may rise. As it stands I'm ha=
ppy to
>> see Khem coming up to put this on the ml. :)
>>
>> One I currently see is how we can keep it all working when the layers ar=
e
>> maintained in different places and what kid of combinational explosion w=
e will
>> have with layers in different places.
>
> That is exactly what I said - being discussed and (being) decided. I didn=
't
> say it was or has been already decided. "Being" is not the same as "been"=
! :)
> I.e. present continuous instead of past tense.
>
> And BTW, it may not be a simple decision after all - while technically Yo=
cto
> seems quite a decent project and embracing it would be reasonable, many l=
arge
> companies are still having issues with it's governance model and past iss=
ues
> with Intel's other seemingly "open source" projects... The good news is t=
hat
> this side of the problem is now being actively looked at for any possible
> solutions, which would benefit all involved...
>

My proposal is to align OE and poky and in turn for benefit of community.
Yocto as I understand has a bigger scope and uses OE/poky for the
build system that it uses. Which in
general is also good for OE development. If we design the layers well it wi=
ll be
very portable and componentized. How yocto itself operates is probably
is a separate thing
they may make some good moves which benefits OE and thats what we
should be interested in
and concerned about and I am sure that if we do something that is
beneficial then yocto using poky
build system will definitely like it too.

> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


