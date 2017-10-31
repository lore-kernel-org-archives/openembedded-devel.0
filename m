Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id AA3B97197E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 19:51:37 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 134so1428883ioo.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 12:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JE4s8UrjHaLVtCCXy9u+cplOYD7P3ofq2zXzuUF395E=;
	b=jIsV9AOONjZWZkeuUdeD80sqHcqIdPBB/4rcr933IVS+1UFUcMK+CNSN9xnuEbpZmc
	n3BSUVSIa09r9sECVBjPzd5ZuY7JTqZdHM5HI4uxLlDAhFTLhfKvyJkKsn1J81P+8tTo
	HywYpPnNFb3WxyPW2staC8mDlVSHiZJbFVwtGIEGgrL1aYwcGIgoVCb4B7OrThboPKiH
	5hL6sTLoPp/8LwotUFnZ9w/MEFRwuylQs+aM5bsP5+EJqXNSd2Y0KlfRB/KZTcV0WTL/
	FTfEkcb1YmeATsZ8XpMXjtJkYDtRh7lYAG4C94wFdTmX/mM5EIJjt5xUFBTnuLlTmnmb
	Budg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JE4s8UrjHaLVtCCXy9u+cplOYD7P3ofq2zXzuUF395E=;
	b=ZGzxND2ABOVpP/qxCZj6k+u/bMYtFEtNHg/UaYR4K1qSaQyCACVis+2hOFqlYuOoyZ
	g+J46m9uMUWunxy7PK9GmG/zldiRtwUgOB/48K9W8YUdVGU5kJ3bhhWPgiMzPc6jcT1P
	9zVlhwYWZ6dEfaeqy4JbTeSn5nMpojtc0txNufONfLZ1OTViONcl4qkJyWKK2ymbdbZx
	5hl7yjFaN7/wZGM4UIyRw+BpXjvSBJXKHcXRFFCzd4KtuxK7siaYFOcRfPRk5v6ePvD5
	IKamTmN113I+tx45VIdQMqcDNyXZWRXZP6OzL46GuYP3A6uuV/Hc1eyclUdf5X3j9OXv
	ikHQ==
X-Gm-Message-State: AMCzsaVNmQ9Umn7z3sTze4gsxjeeVr2zlJd5R5aCBwHgUNUF7wNzdPIY
	jVfFbkD9FCodXzRMCzBWrjbqLdDX3nki+PkTpebdVg==
X-Google-Smtp-Source: ABhQp+SISYfWu+TkwqxC5kwrGN4+HDgWx+V9bkbr9kCzIZmo3p2ldouvTFWS6xJKdsvTArSNRIyLA+y8w3b4ni79Tvc=
X-Received: by 10.36.189.196 with SMTP id x187mr4681694ite.85.1509479498547;
	Tue, 31 Oct 2017 12:51:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.48.205 with HTTP; Tue, 31 Oct 2017 12:51:18 -0700 (PDT)
X-Originating-IP: [181.220.79.73]
In-Reply-To: <CAMKF1sp09fUtdT4Wn=CjJ2s4cRs2+38zKQNxkh=XupboXKiy8w@mail.gmail.com>
References: <20171030173213.16752-1-fabio.berton@ossystems.com.br>
	<CAMKF1spzjAV6Qd6MDa7M5a=-rse+2nOZoHWoaAp=3ORhQHPrzA@mail.gmail.com>
	<CAAPZna2QXiR0NiTkpA-2of4jEa+P6OrQ06W6MzVsFgvv_3iyQA@mail.gmail.com>
	<CAMKF1sp09fUtdT4Wn=CjJ2s4cRs2+38zKQNxkh=XupboXKiy8w@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 31 Oct 2017 17:51:18 -0200
Message-ID: <CAAPZna2Xz-ErK3gAh0x8xy649kU50dDcnfJshNWLckurLVgvgQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] arptables: Fix do_install task
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
X-List-Received-Date: Tue, 31 Oct 2017 19:51:37 -0000
Content-Type: text/plain; charset="UTF-8"

You right, work using oe_runmake install DESTDIR=${D} and DESTDIR is not
using when compiling.

Thanks

On Tue, Oct 31, 2017 at 5:07 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Tue, Oct 31, 2017 at 4:24 AM Fabio Berton <
> fabio.berton@ossystems.com.br> wrote:
>
>> Hi Khem,
>>
>> do_compile task uses these EXTRA_OEMAKE variables too.
>>
>
> Yes, however the question is do we use DESTDIR when compiling
>
>>
>> On Mon, Oct 30, 2017 at 9:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> On Mon, Oct 30, 2017 at 10:32 AM, Fabio Berton
>>> <fabio.berton@ossystems.com.br> wrote:
>>> > We need to set DESTDIR variable and run eo_runmake install to install
>>> all
>>>
>>> ^^
>>> typo
>>>
>>> > arptables files. Without this the only file installed in package is
>>> > systemd unit.
>>> >
>>> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>>> > ---
>>> >  meta-networking/recipes-support/arptables/arptables_git.bb | 5 +++--
>>> >  1 file changed, 3 insertions(+), 2 deletions(-)
>>> >
>>> > diff --git a/meta-networking/recipes-support/arptables/arptables_
>>> git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
>>> > index 274a55d91..55903e450 100644
>>> > --- a/meta-networking/recipes-support/arptables/arptables_git.bb
>>> > +++ b/meta-networking/recipes-support/arptables/arptables_git.bb
>>> > @@ -21,9 +21,10 @@ SYSTEMD_SERVICE_${PN} = "arptables.service"
>>> >
>>> >  inherit systemd
>>> >
>>> > -EXTRA_OEMAKE = "'BINDIR=${sbindir}' 'MANDIR=${mandir}'"
>>> > +EXTRA_OEMAKE += "'DESTDIR=${D}' 'BINDIR=${sbindir}'
>>> 'MANDIR=${mandir}'"
>>> >
>>>
>>> if its needed just during install then we could pass it directly in
>>> oe_runmake in do_install below
>>>
>>> > -do_install_append() {
>>> > +do_install() {
>>> > +    oe_runmake install
>>> >      if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
>>> 'false', d)}; then
>>> >          install -d ${D}${systemd_unitdir}/system
>>> >          install -m 644 ${WORKDIR}/arptables.service
>>> ${D}${systemd_unitdir}/system
>>> > --
>>> > 2.14.2
>>> >
>>> > --
>>> > _______________________________________________
>>> > Openembedded-devel mailing list
>>> > Openembedded-devel@lists.openembedded.org
>>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>>

