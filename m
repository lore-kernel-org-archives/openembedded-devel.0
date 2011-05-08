Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ6eH-0000MC-Vo
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 18:16:02 +0200
Received: by bwz5 with SMTP id 5so3923334bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=N1gVIEJiweQNkAAalJ+j/Lss6JBX7uexQ0aCo9xVWQY=;
	b=ThZmNwI5+if05iJx0tIzcZJaqWmrzsz9ukQY7M2Behoox9+7Rvvf/OEoHCR15Dwm7h
	y0t9OopWvsvUSUeTJj0gynbp3k8kXAuVf7/GT+Dj24zVfPTV+an+YuFio2iwzgbGpj08
	1n6zdBvSEz96ZHEmb+w9PndEqDzTYXKNWjlto=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=HAyG8S/v0XB5IPo7i+gh814Q7kTaCpEuaKrcAK0eA1So66fuLsqcsJodonFVFMOjdP
	JCXZIuLEom0VGe/84qux0YiH7/CGrfeCoenRh/trcbQXLyt9Dd4Y3aMKsWO9XosKX5pp
	8cAq+zRvro1vJkjCg26JBmcpgvnLLZzIAR6nM=
MIME-Version: 1.0
Received: by 10.204.7.209 with SMTP id e17mr358050bke.162.1304871198587; Sun,
	08 May 2011 09:13:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Sun, 8 May 2011 09:13:18 -0700 (PDT)
In-Reply-To: <1304836455.4124.7.camel@mattotaupa>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
	<1304822586-14872-2-git-send-email-otavio@ossystems.com.br>
	<1304836455.4124.7.camel@mattotaupa>
Date: Sun, 8 May 2011 13:13:18 -0300
X-Google-Sender-Auth: MyZEJXvdcsbwhSD_aXFJSk3Yp7I
Message-ID: <BANLkTiks1TaPjenOr-Y1_f0VU2pOBaD=-g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 02/11] ntfs-3g-ntfsprogs: add 2011.4.12 recipes
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
X-List-Received-Date: Sun, 08 May 2011 16:16:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 8, 2011 at 03:34, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
...
>> +inherit autotools
>> +
>> +EXTRA_OEMAKE =3D "LDCONFIG=3Decho"
>
> A short explanation in the commit message or as a comment why this is
> needed would be nice.

It is required otherwise it calls ldconfig at install

>> +PACKAGES =3D. "ntfs-3g ntfsprogs libntfs-3g"
>
> `=3D+` is more commonly used?
>
>> +FILES_ntfs-3g =3D "${base_sbindir}/*.ntfs-3g ${bindir}/ntfs-3g*"
>> +RDEPENDS_ntfs-3g +=3D "fuse"
>> +
>> +FILES_ntfsprogs =3D "${base_sbindir}/* ${bindir}/* ${sbindir}/*"
>> +FILES_libntfs-3g =3D "${libdir}/*.so.*"
>> +
>> +SRC_URI[md5sum] =3D "9c4ce318373b15332239a77a9d2a39fe"
>> +SRC_URI[sha256sum] =3D "aa8c747f0bfe819b2387b05e12db8d35e4ac96dcb243287=
3a0b939e248b2ee05"
>
> Maybe again at the top.

Ok.



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


