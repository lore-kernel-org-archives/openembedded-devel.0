Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web09.7507.1617200679706333051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 07:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lt+mXELO;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id z1so21365505ybf.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Mar 2021 07:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uUeedM62EYw9ss1/EbuRSJawYhJmXfwAGKJomR3Rqaw=;
        b=lt+mXELOYyKuBwPnZ0pe49eqiRqcL1Pwqq0pDkK0tavJXPPwawJP3+vR1AuqFbdw+G
         ZAUHDuv3csOEbB/ASUE9YDGwcPkLTUm1rbckhXTHmnxKxwHmlKwN4e7tatT0oz/qcZ0l
         mDcDEkZpYTFPZsfaljldnWaTkYrPLIA50+a7mBLAVRLOjTn4LPcXRwS4cCeNq36lMSNN
         jozQIqQLVqK1YxRuXDWNaDAKDuiakouwGqqUdXQVCumLigDbf7YgZBNhDE23nZOSh8FX
         wmdKQdgaop9wjfKCNMDk8jpFiXuXMJYmnbxtK/COXsc/BKe97a6h+nQSnNVUxFDw4Uvy
         pWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uUeedM62EYw9ss1/EbuRSJawYhJmXfwAGKJomR3Rqaw=;
        b=arzTZXOfDDoZrUdTi3krpdOUtqK5jP89KQsbJAvmax9wOs9DE2K6hJeaeYK0vpyIc9
         uHe+Rg/huWf5UTnoFD7owqEDoHiZ3o8dkrJ4PK2NlDSAhaC2qlR0ZdUgHsIR//iHP5KP
         VHRRYSeQLgfjy9aG9CvbNXuz8Ri7x43Le0o9HeDYGcWdI9Tfk+7NxOtj+fuf87ZW+DDc
         9aLg7MMlwFDijnOc8LVtfEJaHz7RhQl9SmVprq5FIzQ3vdnOXXWJzcCQ+TEh9eZoZi9d
         xpdOH3lSNg9CLwpHhf5/r8BLbERqWrO33xowrP0oO+ZnRRrPG9pJuwOCVHWdNN6sxiEr
         GDXA==
X-Gm-Message-State: AOAM531r3M7c0/4aIRdNGfwOLmWtO6305zmBC4Vm1LBdHaI/h5GdnfyQ
	RNqosG5FyynjWYhok/OWTDgjYKI3wv1FhRRPXJA=
X-Google-Smtp-Source: ABdhPJzyBZ816WoltJsIgfPP40yUKnxwoFYhVYon/ToNUlpvZ6PTtCyDdskA7QGMIB3PPE8vwW4UM6ZCrQpzbD8kTe4=
X-Received: by 2002:a25:2386:: with SMTP id j128mr4965170ybj.284.1617200678768;
 Wed, 31 Mar 2021 07:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210331092906.18788-1-Rahul.Taya@kpit.com> <652a11f7-f26a-7815-0327-49b967bd9207@gmail.com>
In-Reply-To: <652a11f7-f26a-7815-0327-49b967bd9207@gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 31 Mar 2021 04:24:27 -1000
Message-ID: <CAGDS+nk5NEmuke20U_aYAo+D9LMv6fASDGTNqa2KBjpoGry6Xg@mail.gmail.com>
Subject: Re: [oe] [poky][dunfell][PATCH] qemu: Add fix for CVE-2020-13791
To: Khem Raj <raj.khem@gmail.com>
Cc: "Rahul.Taya" <Rahul.Taya@kpit.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, nisha.parrakat@kpit.com, 
	Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 4:12 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> this is wrong ml for oe-core patches, they should go to oe-core mailing
> list.

Also, it doesn't apply to the current head of the oe-core dunfell branch!

Please rebase on current dunfell branch and send a V2 to
openembedded-core@lists.openembedded.org

Thanks for helping with CVE's!

Steve



Steve

> On 3/31/21 2:29 AM, Rahul.Taya wrote:
> > From: Rahul Taya <Rahul.Taya@kpit.com>
> >
> > Added below patch to fix CVE-2020-13791.
> >
> > CVE-2020-13791.patch
> >
> > Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
> > ---
> >   meta/recipes-devtools/qemu/qemu.inc           |  1 +
> >   .../qemu/qemu/CVE-2020-13791.patch            | 52 +++++++++++++++++=
++
> >   2 files changed, 53 insertions(+)
> >   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13791.pa=
tch
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtoo=
ls/qemu/qemu.inc
> > index 5e8d3e09ff..01c78f6577 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -54,6 +54,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.=
tar.xz \
> >             file://CVE-2020-24352.patch \
> >             file://CVE-2020-25723.patch \
> >             file://CVE-2021-20203.patch \
> > +          file://CVE-2020-13791.patch \
> >             "
> >   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch b/me=
ta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
> > new file mode 100644
> > index 0000000000..6582abce59
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
> > @@ -0,0 +1,52 @@
> > +From f7d6a635fa3b7797f9d072e280f065bf3cfcd24d Mon Sep 17 00:00:00 200=
1
> > +From: Prasad J Pandit <pjp@fedoraproject.org>
> > +Date: Thu, 4 Jun 2020 17:05:25 +0530
> > +Subject: [PATCH] pci: assert configuration access is within bounds
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +While accessing PCI configuration bytes, assert that
> > +'address + len' is within PCI configuration space.
> > +
> > +Generally it is within bounds. This is more of a defensive
> > +assert, in case a buggy device was to send 'address' which
> > +may go out of bounds.
> > +
> > +Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > +Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> > +Message-Id: <20200604113525.58898-1-ppandit@redhat.com>
> > +Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > +Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > +
> > +CVE: CVE-2020-13791
> > +Upstream-Status: Backport[https://github.com/qemu/qemu/commit/f7d6a63=
5fa3b7797f9d072e280f065bf3cfcd24d.patch]
> > +Comment: No hunks refreshed and no warnings were seen while applying =
patch.
> > +Affected version: >=3D4.2.0 but patch already present in Master and G=
atesgarth branches.
> > +Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
> > +---
> > + hw/pci/pci.c | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > +index 70c66965f56..7bf2ae6d92a 100644
> > +--- a/hw/pci/pci.c
> > ++++ b/hw/pci/pci.c
> > +@@ -1381,6 +1381,8 @@ uint32_t pci_default_read_config(PCIDevice *d,
> > + {
> > +     uint32_t val =3D 0;
> > +
> > ++    assert(address + len <=3D pci_config_size(d));
> > ++
> > +     if (pci_is_express_downstream_port(d) &&
> > +         ranges_overlap(address, len, d->exp.exp_cap + PCI_EXP_LNKSTA=
, 2)) {
> > +         pcie_sync_bridge_lnk(d);
> > +@@ -1394,6 +1396,8 @@ void pci_default_write_config(PCIDevice *d, uin=
t32_t addr, uint32_t val_in, int
> > +     int i, was_irq_disabled =3D pci_irq_disabled(d);
> > +     uint32_t val =3D val_in;
> > +
> > ++    assert(addr + l <=3D pci_config_size(d));
> > ++
> > +     for (i =3D 0; i < l; val >>=3D 8, ++i) {
> > +         uint8_t wmask =3D d->wmask[addr + i];
> > +         uint8_t w1cmask =3D d->w1cmask[addr + i];
> > --
> > 2.17.1
> >
> > This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print, retain copy, disseminate, distribu=
te, or use this message or any part thereof. If you receive this message in=
 error, please notify the sender immediately and delete all copies of this =
message. KPIT Technologies Ltd. does not accept any liability for virus inf=
ected mails.
> >
>
>=20
>
