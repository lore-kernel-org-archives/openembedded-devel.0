Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1PxGMT-0000dH-I9
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 11:11:21 +0100
Received: by vws4 with SMTP id 4so307305vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2011 02:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=fc2MS3avRpXBU6NmTPZN6AnQgaRzFWv04InbIeCcwo8=;
	b=X+UUOTlXP8hP8i9/h6nbmGNBXDvE8MzpwEZWYq3n87prD40v6ZRC9UKI0QGmychB2L
	PC9eOGK83gkbcQHqtG6B/2EBgGJ4SQyTogRx+lvFt+v+Wr113Lf05FEaRfOVhAqS6N0T
	lfGfxqvEhfuOE6B6LowRgDUa1wt14dRs7bVSo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LfLPFywwayk1JG3L5wm2tFtkJ3XfhwKfG/FbgKE1x2HoNMYuzwUR9Wb82P/rxmvJ/4
	64MiSPeUfJ2fg/13tc6TsTbiuGaFJwM0cfq9N9t76OIjtmmduS3p2EYh1f+WmiLKhJdb
	6cGVJb2g92ahzP/fyq9PEqAjOBKyqN7OGH0lE=
MIME-Version: 1.0
Received: by 10.52.67.133 with SMTP id n5mr9072941vdt.129.1299663212278; Wed,
	09 Mar 2011 01:33:32 -0800 (PST)
Received: by 10.52.164.39 with HTTP; Wed, 9 Mar 2011 01:33:32 -0800 (PST)
In-Reply-To: <AANLkTikBSTnFxn-h+BgD1fcuOmKPsP6Q8bVZ+R7_HUkW@mail.gmail.com>
References: <AANLkTikBSTnFxn-h+BgD1fcuOmKPsP6Q8bVZ+R7_HUkW@mail.gmail.com>
Date: Wed, 9 Mar 2011 10:33:32 +0100
Message-ID: <AANLkTimyqq0=F+yaqHqGHP+T7evyjMCm58B+PUf1m-4p@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: mtd-utils - issues with flash_eraseall -j
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
X-List-Received-Date: Wed, 09 Mar 2011 10:11:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I have a guess:

Patchwork [5/5] mtd-utils: change flash_eraseall to use libmtd-wrapped ioct=
ls

http://patchwork.ozlabs.org/patch/57934/

Then I've read that recently (1.4.x)
"...The "struct nand_oobinfo" is able to record only 32 ECC code positions,=
which
is not enough for many big NAND chips. Therefore, this structure is replace=
d
by "struct nand_ecclayout" in linux kernel from the version 2.6.17.
Consequently, the ioctl command changed from MEMGETOOBSEL to ECCGETLAYOUT"

I was using 2.6.26 kernel.
Please report if that happens on other hardware too.

Thanks

Andrea



On Wed, Mar 9, 2011 at 1:14 AM, Andrea Adami <andrea.adami@gmail.com> wrote=
:
> Hello,
>
> with the previous mtd-utils-1.3.1 I could do ' flash_eraseall -j
> /dev/mtd3' on my Zaurus/armv5te.
>
> With v. 1.4.1 (and 1.4.2 fwiw) I see following errors:
>
> ...
> flash_erase: error!: /dev/mtd3: MTD writeoob failure
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0error 22 (Invalid argument=
)
> Erasing 16 Kibyte @ 43f0000 -- 99% complete libmtd: error!: unaligned add=
ress 7
> 1237640, mtd3 page size is 512
> flash_erase: error!: /dev/mtd3: MTD writeoob failure
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0error 22 (Invalid argument=
)
> Erasing 16 Kibyte @ 43f4000 -- 99% complete libmtd: error!: unaligned add=
ress 7
> 1254024, mtd3 page size is 512
> ...
>
> Anybody can confirm the issue?
>
> Regards
>
> Andrea
>


