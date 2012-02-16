Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyQb-0006Ph-4K
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:19:05 +0100
Received: by vbbff1 with SMTP id ff1so1549706vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=rEAQwXBbJ1QPjAswht/LfDVH+MDmw0N2hZLf14PzZSs=;
	b=CyuJZ7a791blGw/ZwUXmmqU42ySi3QuedG/b4R/3hZj4ItVAJUkZPEZCXpPPHkUPQZ
	yxpVYW9ivAK4ZdPXbZWIa1VKp6pC4MTSLesn13nvP+BoKyWeBB9N9i2Zvx+Bof7uTYKk
	+26TvKZPl3U36xptKqZDjh7QG93YL4B+xmS5g=
MIME-Version: 1.0
Received: by 10.220.157.83 with SMTP id a19mr974944vcx.54.1329387046080; Thu,
	16 Feb 2012 02:10:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:10:46 -0800 (PST)
In-Reply-To: <1329357796-27398-23-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-23-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:10:46 -0200
X-Google-Sender-Auth: fGgayJRpHZ9prXS8Vn0pd-siGrI
Message-ID: <CAP9ODKoy3RRkOAjkGQXUnMw9EaU2rXasxw3bvWU+UrdhAJL53Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 22/22] gpsd: use ${PN}.service instead ${PN}.socket in SYSTEMD_SERVICE to enable service
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
X-List-Received-Date: Thu, 16 Feb 2012 10:19:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

>  SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "${PN}.socket"
> +SYSTEMD_SERVICE =3D "${PN}.service"
>

Why?

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

