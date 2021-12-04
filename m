Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBC5C433F5
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 22:30:59 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.30810.1638657057763310380
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Dec 2021 14:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=mSP1R98n;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1638657058;
  x=1670193058;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1hOcGpOT5W+JKxFEuxrl8c754t18/qqywcJwUcVuI/E=;
  b=mSP1R98nCG7ZfiTktVZlczRjkvHJ5Pr87TubDQnMeiRe7d9c2YZF/5og
   K6je+WZLLlfkHeCiBi8EDEhlJjgT6gmrvizPrgNsMDq7xA5U0iTWctNIg
   yFSQJ6LazRuSiu6vG45NAd2VcCf+4go2wLhnqkJ6BU1guigac/bb+vuWu
   ez/73utClQwvnF9WxmQVIxwAYmu/Licje7wQVr2lTUs/aWd1/RILq39Xl
   k3Roz7f5AoxqJmIyBgvx7MgzRi/YM1F0j4fiXPwMm6zAk0XOugpG6Xf7U
   yFCvp0IMuOuEfmDUueo7Lst8QHzRrNn9DIaGwpOz4bAwtze6bPWOw/68M
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Uladzimir Bely <ubely@ilbers.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH 1/1] buildstats: disk usage outside bbclass
Thread-Topic: [oe] [PATCH 1/1] buildstats: disk usage outside bbclass
Thread-Index: AQHX6NjeUA5J3fZJTEiL97Wx8GBREawi52og
Date: Sat, 4 Dec 2021 22:30:54 +0000
Message-ID: <19165fe6ef2547aaa5b8085227153ec2@axis.com>
References: <20211204063316.12502-1-ubely@ilbers.de>
 <20211204063316.12502-2-ubely@ilbers.de>
In-Reply-To: <20211204063316.12502-2-ubely@ilbers.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Dec 2021 22:30:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94209

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Uladzimir Bely
> Sent: den 4 december 2021 07:33
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH 1/1] buildstats: disk usage outside bbclass
>=20
> This allows to use a custom disk stats command
> without modifying buildstats.bbclass.
> ---
>  meta/classes/buildstats-utils.bbclass | 4 ++++
>  meta/classes/buildstats.bbclass       | 5 +++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
>  create mode 100644 meta/classes/buildstats-utils.bbclass
>=20
> diff --git a/meta/classes/buildstats-utils.bbclass
> b/meta/classes/buildstats-utils.bbclass
> new file mode 100644
> index 00000000..712674d0
> --- /dev/null
> +++ b/meta/classes/buildstats-utils.bbclass
> @@ -0,0 +1,4 @@
> +def buildstats_disk_usage(path):
> +    import subprocess
> +    return subprocess.check_output(["du", "-shx", path],
> +                   stderr=3Dsubprocess.STDOUT).decode('utf-8')
> diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bb=
class
> index 0de60520..1cade568 100644
> --- a/meta/classes/buildstats.bbclass
> +++ b/meta/classes/buildstats.bbclass
> @@ -8,6 +8,8 @@ BUILDSTATS_BASE =3D "${TMPDIR}/buildstats/"
>  #
>=20
> #########################################################################=
#######
>=20
> +inherit buildstats-utils
> +
>  def get_buildprocess_cputime(pid):
>      with open("/proc/%d/stat" % pid, "r") as f:
>          fields =3D f.readline().rstrip().split()
> @@ -244,8 +246,7 @@ python run_buildstats () {
>                  rootfs =3D d.getVar('IMAGE_ROOTFS')
>                  if os.path.isdir(rootfs):
>                      try:
> -                        rootfs_size =3D subprocess.check_output(["du", "=
-sh", rootfs],
> -                                stderr=3Dsubprocess.STDOUT).decode('utf-=
8')
> +                        rootfs_size =3D buildstats_disk_usage(rootfs)

A simpler solution is to introduce a bitbake variable for the "du -sh"=20
command. Then you can just override it with your command as you please.=20
I.e., add:

BUILDSTATS_DISK_USAGE ??=3D "du -sh"

after BUILDSTATS_BASE at the top of the file and change the above to:

                        rootfs_size =3D subprocess.check_output(
                            d.getVar('BUILDSTATS_DISK_USAGE').split() + [ro=
otfs],
                            stderr=3Dsubprocess.STDOUT).decode('utf-8')

>                          f.write("Uncompressed Rootfs size: %s" % rootfs_=
size)
>                      except subprocess.CalledProcessError as err:
>                          bb.warn("Failed to get rootfs size: %s" % err.ou=
tput.decode('utf-8'))
> --
> 2.20.1

//Peter


