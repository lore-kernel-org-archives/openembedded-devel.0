Received: from [74.125.44.157] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lskbv-0002Cx-4V
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Apr 2009 23:19:37 +0200
Received: by yx-out-1718.google.com with SMTP id 3so1052279yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Apr 2009 14:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=xxdXTKG5AiyTYbVm8fzbERzU81uBJ+qaDW7CTKY75W8=;
	b=g4UXWbr1APQRCb/kgpBS8VDbJG5ix/vVAY7HCGtVZ2tfXnzp+K+z1MsladdrcFfNvZ
	gxgbO6wfdcXCkgMKa0Hy+AYyvslF5pR8N4uWgpdFQeGlv48YW6kPKiibVTD3TFo0CeNy
	VX86yGoZv7KDZra1ZF+zRvyeZyWmFAVaHpkDs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=d7BfreclUeWEf0FXn3QI0ab3sSf69Wojh/LfgdtLyoth7o5aH/ZFgF5wTY6ZRPimgP
	sEa7lhh+y7V3G4WbjmHo2lvu6F+JDH/8Zj2sMIODHVjqY9nGR5cuxumuZ8YMlQKaViMn
	DqqzJ4QqgExo98BYGYA00sL79weA660ta4vXs=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.43.14 with SMTP id q14mr5069356anq.11.1239484571058; Sat, 
	11 Apr 2009 14:16:11 -0700 (PDT)
In-Reply-To: <1239459193-21963-1-git-send-email-k.kooi@student.utwente.nl>
References: <1239459193-21963-1-git-send-email-k.kooi@student.utwente.nl>
Date: Sat, 11 Apr 2009 18:16:11 -0300
X-Google-Sender-Auth: c1318dceb19de6c4
Message-ID: <be7a9f3d0904111416u77ac3129q54860af97042ec14@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.44.157
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=AWL,BAYES_40,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [STABLE][PATCH] midori: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Sat, 11 Apr 2009 21:19:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Sat, Apr 11, 2009 at 11:13 AM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> From: Koen Kooi <koen@openembedded.org>
>
>
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
> =A0recipes/gtk-webcore/midori.inc =A0 =A0 =A0| =A0 =A01 +
> =A0recipes/gtk-webcore/midori_0.1.5.bb | =A0 =A02 ++
> =A02 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/gtk-webcore/midori.inc b/recipes/gtk-webcore/midori.=
inc
> index a241157..a7ed936 100644
> --- a/recipes/gtk-webcore/midori.inc
> +++ b/recipes/gtk-webcore/midori.inc
> @@ -9,3 +9,4 @@ SRC_URI =3D "http://software.twotoasts.de/media/midori/mi=
dori-${PV}.tar.gz"
>
> =A0EXTRA_OECONF =3D " =A0--disable-hildon "
>
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> diff --git a/recipes/gtk-webcore/midori_0.1.5.bb b/recipes/gtk-webcore/mi=
dori_0.1.5.bb
> index c1d1f66..61ecb08 100644
> --- a/recipes/gtk-webcore/midori_0.1.5.bb
> +++ b/recipes/gtk-webcore/midori_0.1.5.bb
> @@ -1,5 +1,7 @@
> =A0require midori.inc
>
> +PR =3D "r1"
> +
> =A0DEPENDS +=3D "python-native python-docutils-native"
>
> =A0SRC_URI =3D "http://goodies.xfce.org/releases/midori/midori-${PV}.tar.=
bz2 \
> --
> 1.5.6.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


