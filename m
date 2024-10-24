Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1868CE8E99
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 17:21:22 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.16376.1729781218358876196
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 07:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DyUXlGjA;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: schonm@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2884a6b897cso591449fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 07:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729781217; x=1730386017; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FqZCN3cN7O4NRLRYiABFd+SICUTw1sFlUQcUif+ZFyY=;
        b=DyUXlGjAi1Wr6WoaDrIgh6/yPHFgMTukiJ1WgvrunNjRot5qB/3+O/5pY9k2MMx7e6
         yIClbbrCham6kp+zRrMzXqPf6i7rr3MlyC5/oZqAhixXY3KuDJNLeAz5n9Ikueol7m83
         ZxgMeISkL0dZRAD8X5QRaiUD4sgwtSTPqk9UAia23daX04/jD44apdxVaJoBqqKtQyvJ
         QdKu7AOjNOceX6refleLsJzrPYAXv1dCr9t4D/85J0KekbN9wrBqXBc6EcZ+AdyQOHy4
         akQeTmTpl5dNpc3rcXSJlkfAG3HmtrHf8JRuotHz6XTWnwIc4mOv4GB9/C0PqgqHtcVY
         MtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729781217; x=1730386017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqZCN3cN7O4NRLRYiABFd+SICUTw1sFlUQcUif+ZFyY=;
        b=E3eMUaOW+39HRmfd+XlNj/Iz/OyASdJ+P476z2kGvSFzz4u7hG0DL80af29ULWNHoE
         reny58/Hu540tT9BsUvnqPurbhBLg8b9hL9O/oY68HOe78S6pxBG4pyg/RQ46iP3mZke
         2qVPN2Gqj9PVgJO9+oM1hQ0ZwyAVnCZD8shHl5KumJQC/9xXIndYpi29Fosf3Evual+u
         22EMq0EnYfwfpY6WIjeZ4qHId6ufMMCHOAoBVj5aXJWN5zQvG7XZfzdfmqTRt9hIm/Cs
         C2rP7OEMpJz4Tt7vJrE5mbbtRV+8put/58E7bDAZkd1KEBX1M/gUETHeE72P09KtRvcv
         nigQ==
X-Gm-Message-State: AOJu0YxQopNvL1Ct3E9NPeTJDQgg1uHQ5M0F51UmiVvinjZ65ZRPlMgW
	dUoyL8wd/cNM2rqhRdXYeh7i5jBrTDSiY7zos6MHl7wV5fbGDhb/mfTgb4hx+5Ctt7brTjdSWXU
	sN3Owdp0huLXY9U9dkZ38jafhTEQ=
X-Google-Smtp-Source: AGHT+IGY3AeGOPIFWaOGQWZ2VbdBYeBzksXqhvExATHHaZGneSqjL0tR9pGAitAhFgXhleVhhO8ejGi7vEXjfcTblS8=
X-Received: by 2002:a05:6871:b25:b0:270:50f7:50c1 with SMTP id
 586e51a60fabf-28ced111561mr2269282fac.1.1729781217070; Thu, 24 Oct 2024
 07:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241024130612.21656-1-schonm@gmail.com> <CAMKF1srGS1Nh6=ZzpQF_gUQThXWXVqP5WNQn1on=gTUnkgcqkA@mail.gmail.com>
In-Reply-To: <CAMKF1srGS1Nh6=ZzpQF_gUQThXWXVqP5WNQn1on=gTUnkgcqkA@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Thu, 24 Oct 2024 10:46:45 -0400
Message-ID: <CABTo8gCeo-55xvHADeEmRvSA=WwjVuojuOGDxNPp0x5B7b2Rew@mail.gmail.com>
Subject: Re: [oe] [meta-perl][PATCH] libdigest-hmac-perl: upgrade 1.03 -> 1.05
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/mixed; boundary="000000000000fbdf4006253a1264"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 17:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113177

--000000000000fbdf4006253a1264
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, the dual license GNU GPL & Artistic License remains the same.
I've attached the Readme files from the two versions here.

Thanks,
Jason Schonberg

On Thu, Oct 24, 2024 at 9:34=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Thu, Oct 24, 2024 at 6:20=E2=80=AFAM J. S. via lists.openembedded.org
> <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > This new version brings an updated copyright date and a new maintainer.
> > This distributes under the Perl license (as it did previously).
> >
> > Update the HOMEPAGE and SRC_URI to use metacpan.org instead of search.c=
pan.org
> >
> > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > ---
> >  ...gest-hmac-perl_1.03.bb =3D> libdigest-hmac-perl_1.05.bb} | 8 ++++--=
--
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >  rename meta-perl/recipes-perl/libdigest/{libdigest-hmac-perl_1.03.bb =
=3D> libdigest-hmac-perl_1.05.bb} (57%)
> >
> > diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.=
bb b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
> > similarity index 57%
> > rename from meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.b=
b
> > rename to meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
> > index 41b4e78c5..7b5980287 100644
> > --- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> > +++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
> > @@ -1,17 +1,17 @@
> >  SUMMARY =3D "Keyed-Hashing for Message Authentication"
> >  DESCRIPTION =3D "Keyed-Hashing for Message Authentication"
> > -HOMEPAGE =3D "http://search.cpan.org/~gaas/Digest-HMAC-1.03/"
> > +HOMEPAGE =3D "https://metacpan.org/pod/Digest::HMAC"
> >  SECTION =3D "libs"
> >
> >  LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> > -LIC_FILES_CHKSUM =3D "file://README;beginline=3D13;endline=3D17;md5=3D=
da980cdc026faa065e5d5004115334e6"
> > +LIC_FILES_CHKSUM =3D "file://README;beginline=3D6;endline=3D9;md5=3D63=
21739e9ccbf74ee5dd2eb82c42d609"
> >
>
> The checksum changed and the number of lines for calculating the
> checksum as well. are they still conveying the same license terms ?
>
> >  RDEPENDS:${PN} =3D "libdigest-sha1-perl perl-module-extutils-makemaker=
 perl-module-digest-md5"
