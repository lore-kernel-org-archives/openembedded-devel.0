Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id EB6806E630
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 14:12:45 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id g44-v6so1940645qtb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 07:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dRUb6GElSYvdJlz7QwZthPTMaFHJjO1tZ8J5Ia3+b/o=;
	b=sq4OkWjtlqc6NTvYMNBOZwZ4VuB7V8Ok0L5Yl04/62itxggq8JIeXs78mXrNGw2JHP
	9iGFaFuQntTcS5b+wJbScAK9UoPy+QsW/9Mx3J2+SX6Et7sCrCUuc7cRcVh868m2JaGY
	Y9rryqEANDQOQWmq+eniErdbbdYIqADzKJJGKi/gJk1wcxjyMf5t6ztVE4513EVpKIj+
	DmuadqW7naOIJj9l+NCx4O7+bA6vvgA/4P/Pl8YUKmCoH+5g4C1u1tn6WtA6r3qeg8KE
	M6CxmE6qEGlXzsPUFnKlvd52iWHowaLJQMrCQMEvHa4trrdGY7g90uhj/mLVnJo/wQGm
	Xd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dRUb6GElSYvdJlz7QwZthPTMaFHJjO1tZ8J5Ia3+b/o=;
	b=ahzY1pikPPtCkelMwpTqViU+TgsncVXWwXjkAAenKg38nmDG9wyJF83/zyPjkuQ1cE
	1TxgRGBMip1ywtP34KGBGbR+jZIEsATHcm5PNoZmepeppjkeTEK41cece6MO83br6p3M
	em75QZrUJpBG24F04+zag//yyQyFqxu43byXeDh+wKVzGjd6ysqKbiWJJyG2mLW6XNb6
	+a7p4c2ixZSvdkzz5iodTj0M6aH8XpsVDDU/GA4HwPjsAkGJ4B18HDl1jOTPaXaiSh+Z
	eiTzVyzy2b8gwiHILn0jrn1VMmSMGJraV9LeRi6irGaSNMOM0Z5qVQ5J3+KG/TZxCPEp
	1j/A==
X-Gm-Message-State: APzg51Ddv9OwaYpWRdIz29oWJZMdDithy2FCFWnTpMQNYq+yDJ06lD3H
	MZCc8CfXaRUy7qoDchZyqgM9GP+vO0SUuC5pE3Q=
X-Google-Smtp-Source: ANB0VdY/bIs2ktoAj+jZlpioWDgr3MAIcIinG7yVqP2GKSXmoisbQvpbX0vl2HCBlpdiyQ4iYzdWAbPMrEao99vTqgw=
X-Received: by 2002:a0c:87f8:: with SMTP id
	53-v6mr1602244qvk.228.1536761566524; 
	Wed, 12 Sep 2018 07:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20180912082642.35624-1-hongxu.jia@windriver.com>
	<8a566f88-4b87-b0a4-228f-dbc2bbb8981b@windriver.com>
In-Reply-To: <8a566f88-4b87-b0a4-228f-dbc2bbb8981b@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Sep 2018 07:12:20 -0700
Message-ID: <CAMKF1so5pxbk84E+cjXbzbmVJfg=dDzjJ1Ubnkw2yUk4_E_xDQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] [PATCH] cyrus-sasl: use autotools-brokensep to build in sources
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
X-List-Received-Date: Wed, 12 Sep 2018 14:12:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 12, 2018 at 1:28 AM Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
>
> Sorry for missing prefix `meta-networking' in subject
>
> //Hongxu
>
> On 2018=E5=B9=B409=E6=9C=8812=E6=97=A5 16:26, Hongxu Jia wrote:
> > The makefile of cyrus-sasl does not support build out of tree very well=
,
> > while using `--enable-ldapdb', there is a compile failure
> > [snip]
> > | powerpc-wrs-linux-gcc [snip] -I../common
> > |../../git/saslauthd/lak.c:58:10: fatal error: crypto-compat.h:
> > No such file or directory
> > [snip]
> >
> > The crypto-compat.h locates in git/common/, it should be
> > `-I../../git/common'

this should b fixable in source Makefile.am to use $(srcdir) in that
-I spec it might be either missing or ignoring the fact that S can be
different then B

> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >   meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb | 2 +=
-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.=
27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> > index a03712c..4c26989 100644
> > --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> > +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> > @@ -20,7 +20,7 @@ UPSTREAM_CHECK_URI =3D "https://github.com/cyrusimap/=
cyrus-sasl/archives"
> >
> >   S =3D "${WORKDIR}/git"
> >
> > -inherit autotools pkgconfig useradd systemd
> > +inherit autotools-brokensep pkgconfig useradd systemd
> >
> >   EXTRA_OECONF +=3D "--with-dblib=3Dberkeley \
> >                    --with-plugindir=3D'${libdir}/sasl2' \
>
>

