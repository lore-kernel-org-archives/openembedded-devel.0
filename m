Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OWPyP-0005va-EF
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 10:27:29 +0200
Received: by bwz10 with SMTP id 10so3756931bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 01:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/CxYMSWhWenLA9flUrfQhY5qg/2w/MxfkkZIbQd/zxg=;
	b=iL4DHasQ3qV50uzwyS3GVcaNHXw7235RmdWEPKNuUjP+h2BR9IrWPmrv6aXuQv5LA/
	K7zB7EE+yCWDGngdDv3f4Pqtofp2pocxiyV4JKkxhf5aCGUUe566tf8ZPtZdm534U7gk
	nMI21k4Sn/MFwV44qrVGOftba/V5sqaiUBWFM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=QJyzl/xXrINLWRycWm4h6hqhj2POqupryeo8oOeERvSsSQ3rcsf7YZn24IHxivK2a1
	/wOzOH84iizRND2Z22Eq9AMVkXNPhUHQVmiTvNRitq7dpwc9C6Yjgqk0dWe+KPL3O60s
	rMrtgrNDM/fd6f1c5HQgkbsjfoEEn8WlDJxYc=
MIME-Version: 1.0
Received: by 10.204.83.72 with SMTP id e8mr4725279bkl.102.1278490948499; Wed, 
	07 Jul 2010 01:22:28 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 7 Jul 2010 01:22:28 -0700 (PDT)
In-Reply-To: <i119n7$ej7$1@dough.gmane.org>
References: <i108p5$hd$1@dough.gmane.org> <4C33B301.7010006@mentor.com>
	<i119n7$ej7$1@dough.gmane.org>
Date: Wed, 7 Jul 2010 10:22:28 +0200
Message-ID: <AANLkTilMeF6JeEaV7XjkOwfb2_G1d3XO3sIe9CP_77-g@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit 4d6a63850b4dc7ca2f060aedda26ddf4efa0e5cc
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
X-List-Received-Date: Wed, 07 Jul 2010 08:27:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/7 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 07-07-10 00:49, Tom Rini wrote:
>> Koen Kooi wrote:
>>
>>> +PREFERRED_VERSION_gcc-cross =3D "4.1.2"
>>> +PREFERRED_VERSION_gcc-cross-initial =3D "4.1.2"
>>> +PREFERRED_VERSION_gcc-cross-intermediate =3D "4.1.2"
>>> +PREFERRED_VERSION_binutils =3D "2.17.50.0.12"
>>> +PREFERRED_VERSION_binutils-cross =3D "2.17.50.0.12"
>> [snip]
>>> do NOT belong in a machine.conf (or machine include). Those belong in
>>> the distro (or local.conf), not in the machine.
>>
>> Just putting this out there (and it's indeed _not_ how things are
>> today). =A0Why would we not want to move towards having this kind of stu=
ff
>> be in the tune-ARCH.inc file, when a specific version is really needed
>> (more avr32 or new'ish core on an existing overall arch) ?
>
> Putting it in a tune-arch is not a problem, just put it in
> conf/distro/include.

Why should this be distro specific. I'd say this is generic.

> Experience has shown that putting it the machine includes is a bad idea,
> It rots and after a while a new machine gets added that doesn't use said
> machine include.

I'm not sure how it would rot, but anyway I'd say avoiding this is the
responsibility of the architecture maintainer. (which might well be
the one who maintains gcc for that arch).
Wrt the "new machine gets added that doesn't use said machine
include": I agree this is a risk.
To me it seems part of the problem is that architectures seem 2nd
class citizens. Ideally boards should link to architectures.
(btw: I'd say a new board gets added that does not use said
architecture include).

It might be an idea to restructure the conf/machine dir to turn it into a
conf/architecture/board hierarchy.

> And not to mention the need to change DISTRO_PR for editing a
> machine.conf, that's just backwards.

As said this is because architectures are 2nd class citizen. I feel it
would be better to add an ARCH_PR.
(actually by introducing an ARCH_PR, it might be that the need for
DISTRO_PR diminshes or goes away, can't fully judge that atm).

>
>> Yes, it
>> should be up to the distro to say "we want 4.4.x + 2.20.x" or whatever,
>> but then we also get the downside of "special case, XXXX only works well
>> with 4.3.4 + 2.19.x" or what have you, and those special cases get
>> introduced in one place and copy/pasted elsewhere.
>
> So you have an include file in conf/distro that people can optionally
> use or copy/paste. Not all distros can/want to support all machines in
> OE. Angstrom tries to, but that's because it's the reference implemention=
 :)

I'm not sure if Tom is saying that.

Anyway, as the maintainer for the nios2 toolchain I don't feel like
chasing down all distro's and making sure they fix their stuff if e.g.
a certain version of gcc has to be deprecated (e.g. because it is
broken)
>
> It boils down to this:
>
> The distro needs to make a decision to do strange stuff to support a
> platform. Silently forcing it is bad.

I object to calling this "do strange stuff".
>
> In this specific case no distro except angstrom has expressed interest
> in supporting nios2, so we could even but this in an angstrom.inc.
> Seriously, can the distro maintainers that are willing to support nios2
> please raise their hands?

A few comments here:
- I haven't really seen interested from angstrom to support nios2.
Feel free to correct me by sending a pointer (preferably referring to
the angstrom mailing list)
  Actually, except for Leon, I am unaware of any serious interest.
- I've no idea how many active distro maintainers we have.
- and I am not sure how many of them will read this thread.

Anyway, I am dealing with a distro (unpublished as of now) which is
interested in nios2.

Frans


