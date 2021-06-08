Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.1490.1623170178784443769
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 09:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VCCAUIk9;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id l3so4064040qvl.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 09:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OQZHfpsXHRCootbZovdHYAzoCvThmJF9wIns0FUv0SA=;
        b=VCCAUIk9jIlyfKkig1uNeBO5MzQ5Ykj5dQwRB0hh7MspRnTcQT7X9xpB8T9b3vC5N9
         1rV5wN1iH7xXh/drkk9QhsA9S+UJit6ThD2nO+r1LUSTINtxZ/SuCincOdV8N7dkcHOb
         Czxlf2A7b7HBktwTGEQp1byArAMjGp4LSF6zC+b6zlJ0/qic/ckhCnD34mUwpW/gSUQL
         rKoCr86OQQGTNL1e3aX576t3kckKAXFGDQgBGzT/QusCMVmhIcZbumk3mCbLJ1g1DWUP
         3mQCJvMSAj3J6bytY2A18VlxgbZaHdp2OT156NZkoiBYrKrOwnK6LBQw/5GLb0aCWPOm
         8hWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OQZHfpsXHRCootbZovdHYAzoCvThmJF9wIns0FUv0SA=;
        b=FWcKhy8i6OJXFnRXFdrBOsgjNjb2ulyumi3+BZ3plEp6dIDb/TUzv+ysWayxbMcw0Q
         LHxz1RUOg5N9wB05hlFUgu+eonv5hpKTmvYAUmi/3wno3+5H6zOQDettxjNu6qjau52B
         VpxpsHQrme3bDREbi0vPVvVdlby5tj/+ILnygsUrVEW0xwoqGLWbBDKwZCgPZh0gpCp0
         rjybO5vIHe5Z/C52c4NQNIAK4FU6SBbMFDFqStQhy/JZKxoww+hdGib56j4W3pXg01PQ
         /CTdlna4QC4SNeb0mmd5Tgh1jt1/iwB6/YU/zX3fwUHwgFsuqSqMz0zpg76BC/0G2ZXC
         eHjg==
X-Gm-Message-State: AOAM531RGywTLG33SNklXhtKuk9il82byRNdBww+A8ovej8VDf18D22I
	X4EBfjtxkiOhVS6zz1HBuIy0VRXy5urg+shgBRo=
X-Google-Smtp-Source: ABdhPJy2+kcg3JXm+LMaCM9nODjnDU7IQDK5DvdDyyCpcUWtxJ6mcfh+YBGo0eMgGXQfe2f/UdkSHREdlqYoRCbzIWs=
X-Received: by 2002:a05:6214:1869:: with SMTP id eh9mr1069857qvb.16.1623170177811;
 Tue, 08 Jun 2021 09:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210608163304.1223962-1-raj.khem@gmail.com> <CAAnfSTs1y0HLWswwpH-weyqV9gLMJeM=nYK37Ea47bSOKfhMtA@mail.gmail.com>
In-Reply-To: <CAAnfSTs1y0HLWswwpH-weyqV9gLMJeM=nYK37Ea47bSOKfhMtA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 8 Jun 2021 09:35:51 -0700
Message-ID: <CAMKF1spasSq+Xc4H-DjfVxnZs2_X51byXkv-33TgAkg1YFgqFA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] zsync: Fix build on musl
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 8, 2021 at 9:34 AM Ross Burton <ross@burtonini.com> wrote:
>
> I've a better patch, hold off merging that recipe.
>

ok

> Ross
>
> On Tue, 8 Jun 2021 at 17:33, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Ross Burton <ross.burton@arm.com>
> > ---
> >  ...0001-sha1-Include-unistd.h-for-off_t.patch | 29 +++++++++++++++++++
> >  meta-oe/recipes-extended/zsync/zsync_0.6.2.bb |  4 ++-
> >  2 files changed, 32 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-extended/zsync/zsync/0001-sha1-Include-unistd.h-for-off_t.patch
> >
> > diff --git a/meta-oe/recipes-extended/zsync/zsync/0001-sha1-Include-unistd.h-for-off_t.patch b/meta-oe/recipes-extended/zsync/zsync/0001-sha1-Include-unistd.h-for-off_t.patch
> > new file mode 100644
> > index 0000000000..60bcd8166f
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/zsync/zsync/0001-sha1-Include-unistd.h-for-off_t.patch
> > @@ -0,0 +1,29 @@
> > +From 72ad6dd95441836afb1f113697339b3c694d0e69 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 8 Jun 2021 09:26:32 -0700
> > +Subject: [PATCH] sha1: Include unistd.h for off_t
> > +
> > +Musl systems do not get this definition indirectly like what happens
> > +on glibc, therefore include unistd.h to get the definition
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libzsync/sha1.h | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/libzsync/sha1.h b/libzsync/sha1.h
> > +index 3946505..23d9434 100644
> > +--- a/libzsync/sha1.h
> > ++++ b/libzsync/sha1.h
> > +@@ -16,6 +16,7 @@
> > + #else
> > + #include <sys/types.h>
> > + #endif
> > ++#include <unistd.h>
> > +
> > + #define       SHA1_BLOCK_LENGTH               64
> > + #define       SHA1_DIGEST_LENGTH              20
> > +--
> > +2.32.0
> > +
> > diff --git a/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb b/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb
> > index c61e26309d..b80bf9cded 100644
> > --- a/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb
> > +++ b/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb
> > @@ -5,7 +5,9 @@ LICENSE = "Artistic-2.0"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=71c0ac4d86266533509aa0825b8d323c"
> >
> >  SRC_URI = "http://zsync.moria.org.uk/download/${BP}.tar.bz2 \
> > -           file://out-of-tree.patch"
> > +           file://out-of-tree.patch \
> > +           file://0001-sha1-Include-unistd.h-for-off_t.patch \
> > +           "
> >  SRC_URI[sha256sum] = "0b9d53433387aa4f04634a6c63a5efa8203070f2298af72a705f9be3dda65af2"
> >
> >  inherit autotools
> > --
> > 2.32.0
> >
> >
> > 
> >
