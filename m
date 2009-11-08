Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N7DoL-0001di-1D
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 20:52:32 +0100
Received: by bwz9 with SMTP id 9so2638162bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 11:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=kRMKZIQjpOu2QYPZEY1QzcsZBj7X/XVp6amPxHYVK9k=;
	b=VLTpQFG+I4b3jEvJk9MdGgL++xZz2Mb+UrqzrHDlQPPnu+7hrr6CuLPYSrI81KRp4u
	dTm6lmm0f80EItY/22v2aAnD66x0M2W6VD3G03O97oDUPdxwRzP8R9MtOAURhDoX7luo
	vXnGO74LexYSsQwwKtCz8M2QWUerOcpBHz/YE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=D56O7Mrgb3AkTKhEwKSdc39yjz2zfxB9Podm9J9iWaZw1uOkFS6Y2ihvSmXLduC0g0
	r1quCwKRMmstSYTNaNOXvL4OMwqTLsSVM5YZ5OQi6fKLHWpe/GNXhK9iqKjjjwxn1OV9
	6l80Y/mIa++08thECJVT7LErBIBT9bmon119Y=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.182.137 with SMTP id q9mr756052hbg.72.1257709872505; Sun, 
	08 Nov 2009 11:51:12 -0800 (PST)
In-Reply-To: <20091108161751.GA16449@ibawizard.net>
References: <1257689597-31831-1-git-send-email-ynezz@true.cz>
	<1257691795.25369.229.camel@lenovo.internal.reciva.com>
	<20091108161751.GA16449@ibawizard.net>
Date: Sun, 8 Nov 2009 17:51:12 -0200
X-Google-Sender-Auth: 142acd40d3baf1e5
Message-ID: <be7a9f3d0911081151i5cbbf852ob9d71dfdd24deed0@mail.gmail.com>
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
X-List-Received-Date: Sun, 08 Nov 2009 19:52:32 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Hello,

2009/11/8 Petr =A9tetiar <ynezz@true.cz>:
> Phil Blundell <pb@reciva.com> [2009-11-08 14:49:54]:
>
>> On Sun, 2009-11-08 at 15:13 +0100, Petr =A9tetiar wrote:
>> > This patch fixes this compile error:
>> > main.c:38:35: error: gdk-pixbuf/gdk-pixbuf.h: No such file or director=
y
>>
>> I wonder if you might be better off depending on gdk-pixbuf rather than
>> the full gtk+. =A0Does that work for you?
>
> Yes, it works for me. What should I do now, since the patch has been comm=
ited
> already? :-)

Make a new one and bump PR again ;-)

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


