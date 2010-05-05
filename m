Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1O9Z6g-0005Af-Ha
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 09:33:24 +0200
Received: by bwz26 with SMTP id 26so2786279bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 May 2010 00:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7ltA92iFewCDKzdiVssxIC6Eakty3XDdUXEuS9JKtdU=;
	b=lIOKKEWR358YnigPL+YUht0XJaLB5Tfhmd6WVBCLFn5ipBMllr/Bs4luYZOfMymIdW
	rgz9vlqdK59vJdyYz7JzErnxmx2BJ5yVueqruSoN5hhCxT1TUuYCsAWsesDxJb0A2o6W
	LIDoyNFMRCVX5zoUMydZXYIGEDr1hCRYJVojE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ICC+IpwMTFbmEQ5SdRAyVxDUubC4cwqkS6aiyc4r6Ygkj9ZE1BQeqSoNtHTWGsAyGo
	71XBqkrzdDrZVM1g3dhuRcfeqnf8KaHgRLnvM+btCLmmD45mXZYf8t09DZAzr9Rsva5A
	C+L9x9OK/tfSQRJM65y7wEr4Fk10/nMF/4c6U=
MIME-Version: 1.0
Received: by 10.204.134.211 with SMTP id k19mr4010871bkt.48.1273044574837; 
	Wed, 05 May 2010 00:29:34 -0700 (PDT)
Received: by 10.204.76.76 with HTTP; Wed, 5 May 2010 00:29:34 -0700 (PDT)
In-Reply-To: <1273041286-632-1-git-send-email-hvontres@gmail.com>
References: <1273041286-632-1-git-send-email-hvontres@gmail.com>
Date: Wed, 5 May 2010 09:29:34 +0200
Message-ID: <r2qfca63bcf1005050029wc4a8e1c9l64d6676ab012bd5c@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libtorrent / rtorrent: add latest upstream versions and fix crash on nslu2
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
X-List-Received-Date: Wed, 05 May 2010 07:33:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> diff --git a/recipes/libtorrent/libtorrent_0.12.6.bb b/recipes/libtorrent=
/libtorrent_0.12.6.bb
> new file mode 100644
> index 0000000..075ce40
> --- /dev/null
> +++ b/recipes/libtorrent/libtorrent_0.12.6.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "library implementing the bittorrent protocol"
> +HOMEPAGE =3D "http://libtorrent.rakshasa.no"
> +SECTION =3D "libs/network"
> +LICENSE =3D "GPL"
> +DEPENDS =3D "libsigc++-2.0 openssl"
> +
> +SRC_URI =3D "http://libtorrent.rakshasa.no/downloads/libtorrent-${PV}.ta=
r.gz"
> +PR =3D "r0.1"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "--enable-aligned"
> +
> +FULL_OPTIMIZATION_nslu2 =3D"-mcpu=3Dxscale -fexpensive-optimizations -fr=
ename-registers -O2 -fpermissive -fno-inline"
> +
> +do_stage() {
> + =A0 =A0 =A0 autotools_stage_all

1) No need for further dividing PR into subnumbers, r0 is sufficient.

2) On .dev your do not need to stage (mostly) anymore. If autotools
installs everything correctly you can just dismiss the do_stage()
routine. If something is missing, then install it via
do_install_append in the appropriate folder and OE will determine that
it needs to be staged. depending on the files' paths.

Regards,
Michael


