Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0006BCD6E45
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 07:17:41 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5156.1780039054463751820
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2026 00:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KcSlCs/C;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-69d92dbc420so3992684eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 00:17:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780039054; cv=none;
        d=google.com; s=arc-20240605;
        b=e12hmkT4YyMWqp6jHLwJxy8YhbYiiwjkcP+RYx0bTOVFmyprKYNO1PrHySyzdtHN/9
         eMSAtpTcoOp8pshCNjkDpvYAUEYIKiS66Kp6Jttp3atwfru1Vz4JeQInBCt1zRxqEJuh
         OnkcrbwZfLcf/3hHkfbHTbcYhg8PaLxCVeVnmC0ps41mdih1dHsArnxhL7/r+cN6VRjD
         WU6azcA/kmLmTKmNfLHgkRkIj++S2FMlEmKYXxB6sF3rv6bFrgBHigyX93jorOi9hTkg
         fcIZDmYboceSDpIFOGQtSkbwd7b9Lb6cq2OSD582ZJsGNjSdIBTDASCpUuscJFM4IK0E
         lrsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tNqfuX9k/HMAuhqQNUtKCQa1PmdslHuSrSuCwPrlJbg=;
        fh=0PykZDcXZGe6JEqb1twhJkNu4VgcFCijfM0S/8z66T4=;
        b=gjX70/y5xQHAL/IXzkJYHfvBMmgnsvPiIZ0C6r3hcaQ/xnvEiN93EbL66gcGtBNgWE
         rCp4BciA2XzOn7xl4Y226EGEJwFM3EB1dKCCKW0kfdXoHN9pFNy+IkE7gka1T1wm8X72
         KBhq0LsTBx9OrCRAbeG3qq4s3tBuXGZj9r9gpl+0xT81FfNloaoXQUuMpllDMxpdJrf8
         2Wm7NbU+t0utg3bGXOKWf80Hz9kOTohA0VxkFsOwrr7QF2n6CRRC9z/gvyv6toJCknYc
         mwW/CtBhEnn9OdLCZt6NEWktVPCGfLttj5QIDfmQqT6nXIoH4BIc3faCf08R4kmq4b06
         6bPg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780039054; x=1780643854; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNqfuX9k/HMAuhqQNUtKCQa1PmdslHuSrSuCwPrlJbg=;
        b=KcSlCs/CrSwJPVD+GZYc+Be0lmfN5eU167SqwoXOqeX4BXfvHGE8KeoHSJQ3Gtkjf3
         opkKQBQldyiAat5rpxooeiLcySv/W0m8HsnYpQWlyw+JzVAGfsnSYel9NEeGdAm0DkN5
         ssFWxNBPX2PviuOvD2+k0PNJS300UfqlAF29ybvl05amCs4BB6GEk1vT/iG0BwNpTskQ
         OMAOO5iW/r8DEMz4OEUEPHLahy3/a2jr6mreKyZC4En1xUwnmFPiBb6ybNK7ln4KM0yw
         KSiE7OMwCpAmFWNQZnEO8ELzF3ooPDZAMiVBI8/4EuAeTdra00eoOxsXXgB56CpSg85c
         fYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780039054; x=1780643854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tNqfuX9k/HMAuhqQNUtKCQa1PmdslHuSrSuCwPrlJbg=;
        b=shpzfsNHgtnLlW57z9FY52Id+l37d8Z7Y3Pc4HmZxZs2e//GKQ0w/VRg7k2I46SS2D
         D4wkecTSTev/cR+E7DR0nas8oed38vYZU+40eB/fqQgKtqYPv8cTMVMBnE9CWxVA/Xnq
         qVX0TL8mee40Az+uyPKgOBGpIN62qNpkexhOB5Uv7RUMrgliyn4v0j/MbTufvXSOcITx
         u7AwURWgg71D2lAS/eg+FAJrNniBwbLELJACfSoqaamL6NAWjwsSMhZ6Q0AUNpIHq4nz
         hLGRP3BZMIOkXIxBRIMNK9yyesW91ALVlB8RNdHiRf75h+NTWcTnZ1LrP+muqVF3iP9L
         C3Gg==
X-Gm-Message-State: AOJu0YyUOdNXoexMGTV2NykOFC8+69Y8lVaXNqBMowCyEOesy0QZuOwu
	2v1rsZ9xoPP2at/6nZtFn+7dMPFjofqPzqBp2WfLMpadGwCBoawGu6uGJZDpPU4jw3t+Dj1sG9p
	EUfRUyHzt8npmnqVBO6jvWBR5kYXQPiY=
X-Gm-Gg: Acq92OHpqNUKu8B+pzTa3+yp7rc8YwBSAvY3qIUB4TZadoum6+nvA3SWNgHh8EiZjSr
	vuR2bhl84f0h+F43ldQCCF1aTTkdU5w91RuEaVBXvGsQlRIfPNdiwPHQgtkOjaQlo/THmlHk1MO
	u+68/sEln5tFU3Qtotmt4dnAA9viXzko4A9WixJNYs75LH9oh5MqIb3zKYO+j5v0qisvAFV4tqZ
	jMREuPfGD5GZhyzFjoc7FKfLBmULaXsMsbXJVq08T6K+T4jcplYuzn4+D69+Ow8brQ0zWE04peG
	1LEy0RBzktp6YIpfoz+6
