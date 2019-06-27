Return-Path: <jean-tiare.le-bigot@easymile.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA827E427
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 09:11:26 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id b18so1074673qkc.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 02:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=easymile.com; s=easymile;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rozS/6OipgbzxBPvk+D1L44+Z+pnaspAbyLgA07+dtU=;
	b=A8I0ErUPQFJB4sTd106gXrCe1fRFNkC7WM62UQTN1lce5rG9VbvXlzFBSa1/N8P/JV
	8hlG7n1SiRHpm9W3z0KUdSzMjoUO8BMUF/5UcxuO9aBunmVck1Pog1Sec4AlnYmZFxFn
	/0wr2MR0NwnYMaCjeN/IQAfgp6qjlAjh2b47g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rozS/6OipgbzxBPvk+D1L44+Z+pnaspAbyLgA07+dtU=;
	b=kR30FDSpvFIqIT1mZ1XRAAIc7oYQTGHthrw/Q3vW9QIGejB//c160qG2/QqLbD1qlJ
	YXXzxHEMlSFyUC92zUU7TY69RTc2l/wcAmYlLXRM7GsSQBQ/KAy5Vwtq7fwqmOXIF4E3
	ee4cRwzYAsP35yNmpoIVrXUcn4ebcVeeMCq3pakIG/AoXIDEtoIJEQiY529XAY8lSjwo
	pdekJWzoqHLBa1vWkI1piX4mfHoDcP+ZBagJqecemNYFbIAyh7Jw9sxv/BJllrCw3pQ/
	4xW4bAO8sWgr8Qs+OMRgRfMmbIVM/vX1e9Q4KH6yka2shEHzsXNu+6+dqbmHfynSS1/F
	zztQ==
X-Gm-Message-State: APjAAAUcPPeHXWPthcyq/aYEkfkbP3WFK3SlweGMs7sJZf27zXRmNXuP
	ZmM0+yhQY0CT2IlzRJCxZlpqBcuYxL3BybXszZLT1g==
X-Google-Smtp-Source: APXvYqwEzjMNonqOx/mckSLI7OgHk8uhD5Kiuh1oe0h+u3wlsCpAwyB9NQNAWehkynlknvHDkQYeN5MOqEBtiH+bauo=
X-Received: by 2002:a37:56c5:: with SMTP id k188mr2250829qkb.109.1561626687228;
	Thu, 27 Jun 2019 02:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190627085904.9461-1-jean-tiare.le-bigot@easymile.com>
	<CAJTo0LY0va0AoVDBSjV8ju0=Dmy-s3x_O9SOACwAvH8wt_4_Jg@mail.gmail.com>
In-Reply-To: <CAJTo0LY0va0AoVDBSjV8ju0=Dmy-s3x_O9SOACwAvH8wt_4_Jg@mail.gmail.com>
From: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
Date: Thu, 27 Jun 2019 11:11:16 +0200
Message-ID: <CAPVBjxErjGdp71LoJVvmVkM=HDJSbPJKR0D96MEKzTHJTqUFOg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: =?UTF-8?Q?Jo=C3=ABl_Esponde?= <joel.esponde@easymile.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: fix directories setuid and setgid bits
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
X-List-Received-Date: Thu, 27 Jun 2019 09:11:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh, sorry. Resending.

On Thu, 27 Jun 2019 at 11:06, Burton, Ross <ross.burton@intel.com> wrote:

> This should go to openembedded-core@lists.openembedded.org, not -devel.
>
> Ross
>
> On Thu, 27 Jun 2019 at 09:59, Jean-Tiare Le Bigot
> <jean-tiare.le-bigot@easymile.com> wrote:
> >
> > From: Jo=C3=ABl Esponde <joel.esponde@easymile.com>
> >
> > populate_packages relies on ``mkdir`` to both create a directory and se=
t
> > its permissions. However, ``mkdir`` honors the ``umask`` value.
> > Therefore, some bits may be lost in the operation. In our case, the
> > setgid bit on the directories were lost.
> >
> > This commit fixes this by having a distinct call to create the director=
y
> > and to set the permissions.
> >
> > Signed-off-by: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
> > ---
> >  meta/classes/package.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclas=
s
> > index 20d72bba79..cd223a121e 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -1216,7 +1216,8 @@ python populate_packages () {
> >                  src =3D os.path.join(src, p)
> >                  dest =3D os.path.join(dest, p)
> >                  fstat =3D cpath.stat(src)
> > -                os.mkdir(dest, fstat.st_mode)
> > +                os.mkdir(dest)
> > +                os.chmod(dest, fstat.st_mode)
> >                  os.chown(dest, fstat.st_uid, fstat.st_gid)
> >                  if p not in seen:
> >                      seen.append(p)
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


--=20
Jean-Tiare Le Bigot

