Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDAJg-0005oD-Px
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 07:25:57 +0100
Received: by iwn42 with SMTP id 42so7635956iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 23:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=S+fnK1PxtzfqbAAz9X/a88KeI4qAcf08Ij4JZUoP/PU=;
	b=lnOnscsloBhUEc5OjGMSwUfhfprPMm7SDbbFaUXZmjd6OU0LZ/eTItGaNOKMO/VsLf
	8B3x0FYezNCmtO6/41QOyDZUTXkflewn205TgPBhO4sFiqDWSk8bv1rfnxfD8wmTgFcW
	v3lGLudBGiSB9E1Ir8LS/oP1CbtbxNO6x5VOg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=G69fK4JKW/kFJgW7DqG6GC/Hi3yuDqL5ZPGPzi+IRihnL3tvRMpXdRmjv2AuQQzl9h
	XJqT+2INMcu8nCjEqC6xMUwlLrcLNzVsH2Sh7/Kh2rtlMLjE2KHxjmunxdMssTJS/yFx
	YZdr+ZyReHfMTsPqhXC3JnuHxOacyjq3GUOi0=
MIME-Version: 1.0
Received: by 10.231.191.6 with SMTP id dk6mr14499807ibb.51.1288679108608; Mon,
	01 Nov 2010 23:25:08 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 23:25:08 -0700 (PDT)
In-Reply-To: <4CCF64A1.80506@gmail.com>
References: <4CCF64A1.80506@gmail.com>
Date: Tue, 2 Nov 2010 07:25:08 +0100
Message-ID: <AANLkTinoHWmP=NmDT_FvcUJoqzvo4pdUu92qnscj=_8x@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] telepathy-gabble_0.7.27.bb: Add libsoup-2.4 to DEPENDS.
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
X-List-Received-Date: Tue, 02 Nov 2010 06:25:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/2 Graham Gower <graham.gower@gmail.com>:
> checking for SOUP... configure: error: Package requirements (libsoup-2.4)=
 were not met:
> No package 'libsoup-2.4' found
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Good find!

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


> ---
> =A0recipes/telepathy/telepathy-gabble_0.7.27.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/telepathy/telepathy-gabble_0.7.27.bb b/recipes/telep=
athy/telepathy-gabble_0.7.27.bb
> index 3f250a3..896b467 100644
> --- a/recipes/telepathy/telepathy-gabble_0.7.27.bb
> +++ b/recipes/telepathy/telepathy-gabble_0.7.27.bb
> @@ -1,6 +1,6 @@
> =A0DESCRIPTION =3D "Gabble: a Jabber/XMPP connection manager"
> =A0HOMEPAGE =3D "http://telepathy.freedesktop.org/wiki/"
> -DEPENDS =3D "glib-2.0 dbus loudmouth telepathy-glib"
> +DEPENDS =3D "glib-2.0 dbus loudmouth telepathy-glib libsoup-2.4"
> =A0LICENSE =3D "LGPL"
>
> =A0# gabble.manager needs to get regenerated every release, so please don=
't copy it over blindly
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


