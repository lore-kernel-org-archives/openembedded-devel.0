Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SvljB-0005Ld-Nd
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 10:53:25 +0200
Received: by yhjj56 with SMTP id j56so4068533yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 01:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=w0v9E7G2n7jx7uA5TNB4Z9ZCMn/sTPSYGy0r0nIc8i4=;
	b=pWm24jBKR5vqbWz+j+TM5u4dV+OqoS6oT+aUBbSi8Yrrh44qn8XK1uzaX63m07sDB/
	SLHwH2DoaddZ74qo06zd5k4lHmKFzB4iNxl6iI4Kfp8eTMWqaNXwKl4VbBedxY8hs/Li
	uOQRh/1RAaUm+twjNn6+gq+KsMewI0P83xPw+UNr5YpgPniHD5nKTKvXpOTRBgvmZWVt
	8DQsMBpN+2XQCdtZ1eCs0vbFvdnOQW1Pko2H01IGp+76hykVvBWtoLOcVr4GCN/v7Una
	JAreXBez/DqGvn+/AekYjX+FzXNr4xfJqXyqKQtXjJ5hjJw8EvNKrxoBy2K7/8pzfizd
	ky+w==
MIME-Version: 1.0
Received: by 10.50.207.36 with SMTP id lt4mr7840443igc.5.1343637709752; Mon,
	30 Jul 2012 01:41:49 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Mon, 30 Jul 2012 01:41:49 -0700 (PDT)
In-Reply-To: <4438b2cc31435f690f1824140e1c157ec7afdc44.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<4438b2cc31435f690f1824140e1c157ec7afdc44.1343478744.git.Martin.Jansa@gmail.com>
Date: Mon, 30 Jul 2012 10:41:49 +0200
Message-ID: <CALbNGRTfkdRXp33kOpZUzFv-98LJNGFX0biBmihVCen0Ms_3kA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/5] tcpdump: bump PR to rebuild against libpcap1 instead libpcap
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
X-List-Received-Date: Mon, 30 Jul 2012 08:53:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 28, 2012 at 2:33 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb b/meta-oe/r=
ecipes-support/tcpdump/tcpdump_4.1.1.bb
> index 9fd0ac0..46b19a1 100644
> --- a/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
> +++ b/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1d4b0366557951c84a94fabe3529f=
867"
>  SECTION =3D "console/network"
>  DEPENDS =3D "libpcap"
> -PR =3D "r1"
> +PR =3D "r2"
>
>  SRC_URI =3D " \
>         http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
> --
> 1.7.8.6
>
Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>


