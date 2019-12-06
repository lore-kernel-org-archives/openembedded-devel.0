Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id C5A3F7FC0C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 09:32:10 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id f82so6658201ioa.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2019 01:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Vy+2AACM/33sUk2WwS6oaMCB6V0vmy6Sl+pRpSGqmoc=;
	b=u9X+ZRRFH78mJZ1RA9Yb49vqrzN9ugaMomxV55IjMEupHmehDOub6bCkb+U2x2CB8X
	qmYAJRGC2bmriUX2mRDFvNtvJYPJkAG3wFFDnYMsaipGDrNji6QreeDikwwskXToCFRv
	YtnBkYPaIJv4TPz41qfXYJ4El0Eq9oii7Ega0c5UdNLU/1PINsVYLmw9jiPA3/Xd+5Pv
	eSfSPZqEXuU/zu4hvU01XeC6Ry8afjNjfMHoudQHenCRS5jHtOiScr28r3a+Tpv0sK8J
	+tNxs/YaTRCPb+gm9nTFOjG59MAExhlQyIg/Y4Es+YBKdl8/iNXcXOGq1rRtLkJ2/lH3
	Y9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Vy+2AACM/33sUk2WwS6oaMCB6V0vmy6Sl+pRpSGqmoc=;
	b=MgQD21nJr0FBLixQ6EO8r//UIeU92GnlZTSWAVACAFXXq01bMqiOFpO1qPF3cZNdQt
	K5szBnAUW8GWAln/3cBrfKh7eYbp9ukcgBQNH3GNb/wVSO2CN0r3CXNC/+DM5RGP0ACC
	L8JEyikFilzLvTvA/Z2MMWoma/ug5GFXdnrS6ucesaoYYFdPnO+Wd6HTpA4xLcK2tWpl
	CtFX89SLw31qdAfwp9kg8LDFfFs+avBfcwXR2GmxDd0NQrAKCcNkprm7yuXiNQ/UG4XD
	MoTvwsxZ0x+RkPhevTzK1IU39Gzxq1ZTvSLK63gJ2pgYKDXGHQuOourXRdbmSJm9tzCR
	YFmw==
X-Gm-Message-State: APjAAAVZbt84DAzJd85iirr69DY3MYmVJUQI1FfQGXduwQ8EBPlYWfYN
	6KW5gNL86z1HlD8iYP2qdffQZ6B9Bx2DWLVXqXA=
X-Google-Smtp-Source: APXvYqwcJdEcrRVu6T1E6fDwgC5Ox4aCzV/jIAbOoX+ZWM07S76iQwQKT9pAsp3PPy1yYZbuEjT4CjIW5njRJfZTfHk=
X-Received: by 2002:a6b:f60e:: with SMTP id n14mr9322372ioh.147.1575624731153; 
	Fri, 06 Dec 2019 01:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<20191206000912.19841-22-schnitzeltony@gmail.com>
	<CAMKF1sroq9=eexVrX0QHH2-287rXQkg48pAVqCNjiyL5MA3GWw@mail.gmail.com>
	<CALbNGRRy1-DBAGPS1K7UiidugsP7Kwctn8P-NGiosTYMosZ1dw@mail.gmail.com>
In-Reply-To: <CALbNGRRy1-DBAGPS1K7UiidugsP7Kwctn8P-NGiosTYMosZ1dw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 6 Dec 2019 10:32:00 +0100
Message-ID: <CALbNGRRYHJKZJ8MHRZ2q4pVWvbc+MCCnrru8pZcS2v8SaqLCoA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 21/21] Add: packagegroup-gnome-apps / packagegroup-gnome-desktop
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
X-List-Received-Date: Fri, 06 Dec 2019 09:32:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2019 at 10:28 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
> > > +RDEPENDS_${PN} =3D " \
> > > +    evolution-data-server \
> > > +    evince \
> > > +    file-roller \
> > > +    gedit \
> > > +    gnome-font-viewer \
> > > +    gnome-system-monitor \
> > > +    gnome-terminal \
> > > +    libwnck3 \
> > > +    nautilus \
> > > +    wv \
> >
> > wv provider recipe is missing,
> Oops - it is in meta-office - will move it here because that's what I
> have tested the series with
Oh no - more coffee: wv is old crap - will remove it from gackagegroup.
>
> Andreas

