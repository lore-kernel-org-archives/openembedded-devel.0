Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lazy.gopher@gmail.com>) id 1PHa7S-0007vG-9j
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Nov 2010 11:47:42 +0100
Received: by gyf3 with SMTP id 3so2697644gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Nov 2010 02:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=E801mKjGWhsr1J0+wObqyvA+8dX3uNC5cnb44pvyLv4=;
	b=FHHSX6xVsDimAiz/hJ5dIuRUjjQ9ZeRYsjINWqDpmkTaaEtL3iW3Qy65agZnbTBNKw
	tRgTcABmT6JQuzRMrU/Z6Tu1H8MHh3r8qOXrhsJD46++YXvNKPFWnPfAd9eElKcfuoGM
	cxfnyCSKq+Atpy2IJhnbKGvvWgW5UEmQKK3bE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=D5O0LkOE6gxmOYyaK8TEyuVupL+BSSmTAwiWyDiTwbY8YOSUthQPcosIVbTCYPgnAr
	1A75PG3p4z7brjKV4vj4c3rOa0nba0yNJW0WyiF4az+dTQePtzsqnxJ7Sh+NaamRD//b
	3gcWyPV9GupNyl0u3Gc2FZViD2Sz6g7VW75pE=
MIME-Version: 1.0
Received: by 10.90.232.17 with SMTP id e17mr6045038agh.177.1289731589429; Sun,
	14 Nov 2010 02:46:29 -0800 (PST)
Received: by 10.90.116.18 with HTTP; Sun, 14 Nov 2010 02:46:29 -0800 (PST)
In-Reply-To: <1289072817-13412-1-git-send-email-lazy.gopher@gmail.com>
References: <1289072817-13412-1-git-send-email-lazy.gopher@gmail.com>
Date: Sun, 14 Nov 2010 11:46:29 +0100
Message-ID: <AANLkTimpP7GNyV_7aBrVtJRkK-YE0cYeNOq8yLgz_ntY@mail.gmail.com>
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: lazy.gopher@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] mcpp: added new recipe for version 2.7.2
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
X-List-Received-Date: Sun, 14 Nov 2010 10:47:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ping

On Sat, Nov 6, 2010 at 8:46 PM, Maksym Parkachov <lazy.gopher@gmail.com> wr=
ote:
> * created .inc file for both target and native version
> * added version 2.7.2
>
> Signed-off-by: Maksym Parkachov <lazy.gopher@gmail.com>
> ---
> =C2=A0recipes/mcpp/mcpp.inc =C2=A0 =C2=A0 =C2=A0| =C2=A0 11 +++++++++++
> =C2=A0recipes/mcpp/mcpp_2.7.2.bb | =C2=A0 =C2=A05 +++++
> =C2=A02 files changed, 16 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/mcpp/mcpp.inc
> =C2=A0create mode 100644 recipes/mcpp/mcpp_2.7.2.bb
>
> diff --git a/recipes/mcpp/mcpp.inc b/recipes/mcpp/mcpp.inc
> new file mode 100644
> index 0000000..9c56a7c
> --- /dev/null
> +++ b/recipes/mcpp/mcpp.inc
> @@ -0,0 +1,11 @@
> +DESCRIPTION =3D "MCPP is a portable C/C++ preprocessor"
> +HOMEPAGE =3D "http://mcpp.sourceforge.net/"
> +LICENSE =3D "BSD"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
> +
> +inherit autotools lib_package
> +
> +EXTRA_OECONF =3D " --enable-mcpplib "
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/recipes/mcpp/mcpp_2.7.2.bb b/recipes/mcpp/mcpp_2.7.2.bb
> new file mode 100644
> index 0000000..55418bf
> --- /dev/null
> +++ b/recipes/mcpp/mcpp_2.7.2.bb
> @@ -0,0 +1,5 @@
> +require ${BPN}.inc
> +
> +SRC_URI[md5sum] =3D "512de48c87ab023a69250edc7a0c7b05"
> +SRC_URI[sha256sum] =3D "3b9b4421888519876c4fc68ade324a3bbd81ceeb7092ecdb=
bc2055099fcb8864"
> +
> --
> 1.7.2.3
>
>


