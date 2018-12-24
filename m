Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id B8A0960778
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2018 17:01:28 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id n2so5769086pgm.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2018 09:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DiOxDTUiP6QxuFA6IpI7i7nIcmk/kqlHniZQtR47/wI=;
	b=ST3uC13WYbu0254U0cJS41NdWSN5bgHvsG9qdEzUDON+8tEMBE6LdwpHII75enKDk/
	yiBgJzEGDRv+3N1GI4+qhbpO39oYOkQi/u9dKPa9VVGOC4mO9udrtXCc9uxAyQG5Rzt+
	JYMZNMfunFitwvk5jJau/GpFR774zkjIzlBY3WD3A07eiWfdBchm43mRYNHhBSvRZNzk
	qHZa06MFT4oQLSIusXuSTvN3biPQg34SbaqdxCBZ3xuK+23Uyd0JA2h45y6kdZfXu4Zn
	OOvU3jIcIvfGlAt9mTovVnfP+v+hv3hncDCzltd8E3+ulpE+xRxjSvpC3cMHNyQGFeDD
	Rj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DiOxDTUiP6QxuFA6IpI7i7nIcmk/kqlHniZQtR47/wI=;
	b=Eb2kn2D4nXWyCa+o6TmUCgD4kdWJxttjk/a7vbujd+4SRf8lWNbfokU4wM7zF8swuO
	RAiwQKwwxDbqod+XgO85x8Tk3tvGMvROje1CpXX7AJ31FYN37BZTKYxhqL3gARcD4WMH
	U+FcMVZphLLs/khMvdQ/8erGkTjEd1IOTljSxiSMEdWoa+ejJwTSUS5DFLmeukvAsz1o
	tS6e2XnMvcsZHWRMxcBudemP43QU2PtB9ESKyvbA+WOFovFY56fGp/M/HGyKn13el+md
	fxlrJaxNLMNwHuddLloRGqwu8UZsY0uabFmhQd+9eNfohk/8Rvd/K2LaXnNjYPUAHyhE
	yzmQ==
X-Gm-Message-State: AJcUukcSlhKqsd7TEEiRPDmMxQK5tCGh5tgk/0rgxJ2KCoY/tWhqs66J
	P5INNqwX8VlIKNrI9DyMkrn0pBsa5PwAoTauBjLQKgTE
X-Google-Smtp-Source: ALg8bN4RgEQz+Jswfjod/4Wb0c4Su/HJjF75lKgTfLOkjIUsX/mkkEpRKBuCnhnV8MlpIQ8qVYulBfi7JpSWI4lRgQU=
X-Received: by 2002:a63:c503:: with SMTP id f3mr12572036pgd.431.1545670889672; 
	Mon, 24 Dec 2018 09:01:29 -0800 (PST)
MIME-Version: 1.0
References: <1545553483-17422-1-git-send-email-ankit.tarot@gmail.com>
	<2ae1112d-2917-dca0-4656-aa692dce6e27@reto-schneider.ch>
In-Reply-To: <2ae1112d-2917-dca0-4656-aa692dce6e27@reto-schneider.ch>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Mon, 24 Dec 2018 22:31:18 +0530
Message-ID: <CAM_RqkNmUh=9cf7WYPFZ1n0kOkLqpgXOfUeAK0haQ9WzsVBEbA@mail.gmail.com>
To: Reto Schneider <code@reto-schneider.ch>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] wifi-test-suite: Initial recipe for wifi test suite.
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
X-List-Received-Date: Mon, 24 Dec 2018 17:01:28 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Schneider,
Thank you for your valuable feedback.

On Sun, Dec 23, 2018 at 9:52 PM Reto Schneider <code@reto-schneider.ch>
wrote:

> On 12/23/18 9:24 AM, Ankit Navik wrote:
> > Add generic recipe for wifi test suite from wifi alliance.
> > Suite is to support certification program development and device
> certification.
>
> I did pretty much the same a few weeks ago [1] for a MIPS/musl based IoT
> gateway [2] (DUT).
>
> What I learned:
>  - You will need some patches for the makefiles [3]
>

You patch got failed when I tried to compile using
bitbake wifi-test-suite -c compile -f
CC ?= gcc --> I think, this is not required.
It is better to use as implicit variable itself.

 - When using musl, you will need something like this (parts of it) [4] too
>  - If you are using the Busybox utils, those scripts will not work an
> need to be adapted. Our Testhouse did do this for us, so I do not know
> exactly what changes where needed.
>
> Let me check this and other comments as well.

Regards, Ankit


> > +do_compile () {
> > +     oe_runmake
> > +}
>
> Pretty sure this is not needed. My recipe at least does have this.
>
> > +do_install () {
> > +     install -d ${D}${libdir}
> > +     install -m 0644 ${S}/lib/libwfa.a ${D}${libdir}
> > +     install -m 0644 ${S}/lib/libwfa_ca.a ${D}${libdir}
> > +     install -m 0644 ${S}/lib/libwfa_dut.a ${D}${libdir}
>
> I do not think that you need the static libraries.
>
> > +     install -d ${D}${sbindir}
> > +     install -m 0755 ${S}/dut/wfa_dut ${D}${sbindir}
> > +     install -m 0755 ${S}/ca/wfa_ca ${D}${sbindir}
> > +     install -m 0755 ${S}/WTGService/WTG ${D}${sbindir}
> > +     install -m 0755 ${S}/console_src/wfa_con ${D}${sbindir}
> > +# Test scripts
> > +     install -m 0644 ${S}/scripts/getipconfig.sh ${D}${sbindir} # Must
> copy
>
> They have hard coded the path to this script [5][6]. You will need to
> fix the installation location or their C code.
>
> > +     install -m 0644 ${S}/scripts/arp_neigh_loop ${D}${sbindir}
> > +     install -m 0644 ${S}/scripts/dev_send_frame ${D}${sbindir}
> > +     install -m 0644 ${S}/scripts/findprocess.sh ${D}${sbindir}
> > +     install -m 0644 ${S}/scripts/getpid.sh ${D}${sbindir}
> > +     install -m 0644 ${S}/scripts/getpstats.sh ${D}${sbindir}
> > +     install -m 0644 ${S}/scripts/gpstats.sh ${D}${sbindir}
> > +     install -m 0644 ${S}/scripts/sta_reset_parm ${D}${sbindir}
> > +     install -m 0644 ${S}/scripts/stoping.sh ${D}${sbindir}
> > +     install -m 0644 ${S}/scripts/updatepid.sh ${D}${sbindir}
> > +     install -m 0644 ${S}/scripts/wfaping6.sh ${D}${sbindir}
> > +     install -m 0644 ${S}/scripts/wfaping.sh ${D}${sbindir}
> > +     install -m 0644 ${S}/scripts/wfa_test_cli.sh ${D}${sbindir}
> > +}
>
> How about "install -m 0755 -D ${S}/scripts/*.sh ${D}${bindir}" for the
> scripts?
>
> [1]
>
> https://github.com/husqvarnagroup/smart-garden-gateway-yocto-meta-gardena/blob/master/recipes-wifi-alliance/wifi-testsuite/wifi-testsuite_git.bb
> [2] https://github.com/husqvarnagroup/smart-garden-gateway-public
> [3] https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/pull/42
> [4]
>
> https://github.com/husqvarnagroup/smart-garden-gateway-wifi-alliance-test-suite/compare/eb2799fbc28a2e5b309e2e85d0fa0b8e9cd0d100...master
> [5]
>
> https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/blob/master/lib/wfa_cs.c#L322
> [6]
>
> https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/blob/master/lib/wfa_cs.c#L2118
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

