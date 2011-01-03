Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PZqm6-0005Y9-Vr
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:13:03 +0100
Received: by iyj18 with SMTP id 18so13038166iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 12:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=584wFhTRTXZPvCyBl+B3GxIsy2S03KrSSN17aOycPRk=;
	b=miX/je/vX7r4uvrG9wVAUzdSX4lWVV5bIQZxB9+tsdmCtHQaWLIpbE0QbGYFAQKd4/
	hLyq4AjUuVG7NVNzQaW8BoyaG5sNCCnDYtiE70H4hLMZq8Terr2pnWeVpgF/OebZ1mcI
	7DzztIxpmbqu1vbhjKR9kFyaRqjeSDduaZqaw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=keOsVYIotFLwRhNMskyum7kcTofhCW5q9T9fD6ICRrBkvwaWE1njsYHHtOHxbJJNBv
	6icXGmQ5jF1kDiod8wd2D7/5Wlb+TLM+Vy9GvVmCDn3jS/50FU9QdchaaVKo/hjl/nz9
	giU/aPPYalH0ky6IzwfRk9Uddip5vhbB88vno=
MIME-Version: 1.0
Received: by 10.231.37.70 with SMTP id w6mr10992518ibd.169.1294085555418; Mon,
	03 Jan 2011 12:12:35 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Mon, 3 Jan 2011 12:12:35 -0800 (PST)
In-Reply-To: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
Date: Mon, 3 Jan 2011 21:12:35 +0100
Message-ID: <AANLkTimnZSAORNy5urEfhy7XvXNEY1t9a9_7T5k-tMmZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 01/12] gstd: fix type in RRECOMENDS
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
X-List-Received-Date: Mon, 03 Jan 2011 20:13:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/3 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>:
> /RRECOMENDS/s/COM/COMM/
>
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/gstd/gstd_git.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/gstd/gstd_git.bb b/recipes/gstd/gstd_git.bb
> index 5e73662..4617b85 100644
> --- a/recipes/gstd/gstd_git.bb
> +++ b/recipes/gstd/gstd_git.bb
> @@ -25,7 +25,7 @@ do_configure() {
> =A0}
>
> =A0RDEPENDS_${PN} =3D "dbus dbus-glib gstreamer gst-plugins-base"
> -RRECOMENDS_${PN} =3D "gstreamer-ti"
> +RRECOMMENDS_${PN} =3D "gstreamer-ti"
>
> =A0FILES_${PN} +=3D "${datadir}/dbus-1/*/*.service"
> =A0FILES_${PN}-dev +=3D "${datadir}/dbus-1/interfaces/*.xml"
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


