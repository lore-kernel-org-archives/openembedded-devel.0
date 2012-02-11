Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RwCwV-0002RU-Ri
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 14:24:43 +0100
Received: by eekd41 with SMTP id d41so1025083eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2012 05:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=L7E5eM9jl89TnMeJPDTyhEVa/lB9VGAqKydMXFZIu4U=;
	b=nFON+dF93QfdSjw0HNIVF63jrLSzWe/iDI7rm5X4bZoY+orjkX14m5iDrMJmDa8NcU
	9wv4xfsDfRqAEKRuO8Mgw8XCGbgIO1S6OfJBs0JAsf7MAecTCcM1EFAyxVs5tIUVaTxM
	0ads9poAv8AkQ6TDLWgfcwGKekOzWxPLyI4LA=
MIME-Version: 1.0
Received: by 10.213.14.147 with SMTP id g19mr953189eba.126.1328966196413; Sat,
	11 Feb 2012 05:16:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Sat, 11 Feb 2012 05:16:36 -0800 (PST)
In-Reply-To: <1328925603-2967-4-git-send-email-schnitzeltony@googlemail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-4-git-send-email-schnitzeltony@googlemail.com>
Date: Sat, 11 Feb 2012 11:16:36 -0200
X-Google-Sender-Auth: pZP8GVnAY68eI0z6ybV_nR-r9zY
Message-ID: <CAP9ODKo6e18R8+nuCs7yB+j22SUj3UNTno3c3pUHycVAfjS2PQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe 4/7] systemd.bbclass: automatically create packages set in SYSTEMD_PACKAGES
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
X-List-Received-Date: Sat, 11 Feb 2012 13:24:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Sat, Feb 11, 2012 at 00:00, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/classes/systemd.bbclass |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
>
> diff --git a/meta-oe/classes/systemd.bbclass
> b/meta-oe/classes/systemd.bbclass
> index 7ec4ca4..ffcabe9 100644
> --- a/meta-oe/classes/systemd.bbclass
> +++ b/meta-oe/classes/systemd.bbclass
> @@ -57,8 +57,17 @@ def systemd_after_parse(d):
>                                if systemd_services =3D=3D "":
>                                        raise bb.build.FuncFailed, "\n\n%s
> inherits systemd but doesn't set SYSTEMD_SERVICE / %s" % (bb_filename,
> service_pkg)
>
> +       # prepend systemd-packages not already included
> +       def systemd_create_package(pkg_systemd):
> +               packages =3D d.getVar('PACKAGES', 1)
> +               if not pkg_systemd in packages:
> +                       packages =3D "%s %s" % (pkg_systemd, packages)
> +                       d.setVar('PACKAGES', packages)
> +
>
>        systemd_check_vars()
> +       for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
> +               systemd_create_package(pkg_systemd)
>
>
>  python __anonymous() {
> --
> 1.7.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

