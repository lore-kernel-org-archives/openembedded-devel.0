Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 41F1678441
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 11:26:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1520076383; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=WYxzTbfchqIn3iXTYXkchNdEbk+WPxuE1gGt/aQ+CCg=;
	b=nujha4uiHYxCT/7JYDeCt9DIRROSPiLzFuD9GBsed1BhSfex+pkz+eF1DHxcILNdBTLsSuJZ
	2aWUBIL0uht5uRsz2VSBeU8Bgm1l/cA6qffY8Mr/N04zFFoRdVh1T5JwSEpcb+HxPRwwmjYi
	Ex8C/+jeUSLK78rnqh6FUxhi8W8=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mxa.mailgun.org with ESMTP id 5a9a865f.7ff53868ab30-smtp-out-n03;
	Sat, 03 Mar 2018 11:26:23 -0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id l25so15085207qtj.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Mar 2018 03:26:22 -0800 (PST)
X-Gm-Message-State: AElRT7EBiv9KSkZsgrydf8BJj5p2bi6ODpOQ6cC8KbetPbf7lKy4CXrk
	WdoECUugHsTCKDu+sZX/cL9Ov5ELMSbCuSPInMk=
X-Google-Smtp-Source: AG47ELtIal18/DOOCN0ntz8KLlAg6Zcw4gk5yWDt9HB4WebZmK7c7uTI5RcZphx8dmeFWdOYBg6+fpEFVacQmYOuzeA=
X-Received: by 10.200.50.155 with SMTP id z27mr12537800qta.250.1520076381912; 
	Sat, 03 Mar 2018 03:26:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.35 with HTTP; Sat, 3 Mar 2018 03:26:21 -0800 (PST)
Received: by 10.140.108.35 with HTTP; Sat, 3 Mar 2018 03:26:21 -0800 (PST)
In-Reply-To: <CAMKF1sofJMBiDiPRTY1SexqYVN6uqoqohV3rJfub+DFr_gNdwQ@mail.gmail.com>
References: <1519999561-9599-1-git-send-email-derek@asterius.io>
	<3f95e0a7-4663-cb73-6ab1-7eed4ab8927f@gmail.com>
	<CADNbA1p09wdEJGEW7d4wpoVWMLEzEKPAaF6PvPEtdOJFf2f0wA@mail.gmail.com>
	<CAMKF1srYnC2_hNEHfHC6hoH5wp8Y+OHqAD6fZpFzqpTHxOqwXQ@mail.gmail.com>
	<CADNbA1p=3uip_ROcCBwxZ4GJs0grUe1v6vhN5NoRUyacVJnS5w@mail.gmail.com>
	<CANx9H-CserwUFp2PyQEnYxAoL_dY6xwvJvz6ExuPwmbYOaLsnQ@mail.gmail.com>
	<CADNbA1qDZ+fdr7a6_408hTVeaUojT+OFYjyoNdVy5kiaeK=gpg@mail.gmail.com>
	<CAMKF1sq1qDUaq4-D=kP8d5j=ckwyA5o+K3WTd+PA=EsXReTReA@mail.gmail.com>
	<CADNbA1rhxuwEjo=p=FsjB8+YC_jdU=U25xYgxSgRd=4ws6+UuA@mail.gmail.com>
	<CAMKF1sofJMBiDiPRTY1SexqYVN6uqoqohV3rJfub+DFr_gNdwQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Sat, 3 Mar 2018 06:26:21 -0500
X-Gmail-Original-Message-ID: <CADNbA1qwA9SgUpQkbsnVX=C4V2e2eDw9CbwLiCQKUaAXrn_DCg@mail.gmail.com>
Message-ID: <CADNbA1qwA9SgUpQkbsnVX=C4V2e2eDw9CbwLiCQKUaAXrn_DCg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Sat, 03 Mar 2018 11:26:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll send it a v2 this morning.  Thanks for the feedback.

-Derek

On Mar 3, 2018 5:22 AM, "Khem Raj" <raj.khem@gmail.com> wrote:

> On Fri, Mar 2, 2018 at 10:06 PM, Derek Straka <derek@asterius.io> wrote:
> > Sure.  I'll start following those requirements, but honestly one of the
> > reasons I dislike contributing to anything yocto/meta-oe is the lack of
> > clear rules and consistency in general.  Most of the wiki page are
> > completely out of date and none of the style items are consistently
> > enforced.  It makes it difficult to contribute and discourages
> contributions
> > at least for me.
>
> Its a good point and I think if there are ideas how to improve this
> situation would help
> the community in general. My intention to provide feedback on your patch
> was not to discourage you from contributing but to make the patch a bit
> better.
> you can ignore the feedback if you think it is inadequate and not importa=
nt
> but certainly not feel discouraged. Your contributions are always
> appreciated.
>
> >
> > On Mar 3, 2018 12:57 AM, "Khem Raj" <raj.khem@gmail.com> wrote:
> >
> > On Fri, Mar 2, 2018 at 9:22 PM, Derek Straka <derek@asterius.io> wrote:
> >> Overall, it seems like there are bigger issues to worry about.  I just
> >> want
> >> consistency.  I'm willing to conform to whatever people want.
> >>
> >
> > There is no issue here.
> >
> > read through several reviews on ML where license checksums are changed,
> > you will find reviewers calling out of explanations if it was missing.
> >
> > moreover Its also described in commit guidelines
> >
> > https://www.openembedded.org/wiki/Commit_Patch_Message_
> Guidelines#Describing_license_changes
> >
> >
> >> On Mar 3, 2018 12:19 AM, "Tim Orling" <ticotimo@gmail.com> wrote:
> >>>
> >>> I usually would have said =E2=80=9Cthe copyright year changed, but th=
e terms
> >>> remain the same=E2=80=9D, but I agree we need consistency. Tooling to=
 make the
