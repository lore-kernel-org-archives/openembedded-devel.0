Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nk8UL-0004rc-A0
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 05:04:44 +0100
Received: by iwn9 with SMTP id 9so4024442iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 20:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5Z5M9HBMRwiEPe+nhVp2piheWgQQ2kCgtdlS0PpPR1U=;
	b=rlyJFsGKNAWtoPix0tgTB1YWA8lyntyWyppXnN+roAhDdDIMT8fqgwOu3X2uLhRb0w
	LJYPi4AIBSbWo9WH5u8iHmr8BZDxYep0uBE9GnbNZKVsZxrLfqhJbPk1ovkoZImr/8wQ
	XdujVyeYlZTCGJszwk6/gcVFa8qQTadXf4lsM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=p+ECvJUVIojh229qwYtgVDIuuGk0ydKuc6IlJfGdb9OFRlSp4Co9htXLJ+QnF8CSbp
	XC+LEYls0kmc0BsuoY3MfNHDlMfsjwDt10C+Uak5xx0HTGLaQo5IiaaHXJiYb7XiDdcL
	9Yk76QkCxm0ya269E3nS3SOLL4uENyqCvwvIk=
MIME-Version: 1.0
Received: by 10.231.145.206 with SMTP id e14mr1660475ibv.10.1266984114953; 
	Tue, 23 Feb 2010 20:01:54 -0800 (PST)
In-Reply-To: <20100224030833.GD27420@denix.org>
References: <mailman.5.1266922802.8892.openembedded-devel@lists.openembedded.org>
	<4B83DD5C.8050408@tycoelectronics.com> <4B8458A7.40807@balister.org>
	<19c1b8a91002231509v4a7d870dia190e9aa2c0f6739@mail.gmail.com>
	<4B847891.7030706@balister.org>
	<1266973598.18176.366.camel@trini-m4400>
	<19c1b8a91002231833v44b6ce07r22f9ea33c073f8dd@mail.gmail.com>
	<20100224030833.GD27420@denix.org>
Date: Tue, 23 Feb 2010 20:01:54 -0800
Message-ID: <19c1b8a91002232001r17a422aeg9f8d0ffbc2246f9c@mail.gmail.com>
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
X-List-Received-Date: Wed, 24 Feb 2010 04:04:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2010 at 7:08 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Feb 23, 2010 at 06:33:43PM -0800, Khem Raj wrote:
>> On Tue, Feb 23, 2010 at 5:06 PM, Tom Rini <tom_rini@mentor.com> wrote:
>> > On Tue, 2010-02-23 at 16:53 -0800, Philip Balister wrote:
>> >>
>> >> On 02/23/2010 03:09 PM, Khem Raj wrote:
>> >> > On Tue, Feb 23, 2010 at 2:37 PM, Philip Balister<philip@balister.or=
g> =A0wrote:
>> >> >> On 02/23/2010 05:51 AM, Jay Snyder wrote:
>> >> >>>
>> >> >>> I was able to build gcc for installation directly onto the OE tar=
get
>> >> >>> with "bitbake gcc". "bitbake g++" gives me "nothing provides g++"=
.
>> >> >>>
>> >> >>> What is the magic bitbake command to provide this?
>> >> >>
>> >> >> bitbake task-sdk-native, and install task-native-sdk. Anyone know =
why the
>> >> >> task creates a package with different name?
>> >> >
>> >> > may be because
>> >> >
>> >> > task-sdk-native.bb:RPROVIDES_${PN} =3D "task-native-sdk"
>> >>
>> >> I know that :) I am curious why the renaming.
>> >
>> > And if perhaps we couldn't get a different name altogether? =A0'native=
'
>> > has a meaning normally that's not what it means here.
>> > task-on-device-sdk is a bit wordy, but avoids 'native'. =A0Of course,
>> > 'native development' also has a meaning too.. RPROVIDES perhaps? =A0Or=
 is
>> > that just the worst of both worlds..
>>
>> yeah thats a good point. although native is not as bad but in context
>> of OE we already
>> assigned native to something that this task does not do. So using someth=
ing like
>> what you suggest or task-target-sdk would be nice.
>
> Speaking of which, a collegue of mine was suggesting exactly the opposite=
 -
> "native" should be used exactly for this type of naming, when it's native
> development (regardless of whether it's on a target or on a host), and OE=
's
> use of "native" is wrong and should be "host" instead, i.e. "pkgname-host=
" :)
> I know it's a historical naming and cannot be changed easily...

yes if I was to start fresh I would do it this way but as I said before OE =
uses
native to denote something else as of now. If we were to change conventions=
 then
I would certainly use the more common naming as you mentioned.

>
>
>> to answer the original question I think RDEPEND was added for fixing
>> upgrade channels on existing systems.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


