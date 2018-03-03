Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 96D12789CE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 05:56:59 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id g12so4649250pgs.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 21:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yeThe6bL8+fqSCK7eQKjAyLdLkJH2TDuRydvjSOWs7E=;
	b=h4YJDRdu3v7JKmqc/LAR0IPKfP7V9/X4iD44sVI6MzgNnNPcc6aTMczn09QFsSWx2l
	jY+3PjefP7KRDwhWWNG8TCVW86F4u3OVmSy/dithEDj5IzVwZ6wXtL7TdNjKGn4Jdzfg
	0Y/z96OVJuztoNtn/V82QdrygyPx8xY+kUWSfZA+eGzp11z+DG9/dk6AlOR7liyXrMrD
	/0xIjDqe/KlUCDNdqxI/tLP02ZBsbgNss23chiJM+XrD/7jMdlWEHY+6qa5lWkmXJRkC
	ojYK/rjzHfV/5/NoJSLpS7NpysiwrZKCmvxRkUEl8PabkI/sQkwTmc/ngP4i1Vn5WA6V
	6ITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yeThe6bL8+fqSCK7eQKjAyLdLkJH2TDuRydvjSOWs7E=;
	b=s9VQLNNo3P9MaeJ/Lg9WMb+VT7mqCrb7h4QbyhFzsUxS9mQmbqH320oeicFclKCsNr
	I3yyNdGapmhK+LEObR8WzkKIrdJPYuO0/qHVpl6dUkRMHJSO+PUa4kcoR1HKeeA2Ylo8
	9JNE7c2ED4duI4MZihiExGb4ViVaKe+TkHrWcsqHnB0UDDYbwrTNg6LMFGdWcLKISjlN
	6+BvtLdbabb/q+mAst35JfmZKkWgs3KD8d12CtpcN0n1iAbzairTZwKJWatLkugJfHB2
	Gbjat6WT0CORxEOyw0tdlKWAjzJpIfk9xzso9oJQyT7ud7QDbuasBByAEnZeZokru15V
	/tPQ==
X-Gm-Message-State: APf1xPDowi+vR1wAJKldE2hdWqZezSgXfr9jBnphY8l/ZetZbH9TDoJy
	quUhFFjJJUxel0eRLJT3I/yUyXBVplzaX/SWiVh78Q==
X-Google-Smtp-Source: AG47ELsL9C2m/QrDdBLgpw4OgFo1hx7TObd0WVBqEihaMWOYFCN3VVkfO2YFeuq8EumZsDlC2Dxd6LsXrGgmePuSYUA=
X-Received: by 10.98.87.80 with SMTP id l77mr8093097pfb.32.1520056620138; Fri,
	02 Mar 2018 21:57:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Fri, 2 Mar 2018 21:56:29 -0800 (PST)
In-Reply-To: <CADNbA1qDZ+fdr7a6_408hTVeaUojT+OFYjyoNdVy5kiaeK=gpg@mail.gmail.com>
References: <1519999561-9599-1-git-send-email-derek@asterius.io>
	<3f95e0a7-4663-cb73-6ab1-7eed4ab8927f@gmail.com>
	<CADNbA1p09wdEJGEW7d4wpoVWMLEzEKPAaF6PvPEtdOJFf2f0wA@mail.gmail.com>
	<CAMKF1srYnC2_hNEHfHC6hoH5wp8Y+OHqAD6fZpFzqpTHxOqwXQ@mail.gmail.com>
	<CADNbA1p=3uip_ROcCBwxZ4GJs0grUe1v6vhN5NoRUyacVJnS5w@mail.gmail.com>
	<CANx9H-CserwUFp2PyQEnYxAoL_dY6xwvJvz6ExuPwmbYOaLsnQ@mail.gmail.com>
	<CADNbA1qDZ+fdr7a6_408hTVeaUojT+OFYjyoNdVy5kiaeK=gpg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Mar 2018 21:56:29 -0800
Message-ID: <CAMKF1sq1qDUaq4-D=kP8d5j=ckwyA5o+K3WTd+PA=EsXReTReA@mail.gmail.com>
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
X-List-Received-Date: Sat, 03 Mar 2018 05:56:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 2, 2018 at 9:22 PM, Derek Straka <derek@asterius.io> wrote:
> Overall, it seems like there are bigger issues to worry about.  I just wa=
nt
> consistency.  I'm willing to conform to whatever people want.
>

