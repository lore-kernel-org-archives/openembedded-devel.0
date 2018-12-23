Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 91CEA6C132
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:04:38 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id g125so6242874qke.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3J0iC0x9AbQimfuItrMh18XAx2jSfC1l6p819Q0/A88=;
	b=i7KUEM7LU4sClnDEAjaFKH5w5A2bh6fObFxd29UNtlCOFBCtb0cETZ/EuMVp9YkkDb
	EjdMimsCHPSqHufsGLO5+NBggd2CWgsd+Y/Uq+BfKf5wIArXFHYd6dzY4kmm0mDEMZ5P
	Sg5QKMsy9HjqckJmotfH5VPvE7t3BIi6YSDh+GKIcCkjJvjuMEIWRz0odASZeFavVXyy
	HqurDLir4YMIdz9lOojACEFgwQd4vpsrD52RYrQEKa6IAgRYT8CXp59hxRzbX03h0Jtg
	y7um04cScaKQi+JdvFncbe14zlb7VB3SQvhCXv95SS4qEiNo+qX03vMgKYbNae6VPNcS
	vYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3J0iC0x9AbQimfuItrMh18XAx2jSfC1l6p819Q0/A88=;
	b=BlmbUf70bnKm5vDmgYzpYQLbBQb++IH4eN7+/XF2etwH/U4ZewmppQwMPc02K/BM9w
	9faBrYmAUjImVCjq5/tPkadlMYqCRG79TBItY8kKHSN7D+6ao1ki/MVrlQjBOXjUQpT6
	K09Wd/vlgikSTlgdzyrtj/xYgmn8i3GjW6m4ZJ/0TsbIdfARACIOnwq9eQ5YztDROIlL
	Jep7KO5UFWzYiBwJ4sV8MLq6tvQTxhnCm+HFDbtbJ3NncZogyRyqPhyqGuUQTBt1qN/Y
	W3qrbLZrNr8m4ch5ywRN9WwjYkxrgI5w+e6V2+40NjJ4zPyI1U8/CpNz0FivXqKp3h+k
	/V5A==
X-Gm-Message-State: AJcUukdLyqFEgV4wtwiQHDT1p4YB9KMp8PCX796GBjwEc7UHolrNTEo2
	KtrQLC2X9Drd3wXKA6VTgR5cTKzn1sWbJsuqklk=
X-Google-Smtp-Source: ALg8bN7OWmF3SMGHfyRX9hbl0dxsyR95GTos34IjTdIMzIw1N+zxERDkpBbrkiL1xRg3vRsghELr78l29m/Rb03RpFY=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr9544975qka.206.1545599079331; 
	Sun, 23 Dec 2018 13:04:39 -0800 (PST)
MIME-Version: 1.0
References: <1545553483-17422-1-git-send-email-ankit.tarot@gmail.com>
In-Reply-To: <1545553483-17422-1-git-send-email-ankit.tarot@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Dec 2018 13:04:13 -0800
Message-ID: <CAMKF1sqo8kCOvSQMFvo_zHvmriS9HOJC3i20a=0_oFQoXxRNuQ@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
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
X-List-Received-Date: Sun, 23 Dec 2018 21:04:38 -0000
Content-Type: text/plain; charset="UTF-8"

Fails on mips

http://errors.yoctoproject.org/Errors/Details/213432/

musl
http://errors.yoctoproject.org/Errors/Details/213424/

On Sun, Dec 23, 2018 at 12:23 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Add generic recipe for wifi test suite from wifi alliance.
> Suite is to support certification program development and device certification.
>
> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  .../wifi-test-suite/wifi-test-suite_git.bb         | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
>
> diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
> new file mode 100644
> index 0000000..3890f2f
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
> @@ -0,0 +1,43 @@
> +SUMMARY  = "Wi-Fi Test Suite Linux Control Agent"
> +DESCRIPTION = "Wi-Fi Test Suite is a software platform originally developed \
> +by Wi-Fi Alliance, the global non-profit industry association that brings you \
> +Wi-Fi, to support certification program development and device certification."
> +HOMEPAGE = "https://www.wi-fi.org/certification/wi-fi-test-suite"
> +LICENSE  = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0542427ed5c315ca34aa09ae7a85ed32"
> +SECTION = "test"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "f7a8d7ef7d1a831c1bb47de21fa083536ea2f3a9"
> +SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git"
> +
> +
> +do_compile () {
> +       oe_runmake
> +}
> +
> +do_install () {
> +       install -d ${D}${libdir}
> +       install -m 0644 ${S}/lib/libwfa.a ${D}${libdir}
> +       install -m 0644 ${S}/lib/libwfa_ca.a ${D}${libdir}
> +       install -m 0644 ${S}/lib/libwfa_dut.a ${D}${libdir}
> +       install -d ${D}${sbindir}
> +       install -m 0755 ${S}/dut/wfa_dut ${D}${sbindir}
> +       install -m 0755 ${S}/ca/wfa_ca ${D}${sbindir}
> +       install -m 0755 ${S}/WTGService/WTG ${D}${sbindir}
> +       install -m 0755 ${S}/console_src/wfa_con ${D}${sbindir}
> +# Test scripts
> +       install -m 0644 ${S}/scripts/getipconfig.sh ${D}${sbindir} # Must copy
> +       install -m 0644 ${S}/scripts/arp_neigh_loop ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/dev_send_frame ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/findprocess.sh ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/getpid.sh ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/getpstats.sh ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/gpstats.sh ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/sta_reset_parm ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/stoping.sh ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/updatepid.sh ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/wfaping6.sh ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/wfaping.sh ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/wfa_test_cli.sh ${D}${sbindir}
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

