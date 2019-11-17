Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id A80E87F638
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 15:18:04 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id r9so13606432ilq.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 07:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6Jh94uwcpRp4KZqI5dtl8Kiuz4J7hUSvfo4xsQd2ahc=;
	b=D+4rAG1oC8/tY5kUilbhmuL0fqYrrPyPGBaC6WwA7bs+kDC/3jd8uOvv3EszdmLyqm
	djE2U6Jem/gQyGLw8tZ6BiHtOTjvKbJHf/ps5HIWY0czSWgvU2TtaFBLIWdoocywtBf1
	H6EPQcrzs7J1AdmJPZ9+WKNPxOmb6AMYEm5c6tOuICCGubE8aXnA6xsUuj9vWmKhCJVa
	9Ase5nYdaMeeZIgeLpT7rQkPAgFGhJZMClLBja6Yr+KkQ8Tbt87wZi8uwfHALkTtegK8
	xI92L/frWWoqTgqdBNL+cg4Ad4RzwfDR9gQRAZ//SvExb5yjZ84hvBsJyEhePQwhrmPA
	1SmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6Jh94uwcpRp4KZqI5dtl8Kiuz4J7hUSvfo4xsQd2ahc=;
	b=mv1XgMtaOcJRDT+W+36xy2S2wkT7QEsuVMInzN/GYoxhlMM/kO5XeJYhskdmjN3GoB
	pTEBbaYJNp6xFULw6dqYqvnChWF4cV7r3TQ1QkTeBMyj/jbQPeKQD8bcCNIlEyOwpIIb
	M4CfAHyjbtdaAmtisRZ4druNrgohhaj+3yvviN5+ULLhU+Ff3OvzAGShG2kCRChdNMfS
	GPz11WFs6bosuCd3wI7Fj2dh84odM2i/X5bBC7OEFVZOISAMepqvcINwjRgsvfWAaTg3
	snfNg3EFnBMYGKqCezwqmlzcpEPNnjlrF24rcccaDqEQmQdAsQ/YoGCTKHqybjim+XV2
	r5Pg==
X-Gm-Message-State: APjAAAXpzgrbdCjZXRtyKYbyL8rmkQYCBPcyqJNcitt29RqC+RpL3c4t
	9kIgdhXVRMOShtjiN0jywmzM39WIZ86boCHSZA0=
X-Google-Smtp-Source: APXvYqw6+ChdHwNwMjOaMx/FkkG7Ko/lIPUnnKWiHsU39YCQZxuCNcGBAvFMlU3bEaE/dvuufnI2SIgBH9tYKAaUbzs=
X-Received: by 2002:a92:5cce:: with SMTP id d75mr11265606ilg.299.1574003885678;
	Sun, 17 Nov 2019 07:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
	<20191114194930.2786-14-schnitzeltony@gmail.com>
	<CAMKF1sru3JvSpMvHHzrL1+D1Qkm4Orec8r0FcwrrKn=38gm5sg@mail.gmail.com>
	<CALbNGRQZE0ScPCq973vQsWttB4-rPxU7_ZKCvtvSpnAYUffnPg@mail.gmail.com>
In-Reply-To: <CALbNGRQZE0ScPCq973vQsWttB4-rPxU7_ZKCvtvSpnAYUffnPg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 17 Nov 2019 16:17:54 +0100
Message-ID: <CALbNGRThTpUgqGfNR5EqLnPVjhB8raVpQ8Gz-H2VUtdjYpbwtg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 13/16] geocode-glib: initial add 3.26.1
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
X-List-Received-Date: Sun, 17 Nov 2019 15:18:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 11:51 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Thu, Nov 14, 2019 at 11:13 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Nov 14, 2019 at 11:51 AM Andreas M=C3=BCller <schnitzeltony@gma=
il.com> wrote:
> > >
> > > It is a dependency for upcoming gnome-settings-daemon
> > >
> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > ---
> > >  .../geocode-glib/geocode-glib_3.26.1.bb       | 20 +++++++++++++++++=
++
> > >  1 file changed, 20 insertions(+)
> > >  create mode 100644 meta-gnome/recipes-gnome/geocode-glib/geocode-gli=
b_3.26.1.bb
> > >
> > > diff --git a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.=
1.bb b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb
> > > new file mode 100644
> > > index 000000000..dc218f3a3
> > > --- /dev/null
> > > +++ b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb
> > > @@ -0,0 +1,20 @@
> > > +SUMMARY =3D "A convenience library for the geocoding"
> > > +
> > > +LICENSE =3D "LGPLv2"
> >
> > still at 2.0 and not 2.1 interesting.
>
> will check
          GNU LIBRARY GENERAL PUBLIC LICENSE
               Version 2, June 1991

That is LGPLv2 - right?

Andreas

