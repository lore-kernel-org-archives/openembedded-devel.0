Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id B2BEE745A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 04:02:31 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id z78-v6so10211381qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 21:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MsyOJCWoP2BGcha3v2rF2yOR65iFfpmgQgXmlQpxXtI=;
	b=BEH4Y08ENc03UKzB4YVf9y43RgQE9ZzN17SQYBGeVGbLoWcSJVAt4Lgc5Ow2Eta7ZG
	UXbTvu+HG+Atrmj9uDttcCp9DR/yzKV5nkWd7i4Oa2vW3Nmta4az+kB2XWpjyFjcRj9m
	WIh4ah/W8VCZGJS0D6BcEVmRmBykodeKW/LdUi2MbdRX4BeKkhckbzDu+ms/NYYLSjuj
	X6x3gJfloIga5vP1lpPzH4wc3MvRACYGs3KVywlA7JuNKr5UPvgIKXdXWdKIpc6eEbfF
	w4GMZJf5LsuEAEiI5zugL4VdPmmiyyvpt/6M5osV1K3NspP+Qy6AjlluMlhdau801PNJ
	Am3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MsyOJCWoP2BGcha3v2rF2yOR65iFfpmgQgXmlQpxXtI=;
	b=I9DUqNZJdtXuavwbdHPjY5z6J7TnQHpO3s15IEc2MoI69LOFKyekJwVG6bm0TyCFSm
	3WSifdMbp/J0SKX3I28qkr1SQf5OCYK2vvHvvWYK4LPC8PBIxLGv7uqGQORAyM9jIvgj
	r80y6/tygnF2VxELoaQ66XftpIgJlYK1gQV6t9kD7Gzhr6VuyGe1n+RBrIovDOG+LypK
	cpZoknQaP49s4jhgFRgNW1K+AneRqqD0OY+KU54o3X/hda4A/tZRWd795tAijSR6fDg5
	1DKWGlkiafkLc1XnXzOgENr4rQhqcN3Q+VI3+7SKhutCFw7gAHsushbWaGWzLIxJAq+Y
	NoKg==
X-Gm-Message-State: APzg51CTnc6FVNwoF3PSP8W7R37i/BDjLmjBhUleFjxeoR87efynWClE
	drhcqnsh0FtZ3tgWU6vKZZhBlYFWc/Nx1512FAU=
X-Google-Smtp-Source: ANB0VdZK7ZmduUcXu14wHjNp5FS2cp3XQiUU2EUNwLplxUUHNyuhvpIc5tFNm16IsFkHxxI6NsIKsZ5SdmrMo+t+Tuo=
X-Received: by 2002:ae9:eb58:: with SMTP id
	b85-v6mr161343qkg.110.1534824152370; 
	Mon, 20 Aug 2018 21:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <1534499269-29908-1-git-send-email-dengke.du@windriver.com>
	<CA+chaQev7OU47E-bV+x4OX9ZVgE7ZGX8ZWg1h27e-rVkPQ9Ayw@mail.gmail.com>
	<b1b2fffc-1ad1-65e0-539a-816cf39fff67@windriver.com>
In-Reply-To: <b1b2fffc-1ad1-65e0-539a-816cf39fff67@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Aug 2018 21:02:06 -0700
Message-ID: <CAMKF1sqXKUbaj9oAXC402X7Q91MDhcoEBJHFPpw7-qi6pmf8Rg@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Aug 2018 04:02:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am still seeing build failures with musl/x86_64 see

http://errors.yoctoproject.org/Errors/Details/186953/
On Sun, Aug 19, 2018 at 11:05 PM Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
>
> Thank you very much for your work.
>
> --Hongzhi
>
>
> On 2018=E5=B9=B408=E6=9C=8817=E6=97=A5 17:44, Martin Jansa wrote:
> > see
> > http://lists.openembedded.org/pipermail/openembedded-devel/2018-August/=
120021.html
> >
> > On Fri, Aug 17, 2018 at 11:37 AM Dengke Du <dengke.du@windriver.com> wr=
ote:
> >
> >> From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> >>
> >> There are some new program added for bpf. So we make corresponding
> >> modifications.
> >>
> >> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> >> ---
> >>   meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 7 ++++--=
-
> >>   1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> >> b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> >> index 27d98a3..d5ccace 100644
> >> --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> >> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> >> @@ -79,7 +79,7 @@ do_configure() {
> >>       :
> >>   }
> >>
> >> -do_patch[prefuncs] +=3D "copy_kselftest_source_from_kernel
> >> remove_clang_related"
> >> +do_patch[prefuncs] +=3D "copy_kselftest_source_from_kernel remove_unr=
elated"
> >>   python copy_kselftest_source_from_kernel() {
> >>       sources =3D (d.getVar("KERNEL_SELFTEST_SRC") or "").split()
> >>       src_dir =3D d.getVar("STAGING_KERNEL_DIR")
> >> @@ -94,8 +94,9 @@ python copy_kselftest_source_from_kernel() {
> >>               bb.utils.copyfile(src, dest)
> >>   }
> >>
> >> -remove_clang_related() {
> >> -       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d'
> >> ${S}/tools/testing/selftests/bpf/Makefile
> >> +remove_unrelated() {
> >> +       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' -e
> >> '/sockmap_verdict_prog/d' ${S}/tools/testing/selftests/bpf/Makefile
> >> +       sed -i '/llc/d' ${S}/tools/testing/selftests/bpf/Makefile
> >>   }
> >>
> >>   PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

