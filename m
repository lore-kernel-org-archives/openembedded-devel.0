Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id DBC836FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Oct 2017 18:41:28 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id k62so2516854wrc.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Oct 2017 11:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uDBBJda+nEUXU7di4pRtMGZRsUYqelkHif4JgqvkFAQ=;
	b=PcvHeE2WuLTKKb0LFAY3iuQ9eN3SdxoneSeg8niI3vW6ZBYvDJkK0XdZDb2c6Il1q8
	TiG88Mr5pIjWhH/xHyio2W3/tUPGJROOe+jS/QR58Cf/yDqyU8pKa8CE3+oUau4DhDZb
	D5H1Fe0OJ+WZiol4obiewW3UAZvN4NB/h/2rEmLKntEJrf0TElvt5HyQZEdFMz5DSoX9
	x56phQbbSWOo1At9GUJEmahK2BT7HyFnNB8LlXZ3skbREjIVTMdvQy7p1YKulpmxFDeF
	MJrYmjbKty2hXE9cyVehXX6/B9TeebxDKMZzSPN4aSGejQbfLJWSNSWATYo7lav2Q145
	IFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uDBBJda+nEUXU7di4pRtMGZRsUYqelkHif4JgqvkFAQ=;
	b=eP77pdS5enz4xU0UZTRiwn7qEvdL8kJRugtS0R/MlpSfReEbAehuHqXt7YT2Asy2c7
	uds+woX/c6D8z4jQXbmNLcGFQYaMXRG/Xd0JUBy6J7auPhou/ql/RH/Q/3jeROJhPHL8
	T0QF3kwOco6R73EoyswlNmmV51Qce19ki3O4nmmMT5OzsJJ1vcwU8Bi840ISDkKpA85Y
	cQQ3nELdBKy7evC6eVudp9zERkMJknGYyKP5nchqCFeBx4SqS2vjuHwvonVsYz+KT1tF
	5Sy778dtFTWDvIHZl5G48FgR3jYfBsTVsrq4CzgjOO6M5j0yuPhBjuapnblCD+ZzyF9U
	BKBw==
X-Gm-Message-State: AMCzsaU+20VE+wTycdPBcUZcw7RjMakO5QuW7bR123tURD2BO/CWVaij
	E0wwrJfpOE+apqPgYoynruWc41n8A0mr79UbIBo=
X-Google-Smtp-Source: AOwi7QDwjNVJRQS+KR3mbOGI2c7W0zZ/FbvmVWN/wH36JF0IG9clvi1pjKLKkhTFSr9BF1Xmn0KaKFRyYlSpfHHbjwc=
X-Received: by 10.223.158.210 with SMTP id b18mr6100448wrf.99.1506883289848;
	Sun, 01 Oct 2017 11:41:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.10 with HTTP; Sun, 1 Oct 2017 11:41:29 -0700 (PDT)
In-Reply-To: <47BE632C-49AC-4509-9E45-A00124619DF5@linux.intel.com>
References: <1506673565-17289-1-git-send-email-guy@guy-morand.ch>
	<47BE632C-49AC-4509-9E45-A00124619DF5@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 1 Oct 2017 20:41:29 +0200
Message-ID: <CA+chaQcTrzhT+2cQXwqxan7Nq6fM-K8YASJWTRXYAS7hEWEVhA@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] Add python pandas recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Oct 2017 18:41:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also missing Signed-off-by line.

On Fri, Sep 29, 2017 at 7:37 PM, Tim Orling <
timothy.t.orling@linux.intel.com> wrote:

>
> > On Sep 29, 2017, at 1:26 AM, Guy Morand <guy@guy-morand.ch> wrote:
> >
> > =E2=80=94
> > <snip>
> > diff --git a/meta-python/recipes-devtools/python/python-pandas_0.20.3.b=
b
> b/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
> > new file mode 100644
> > index 0000000..f4c486b
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
> > @@ -0,0 +1,10 @@
> > +inherit setuptools
> > +require python-pandas.inc
> > +
> > +RDEPENDS_${PN} +=3D " \
> > +  ${PYTHON_PN}-json \
> > +  ${PYTHON_PN}-importlib \
> > +  "
> > +
> > +SRC_URI[md5sum] =3D "4df858f28b4bf4fa07d9fbb7f2568173"
> > +SRC_URI[sha256sum] =3D =E2=80=9Ca777e07633d83d546c557064201795
> 51c8e01075b53c497dcf8ae4036766bc66"
>
> These SRC_URI checksum lines should go in the python-pandas.inc file,
> rather than duplicate them in both the python-pandas and python3-pandas
> files.
>
> It is quite common now for the =E2=80=9Cversion specific=E2=80=9D files t=
o only be the
> =E2=80=9Cinherit=E2=80=9D line and the =E2=80=9Crequire foo.inc=E2=80=9D =
line.
>
> DRY and KISS.
>
> > diff --git a/meta-python/recipes-devtools/python/python3-
> pandas_0.20.3.bb b/meta-python/recipes-devtools/python/python3-
> pandas_0.20.3.bb
> > new file mode 100644
> > index 0000000..81dd360
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb
> > @@ -0,0 +1,5 @@
> > +inherit setuptools3
> > +require python-pandas.inc
> > +
> > +SRC_URI[md5sum] =3D "4df858f28b4bf4fa07d9fbb7f2568173"
> > +SRC_URI[sha256sum] =3D "a777e07633d83d546c557064201795
> 51c8e01075b53c497dcf8ae4036766bc66"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

