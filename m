Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdrTc-0006kA-6Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2012 01:23:20 +0200
Received: by eaal1 with SMTP id l1so1783723eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 16:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=as8VFnjN8Y3eA+KMTCNh0yeL50HVGrizGhfGYedExzM=;
	b=oO0Xu+FZC+jorviBo2e9yy0XIVY//JklcouFnChznwKuC/QXxLr9odqZcRbWuFtn7K
	z8TityME1eVfSa2XihkHOHv6CVgslXRCsp8yQIAt6FrNz2FjTgg2W3inY/hoZA3eZtbc
	JXRaPj5+y/KCXjqU9RQdoeBJ5IOLcbaSjDiKWZ9oPjXZuNsH/DnkUK3epusPv1+HtuNz
	PlS/XMZofzgLpvK4mq7pnaHuBrSU3g8grOwM9V1cW/Spcbr0ct+zTNCA1SR9DEojsYFO
	TUPWmTTDq/Yk7ommQnHmzm2WlC0PTQzDRPo3IwpzBZ9Lonzrhu+HIxNYG+oYQzbAsivl
	RsFQ==
Received: by 10.14.119.197 with SMTP id n45mr5377810eeh.180.1339369967723;
	Sun, 10 Jun 2012 16:12:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Sun, 10 Jun 2012 16:12:17 -0700 (PDT)
In-Reply-To: <1339364820-2880-4-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
	<1339364820-2880-4-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Jun 2012 16:12:17 -0700
Message-ID: <CAMKF1sqZt_v_kJi9NDQt3LQDqMevGZP8_2hGFbRYE6k--DMbxg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC, meta-oe 03/27] layer.conf/README: search directory structure for bbappends changed
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
X-List-Received-Date: Sun, 10 Jun 2012 23:23:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 10, 2012 at 2:46 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> -BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bba=
ppend"
> +BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/*/recipes-*/*/*.b=
bappend"

why only for bbappends and why not for bb files as well can you explain thi=
s
change a bit and its usecases


