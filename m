Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 05B2179057
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 08:04:38 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id n6-v6so19166460qtl.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 01:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3Zhxv9rVbV1HphlfvPOSBfGni4rzdXggws/mjIKdjPM=;
	b=YlkFGvtGmnlV94EVfH8e5zZeuR0XmcO1e41pNJh6wchR0R/QZz02tsrPXXXxToYBCS
	5Vkk+jVRkLDRd1BbJEJz6oHJ4YqoLTm/Thqru9mZHy+DXY6FyxjsliGbCLolCUGzxy0D
	aEjNyRSIX5LvMb3JfYI2WvO8tqiwm8uwS4rrmR2Pz1gK2T89Kzt1EN2X1FbOYuM1LU2k
	NgdeXUPlSYTHI0hkMbiLGcYu8y938sIrgfBvEbn8guI0QRJNlaR0QQivXoMGMe0lGXqN
	VBcp8IeWw5zd65wESmXjBqlKGRUOP/mfShBwy5ZfCYvV3PckTsYdgkqrRCanrxLacvcv
	724w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3Zhxv9rVbV1HphlfvPOSBfGni4rzdXggws/mjIKdjPM=;
	b=I1Fb+92sS+7PwA0dro3HV9Eo6nyxjNW/GqUHskJi/DRO5zvjAqkDE8zspPj2EudyK8
	0pL3PGbvCaGclleedokdi3P5nWYU5gQqbNGSXBk/vp1LGTAELzi5RLGb+PhGsTGL6w6l
	p+KmbKAh/UsWUJA0t50iVMOIQ9F8t+tjMau2wyROzK2oQdQGWpQqXdvGBuppYtOHJbSy
	WLXv8pyc8FdfwMAkll8H9hySYJFyUR5yIvOxwx1wn3XWHscPpE82gpjJLsf7/9r/hKhO
	wuf4zfl2Av6VRIfsD8XPhx3aEh1L+qIjmkqd6DJZfLegf6dtXOIitXV/PC9t8FrTDhuX
	X1Gw==
X-Gm-Message-State: AOUpUlFqz6GXw3pYZz2VM2pG37NfiG5J5laWKttT13Du/VKn5/h6tgFW
	976SxHeR1I+e82wVzTt1gmtnnZ4273gvxPAgpqQ=
X-Google-Smtp-Source: AA+uWPyNG2wuoFnoI9FNPWvMquam5emC+1Q7zZohBzL7R1jxFEagk49vxlUgP8eikmE6wvjTgkPq2rfHE2c1joM4Xs0=
X-Received: by 2002:a0c:9d0b:: with SMTP id
	m11-v6mr44406737qvf.228.1534838679635; 
	Tue, 21 Aug 2018 01:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <1534499269-29908-1-git-send-email-dengke.du@windriver.com>
	<CA+chaQev7OU47E-bV+x4OX9ZVgE7ZGX8ZWg1h27e-rVkPQ9Ayw@mail.gmail.com>
	<b1b2fffc-1ad1-65e0-539a-816cf39fff67@windriver.com>
	<CAMKF1sqXKUbaj9oAXC402X7Q91MDhcoEBJHFPpw7-qi6pmf8Rg@mail.gmail.com>
	<096cdb2a-6313-67f7-742b-96f937edba81@windriver.com>
	<CAMKF1so59C25=PnOjPdTPp0PX+3bOw3DYSvh+_XPrROSem9J2Q@mail.gmail.com>
	<cdd20303-e277-3591-6d97-ecbf75a9732d@windriver.com>
In-Reply-To: <cdd20303-e277-3591-6d97-ecbf75a9732d@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2018 01:04:13 -0700
Message-ID: <CAMKF1srph3remg7upbD=FASHhr6+OF=Y2usEx=3nCahCFw_6RA@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Aug 2018 08:04:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2018 at 12:57 AM Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
>
> Hi Raj,
>
> The bpf updates very frequently.
>
> So we suggest skipping the latest kernel version to avoid potential 0day
> build errors.
>
> And meanwhile we'll keep an eye on latest yocto kernel to update the reci=
pe.
>
>
> How do you think about it?
>

