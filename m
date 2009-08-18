Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MdYgD-0000dw-9m
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 02:05:29 +0200
Received: by qyk35 with SMTP id 35so3048864qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 16:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YLOGgdyeXs8MQfCzAVYwaB0MVEH4n+R56nxZ1RZCmu0=;
	b=E/s2ZBryb9hAZyNgcb0LUfYTHDxcj7fiShvG4lEn7GZHg6qpGcfl/s3aFrP1yTxzpx
	FzkN8oums7YHhx+yZ3zaJbm7JQfLWDZs/QPeotEWgP1esCPgXiQmbrUcy5xUSvXqYd/i
	T4mvYKjC7jeY2XfoSljZW/yRjoajo1wWs6Glg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=r/dccal5gdm87f6v/HR6xP/OTxDaBwMAP49PHypwuoYzhbeDrGCsgpUL3Iai30EcCZ
	J8idB1hj2NCEEPipaDJV+6mHlb4OXafQTiBXBk8GaVpe73lFGr/f/Chp0Znu+6ppPEO0
	kkkZ0kRllVxl3aoS7zN2/gPzd1Sz0ZFZ1fVvs=
MIME-Version: 1.0
Received: by 10.229.9.147 with SMTP id l19mr2684760qcl.65.1250639300116; Tue, 
	18 Aug 2009 16:48:20 -0700 (PDT)
In-Reply-To: <20090818232002.GZ2227@smtp.west.cox.net>
References: <20090814215138.GB31011@gmail.com>
	<20090815022703.GH14883@smtp.west.cox.net>
	<19c1b8a90908151021s67bbdd9fh52a07dce6d51ace8@mail.gmail.com>
	<20090817234049.GH2227@smtp.west.cox.net>
	<19c1b8a90908172329p55250179od552cd94fa4cbff5@mail.gmail.com>
	<20090818154440.GQ2227@smtp.west.cox.net>
	<20090818212827.GA26614@gmail.com>
	<20090818232002.GZ2227@smtp.west.cox.net>
Date: Tue, 18 Aug 2009 16:48:20 -0700
Message-ID: <19c1b8a90908181648nb43120bg978baa4ac0faa2cb@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding eglibc versions of minimal and micro distro
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
X-List-Received-Date: Wed, 19 Aug 2009 00:05:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2009 at 4:20 PM, Tom Rini<trini@embeddedalley.com> wrote:
> On Tue, Aug 18, 2009 at 02:28:27PM -0700, Khem Raj wrote:
>> On (18/08/09 08:44), Tom Rini wrote:
>> > On Mon, Aug 17, 2009 at 11:29:31PM -0700, Khem Raj wrote:
>> > > On Mon, Aug 17, 2009 at 4:40 PM, Tom Rini<trini@embeddedalley.com> w=
rote:
>> > > > On Sat, Aug 15, 2009 at 10:21:31AM -0700, Khem Raj wrote:
>> > > >> On Fri, Aug 14, 2009 at 7:27 PM, Tom Rini<trini@embeddedalley.com=
> wrote:
>> > > >> > On Fri, Aug 14, 2009 at 02:51:38PM -0700, Khem Raj wrote:
>> > > >> >
>> > > >> >> Hi
>> > > >> >>
>> > > >> >> I would like to add minimal-eglibc and micro-eglibc distros on=
 same
>> > > >> >> lines as -uclibc one's
>> > > >> >>
>> > > >> >> Any objections ?
>> > > >> >
>> > > >> > minimal-uclibc and micro-uclibc should go away and just pickup =
from LIBC
>> > > >> > being passed in / set.
>> > > >>
>> > > >> Ideally yes but there are other things like libintl libiconv etc =
which
>> > > >> needs special handling
>> > > >> for uclibc. So having uclibc counterparts is good.
>> > > >
>> > > > I don't follow. =C2=A0LIBC, and the associated inc file set the pr=
eferred
>> > > > providers correctly. =C2=A0Or are you talking about sharing the sa=
me TMPDIR
>> > > > for > 1 distro ?
>> > >
>> > > If u dont set LIBC then by default glibc is picked. Now it will pick
>>
>> >
>> > If you don't set LIBC that's not a valid distribution configuration.
>>
>> True however I was talking in context of minimal and micro distros, not =
in general.
>
> minimal and micro aren't allowed to opt out of {uclibc,eglibc,glibc}.inc
> and the LIBC variable, so you've lost me.
>
>> > > eglibc instead
>> > > not many users override LIBC in there local.conf this way eglibc wil=
l
>> > > get more tested
>> >
>> > So the default should be: LIBC ?=3D "eglibc" then for minimal, to pull=
 in
>> > the eglibc.inc file that sets libintl/iconv/etc.
>>
>> yes
>
> So are we on the same page again, micro/minimal-uclibc can go away and
> micro/minimal can ?=3D LIBC? :)

no. LIBC provides other packages too which is different for uclibc
its same for glibc and eglibc so having same for glibc and eglibc is ok but=
 not
for uclibc

>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


