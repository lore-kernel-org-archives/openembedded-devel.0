Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6FCAF7D4E7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 17:51:06 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id o129so8515848qke.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 10:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ETr4kTrqTpyo93dIdIMLrbtj4NHXAqiPVVsi7bh5Nws=;
	b=Qy13dkCGzRWouvMs1c0eC4aYoqbpXaO35pmI4rth4BewudbjPRJTtBp94+00tLUPpp
	g8OsGLjgboJQCx74gJ2jY+5ULKj+W4sJdMsWnm8U1/cKbX48lKn/wqUev2lUCaJuraTo
	7goe0tGCAaZVlhfnggT7EBh2zXKOg5t+oG2xhG856cuJVA+yPWTupG4iagkDXbM+VmdR
	QTwCcOElFxB7AKQ2V+WLQg+H2FLVi47/NTxTS/vZ4VUxQ1PYyGPRd6k1vwzGsxVvu8IV
	V5jbf/dd831VU87eaqZYeQdok9issy/WEkJ1lWV+8OPH6Nx+9deMU3F+IrD6ZfkCvrDQ
	Yc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ETr4kTrqTpyo93dIdIMLrbtj4NHXAqiPVVsi7bh5Nws=;
	b=NDuhtm5vKiuQZ+6oDBRzTflR1Rpj4SkAdLrYJkW11fvx2akT6dB/zzonk8He6lKUCb
	/NFTt6DBkCurEQ9OC2rToVGpwyaSxaEMZINnCJRsN5PD4+Gqt3RvDieN8sEOzcDV+W5C
	7/Cx8uLiHlOWXncoj3iK+bDdzegNEk/MeqygXjK+YEQVU3VVIm+krbH006S02Jtr3vLb
	geBGxn9F2vszjzok6y8fGFZ/UqKSTMtiCXDUqueuOtNwfSHcwW/K35cJy1NVlYZKMxzB
	psxToU7aQsS0WgscPANbQasprK1v/xSwbYV/pcR8il5KREcRtXLy3AqixFQSLdGQLOpm
	mzcA==
X-Gm-Message-State: APjAAAXnx4KZtD3cblq+JXJe9hGOzfKl6kSxCI1UCI/GNFgc3yEo6p+D
	7ksXWPoefiBzqHeyW4yAN7L2rlWeGkqdT7Tc/IZvieB4yS8=
X-Google-Smtp-Source: APXvYqxAmAHYifP97oOL+iQCrgpltN9wiu3Md6MqD1KnSRij6qz6BGqcbYGbaDsINBrUfdOb/8DTguN6T0JIRM2e5DQ=
X-Received: by 2002:a37:9fc4:: with SMTP id
	i187mr23166548qke.141.1554745867212; 
	Mon, 08 Apr 2019 10:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190406190807.5220-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1sqwXkVbyAV8Kq+3gT5sqcnToPdPDU8uD8qyxdrqW58FvA@mail.gmail.com>
In-Reply-To: <CAMKF1sqwXkVbyAV8Kq+3gT5sqcnToPdPDU8uD8qyxdrqW58FvA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Apr 2019 10:50:41 -0700
Message-ID: <CAMKF1spS9PLKgg5Ezo8kU3X1YF8dronMDR1VrYf2HWL6RYM9tA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] macchanger: update to 1.7.0
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
X-List-Received-Date: Mon, 08 Apr 2019 17:51:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 8, 2019 at 10:34 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fails to build for musl see
> https://errors.yoctoproject.org/Errors/Build/79499/
>

particular link
https://errors.yoctoproject.org/Errors/Details/236092/

> On Sat, Apr 6, 2019 at 12:08 PM Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
> >
> > Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> > ---
> >  .../{macchanger_1.5.0.bb => macchanger_1.7.0.bb}    | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> >  rename meta-networking/recipes-support/macchanger/{macchanger_1.5.0.bb => macchanger_1.7.0.bb} (50%)
> >
> > diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb b/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
> > similarity index 50%
> > rename from meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> > rename to meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
> > index a90177f19..0c683ac01 100644
> > --- a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> > +++ b/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
> > @@ -1,14 +1,13 @@
> >  SUMMARY = "Tool to view/change network interface MAC addresses"
> >  DESCRIPTION = "A GNU/Linux utility for viewing/manipulating the MAC address of network interfaces."
> > -HOMEPAGE = "http://www.alobbs.com/macchanger"
> > -LICENSE  = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> > +HOMEPAGE = "https://github.com/alobbs/macchanger"
> > +LICENSE  = "GPLv3"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> >  SECTION = "net"
> >
> > -SRC_URI  = "${GNU_MIRROR}/macchanger/${BPN}-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "79b7cdaeca3d8ebafa764c4b0dd03ab7"
> > -SRC_URI[sha256sum] = "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb2031120826cd73fa8fe"
> > +SRC_URI = "https://github.com/alobbs/macchanger/releases/download/${PV}/${BPN}-${PV}.tar.gz"
> > +SRC_URI[md5sum] = "ca56f16142914337391dac91603eb332"
> > +SRC_URI[sha256sum] = "dae2717c270fd5f62d790dbf80c19793c651b1b26b62c101b82d5fdf25a845bf"
> >
> >  FILES_${PN} = " \
> >      ${bindir}/${BPN} \
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

