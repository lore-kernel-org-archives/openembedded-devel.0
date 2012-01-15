Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RmO32-00010C-U7
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 12:14:53 +0100
Received: by pbdv3 with SMTP id v3so1473472pbd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jan 2012 03:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=auRdtlu2/T9U1g+BEC4pM/ila7yrs5hpAEw4H6ef5bY=;
	b=ZmvzdnIOpzdPnWbDj/xyBnOEowJmSvqma3ZMp9HiCFECZUiPT1cN9Dg7eU8EU3tFan
	FrRvKrKfjGDQb+Ruo+WU13Y6gWM3zzkDMCGHjtviNZysgnECanJATpR8khHEKrbLeCI0
	Be8FU9XzjhDNpGhPeigzI5TC8YH6LPZVg2arA=
MIME-Version: 1.0
Received: by 10.68.191.97 with SMTP id gx1mr9867958pbc.126.1326625637468; Sun,
	15 Jan 2012 03:07:17 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Sun, 15 Jan 2012 03:07:17 -0800 (PST)
In-Reply-To: <1326585786-22118-3-git-send-email-andrea.adami@gmail.com>
References: <1326585786-22118-1-git-send-email-andrea.adami@gmail.com>
	<1326585786-22118-3-git-send-email-andrea.adami@gmail.com>
Date: Sun, 15 Jan 2012 12:07:17 +0100
Message-ID: <CAAQYJAuRHxOxFFpiF5w0gsrqgnJzJhQgC2OZCsZr1Qhr6MSyHw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld] [PATCH 2/2] zaurus.inc: remove IMAGE_DEVICE_TABLES settings
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
X-List-Received-Date: Sun, 15 Jan 2012 11:14:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2012 at 1:03 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> * Zaurus devices are now only using devtmpfs enabled kernels
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> =A0conf/machine/include/zaurus.inc | =A0 =A05 -----
> =A01 files changed, 0 insertions(+), 5 deletions(-)
>
> diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zauru=
s.inc
> index ee24900..4419192 100644
> --- a/conf/machine/include/zaurus.inc
> +++ b/conf/machine/include/zaurus.inc
> @@ -17,11 +17,6 @@ EXTRA_IMAGECMD_sum.jffs2 =3D "${EXTRA_IMAGECMD_jffs2}"
>
> =A0EXTRA_IMAGEDEPENDS +=3D "zaurus-installer"
>
> -IMAGE_DEVICE_TABLES =3D "files/device_table-minimal.txt \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 files/device_table_add-scsi=
.txt \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 files/device_table_add-loop=
.txt \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> -
> =A0#########
> =A0# xserver
> =A0#########
> --
> 1.7.3.4
>

After this patch I'll test declaring
IMAGE_DEVICE_TABLES =3D ""

It remains to see if the /dev directory has to be manually added
before.

Regards

Andrea


