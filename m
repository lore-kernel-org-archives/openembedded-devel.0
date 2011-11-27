Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RUiR7-0005g6-4W
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 18:22:43 +0100
Received: by qaea17 with SMTP id a17so687400qae.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2011 09:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=jikfgAzMKYrt0/sNeFef4cO5+lgMrFaHdGd0GxUxqWA=;
	b=ceKBQfxFovIFJrnIzWTkr4lVip+S87b4Y7G4+KmL4bPg+Qcx4KCTi90YIjibddM2gS
	Maami8H6n0ohXO7Q4dC03XntRDr72g4uvixI8PkyokZ5QbHoLphHC1zfn9omb+BW2CFw
	KF6fyPGLF26lQPmgFprwEJjD881V3vbmNJmS0=
MIME-Version: 1.0
Received: by 10.224.180.131 with SMTP id bu3mr12780685qab.5.1322414159257;
	Sun, 27 Nov 2011 09:15:59 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sun, 27 Nov 2011 09:15:59 -0800 (PST)
In-Reply-To: <CACW_hTZonV9m3U+gUTBBG2hEL2C9hzDLJrdZt+nM7qcn2LunQw@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<CA+M6bX=Xs+ACNOXYfFafb__vGNVYX3y8g7zvLQvDiHyg=5yjRw@mail.gmail.com>
	<CACW_hTbDBOV9yikTqpeVDif1J0oCcEorj=vMB1BcRsZG=0gzKg@mail.gmail.com>
	<CA+M6bXkTP9BPgEx_3ykwKJuv73s+0WAsJH_NwRbFEo=ZERhC0A@mail.gmail.com>
	<CACW_hTZonV9m3U+gUTBBG2hEL2C9hzDLJrdZt+nM7qcn2LunQw@mail.gmail.com>
Date: Sun, 27 Nov 2011 10:15:59 -0700
Message-ID: <CA+M6bXmXavWA1ruhSQk4+ryvtnq3t9g-b7SGUkuB7=4tPaf3_Q@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Sun, 27 Nov 2011 17:22:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 27, 2011 at 2:55 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/11/26 Tom Rini <tom.rini@gmail.com>
>
>> On Sat, Nov 26, 2011 at 8:45 AM, Frans Meulenbroeks
>>
>> >
>> > Well, there is at least the issue of machines and architectures.
>> > Now it is probably not too big a deal to bring over a new machine and
>> turn
>> > it into a BSP layers, but adding another architecture is yet another
>> thing.
>> >
>> > We do have products that are based upon NIOS II. This architecture is
>> > present in OE classic and not in OE core.
>> > One of the issues is that the NIOS II toolchain is still based upon
>> (iirc)
>> > gcc 4.1.1
>> > I do not see an upgrade of gcc/niosii happen in the near future (In th=
e
>> > past I did spent some time to see if I could move to a newer version, =
but
>> > there were some issues, and afaik no one is working on this atm), and =
I
>> > doubt oe-core is interested in having a 4.1.1 toolchain around.
>>
>> An external toolchain should be fine. =A0You should also be able to put
>> that gcc & company into meta-niosii. =A0If you can't, then IMHO, there's
>> a problem someone needs to look at. =A0But I suspect there isn't a
>> problem doing that.
>>
>
> In oe-classic it is not an external toolchain. It is also a CPU
> architecture.

Right.  I'm saying that on the path to migration using OE classic to
export a NIOS II toolchain as an external toolchain and having
meta-niosii start by using that would save some headache.   Get the
basics building and working then bring in the toolchain.

> It mgiht be possible to make an external toolchain for it, but that does
> not allow
> saying things in recipes like: FILES_niosii +=3D in other recipes (iirc t=
here
> are a few of these)
>
> Moving the recipes to meta-niosii could also be done, and is probably
> better as the toolchain is a set of OE recipes. I'm not sure if it is
> possible to solve the ARCH problem that way, but one might get away with =
it
> by e.g. bbappend-ing in all relevant recipes. This seems a fair amount of
> work, so I guess this is not going to happen overnight.

Yes, meta-niosii would have some bbappend files and a copy of a few
bbclass files until those parts ARCH parts can be merged.

[snip]
> I feel that if meta-oe is considered an openembedded layer, its guideline=
s
> should be made clear.

Agreed.

--=20
Tom


