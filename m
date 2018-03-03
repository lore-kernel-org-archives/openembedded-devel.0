Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 299DC78A3F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 10:22:41 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id m19so4820771pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Mar 2018 02:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6NlJypxSpZkeJYOlTOEepi/vsgTnWM4CyIfd7zDscDI=;
	b=K1ZE/KR2qCBF5cpwfRMrE/xuFqRnY5TiwEd5tJYyDh3GrAn1PE9/pifayJvnr5Niqd
	0VHIEVkJU8fblecVrpRDoqftwoW7LAozCQT5RPkmjQjtfwmMsHhl9Y8TK9r6xU/84EcQ
	NrClDS+rfJ6XcFul5j+pimoZ3iV644NYsZ8wJiM2RrcI3XJCixzMHmgOXItRr+SZkJzK
	9tbzYCrGrOUb5mmiKGW+ZRZTUA1xY29/CjvOG5s85FaEv8q13Nmb30UPf3FOZcqyNFUg
	ywe8G337uOy+ijh0G1EvARW0rneJx0lqg/y+tag71zFa76HUhedKC7zM4R7kTZacHK0L
	WfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6NlJypxSpZkeJYOlTOEepi/vsgTnWM4CyIfd7zDscDI=;
	b=Rha1eQaQnODrwHBGIM72eQecXRvTAeELs/260ApNhMJJEWNsvQ3U5bw6q3IbkdEDb1
	D6EJi1q4EvNehrO3rcoUyifEClsEHogGtgsNYoZ3e7oxlQ/ACaMS1ERhQvX3kqmbqh49
	2QdJMXgAYi4rxzNG7a3AkwhntRWwUW5oYt5ZiHq9G6UYi2mJEyIKwJf5dC/a6FhkboBX
	RJV7J2HzFKvdDAYPxXI5eycF1rOVpesy8RfOyew8mqmp2E4t85pPFzed5JlFbGZmpnyH
	Tso6wJ7e1kvigQf1iEl3c6ceaSf89ubdmmvjtLcsLCHgoO43cjXFQp3Fm8C9FQADmhJq
	05mA==
X-Gm-Message-State: APf1xPA26DDlWos6RwdK/YJN0zyS+bummYGankD4FiIpjAjpzqcwu2fC
	0Tnyrg9gajoeHc1g3FsR85q4V2epjcLL3U5k3zI=
X-Google-Smtp-Source: AG47ELviHJcJbkWYuDI63QsyMgQV16IVYoOasqmkUL6475pMpMjEgK8TIXD57Tkv+up3mNGPl8MlS0k5On7woNF46Gc=
X-Received: by 10.98.28.202 with SMTP id c193mr8626292pfc.109.1520072563072;
	Sat, 03 Mar 2018 02:22:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Sat, 3 Mar 2018 02:22:12 -0800 (PST)
In-Reply-To: <CADNbA1rhxuwEjo=p=FsjB8+YC_jdU=U25xYgxSgRd=4ws6+UuA@mail.gmail.com>
References: <1519999561-9599-1-git-send-email-derek@asterius.io>
	<3f95e0a7-4663-cb73-6ab1-7eed4ab8927f@gmail.com>
	<CADNbA1p09wdEJGEW7d4wpoVWMLEzEKPAaF6PvPEtdOJFf2f0wA@mail.gmail.com>
	<CAMKF1srYnC2_hNEHfHC6hoH5wp8Y+OHqAD6fZpFzqpTHxOqwXQ@mail.gmail.com>
	<CADNbA1p=3uip_ROcCBwxZ4GJs0grUe1v6vhN5NoRUyacVJnS5w@mail.gmail.com>
	<CANx9H-CserwUFp2PyQEnYxAoL_dY6xwvJvz6ExuPwmbYOaLsnQ@mail.gmail.com>
	<CADNbA1qDZ+fdr7a6_408hTVeaUojT+OFYjyoNdVy5kiaeK=gpg@mail.gmail.com>
	<CAMKF1sq1qDUaq4-D=kP8d5j=ckwyA5o+K3WTd+PA=EsXReTReA@mail.gmail.com>
	<CADNbA1rhxuwEjo=p=FsjB8+YC_jdU=U25xYgxSgRd=4ws6+UuA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Mar 2018 02:22:12 -0800
Message-ID: <CAMKF1sofJMBiDiPRTY1SexqYVN6uqoqohV3rJfub+DFr_gNdwQ@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
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
X-List-Received-Date: Sat, 03 Mar 2018 10:22:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 2, 2018 at 10:06 PM, Derek Straka <derek@asterius.io> wrote:
> Sure.  I'll start following those requirements, but honestly one of the
> reasons I dislike contributing to anything yocto/meta-oe is the lack of
> clear rules and consistency in general.  Most of the wiki page are
> completely out of date and none of the style items are consistently
> enforced.  It makes it difficult to contribute and discourages contributi=
ons
> at least for me.

