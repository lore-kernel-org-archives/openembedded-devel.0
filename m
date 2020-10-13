Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.884.1602610618050252712
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 10:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CxYPMU01;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id e6so446325qtw.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 10:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1bZBLgIIkrC1VcZ32/Eu2vL34jYMh3zXB1Ais7czuyQ=;
        b=CxYPMU01z7ErX+D9A/rL0A6BCOhUiHwITHIXd9ukCngX6MmrGWtlDtNMljU2GDiLTf
         AoaJYRZmSBRA+O/hX7EnVvUEl4fkV2Iqbi0qK9ZaEmMpl1LJorxPQ5fXO7FY7QKUCe9z
         TBGbXwNiwjZxWqqp07oovh5b4a9lBneXkaoeLclILE9Iy8T95wNeqyhi22Y+1rAeGV6q
         iHThZ9x/G0nOW7gi9cUjxXPwMxR/TSvXcOOIkNWlCSiSDXgShHrejl+ph7Uy8fIW/b7f
         vAgJ5m/n3ix6+thfMJ4MD59p8rgvPQSZy7KOlH9bO7t3hiN3PNrFwgiGJtJufNJVRM/L
         HCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1bZBLgIIkrC1VcZ32/Eu2vL34jYMh3zXB1Ais7czuyQ=;
        b=Ykjt4xxSJ1jYs/nc5q4MiaKPS0o2O6dIjn3YKspDjoIYaQX6l1ojg11o4RyXzyuPng
         VhI27cL9MQHzm7Uicuu3yWP62r5YaQhUzRTrBJFEQMXmDEHG4x5afWTA63cgD1QLPydF
         Qc+TnOLRsd0/N3XTtnhgs8xTvxGGR/efJbXDy1pS3pU5oSdLMf8RpibEi0IozkIUFNep
         1KdXO9P+VEoloLrGyZmclsLvV27iW6/q8JC8rX06FJ3Q7MyhWPsh80idYcqdGvZ5McLS
         3BOCIfXWyXWah0bwOILKVesrNjN2Q1VA96mGtNmjgaFtSnRYIsGwF373vIXN5HRe9uks
         sujA==
X-Gm-Message-State: AOAM532Uu4Wvo9DWESNv1RscMRk0itldUTUa2TQo5z9Rx58LiM6soc5p
	zzSAR8sYBN+l0JbOQC7ZBAHEtMornHZJs12gkFw=
X-Google-Smtp-Source: ABdhPJxnQ71B1JRmhpI7nFcE9tmHJR0qS3kNzrvcAaOTTks9m8iOQpS4qPaILyBI75RBFc59Axu+R8q7x0pFQ1iFPJU=
X-Received: by 2002:ac8:5a82:: with SMTP id c2mr804164qtc.378.1602610617046;
 Tue, 13 Oct 2020 10:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <163C5AC1761FD67D.15658@lists.openembedded.org> <2de8951e-11bb-3027-957c-f47f4829191f@gmail.com>
In-Reply-To: <2de8951e-11bb-3027-957c-f47f4829191f@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 13 Oct 2020 10:36:30 -0700
Message-ID: <CAMKF1soBXRVXd0+zRgj7oXhj4+c_9YqFhgERUVM9_bmZdT_-Mw@mail.gmail.com>
Subject: Re: [oe] [dunfell 0/9] pull request
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 8:05 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 10/9/20 7:55 AM, akuster via lists.openembedded.org wrote:
> > Cover letter only
> >
> > please merge this to dunfell
>
> ping

merged now thanks

>
> >
> > The following changes since commit 144077083457ccb75700777d5e6b1da9aaf=
f01aa:
> >
> >   iwd: Upgrade to 1.9 (2020-09-19 11:22:44 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://git.openembedded.org/meta-openembedded dunfell-next
> >   http://cgit.openembedded.org/meta-openembedded/log/?h=3Ddunfell-next
> >
> > Andreas M=C3=BCller (1):
> >   gnome-settings-daemon: Remove wrong RDEPEND
> >
> > Hongxu Jia (1):
> >   python3-pykwalify: fix missing comma
> >
> > Khem Raj (1):
> >   ssmtp: Use update alternatives for conflicts with esmtp
> >
> > Martin Jansa (2):
> >   netkit-rsh: inherit update-alternatives
> >   ssmtp: adjust u-a
> >
> > Mingli Yu (2):
> >   smartmontools: Remove obsolete setting regarding the Standard Output
> >   strongswan: Remove obsolete setting regarding the Standard Output
> >
> > Pierre-Jean Texier (1):
> >   haveged: upgrade 1.9.9 -> 1.9.13
> >
> > Robert Yang (1):
> >   crda: rdepends on wireless-regdb-static
> >
> >  .../gnome-settings-daemon_3.34.2.bb           |  2 --
> >  .../recipes-connectivity/crda/crda_3.18.bb    |  2 +-
> >  .../netkit-rsh/netkit-rsh_0.17.bb             |  2 +-
> >  .../recipes-support/ssmtp/ssmtp_2.64.bb       |  9 ++++-
> >  ...setting-regarding-the-Standard-Outpu.patch | 34 ++++++++++++++++++=
+
> >  .../strongswan/strongswan_5.8.4.bb            |  1 +
> >  .../{haveged_1.9.9.bb =3D> haveged_1.9.13.bb}   |  2 +-
> >  .../smartmontools/files/smartd.service        |  1 -
> >  .../0001-rule.py-fix-missing-comma.patch      | 34 ++++++++++++++++++=
+
> >  .../python/python3-pykwalify_1.7.0.bb         |  2 ++
> >  10 files changed, 82 insertions(+), 7 deletions(-)
> >  create mode 100644 meta-networking/recipes-support/strongswan/files/0=
001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
> >  rename meta-oe/recipes-extended/haveged/{haveged_1.9.9.bb =3D> havege=
d_1.9.13.bb} (97%)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-pykwal=
ify/0001-rule.py-fix-missing-comma.patch
> >
> >
> >=20
> >
>