There is no issue here.

read through several reviews on ML where license checksums are changed,
you will find reviewers calling out of explanations if it was missing.

moreover Its also described in commit guidelines

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Describin=
g_license_changes


> On Mar 3, 2018 12:19 AM, "Tim Orling" <ticotimo@gmail.com> wrote:
>>
>> I usually would have said =E2=80=9Cthe copyright year changed, but the t=
erms
>> remain the same=E2=80=9D, but I agree we need consistency. Tooling to ma=
ke the
>> license diff easy to generate is probably the key (and is in progress).
>>
>> Thank you again, Derek, for all your efforts to keep meta-python up to
>> date.
>>
>> And thank you to Khem for taking the time to review and comment when few
>> others ever do.
>>
>> On Fri, Mar 2, 2018 at 8:45 PM Derek Straka <derek@asterius.io> wrote:
>>>
>>> This is the exact same commit message I've used at least 10s of times
>>> without any negative feedback.  Saying the terms remain the same seems
>>> sufficient to me to acknowledge the fact I looked at the license and it
>>> was
>>> reviewed as you stated.  I can start putting the diff in the commit if =
it
>>> adds value but let's start being consistent as a community in what we
>>> expect.
>>>
>>> Even as a maintainer of several layers in meta-openembedded I don't kno=
w
>>> what we as a community expect...
>>>
>>> On Mar 2, 2018 11:34 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>>>
>>> On Fri, Mar 2, 2018 at 8:15 PM, Derek Straka <derek@asterius.io> wrote:
>>> > What more would you like in the commit message?  The license terms ar=
e
>>> > the
>>> > same; the copyright moved to 2018.  Do we really need to put the
>>> > results
>>> of
>>> > the diff in the commit message?
>>> >
>>>
>>> Not strictly, but you can. In general a line or two about the reason
>>> is always a good thing.
>>> The commit message wasn't clear about it.
>>> This is essentially to let users as well as reviewers know that license
>>> changes
>>> were reviewed and a line in commit message is there for later to go bac=
k
>>> and see what changed
>>>
>>>
>>> >
>>> > On Mar 2, 2018 9:52 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>>> >
>>> > On 3/2/18 6:06 AM, Derek Straka wrote:
>>> >> Update the license checksum and verify the terms remain the same
>>> >>
>>> >> Signed-off-by: Derek Straka <derek@asterius.io>
>>> >> ---
>>> >>  meta-python/recipes-devtools/python/python-sqlalchemy.inc          =
 |
>>> >> 6
>>> >> +++---
>>> >>  .../{python-sqlalchemy_1.1.15.bb =3D> python-sqlalchemy_1.1.17.bb} =
   |
>>> >> 0
>>> >>  .../{python3-sqlalchemy_1.1.15.bb =3D> python3-sqlalchemy_1.1.17.bb=
}  |
>>> >> 0
>>> >>  3 files changed, 3 insertions(+), 3 deletions(-)
>>> >>  rename
>>> >> meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb
>>> >> =3D> python-sqlalchemy_1.1.17.bb} (100%)
>>> >>  rename
>>> >> meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb
>>> >> =3D> python3-sqlalchemy_1.1.17.bb} (100%)
>>> >>
>>> >> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.i=
nc
>>> >> b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>> >> index 2683a6a..0c191ae 100644
>>> >> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>> >> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>> >> @@ -2,13 +2,13 @@ DESCRIPTION =3D "Python SQL toolkit and Object
>>> >> Relational
>>> >> Mapper that gives \
>>> >>  application developers the full power and flexibility of SQL"
>>> >>  HOMEPAGE =3D "http://www.sqlalchemy.org/"
>>> >>  LICENSE =3D "MIT"
>>> >> -LIC_FILES_CHKSUM =3D
>>> >> "file://LICENSE;md5=3D452f4b8adb0feba42e5be5f1fbfbf538"
>>> >> +LIC_FILES_CHKSUM =3D
>>> >> "file://LICENSE;md5=3Db1c412c9d8d1ce018f7a9374407c22bb"
>>> >>
>>> >
>>> > what changed here ?
>>> >
>>> >
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

