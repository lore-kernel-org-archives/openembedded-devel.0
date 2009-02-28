Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LdMtj-0007TO-Sp
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Feb 2009 11:58:23 +0100
Received: by fxm11 with SMTP id 11so1357072fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Feb 2009 02:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4InJLNnlExfUdtIFIT73vhBIyE02jn2WzcF0NyLHDKc=;
	b=R4AkOG7evcnN7D2Ad8yFz9eZREzGYyLdoaXpLoTuPZ1YQYcYD+fpDOePxwJFBAiutt
	gGWFfwGMZzOehH4dkwC2AsQrfoMyOzOtdeOaS2gOnOaqC1Zj2rAmfcQ8FkLOS6hPGSbk
	jt7oEShXdhFa4fxwpFKQiSClMhg2YrvKieAkI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xtr7VIJ4LXbuGlp2Lku+zr2sK5O+iY6mKJHCdR5L8C8ZRicySXruwXIEpBBulTLhGi
	4RfPIOnVWLMOfr+I3FY1+iL1wVFWz2s9NQaEqy1tYKF7XdT8nqTMBYaW3IRJm7AV/Qzr
	jQq8TQuCtrBt3y/YWK1VUmjtny7FzZM49A19s=
MIME-Version: 1.0
Received: by 10.223.115.193 with SMTP id j1mr4144723faq.98.1235818486740; Sat, 
	28 Feb 2009 02:54:46 -0800 (PST)
In-Reply-To: <20090227162633.GD5420@smtp.west.cox.net>
References: <ac9c93b10902260920s24a8c5we592cbb4d0d63221@mail.gmail.com>
	<c384c5ea0902270806n70ce6bbfg45d19b5ebaf64050@mail.gmail.com>
	<20090227162633.GD5420@smtp.west.cox.net>
Date: Sat, 28 Feb 2009 11:54:46 +0100
Message-ID: <ac9c93b10902280254j3ac8533bod972dfd150b46621@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE breakages, was: Re: fakeroot fails to build
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
X-List-Received-Date: Sat, 28 Feb 2009 10:58:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/2/27 Tom Rini <trini@kernel.crashing.org>:
> On Fri, Feb 27, 2009 at 05:06:25PM +0100, Leon Woestenberg wrote:
>> Hello,
>>
>> On Thu, Feb 26, 2009 at 6:20 PM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>> >> On 25-02-09 16:14, Mike (mwester) wrote:
>> >
>> > The problem I am facing is somewhat different.
>> > I've added packages which build and test fine in my environment but
>> > for some reason they do not build properly on tinderbox.
>> >
>> That often indicates a leak to the host and/or missing DEPENDS.
>>
>> The build machines that run test builds, should do so with the minimal
>> amount of host requirements.
>>
>> Easily testable using virtual machines with freshly installed Linux,
>> as most machines grow their installed package base during their
>> lifecycle.
>
> Also, chroots work for this.
>
> --
> Tom Rini

chroot and virtual machines indeed could help a lot.
Actually I think that chroot could be a big help porting pacakges. I
see too often that things go wrong because host files are being used
somewhere. Definitely some packages are an almost untangible knot of
problems (try to make a .bb fiel for e.g. cdrtools, I ended up moving
to cdrkit (probably better anyway, but cdrtools demonstrates the
problem quite nicely).

Not sure whether it will be easy to make a build env with chroot
(although I know debian does something like that).

Frans


