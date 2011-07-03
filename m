Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QdINk-0007UN-2W
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jul 2011 10:50:24 +0200
Received: by fxh10 with SMTP id 10so4711798fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jul 2011 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=0qaK5Zh2XnV5l2VF4YVfshf9YzdKMZnkxMrj9kWf9+M=;
	b=KDXdvaSjpZJ9kbiWZQn25TIyXjx2uNg3FlZm6OYq4EJ5/w6+r5Q+NO+hGaB14bXbPm
	EPM1ZRyhOs5U9RiH+QyGA6Wwcisp+UuiJ6121Io5l1aPxLqS3hBxyn8B+H0v7qouhsvq
	fxukIi3pYR84MrOdgefLxoxX6f+AFsI8AkPDo=
Received: by 10.223.158.130 with SMTP id f2mr7701032fax.61.1309682797100; Sun,
	03 Jul 2011 01:46:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.94.68 with HTTP; Sun, 3 Jul 2011 01:46:17 -0700 (PDT)
In-Reply-To: <1309610407.4228.12.camel@mattotaupa>
References: <cover.1309608953.git.michael.lippautz@gmail.com>
	<06120dde2158fdb5902066f18c2c1b817172094a.1309608953.git.michael.lippautz@gmail.com>
	<1309610407.4228.12.camel@mattotaupa>
From: Michael Lippautz <michael.lippautz@gmail.com>
Date: Sun, 3 Jul 2011 10:46:17 +0200
Message-ID: <CACVrrMk-vNBc7ts3KRifyPceGLC59e-Jf6dxy+omo89r4u-LZA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/4] sqlalchemy: Add initial version
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
X-List-Received-Date: Sun, 03 Jul 2011 08:50:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/7/2 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Samstag, den 02.07.2011, 14:20 +0200 schrieb Michael Lippautz:
>
> =A0 =A0 =A0 =A0sqlalchemy: Add version 0.7.1 (initial recipe)
>
>> * Backends have to be installed separately depending on which are needed=
. See
>> =A0 http://www.sqlalchemy.org/docs/core/engines.html for possible backen=
ds.
>
> Does that mean those backends are not packaged yet for OE?

Yes, most of them atleast. I only use sqlite3 (which is available) on
my devices, though.
>
>> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
>> ---
>> =A0.../python/python-sqlalchemy_0.7.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 15 +++++++++++++++
>> =A01 files changed, 15 insertions(+), 0 deletions(-)
>> =A0create mode 100644 meta-oe/recipes-devtools/python/python-sqlalchemy_=
0.7.1.bb
>>
>> diff --git a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb =
b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
>> new file mode 100644
>> index 0000000..ffcb024
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
>> @@ -0,0 +1,15 @@
>> +DESCRIPTION =3D "Python SQL toolkit and Object Relational Mapper that g=
ives \
>> +application developers the full power and flexibility of SQL"
>> +HOMEPAGE =3D "http://www.sqlalchemy.org/"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De88f48967a8bd1fe88f5425f7e65=
9dbf"
>> +SRCNAME =3D "SQLAlchemy"
>
> This should go after `PR` as you also did in `pyudev`.
>
>> +PR =3D "r0"
>> +
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/sqlalchemy/${SRCNAME}-${PV}.tar.gz"
>> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
>> +
>> +inherit setuptools
>> +
>> +SRC_URI[md5sum] =3D "76e2e1e48b8047f1ca7023f143374aef"
>> +SRC_URI[sha256sum] =3D "eedd2d63d6404d9bbe3c4c6a63a5442d2c2650b862f9c10=
f721cfae4a735d05a"
>
> Please right below `SRC_URI`.
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


