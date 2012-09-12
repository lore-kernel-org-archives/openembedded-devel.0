Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TBmGT-00038x-O4
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2012 14:41:58 +0200
Received: by iebc11 with SMTP id c11so2940455ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2012 05:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=9anDOGGpOWG6ptJviHrpQqHlk81MzPvuEunmqrX/LZo=;
	b=obF/J99pvYkhzp1wMJKMLg94ZoM9S8YPq4YGwTUziwrr3tbiZXvrIlwpO33GGkozlI
	utmhoRXJ85IVILsoj0nAavqFb61HQ0EXd6HMFVAZADd4xY07fMLbe8ScAHMF3iFcklqP
	yqzceDbmsX44L1ScG73QgR9Ts6gm4YwIKyWe8LflYvVcz4gAwA3nRF2zAYTWunx/Fsgt
	n/5OCcWV42jqSohcEpypVW9F26NtH+RX3LJ57tpNqbYHbIvJd4q2FQTHjJwUI73wuzzj
	Wj3ChFMUL7x0Ft+IXz3iCxHWSwRF4bYWYYdcrN2LSVWzjYRjhfBUAHhPzLqRhKzkejZi
	iplw==
MIME-Version: 1.0
Received: by 10.50.195.232 with SMTP id ih8mr17200311igc.45.1347452965104;
	Wed, 12 Sep 2012 05:29:25 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Wed, 12 Sep 2012 05:29:25 -0700 (PDT)
In-Reply-To: <1346766169-18343-1-git-send-email-schnitzeltony@googlemail.com>
References: <1346766169-18343-1-git-send-email-schnitzeltony@googlemail.com>
Date: Wed, 12 Sep 2012 14:29:25 +0200
Message-ID: <CALbNGRRyy14yYRYi-YuBUQ69SJ9sFc-YH0yqZcHeWKHc-Lc72A@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] networkmanager: unbreak build with latest kernel headers
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
X-List-Received-Date: Wed, 12 Sep 2012 12:41:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 4, 2012 at 3:42 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> | nm-ppp-manager.c: In function 'monitor_cb':
> | nm-ppp-manager.c:307:23: error: storage size of 'req' isn't known
> | make[5]: *** [libppp_manager_la-nm-ppp-manager.lo] Error 1
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  ...se-struct-ifpppstatsreq-that-was-removed-.patch |   48 ++++++++++++++=
++++++
>  .../networkmanager/networkmanager_0.9.2.0.bb       |    3 +-
>  2 files changed, 50 insertions(+), 1 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkma=
nager/0002-ppp-don-t-use-struct-ifpppstatsreq-that-was-removed-.patch
>
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0=
002-ppp-don-t-use-struct-ifpppstatsreq-that-was-removed-.patch b/meta-oe/re=
cipes-connectivity/networkmanager/networkmanager/0002-ppp-don-t-use-struct-=
ifpppstatsreq-that-was-removed-.patch
> new file mode 100644
> index 0000000..e2f43f3
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-ppp=
-don-t-use-struct-ifpppstatsreq-that-was-removed-.patch
> @@ -0,0 +1,48 @@
> +From 6b64e4db2f3c9cfc0e0e240cf0bc58f3b3e90c1f Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Ji=3DC5=3D99=3DC3=3DAD=3D20Klime=3DC5=3DA1?=3D <jklime=
s@redhat.com>
> +Date: Wed, 28 Mar 2012 16:42:24 +0200
> +Subject: [PATCH 7/9] ppp: don't use struct ifpppstatsreq that was remove=
d
> + from linux/ip_ppp.h
> +
> +in recent kernels.
> +
> +We can use ifreq and ppp_stats structures separately. They needn't have =
to
> +to be packed in a structure.
> +---
> +Upstream-Status: Backport [1]
> +[1] http://cgit.freedesktop.org/NetworkManager/NetworkManager/commit/?id=
=3D6b64e4db2f3c9cfc0e0e240cf0bc58f3b3e90c1f
> + src/ppp-manager/nm-ppp-manager.c |   12 +++++++-----
> + 1 file changed, 7 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/ppp-manager/nm-ppp-manager.c b/src/ppp-manager/nm-ppp-m=
anager.c
> +index 59698c3..243d2e1 100644
> +--- a/src/ppp-manager/nm-ppp-manager.c
> ++++ b/src/ppp-manager/nm-ppp-manager.c
> +@@ -304,18 +304,20 @@ monitor_cb (gpointer user_data)
> + {
> +       NMPPPManager *manager =3D NM_PPP_MANAGER (user_data);
> +       NMPPPManagerPrivate *priv =3D NM_PPP_MANAGER_GET_PRIVATE (manager=
);
> +-      struct ifpppstatsreq req;
> ++      struct ifreq req;
> ++      struct ppp_stats stats;
> +
> +       memset (&req, 0, sizeof (req));
> +-      req.stats_ptr =3D (caddr_t) &req.stats;
> ++      memset (&stats, 0, sizeof (stats));
> ++      req.ifr_data =3D (caddr_t) &stats;
> +
> +-      strncpy (req.ifr__name, priv->ip_iface, sizeof (req.ifr__name));
> ++      strncpy (req.ifr_name, priv->ip_iface, sizeof (req.ifr_name));
> +       if (ioctl (priv->monitor_fd, SIOCGPPPSTATS, &req) < 0) {
> +               nm_log_warn (LOGD_PPP, "could not read ppp stats: %s", st=
rerror (errno));
> +       } else {
> +               g_signal_emit (manager, signals[STATS], 0,
> +-                             req.stats.p.ppp_ibytes,
> +-                             req.stats.p.ppp_obytes);
> ++                             stats.p.ppp_ibytes,
> ++                             stats.p.ppp_obytes);
> +       }
> +
> +       return TRUE;
> +--
> +1.7.9.4
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0=
.9.2.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.=
2.0.bb
> index e774cb9..074e665 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.=
bb
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.=
bb
> @@ -4,13 +4,14 @@ SECTION =3D "net/misc"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcbbffd568227ada506640fe950a48=
23b"
>
> -PR =3D "r7"
> +PR =3D "r8"
>
>  DEPENDS =3D "libnl dbus dbus-glib udev wireless-tools polkit gnutls util=
-linux ppp"
>  inherit gnome gettext
>
>  SRC_URI =3D "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/Ne=
tworkManager-${PV}.tar.bz2 \
>      file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.pat=
ch \
> +    file://0002-ppp-don-t-use-struct-ifpppstatsreq-that-was-removed-.pat=
ch \
>      file://gtk-doc.make \
>  "
>  SRC_URI[md5sum] =3D "bc0b00b8a187762d93c50a9706b4c5c3"
> --
> 1.7.6.5
>
Ping (bugfix for libc-kernel-headers > 3.5 - I tested here)

Andreas


