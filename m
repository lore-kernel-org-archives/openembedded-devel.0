Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7B25678995
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 06:02:35 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id f23-v6so6927277plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 22:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Zp5S3D25lKFqOtHlVdmRl2D9zjw2yoa8D/sO+vPvmqw=;
	b=iNJrEBxpk9Ak4pFVBwV/YYEyYEPoDvIvkB7pBXIBwI6MNk41sfT/0ZD6l4FJQAsrN4
	EvGPlIWRbtfS2OBS7xPGw1am9UEjzzwvPx7ADmwH9HOC2APoM7KYPXh5FD1sNjneD5Q6
	spuLrqx/QF1rb1U/G4uhrxl9eSKvrg3ZJjHRAkpkDXmxw/Kiec4vcP3ylUJeSZnbZkUR
	PYudZ/Jskk6080jezZ6LZUnZqezWF9h9kIRQx1qoC4YwlRWlt1bZqcfmrHpjgQwePaPk
	bgrycudZAUpBe/g0LVx8cbXaeiJSzlo8Gbn2kuz4bh4nyyAzEQope8/Nlba1HZU+euUl
	A2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Zp5S3D25lKFqOtHlVdmRl2D9zjw2yoa8D/sO+vPvmqw=;
	b=lFV9ZR+HxTf72rdeXcyvPvym6o7up+jEI63aNKrpmGS/HohAG6n2hqHVC7G+yQiyfW
	6Z85YYZPAzxA13PEnZbKP9QPDeQdhcrCY87MsD7PlnOCefHKVcIwA89ywBj3bVMVjpn1
	oP9re/emvDNAI2ZwNajNwKBSUT5uZbPecsu1wtwjTHhKR8+Qu4iuwBY7UG0+E+8vBLDO
	+7EsrX6GP8d1dFaqCxLh/N9a/FcILGzx4JmGjS3xVcajXtUdPZ85O86a5jB2cCjaPSbI
	n1khRGQyq8cR8ySLUWZOGMV+kyoPcGlTZw2C2sL3mVFiRBq9bN0WCp1V2IHoInuRT69Q
	Zzug==
X-Gm-Message-State: APf1xPC9Iqpa4yCgCEo/vlm8ugsU4kzxTeiI6evG5zvryQT6qCzBL9tF
	HMDdV6jalBibFkklqNmr2JUKYwmZ0QzM5DA9Fk4=
X-Google-Smtp-Source: AG47ELvRR80pM+QV6vri2lMh8jY92erOUKF9k0Q/qkHm0y8R0wjpm0ZG4GbslluFD8lvtU2EJTToBnI+zttbzu0yy1I=
X-Received: by 2002:a17:902:6b48:: with SMTP id
	g8-v6mr7421941plt.151.1520056956570; 
	Fri, 02 Mar 2018 22:02:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Fri, 2 Mar 2018 22:02:06 -0800 (PST)
In-Reply-To: <CANx9H-CserwUFp2PyQEnYxAoL_dY6xwvJvz6ExuPwmbYOaLsnQ@mail.gmail.com>
References: <1519999561-9599-1-git-send-email-derek@asterius.io>
	<3f95e0a7-4663-cb73-6ab1-7eed4ab8927f@gmail.com>
	<CADNbA1p09wdEJGEW7d4wpoVWMLEzEKPAaF6PvPEtdOJFf2f0wA@mail.gmail.com>
	<CAMKF1srYnC2_hNEHfHC6hoH5wp8Y+OHqAD6fZpFzqpTHxOqwXQ@mail.gmail.com>
	<CADNbA1p=3uip_ROcCBwxZ4GJs0grUe1v6vhN5NoRUyacVJnS5w@mail.gmail.com>
	<CANx9H-CserwUFp2PyQEnYxAoL_dY6xwvJvz6ExuPwmbYOaLsnQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Mar 2018 22:02:06 -0800
