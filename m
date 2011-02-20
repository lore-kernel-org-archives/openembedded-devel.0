Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pr5h9-0000L3-Ln
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 10:35:12 +0100
Received: by iwn10 with SMTP id 10so1058057iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 01:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=nSY0wFUfUyPMtN/IanCvkbH3IWfhlRyPHjVuOkVOnCM=;
	b=jf14TQq5sCYTAWj9ssjkB527QDCYWY4rNNy9+QrKSxAPclpmZoOQJY+MbkMNjl8fqa
	JnfR1Zo8G1QbZI3+SpOf1Cbmtt8/nVpi4XOr/LqM2p1XF3PtAmqDCAi4ezlfRmSJrHrK
	FDV/0VHyc7GmXL8i4pQ+9HhJ0potlNG2g51h8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AHiTE0ypqEAEXtK4BmYOuYR+mqoG5iq+ZYGf6kDpeLrrkQfoPMcLwGPc4IG7gZSySl
	LZc8cnNW0ZJrpqgl+tbYI4mbjwwbSNhuof2FDWHWttWpwWChfXF8d8YMLUqx3NUyZTBn
	ir0x2Sx3RybvAgzQ29LXw23+ub+dpBZADMt88=
MIME-Version: 1.0
Received: by 10.231.157.211 with SMTP id c19mr167742ibx.172.1298194433892;
	Sun, 20 Feb 2011 01:33:53 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Sun, 20 Feb 2011 01:33:53 -0800 (PST)
In-Reply-To: <AANLkTinxjgtVKeZMj0t_E1JhiDT3iq1ohhHt56wf7JkQ@mail.gmail.com>
References: <4D60AC02.2070605@mwester.net>
	<AANLkTinxjgtVKeZMj0t_E1JhiDT3iq1ohhHt56wf7JkQ@mail.gmail.com>
Date: Sun, 20 Feb 2011 10:33:53 +0100
Message-ID: <AANLkTinYgRnQSeXAh2rtQpexKixSnXQvVWM9qfZz9Xi0@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Parsing stalls at libinih
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
X-List-Received-Date: Sun, 20 Feb 2011 09:35:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/20 Khem Raj <raj.khem@gmail.com>:
> On Sat, Feb 19, 2011 at 9:52 PM, Mike Westerhof <mike@mwester.net> wrote:
>> Parsing stalled. =A0Debugging shows its stuck on parsing libinih:
>>
>> PV =3D "0.0+gitr${SRCPV}"
>> PKGV =3D "${GITPKGVTAG}"
>>
>> I think we had decided some time ago that OE recipes were to be nailed
>> down in some fashion such that one should be able to parse all the
>> recipes, at least, without a network connection.
>>
>> Have I missed setting something for my distro so that the above lines
>> don't have to go to the libinih git repo for every parse?
>
> hmmm the problem seems to be because its using AUTOREV
>
> there are few other recipes which are using autorev
> recipes/libinih/libinih_git.bb:SRCREV =3D "${AUTOREV}"
> recipes/linux/linux-jlime-ben-nanonote_2.6.36.bb:SRCREV =3D "${AUTOREV}"
> recipes/linux/linux-jlime-jornada6xx_2.6.32.bb:SRCREV =3D "${AUTOREV}"
> recipes/linux/linux-mini2440_2.6.30+git.bb:SRCREV =3D "${AUTOREV}"
> recipes/nonworking/linux/linux-jlime-jornada6xx_2.6.25.bb:SRCREV =3D "${A=
UTOREV}"
>
> I think if AUTOREV are not used in recipes directly
> but instead collected in a conf file then this issue
> may be avoided.
>
>>
>> For now, I've fixed it by masking out that recipe in my local.conf -- I
>> have no need for it. =A0Is that the correct solution for recipes that do=
 this?
>>
>>
>> Thanks,
>> -Mike (mwester)

I'm looking into this.


