Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nk76z-000524-Ij
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 03:36:32 +0100
Received: by iwn9 with SMTP id 9so3967536iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 18:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=n5GweVRcCvv+G28R+UzgrVsz+1WFW+JDlv78z5CEkls=;
	b=VbNPKt/s8+SLA8dARyqbd8Ne1ucDeViUSX/RIMjs9E8rOJEZxstTCZUjAhpW4N7wn2
	94u85ucaGKRj9nZGdacLr0QlfPlRLkdYNSDHUz801+OKIc7HeohD7DRX5joXa7w1Mxxo
	RcKwxJpsIQp1evGdj0EUVfSw9KgIHJdh9Gpco=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kVBgbfys0qwM2zapHA1X2jOJvQj1S8LJew1nd0Olkr0Ks6/PoNwFq6Mpj8/LEJwf9D
	YRXBcwTOE+wWF8Y7UMTJxni85GDwctP5ZJ9WBwSypsynlRh9QSP2FyAuVReTdCTJ6PVU
	nYlK0yqrO0gkKbnSzLRrjeSvgxy990WzHhVVg=
MIME-Version: 1.0
Received: by 10.231.154.8 with SMTP id m8mr3518902ibw.2.1266978823834; Tue, 23 
	Feb 2010 18:33:43 -0800 (PST)
In-Reply-To: <1266973598.18176.366.camel@trini-m4400>
References: <mailman.5.1266922802.8892.openembedded-devel@lists.openembedded.org>
	<4B83DD5C.8050408@tycoelectronics.com> <4B8458A7.40807@balister.org>
	<19c1b8a91002231509v4a7d870dia190e9aa2c0f6739@mail.gmail.com>
	<4B847891.7030706@balister.org>
	<1266973598.18176.366.camel@trini-m4400>
Date: Tue, 23 Feb 2010 18:33:43 -0800
Message-ID: <19c1b8a91002231833v44b6ce07r22f9ea33c073f8dd@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How to build g++ to run on target?
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
X-List-Received-Date: Wed, 24 Feb 2010 02:36:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2010 at 5:06 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On Tue, 2010-02-23 at 16:53 -0800, Philip Balister wrote:
>>
>> On 02/23/2010 03:09 PM, Khem Raj wrote:
>> > On Tue, Feb 23, 2010 at 2:37 PM, Philip Balister<philip@balister.org> =
=A0wrote:
>> >> On 02/23/2010 05:51 AM, Jay Snyder wrote:
>> >>>
>> >>> I was able to build gcc for installation directly onto the OE target
>> >>> with "bitbake gcc". "bitbake g++" gives me "nothing provides g++".
>> >>>
>> >>> What is the magic bitbake command to provide this?
>> >>
>> >> bitbake task-sdk-native, and install task-native-sdk. Anyone know why=
 the
>> >> task creates a package with different name?
>> >
>> > may be because
>> >
>> > task-sdk-native.bb:RPROVIDES_${PN} =3D "task-native-sdk"
>>
>> I know that :) I am curious why the renaming.
>
> And if perhaps we couldn't get a different name altogether? =A0'native'
> has a meaning normally that's not what it means here.
> task-on-device-sdk is a bit wordy, but avoids 'native'. =A0Of course,
> 'native development' also has a meaning too.. RPROVIDES perhaps? =A0Or is
> that just the worst of both worlds..

yeah thats a good point. although native is not as bad but in context
of OE we already
assigned native to something that this task does not do. So using something=
 like
what you suggest or task-target-sdk would be nice.

to answer the original question I think RDEPEND was added for fixing
upgrade channels on existing systems.

>
> --
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


