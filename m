Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkzOg-00040a-8d
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 16:47:59 +0100
Received: by mail-pb0-f42.google.com with SMTP id rp2so516506pbb.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 07:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8gOOEv/3LFSBj7J1BJRrx8hc86qO6dfILQd6+TB+NoY=;
	b=B7Fohtvm1dLJVnHqV4qsuAZlUoNIxw4LV5kYLm9YSHuvOwolD0sCisdmAZK1+Bf8gM
	De+9XNyhIoiKGO6YsLY4cNZ2HVDGXv4Fm7HMGAfNvffGVEqwsKn9ZJICa9DlMhsmayn6
	00+bX3DMW0FzhblU5ZYQFhaIvmxzTChsacjkBY21pL/TxQ9DGcU+MHblVLyFHnFLBlUB
	bJp2FYHkoJAthBKhEXxYgC22zIV9qPq4QeHFMn7IhcN65xTWXmoNhT7BXCcir2bvAoEk
	vH5PxvNNMdCD5xVFmjg94YZtts2IVvbAhfdU5ZImJP7YSb6F36PtYm22qBh0VpM3E19p
	VJAw==
X-Received: by 10.66.72.225 with SMTP id g1mr7565062pav.79.1355844795549;
	Tue, 18 Dec 2012 07:33:15 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a4sm1611174pax.25.2012.12.18.07.33.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 07:33:14 -0800 (PST)
Date: Tue, 18 Dec 2012 16:33:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121218153311.GB3331@jama.palm1.palmone.com>
References: <1355312146-24370-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRT1HUF5RcEwRcCrT_XRJzHE+qA5HgeJO-smuymz90JxzQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRT1HUF5RcEwRcCrT_XRJzHE+qA5HgeJO-smuymz90JxzQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-gnome] gvfs-gdu-volume-monitor: avoid double packaging gvfs locale
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
X-List-Received-Date: Tue, 18 Dec 2012 15:48:03 -0000
X-Groupsio-MsgNum: 42233
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline

--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 18, 2012 at 04:00:04PM +0100, Andreas M=FCller wrote:
> On Wed, Dec 12, 2012 at 12:35 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > Fix error for do_rootfs:
> > | Collected errors:
> > |  * check_data_file_clashes: Package gvfs-gdu-volume-monitor-locale-fr=
 wants to install file /home/Superandy/tmp/oe-core-eglibc/work/overo-angstr=
om-linux-gnueabi/xfce4-full-image/1.0-r0/rootfs/usr/share/locale/fr/LC_MESS=
AGES/gvfs.mo
> > |       But that file is already provided by package  * gvfs-locale-fr
> > |  * opkg_install_cmd: Cannot install package gvfs-gdu-volume-monitor-l=
ocale-fr.
> > |  * check_data_file_clashes: Package gvfs-locale-en-gb wants to instal=
l file /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi=
/xfce4-full-image/1.0-r0/rootfs/usr/share/locale/en_GB/LC_MESSAGES/gvfs.mo
> > |       But that file is already provided by package  * gvfs-gdu-volume=
-monitor-locale-en-gb
> > |  * opkg_install_cmd: Cannot install package gvfs-locale-en-gb.
> > |  * check_data_file_clashes: Package gvfs-gdu-volume-monitor-locale-de=
 wants to install file /home/Superandy/tmp/oe-core-eglibc/work/overo-angstr=
om-linux-gnueabi/xfce4-full-image/1.0-r0/rootfs/usr/share/locale/de/LC_MESS=
AGES/gvfs.mo
> > |       But that file is already provided by package  * gvfs-locale-de
> > |  * opkg_install_cmd: Cannot install package gvfs-gdu-volume-monitor-l=
ocale-de.
> >
> > Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> > ---
> >  .../gvfs/gvfs-gdu-volume-monitor_1.8.2.bb          |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.=
2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
> > index fe5af46..3754e60 100644
> > --- a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
> > +++ b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
> > @@ -20,6 +20,7 @@ do_install_append() {
> >         rm -rf ${D}${datadir}/glib-2.0
> >         rm -rf ${D}${datadir}/GConf
> >         rm -f ${D}${datadir}/dbus-1/services/gvfs-*
> > +       rm -rf ${D}${datadir}/locale
> >         rm -f ${D}${libexecdir}/gvfsd*
> >         rm -f ${D}${libexecdir}/gvfs-fuse-daemon
> >         rm -f ${D}${libexecdir}/gvfs-gphoto2-volume-monitor
> > --
> > 1.7.4.4
> >
> ping?

I've it in my queue and will send consolidated-pull request tomorrow.

Btw meta-guacamayo is using newer gvfs-1.12.3 and maybe they also
resolved
http://patchwork.openembedded.org/patch/16755/

Can you check if such upgrade would be usefull for meta-gnome too?=20
I'm not using gnome..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDQjLcACgkQN1Ujt2V2gBwycQCgmCpWbtExR1bZPfqahk6KeQlO
RSMAoLkRZoaHBzaLa62Hs0Kywo8DSZ+f
=QWgg
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
