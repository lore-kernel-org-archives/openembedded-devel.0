Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N7ET7-0008Ho-9q
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 21:34:40 +0100
Received: by bwz9 with SMTP id 9so2659992bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 12:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Pn4RDbLA0HBPIXICa3xPCHaNjVdD9rJ+24Zm2gbjVsc=;
	b=ETFxcrwIPFwol/BpqFLFoOMmcRTW6+HS3bRUYRgoraus3GzAldlzy04wmIyB17cz2H
	e1M46kYa5APZ+KZVtk1fg9FiOW9vNoJHxv3rGHlPjocd3ZV4FRinXHEUkTr2AWdYOOEa
	yeN7z7A/s5xnFyAGSQ+qCucmRrVKEQRVtD2HU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=vE4bxxl7/O7Uou1UgmyHtillEbYEN7mRgoEsqC0F2l7WCGPwiiSSzqm7vHi+GQIpAU
	rTeHwFsaTFWPrazXeO3gaiOYwBNYNS7U+zelF0mTBy8gSRcS04O1GcscnYvuXenpO/LY
	TM4KksR7uQXUSttESp2Jz1EIMmdYb1bB1n6/I=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.182.145 with SMTP id q17mr661501hbg.136.1257712400821; 
	Sun, 08 Nov 2009 12:33:20 -0800 (PST)
In-Reply-To: <20091108195635.GB16449@ibawizard.net>
References: <1257689597-31831-1-git-send-email-ynezz@true.cz>
	<1257691795.25369.229.camel@lenovo.internal.reciva.com>
	<20091108161751.GA16449@ibawizard.net>
	<20091108195635.GB16449@ibawizard.net>
Date: Sun, 8 Nov 2009 18:33:20 -0200
X-Google-Sender-Auth: b23038b939114f6a
Message-ID: <be7a9f3d0911081233h4cd65b87x60b78f3929295d4a@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] libgsf: fix compile error, add missing dependency on 	gtk+
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
X-List-Received-Date: Sun, 08 Nov 2009 20:34:40 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Hello,

2009/11/8 Petr =A9tetiar <ynezz@true.cz>:
> Petr =A9tetiar <ynezz@true.cz> [2009-11-08 17:17:51]:
>
>> Phil Blundell <pb@reciva.com> [2009-11-08 14:49:54]:
>>
>> > On Sun, 2009-11-08 at 15:13 +0100, Petr =A9tetiar wrote:
>> > > This patch fixes this compile error:
>> > > main.c:38:35: error: gdk-pixbuf/gdk-pixbuf.h: No such file or direct=
ory
>> >
>> > I wonder if you might be better off depending on gdk-pixbuf rather tha=
n
>> > the full gtk+. =A0Does that work for you?
>>
>> Yes, it works for me. What should I do now, since the patch has been com=
mited
>> already? :-)
>
> I've encoutered few problems when using gdk-pixbuf as dependency, for exa=
mple
> when building Abiword which than needs gdk-linux-fb package as dependency=
, which
> is pulled in by EXTRA_OECONF =3D "--with-gdktarget=3Dlinux-fb" in gdk-pix=
buf package.
> So I think, that gtk+ in this patch is correct.

Maybe add a new package for gdk-linux-fb then?

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


