Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0FCB97356B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 08:03:05 +0000 (UTC)
Received: by iecrl12 with SMTP id rl12so36916159iec.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 00:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5fMJaoihR6Gn1ipr/b9lsPrN6gX7xTq4bOFUYgisAq4=;
	b=e6t2WrtfCikM2eDmW3bkdw0Ip8ITnRccIB/1gwrAju/VOg4j8Tj/shHDQEFjtUzmCw
	ECVVzHGeu+XM55ShZHeMXdBoTXK7J+4e5RKldOpX4d30H7XHyul8w1L9PUvrGUTKtgk/
	sPfGogXTK0PbSgAXfXtjR8KLANZTq8DdQQi80fREtk5iqfHg8lbKmFFVbNcc+4sMxlLd
	zWfyfrrDQXbGCd1NEnGJJU6fhNKKR9NtynxOF+qHn4vCg2kIXE+7ympobo4yH47ZjBH4
	DzfagGZU5EvV/WXMdza6yORxMkBSTxTmpr8V4Cr6M3MfsNiEXitKGEH9RvdZZUj4p6XQ
	aWgg==
MIME-Version: 1.0
X-Received: by 10.50.66.198 with SMTP id h6mr26861314igt.22.1424160186610;
	Tue, 17 Feb 2015 00:03:06 -0800 (PST)
Received: by 10.107.138.30 with HTTP; Tue, 17 Feb 2015 00:03:06 -0800 (PST)
In-Reply-To: <20150216174719.GI2297@jama>
References: <1423651677-15387-1-git-send-email-sven.ebenfeld@gmail.com>
	<20150216174719.GI2297@jama>
Date: Tue, 17 Feb 2015 09:03:06 +0100
Message-ID: <CAD0=qkLQLHf4+i9jrARQZqwdEzVO4vJefigz6Ge-uQ3H5k7C-Q@mail.gmail.com>
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] stunnel: Update to 5.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Feb 2015 08:03:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I have posted an updated PATCH v2 to fix these qa issues.
Mit freundlichen Gr=C3=BC=C3=9Fen,
Sven Ebenfeld


2015-02-16 18:47 GMT+01:00 Martin Jansa <martin.jansa@gmail.com>:
> On Wed, Feb 11, 2015 at 11:47:57AM +0100, Sven Ebenfeld wrote:
>> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
>> ---
>>  .../recipes-support/stunnel/stunnel_4.56.bb            | 17 -----------=
------
>>  .../recipes-support/stunnel/stunnel_5.10.bb            | 18 +++++++++++=
+++++++
>>  2 files changed, 18 insertions(+), 17 deletions(-)
>>  delete mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.56=
.bb
>>  create mode 100644 meta-networking/recipes-support/stunnel/stunnel_5.10=
.bb
>
> Causes new QA warnings:
> stunnel-5.10: stunnel rdepends on libsystemd, but it isn't a build
> dependency? [build-deps]
> stunnel-5.10: stunnel rdepends on liblzma, but it isn't a build
> dependency? [build-deps]
>
>>
>> diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/m=
eta-networking/recipes-support/stunnel/stunnel_4.56.bb
>> deleted file mode 100644
>> index 74f2234..0000000
>> --- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -SUMMARY =3D "Program for providing universal TLS/SSL tunneling service"
>> -DESCRIPTION =3D "SSL encryption wrapper between remote client and local=
 (inetd-startable) or remote server."
>> -SECTION =3D "net"
>> -LICENSE =3D "GPLv2"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df41ebed8571077706fee0b860c4d=
6666"
>> -DEPENDS =3D "openssl zlib tcp-wrappers"
>> -
>> -RDEPENDS_${PN} +=3D "perl"
>> -
>> -SRC_URI =3D "https://www.stunnel.org/downloads/archive/4.x/${BP}.tar.gz=
"
>> -
>> -SRC_URI[md5sum] =3D "ac4c4a30bd7a55b6687cbd62d864054c"
>> -SRC_URI[sha256sum] =3D "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2e=
c8d2778a01c871293"
>> -
>> -inherit autotools
>> -
>> -EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_EXECPREFIXDIR}' --disable-fi=
ps"
>> diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.10.bb b/m=
eta-networking/recipes-support/stunnel/stunnel_5.10.bb
>> new file mode 100644
>> index 0000000..0feacc1
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/stunnel/stunnel_5.10.bb
>> @@ -0,0 +1,18 @@
>> +SUMMARY =3D "Program for providing universal TLS/SSL tunneling service"
>> +DESCRIPTION =3D "SSL encryption wrapper between remote client and local=
 (inetd-startable) or remote server."
>> +SECTION =3D "net"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D866cdc7459d91e092b174388fab8=
d283"
>> +
>> +DEPENDS =3D "openssl zlib tcp-wrappers"
>> +
>> +RDEPENDS_${PN} +=3D "perl"
>> +
>> +SRC_URI =3D "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz"
>> +
>> +SRC_URI[md5sum] =3D "a0edda805eb7d6ea600a230fb0979ea1"
>> +SRC_URI[sha256sum] =3D "032bfc1854f8a0b9e452343c36ec6b52c7e0daef0863423=
c6b13a61a7c92eb23"
>> +
>> +inherit autotools
>> +
>> +EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_EXECPREFIXDIR}' --disable-fi=
ps"
>> \ No newline at end of file
>> --
>> 1.8.1.rc3
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

