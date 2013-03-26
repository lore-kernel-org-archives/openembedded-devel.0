Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKNCx-0001zg-J9
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 07:18:12 +0100
Received: by mail-da0-f43.google.com with SMTP id u36so3530561dak.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2013 23:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=8YVjMN5r3FWWZur6UUAJhjHAF4k/jHd9kSX2hEYaU2w=;
	b=JlTU83PLr7HPMnsw2gtk4mf5sFbqqu00iRzWa4Wj/igm9PiRkSp56GyLAB7NVYr83V
	EnjfU0XoLv/BJADnxAXY71ZJVA5YyO/Hve1hahBB+sHm6rieioQfhefteTTnb6nZBdpx
	RdXWLIyXE0yxSUq90I6tVGrcg+CiC3wnnDIfiYsosdG23jH792DB/qWbH70O9Mdj0hwd
	5f78GjszeihLGwDaiZn47QPcc8JO+/j3aYsVLJFET/cfEPrmPGPuWMGSXhbEaA91PxkG
	y0MvF1yhgLmUwH/DS06+5RdVkHOB3NQJIzsvYyV4AojAaFG+pGWoNE+lxIPnvcCZ+Yuc
	jhXw==
X-Received: by 10.66.232.97 with SMTP id tn1mr17110440pac.121.1364277667666;
	Mon, 25 Mar 2013 23:01:07 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id hs8sm16198427pbc.27.2013.03.25.23.01.06
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 23:01:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1364203559-24240-1-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Mon, 25 Mar 2013 23:01:05 -0700
Message-Id: <6823A1D9-64DB-4A4A-93DA-82FD27A5A3DF@gmail.com>
References: <1364203559-24240-1-git-send-email-marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: [PATCH] powertop: add 2.3
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
X-List-Received-Date: Tue, 26 Mar 2013 06:18:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 25, 2013, at 2:25 AM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
> meta-oe/recipes-support/powertop/powertop_2.3.bb | 12 ++++++++++++
> 1 file changed, 12 insertions(+)
> create mode 100644 meta-oe/recipes-support/powertop/powertop_2.3.bb
>=20


oe-core has powertop recipe so post a patch to upgrade OE-Core version =
to oe-core ml


> diff --git a/meta-oe/recipes-support/powertop/powertop_2.3.bb =
b/meta-oe/recipes-support/powertop/powertop_2.3.bb
> new file mode 100644
> index 0000000..c289ac6
> --- /dev/null
> +++ b/meta-oe/recipes-support/powertop/powertop_2.3.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION =3D "Linux tool to diagnose issues with power consumption =
and power management."
> +HOMEPAGE =3D "http://01.org/powertop/"
> +DEPENDS =3D "ncurses virtual/gettext libnl pciutils"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e"
> +
> +SRC_URI =3D =
"http://01.org/powertop/sites/default/files/downloads/powertop-${PV}.tar.g=
z"
> +
> +SRC_URI[md5sum] =3D "dc03608f20e56cdc99d121a6191556f6"
> +SRC_URI[sha256sum] =3D =
"b8c1add69afee28c77dca56fdcedb4a46820f3a71c86aae7891b0c5c595cd744"
> +
> +inherit autotools
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



