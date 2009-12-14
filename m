Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1NK4eS-0007aH-KV
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 07:43:27 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 4A2FCC5ABD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2009 01:41:41 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Mon, 14 Dec 2009 01:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type:content-transfer-encoding;
	s=smtpout; bh=QvAYTWnokzo0KrAX2F2Ih2Qcgr0=;
	b=Bu34gyRQKKhZVoWSNIVqhurh5ACMG/EOGH+tAnAxE0bwZXruCcmkqYhwkomqaAETO8vPv7szcNCSJQuuuSm0Si4rCXWtdxwRsiegSOO5+xCSRnpKcLCp3ThJeOaMpPpdR/d72vAAcA7VS2Pn+0aejV707zD6a+EWisWH5IBww/A=
X-Sasl-enc: jQEyHcbTpqVitgIrKjDBl6MEdR62rgFnnHsF32wM0GtO 1260772900
Received: from [192.168.178.120] (p548382DA.dip0.t-ipconnect.de
	[84.131.130.218])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 9264F3577B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2009 01:41:40 -0500 (EST)
Date: Mon, 14 Dec 2009 07:41:34 +0100 (CET)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90912110933n5b8878c3g8b850c50ff435310@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.0912140730080.7495@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.0912110857540.5053@asterix.crazy-teaparty.dyndns.org>
	<19c1b8a90912110933n5b8878c3g8b850c50ff435310@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux_2.6.29.bb: update to kernel 2.6.29.6
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
X-List-Received-Date: Mon, 14 Dec 2009 06:43:28 -0000
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Dec 2009, Khem Raj wrote:

> On Thu, Dec 10, 2009 at 11:59 PM, Vitus Jensen <vjensen@gmx.de> wrote:
>>
>> Version 2.6.29 fails on arch powerpc because of a syntax error. =C2=A0=
See
>> http://lkml.indiana.edu/hypermail/linux/kernel/0906.1/00867.html
>>
...


> Although your patch seems technically correct except missing
> checksum.ini entry.

The checksum for patch-2.6.29.6 is already in git.  No idea why, a quick=20
grep shows no reference, but it's there.

> There was concern amongst devs in the past about handing minor releases=
=20
> of kernel. Should it be added as a patch on top of base release or=20
> should they be added as separate recipes. There were opinions on both=20
> sides I am not sure what the outcome was.

As I see it the majority of linux*.bb use the patch approach.  Especially=
=20
those not naming a certain hardware in their filename.  My first patch=20
used the download of the complete 2.6.29.6 kernel but I had the=20
feeling that I should rename the recipe in this case.  Which may lead to=20
different PREFERRED_VERSIONs elsewhere.

With the patch approach everything is in the recipe and if some machine=20
doesn't like the patch it may use SCR_URI_xxx magic to disable it there.

Vitus

--=20
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


