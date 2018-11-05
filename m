Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 003D579CF3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Nov 2018 08:30:43 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id i78-v6so3456522ybg.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Nov 2018 00:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9kah8bKor6yxWnqCkc7HmeBxbqVrwjHLf5k/fXxOpQ4=;
	b=saAJ665C/CDJfBsgbUX0Qu8K5ginLvD0zFEh4q2JzDDCGb1ywy0Bjr15ixi4zuBQ5M
	AFi7X++Wmu7+Tgw5WBcSWXLxPcIt4xLZgaPLAR++zH7b03YVDyqJOb+68wZ602xAzxlx
	25q3S1Z082Csc37JQLA6vahPUj7/9cmIb3ohr/8um4Q5qrzprj0fSqGN/eFWO8fQ2Q7P
	BtLOgvUaDCKrwMUlkctPsHnPclvAnSragi4bbXYGl5kajXxeTZS3p3/KkcR2TeqPR9Qd
	sXO2R0MiUMsix7NzZyWJlqqEYBZPa8bpFeWzzqR3m8YyjqFOoAf73n7zGY5xMBE8crWN
	cf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9kah8bKor6yxWnqCkc7HmeBxbqVrwjHLf5k/fXxOpQ4=;
	b=f+HuMyD3d2USVu/XGhG5NQVFyG0dqvqnq/JDPqSfupCcc0KvfyJOD2ODYvR384n/TH
	cMO2TDFwe/vPKna5zhpGM6Ncb3Xs19dPFML0tDcejt7hQ8W7+UmUjidXEfDTt7grow5V
	mumPiUEXdJoBjL43XonpAARpZ7iuH8xjKrTHK7iduvleSPeGmmafJCnomYg0maXkO8q7
	y+PETWgMXSUvKxQd08B4jnqsF9sw0/Q9whHAZ+sk1I502QGdWRm9f0BUXTdPzuBvit6L
	8dLUGKm11usqVJOvwSnt+B4uYXWYF1Uuh5Krd6/yNj2dW2plmn6xhpZ4+m+TRC5Ki/VU
	B6vA==
X-Gm-Message-State: AGRZ1gLOTyqLVTVCNox68ZkdfAf43/AAW01weW8hX74yx9bTEFqnObEy
	vQ12dqDu7KYwK/EOc4EwkTYWXIl+6QEv3lcbFb+wBriL
X-Google-Smtp-Source: AJdET5f5+z91uKbqOQYwZ5z9vTGKLGXwqff6FygALgX3ob5W2TUHyIjix6g5R2S7eGGAUyXKiMxxfWo7Ju4ZKVgOqqY=
X-Received: by 2002:a25:6589:: with SMTP id
	z131-v6mr19558181ybb.389.1541406644616; 
	Mon, 05 Nov 2018 00:30:44 -0800 (PST)
MIME-Version: 1.0
References: <20181105055915.148218-1-kai.kang@windriver.com>
	<d6c0751d-d377-f964-0310-3856116bea88@windriver.com>
In-Reply-To: <d6c0751d-d377-f964-0310-3856116bea88@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 5 Nov 2018 09:30:31 +0100
Message-ID: <CALbNGRTZCP+TKaDh40aFuh8ryx=kZRZacnn+i20Ok47CvM7iig@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] libunique: fix installed-vs-shipped qa issue
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
X-List-Received-Date: Mon, 05 Nov 2018 08:30:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 5, 2018 at 7:58 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2018/11/5 =E4=B8=8B=E5=8D=881:59, kai.kang@windriver.com wrote:
> > From: Kai Kang <kai.kang@windriver.com>
>
>
> Oops. Forgot prefix [meta-xfce] in the title.
>
> --Kai
>
>
> >
> > libunique shows installed-vs-shipped QA issue if configure option
> > '--disable-introspection' is set by:
> > 1) in gobject-introspection*.bbclass that the 'qemu-usermode' is not
> >     supported by bsp and then not set in MACHINE_FEATURES
> > or:
> > 2) set in local.conf directly:
> >     EXTRA_OECONF_append_pn-libunique =3D " --disable-introspection"
> >
> > Remove empty directory to fix the QA issue.
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >   meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb b/=
meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
> > index 49ed07ad9..a6475cef6 100644
> > --- a/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
> > +++ b/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
> > @@ -28,3 +28,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa=
3495befef8f17206a5b0a1"
> >   inherit autotools pkgconfig gobject-introspection distro_features_che=
ck gtk-doc
> >
> >   REQUIRED_DISTRO_FEATURES =3D "x11"
> > +
> > +do_install_append () {
> > +    rmdir --ignore-fail-on-non-empty ${D}${datadir}
> > +}
>
I think this breaks introspection - why not just pack Unique-1.0.gir?

Andreas