Message-ID: <CAMKF1spx344kQRy1AfDGPsxrYXRUbtv8x4sCeOVbZeSNUQ4+BA@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Sat, 03 Mar 2018 06:02:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 2, 2018 at 9:19 PM, Tim Orling <ticotimo@gmail.com> wrote:
> I usually would have said =E2=80=9Cthe copyright year changed, but the te=
rms remain
> the same=E2=80=9D, but I agree we need consistency. Tooling to make the l=
icense diff
> easy to generate is probably the key (and is in progress).

This is documented it in commit guidelines for OE, so consistency is
soft imposed.
and I expect maintainers/reviewers to help point this out whenever they can
but tooling would certainly help,

this information is very helpful to end users, who ship products and
have to meet compliance
requirements with their licensing policy, whenever they upgrade packages

>
> Thank you again, Derek, for all your efforts to keep meta-python up to da=
te.
>
> And thank you to Khem for taking the time to review and comment when few
> others ever do.
>
> On Fri, Mar 2, 2018 at 8:45 PM Derek Straka <derek@asterius.io> wrote:
>>
>> This is the exact same commit message I've used at least 10s of times
>> without any negative feedback.  Saying the terms remain the same seems
>> sufficient to me to acknowledge the fact I looked at the license and it
>> was
>> reviewed as you stated.  I can start putting the diff in the commit if i=
t
>> adds value but let's start being consistent as a community in what we
>> expect.
>>
>> Even as a maintainer of several layers in meta-openembedded I don't know
>> what we as a community expect...
>>
>> On Mar 2, 2018 11:34 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>>
>> On Fri, Mar 2, 2018 at 8:15 PM, Derek Straka <derek@asterius.io> wrote:
>> > What more would you like in the commit message?  The license terms are
>> > the
>> > same; the copyright moved to 2018.  Do we really need to put the resul=
ts
>> of
>> > the diff in the commit message?
>> >
>>
>> Not strictly, but you can. In general a line or two about the reason
>> is always a good thing.
>> The commit message wasn't clear about it.
>> This is essentially to let users as well as reviewers know that license
>> changes
>> were reviewed and a line in commit message is there for later to go back
>> and see what changed
>>
>>
>> >
>> > On Mar 2, 2018 9:52 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>> >
>> > On 3/2/18 6:06 AM, Derek Straka wrote:
>> >> Update the license checksum and verify the terms remain the same
>> >>
>> >> Signed-off-by: Derek Straka <derek@asterius.io>
>> >> ---
>> >>  meta-python/recipes-devtools/python/python-sqlalchemy.inc           =
|
>> >> 6
>> >> +++---
>> >>  .../{python-sqlalchemy_1.1.15.bb =3D> python-sqlalchemy_1.1.17.bb}  =
  |
>> >> 0
>> >>  .../{python3-sqlalchemy_1.1.15.bb =3D> python3-sqlalchemy_1.1.17.bb}=
  |
>> >> 0
>> >>  3 files changed, 3 insertions(+), 3 deletions(-)
>> >>  rename
>> >> meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb
>> >> =3D> python-sqlalchemy_1.1.17.bb} (100%)
>> >>  rename
>> >> meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb
>> >> =3D> python3-sqlalchemy_1.1.17.bb} (100%)
>> >>
>> >> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.in=
c
>> >> b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> >> index 2683a6a..0c191ae 100644
>> >> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> >> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> >> @@ -2,13 +2,13 @@ DESCRIPTION =3D "Python SQL toolkit and Object
>> >> Relational
>> >> Mapper that gives \
>> >>  application developers the full power and flexibility of SQL"
>> >>  HOMEPAGE =3D "http://www.sqlalchemy.org/"
>> >>  LICENSE =3D "MIT"
>> >> -LIC_FILES_CHKSUM =3D
>> >> "file://LICENSE;md5=3D452f4b8adb0feba42e5be5f1fbfbf538"
>> >> +LIC_FILES_CHKSUM =3D
>> >> "file://LICENSE;md5=3Db1c412c9d8d1ce018f7a9374407c22bb"
>> >>
>> >
>> > what changed here ?
>> >
>> >
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

