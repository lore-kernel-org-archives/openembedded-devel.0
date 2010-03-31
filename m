Received: from mail-iw0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nx1Oa-0007ns-12
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 19:08:00 +0200
Received: by iwn8 with SMTP id 8so301566iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 10:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=A4DIlT56S/r3K4GtsHIFVILynguv3EhHWNMsESLoETI=;
	b=LjrazvlCfskqLkf3lCldm0+7MHEpcnmtT/CEZ2CkWjZYA+i67C63Uc8QA+H+To7zXY
	l3Z7QKSlirmIjT8PX9lxKAhfWMSEpEp16jg+mug224Q+FPbakb9H7tUEfRgSKByGagKk
	Ow6dGEpY7F3n501d4ry17Hd8j4hwdYdxOOM8k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=D2BiA+rJb/ZQ2vluA4MUm2Xp2q8z+DzlBexHSkfKO0DeRBrup+Pf+Z/GpQX2QAXW3F
	byt+bwddepX80ucbjCQPpGnRRBRi/SxWNDWRDIMwUU13J4kaV6G+fopw4Qe+g1WfZCI8
	Ngsk1ml8+MqEKse8T98t+YYxGtObYvvc/XpVs=
MIME-Version: 1.0
Received: by 10.231.32.66 with HTTP; Wed, 31 Mar 2010 10:04:43 -0700 (PDT)
In-Reply-To: <hovis7$jk7$1@dough.gmane.org>
References: <1269730499.4033.176.camel@mattotaupa>
	<hon5i2$8iq$1@dough.gmane.org> <1269797481.8018.80.camel@mattotaupa>
	<hooat6$p3d$1@dough.gmane.org> <1269949824.4103.38.camel@mattotaupa>
	<hosrca$7qu$1@dough.gmane.org>
	<1269953505.14554.2.camel@mill.internal.reciva.com>
	<hovis7$jk7$1@dough.gmane.org>
Date: Wed, 31 Mar 2010 10:04:43 -0700
Received: by 10.231.148.18 with SMTP id n18mr312792ibv.7.1270055083564; Wed, 
	31 Mar 2010 10:04:43 -0700 (PDT)
Message-ID: <u2k19c1b8a91003311004ka69764e7i4fded3933845be1a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] autotool.bbclass: Remove `EXTRA_AUTORECONF = "--exclude=autopoint"`.
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
X-List-Received-Date: Wed, 31 Mar 2010 17:08:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2010 at 6:31 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 30-03-10 14:51, Phil Blundell wrote:
>> On Tue, 2010-03-30 at 14:38 +0200, Koen Kooi wrote:
>>> I wonder if we only should run autopoint if there are AM_GNU_GETTEXT*
>>> macros in configure.{in,ac}, or does autopoint take care of that
>>> automagically?
>>
>> Autoreconf has some (limited) logic to figure out whether autopoint is
>> needed. =A0I think that ought to be sufficient.
>
> So can we get some acks on this patch from autotools savvy people?

I think we should also try few builds from scratch. I am interested in
uclibc based builds.

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLs07GMkyGM64RGpERAnb6AJwI7A4RiAqakz4+E1+yIM1208tgGwCfTHNi
> WtEHoTLG83SEkCTpFw2zIR8=3D
> =3DxIxY
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