If this recipe will not build for qemu reference machines from OE-core
with reference kernel (4.15.18+gitAUTOINC+d35642f0b6_3373c0cf71-r0)
then this recipe should not be in upstream layers. We need to fix it
or limit it to build where it can build

I am concerned that it will end up broken on many combinations.

>
> --Hongzhi
>
>
>
> On 2018=E5=B9=B408=E6=9C=8821=E6=97=A5 15:26, Khem Raj wrote:
> > this is latest master/qemux86_64 linux-yocto
> > On Mon, Aug 20, 2018 at 10:24 PM Hongzhi, Song
> > <hongzhi.song@windriver.com> wrote:
> >> Hi Raj,
> >>
> >> What is the linux version used by you.
> >>
> >> --Hongzhi
> >>
> >>
> >> On 2018=E5=B9=B408=E6=9C=8821=E6=97=A5 12:02, Khem Raj wrote:
> >>> I am still seeing build failures with musl/x86_64 see
> >>>
> >>> http://errors.yoctoproject.org/Errors/Details/186953/
> >>> On Sun, Aug 19, 2018 at 11:05 PM Hongzhi, Song
> >>> <hongzhi.song@windriver.com> wrote:
> >>>> Thank you very much for your work.
> >>>>
> >>>> --Hongzhi
> >>>>
> >>>>
> >>>> On 2018=E5=B9=B408=E6=9C=8817=E6=97=A5 17:44, Martin Jansa wrote:
> >>>>> see
> >>>>> http://lists.openembedded.org/pipermail/openembedded-devel/2018-Aug=
ust/120021.html
> >>>>>
> >>>>> On Fri, Aug 17, 2018 at 11:37 AM Dengke Du <dengke.du@windriver.com=
> wrote:
> >>>>>
> >>>>>> From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> >>>>>>
> >>>>>> There are some new program added for bpf. So we make corresponding
> >>>>>> modifications.
> >>>>>>
> >>>>>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> >>>>>> ---
> >>>>>>     meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 7 =
++++---
> >>>>>>     1 file changed, 4 insertions(+), 3 deletions(-)
> >>>>>>
> >>>>>> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftes=
t.bb
> >>>>>> b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> >>>>>> index 27d98a3..d5ccace 100644
> >>>>>> --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> >>>>>> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> >>>>>> @@ -79,7 +79,7 @@ do_configure() {
> >>>>>>         :
> >>>>>>     }
> >>>>>>
> >>>>>> -do_patch[prefuncs] +=3D "copy_kselftest_source_from_kernel
> >>>>>> remove_clang_related"
> >>>>>> +do_patch[prefuncs] +=3D "copy_kselftest_source_from_kernel remove=
_unrelated"
> >>>>>>     python copy_kselftest_source_from_kernel() {
> >>>>>>         sources =3D (d.getVar("KERNEL_SELFTEST_SRC") or "").split(=
)
> >>>>>>         src_dir =3D d.getVar("STAGING_KERNEL_DIR")
> >>>>>> @@ -94,8 +94,9 @@ python copy_kselftest_source_from_kernel() {
> >>>>>>                 bb.utils.copyfile(src, dest)
> >>>>>>     }
> >>>>>>
> >>>>>> -remove_clang_related() {
> >>>>>> -       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d'
> >>>>>> ${S}/tools/testing/selftests/bpf/Makefile
> >>>>>> +remove_unrelated() {
> >>>>>> +       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' =
-e
> >>>>>> '/sockmap_verdict_prog/d' ${S}/tools/testing/selftests/bpf/Makefil=
e
> >>>>>> +       sed -i '/llc/d' ${S}/tools/testing/selftests/bpf/Makefile
> >>>>>>     }
> >>>>>>
> >>>>>>     PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>>>>> --
> >>>>>> 2.7.4
> >>>>>>
> >>>>>> --
> >>>>>> _______________________________________________
> >>>>>> Openembedded-devel mailing list
> >>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

