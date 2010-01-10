Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NTxQr-0003NT-DC
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 14:02:16 +0100
Received: by yxe5 with SMTP id 5so15454692yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 05:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ic2U1IAnJoxzf9blVRXju9uvEOrbTDTOkGwBAmsEFEM=;
	b=fC4rGACpvNdP6DJ3ywiocSoHSBGadADOFT49xs034i2SpSKfDHbN04gmyNaA/srNrB
	4ZM+9i99nGNc4RzftahWaiyWDdgid0dZ1YsEzNAEtPMQMvN+eiY85ugJUyYfHPVF8/wt
	QyDcyyXoSyFllNUATmUrHk95Rk9xr0MW92G98=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=utNdamBVvF+etZmUKNirpACCxgjDtylRVoos3n6BvAx47q2RPSjBTc0/fNPQ6KLa81
	Of6xET2wEFlyDSlR/htqwAByMy2iqbKpONxfT3F+3NSVnob/HiM0FVIGfKPSBELEHxFZ
	toFTMLpMXJGEufwydKb8WLHeo+0MM/tyRHUWA=
MIME-Version: 1.0
Received: by 10.101.7.31 with SMTP id k31mr2511568ani.83.1263128405161; Sun, 
	10 Jan 2010 05:00:05 -0800 (PST)
In-Reply-To: <1263127231.3163.3.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1260618520.3373.23.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091212173311.GA3730@rhein.zuhause.netz>
	<1260711980.3110.21.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091213141849.GG17995@ibawizard.net>
	<1260719131.3110.26.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263127231.3163.3.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Sun, 10 Jan 2010 14:00:05 +0100
Message-ID: <ac9c93b11001100500w4ba2cfdfuae4d91888aec5b4c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: environment variables in Makefile for cross compilation (was: package VDR for OE)
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
X-List-Received-Date: Sun, 10 Jan 2010 13:02:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/1/10 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Sonntag, den 13.12.2009, 16:45 +0100 schrieb Paul Menzel:
>> Am Sonntag, den 13.12.2009, 15:18 +0100 schrieb Petr =C5=A0tetiar:
>> > Paul Menzel <paulepanter@users.sourceforge.net> [2009-12-13 14:46:20]:
>>
>> [=E2=80=A6]
>>
>> > INCLUDES =3D -I${STAGING_INCDIR}freetype2
>> >
>> > to
>> >
>> > INCLUDES =3D ${CFLAGS}
>> >
>> > and in your recipe do:
>> >
>> > CFLAGS_append =C2=A0+=3D " -I${STAGING_INCDIR}/freetype2"
>>
>> Great. That worked.
>>
>> > > Furthermore is there a better way for upstream to set things up so t=
hat
>> > > no patching is needed? Or is autotools needed for this?
>>
>> I am still asking if upstream could change something to make the
>> Makefile cross compilable by default.
>
> Is there an environment variable for a handmade Makefile to make it
> cross compilable? Or is patching the upstream Makefile inevitable?

You can always have your own makefile in the recipe dir and overwrite
the existing one in a patch.
But personally I prefer patches to makefiles, as you can piggyback on
changes in the original makefile (or worst case, if the patch fails on
a newer version you know that some work is waiting.

Frans
>
> [=E2=80=A6]
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


