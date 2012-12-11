Received: from mail-ie0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TiUJn-0001hw-KQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 19:12:35 +0100
Received: by mail-ie0-f179.google.com with SMTP id k14so12878109iea.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 09:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=dtn6IzeCsUvZfEKrRx8OSqc1GgCBhkhJKsR/bn8+1l0=;
	b=pyATPpNugKLWeTcaSdQfFauAf2Dv0FcXMiBeuXMIH6GGzmLdQIhuHMLXXKHLMCXtkv
	OtX1zgyIj5urL1kxnmHzWZhA+H0URA8xBzOq/tu6znVWky2uRN1cV5J5YUzDZLotxc9R
	5hOdsagrWu5Og7ap6nxdLArnMqaWZyXQ2eZ/1FG2YVvjxKjtvNgBic6KCgT/QPIbIytd
	AkJMpFr6iMPe3Rm48GpS94tSYwN2PwceFuxfWjnSsoJzGNiOYPQgdK4Sj8Z37iqmI/LL
	uhRn1z/WLW731nlUSd96mEJUCM9alvYgurWYc08c42Q/vNxwT2OsUuk4JxByvProIcHv
	hCfg==
MIME-Version: 1.0
Received: by 10.50.152.240 with SMTP id vb16mr11016557igb.45.1355248682653;
	Tue, 11 Dec 2012 09:58:02 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Tue, 11 Dec 2012 09:58:02 -0800 (PST)
In-Reply-To: <1355222976-14461-1-git-send-email-s.stirtzel@googlemail.com>
References: <1355222976-14461-1-git-send-email-s.stirtzel@googlemail.com>
Date: Tue, 11 Dec 2012 18:58:02 +0100
Message-ID: <CALbNGRT1E9u1Ti8b7yfLVp-zB_S+uqZJBGU30TuP6sGMDPkgSg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce] xfce4-session: Add depends to iceauth-native
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
X-List-Received-Date: Tue, 11 Dec 2012 18:12:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2012 at 11:49 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> xfce4-session depends on iceauth for do_configure
>
> This fixes:
> checking for iceauth... /usr/bin/iceauth
>
> And it fixes for X-less systems:
> checking for iceauth... no
> configure: error: iceauth missing, please check your X11 installation
>
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  .../xfce4-session/xfce4-session_4.10.0.bb          |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb=
 b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
> index 4df9894..136e928 100644
> --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
> @@ -2,9 +2,11 @@ DESCRIPTION =3D "xfce4-session is a session manager for =
Xfce 4 Desktop Environment
>  SECTION =3D "x11"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9ac2e7cff1ddaf48b6eab6028f23e=
f88"
> -DEPENDS =3D "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck d=
bus dbus-glib xfconf gnome-keyring"
> +DEPENDS =3D "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck d=
bus dbus-glib xfconf gnome-keyring iceauth-native"
>  RDEPENDS_${PN} =3D "netbase xinit dbus-x11 iceauth consolekit upower"
>
> +PR =3D "r1"
> +
>  inherit xfce
>
>  SRC_URI[md5sum] =3D "4768e1a41a0287af6aad18b329a0f230"
> --
> 1.7.9.5
Acked-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>


