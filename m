Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NYELs-0006a3-SD
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 08:54:48 +0100
Received: by yxe5 with SMTP id 5so765821yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 23:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rTjB8oD5w0Thcyad2t1cizE/D6PihLdRn07A1zQ4r28=;
	b=N3taXcfgaMO8/OJszTVsaIoovXbCJDwAE0rgnMzOuXXGCVj+YvjGXBXWZNSyn2UOyd
	ElM2LIm7lrDjLN1X1M2+kuPOthJM0tQevsboUU+2Z9CPZ5oEEXs6sQflsihUl1sQVITh
	iu5k19KdL3SB9J5blSMehqzay7FGyWwW6p9Gg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YNHlrFysIhqZ5FwXrWMaySf9PgDcJb9aLEaBQlkqJSQqUg/n1cIh5SkmRRZDQFgXY8
	5uhKtAg3TSlLSWsdh4W9S3zBkvYOIxrMNwwJWcRGWhD06Xcu2NXrvdJ0tOJ5Dz5UJ5ln
	p3J/XIlp8vQDQC8OaswLwY+pQuAyw1IMUgZiM=
MIME-Version: 1.0
Received: by 10.101.10.6 with SMTP id n6mr2394975ani.60.1264146746762; Thu, 21 
	Jan 2010 23:52:26 -0800 (PST)
In-Reply-To: <1264114415.457.1069.camel@lenovo.internal.reciva.com>
References: <1263760344-26105-1-git-send-email-eric@eukrea.com>
	<hivtt3$v2r$1@ger.gmane.org>
	<1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>
	<hj09k8$km$1@ger.gmane.org>
	<1263820243.3675.560.camel@mill.internal.reciva.com>
	<1263824896.26227.112.camel@dax.rpnet.com>
	<hj21vd$32h$1@ger.gmane.org>
	<1264114415.457.1069.camel@lenovo.internal.reciva.com>
Date: Fri, 22 Jan 2010 08:52:26 +0100
Message-ID: <ac9c93b11001212352s479136d7ge27afe3433afe5c2@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: include default PR or not (was: [PATCH] barebox: Add recipe for this new bootloader)
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
X-List-Received-Date: Fri, 22 Jan 2010 07:54:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/21 Phil Blundell <philb@gnu.org>:
> On Mon, 2010-01-18 at 17:24 +0100, Rolf Leggewie wrote:
>> Richard Purdie wrote:
>> > On Mon, 2010-01-18 at 13:10 +0000, Phil Blundell wrote:
>> [...]
>> >> only way we will get a definitive answer would be to have the TSC han=
d
>> >> down a judgement on the matter.
>> >
>> > That would seem sensible if only to lay this matter to rest once and f=
or
>> > all! It would also be good to test the TSC processes...
>>
>> I would think this is too minor for the TSC to bother. =A0But if you wan=
t
>> to take it on, why should I object? =A0It does take up bandwidth on this
>> list from time to time, so much is true. =A0Personally, I don't think th=
e
>> best option would be to rule in favor of one or the other faction,
>> because that's what it would be seen for. =A0I don't think the TSC can
>> really win and resolve this issue.
>
> I'm not entirely sure what point you are making about it being
> undesirable for the TSC to "rule in favour of one or the other faction".
> One of the primary roles of the TSC is to resolve or adjudicate disputes
> between developers and, since such disputes are often binary issues by
> their nature, it seems likely that in a lot of cases this is going to
> boil down to having the TSC accept the viewpoint of one party and reject
> the viewpoint of the other. =A0It would certainly be a shame for the TSC
> to shy away from making a decision just because it might be seen to
> agree with one group and disagree with another.

Actually the # of options for TSC are somewhat bigger.
A decision could be that X is the required way of working and !X is not ok
However, it can also be weakened into making X is the preferred way
and !X less desirable (without forbidding it)
And there is still the option to leave X as a personal preference to
the developer.

For PR, guess my suggestion would be to have PR=3D"r0" as preferred and
not having PR as less desirabe.
But if you make a change bumping PR (or adding PR=3D"r1", if no PR
exists) is required.

Frans
>
> A large part of the reason for having the TSC in the first place was to
> establish a group of people who were empowered (and, indeed, obliged) to
> make decisions, and I think this is a fairly good example of a situation
> where simply having a decision of some kind is more important than the
> detail of what exactly that decision is.
>
> This particular issue is clearly somewhat trivial and, whichever
> viewpoint prevails, the impact in the real world is going to be fairly
> small. =A0But it has cropped up on this list several times now and it
> seems equally clear that, so long as it remains unresolved, it will
> continue to waste everybody's time and contributors will continue to be
> baffled as to what exactly they should put in their patches in order to
> get them applied.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


