Return-Path: <laurent.gourvenec@qarnot-computing.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8B72B60191
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 09:34:44 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id r126so8824178oib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 02:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qarnot-computing-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=8hp2K96p7IKp5PRSMY5OzLCM7mG0dUCzaF8Cf2wMAUQ=;
	b=jGQ0ik+gFnS6DbmaSdLHqE1/tJNOFq9yClNAv7LIyj6vOBUWrbe5pC+jgSQahtqvzK
	aBYdpAeAUm+xs97E3RDmN4Q5R6Uj0T+aJ8MfMtFhG6s0vqXsoABhPJpjKsfzwrxX5qjK
	7eLO35ABS15j5QzYQjLb21/CrM/8K2zyL0bWVxNsgJXu8fLoPZSPhEGrW5UKjCTLL2gs
	t6+n85gv+pQXnL1bMUc1+rPG3SY5bNTjPGdlornCceYyT1sWoMYJOb0aIfnzvsG9WA0l
	rSyikAfhdZf7Vz+OjRqMCwkGd15T9OxMXQDiR6injeH9iu6OXM7PvmRhLf+s2/8NPt0Q
	oBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=8hp2K96p7IKp5PRSMY5OzLCM7mG0dUCzaF8Cf2wMAUQ=;
	b=ByPLvPNScau17b3YMW+sYP9jtkyXgXn7OsVRqpltKc04r5emr5AiE5F+cEPJ1CyBup
	hLdRpA6fQf8jfKHEeWrsc3f5/byZY+tv4N7rg5qi1O4LUUP0umHD7MRn4nNYPJUh2qJJ
	S835SCaWjxchQzcGGT5Y6A2gnc7pTNfuNiozD2l6U8Ky0o1p3rA1ftQQC/SB12JAQD0V
	rblRpRfLuFNitAYvK2D+z7QG+tBhtgNecAmFeNx5skQ2C8DuJQ9gdy824xFYaFfqD9BR
	0PWP6+iJdUxIzo5R25q5FiBeLJOs5q5zXEGJuGm7TnPWs395K7BFkn1WimSP4ffyOdyj
	IKsA==
X-Gm-Message-State: AE9vXwPrQtKs2TBSGAGMxTCEY1Z5/VqbN/W9OOyztZC2Ae64l53AecTlaM9rCHVEAtiUoNP1N+ggroHaez+06w==
X-Received: by 10.202.228.136 with SMTP id b130mr32176569oih.109.1474968885571;
	Tue, 27 Sep 2016 02:34:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.8.1 with HTTP; Tue, 27 Sep 2016 02:34:25 -0700 (PDT)
X-Originating-IP: [92.89.147.127]
In-Reply-To: <20160927091406.GA2643@jama>
References: <1474905372-17360-1-git-send-email-laurent.gourvenec@qarnot-computing.com>
	<20160927091406.GA2643@jama>
From: Laurent Gourvenec <laurent.gourvenec@qarnot-computing.com>
Date: Tue, 27 Sep 2016 11:34:25 +0200
Message-ID: <CAM8ewibD67paPCNszH_Q=F169QW2PNMJ7WA-Z9YK7XB9E_khNA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-cython: update SRC_URI for new download location
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
X-List-Received-Date: Tue, 27 Sep 2016 09:34:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E2=80=8BHello,=E2=80=8B

On Mon, Sep 27, 2016 at 11:14 GMT+02:00 Martin Jansa wrote:
> On Mon, Sep 26, 2016 at 05:56:12PM +0200, Laurent Gourv=C3=A9nec wrote:
>> Signed-off-by: Laurent Gourv=C3=A9nec <laurent.gourvenec@qarnot-computin=
g.com>
>
>  Applying: python-cython: update SRC_URI for new download location
>  error: meta-oe/recipes-devtools/python/python-cython_0.15.1.bb: does not
>  exist in index
>  Patch failed at 0001 python-cython: update SRC_URI for new download
>  location
>
>> ---
>>  meta-oe/recipes-devtools/python/python-cython_0.15.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
>> index 0bf057a..65db532 100644
>> --- a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
>> +++ b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
>> @@ -8,7 +8,7 @@ SRCNAME =3D "Cython"
>>  BBCLASSEXTEND =3D "native"
>>  PR =3D "r3"
>>
>> -SRC_URI =3D "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz \
>> +SRC_URI =3D "
https://pypi.python.org/packages/source/C/Cython/Cython-${PV}.tar.gz \
>>
file://0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch \
>>  "
>>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
>> --
>> 2.1.4

Sorry, I should
=E2=80=8Bh=E2=80=8B
ave
=E2=80=8Bspecified: this patch is for the branch "daisy".

--
=E2=80=8B =E2=80=8B

Laurent Gourv=C3=A9nec

