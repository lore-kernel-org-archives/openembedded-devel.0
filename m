Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N6oT1-0002bm-L0
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 17:48:50 +0100
Received: by bwz9 with SMTP id 9so2052338bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 08:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=LlgG8n48yGXdjYP4clCxBNwWSq5L5/R3+Swix9BHtU4=;
	b=dby3FQRm7YWmNm8aGPyOzHH9fjEPaQ7VIFNm0X1BNTP77VUiO7RC8GBuQZjfhdQRhY
	5mskvWAF47/9e5icYzQGk/UWeVEpkWvSAjPDTJZWfoR4rEgFddxcwkkGtYEgfkduVq70
	EX7W+PqarDU+wBHHyohOAjDmkLse3aqcWBXWY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=cNgDcf1k66iwt07PlJiwjv2hGgOW2mZLUfWgTmVZ8zXY4jIl2oZYHYiKcutcEO2lOc
	z5gd4ODU3iEsQRVXpRj6qLmSFLx5glFQfFDiV1M+LcYEIYjavppG+kxn+5/yO/YO7Lj8
	kC+sRfqKeNKklTmEII3UYz/OALA4UxBV76ja0=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.182.137 with SMTP id q9mr635034hbg.72.1257612452268; Sat, 
	07 Nov 2009 08:47:32 -0800 (PST)
In-Reply-To: <1257536522-11924-1-git-send-email-ynezz@true.cz>
References: <1257536522-11924-1-git-send-email-ynezz@true.cz>
Date: Sat, 7 Nov 2009 14:47:32 -0200
X-Google-Sender-Auth: f7c9c39e00091f84
Message-ID: <be7a9f3d0911070847v3aa17637i5505f6dfd94f646@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Machine configuration for IEI Nano GX-466
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
X-List-Received-Date: Sat, 07 Nov 2009 16:48:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Nov 6, 2009 at 5:42 PM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> +XSERVER =3D "xserver-xorg \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-evdev \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-mouse \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-tslib \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-video-geode \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-keyboard"

xaa and int10 might be added here since you're using XSERVER variable here.

So ignore my suggestion to RDEPENDS on them in xf86-video-geode.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