Its a good point and I think if there are ideas how to improve this
situation would help
the community in general. My intention to provide feedback on your patch
was not to discourage you from contributing but to make the patch a bit bet=
ter.
you can ignore the feedback if you think it is inadequate and not important
but certainly not feel discouraged. Your contributions are always appreciat=
ed.

>
> On Mar 3, 2018 12:57 AM, "Khem Raj" <raj.khem@gmail.com> wrote:
>
> On Fri, Mar 2, 2018 at 9:22 PM, Derek Straka <derek@asterius.io> wrote:
>> Overall, it seems like there are bigger issues to worry about.  I just
>> want
>> consistency.  I'm willing to conform to whatever people want.
>>
>
> There is no issue here.
>
> read through several reviews on ML where license checksums are changed,
> you will find reviewers calling out of explanations if it was missing.
>
> moreover Its also described in commit guidelines
>
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Describ=
ing_license_changes
>
>
>> On Mar 3, 2018 12:19 AM, "Tim Orling" <ticotimo@gmail.com> wrote:
>>>
>>> I usually would have said =E2=80=9Cthe copyright year changed, but the =
terms
>>> remain the same=E2=80=9D, but I agree we need consistency. Tooling to m=
ake the
>>> license diff easy to generate is probably the key (and is in progress).
>>>
>>> Thank you again, Derek, for all your efforts to keep meta-python up to
>>> date.
>>>
>>> And thank you to Khem for taking the time to review and comment when fe=
w
>>> others ever do.
>>>
>>> On Fri, Mar 2, 2018 at 8:45 PM Derek Straka <derek@asterius.io> wrote:
>>>>
>>>> This is the exact same commit message I've used at least 10s of times
>>>> without any negative feedback.  Saying the terms remain the same seems
>>>> sufficient to me to acknowledge the fact I looked at the license and i=
t
>>>> was
>>>> reviewed as you stated.  I can start putting the diff in the commit if
>>>> it
>>>> adds value but let's start being consistent as a community in what we
>>>> expect.
>>>>
>>>> Even as a maintainer of several layers in meta-openembedded I don't kn=
ow
>>>> what we as a community expect...
>>>>
>>>> On Mar 2, 2018 11:34 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>>>>
>>>> On Fri, Mar 2, 2018 at 8:15 PM, Derek Straka <derek@asterius.io> wrote=
:
>>>> > What more would you like in the commit message?  The license terms a=
re
>>>> > the
>>>> > same; the copyright moved to 2018.  Do we really need to put the
>>>> > results
>>>> of
>>>> > the diff in the commit message?
>>>> >
>>>>
>>>> Not strictly, but you can. In general a line or two about the reason
>>>> is always a good thing.
>>>> The commit message wasn't clear about it.
>>>> This is essentially to let users as well as reviewers know that licens=
e
>>>> changes
>>>> were reviewed and a line in commit message is there for later to go ba=
ck
>>>> and see what changed
>>>>
>>>>
>>>> >
>>>> > On Mar 2, 2018 9:52 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>>>> >
>>>> > On 3/2/18 6:06 AM, Derek Straka wrote:
>>>> >> Update the license checksum and verify the terms remain the same
>>>> >>
>>>> >> Signed-off-by: Derek Straka <derek@asterius.io>
>>>> >> ---
>>>> >>  meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>>> >> |
>>>> >> 6
>>>> >> +++---
>>>> >>  .../{python-sqlalchemy_1.1.15.bb =3D> python-sqlalchemy_1.1.17.bb}
>>>> >> |
>>>> >> 0
>>>> >>  .../{python3-sqlalchemy_1.1.15.bb =3D> python3-sqlalchemy_1.1.17.b=
b}
>>>> >> |
>>>> >> 0
>>>> >>  3 files changed, 3 insertions(+), 3 deletions(-)
>>>> >>  rename
>>>> >> meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb
>>>> >> =3D> python-sqlalchemy_1.1.17.bb} (100%)
>>>> >>  rename
>>>> >> meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb
>>>> >> =3D> python3-sqlalchemy_1.1.17.bb} (100%)
>>>> >>
>>>> >> diff --git
>>>> >> a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>>> >> b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>>> >> index 2683a6a..0c191ae 100644
>>>> >> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>>> >> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>>> >> @@ -2,13 +2,13 @@ DESCRIPTION =3D "Python SQL toolkit and Object
>>>> >> Relational
>>>> >> Mapper that gives \
>>>> >>  application developers the full power and flexibility of SQL"
>>>> >>  HOMEPAGE =3D "http://www.sqlalchemy.org/"
>>>> >>  LICENSE =3D "MIT"
>>>> >> -LIC_FILES_CHKSUM =3D
>>>> >> "file://LICENSE;md5=3D452f4b8adb0feba42e5be5f1fbfbf538"
>>>> >> +LIC_FILES_CHKSUM =3D
>>>> >> "file://LICENSE;md5=3Db1c412c9d8d1ce018f7a9374407c22bb"
>>>> >>
>>>> >
>>>> > what changed here ?
>>>> >
>>>> >
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

