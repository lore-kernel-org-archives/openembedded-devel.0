Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id BB05C608BE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 13:39:22 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so6717226lab.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5G27SiB8WZuu8dqx+lAKWc8OrrX9mG2Ah68YeG1z9d0=;
	b=gFDxSC1EEhAvefsYf2Ike1JG/4RXCuG7GeH7/8L1kjzmsAs7bf6BIztH58wVOMKI+y
	CkmmwjKg9BXpBiq59hhacun4aPtrFx6gx9Y08C2SKgF1GZGi3K3BpZCcc70i6JTAHnPH
	g2D4EfrI6QAeCAGEI+cVMJDV2ygMvrpkJoLbvSiWGbiyQi/bBYz5oLtceEwrXYEQcAhj
	QQnt3fK7YCMpDVsdds6tReoYjrP54JhnFzq/4rDT6iwEbcb2yUdPddqUbfHkviAZaRdk
	WoR0ES4mMNKgwjMrni2m+FXdEz2JVlQ/9uMZczDpRzxs+zFuQkN/b30Cp8aYqaulozxP
	1lOw==
MIME-Version: 1.0
X-Received: by 10.112.29.147 with SMTP id k19mr2577395lbh.9.1381239564057;
	Tue, 08 Oct 2013 06:39:24 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Tue, 8 Oct 2013 06:39:24 -0700 (PDT)
In-Reply-To: <1381239308-8682-1-git-send-email-joe@deserted.net>
References: <1381239308-8682-1-git-send-email-joe@deserted.net>
Date: Tue, 8 Oct 2013 09:39:24 -0400
Message-ID: <CADkTA4Nt_awdw7L0-2Mx-k9QUsrp6WAe2cNiTM7rZanKmps+dw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] openflow: import and tweak
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Oct 2013 13:39:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2013 at 9:35 AM, Joe MacDonald <joe@deserted.net> wrote:
> Based on work by David Nystr=F6m (meta-virtualization) and Laszlo Papp
> (meta-oe).
>
>    - Import OpenFlow 1.0 from meta-virtualization and provide an updated
>      version of the recipe for the head of tree in the OpenFlow git
>      repository.
>
>    - Minor tweak in both recipes for do_install_append() spacing.
>
>    - Update 'libssl' PACKAGECONFIG flag in both to follow the 'openssl'
>      convention used elsewhere in meta-oe.
>
>    - Create common include file for both versioned and git recipes

Replying again to the list, since I replied from my non-subscribed account
a few minutes ago ....

Awesome. I was just wondering about this a few days ago. I'll push a
removal of the meta-virt recipe, once this has merged to meta-networking.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>


>
> Signed-off-by: Joe MacDonald <joe@deserted.net>
> ---
>  .../recipes-protocols/openflow/openflow.inc        |   35 ++++++++++++++=
++++++
>  .../recipes-protocols/openflow/openflow_1.0.bb     |    4 +++
>  .../recipes-protocols/openflow/openflow_git.bb     |    4 +++
>  3 files changed, 43 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/openflow/openflow.i=
nc
>  create mode 100644 meta-networking/recipes-protocols/openflow/openflow_1=
.0.bb
>  create mode 100644 meta-networking/recipes-protocols/openflow/openflow_g=
it.bb
>
> diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/me=
ta-networking/recipes-protocols/openflow/openflow.inc
> new file mode 100644
> index 0000000..43af54e
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/openflow/openflow.inc
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "OpenFlow communications protocol"
> +DESCRIPTION =3D "\
> +Open standard that enables researchers to run experimental protocols in =
\
> +contained networks.  OpenFlow is a communications interface between \
> +control and forwarding planes of a software-defined networking architect=
ure.\
> +"
> +HOMEPAGE =3D "http://www.openflow.org"
> +
> +SECTION =3D "networking"
> +LICENSE =3D "GPLv2"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De870c934e2c3d6ccf085fd7cf0a1e=
2e2"
> +
> +SRC_URI =3D "git://gitosis.stanford.edu/openflow.git;protocol=3Dgit"
> +
> +DEPENDS =3D "virtual/libc"
> +
> +EXTRA_OECONF +=3D "KARCH=3D${TARGET_ARCH}"
> +
> +PACKAGECONFIG ??=3D "openssl"
> +PACKAGECONFIG[openssl] =3D "--enable-ssl,--disable-ssl, openssl, libssl"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +do_configure() {
> +    ./boot.sh
> +    oe_runconf
> +}
> +
> +do_install_append() {
> +    # Remove /var/run as it is created on startup
> +    rm -rf ${D}${localstatedir}/run
> +}
> diff --git a/meta-networking/recipes-protocols/openflow/openflow_1.0.bb b=
/meta-networking/recipes-protocols/openflow/openflow_1.0.bb
> new file mode 100644
> index 0000000..a7e254d
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/openflow/openflow_1.0.bb
> @@ -0,0 +1,4 @@
> +include ${BPN}.inc
> +
> +SRCREV =3D "5ccca75a69f99791659bcfbcf35353ab1921320a"
> +PV =3D "1.0"
> diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b=
/meta-networking/recipes-protocols/openflow/openflow_git.bb
> new file mode 100644
> index 0000000..6403bfb
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
> @@ -0,0 +1,4 @@
> +include ${BPN}.inc
> +
> +SRCREV =3D "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
> +PV =3D "1.0+git${SRCPV}"
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

