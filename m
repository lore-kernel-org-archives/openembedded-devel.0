Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oj3ga-0001MV-IM
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 07:17:09 +0200
Received: by eyx24 with SMTP id 24so42626eyx.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 22:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=g/FdTzR3V+K/C1iR6PhOUEtep6h0FOPb1c55ingfQAg=;
	b=CAcRejd5A0/2Q+AYlHEWg1BOHyDRZ5NwMSnNi/Kq7Umg1LayLRHiFfM3YqDqjcTJCy
	6YIDsIqL7XGzn8B5ECmt18yM+TdmOqz0yInhBWPxHgrv7wSFiwzNemsAABLHu8joVbtA
	R5+wGpsm5sA8ijqbxWlCGbPbQSKcj11KA8PDA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=r7dr6OQJXKNauyjaTDKobngd6yG+Eri2dHqbI5NcHHJU296PFUqf7qBeP2GxeRQ0jR
	AWCM3tJF9kg2UEa6xXdvxKT0lQcvp9fz+10G0bTXIV9x/SvP5vL+SExXQCrE5WJdqh6w
	AzNbZtIHa5635QwzBMd1GFOF1RTysE+DutDsM=
Received: by 10.213.25.130 with SMTP id z2mr14707272ebb.12.1281503813196; Tue, 
	10 Aug 2010 22:16:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.213.35.135 with HTTP; Tue, 10 Aug 2010 22:16:33 -0700 (PDT)
In-Reply-To: <AANLkTikUdG4hRo1wJmObU1g5fomeuViCirSBsVFCEYYZ@mail.gmail.com>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world> 
	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com> 
	<AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com> 
	<AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com> 
	<i3se2n$gj7$1@dough.gmane.org>
	<AANLkTikUdG4hRo1wJmObU1g5fomeuViCirSBsVFCEYYZ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Aug 2010 22:16:33 -0700
Message-ID: <AANLkTimVFCKL+M_c0rb=Zu0cktc0_QZQzZikR_T63Wj2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why PREFERRED_VERSION setting of <distro>.conf overrules local.conf setting ?
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
X-List-Received-Date: Wed, 11 Aug 2010 05:17:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2010 at 1:56 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Tue, Aug 10, 2010 at 1:50 PM, Koen Kooi <k.kooi@student.utwente.nl>wro=
te:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 10-08-10 01:15, Graham Gower wrote:
>> > On 10 August 2010 04:31, Frans Meulenbroeks <fransmeulenbroeks@gmail.c=
om>
>> wrote:
>> >> 2010/8/9 Chris Larson <clarson@kergoth.com>:
>> >>> On Mon, Aug 9, 2010 at 6:26 AM, Hauser, Wolfgang (external) <
>> >>> Wolfgang.Hauser.external@eads.com> wrote:
>> >>>
>> >>>> Hello,
>> >>>>
>> >>>> I want to change some used versions of packages, so I added a
>> >>>> PREFERRED_VERSION_<package>=3D"xxx" for the packages I want to have=
 a
>> >>>> special(newer) version to be used.
>> >>>>
>> >>>> But e. g. for busybox the version defined in the used <distro>.conf=
 is
>> >>>> used instead of my setting in local.conf.
>> >>>>
>> >>>> Should local.conf not overrule <distro/machine>.conf ??
>> >>>
>> >>>
>> >>> Conceptually, local should override everything, as it's the "most
>> specific"
>> >>> information available, but from a technical standpoint, we can't par=
se
>> the
>> >>> machine and distro configs until local.conf is parsed, as that's
>> usually
>> >>> where the MACHINE and DISTRO are set. =A0You can use a 'local' overr=
ide
>> to get
>> >>> around it, or you can ask the distro/machine maintainer to use ?=3D
>> >>> assignments (set only if unset).
>> >>>
>> >>> PREFERRED_VERSION_<package>_local =3D "xxx" is how you use the overr=
ide.
>> >>
>> >> The real solution woud be to either temporary store the
>> >> PREFERRED_VERSION and apply it later on.
>> >> Alternately we could parse local.conf twice, the first time ignoring
>> >> the PREFERRED lines, and the 2nd time only looking at these.
>> >> Yet another solution could be to split local.conf into two pieces, on=
e
>> >> with settings like MACHINE and DISTRO, the other one with the
>> >> overrides.
>> >
>> > Wouldn't it be far simpler to fix the distro conf file(s)? E.g. apply
>> > something like this:
>> > s/^PREFERRED_VERSION_\([a-z]*\) =3D/PREFERRED_VERSION_\1 ?=3D/
>>
>> What's the point of setting a preferred version at all if you make it a
>> weak assignment?
>> The distro nearly always knows better and if you want to use a different
>> version, sending a patch to change that version for review isn't exactly
>> rocket science.
>
>
> How about having decent usability? =A0The user asking for something and n=
ot
> getting it is completely unintuitive. =A0If the user doesn't know what th=
ey
> want, they won't request a specific version. =A0If they do request it, th=
ey
> should get it, anything else is an OE usability issue.

why not use _local override and I think if user want to alter
a distro choice I consider that user to be not a beginner.

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


