Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id EF90960116
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 16:59:18 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id g53-v6so13054760qtg.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 09:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Xww3OPVvddD2w0d1TTVHXfNjYHqBSYG9WAkRcE94Z90=;
	b=kXkNjYk4mLlXxbExpQz1k1BRJQI3NxsC5ObkpqwC9godOlI0xwa+Y8BDYYJR7fVMtv
	4+OF3nBzsvWsfaB+XV/Y1YnAP7ov1s6LtAw+r8gcmaCUeTpywRctA/x8lPcYR7z93Pwj
	FPpuEKWkg5lN4jssM0VI3WeG+JO8IAO5TNy04R2rgIzL7xkZB3ImuIUj4SwmDovq4EUc
	Vn6txlM24YppMBy4+eE9Aj0EPCaLsRCnU8jWpKZe3RV1C5cQ3JHZPFROM5Me6aQwlv9G
	A1deLvvZ1V0uOIxxKR/7nRf4Wbz7X5nLQtbAvGx1UxOyp8jDcf8c4sfe4zCj+P6wI7u2
	G6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Xww3OPVvddD2w0d1TTVHXfNjYHqBSYG9WAkRcE94Z90=;
	b=JQjKi5svGyuL9Q0fl1/kujhfmGyTG0J9ibAzGKWpBxzVCcBynw5zOhQazLPjeSCwsL
	p004hT0FbnWpg4qsE+QaQ2uStW/f8CU2dKM3irM40UohyaL46dPsuYI1Zy552G3VYW5Z
	MuXW9oxphzk+xVqQD8LZ7cqDqJI3nzIlY0qunc62o6rOUfOGt1C1QOlnVDbsLIoHHInk
	gLrG0UN2vEITH3wQVZKd0VqjPj4IljdoGUr9+L+PTNwD9WeqPmFOyZe6rlrPBEQmvOrh
	kAx6TFJ/65swaRjmtX7hr/aB6ND6Dv1dNTQt93kIPRThBeE7vFS4EBZs0Rttaki/TMrn
	ckAg==
X-Gm-Message-State: APzg51C3/lDj7K1Xh27U5mpmUrNRV4Wfm6FLSH8nj6Av+b8FDWsi+IXs
	b7tKnJn30BA2Bf0DET2rNxhxnR/OC5S4E/sUNKE=
X-Google-Smtp-Source: ANB0VdathDdwJJjnsBXmHeXPQvFcZpkR9iJtTPMdRYDP8c14gCxlDkzXD2vvFuBrsFX34/od5dS/e70um2Hf0PI9hDQ=
X-Received: by 2002:ac8:6c8:: with SMTP id j8-v6mr2857160qth.314.1536253159683;
	Thu, 06 Sep 2018 09:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180906123745.26192-1-brgl@bgdev.pl>
	<CAMKF1soK0OxkEai1r0U-aZdE97u5HPoev7G7Ykes9m8BP9uSmQ@mail.gmail.com>
	<CAMRc=MejwMEJS89gOmxNqbAd6AnSg28fY+urhLT6ofaQ1aC5cQ@mail.gmail.com>
In-Reply-To: <CAMRc=MejwMEJS89gOmxNqbAd6AnSg28fY+urhLT6ofaQ1aC5cQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Sep 2018 09:58:53 -0700
Message-ID: <CAMKF1sqUR8-z3_2dq3_-Q-krPMxnzN2kx6Jx_EmEKzNcwc2sEQ@mail.gmail.com>
To: brgl@bgdev.pl
Cc: bgolaszewski@baylibre.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkd-dispatcher: new package
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
X-List-Received-Date: Thu, 06 Sep 2018 16:59:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 6, 2018 at 9:13 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> 2018-09-06 17:31 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> > On Thu, Sep 6, 2018 at 5:38 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >>
> >> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>
> >> This adds a recipe for networkd-dispatcher.
> >>
> >> It's a simple package containing a python script that needs to be
> >> installed together with a systemd service and an example config
> >> file. There's nothing to build.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >> ---
> >>  .../networkd-dispatcher_1.7.bb                | 30 +++++++++++++++++++
> >>  1 file changed, 30 insertions(+)
> >>  create mode 100644 meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb
> >>
> >> diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb
> >> new file mode 100644
> >> index 000000000..1887c4c7a
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb
> >> @@ -0,0 +1,30 @@
> >> +SUMMARY = "Dispatcher service for systemd-networkd connection status changes"
> >> +DESCRIPTION = "This daemon is similar to NetworkManager-dispatcher, but is much \
> >> +more limited in the types of events it supports due to the limited nature of \
> >> +systemd-networkd(8)."
> >> +AUTHOR = "Clayton Craft and others"
> >> +
> >> +LICENSE = "GPLv3"
> >> +LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
> >> +
> >> +RDEPENDS_${PN} = "systemd python3 python3-pygobject python3-dbus"
> >> +
> >> +SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher.git;protocol=https"
> >> +SRCREV = "c7e25623a161b64618ea778541c064d2a1df086b"
> >
> > perhaps define PV in terms of SRCPV
> >
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +# Nothing to build, just a python script to install.
> >> +do_compile() {
> >> +}
> >
> > use deltask
> >
> >> +
> >> +do_install() {
> >> +    mkdir -p ${D}/${sbindir}
> >> +    install -m 0755 ${S}/networkd-dispatcher ${D}${sbindir}/networkd-dispatcher
> >
> > condense both into install -D -m 0755 ....
> >
> >> +    mkdir -p ${D}/${systemd_unitdir}/system
> >> +    install -m 0644 ${S}/networkd-dispatcher.service ${D}/${systemd_unitdir}/system/networkd-dispatcher.service
> >> +    mkdir -p ${D}/${sysconfdir}/conf.d
> >> +    install -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfdir}/conf.d/networkd-dispatcher.conf
> >
> > this whole section should check for systemd being in DISTRO_FEATURES
> >
>
> It doesn't seem necessary - if systemd is not in DISTRO_FEATURES the
> following error is raised:
>
> ERROR: Nothing RPROVIDES 'systemd' (but
> /<snip!>/meta-openembedded/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
> RDEPENDS on or otherwise requires it)
> systemd was skipped: missing required distro feature 'systemd' (not in
> DISTRO_FEATURES)
>

which is other concern, since we do support sysvinit, we need to have
both options functional if possible.

> For other issues: I'll fix them all in v2 and resend tomorrow.
>
> Thanks!
> Bart
>
> >> +}
> >> +
> >> +FILES_${PN} += "${systemd_unitdir}/system/networkd-dispatcher.service"
> >
> > use systemd_system_unitdir
> >
> >> --
> >> 2.18.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