> >
> > -SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-H=
MAC-${PV}.tar.gz \
> > +SRC_URI =3D "https://cpan.metacpan.org/authors/id/A/AR/ARODLAND/Digest=
-HMAC-${PV}.tar.gz \
> >             file://run-ptest \
> >            "
> > -SRC_URI[sha256sum] =3D "3bc72c6d3ff144d73aefb90e9a78d33612d58cf1cd1631=
ecfb8985ba96da4a59"
> > +SRC_URI[sha256sum] =3D "215cb59cba610745cfb2d4b3f8ef756d590e57e3ad7986=
a992e87c4969fcdc7a"
> >
> >  S =3D "${WORKDIR}/Digest-HMAC-${PV}"
> >
> > --
> > 2.43.0
> >
> >
> >=20
> >

--000000000000fbdf4006253a1264
Content-Type: application/octet-stream; name="README-1.03"
Content-Disposition: attachment; filename="README-1.03"
Content-Transfer-Encoding: base64
Content-ID: <f_m2nf0uvo0>
X-Attachment-Id: f_m2nf0uvo0

SE1BQyBpcyB1c2VkIGZvciBtZXNzYWdlIGludGVncml0eSBjaGVja3MgYmV0d2VlbiB0d28gcGFy
dGllcyB0aGF0CnNoYXJlIGEgc2VjcmV0IGtleSwgYW5kIHdvcmtzIGluIGNvbWJpbmF0aW9uIHdp
dGggc29tZSBvdGhlciBEaWdlc3QKYWxnb3JpdGhtLCB1c3VhbGx5IE1ENSBvciBTSEEtMS4gIFRo
ZSBITUFDIG1lY2hhbmlzbSBpcyBkZXNjcmliZWQgaW4KUkZDIDIxMDQuCgpUaGUgRGlnZXN0OjpI
TUFDIG1vZHVsZSBmb2xsb3cgdGhlIGNvbW1vbiBEaWdlc3Q6OiBpbnRlcmZhY2UsIGJ1dCB0aGUK
Y29uc3RydWN0b3IgdGFrZXMgdGhlIHNlY3JldCBrZXkgYW5kIHRoZSBuYW1lIG9mIHNvbWUgb3Ro
ZXIgc2ltcGxlCkRpZ2VzdDo6IG1vZHVsZSBhcyBhcmd1bWVudC4KCllvdSB3aWxsIG5lZWQgcGVy
bCB2ZXJzaW9uIDUuMDA0IG9yIGJldHRlciB0byBpbnN0YWxsIHRoZXNlIG1vZHVsZXMuClRoZSBE
aWdlc3Q6Ok1ENSBtb2R1bGUgYW5kIERpZ2VzdDo6U0hBMSBtb2R1bGUgbXVzdCBiZSBpbnN0YWxs
ZWQuCgpDb3B5cmlnaHQgMTk5OC0yMDAxIEdpc2xlIEFhcy4KQ29weXJpZ2h0IDE5OTggR3JhaGFt
IEJhcnIuCgpUaGlzIGxpYnJhcnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1
dGUgaXQgYW5kL29yCm1vZGlmeSBpdCB1bmRlciB0aGUgc2FtZSB0ZXJtcyBhcyBQZXJsIGl0c2Vs
Zi4K

--000000000000fbdf4006253a1264
Content-Type: application/octet-stream; name="README-1.05"
Content-Disposition: attachment; filename="README-1.05"
Content-Transfer-Encoding: base64
Content-ID: <f_m2nf0uvy1>
X-Attachment-Id: f_m2nf0uvy1

VGhpcyBhcmNoaXZlIGNvbnRhaW5zIHRoZSBkaXN0cmlidXRpb24gRGlnZXN0LUhNQUMsCnZlcnNp
b24gMS4wNToKCiAgS2V5ZWQtSGFzaGluZyBmb3IgTWVzc2FnZSBBdXRoZW50aWNhdGlvbgoKVGhp
cyBzb2Z0d2FyZSBpcyBjb3B5cmlnaHQgKGMpIDIwMjQgYnkgQW5kcmV3IFJvZGxhbmQuCgpUaGlz
IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkg
aXQgdW5kZXIKdGhlIHNhbWUgdGVybXMgYXMgdGhlIFBlcmwgNSBwcm9ncmFtbWluZyBsYW5ndWFn
ZSBzeXN0ZW0gaXRzZWxmLgoKClRoaXMgUkVBRE1FIGZpbGUgd2FzIGdlbmVyYXRlZCBieSBEaXN0
OjpaaWxsYTo6UGx1Z2luOjpSZWFkbWUgdjYuMDMwLgo=

--000000000000fbdf4006253a1264--

