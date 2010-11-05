Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PETj5-0004tb-CU
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 22:21:41 +0100
Received: by gxk19 with SMTP id 19so668536gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 14:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Yx5wibHP2TGS2uwu7g/SMGgyuC3bmAK0B+ImXe59zWM=;
	b=SPFTlebpEiX4yVLkL31yBiHBoV0i44dIlOMgoWN624xOijitL3yCYyRE9FI/H7vULp
	ldH1Zd1+AtbOunZNZUk8GiD3ycnsAXQ1ehYADH+YvlKaLwiar7nQuVNo4SQ057FzN+ca
	kgKG0f5KnYlsbY+fVsSGk4eX0+f/Vgd+r2+Ek=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ISETHYgFxgIGC6jHQGbAhqRz4uEjBcBxdC/yM9YmNzHM82bhkxjaTYU9n0OaKAk8ra
	XYzZNjhHLwNrPipaLwn7eyOQYukI5u/D2DzY2xrqXF1BdACLR9amH5bIyyFxCcOv5Q95
	YuCOsHkoExYoXineHAsg2HHZ/ssOe/YPoS5DA=
Received: by 10.91.45.8 with SMTP id x8mr1866981agj.199.1288992039385; Fri, 05
	Nov 2010 14:20:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 5 Nov 2010 14:20:17 -0700 (PDT)
In-Reply-To: <1288987411-14231-1-git-send-email-khimov@altell.ru>
References: <AANLkTi==Pf6K0p48n8cJhMnws6=43qGrX5HAPRgYyJaj@mail.gmail.com>
	<1288987411-14231-1-git-send-email-khimov@altell.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Nov 2010 14:20:17 -0700
Message-ID: <AANLkTimxqhQ-++85O+GMHEcwiT5PPyADicbuuKumcCOo@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openldap: fix ltmain.sh location
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
X-List-Received-Date: Fri, 05 Nov 2010 21:21:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 5, 2010 at 1:03 PM, Roman I Khimov <khimov@altell.ru> wrote:
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/openldap/openldap_2.4.23.bb | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/openldap/openldap_2.4.23.bb b/recipes/openldap/openl=
dap_2.4.23.bb
> index 3ac15f6..f8f3fb5 100644
> --- a/recipes/openldap/openldap_2.4.23.bb
> +++ b/recipes/openldap/openldap_2.4.23.bb
> @@ -188,7 +188,7 @@ DEPENDS =C2=A0 =C2=A0 =C2=A0+=3D "${OPENLDAP_DEPENDS}=
"
> =C2=A0CPPFLAGS_append =3D " -D_GNU_SOURCE"
>
> =C2=A0do_configure() {
> - =C2=A0 =C2=A0 =C2=A0 cp ${STAGING_DATADIR}/libtool/config/ltmain.sh ${S=
}/build
> + =C2=A0 =C2=A0 =C2=A0 cp ${STAGING_DATADIR_NATIVE}/libtool/config/ltmain=
.sh ${S}/build
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${S}/libtool
> =C2=A0 =C2=A0 =C2=A0 =C2=A0aclocal
> =C2=A0 =C2=A0 =C2=A0 =C2=A0libtoolize --force --copy
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


