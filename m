Received: from mail-yx0-f180.google.com ([209.85.210.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NbAzk-0002EC-Og
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 11:56:07 +0100
Received: by yxe10 with SMTP id 10so2570709yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 02:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4v9ImJKocowAEFAO89PprO/Js7npyWiTKuTe/YTfd/8=;
	b=RmMKvV3SRWhhK3Ov97AGZmY0+s+c3yurOiQEuJ2sNF8UYs0MNNPD44tRQ2IxP94VLD
	w70d26OtTmJyzlj80VGa3MtqCiILbjvJzxdAIV9q17d5SiEeoDuNv0c/s8NQi1jIqYrj
	2jotaQnsBdovGq0EDT1DiSeRJD7Oay4xaHVi0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=n4FLwQNV4RAT+3QZWPC/EzgM4XVZiPCOzEfjAgFvDlRigwCLaIDCjaejlLfij/jjGP
	AqPoPiJMH5Hbh7fAKduxZiN32SoyhkHU2JwC3YX24m8NmulrnEWel2LVChdF3gSNenlK
	tH7QxTNqvLoTVHniY8/qDnYIPJ9QGOPA2Fkg4=
MIME-Version: 1.0
Received: by 10.100.222.11 with SMTP id u11mr2309002ang.246.1264848819517; 
	Sat, 30 Jan 2010 02:53:39 -0800 (PST)
In-Reply-To: <hk12nm$sdo$1@ger.gmane.org>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>
	<hk12nm$sdo$1@ger.gmane.org>
Date: Sat, 30 Jan 2010 11:53:39 +0100
Message-ID: <ac9c93b11001300253t63c2b50bj32a2f0ec2c50aae5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.180
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC] console-image.bb
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
X-List-Received-Date: Sat, 30 Jan 2010 10:56:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/30 Rolf Leggewie <no2spam@nospam.arcornews.de>:
> Frans Meulenbroeks wrote:
>> Wouldn't it be cleaner to rename ANGSTROM_EXTRA_INSTALL to e.g.
>> DISTRO_EXTRA_INSTALL ?
>
> This has been discussed before, but not changed. =A0I think it made sense
> back then and I think it makes sense now.
>
> I believe there is even a better name than DISTRO_EXTRA_INSTALL to be
> found for the variable. =A0Maybe IMAGE_EXTRA_INSTALL?
>
Actually mistyped tye filename, it was console-base-image.bb
and in the beginning it says that it is an angstrom bootstrap image,
so having angstrom specific env vars in it makes sense, but guess the
name then should be angstrom-console-base-image.bb, just like other
images are prefixed with openmoko, nylon, opie, slugos and whatever


