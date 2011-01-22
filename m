Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pgjkd-0006EB-GG
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 21:07:59 +0100
Received: by bwz10 with SMTP id 10so2722988bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 12:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ooUhgK7gkxUJpmZMJMmfSsXi60MVDBCXjJaqWxTOseY=;
	b=NqbupQACI7VRF2YbIiLP721Io13C4gpKHnDGShjNPuGvh0kmFAmBh8ugTasA7g6oB5
	/i1bwtW7FFDJqLkaYCYacz/xh6wuOzUKNAoILhCeUdgGx0Ds44RIql14oOqdZJIB7cBF
	eNaPqJAHf1du9ALGRoy6oeJz3kexFNyUxAY0c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=ozjluBluvAArFNetKZmr/aCxtF0xbSRypXfyKbZdm537RjhXRC3ZoHDx7XAyW7Sm/u
	+kWk4qV1ZshP0gqqHsCKltK9Ofv7NVkM5Wb6PxbAklYyHaCHGIrzeZ7iLiEGtL5lQ62t
	lytmE4cxOkFSaI/svohYG1LRhxupbkqEfos0M=
MIME-Version: 1.0
Received: by 10.204.71.141 with SMTP id h13mr1998855bkj.180.1295726838148;
	Sat, 22 Jan 2011 12:07:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Sat, 22 Jan 2011 12:07:18 -0800 (PST)
In-Reply-To: <AANLkTimSeB5GqQSyMtskAm_3O9h-MWfCJJz+FAFnnkB8@mail.gmail.com>
References: <AANLkTinz+p5J6K+XhohJJ=q7dD3X1kVGZDNA-4qOOH2W@mail.gmail.com>
	<AANLkTimSeB5GqQSyMtskAm_3O9h-MWfCJJz+FAFnnkB8@mail.gmail.com>
Date: Sat, 22 Jan 2011 18:07:18 -0200
X-Google-Sender-Auth: qVOG9KAUpxsaelubIkYS5n57xK0
Message-ID: <AANLkTin27ikNKV4v3D+e+cu_=SHv7Vv+0ef-z61irn60@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Sat, 22 Jan 2011 20:07:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 22, 2011 at 17:46, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Jan 22, 2011 at 10:06 AM, Otavio Salvador
>> =A0 cvs://anoncvs:anoncvs@anoncvs.handhelds.org/cvs;module=3Dipkg-utils
>>
>
> yeah hh.org is gone. So you need to rely on mirrors to get the tarballs
> add
>
> SOURCE_MIRROR_URL ?=3D "http://sources.openembedded.org/"
>
> to your local.conf and probably you also need to inherit own_mirrors

I think the recipe should be change to use this in this case. I know I
can use mirrors but the recipe ought to use a fetchable reference IMO.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


