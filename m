Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N6oWN-0002kI-5X
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 17:52:18 +0100
Received: by bwz9 with SMTP id 9so2054025bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 08:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=40kkP9pg4aAyFFPgSKNGg/fEORvZltV8bb/BwPCsr6E=;
	b=sq+L4sWFO/uvfOmf55SaD1ns0WVQXNPzmoc+3cRlmfFpqdQHTjGOflytiw2zcM0wnU
	6l5Sqk2eLe5unlfBRd2bj8kPmUBHfpkIQP9IxEWux+p2RtnjR9VEGaew4jUBrjXlbVP0
	JW+H1vh/+EMfwTEtpNULdgVwSiJf29yyJeors=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=jmtaQqNrnUdJcQIe3D6cOZjdY57JjG2T5DAyw0PhQGjkZ6cojinCTLwd1QYNp0Ek+y
	GZbqAXx+LxfyFYFtiPpJJW/L53qz/n8+GyGg81+fA8OXKZmOEFTwQttl+Mzwv13QMKRn
	e6CcoZWr3prw79ng1i04j/5X+cf7rx1ddaB5w=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.160.131 with SMTP id c3mr29445hbd.82.1257612223341; Sat, 
	07 Nov 2009 08:43:43 -0800 (PST)
In-Reply-To: <1257536522-11924-3-git-send-email-ynezz@true.cz>
References: <1257536522-11924-1-git-send-email-ynezz@true.cz>
	<1257536522-11924-2-git-send-email-ynezz@true.cz>
	<1257536522-11924-3-git-send-email-ynezz@true.cz>
Date: Sat, 7 Nov 2009 14:43:43 -0200
X-Google-Sender-Auth: 3e9ac66ce1f37349
Message-ID: <be7a9f3d0911070843w78f620abtbb4ee96db6e5f6c0@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] xf86-video-geode: update to 2.11.6
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
X-List-Received-Date: Sat, 07 Nov 2009 16:52:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Nov 6, 2009 at 5:42 PM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> +COMPATIBLE_HOST =3D 'i.86.*-linux'
> +DESCRIPTION =3D "X.org server -- Geode GX2/LX display driver"
> +
> +RDEPENDS_append_iei-nanogx-466 +=3D "xserver-xorg-module-libint10 xserve=
r-xorg-module-xaa "

IMO it could be added as regular RDEPENDS since the driver depends on
that when running on GX and exa when on LX (exa might be added here
too).

And this avoids a machine specific package.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


