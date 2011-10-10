Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RDLkl-00011t-64
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Oct 2011 21:43:11 +0200
Received: (qmail invoked by alias); 10 Oct 2011 19:37:30 -0000
Received: from p4FDF1933.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.25.51]
	by mail.gmx.net (mp071) with SMTP; 10 Oct 2011 21:37:30 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+us143IbOuPy2JWy7UfH68XRxsStsITSZwEZze8E
	1CSqlsHFzRo5+Y
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Oct 2011 21:41:55 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201109222337.30836.schnitzeltony@gmx.de>
	<201109251506.30431.schnitzeltony@gmx.de>
	<j6ugs9$j5b$1@dough.gmane.org>
In-Reply-To: <j6ugs9$j5b$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201110102141.56124.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-oe] do_rootfs fails with networkmanager (was network-manager-applet) included
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
X-List-Received-Date: Mon, 10 Oct 2011 19:43:11 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday, October 10, 2011 12:19:53 PM Koen Kooi wrote:
> Op 25-09-11 15:06, Andreas M=C3=BCller schreef:
> > On Thursday, September 22, 2011 11:37:30 PM Andreas M=C3=BCller wrote:
> >> Hi
> >>
> >> For my xfce-image ( lives in meta-angstrom/recipes-angstrom/images )  I
> >> want to make use of network-manager-applet which came in meta oe few
> >> days ago.
> >>
> >> It seems that as soon as I add network-manager-applet do_rootfs fails
> >> with something like:
> >>
> >>
> >> | Configuring openssh-sftp. | Configuring xf86-input-evdev. |
> >> Configuring cpufrequtils. | Configuring systemd-compat-units. |
> >> Configuring gvfsd-ftp. | Collected errors: |  * extract_archive: Cannot
> >> create symlink from ./var/run to 'volatile/run': File exists. | + '['
> >> '!' -z '' ']' | + package_tryout_install_multilib_ipk | +
> >> multilib_tryout_dirs=3D | + '[' '!' -z
> >> /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/x=
fce-base-image-1.0-r0/multilib_check.py
> >> ']' | | ERROR: Function 'do_rootfs' failed (see
> >> /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/x=
fce-base-image-1.0-r0/temp/log.do_rootfs.28313
> >> for further information) NOTE: package xfce-base-image-1.0-r0: task
> >> do_rootfs: Failed ERROR: Task 8
> >> (/home/Superandy/data/oe-core/sources/meta-angstrom/recipes-angstrom/i=
mages/xfce-base-image.bb,
> >> do_rootfs) failed with exit code '1' ERROR:
> >> '/home/Superandy/data/oe-core/sources/meta-angstrom/recipes-angstrom/i=
mages/xfce-base-image.bb'
> >> failed
> >>
> > Looked around a bit for this issue. As soon as there is networkmanager
> > included, do_rootfs fails with with something like
> >
> > | Collected errors: |  * extract_archive: Cannot create symlink from
> > ./var/run to 'volatile/run': File exists.
> >
> > In 'image'-folder of networkmanager I find a folder
> > 'var/run/NetworkManager'. At do_rootfs this folder has moved to
> > '/var/volatile/run/NetworkManager' ( see
> > <build>/<machine>-angstrom-linux-gnueabi/<image>-1.0-r0/rootfs/var/vola=
tile).
> >
> >  Seems as do_rootfs tries to setup a link 'var/run' where still a
> > (remaining) folder is present - or the transition from var/run ->
> > var/volatile/run is somehow incomplete.
> >
> > Any ideas how - or especially where to fix ( not only for networkmanager
> > I guess ). Maybe this is an oe-core issue but there no networkmanager is
> > available...
>=20
> I've finally managed to reproduce this! I vaguely recall you finding out
> some more details, could you please give a summary of your finding?
>=20
> regards,
>=20
> koen
>=20
>=20
Hi Koen,

In historical order trying not to cause confusion this time :-)

1. I found a conflict between OE-Core creating /var/run-symlink by  'packag=
e.bbclass' together with 'meta/files/fs-perms.txt' on the one side and angs=
trom 'base-files_3.0.14.bbappend' trying to create /var/run-directory on th=
e other side. I sent a patch [1] which fixed the issue. Unfortunately I was=
 a bit over-enthusiastic and sent the patch together with [2] in a series.
2. On the first run, I recognized, that the second part of the series cause=
d missing directories and wrote that in [3]. Here I meant to skip only the =
 _second_ part of the series.
3. You committed a workaround for /var/run issue [4].
4. I asked if this is neccessary in [5]. Your comment in the source ('we do=
 not want that') made me think it is mandatory to have /var/run as dir and =
I hoped to learn the reason.
5. The broken do_rootfs still scared me in [6].
6. After none of the mails were responded, few days ago I decided to give y=
our workaround a try, reverted my patch and - surprise - did not get an err=
or on do_rootfs! So I thought I missed some magic and decided not to cause =
further noise on that.

[1] http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2011-Septemb=
er/005096.html
[2] http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2011-Septemb=
er/005097.html
[3] http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2011-Septemb=
er/005098.html
[4] http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/com=
mit/?id=3D018290161de5c0e99df7c972d1f749c3c52dd73e
[5] http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2011-October=
/005109.html
[6] http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2011-October=
/005110.html

Andreas


