Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKuei-0000I8-NN
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Mar 2013 19:01:02 +0100
Received: by mail-pb0-f47.google.com with SMTP id rp2so5373757pbb.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2013 10:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=onbjb5T7qMeSzkbZPNO51B2QdQeUeKnXGHgqZ112jks=;
	b=k49CjVDP7sjd09jGBAduwuOnIAn5/AJFi+dDxMSqzR7Mrm9hyuiEs6Xfx9si8cACER
	9eu4LP2LcajQWaeb99ED8pSG7YlRHtmXJqjPbAAYYd/dccYS2TTofJHFwdPsq3B/xu29
	NWXPlcjZrJawUi+JWnkF7NR0ffAhpQJnMxzl22bWgyLy75OzpyOa1a1gmHl8lshUTQsX
	2pUYY1kJLdFSqIQs9l/W3xwB6nGn/LVgKo1ddbgKN5G+7vbkIdOHSbVsVV9XtImHqfy6
	YzJ1D3mkAO1yHVU6Hr991DW0bF+jVgEY3Ou684NqcuFReoaRVrKmdDOJ/RbcpTf1XNL4
	MtFA==
X-Received: by 10.68.57.139 with SMTP id i11mr14798312pbq.185.1364406238694;
	Wed, 27 Mar 2013 10:43:58 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id ux10sm3586735pab.1.2013.03.27.10.43.56
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 10:43:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1364378833-16237-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 27 Mar 2013 10:43:57 -0700
Message-Id: <EA95FDCC-620F-4ABD-85B1-221410785370@gmail.com>
References: <1364378833-16237-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] multipath-tools: add recipe for git version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2013 18:01:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Koen

On Mar 27, 2013, at 3:07 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:

> Multipath-tools hasn't seen a release in 3 years, so grab latest git.
>=20
> 'kpartx' is subpackaged since that's the tool most people want.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> .../multipath-tools/multipath-tools_git.bb         | 34 =
++++++++++++++++++++++
> 1 file changed, 34 insertions(+)
> create mode 100644 =
recipes-support/multipath-tools/multipath-tools_git.bb
>=20
> diff --git a/recipes-support/multipath-tools/multipath-tools_git.bb =
b/recipes-support/multipath-tools/multipath-tools_git.bb
> new file mode 100644
> index 0000000..1b83f49
> --- /dev/null
> +++ b/recipes-support/multipath-tools/multipath-tools_git.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION =3D "The upstream project used to drive the Device Mapper =
multipathing driver."
> +
> +DEPENDS =3D "lvm2 libaio"

as I read it also depends on libreadline

> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D7be2873b6270e45abacc503abbe2aa3d"
> +
> +
> +SRC_URI =3D =
"git://git.opensvc.com/multipath-tools/.git;protocol=3Dhttp"
> +SRCREV =3D "15fc23ffb2bd1bac6990eda3e23c3e8980e6cfa5"
> +
> +S =3D "${WORKDIR}/git"
> +
> +PV =3D "0.4.9+git"
> +

Is current release 0.4.9 ? I wonder if it will this be ok for upgrade =
path when a release happens=20

> +EXTRA_OEMAKE =3D "MULTIPATH_VERSION=3D${PV} DESTDIR=3D${D} =
syslibdir=3D${base_libdir} libdir=3D${base_libdir}/multipath"
> +
> +do_compile() {
> +	oe_runmake
> +}
> +
> +do_install() {
> +	oe_runmake install
> +}
> +
> +FILES_${PN}-dbg +=3D "${base_libdir}/multipath/.debug"
> +FILES_${PN} +=3D "${base_libdir}/multipath \
> +                ${base_libdir}/systemd"
> +
> +PACKAGES =3D+ "kpartx"
> +FILES_kpartx =3D "${base_sbindir}/kpartx \
> +                ${base_libdir}/udev/kpartx_id"
> +
> +RDEPENDS_${PN} +=3D "kpartx"
> --=20
> 1.8.1.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



