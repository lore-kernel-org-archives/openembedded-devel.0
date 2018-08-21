Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id EC38779017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:26:34 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id e19-v6so19086547qtp.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 00:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lgCTEhKpgCKEJNPUykEkaV86azXlM+40+i4hz2YYikI=;
	b=PNiFmWUaOi40Yj7lTBRaM5jg1igniAa9rLMVA1tt9M2mEMZr4/UwLoq9ZXVqRI0ZQK
	SOEQhu5kS2aWI3FTddF7dEtM+34GuVoSr+ZFaYDMj34BaxgIEJPoY85VAVB7HTjHv7ki
	NV9IcM85L3jAhW94bGGRtk0tykxP28L03SFPySrX9iMd8H2i2xK/YroKazUSB6ZigDxP
	0sbmmNqmu4FwhL5qxCGhHHpA9K9ZCec1DsNpYUKJyT+BKQ1uSRo/6SwBOiZcSB95WsEI
	MEqqviKlhQoIBCz3hS4RTRqeNQKLj+mKBiW1mVopVZeZycq107w2XkedvRd4LLzFXOIQ
	J+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lgCTEhKpgCKEJNPUykEkaV86azXlM+40+i4hz2YYikI=;
	b=VKBM4qbRU5h/xsSw3YKTWG41xm2lZddnjC4EPhHsc18tjxp9DrYbZ6NrUIcl2JE3lk
	aQqsUnz4l6uCt+1WsQYTS8nyH4qz1omQELroU7Q+i5NWBkGxDMEb+47tnMepAZRc1Rdf
	gehMPew9624iRnD2EPJgVgldrueZ0bsgCZfJyTRX+gwNNQSrLD3x0TmjEV3tNnotvLXo
	54bpnI0zt7+hUaZ2TQz0GpEOdwNskhwtarBmTCF1LNeGAeDGxKumxuO+r2ZPF2R46y1i
	Zlvke31vGDiIvUihKggJzGiOsiyaLQiV/3OZqR5EpuOGqgrbuylQlbjxWeeRjK5tTNgY
	DbBg==
X-Gm-Message-State: AOUpUlGmBOyZZ0/U8xE2KKEVt2w2IRf+ZNocMcOwslR9NqDHDyRRre1Z
	SKwJInjLG4H4HRdQhEa8FwLZ9+UgYHElO0N2hqM=
X-Google-Smtp-Source: AA+uWPxjSpBSNU4RaNU2bnhO5Lnx3OJqx+ghrJUeOFQsSscZGVeBQgvZ3lSpVVWtsQO19ZYiI42ORb6wCsy2CGSXIA8=
X-Received: by 2002:ac8:2ad8:: with SMTP id
	c24-v6mr47926484qta.117.1534836395715; 
	Tue, 21 Aug 2018 00:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <1534499269-29908-1-git-send-email-dengke.du@windriver.com>
	<CA+chaQev7OU47E-bV+x4OX9ZVgE7ZGX8ZWg1h27e-rVkPQ9Ayw@mail.gmail.com>
	<b1b2fffc-1ad1-65e0-539a-816cf39fff67@windriver.com>
	<CAMKF1sqXKUbaj9oAXC402X7Q91MDhcoEBJHFPpw7-qi6pmf8Rg@mail.gmail.com>
	<096cdb2a-6313-67f7-742b-96f937edba81@windriver.com>
In-Reply-To: <096cdb2a-6313-67f7-742b-96f937edba81@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2018 00:26:09 -0700
Message-ID: <CAMKF1so59C25=PnOjPdTPp0PX+3bOw3DYSvh+_XPrROSem9J2Q@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] kernel-selftest: compatible with latest kernel
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
X-List-Received-Date: Tue, 21 Aug 2018 07:26:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this is latest master/qemux86_64 linux-yocto
On Mon, Aug 20, 2018 at 10:24 PM Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
>
> Hi Raj,
>
> What is the linux version used by you.
>
> --Hongzhi
>
>
> On 2018=E5=B9=B408=E6=9C=8821=E6=97=A5 12:02, Khem Raj wrote:
> > I am still seeing build failures with musl/x86_64 see
> >
> > http://errors.yoctoproject.org/Errors/Details/186953/
> > On Sun, Aug 19, 2018 at 11:05 PM Hongzhi, Song
> > <hongzhi.song@windriver.com> wrote:
> >> Thank you very much for your work.
> >>
> >> --Hongzhi
> >>
> >>
> >> On 2018=E5=B9=B408=E6=9C=8817=E6=97=A5 17:44, Martin Jansa wrote:
> >>> see
> >>> http://lists.openembedded.org/pipermail/openembedded-devel/2018-Augus=
t/120021.html
> >>>
> >>> On Fri, Aug 17, 2018 at 11:37 AM Dengke Du <dengke.du@windriver.com> =
wrote:
> >>>
> >>>> From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> >>>>
> >>>> There are some new program added for bpf. So we make corresponding
> >>>> modifications.
> >>>>
> >>>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> >>>> ---
> >>>>    meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 7 +++=
+---
> >>>>    1 file changed, 4 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.=
bb
> >>>> b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> >>>> index 27d98a3..d5ccace 100644
> >>>> --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> >>>> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> >>>> @@ -79,7 +79,7 @@ do_configure() {
> >>>>        :
> >>>>    }
> >>>>
> >>>> -do_patch[prefuncs] +=3D "copy_kselftest_source_from_kernel
> >>>> remove_clang_related"
> >>>> +do_patch[prefuncs] +=3D "copy_kselftest_source_from_kernel remove_u=
nrelated"
> >>>>    python copy_kselftest_source_from_kernel() {
> >>>>        sources =3D (d.getVar("KERNEL_SELFTEST_SRC") or "").split()
> >>>>        src_dir =3D d.getVar("STAGING_KERNEL_DIR")
> >>>> @@ -94,8 +94,9 @@ python copy_kselftest_source_from_kernel() {
> >>>>                bb.utils.copyfile(src, dest)
> >>>>    }
> >>>>
> >>>> -remove_clang_related() {
> >>>> -       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d'
> >>>> ${S}/tools/testing/selftests/bpf/Makefile
> >>>> +remove_unrelated() {
> >>>> +       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' -e
> >>>> '/sockmap_verdict_prog/d' ${S}/tools/testing/selftests/bpf/Makefile
> >>>> +       sed -i '/llc/d' ${S}/tools/testing/selftests/bpf/Makefile
> >>>>    }
> >>>>
> >>>>    PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>>> --
> >>>> 2.7.4
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

