Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TXt1R-0003Mh-L5
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 13:21:49 +0100
Received: by mail-ie0-f175.google.com with SMTP id c13so8978572ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2012 04:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=LJ2VbuU6744iNdZkuHXkDf11ScCjob3EHhERA953z4M=;
	b=r+Law6DvCs/r/ohUe8hx+TqfNq+51B8ajRA0BZBuW4YWBHCXjWSTcL9O0K1l/Xskje
	qQCFrewDRB3KopvxllkPYRbUSxdpv8y37wts295p5XXnu2Cz1weEAjPBDsvozBM+K6Nn
	m90NNi4IVASTIvKS4YcurJS85ewfVt53LZN7OxZFzRlbUtS81k8KTczpUInbcSmVmTJr
	bKRXJ7uLWhrCGo9ZuXyeyV+KIdK6oj3xpEP/liDf3zBtwLVbKCkWzCTIqXr6qSTAtVWS
	WT0YEGadrbW80+nUes1QGYUB5SfYP2FRt7yoGOrg4UUT7xjt3mked3d+lloYg75RRWj1
	UMbw==
MIME-Version: 1.0
Received: by 10.50.169.100 with SMTP id ad4mr7666976igc.50.1352722075952; Mon,
	12 Nov 2012 04:07:55 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Mon, 12 Nov 2012 04:07:55 -0800 (PST)
In-Reply-To: <1352721267-367-6-git-send-email-schnitzeltony@googlemail.com>
References: <1352721267-367-1-git-send-email-schnitzeltony@googlemail.com>
	<1352721267-367-6-git-send-email-schnitzeltony@googlemail.com>
Date: Mon, 12 Nov 2012 13:07:55 +0100
Message-ID: <CALbNGRSRH+U+vqU4P_CX3oRvJPGWwH1eJQdeC2JrnV-pRhNxOw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome/meta-oe/meta-xfce 5/6] xarchiver: no RDEPENDS on unzip / busybox's unzip is good enough
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
X-List-Received-Date: Mon, 12 Nov 2012 12:21:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 12, 2012 at 12:54 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-apps/xarchiver/xarchiver_0.5.2.bb      |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-x=
fce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
> index f47a3bc..79af6a4 100644
> --- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "Lightweight, desktop independent GTK+ archive manager"
>  HOMEPAGE =3D "http://xarchiver.sourceforge.net"
>  SECTION =3D "x11"
> -PR =3D "r2"
> +PR =3D "r3"
>
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> @@ -14,4 +14,4 @@ SRC_URI[sha256sum] =3D "cea932ff9d505969201fd502470bbeb=
bc5726ab3d6765e142fc8295aa6
>
>  inherit gettext pkgconfig autotools gtk-icon-cache
>
> -RRECOMMENDS_${PN} =3D "lzop zip tar bzip2 unzip"
> +RRECOMMENDS_${PN} =3D "lzop zip tar bzip2"
> --
> 1.7.6.5
>
Damn - this one should not go in !!! Send V2..

Sorry

Andreas


