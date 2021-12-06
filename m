Return-Path: <ubely@ilbers.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBAAC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 11:27:05 +0000 (UTC)
Received: from shymkent.ilbers.de (shymkent.ilbers.de [85.214.156.166])
 by mx.groups.io with SMTP id smtpd.web10.50251.1638790023860450763
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: ilbers.de, ip: 85.214.156.166, mailfrom: ubely@ilbers.de)
Received: from hp.localnet (host-80-81-17-52.static.customer.m-online.net
 [80.81.17.52])
	(authenticated bits=0)
	by shymkent.ilbers.de (8.15.2/8.15.2/Debian-8) with ESMTPSA id 1B6BQqAl000786
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Dec 2021 12:26:53 +0100
From: Uladzimir Bely <ubely@ilbers.de>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 1/1] buildstats: disk usage outside bbclass
Date: Mon, 06 Dec 2021 14:26:10 +0300
Message-ID: <2043562.9o76ZdvQCi@hp>
In-Reply-To: <19165fe6ef2547aaa5b8085227153ec2@axis.com>
References: <20211204063316.12502-1-ubely@ilbers.de>
 <20211204063316.12502-2-ubely@ilbers.de>
 <19165fe6ef2547aaa5b8085227153ec2@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Dec 2021 11:27:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94216

In mail from =D0=B2=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=
=D0=B5, 5 =D0=B4=D0=B5=D0=BA=D0=B0=D0=B1=D1=80=D1=8F 2021 =D0=B3. 01:30:54 =
+03 user Peter=20
Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Uladzimir Bely
> > Sent: den 4 december 2021 07:33
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [PATCH 1/1] buildstats: disk usage outside bbclass
> >=20
> > This allows to use a custom disk stats command
> > without modifying buildstats.bbclass.
> > ---
> >=20
> >  meta/classes/buildstats-utils.bbclass | 4 ++++
> >  meta/classes/buildstats.bbclass       | 5 +++--
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >  create mode 100644 meta/classes/buildstats-utils.bbclass
> >=20
> > diff --git a/meta/classes/buildstats-utils.bbclass
> > b/meta/classes/buildstats-utils.bbclass
> > new file mode 100644
> > index 00000000..712674d0
> > --- /dev/null
> > +++ b/meta/classes/buildstats-utils.bbclass
> > @@ -0,0 +1,4 @@
> > +def buildstats_disk_usage(path):
> > +    import subprocess
> > +    return subprocess.check_output(["du", "-shx", path],
> > +                   stderr=3Dsubprocess.STDOUT).decode('utf-8')
> > diff --git a/meta/classes/buildstats.bbclass
> > b/meta/classes/buildstats.bbclass index 0de60520..1cade568 100644
> > --- a/meta/classes/buildstats.bbclass
> > +++ b/meta/classes/buildstats.bbclass
> > @@ -8,6 +8,8 @@ BUILDSTATS_BASE =3D "${TMPDIR}/buildstats/"
> >=20
> >  #
> >=20
> > #######################################################################=
###
> > ######
> >=20
> > +inherit buildstats-utils
> > +
> >=20
> >  def get_buildprocess_cputime(pid):
> >      with open("/proc/%d/stat" % pid, "r") as f:
> >          fields =3D f.readline().rstrip().split()
> >=20
> > @@ -244,8 +246,7 @@ python run_buildstats () {
> >=20
> >                  rootfs =3D d.getVar('IMAGE_ROOTFS')
> >                 =20
> >                  if os.path.isdir(rootfs):
> >                      try:
> > -                        rootfs_size =3D subprocess.check_output(["du",
> > "-sh", rootfs], -                              =20
> > stderr=3Dsubprocess.STDOUT).decode('utf-8') +                      =20
> > rootfs_size =3D buildstats_disk_usage(rootfs)
> A simpler solution is to introduce a bitbake variable for the "du -sh"
> command. Then you can just override it with your command as you please.
> I.e., add:
>=20
> BUILDSTATS_DISK_USAGE ??=3D "du -sh"
>=20
> after BUILDSTATS_BASE at the top of the file and change the above to:
>=20
>                         rootfs_size =3D subprocess.check_output(
>                             d.getVar('BUILDSTATS_DISK_USAGE').split() +
> [rootfs], stderr=3Dsubprocess.STDOUT).decode('utf-8')
> >                          f.write("Uncompressed Rootfs size: %s" %
> >                          rootfs_size)
> >                     =20
> >                      except subprocess.CalledProcessError as err:
> >                          bb.warn("Failed to get rootfs size: %s" %
> >                          err.output.decode('utf-8'))
> >=20
> > --
> > 2.20.1
>=20
> //Peter

Thanks, the idea of using a variable is really simpler.

I've prepared a corresponding patch for a maillist:
https://lists.openembedded.org/g/openembedded-devel/message/94215
I hope, it's good enough to be applied to oe-core upstream soon.

=2D-=20
Uladzimir Bely
Promwad Ltd.
External service provider of ilbers GmbH
Maria-Merian-Str. 8
85521 Ottobrunn, Germany
+49 (89) 122 67 24-0
Commercial register Munich, HRB 214197
General Manager: Baurzhan Ismagulov



