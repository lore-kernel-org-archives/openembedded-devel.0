Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKRcS-00009S-Jq
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:48:13 +0200
Received: by mail-fx0-f47.google.com with SMTP id 9so591728fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QLkXeV1rwKhAHzySe28vVgsy4vB3gHEUL4oeGP2YNc4=;
	b=LQgAHw9HCaREiEpiORxICwAZyhKZ5kX8LQuQm+X7nqewsfT+BGbLE9sMpVIsr9NSLL
	hzVEzuxSeiidrXtWtyoxpzBygvVAIR3U4Lja6PE7Bk775sKPgVFncIVjaCozlKt8bq9q
	ZU5xX41IsnLEc0drPztM275+RNbDjkAUZBK6Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Y+jeC/cxXIj5krkeCZ5mGbaBMt6vP+UCxv+TO5ToVb+wQiOKOewILjm15GDhrw49Se
	HHFg3INDvKRHrZnxdDxeUZYTtxWbtYX/XA8v7DWyS7gN05qoxtaX+4mIPKsDR9WLbXid
	hYlGbHyv7zWtDLjozF3noSVMpviP3PrB95X34=
MIME-Version: 1.0
Received: by 10.223.98.19 with SMTP id o19mr11388763fan.80.1275637374312; Fri, 
	04 Jun 2010 00:42:54 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 00:42:54 -0700 (PDT)
In-Reply-To: <1275510896-30845-16-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-16-git-send-email-raj.khem@gmail.com>
Date: Fri, 4 Jun 2010 09:42:54 +0200
Message-ID: <AANLkTikGVUIwaPm9gT0urY2EEApWbKS-exJfQzf_CkQM@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 15/16] libx11_1.3.2.bb: Add -fforward-propagate on arm.
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
X-List-Received-Date: Fri, 04 Jun 2010 07:48:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> * Needed on -O1 compile. Generally we use -Os where
> =A0this option is already enabled. But we enable is anyway
> =A0so it gets picked at -O1 too which we use with DEBUG builds.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> =A0recipes/xorg-lib/libx11_1.3.2.bb | =A0 =A08 +++++++-
> =A01 files changed, 7 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/xorg-lib/libx11_1.3.2.bb b/recipes/xorg-lib/libx11_1=
.3.2.bb
> index 855dfa2..291486b 100644
> --- a/recipes/xorg-lib/libx11_1.3.2.bb
> +++ b/recipes/xorg-lib/libx11_1.3.2.bb
> @@ -5,7 +5,7 @@ DEPENDS +=3D "bigreqsproto xproto xextproto xtrans libxau=
 xcmiscproto \
> =A0 =A0 =A0 =A0 =A0 =A0 libxdmcp xf86bigfontproto kbproto inputproto xpro=
to-native"
> =A0PROVIDES =3D "virtual/libx11"
> =A0PE =3D "1"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0XORG_PN =3D "libX11"
>
> @@ -15,6 +15,12 @@ SRC_URI +=3D "file://x11_disable_makekeys.1.6.3.patch =
\
>
> =A0EXTRA_OECONF +=3D "--without-xcb --with-keysymdef=3D${STAGING_INCDIR}/=
X11/keysymdef.h"
>
> +# Below option is added to overcome the GCC bug on ARM
> +# see http://gcc.gnu.org/PR42981 for further details.
> +# We could potentially take it off when its fixed in gcc 4.5
> +
> +CFLAGS_append_arm =3D " -fforward-propagate "
> +
> =A0do_compile() {
> =A0 =A0 =A0 =A0(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLA=
GS CXXFLAGS
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


