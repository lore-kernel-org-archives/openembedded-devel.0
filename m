Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.1289.1589266879976480856
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 00:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ijqQXcGM;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id f189so6901948qkd.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 00:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G6ZMReley3ejmp1vHCCXTOFyosrr+MNkmOEcqmwwYu0=;
        b=ijqQXcGMe1CCRU9TlToVjKwGaqUKBvkvLg3fnS7bG8btS4tsgcF2MpbXFqHfhdBPc+
         cyYl0QyFbMnVBz4jdPRJkeyYJBR7G64jaVfRE6ROjNGHZ8sXatIk0VqY/uUBr2YUDQKW
         Fn1eAJn+Ds4AM0sRaNznYVRUm0oXs+3UrggzfuRAq6dAlmHboH5/7Kx7Y8T5lHySnf0s
         SwVjisUHzZMXJChAxLQZ+NYxVn4VIlhzGu0Nsl9lQBf457hJVybFoe2d/v8yNLAXT5HI
         E/5I97rKKZeLIbEFr7GHrzDUwZkKdSFUmyzfuzwp4XM1XANG4v/WQa0LJTItF7JG2zYK
         SyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G6ZMReley3ejmp1vHCCXTOFyosrr+MNkmOEcqmwwYu0=;
        b=AN0AdUOVKiU8mDtTYVuJ7FYmoZ4Imf6MtfwfXr93P1WQoBWWsM4T5Yz9yV1XjevaX4
         hLl8G2MMPm4jdpB0QTsftCy/LmkPjOl3DF04DfEfctg8HBFQBKOXyrUyyMtDCwlWveXN
         CDgbb7eINwq7OuNBGLV1Kh12IwK0M7iBWc6b8kpejMO6TIi+htTk33K3CBGjFeusQdWR
         cbvhidy7tp0Nx8IYvM/fu6O1cnS5KsZjt4C/rnxIzSY65yOFagbYaxH929S5MUEqxygE
         mNAiKmS8mwY723o25+q/G1sv1VCSzcbgwuRttJc2TJUTqTNwaCgn8MRk2CN4erx9ow0Q
         Au2w==
X-Gm-Message-State: AGi0PuYkmpAsWoHNuYTjl3cLyR9mSC+Kep6NnVMI6wwdybSNoxMblmZy
	UcTX+FIAqJiXQvsgnOSwMhFM/AFZU3qwsO9KuCU=
X-Google-Smtp-Source: APiQypJFNmfSJDICq0FJZSnPHhdmTDRfGuYmbW4NQ+RuTpvNwJ2qQsJG9VyaZ05atpR6LNzF2HWWpmxD7qMHCJWuSO0=
X-Received: by 2002:a37:a694:: with SMTP id p142mr12660837qke.165.1589266878926;
 Tue, 12 May 2020 00:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <1589278403-92900-1-git-send-email-wangmy@cn.fujitsu.com>
 <CAMKF1sp1J2tT8=CBkb4vCed9oE5NKUG-8ZNs6tqPLE3a3DpKSQ@mail.gmail.com> <1e5d54e6e55e4e6895b02ce6b1b38cc7@G08CNEXMBPEKD05.g08.fujitsu.local>
In-Reply-To: <1e5d54e6e55e4e6895b02ce6b1b38cc7@G08CNEXMBPEKD05.g08.fujitsu.local>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 12 May 2020 00:00:52 -0700
Message-ID: <CAMKF1srw=4=R=eKU5Qske+ORnTH4Omt_snNHBqebGDighbNcrQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mailcap: upgrade 2.1.48 -> 2.1.49
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 11:07 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> The man page changed from mailcap.4 to mailcap.5 recorded in the license=
 file.
>

I think its clear if we use the format described here

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Describi=
ng_license_changes

> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Tuesday, May 12, 2020 9:39 AM
> To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@cn.fujitsu.com>
> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] [meta-oe][PATCH] mailcap: upgrade 2.1.48 -> 2.1.49
>
> On Mon, May 11, 2020 at 6:13 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrot=
e:
> >
> > man page changed from mailcap.4 to mailcap.5
> >
> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > ---
> >  .../mailcap/{mailcap_2.1.48.bb =3D> mailcap_2.1.49.bb}        | 6 +++=
---
> >  1 file changed, 3 insertions(+), 3 deletions(-)  rename
> > meta-oe/recipes-support/mailcap/{mailcap_2.1.48.bb =3D>
> > mailcap_2.1.49.bb} (81%)
> >
> > diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb
> > b/meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
> > similarity index 81%
> > rename from meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb
> > rename to meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
> > index 114ce4607c..ff3047f325 100644
> > --- a/meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb
> > +++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
> > @@ -14,12 +14,12 @@ by several applications e.g. to determine MIME typ=
es for filenames."
> >  SECTION =3D "System Environment/Base"
> >
> >  LICENSE =3D "PD & MIT"
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D100fcfb84512ccc03ffc7d89ac=
391305"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8dce08227d135cfda1f19d4c0c=
6689de"
> >
>
> what changed in LICENSE, please add few words about that to commit msg.
>
> >  SRC_URI =3D "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
> >
> > -SRC_URI[md5sum] =3D "2c26e18e912a5cf00318fcf7f8f2d747"
> > -SRC_URI[sha256sum] =3D "d7b023b237d6053bf05ff6786e0663c55c614efcc99cd=
f856120be13b5c29157"
> > +SRC_URI[md5sum] =3D "d5701a1a541383c0eda328f4a6518751"
> > +SRC_URI[sha256sum] =3D "f7381516bc1a937348efd1d0e14618e0a2afc5d59fe82=
1dd248632d5601b59b5"
> >
> >  do_install() {
> >      oe_runmake install DESTDIR=3D${D} sysconfdir=3D${sysconfdir}
> > mandir=3D${mandir}
> > --
> > 2.17.1
> >
> >
> >
> >
>
>
>
>
>=20
