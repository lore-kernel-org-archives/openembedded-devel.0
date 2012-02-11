Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RwD05-0002gO-Ab
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 14:28:25 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so1025626eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2012 05:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=lwNqJRzHCiGGewBC9OXBuxGgfD3YNChcnrvT5MbHnHE=;
	b=cxJYDPcws+wFppIPHIKB9MYD2xIVqV1UiOoBnaH91Js2kuO0t3i0n03KdZkP+oQPUC
	jPYpkCuPX4e+tZBq6dnN0cS+t++b1ETuug6Z9aWBo4bHdopCFm4qK+bvreLI7HAhAs8t
	1qd4s/A1BnrU8g26+Bp3Age0tvWis45sjQSzg=
MIME-Version: 1.0
Received: by 10.14.52.17 with SMTP id d17mr3148762eec.56.1328966420361; Sat,
	11 Feb 2012 05:20:20 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Sat, 11 Feb 2012 05:20:20 -0800 (PST)
In-Reply-To: <1328919245-27394-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328919245-27394-1-git-send-email-schnitzeltony@googlemail.com>
Date: Sat, 11 Feb 2012 11:20:20 -0200
X-Google-Sender-Auth: eYPC_gY78-ZspZLuKCDCzTBYNS4
Message-ID: <CAP9ODKo9n+i1qzxXxCXtqo3R9sXuNSsGdsetXa5hw1+o=hp=ww@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-xfce] xfce4-session: move static libraries to ${PN}-staticdev to avoid QA warnings
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
X-List-Received-Date: Sat, 11 Feb 2012 13:28:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Fri, Feb 10, 2012 at 22:14, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../xfce4-session/xfce4-session_4.8.2.bb           |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.2.bbb=
/meta-xfce/recipes-xfce/xfce4-session/
> xfce4-session_4.8.2.bb
> index 6c23c68..86a2363 100644
> --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.2.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.2.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D9ac2e7cff1ddaf48b6eab6028f23ef88"
>  DEPENDS =3D "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck d=
bus
> dbus-glib xfconf xfce4-panel gconf gnome-keyring"
>  RDEPENDS_${PN} =3D "netbase xinit dbus-x11 iceauth"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
>  inherit xfce
>
> @@ -21,7 +21,7 @@ FILES_${PN} +=3D "${libdir}/xfce4/*/*/*.so \
>
>  FILES_${PN}-dbg +=3D "${libdir}/xfce4/*/*/.debug"
>
> -FILES_${PN}-dev +=3D "${libdir}/xfce4/*/*/*.*a"
> +FILES_${PN}-staticdev +=3D "${libdir}/xfce4/*/*/*.*a"
>
>  SRC_URI[md5sum] =3D "48780cbcf784ab64debc9312f17765f2"
>  SRC_URI[sha256sum] =3D
> "31bca2a559e05a8a859f150394a901517e5842414ef171a85c5da234e344c0d0"
> --
> 1.7.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

