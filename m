Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7CAE874740
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 19:55:53 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id o17-v6so15149203qtr.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 12:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=f/xYEqBK7huJd7MGRWx/Wenwifi/DUpLhdPBd4gTabs=;
	b=ENMd+2b2AuGDi5bU16X9vEfH2IJ4LSIx0+dJ0D/eqrwvr/1AlyyHvddMEkrEyKCQSJ
	seatDZcSmRepARI4VZEqUzd8afMQ3jvcav+X9Mr125kqaI5VG4Ayf/9ex14A642yHXCu
	ASH3fwifJzldtq6bpd0YUPJBbr6RB2cpCavxG99B7NDr4dsav6jDzutxQAeS4619Kxno
	vRtgCGWSU9Z0L623TRg9syNL9/tKIuuKj3sblOshKLFoe5JSroJp1IAfARTfMxjLS835
	eHEDJSLcPf9G5RzGvF39YJtFML6Pg1fvNEO42gGCaZK+YtgahUE2QyNq6hCd1wJYao/F
	OJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=f/xYEqBK7huJd7MGRWx/Wenwifi/DUpLhdPBd4gTabs=;
	b=QllwMEZ8WjJutLZxQEi7Ct366vKJ7P5wpbm1r8SxjpNIYZPcKIC8337mRh4q7zIes4
	cebC0rqgJ1KXDkshWsKElMqgSUOeW26gtcvoWw7Ero4kRV7stg2jJhhivY9v6ahD+1Ry
	tskXIBgKzM+WhJpsXJZ5sMo3Bv2mG/Ph+x68soN3q/NQvP8/xQp7neaSUEgbyAfu8fa8
	5t6vXI+Yf9g+2Yv4oKHTkLxcqL6BxbpHSb0A9PeZYsHuHKgaiKDl/rSOJKjnYzmBA/Vr
	arDuesVAtjKo4kzIM6DriWqAkLjMTj4kgKZIh/5im0qeBGurDYXUYCykdENWrAAI7Qpg
	XKZw==
X-Gm-Message-State: ABuFfojlMR3li5lRBatqanwCNN9yKopOMj+n6mxXkKqLvde7AI+1Fsbh
	6WMbheXyxZBTrU0QxksLNzXo1CvczlMBM0bGYys=
X-Google-Smtp-Source: ACcGV63ngtp+CA64pTJxb1xzV6DkjO4dH3c3QeWc0FQdFjp806GUquR9DX7pwMh+fv+q+YoYoFaHGk0zk0Nkx6VePoo=
X-Received: by 2002:ad4:41cc:: with SMTP id a12mr7318003qvq.55.1539374154022; 
	Fri, 12 Oct 2018 12:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
	<1539357981-3675-5-git-send-email-akuster808@gmail.com>
	<CALbNGRTxEzy8ZYxpKW0ORh9Ca9ODNYrmMxhcMQYYxDaL97N=3w@mail.gmail.com>
In-Reply-To: <CALbNGRTxEzy8ZYxpKW0ORh9Ca9ODNYrmMxhcMQYYxDaL97N=3w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Oct 2018 12:55:27 -0700
Message-ID: <CAMKF1sofWn4oPK1yDPkBj9wxheCHg91WyLB8UHp4=9MM8cbOXg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/5] blueman: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Oct 2018 19:55:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 12, 2018 at 12:51 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Fri, Oct 12, 2018 at 5:27 PM Armin Kuster <akuster808@gmail.com> wrote=
:
> >
> > Nothing RPROVIDES 'thunar'
> >
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >  meta-oe/recipes-connectivity/blueman/blueman_git.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> If thunar is the only reason then this has to go to append in
> meta-xfce - there thunar PACKAGECONFIG is activated.
>

I agree.

> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

