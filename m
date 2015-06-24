Return-Path: <ashcharles@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 127696AC15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 23:55:01 +0000 (UTC)
Received: by igin14 with SMTP id n14so44822382igi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 16:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=BTkY6ydQv+SnEqzhO3dtdWpTDn1VfF/xj96yElmE3zM=;
	b=mP57+Nu78V35jPq+wA/AfsL9QcRHZtaAhZDrZUcUJ0Bp5jH8nr/c6hxG17wbi/xNNG
	orhnpVH0uqL8QIvXngtUMOkjynBz14v1MVPzhi/A/ZnC/b1Tdq1OL2sumJF9Y8/lGuY5
	y80nUDPvF8btsNVzmk+b/C0uD9vHAep5DngQ5EB6HMtaPc/AWku/v2reVw1zpVTRkYxw
	vDKIq+SgSQf/0vAXA/AZ5Pky1a5eZa+oE+Pm+5tzcHLb5yQBxinbDO1K8V+veD8SEHsv
	iJwPcyd5XYy624jUojyPSpu9IVg6ddGCRg9t/2Fo9YBwYGkk1/SO9EjYg14g90HUjUvs
	EaCQ==
X-Received: by 10.107.128.227 with SMTP id k96mr8021701ioi.7.1435190102933;
	Wed, 24 Jun 2015 16:55:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.78 with HTTP; Wed, 24 Jun 2015 16:54:33 -0700 (PDT)
In-Reply-To: <1434982373-23401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1434982373-23401-1-git-send-email-schnitzeltony@googlemail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Wed, 24 Jun 2015 16:54:33 -0700
Message-ID: <CAK8F28mMAiCFLv3S_WNF-osWSX98kEw=YaB6aeisbnnPXQNx5Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-session: ensure ip for machine is found by adding to hosts
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
X-List-Received-Date: Wed, 24 Jun 2015 23:55:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2015 at 7:12 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> This fixes very ugly behaviour: Starting applications e.g xfce4-terminal
> can delay for minutes in case network is connected.
>
> There was a similar approach implemented for xfce4-session but this was r=
emoved
> in
>
> commit f54d3a506fef603d8d0c538d1d69a6597152c169
> Author: Ash Charles <ashcharles@gmail.com>
> Date:   Mon Feb 23 08:40:53 2015 -0800
>
>     xfce4-session: Remove unneeded pkg_postinst
>
>     The pkg_postinst inherited from previous versions of this recipe no
>     longer seems necessary; no error message seen at runtime in a quick
>     test.  As it made the generated packages unnecessarily
>     machine-specific, remove this post-install step. Based on the ensurin=
g
>     discussion, this supersedes the original patch [1].
>
>     [1] http://lists.openembedded.org/pipermail/openembedded-devel/2015-F=
ebruary/100454.html
>
>     Signed-off-by: Ash Charles <ashcharles@gmail.com>
>     Tested-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> Unfortuantely my tests for that patch only checked for the messagebox:
>
> | Could not look up internet address for <hostname>
> | This will prevent Xfce from operating correctly.
> | It may be possible to correct the problem by adding
> | <hostname> to the file /etc/hosts on your system.
>
> For unknown reasons this messagebox is not created but the hint is still
> extremely valid.
>
> To avoid making 'xfce4-session' machine specific an extra meta-recipe
> 'machine-host' was created on which 'xfce4-session' rdepends.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-xfce/recipes-xfce/xfce4-session/machine-host.bb    | 17 +++++++++++=
++++++
>  .../recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb  |  2 ++
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-session/machine-host.bb
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb b/meta-=
xfce/recipes-xfce/xfce4-session/machine-host.bb
> new file mode 100644
> index 0000000..03bd205
> --- /dev/null
> +++ b/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Meta package adding machine name to known hosts"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937=
c2bc47fbc49d690"
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> +
> +LOCALHOSTMACHINE =3D "127.0.0.1    ${MACHINE}"
> +
> +# on some machines starting applications as xfce4-terminal take ages wit=
hout
> +# machine name in hosts
> +pkg_postinst_${PN} () {
> +if ! grep -q '${LOCALHOSTMACHINE}' $D/etc/hosts ; then
> +    echo '${LOCALHOSTMACHINE}' >> $D/etc/hosts
> +fi
> +}
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb=
 b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
> index 81c56cc..215aec3 100644
> --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
> @@ -26,3 +26,5 @@ FILES_${PN} +=3D " \
>  "
>
>  FILES_${PN}-dbg +=3D "${libdir}/xfce4/*/*/.debug"
> +
> +RDEPENDS_${PN} +=3D "machine-host"
> --
> 1.9.3
>
Thanks Andreas.  I gave this a try and the patch work for me.  That
said, I don't see a long hang in any case---likely because
systemd-hostnamed is taking care of providing this resolution.  In any
case:
Acked-by: Ash Charles <ashcharles@gmail.com>

