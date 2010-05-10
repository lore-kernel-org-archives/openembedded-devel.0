Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OBOat-00078O-4s
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 10:44:07 +0200
Received: by gwb15 with SMTP id 15so136514gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Gvy2A8EG+6Cvj5XMtjHZLo1Vkkgm5yTlDIgwx8blQoI=;
	b=swJMCdvqJEvxM1ozFfdGZLrOjwAhUgBBDSjTh1cVHaIt2UymvioS7e0v4sL20ubmwM
	wOjFCjjN83GzW0IDGp6hGegv4uFXUqgxZjhlr92DEhYd1oFsyQUz+UGInMhE7pcxRhjU
	22NsKtJtXtc8dd99Ix2m+1kBDxgeRSeFytjUA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fA54yEJD2MsSZCF6CevZA6UyuV1qlbvj3nOucONlVCilhQPh2VJLy0maBv8GMUgjrD
	BAGsTx0Y6hP3w02W3SE19HtMkSRRMR6HTgV6EVS1lb7jKZoJrcDxsUoYVRDCq25Hplcy
	+lDekpO8P/r+h/KFtuZR7Lk3d8uk/nBal+iDc=
MIME-Version: 1.0
Received: by 10.91.72.39 with SMTP id z39mr137131agk.129.1273480814503; Mon, 
	10 May 2010 01:40:14 -0700 (PDT)
Received: by 10.90.71.4 with HTTP; Mon, 10 May 2010 01:40:14 -0700 (PDT)
In-Reply-To: <1273429494.22943.225.camel@trini-m4400>
References: <1273249883.457.336.camel@trini-m4400>
	<g2zac9c93b11005080006zb474ea8dj506101d1dde2ed42@mail.gmail.com>
	<1273331468.22943.217.camel@trini-m4400>
	<1273429494.22943.225.camel@trini-m4400>
Date: Mon, 10 May 2010 10:40:14 +0200
Message-ID: <AANLkTimOAdWye_9cLGryBlVJjsSVSVrlM7Lz9ikQAmQh@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: calamari (ppc e500v2) failure
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
X-List-Received-Date: Mon, 10 May 2010 08:44:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/5/9 Tom Rini <tom_rini@mentor.com>:
> On Sat, 2010-05-08 at 08:11 -0700, Tom Rini wrote:
>> On Sat, 2010-05-08 at 09:06 +0200, Frans Meulenbroeks wrote:
>> > 2010/5/7 Tom Rini <tom_rini@mentor.com>:
>> > > Hey all,
>> > >
>> > > With DISTRO=3Dminimal and MACHINE=3Dcalamari, I see the following fa=
ilure in
>> > > gnutls (using fe4ff6940b06c73d5b88224b99750bf65accf13d in oe.dev):
>> > > http://pastebin.com/cjAStcLb and I confirmed this prior to the RP me=
rge,
>> > > so this is unrelated.
>> >
>> > Which eglibc is that?
>> > The issues I had seemed due to some catch22 situation that I cured; I
>> > started a clean build yesterday before I left work & can tell the
>> > results on monday.
>> > My distro was angstrom, machine calamari, this uses eglibc 2.10. Is
>> > minimal also using 2.10 or is it at 2.11
>> >
>> > I can also try to kick off a minimal build on monday
>>
>> minimal is eglibc 2.10. =A0I'll try an Angstrom build.
>
> With Angstrom, gcc-cross-initial fails building libgcc, config.log has:
> cc1: error: not configured for ABI: 'spe'
> configure:2591: $? =3D 1
> configure: failed program was:
> ... standard empty program ...
> configure:2605: error: cannot compute suffix of object files: cannot
> compile
>
> Ubuntu 9.10 x86_64 host
>

I made a mistake when doing the clean build, and kicked it off again.
I don't think I saw your error.
In  my local.conf I have:

MACHINE =3D "calamari"
DISTRO =3D "angstrom-2008.1"
ANGSTROMLIBC =3D "eglibc"

# e500v2 supports the SPE instruction set.
TARGET_OS =3D "linux-gnuspe"

Perhaps the TARGET_OS line influences how libgcc is build.

Frans


