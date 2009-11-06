Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N6Ni2-0000TC-Jf
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 13:14:33 +0100
Received: by bwz9 with SMTP id 9so1051958bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2009 04:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=BwqupL+GCHogU+IIiBxh1/IEsLGuAHwP7OP8EnKeWcg=;
	b=m3kNHaE6J+jQaSWRR1Dhxqf3ylP6337DXV7ic/w2GzTWXo0u8zlzonxSVSaUFcXjKx
	3AGY05dOaDyep8sN/zDjA2mSj9ThIj0bhiGxTAt4QevDJ1R+3RZor1HdQuL8yUbJ1ZMH
	eOakXBIbx4PDY1Ve4nzwUa5mq/iOoqZDjC0/E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=vaH0ngVBd683Wp4zSJ3ht026QbXBb1YiqgtkrcBz+h3SA52i4RepdaFxBO+B1vEq7g
	qZj5jZXY8kuVt4SR/yToqSjoH0fh0ftH2NzRN77ypxhR1/Qo6q9RZdlTXvEIaysJSvZv
	WESVHVOz/X7SB9AmsQVWTWtYTNYC3vl0lpTRM=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.179.94 with SMTP id c30mr387938hbg.159.1257509596163; Fri, 
	06 Nov 2009 04:13:16 -0800 (PST)
In-Reply-To: <1257504486-7975-2-git-send-email-ynezz@true.cz>
References: <1257504486-7975-1-git-send-email-ynezz@true.cz>
	<1257504486-7975-2-git-send-email-ynezz@true.cz>
Date: Fri, 6 Nov 2009 10:13:16 -0200
X-Google-Sender-Auth: 70d4bcd748b790e9
Message-ID: <be7a9f3d0911060413i778aec0cpf2c618832437665a@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH][geodegx] geodegx: Fix glibc configure error
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
X-List-Received-Date: Fri, 06 Nov 2009 12:14:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Nov 6, 2009 at 8:48 AM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> Fix glibc configure error:
>
> | configure: running configure fragment for add-on nptl
> | checking sysdep dirs... configure: error: The geode subspecies of i486 =
is not supported.
> | FATAL: oe_runconf failed
>
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>

I use it this way here and it works. Which glibc version are you
using? In my case I'm using:

angstrom 2008 versions, plus:

PREFERRED_VERSION_gcc                    =3D "4.3.2"
PREFERRED_VERSION_gcc-cross              =3D "4.3.2"
PREFERRED_VERSION_gcc-cross-sdk          =3D "4.3.2"
PREFERRED_VERSION_gcc-cross-initial      =3D "4.3.2"
PREFERRED_VERSION_gcc-cross-intermediate =3D "4.3.2"

And I build in stable; but this is not supposed to affect it.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


