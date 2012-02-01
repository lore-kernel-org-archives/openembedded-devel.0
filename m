Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RsWC5-0007wd-KO
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 10:09:34 +0100
Received: by lahc1 with SMTP id c1so527396lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 01:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=fo3GwO1qtAHbuG2GOADp9nlgvSLoH0iIStpqeQBs2Vc=;
	b=x2s6mUibaYbP70p9s3dL3obHjHjeg07AfUs7ZYpwpK03koN1JxnrYFNcVT6n0eE2K5
	aATETI5rxp7o0DP81yu33TOISWHe6087dVQGwOY5byNtgNzEjfmENKOWWOmQdiZ6J7v8
	zYy1Nw5qzCzsPcrg7Y1D310JA8SG4YroTHTlY=
MIME-Version: 1.0
Received: by 10.112.84.170 with SMTP id a10mr6573132lbz.22.1328086898532; Wed,
	01 Feb 2012 01:01:38 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Wed, 1 Feb 2012 01:01:38 -0800 (PST)
In-Reply-To: <1328039657-3070-1-git-send-email-tworaz666@gmail.com>
References: <1328039657-3070-1-git-send-email-tworaz666@gmail.com>
Date: Wed, 1 Feb 2012 10:01:38 +0100
Message-ID: <CALbNGRSYuzCD9hCNG4n++ncEq2PHVQoA0KdCTh18m-mVLfsG8w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH v2] Add recipe for xarchiver 0.5.2.
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
X-List-Received-Date: Wed, 01 Feb 2012 09:09:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 8:54 PM, Peter Tworek <tworaz666@gmail.com> wrote:
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> ---
> =A0.../recipes-apps/xarchiver/xarchiver_0.5.2.bb =A0 =A0 =A0| =A0 16 ++++=
++++++++++++
> =A01 files changed, 16 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
>
> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-x=
fce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
> new file mode 100644
> index 0000000..66e9273
> --- /dev/null
> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "Lightweight, desktop independent GTK+ archive manager"
> +HOMEPAGE =3D "http://xarchiver.sourceforge.net"
> +SECTION =3D "x11"
> +
> +LICENSE =3D "GPLv2"
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
>
Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>


