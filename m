Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PgjVd-0005ZI-Aj
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 20:52:29 +0100
Received: by gxk20 with SMTP id 20so979789gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 11:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=dQP1Ba9IXdhq3r/6a7pDNk6UY02KZW4b1WV8j+JkYIQ=;
	b=QSC5owIHiR4InrhK/CZwos6FW5eyj0/5ErWA7fUrX3pIeWe6T5VrM1EcQVHMqcwCQL
	RRUVpUAao9zydiYHjHBMGQdGfxNQCedykiqnzmcwv1fCWHMlCGjvQIcXhhCm0rIoWG8o
	PopmAVB9jsJf2ZwPka4z1gBJAKddsATSKjRz4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ZsauSR2zMlURe1CqfeMIp2SiX3KkykAIwbwN4t3wYaiXmF6sOTJ+R6YC3mFyt+57qI
	rgbYhHLVoH3gZySC934LmjYvmc01SsO7SPguigOASxZVMlapLPd4z63theP1Uug2lMTI
	VSE6qJQveWso/cNWhct94F+qsHT9rsGsHNvJw=
Received: by 10.90.35.17 with SMTP id i17mr2642299agi.166.1295725622687; Sat,
	22 Jan 2011 11:47:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Sat, 22 Jan 2011 11:46:42 -0800 (PST)
In-Reply-To: <AANLkTinz+p5J6K+XhohJJ=q7dD3X1kVGZDNA-4qOOH2W@mail.gmail.com>
References: <AANLkTinz+p5J6K+XhohJJ=q7dD3X1kVGZDNA-4qOOH2W@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Jan 2011 11:46:42 -0800
Message-ID: <AANLkTimSeB5GqQSyMtskAm_3O9h-MWfCJJz+FAFnnkB8@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Recipes with fetch failures:
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
X-List-Received-Date: Sat, 22 Jan 2011 19:52:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 22, 2011 at 10:06 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> I have started a build with an empty download dir and found some failures=
:
>
> Those are not fetchable:
>
> =C2=A0 ftp://invisible-island.net/ncurses/5.7/ncurses-5.7-20100501.patch.=
gz

I fixed this yesterday

> =C2=A0 cvs://anoncvs:anoncvs@anoncvs.handhelds.org/cvs;module=3Dipkg-util=
s
>

yeah hh.org is gone. So you need to rely on mirrors to get the tarballs
add

SOURCE_MIRROR_URL ?=3D "http://sources.openembedded.org/"

to your local.conf and probably you also need to inherit own_mirrors

> This does seems critical to us since it makes a hard time for anyone
> trying to get something done with OE and has no background how to
> workaround those. It seems that those need fixes.
>
> --
> Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=C2=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