X-Received: by 2002:a05:6820:1b0e:b0:69d:7ca8:ef07 with SMTP id
 006d021491bc7-69e03f13245mr845919eaf.20.1780039053537; Fri, 29 May 2026
 00:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
 <20260523050028.848327-17-ankur.tyagi85@gmail.com> <CA+s=J=z66sXdftCSw8gSdW4_jYW92Gw-WmP2xQXGG5wrPkmLhg@mail.gmail.com>
In-Reply-To: <CA+s=J=z66sXdftCSw8gSdW4_jYW92Gw-WmP2xQXGG5wrPkmLhg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 29 May 2026 19:17:21 +1200
X-Gm-Features: AVHnY4L6LN8IRUeY6LEKsPrww5F9G7_kYI_avSCH8szEeRh4SrUBdRaDnONWq24
Message-ID: <CADySD0EMDwq1vYbg=sSeb-cBVenphY=FNQdVJp--eti4P6dqkA@mail.gmail.com>
Subject: Re: [oe][meta-networking][wrynose][PATCH 17/25] dnsmasq: fix CVE-2026-2291
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>, Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 07:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127281

On Fri, May 29, 2026 at 3:58=E2=80=AFPM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
> I will drop this and proposed patch for 4890 for same reasons as given
> for scarthgap:
>
> https://lists.openembedded.org/g/openembedded-devel/message/127125
>
> https://lists.openembedded.org/g/openembedded-devel/message/127126
>
> Thanks,
>

I somehow missed your scarthgap feedback, sorry about that.
Please drop it.

> Anuj
>
> On Sat, May 23, 2026 at 1:01=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
> >
> > dnsmasqs extract_name() function can be abused to cause a heap buffer
> > overflow, allowing an attacker to inject false DNS cache entries,
> > which could result in DNS lookups to redirect to an attacker-controlled
> > IP address, or to cause a DoS.
> >
> > Reference:
> > [ https://nvd.nist.gov/vuln/detail/CVE-2026-2291 ]
> >
> > Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > (cherry picked from commit a53328688a239e97b8383ffbfd7b4b4eca108d73)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
> >  .../dnsmasq/files/CVE-2026-2291.patch         | 37 +++++++++++++++++++
> >  2 files changed, 38 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2=
026-2291.patch
> >
> > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/=
meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
> > index 59509ecba2..bef058aa3e 100644
> > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
> > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
> > @@ -15,6 +15,7 @@ SRC_URI =3D "http://www.thekelleys.org.uk/dnsmasq/${@=
['archive/', ''][float(d.getV
> >             file://dnsmasq-resolvconf.service \
> >             file://dnsmasq-noresolvconf.service \
> >             file://dnsmasq-resolved.conf \
> > +           file://CVE-2026-2291.patch \
> >  "
> >  SRC_URI[sha256sum] =3D "fd908e79ff37f73234afcb6d3363f78353e768703d92ab=
d8e3220ade6819b1e1"
> >
> > diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-229=
1.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
> > new file mode 100644
> > index 0000000000..6e42f32136
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
> > @@ -0,0 +1,37 @@
> > +commit ec2fbfbbdaa7d7db1c707dce26ce1a37cfe09660
> > +Author: Simon Kelley <simon@thekelleys.org.uk>
> > +Date:   Fri Apr 10 16:29:31 2026 +0100
> > +
> > +Fix buffer overflow in struct bigname.  CVE-2026-2291
> > +
> > +All buffers capable of holding a domain name should be
> > +at least MAXDNAME*2 + 1 bytes long, where MAXDNAME is the maximum
> > +size of a domain name. The accounts for the trailing zero and the
> > +fact that some characters are escaped in the internal representation
> > +of a domain name in dnsmasq.
> > +
> > +The declaration of struct bigname get this wrong, with the effect
> > +that a remote attacker capable of asking DNS queries or answering DNS
> > +queries can cause a large OOB write in the heap.
> > +
> > +This was first spotted by Andrew S. Fasano.
> > +
> > +CVE: CVE-2026-2291
> > +
> > +Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=3Ddnsm=
asq.git;a=3Dcommit;h=3D014e909f787e808bb35daa546d3f8f3663918de2 ]
> > +
> > +Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
> > +
> > +diff --git a/src/dnsmasq.h b/src/dnsmasq.h
> > +index 254bacd..58be09f 100644
> > +--- a/src/dnsmasq.h
> > ++++ b/src/dnsmasq.h
> > +@@ -479,7 +479,7 @@ struct interface_name {
> > + };
> > +
> > + union bigname {
> > +-  char name[MAXDNAME];
> > ++  char name[(2*MAXDNAME) + 1];
> > +   union bigname *next; /* freelist */
> > + };
> > +
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#127167): https://lists.openembedded.org/g/openembed=
ded-devel/message/127167
> > Mute This Topic: https://lists.openembedded.org/mt/119451385/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

