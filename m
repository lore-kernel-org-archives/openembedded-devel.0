Received: from mail-iw0-f184.google.com ([209.85.223.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NrdDj-0006Ej-4g
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 21:18:36 +0100
Received: by iwn14 with SMTP id 14so176061iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 13:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GWON+F4yQmhAsJCWIVd0Vz6/Yloz9RH+y1LP2x27wcc=;
	b=s6fgPGBdeBqqVBE4J6WN3GB3OtjK1cQYcbntdVt5ufsKAT7O6Rcr8MzsWVEookXjSw
	7P3R5S2sS5JElfxO5iXrMSJy3vdBF38hhKxPNedhrj7Houljz7tph9Rs1JeTST5mOwEC
	rN5NmWVTKCoShoQ2mSHmKc7621jA1zRwdf2n0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dHWrA3b/UGEk91J2b7v1pobnd86oymp/nJN8ED+7xU6+JfQvTarm6pryIDhdmV2g7R
	nMLlw2RdTYyMMVuH1FThQaUuXZ6TxtuZ5QYkb4RY1EGKoni1ga23BEnqlPZ+B8cQdbqJ
	nt7zu0LyR9kda8CHocaSXG9AK4ITQfSzaRP7w=
MIME-Version: 1.0
Received: by 10.231.161.138 with SMTP id r10mr1251909ibx.34.1268770527661; 
	Tue, 16 Mar 2010 13:15:27 -0700 (PDT)
In-Reply-To: <201003160004.24164.roman@khimov.ru>
References: <201003151658.45421.ml@vdm-design.de>
	<201003160004.24164.roman@khimov.ru>
Date: Tue, 16 Mar 2010 13:15:27 -0700
Message-ID: <19c1b8a91003161315i577fe8b7ne7228be1696902a9@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.184
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qemu: fails to build without zlib-dev installed on buildhost
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
X-List-Received-Date: Tue, 16 Mar 2010 20:18:36 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/3/15 Roman I Khimov <roman@khimov.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB =
15 =CD=C1=D2=D4=C1 2010 18:58:45 =C1=D7=D4=CF=D2 Thomas Zimmermann
> =CE=C1=D0=C9=D3=C1=CC:
>> Please check the following patch, as i've no exprience with
>> BBCLASSEXTEND=3D"native" and i don't want to break qemu.
>
> Thanks for reporting, first of all.
>
>> -DEPENDS =3D "zlib"
>> +DEPENDS =3D "zlib-native"
>
> zlib-native is already a dependency for qemu-native thanks to BBCLASSEXTE=
ND
> magic.
>
>> =9Ado_configure() {
>> + =9A =9A =9A export QEMU_CFLAGS=3D"-I${STAGING_INCDIR_NATIVE} ${QEMU_CF=
LAGS}"
>> =9A =9A =9A =9A ${S}/configure --prefix=3D${prefix} ${EXTRA_OECONF}
>> =9A}
>
> And this one should only be added for native.

IMO this part seems appropriate for BBCLASSEXTEND also. Its common enough

>
> So I think something like attached patch should be a bit better. Please t=
ry
> that.
>
> --
> =9Ahttp://roman.khimov.ru
> mailto: roman@khimov.ru
> gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


