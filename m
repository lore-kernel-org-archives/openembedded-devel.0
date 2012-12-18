Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TkysY-0003NI-Dk
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 16:14:47 +0100
Received: by mail-vc0-f178.google.com with SMTP id x16so937930vcq.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 07:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=GTisdzQ3quRrgS/x9CtRokD7VzPggb2v2OJyH8pkgjI=;
	b=g25LJRtvb9tzS+G6DCjGPQDlEVNyAqHR2nDh2qEJdDozgZt7VErfRWd5fwFHnyfvT/
	UN6xOeTwy2wkQuriYre9bh84R0gV8wY9eItmKPuqGQtIpmSUvjzVVt+JI0YiX3PBvZ9q
	xS7jQbAYHfTnxDtVR2R/yktrA6JAAtzTggeaIu2/bL2OJSeiAkvmZkiTAPPmkqGtgNO8
	saJr3uXOuIa7E6EStMlbz+FX21h2piSpmYNl6tJK312Uj5qA1OfoBYmSPXsMM0cf6LH1
	2Aij1Cp9drjUK2rt+rZB+8n/eCALeacH9BSenDcX6pjjpXDN9JNa6YP9hycddoOWyrJh
	tIYw==
MIME-Version: 1.0
Received: by 10.52.70.205 with SMTP id o13mr2960712vdu.75.1355842804271; Tue,
	18 Dec 2012 07:00:04 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Tue, 18 Dec 2012 07:00:04 -0800 (PST)
In-Reply-To: <1355312146-24370-1-git-send-email-schnitzeltony@googlemail.com>
References: <1355312146-24370-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 18 Dec 2012 16:00:04 +0100
Message-ID: <CALbNGRT1HUF5RcEwRcCrT_XRJzHE+qA5HgeJO-smuymz90JxzQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 18 Dec 2012 15:14:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 12, 2012 at 12:35 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
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
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../gvfs/gvfs-gdu-volume-monitor_1.8.2.bb          |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.=
bb b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
> index fe5af46..3754e60 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
> @@ -20,6 +20,7 @@ do_install_append() {
>         rm -rf ${D}${datadir}/glib-2.0
>         rm -rf ${D}${datadir}/GConf
>         rm -f ${D}${datadir}/dbus-1/services/gvfs-*
> +       rm -rf ${D}${datadir}/locale
>         rm -f ${D}${libexecdir}/gvfsd*
>         rm -f ${D}${libexecdir}/gvfs-fuse-daemon
>         rm -f ${D}${libexecdir}/gvfs-gphoto2-volume-monitor
> --
> 1.7.4.4
>
ping?


