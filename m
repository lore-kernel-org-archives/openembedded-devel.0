Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RUPuF-0003q5-Ct
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 22:35:32 +0100
Received: by qyk30 with SMTP id 30so949691qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 13:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=c/ZBtgYFkV97k4mTlrG228gRIhMwEjPsz/h0g8dZZj4=;
	b=Ki4EGG+CKRfKGCrNfIbwFE62qwiRfaBxJ8gzDvtB0glIuiwII1Fogyt5eHj9uqgocm
	dPBv17BZMLbq40u4w3La3AIZK3SQdlzk/X8UMVtlUj2dLLk1ntFna3++PDxqb29gPrsh
	bmFP8lFQqO6PEJ7vgw0HfiKFIkCiHcoUREYog=
MIME-Version: 1.0
Received: by 10.224.189.129 with SMTP id de1mr17300721qab.18.1322342932052;
	Sat, 26 Nov 2011 13:28:52 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sat, 26 Nov 2011 13:28:51 -0800 (PST)
In-Reply-To: <CACW_hTbDBOV9yikTqpeVDif1J0oCcEorj=vMB1BcRsZG=0gzKg@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<CA+M6bX=Xs+ACNOXYfFafb__vGNVYX3y8g7zvLQvDiHyg=5yjRw@mail.gmail.com>
	<CACW_hTbDBOV9yikTqpeVDif1J0oCcEorj=vMB1BcRsZG=0gzKg@mail.gmail.com>
Date: Sat, 26 Nov 2011 14:28:51 -0700
Message-ID: <CA+M6bXkTP9BPgEx_3ykwKJuv73s+0WAsJH_NwRbFEo=ZERhC0A@mail.gmail.com>
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
X-List-Received-Date: Sat, 26 Nov 2011 21:35:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 26, 2011 at 8:45 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/11/25 Tom Rini <tom.rini@gmail.com>
>
>>
>>
>> <Putting on TSC hat>
>> The problem with this mindset is that we don't want to have
>> oe-core+meta-oe+etc and oe.dev diverge any more than they had at the
>> start. =A0This is why at some point master needs to become read-only.
>> Everyone and their master based project can still fetch and build and
>> work. =A0But if you're going right now and saying "I need to start a new
>> project and it should be oe.dev+master based", please speak up now
>> about why you're unable to use oe-core+etc. =A0We can't solve what we
>> don't know is a problem and frankly I think the TSC is of the mind
>> that oe-core+etc is as good as or better than oe.dev. =A0If we're wrong,
>> someone needs to tell us what's missing.
>>
>
> Well, there is at least the issue of machines and architectures.
> Now it is probably not too big a deal to bring over a new machine and tur=
n
> it into a BSP layers, but adding another architecture is yet another thin=
g.
>
> We do have products that are based upon NIOS II. This architecture is
> present in OE classic and not in OE core.
> One of the issues is that the NIOS II toolchain is still based upon (iirc=
)
> gcc 4.1.1
> I do not see an upgrade of gcc/niosii happen in the near future (In the
> past I did spent some time to see if I could move to a newer version, but
> there were some issues, and afaik no one is working on this atm), and I
> doubt oe-core is interested in having a 4.1.1 toolchain around.

An external toolchain should be fine.  You should also be able to put
that gcc & company into meta-niosii.  If you can't, then IMHO, there's
a problem someone needs to look at.  But I suspect there isn't a
problem doing that.

> Therefore probably our next niosii project will still be oe-classic based=
.
> On the other hand we also have ppc projects and the next one might quite
> well use oe-core (it is too late to switch for the current one as we need
> to release next month).
>
> (and more general: oe classic still has quite some recipes that are not i=
n
> oe-core or meta-oe (apart from the fact that the latter is not really too
> open to contributions; see the email thread on id3lib from a while ago).

Where someone asked Koen to document the differences between oe-core
requirements and meta-oe requirements?  Yes, that's reasonable but
lets not fool ourselves either, it's not vastly different, it's PR =3D
r0 or not (and PR is supposed to go away).

--=20
Tom


