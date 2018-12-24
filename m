Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id C476F60778
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2018 16:59:43 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id u18so5756981plq.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2018 08:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=G0EdWyNKToEsB81r3HdN7NkLYYLLJJHYJFUHO/BJ5Vk=;
	b=tYMX306zYv5XodNGc0Lun8Vn9OLesX1jwepNX1Sab57ppqI2j5O6NSzReaTPLsGuo6
	eG/H6wl86h6+W/Cf37MCn+MxOxSKZvDyyKxUbWLLht8je2ypjztxctSxxZ09Y8qDZMrX
	jIPk1fncZ5r+GSps+zSbZoxr7kw6Ij+0Rp+ymYnQxUPwCh/RJeoy1TnuPLdGOPFe84Hc
	lzlQ9TZTK5jM1qHZeXND41G2vvAyM1mZjcbWzKuknwCjIdtswQpIiuQEgLhYTR3VPlti
	peS8qI4HtGYxbGWlhz/QUyYu6I9tDBJhYXCnNIM6HU/iGXLFRR0ec5oqMBJC/6wdF0FE
	+23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G0EdWyNKToEsB81r3HdN7NkLYYLLJJHYJFUHO/BJ5Vk=;
	b=goQT6bDgORcyyrEi1F1uwOUJrPSrie/uGjHNGIqCTlAuVrAQxqFd/AxX9ciJ6yfS/x
	JkyX0Io/Zf0jaawq7EOCjF9u9RqWXhLhgL/wFJczkg3+qx/ccIxJu2PIbPJ7B/HAuTAE
	8TKAQEfRUx9gzyMfWRHCSbIiMymPFfQg6u6PyKLvQpMgMzQ77BmfQPtvUPf5lWf8vCwB
	d4oT0j27NSBdnR+Q26RQX7uXextMmNeoBm4NjoJf/Phf2Y9bqUb2RS5uHADcqs46Mi2y
	J6eH8WhDUBE53KIOnpE4KmFbcio2kng9AetaJKSpyxiJrHkeSq0ghHBcSU7whdbrdHnd
	7pEQ==
X-Gm-Message-State: AJcUukeN6XrXknLKsf0wfdw9RK1ANSvlfl89Gv/DYvLbgxKfTZGYRNFp
	bBc0r08bEFFEhr1bHxzn0WLegJE92RFIsgZxS8M=
X-Google-Smtp-Source: ALg8bN5qjWkObdNa7BwIxcKFdUDLwcOswmtMhmSLa7xvnJ/Li3QRosnxXctSeV16T/RGvebL1ZGl/zxRG14O6WYlLBQ=
X-Received: by 2002:a17:902:b112:: with SMTP id
	q18mr13678308plr.255.1545670784622; 
	Mon, 24 Dec 2018 08:59:44 -0800 (PST)
MIME-Version: 1.0
References: <1545553483-17422-1-git-send-email-ankit.tarot@gmail.com>
	<CAMKF1sqo8kCOvSQMFvo_zHvmriS9HOJC3i20a=0_oFQoXxRNuQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqo8kCOvSQMFvo_zHvmriS9HOJC3i20a=0_oFQoXxRNuQ@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Mon, 24 Dec 2018 22:29:33 +0530
Message-ID: <CAM_RqkNE5L7HckOym-qgpbPEraupK_s0NyDtmJvwJ1efTFMm0g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 24 Dec 2018 16:59:44 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raj,

On Mon, Dec 24, 2018 at 2:34 AM Khem Raj <raj.khem@gmail.com> wrote:

> Fails on mips
>
> http://errors.yoctoproject.org/Errors/Details/213432/
>
> musl
> http://errors.yoctoproject.org/Errors/Details/213424/


Let me fix it in v2 patch.
Regards,
Ankit

>
>
> On Sun, Dec 23, 2018 at 12:23 AM Ankit Navik <ankit.tarot@gmail.com>
> wrote:
> >
> > Add generic recipe for wifi test suite from wifi alliance.
> > Suite is to support certification program development and device
> certification.
> >
> > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > ---
> >  .../wifi-test-suite/wifi-test-suite_git.bb         | 43
> ++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/
> wifi-test-suite_git.bb
> >
> > diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/
> wifi-test-suite_git.bb b/meta-oe/recipes-connectivity/wifi-test-suite/
> wifi-test-suite_git.bb
> > new file mode 100644
> > index 0000000..3890f2f
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/wifi-test-suite/
> wifi-test-suite_git.bb
> > @@ -0,0 +1,43 @@
> > +SUMMARY  = "Wi-Fi Test Suite Linux Control Agent"
> > +DESCRIPTION = "Wi-Fi Test Suite is a software platform originally
> developed \
> > +by Wi-Fi Alliance, the global non-profit industry association that
> brings you \
> > +Wi-Fi, to support certification program development and device
> certification."
> > +HOMEPAGE = "https://www.wi-fi.org/certification/wi-fi-test-suite"
> > +LICENSE  = "ISC"
> > +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=0542427ed5c315ca34aa09ae7a85ed32"
> > +SECTION = "test"
> > +
> > +S = "${WORKDIR}/git"
> > +SRCREV = "f7a8d7ef7d1a831c1bb47de21fa083536ea2f3a9"
> > +SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git
> "
> > +
> > +
> > +do_compile () {
> > +       oe_runmake
> > +}
> > +
> > +do_install () {
> > +       install -d ${D}${libdir}
> > +       install -m 0644 ${S}/lib/libwfa.a ${D}${libdir}
> > +       install -m 0644 ${S}/lib/libwfa_ca.a ${D}${libdir}
> > +       install -m 0644 ${S}/lib/libwfa_dut.a ${D}${libdir}
> > +       install -d ${D}${sbindir}
> > +       install -m 0755 ${S}/dut/wfa_dut ${D}${sbindir}
> > +       install -m 0755 ${S}/ca/wfa_ca ${D}${sbindir}
> > +       install -m 0755 ${S}/WTGService/WTG ${D}${sbindir}
> > +       install -m 0755 ${S}/console_src/wfa_con ${D}${sbindir}
> > +# Test scripts
> > +       install -m 0644 ${S}/scripts/getipconfig.sh ${D}${sbindir} #
> Must copy
> > +       install -m 0644 ${S}/scripts/arp_neigh_loop ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/dev_send_frame ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/findprocess.sh ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/getpid.sh ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/getpstats.sh ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/gpstats.sh ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/sta_reset_parm ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/stoping.sh ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/updatepid.sh ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/wfaping6.sh ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/wfaping.sh ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/wfa_test_cli.sh ${D}${sbindir}
> > +}
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

