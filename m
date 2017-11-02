Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 196A2782D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 16:57:13 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id q1so164933ywh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0V7ucelB2blrqBYkU/cGcA4b+8LP5f/2vyn5HUvUgG0=;
	b=ZM5Vbgx2tLTIyurzzClIOAGd/bOlR3Aq3hEbzAcPnT1j91L93D639tg261R/7Vp55G
	fUDkpBe88QLlR/wNpz8tn9gEYMBmFbXBYZozF2qxMpvH1GQKxV99AFyhrQ3hiU1uj5xc
	8L8bXisdbYUX9baeCnwHJWDAb9xdU/il/aV5ILdDNRgBKj28KRr3F5moj+KRXH4MSvkf
	J711u+eypcJ6aEdz4JtGHuSgMtq/O0Fv4tCVEym42KZfV89Pzh7kYpHrrNAYyI05rkhI
	6QPSQx5Sy1l9WO23dFrRiQIixWj5dZx7OkICXLG+OkkBob/cjg2+wQSCmDY9n3wweKEU
	1z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0V7ucelB2blrqBYkU/cGcA4b+8LP5f/2vyn5HUvUgG0=;
	b=tlWYsK+UVr2vj1CqT3bZv3Uj1wFEEif02f95hYEeGMSIKJJgqBDhPQTF6sNnk9ySx0
	RKPytwUV8gWFIQOpll7aXS1CBQp+/qeeZXIsTLDHnhjbrEoClFmt/YaYfGKv2suNvJcT
	Yab94KuoHc6PrtDEuPDbm6mIDp+9NZl+1EDDkf8+uouuMfYP/GippdoegWMkVzQUi4Hr
	jAFy/VgHs40+GNkc04cwyMWRNuCylw+YjduvnkyUvtZMa/3s5HBm+MYPm3538r3K5QAp
	c4qmOZ43TOKjNP+c8A6PEHs4rl0V8z/LBBhaEUha85ib78EZM76teieGZFuUn/SbZPhj
	OlsQ==
X-Gm-Message-State: AMCzsaX81DkBg0cWy7NrzdIKsKSJFdOeNfn9u3PtIShjLPqFbbPb1wWt
	RVACoqD4t1QB9HIgUnZm8OOLgqp73i72877B1K0=
X-Google-Smtp-Source: ABhQp+R3zTrKZ0P2euqXv/hE5GjIzcEVwE3nRS/Hf7t/hNUvxOLHPM9RlivJ+WlHDd1ZdiNosqeH7t6dm2zJ7vEwH2k=
X-Received: by 10.129.117.9 with SMTP id q9mr2858093ywc.79.1509641835020; Thu,
	02 Nov 2017 09:57:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.83.2 with HTTP; Thu, 2 Nov 2017 09:57:14 -0700 (PDT)
In-Reply-To: <CAMKF1spbF2bJDQK_htfwpEKRgh1MzZEpkxpyde1x1dfoaqNYhw@mail.gmail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
	<20171102103129.3703-2-schnitzeltony@googlemail.com>
	<CAMKF1spbF2bJDQK_htfwpEKRgh1MzZEpkxpyde1x1dfoaqNYhw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 2 Nov 2017 17:57:14 +0100
Message-ID: <CALbNGRRrpSkAy8vkVQ33P-ONLdWqXnT_Oa1tViORfBx2R_Wjbw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 01/10] tumbler: make thumbnails work again
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
X-List-Received-Date: Thu, 02 Nov 2017 16:57:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2017 at 5:30 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Nov 2, 2017 at 3:31 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > fixes:
> > | Failed to load the cache plugin "tumbler-cache-plugin.so":
> /usr/lib/tumbler-1/plugins/cache/tumbler-cache-plugin.so: cannot open
> shared object file: No such file or directory
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> > ---
> >  meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> > index 1f5419a..fe331cb 100644
> > --- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> > +++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> > @@ -15,6 +15,10 @@ INSANE_SKIP_${PN} =3D "dev-so"
> >  PACKAGECONFIG ??=3D ""
> >  PACKAGECONFIG[gstreamer-thumbnailer] =3D "--enable-gstreamer-
> thumbnailer,--disable-gstreamer-thumbnailer,gstreamer1.0
> gstreamer1.0-plugins-base"
> >
> > +do_install_appen() {
>
> typo
>
> Thanks and LOL: In this way this patch does simply nothing and I could
swear having tested it. @Martin: Can you please ignore this one until I
checked and come back with V2 (if really necessary).

Andreas

