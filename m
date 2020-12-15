Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web09.7706.1608015764833718929
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Dec 2020 23:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lJqrdsPr;
 spf=pass (domain: gmail.com, ip: 209.85.167.194, mailfrom: rfried.dev@gmail.com)
Received: by mail-oi1-f194.google.com with SMTP id 15so22280622oix.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Dec 2020 23:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hm7gEF1YBhFyFUCBRO5nkmJ7uxPc1cIdWuY2X3/I6fo=;
        b=lJqrdsPrYMlFTgPXt4RuOy2G5VRCasQXDJi+R9hPvP3LCWj67wYCCe+cEA6UIgor20
         sQyz6lWdgUmw57xZHvCMl1TSISN5LUndXdAsgW5CToa7BVv6Bp3/+jzS2t4RrhROz+Gy
         ylXpEE2nhbV5Y2PhUinRqaLJSW//XVh2+/TvzYWYLSPJySiSBMnG8iNJwrn50DLzGRiF
         Psydj690OCBWPkIBnqtt6YxMfQAqDq459dBBw8roZtZPh/QBwgeNLtFXx+q2TZEZpTsX
         QhtJcAxn8S+tJmn/DDTGDIEg7OX6byaQE5D0yg3U6ywzKaaUDBvQ9U+Xgvvi5pxzDLSf
         ZHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hm7gEF1YBhFyFUCBRO5nkmJ7uxPc1cIdWuY2X3/I6fo=;
        b=QfhmXmlgWtNQZMqZV3mnylwuc18D50tOOeXsRW+ChspYx5a4VkuqaKkmPvu9AzyOzb
         oBwcKuDqvmXDOmT+Ed8Y3QvjSIsrT7BaZx2TCAdFA87s9EafuFi+k5+1K4nmRAhKBymQ
         FGlRkNKQhnFexT+7MCM6CbtD5UgcAjb1cx0vdrQwXvsMZECVo11txCQpzRHeIsM/DkqG
         edXUp+bYk5prtloV8S98fO8JY1qvMrIl4E8Ykum/+xRoqA1jURWzPy8RT3koTv8mEGGh
         S+/G5u/C5il13B6G24YjyaB9X2SrF3snUCoZQ4QDAa3A6UWNBcGM6/7swkbN53QkZ2X3
         +Tcw==
X-Gm-Message-State: AOAM5310us4gRlsryDbJNhccP/MwnaAYucIdhVLZD24dUHDmlzcADHx3
	Ntuy04QNnzFvm8k6JswSKXZbXqy5nHYigRpCAoc=
X-Google-Smtp-Source: ABdhPJyFTTixMs1YLSvpGpTicwSmNXGnudYnb9HFHm1biMKiygNyH7o78f2nHDKIpO/E51c0RVKMnBdlJRbwgNEzdO8=
X-Received: by 2002:aca:d484:: with SMTP id l126mr20182095oig.151.1608015764133;
 Mon, 14 Dec 2020 23:02:44 -0800 (PST)
MIME-Version: 1.0
References: <20201215055226.1395-1-rfried.dev@gmail.com> <ded0788f-0501-f733-7d3f-267ceb9455f9@gmail.com>
In-Reply-To: <ded0788f-0501-f733-7d3f-267ceb9455f9@gmail.com>
From: "Ramon Fried" <rfried.dev@gmail.com>
Date: Tue, 15 Dec 2020 09:02:33 +0200
Message-ID: <CAGi-RULy-qSqH8XTgP9sv+XKaVOeOH38bnLizOb-6DWjy+P7Bw@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] bitwise: add new recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 15, 2020 at 8:20 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 12/14/20 9:52 PM, Ramon Fried wrote:
> > Bitwise is multi base interactive calculator supporting
> > dynamic base conversion and bit manipulation.
> > It's a handy tool for low level hackers, kernel developers and
> > device drivers developers.
> >
> > Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> > ---
> >   .../packagegroups/packagegroup-meta-oe.bb     |  1 +
> >   .../recipes-extended/bitwise/bitwise_0.41.bb  | 28 +++++++++++++++++++
> >   2 files changed, 29 insertions(+)
> >   create mode 100644 meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
> >
> > diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > index 2c46d21b7..577f2e788 100644
> > --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > @@ -307,6 +307,7 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_x86-64 = "${@bb.utils.contains("TU
> >   RDEPENDS_packagegroup-meta-oe-devtools_remove_x86 = "ply"
> >
> >   RDEPENDS_packagegroup-meta-oe-extended ="\
> > +     bitwise \
> >       ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-client", "", d)} \
> >        brotli \
> >        byacc \
> > diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb b/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
> > new file mode 100644
> > index 000000000..2c4ffb1eb
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
> > @@ -0,0 +1,28 @@
> > +SUMMARY = "Bitwise terminal calculator"
> > +DESCRIPTION = "Bitwise is multi base interactive calculator \
> > +supporting dynamic base conversion and bit manipulation.\
> > +It's a handy tool for low level hackers, \
> > +kernel developers and device drivers developers."
> > +
> > +HOMEPAGE = "https://github.com/mellowcandle/bitwise"
> > +SECTION = "console/utils"
> > +
> > +LICENSE = "GPLv3"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
> > +
> > +SRC_URI = "https://github.com/mellowcandle/bitwise/releases/download/v${PV}/bitwise-v${PV}.tar.gz"
> > +SRC_URI[md5sum] = "62514cb4d26771eec56a54901299b09e"
> > +SRC_URI[sha1sum] = "753662205db576f86de7ab89b303b6e411dcf04a"
> > +SRC_URI[sha256sum] = "33ce934fb99dadf7652224152cc135a0abf6a211adde53d96e9be7067567749c"
> > +SRC_URI[sha384sum] = "ff15c72b60e71b2029d316688350ec07119b1b56e3c911d9bf3f23e3939d9f86d43853b9e812ad7ae7a002a71a559fb2"
> > +SRC_URI[sha512sum] = "fc4a612d73bd34a20a87181420ca46549815a86c2861ad918a6539e3bf15230af5e534724f368080a2de0874deac7052e58075683fd32bce1ee070b777d24a9b"
>
> we only need SRC_URI[sha256sum] please delete rest of them.
Sure.
>
> > +
> > +UPSTREAM_CHECK_URI = "https://github.com/mellowcandle/bitwise/releases"
> > +
> > +S = "${WORKDIR}/${BPN}-v${PV}"
> > +
> > +DEPENDS = "ncurses readline"
> > +
> > +CFLAGS_prepend = "-I${S}/inc "
>
> I meant that you can avoid this by fixing the code with a patch like
>
> https://gist.github.com/kraj/1e5f8fb76705159afa4bb78a5a8f0311
I don't mind, I can do both, whatever you prefer.
>
> this patch can be upstreamed as well, if you want to take it forward
> feel free.
>
> > +
> > +inherit autotools
> >
> >
> >
> > 
> >
