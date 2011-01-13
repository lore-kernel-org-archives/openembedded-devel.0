Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PdUfx-000078-ET
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 22:25:45 +0100
Received: by bwz10 with SMTP id 10so1921421bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 13:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MEJg4wYeqUWktXgPadoV9mKITv5QVNo4sDhU80ikfAs=;
	b=eKxhHTvCv3eK8D6tjHS9tghm+DzAU7gDM8dBJfxP9dSJ+p2QmzrQcfV3qt6umOJ0HB
	+8L4vLoHMsYN8e0m20imVpwIXm6ejCDgKRJcghfzucTcXX2mwlCBjEaXkDOLVq7D08K9
	16zWR9MDmED5/4whr7Pa/GL9uEIMraG1WjdRo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=vpe/w1gGzSLtosZNHT07Xbq7npNkDX6OMbedW9UFsu7CakVNKAvPrBxpFHZRE56EiU
	caf0Lkix7l23Szgic1SWHSy28yO/gIUBGhtpjQHiDjoedyizqNLdsOL3M8mMdLlDMH1h
	aLmdJuElv6xfHtlEVZu9gh9u9tyQWLAEz1Z+o=
MIME-Version: 1.0
Received: by 10.204.129.83 with SMTP id n19mr2165769bks.207.1294953910369;
	Thu, 13 Jan 2011 13:25:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Thu, 13 Jan 2011 13:25:10 -0800 (PST)
In-Reply-To: <1294953575-30765-1-git-send-email-obi@opendreambox.org>
References: <1294953575-30765-1-git-send-email-obi@opendreambox.org>
Date: Thu, 13 Jan 2011 19:25:10 -0200
X-Google-Sender-Auth: 41YsZL3yNKxGqssIc3PkDUhf11s
Message-ID: <AANLkTi=eBxHQ2dSHfPDoJafV+E1Jj2KqWHqXUNXsdrnT@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libcap2: add libpam to DEPENDS
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
X-List-Received-Date: Thu, 13 Jan 2011 21:25:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Jan 13, 2011 at 19:19, Andreas Oberritter <obi@opendreambox.org> wr=
ote:
> * Fixes the following compile error:
>
> pam_cap.c:19:34: error: security/pam_modules.h: No such file or
> directory
> pam_cap.c:20:34: error: security/_pam_macros.h: No such file or
> directory
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/libcap/libcap2_2.16.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/libcap/libcap2_2.16.bb b/recipes/libcap/libcap2_2.16=
.bb
> index 97b03d5..be0788e 100644
> --- a/recipes/libcap/libcap2_2.16.bb
> +++ b/recipes/libcap/libcap2_2.16.bb
> @@ -2,8 +2,8 @@ DESCRIPTION =3D "Libcap is a library for getting and sett=
ing POSIX.1e (formerly PO
> =A0PRIORITY =3D "optional"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "GPL"
> -DEPENDS =3D "bison-native flex-native attr"
> -PR =3D "r2"
> +DEPENDS =3D "bison-native flex-native attr libpam"
> +PR =3D "r3"
>
> =A0BUILD_CFLAGS +=3D "-I${S}/libcap/include"
> =A0CFLAGS +=3D "-I${S}/libcap/include"
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


