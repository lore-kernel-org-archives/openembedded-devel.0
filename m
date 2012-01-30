Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rs0m3-0002pI-OP
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 00:36:35 +0100
Received: by mail-lpp01m010-f47.google.com with SMTP id c1so2470074lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 15:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Q9FxaSt0MQ7/NvXKnhRVCFSpIUXv7d515OLeV6J1OG4=;
	b=KL4oPscQJ3LhrxzWWpNaeCItxmnubVG+B6niq+fzO9bq2pI/tcGrbMe1arYz2zIB3y
	YyuDlpF3pM4MVDAAKXtjol77N84+OwqRy53xfUNbgM17MwLc/8SVl1PLTebzHQNkNWTr
	wokdGAq+sIgPVgAoiCOHkUH6F+zg2W9Cf8naI=
Received: by 10.112.101.34 with SMTP id fd2mr4991732lbb.16.1327966124305; Mon,
	30 Jan 2012 15:28:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 30 Jan 2012 15:28:14 -0800 (PST)
In-Reply-To: <1327959667-24833-1-git-send-email-tworaz666@gmail.com>
References: <1327959667-24833-1-git-send-email-tworaz666@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jan 2012 15:28:14 -0800
Message-ID: <CAMKF1sq3xhoQ6pxiffAr2Wf=T10xXoOHGc-7YpdouL0fuY5umg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] obexd: update to 0.44 and put obex-client into separate package.
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
X-List-Received-Date: Mon, 30 Jan 2012 23:36:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

thanks for doing it.

On Mon, Jan 30, 2012 at 1:41 PM, Peter Tworek <tworaz666@gmail.com> wrote:
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> ---
> =C2=A0meta-oe/recipes-connectivity/obex/obexd_0.41.bb | =C2=A0 14 -------=
-------
> =C2=A0meta-oe/recipes-connectivity/obex/obexd_0.44.bb | =C2=A0 17 +++++++=
++++++++++
> =C2=A02 files changed, 17 insertions(+), 14 deletions(-)
> =C2=A0delete mode 100644 meta-oe/recipes-connectivity/obex/obexd_0.41.bb
> =C2=A0create mode 100644 meta-oe/recipes-connectivity/obex/obexd_0.44.bb
>
> diff --git a/meta-oe/recipes-connectivity/obex/obexd_0.41.bb b/meta-oe/re=
cipes-connectivity/obex/obexd_0.41.bb
> deleted file mode 100644
> index eed01f4..0000000
> --- a/meta-oe/recipes-connectivity/obex/obexd_0.41.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DESCRIPTION =3D "OBEX Server and Client"
> -DEPENDS =3D "openobex glib-2.0 dbus bluez4 libical"
> -
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "files://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4=
ca7e"
> -
> -SRC_URI =3D "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.g=
z"
> -SRC_URI[md5sum] =3D "073a10634d19ecebeea93db815857054"
> -SRC_URI[sha256sum] =3D "edfa54f7a08d00f81ababe4267d15ec138e9c80dd76d0493=
dcff451374dac7be"
> -
> -inherit autotools
> -
> -FILES_${PN} +=3D "${datadir}/dbus-1/"
> -
> diff --git a/meta-oe/recipes-connectivity/obex/obexd_0.44.bb b/meta-oe/re=
cipes-connectivity/obex/obexd_0.44.bb
> new file mode 100644
> index 0000000..24edb9d
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/obex/obexd_0.44.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "OBEX Server and Client"
> +DEPENDS =3D "openobex glib-2.0 dbus bluez4 libical"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "files://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4=
ca7e"
> +
> +SRC_URI =3D "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.g=
z"
> +SRC_URI[md5sum] =3D "3fb9cb9d7ab119753253ff784235a364"
> +SRC_URI[sha256sum] =3D "104fc50eb8bf41d690d31588c3a4829a75dc7738b1c76cf2=
60171d8f525da758"
> +
> +inherit autotools
> +
> +PACKAGES =3D+ "obex-client"
> +
> +FILES_${PN} +=3D "${datadir}/dbus-1/services/${PN}.service"
> +FILES_obex-client =3D "${libexecdir}/obex-client \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $=
{datadir}/dbus-1/services/obex-client.service"
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


