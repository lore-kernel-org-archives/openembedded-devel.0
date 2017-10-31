Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6A51877E88
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 11:24:35 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id 134so34231755ioo.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 04:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a1hVUHH0xQ+RpcIpkAOk5zqk19V+yAugCRfoAhTTSLQ=;
	b=crxY0TrvXCKZ+1PpnT9IZsCYko60sw7846OiP8ZB/gQh7nbxsC27gaNOXVxBnHLNd7
	4Xt1oZOM8cigdETqXLt9dk/WPG8wr4YTM6dJDmOA36wfjQHz5I/qAW2xAy0ohyO22y7y
	Qu1clcnTrwKlGqb/jIDlfgUPHoo5kEcH+VoGSP3K7Ur9xs41YzSzkgC0ZE7Pllp8UWfs
	mJSw367pIQxrQtYoTxvzQUtmxXCwY9tcYCSvrq17mBv/9T0IYuy5ZjeYSJvdyhfVc/ah
	/99m6/HQunRoDkRh9jI3xvfKVT+DLZwIcW+ES17j36iElUPWe6VZ60BfiiVUWixgXEUw
	Y1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a1hVUHH0xQ+RpcIpkAOk5zqk19V+yAugCRfoAhTTSLQ=;
	b=tMU3kvp8JN9uLBVxmR7EEm5m9x+lzVXtGLTKjKGfRH3L0qO3sTBMBUEjjBO1av/d5O
	m1WOaIxU6+QCkHZ15uL0eO1Dl8/fpxOgYGWuWYra8NLbCbUUgApnL3RnJAmRt794JyI1
	7MFpF33vWwUWccz39i9BLyDLeRKDZVkfAhMl6UwTBRx5dOrwKFx8IkC2Qtg2HMeCmH2D
	temkbz/LJzOCYLj1eUYwRidwglIC01Ao2MeFzOX3kk4rGCnhpK9Q1q2AQiNmbgckI4+8
	Rkr51XOU0hbftAGPNCrs/CN7bGe7QDaUvL4bDadpOlIoVwjuoxztDiqJnmX/EHygIevD
	kVjA==
X-Gm-Message-State: AMCzsaXYNO0dKZaMbJI66MtB6cWTuVsZY6Z4N6qBCahOYWxndj+PtwXu
	+i6LSFEV1FtoZMHF6Mn3UVR2HwpUdJGlZE45XuY6Pw==
X-Google-Smtp-Source: ABhQp+QCKoGcydKzCyO0do+moylHqVGo1IR7t+S5yQlQ3F7BoimH40Qg7DyedThvraWZ6buupkjbevFxxQcIw4PrGwI=
X-Received: by 10.107.14.15 with SMTP id 15mr1893093ioo.127.1509449076447;
	Tue, 31 Oct 2017 04:24:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.48.205 with HTTP; Tue, 31 Oct 2017 04:24:16 -0700 (PDT)
X-Originating-IP: [181.220.79.73]
In-Reply-To: <CAMKF1spzjAV6Qd6MDa7M5a=-rse+2nOZoHWoaAp=3ORhQHPrzA@mail.gmail.com>
References: <20171030173213.16752-1-fabio.berton@ossystems.com.br>
	<CAMKF1spzjAV6Qd6MDa7M5a=-rse+2nOZoHWoaAp=3ORhQHPrzA@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 31 Oct 2017 09:24:16 -0200
Message-ID: <CAAPZna2QXiR0NiTkpA-2of4jEa+P6OrQ06W6MzVsFgvv_3iyQA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] arptables: Fix do_install task
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
X-List-Received-Date: Tue, 31 Oct 2017 11:24:35 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

do_compile task uses these EXTRA_OEMAKE variables too.

On Mon, Oct 30, 2017 at 9:18 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Oct 30, 2017 at 10:32 AM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> > We need to set DESTDIR variable and run eo_runmake install to install all
>                                                                         ^^
> typo
>
> > arptables files. Without this the only file installed in package is
> > systemd unit.
> >
> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> > ---
> >  meta-networking/recipes-support/arptables/arptables_git.bb | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb
> b/meta-networking/recipes-support/arptables/arptables_git.bb
> > index 274a55d91..55903e450 100644
> > --- a/meta-networking/recipes-support/arptables/arptables_git.bb
> > +++ b/meta-networking/recipes-support/arptables/arptables_git.bb
> > @@ -21,9 +21,10 @@ SYSTEMD_SERVICE_${PN} = "arptables.service"
> >
> >  inherit systemd
> >
> > -EXTRA_OEMAKE = "'BINDIR=${sbindir}' 'MANDIR=${mandir}'"
> > +EXTRA_OEMAKE += "'DESTDIR=${D}' 'BINDIR=${sbindir}' 'MANDIR=${mandir}'"
> >
>
> if its needed just during install then we could pass it directly in
> oe_runmake in do_install below
>
> > -do_install_append() {
> > +do_install() {
> > +    oe_runmake install
> >      if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
> >          install -d ${D}${systemd_unitdir}/system
> >          install -m 644 ${WORKDIR}/arptables.service
> ${D}${systemd_unitdir}/system
> > --
> > 2.14.2
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

