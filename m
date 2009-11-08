Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N79QK-00024N-HC
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 16:11:27 +0100
Received: by fg-out-1718.google.com with SMTP id e12so349124fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 07:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=I6+9hHY8oYX5JM6cPiwBFCuj6m44jHdKGdT/SHaCGEw=;
	b=Puz1FLoPFK40R2IydR0MgX6ZncXnwEZtDh7IQORa9wh6XbwS0Rh4f/qOFTQCbHCjWB
	aBJ2HEnnUL26ngYjuTNTs1oj7y+W/y6qUFUPf6WWyFwHSLicf879yWe/90+Y/RtXLuSZ
	nsglW8Q7qdnwEihzchLbhDKoC4EuuQVAFJLwQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=LCRx19eoR0KncYqip96Tq16D01cJFfmhU44vczNxYXUBaikZoU7+eXdjhNNw9WuDbX
	okWtI/TXpQfx73UAFdS9MUHkCSTfKNnPN+VPHYiHKnyTFfGAcpUkhLMoVxW7Trr/oChR
	nvcJgDiznzDDj0gfzKdM0mBsj1NwkxkU+ZIOQ=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.162.129 with SMTP id l1mr628871hbd.206.1257692547817; Sun, 
	08 Nov 2009 07:02:27 -0800 (PST)
In-Reply-To: <1257689597-31831-2-git-send-email-ynezz@true.cz>
References: <1257689597-31831-2-git-send-email-ynezz@true.cz>
Date: Sun, 8 Nov 2009 13:02:27 -0200
X-Google-Sender-Auth: 430f3e90d61b5d28
Message-ID: <be7a9f3d0911080702m6548df86vdc76f775e28254db@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] obex-data-server: fix compile error, add missing 	dependency on gtk+
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
X-List-Received-Date: Sun, 08 Nov 2009 15:11:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Please check if gdk-pixbuf depends is enough for you.

On Sun, Nov 8, 2009 at 12:13 PM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> This patch fixes this compile error:
> ods-imaging-helpers.c:32:35: error: gdk-pixbuf/gdk-pixbuf.h: No such file=
 or directory
>
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
> ---
> =C2=A0recipes/openobex/obex-data-server_0.4.4.bb | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/openobex/obex-data-server_0.4.4.bb b/recipes/openobe=
x/obex-data-server_0.4.4.bb
> index 34efcc7..555f6df 100644
> --- a/recipes/openobex/obex-data-server_0.4.4.bb
> +++ b/recipes/openobex/obex-data-server_0.4.4.bb
> @@ -1,7 +1,7 @@
> =C2=A0DESCRIPTION =3D "obex-data-server is a D-Bus service providing high=
-level OBEX client and server side functionality"
> =C2=A0LICENSE =3D "GPLv2"
>
> -DEPENDS =3D "bluez4 dbus-glib openobex"
> +DEPENDS =3D "gtk+ bluez4 dbus-glib openobex"
>
> =C2=A0SRC_URI =3D "http://tadas.dailyda.com/software/obex-data-server-${P=
V}.tar.gz"
>
> --
> 1.5.6.3
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


