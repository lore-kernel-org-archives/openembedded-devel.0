Received: from mail-vb0-f50.google.com ([209.85.212.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tl1Gh-0008HD-Px
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 18:47:56 +0100
Received: by mail-vb0-f50.google.com with SMTP id fr13so1171877vbb.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 09:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=HtzMBMiiTvQsRxOtrMEmsJtsNtZqLs2TrC7xRH/jqhA=;
	b=hTSbVa6/k949Wx/ZXtLVc29zeOj9ziuUeWR4QQqWR1UyYfNBnau3MjbTjvjz6j8/m9
	FefVEug9mVdvVr0k8wZy/L3cib7K88mZYeJCbYmGt/q0IzIsvV9mqPBCnknYBqUtOfL9
	c+LpbbD9Bx83wvU3nO2SOtNdg+I9psM/hixKFNDHtJvhrQSjrZhUfhVnE3c05Bt6oI1s
	DC8W28kS/72t7VBWm85JGE0bGM6CUMdF2y2BHVE8vth30o88Ce93htv+0LK5noQLkcOo
	EXFs751FgyNzHM4R54zPsm8KNVXiM/rSbcSTChIt9TcSeyeOImszS/TGlwHPj7PoDefc
	gAXA==
MIME-Version: 1.0
Received: by 10.58.162.130 with SMTP id ya2mr4547250veb.2.1355851989263; Tue,
	18 Dec 2012 09:33:09 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Tue, 18 Dec 2012 09:33:09 -0800 (PST)
In-Reply-To: <ee97efeec28cca615eb29b1e8ba73d3ccf29a57e.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
	<ee97efeec28cca615eb29b1e8ba73d3ccf29a57e.1355849280.git.Martin.Jansa@gmail.com>
Date: Tue, 18 Dec 2012 18:33:09 +0100
Message-ID: <CALbNGRSS_HSdmt3g2cSn-yiQexHDFD2pkv+UUdixnrO=OkA3RQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 08/10] gvfs-gdu-volume-monitor: avoid double packaging gvfs locale
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
X-List-Received-Date: Tue, 18 Dec 2012 17:47:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 18, 2012 at 5:55 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> From: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>
> Fix error for do_rootfs:
> | Collected errors:
> |  * check_data_file_clashes: Package gvfs-gdu-volume-monitor-locale-fr w=
ants to install file /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom=
-linux-gnueabi/xfce4-full-image/1.0-r0/rootfs/usr/share/locale/fr/LC_MESSAG=
ES/gvfs.mo
> |       But that file is already provided by package  * gvfs-locale-fr
> |  * opkg_install_cmd: Cannot install package gvfs-gdu-volume-monitor-loc=
ale-fr.
> |  * check_data_file_clashes: Package gvfs-locale-en-gb wants to install =
file /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/x=
fce4-full-image/1.0-r0/rootfs/usr/share/locale/en_GB/LC_MESSAGES/gvfs.mo
> |       But that file is already provided by package  * gvfs-gdu-volume-m=
onitor-locale-en-gb
> |  * opkg_install_cmd: Cannot install package gvfs-locale-en-gb.
> |  * check_data_file_clashes: Package gvfs-gdu-volume-monitor-locale-de w=
ants to install file /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom=
-linux-gnueabi/xfce4-full-image/1.0-r0/rootfs/usr/share/locale/de/LC_MESSAG=
ES/gvfs.mo
> |       But that file is already provided by package  * gvfs-locale-de
> |  * opkg_install_cmd: Cannot install package gvfs-gdu-volume-monitor-loc=
ale-de.
>
> * MJ: added PR bump
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.=
bb b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
> index fe5af46..1939f09 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
> @@ -4,7 +4,7 @@ BPN =3D "gvfs"
>
>  DEPENDS =3D "gvfs gnome-disk-utility"
>
> -PR =3D "${INC_PR}.2"
> +PR =3D "${INC_PR}.3"
>
>  # we need gdu files only: reduce files to delete in libexecdir
>  EXTRA_OECONF +=3D "--disable-gphoto2"
> @@ -20,6 +20,7 @@ do_install_append() {
>         rm -rf ${D}${datadir}/glib-2.0
>         rm -rf ${D}${datadir}/GConf
>         rm -f ${D}${datadir}/dbus-1/services/gvfs-*
> +       rm -rf ${D}${datadir}/locale
>         rm -f ${D}${libexecdir}/gvfsd*
>         rm -f ${D}${libexecdir}/gvfs-fuse-daemon
>         rm -f ${D}${libexecdir}/gvfs-gphoto2-volume-monitor
> --
> 1.8.0.2
>
>
* Thanks for PR bump - it should go in with this
* after that I will check for new version
* off-topic: I wonder why I have it in my xfce-images can't find a
dependency matching - will check that too

Andreas


