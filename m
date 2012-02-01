Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rsje4-0002qI-5E
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 00:31:20 +0100
Received: by lahc1 with SMTP id c1so962228lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 15:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=dkx5xOsQhhYTwXEVvu4vVA0M38SG90gE4ZANM3sRfYk=;
	b=lcvBohM1nwQRYdU8ZYxP3vusVBF0DGZKzwiILb9YH3RyTO+OMU9zsbX6LQUMMUoWum
	g7PLxYzMx+BANR7KpLXinsPHhgOPMXSqiZRX0mzkCVEtG4HMV97yQmovUBy7xeXY05rR
	Q1iFUZ737ascXD9q4EFUdlSMxZGAOgaVFX2gA=
MIME-Version: 1.0
Received: by 10.112.84.170 with SMTP id a10mr158285lbz.22.1328138604224; Wed,
	01 Feb 2012 15:23:24 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Wed, 1 Feb 2012 15:23:24 -0800 (PST)
In-Reply-To: <1328132208-15877-1-git-send-email-tworaz666@gmail.com>
References: <1328132208-15877-1-git-send-email-tworaz666@gmail.com>
Date: Thu, 2 Feb 2012 00:23:24 +0100
Message-ID: <CALbNGRSUR4_Ahs-5mUGzfRLL+VbVB-YvZMnBd0YBcnFh=t8=5A@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH v3] xarchiver: Add version 0.5.2.
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
X-List-Received-Date: Wed, 01 Feb 2012 23:31:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 1, 2012 at 10:36 PM, Peter Tworek <tworaz666@gmail.com> wrote:
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> =A0.../recipes-apps/xarchiver/xarchiver_0.5.2.bb =A0 =A0 =A0| =A0 16 ++++=
++++++++++++
> =A01 files changed, 16 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
>
> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-x=
fce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
> new file mode 100644
> index 0000000..5c6b7f5
> --- /dev/null
> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "Lightweight, desktop independent GTK+ archive manager"
> +HOMEPAGE =3D "http://xarchiver.sourceforge.net"
> +SECTION =3D "x11"
> +
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +DEPENDS =3D "gtk+ glib-2.0 xfce4-dev-tools-native"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2"
> +SRC_URI[md5sum] =3D "2bc7f06403cc6582dd4a8029ec9d038d"
> +SRC_URI[sha256sum] =3D "cea932ff9d505969201fd502470bbebbc5726ab3d6765e14=
2fc8295aa677ad2a"
> +
> +inherit gettext pkgconfig autotools gtk-icon-cache
> +
> +RRECOMMENDS_${PN} =3D "lzop zip tar"
> --
> 1.7.3.4
Thanks!

Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>