> >>> license diff easy to generate is probably the key (and is in progress=
).
> >>>
> >>> Thank you again, Derek, for all your efforts to keep meta-python up t=
o
> >>> date.
> >>>
> >>> And thank you to Khem for taking the time to review and comment when
> few
> >>> others ever do.
> >>>
> >>> On Fri, Mar 2, 2018 at 8:45 PM Derek Straka <derek@asterius.io> wrote=
:
> >>>>
> >>>> This is the exact same commit message I've used at least 10s of time=
s
> >>>> without any negative feedback.  Saying the terms remain the same see=
ms
> >>>> sufficient to me to acknowledge the fact I looked at the license and
> it
> >>>> was
> >>>> reviewed as you stated.  I can start putting the diff in the commit =
if
> >>>> it
> >>>> adds value but let's start being consistent as a community in what w=
e
> >>>> expect.
> >>>>
> >>>> Even as a maintainer of several layers in meta-openembedded I don't
> know
> >>>> what we as a community expect...
> >>>>
> >>>> On Mar 2, 2018 11:34 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
> >>>>
> >>>> On Fri, Mar 2, 2018 at 8:15 PM, Derek Straka <derek@asterius.io>
> wrote:
> >>>> > What more would you like in the commit message?  The license terms
> are
> >>>> > the
> >>>> > same; the copyright moved to 2018.  Do we really need to put the
> >>>> > results
> >>>> of
> >>>> > the diff in the commit message?
> >>>> >
> >>>>
> >>>> Not strictly, but you can. In general a line or two about the reason
> >>>> is always a good thing.
> >>>> The commit message wasn't clear about it.
> >>>> This is essentially to let users as well as reviewers know that
> license
> >>>> changes
> >>>> were reviewed and a line in commit message is there for later to go
> back
> >>>> and see what changed
> >>>>
> >>>>
> >>>> >
> >>>> > On Mar 2, 2018 9:52 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
> >>>> >
> >>>> > On 3/2/18 6:06 AM, Derek Straka wrote:
> >>>> >> Update the license checksum and verify the terms remain the same
> >>>> >>
> >>>> >> Signed-off-by: Derek Straka <derek@asterius.io>
> >>>> >> ---
> >>>> >>  meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >>>> >> |
> >>>> >> 6
> >>>> >> +++---
> >>>> >>  .../{python-sqlalchemy_1.1.15.bb =3D> python-sqlalchemy_1.1.17.b=
b}
> >>>> >> |
> >>>> >> 0
> >>>> >>  .../{python3-sqlalchemy_1.1.15.bb =3D> python3-sqlalchemy_1.1.17=
.bb
> }
> >>>> >> |
> >>>> >> 0
> >>>> >>  3 files changed, 3 insertions(+), 3 deletions(-)
> >>>> >>  rename
> >>>> >> meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb
> >>>> >> =3D> python-sqlalchemy_1.1.17.bb} (100%)
> >>>> >>  rename
> >>>> >> meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb
> >>>> >> =3D> python3-sqlalchemy_1.1.17.bb} (100%)
> >>>> >>
> >>>> >> diff --git
> >>>> >> a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >>>> >> b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >>>> >> index 2683a6a..0c191ae 100644
> >>>> >> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >>>> >> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >>>> >> @@ -2,13 +2,13 @@ DESCRIPTION =3D "Python SQL toolkit and Object
> >>>> >> Relational
> >>>> >> Mapper that gives \
> >>>> >>  application developers the full power and flexibility of SQL"
> >>>> >>  HOMEPAGE =3D "http://www.sqlalchemy.org/"
> >>>> >>  LICENSE =3D "MIT"
> >>>> >> -LIC_FILES_CHKSUM =3D
> >>>> >> "file://LICENSE;md5=3D452f4b8adb0feba42e5be5f1fbfbf538"
> >>>> >> +LIC_FILES_CHKSUM =3D
> >>>> >> "file://LICENSE;md5=3Db1c412c9d8d1ce018f7a9374407c22bb"
> >>>> >>
> >>>> >
> >>>> > what changed here ?
> >>>> >
> >>>> >
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
>

