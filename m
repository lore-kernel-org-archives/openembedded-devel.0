Received: from mail-pd0-f176.google.com ([209.85.192.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ULFV3-0004fh-7O
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Mar 2013 17:16:26 +0100
Received: by mail-pd0-f176.google.com with SMTP id r11so1592984pdi.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2013 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=zeJ4k64TDaEPQEtQG4a330UQDmhSzrFBqHqQ+4z4UGc=;
	b=LbtmRGm51Wd/EY2s3qQ4crzh0SpfW31G3Uq0RXnr5BRhkJqJ35FL6SJAF5UpLOIXrt
	z1nrv/krvr10vVYSFN2ddbnj8QZmf85FWkO9qYxnvmjkWfwHCQVIsIdkCDvy4p7A+QLq
	qH200f6i1IOqlfN7lOuGEtXeELA8cJE3bdgFGYeo4EEBumhfbZazupCseD+X4E9Vxd4u
	IXKuEipfAkKsT08E4ukdfJWO51f5cWRAiWJW68gr8uxcZrA4d00xUAAnmLR3McgRyJPV
	jYPoXogo6wuQ2kmuifyJR0YFU6v06Xkh/KGhm23ZYz/FKbQOshnkiXWO1UxGbgAouPPr
	h0yA==
X-Received: by 10.66.88.105 with SMTP id bf9mr6760184pab.175.1364486361721;
	Thu, 28 Mar 2013 08:59:21 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id fc8sm28186003pad.21.2013.03.28.08.59.20
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 08:59:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1364469742-37652-1-git-send-email-paul@paulbarker.me.uk>
Date: Thu, 28 Mar 2013 08:59:21 -0700
Message-Id: <06CB000D-6FFC-41A1-9808-E196E45E4F3A@gmail.com>
References: <1364469742-37652-1-git-send-email-paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: [meta-oe][PATCH] live555: Update to latest version
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
X-List-Received-Date: Thu, 28 Mar 2013 16:16:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 28, 2013, at 4:22 AM, Paul Barker <paul@paulbarker.me.uk> wrote:

> The upstream source for live555 does not keep tarballs of old releases =
so the
> live555 recipe in meta-oe no longer builds. The version number has =
been updated
> to 20130323 which is currently available.
>=20
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
> meta-oe/recipes-multimedia/live555/live555_20110314.bb |   10 =
----------
> meta-oe/recipes-multimedia/live555/live555_20130323.bb |    8 ++++++++
> 2 files changed, 8 insertions(+), 10 deletions(-)


sometimes its best to use git format-patch -M so its recorded as move =
and not delete/add

> delete mode 100644 =
meta-oe/recipes-multimedia/live555/live555_20110314.bb
> create mode 100644 =
meta-oe/recipes-multimedia/live555/live555_20130323.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/live555/live555_20110314.bb =
b/meta-oe/recipes-multimedia/live555/live555_20110314.bb
> deleted file mode 100644
> index b1dbad2..0000000
> --- a/meta-oe/recipes-multimedia/live555/live555_20110314.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require live555.inc
> -
> -LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D68ad62c64cc6c620126241fd429e68fe"
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[md5sum] =3D "ff65b2c598e970b4b6c8219a1811de00"
> -SRC_URI[sha256sum] =3D =
"c6ce050a7f9f69901e6f7f81a6745c82d9419e3904a753b2d5db1139caaf6738"
> -
> -
> diff --git a/meta-oe/recipes-multimedia/live555/live555_20130323.bb =
b/meta-oe/recipes-multimedia/live555/live555_20130323.bb
> new file mode 100644
> index 0000000..abf7e14
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/live555/live555_20130323.bb
> @@ -0,0 +1,8 @@
> +require live555.inc
> +
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D68ad62c64cc6c620126241fd429e68fe"
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[md5sum] =3D "e9a75e0cfbf4f25aedd4ee4a10a7c26f"
> +SRC_URI[sha256sum] =3D =
"9aaa736ee3b11ac0aa33655d8c59eefa893ef7c84a8f87d8ac0176c33b8f4deb"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



