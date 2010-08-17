Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OlGA5-0004V2-V8
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 09:00:57 +0200
Received: by gyd8 with SMTP id 8so2364741gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 00:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xPBWbU7wQiPtHCSFZGb2GIwBKlMa6StOANIuTJrWUas=;
	b=H+3C1gPdq3QrU1uhjEtjJPlp1U+luivzNMPI5k9tc7LENyPnHvQWQbKtU7rbAk81Mi
	aPBt0Uc4rRYE1LuKwLOjfOM6z7aaXMW9oXRmTJnei1E/7bqfM/pFXs9cG7jmoKjlCSGo
	DTbh0i8o33EHnEPVfGB5vjce4SAln0jd+vTrE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dU3u7AeWqWyUcwNBAYoao3zOBe556xJbAo9SEuwYCSyixunEW6TauaAPw2oESwXR++
	o/HcU06llElIOlUF6xcMk/MTEvbHx26gRDfs6Aa8RnWk3b/B3lVRK9vIX2Gf69tV8cIE
	n0yoSyR81YNfxwpHcWk17yClyY4jjkTy1oHgY=
MIME-Version: 1.0
Received: by 10.150.2.19 with SMTP id 19mr6567259ybb.53.1282028423728; Tue, 17
	Aug 2010 00:00:23 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Tue, 17 Aug 2010 00:00:23 -0700 (PDT)
In-Reply-To: <1281993972-8643-1-git-send-email-jkridner@beagleboard.org>
References: <1281993972-8643-1-git-send-email-jkridner@beagleboard.org>
Date: Tue, 17 Aug 2010 09:00:23 +0200
Message-ID: <AANLkTi=Op1aB0eY5B5XQj7c9TKFtZ2SD7cdEBYsD+6zR@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bison: add flex dependency
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
X-List-Received-Date: Tue, 17 Aug 2010 07:00:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/16 Jason Kridner <jkridner@beagleboard.org>:
> It seems that bison was missing this dependency. =A0I'm not 100% certain =
this
> is the right way to add it, so I'm leaving off my signed-off-by in hopes =
that
> someone will ack this who really knows.
>
> ---
> =A0recipes/bison/bison.inc | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/bison/bison.inc b/recipes/bison/bison.inc
> index 22672e2..d32f454 100644
> --- a/recipes/bison/bison.inc
> +++ b/recipes/bison/bison.inc
> @@ -3,12 +3,12 @@ HOMEPAGE =3D "http://www.gnu.org/software/bison/"
> =A0LICENSE =3D "GPL"
> =A0SECTION =3D "devel"
> =A0PRIORITY =3D "optional"
> -DEPENDS =3D "virtual/libintl"
> +DEPENDS =3D "virtual/libintl virtual/flex"
>
> =A0SRC_URI =3D "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
> =A0 =A0 =A0 =A0 =A0 file://m4.patch"
>
> -INC_PR =3D "r7"
> +INC_PR =3D "r8"
>
> =A0inherit autotools gettext
>
> --

It is my impression that virtual is only to be used if there can be
different packages acting as source (so different providers) (e.g. for
gcc, libc, u-boot, kernel etc)
AFAIK that is not the case for flex so I would just have written
DEPENDS =3D "virtual/libintl flex-native"

Anyway, I peeked in the code and I can confirm that a dependency on
flex exists. This went unnoticed until now as normally flex was
already dragged in by another package.
Either the change from Jason or the line I give above can have my ack.

Frans


