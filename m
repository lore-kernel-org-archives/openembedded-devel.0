Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N6oah-0002ry-Bp
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 17:56:46 +0100
Received: by bwz9 with SMTP id 9so2056200bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 08:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=KTN7xkTfYO9EIjORrYhrNoqrmsrxRXkmTBgvOP9DIuM=;
	b=HcP7Aa6JYemYfDJKIs21am/G8A9t63YOMArgsBr/OP+0CvzCZTLY8EB3JIUc2Vbrn3
	w0cBEbLNTDkPE2edvtInF+JttzNnadNHqNqwPvhIYlJBVHJJN1yxHo21B+IfB7ndi8mb
	3EhW//RHJCg84kw0vScK4soNHd+jwdnT7okBQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=xbaNIMiFVV1BtImBBOZeEk7g4btlYsavX56Yb+2Ysd0b2vjs+kRieq4May8LmMeyEb
	t47djq5ORdAWBy9/4GXHNcd47kP0AOJgATY5Ww1843VbFVP6mY7+p34/R1dOFbZ4j4PG
	3ECDqxyNnGreCpGUclAaROa6OZWwdQ04et9vc=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.156.14 with SMTP id k14mr251814hbc.152.1257612928261; Sat, 
	07 Nov 2009 08:55:28 -0800 (PST)
In-Reply-To: <20091106140709.GB25214@ibawizard.net>
References: <1257504486-7975-1-git-send-email-ynezz@true.cz>
	<be7a9f3d0911060409u60dbf7ecg8b174c3b55441188@mail.gmail.com>
	<20091106140709.GB25214@ibawizard.net>
Date: Sat, 7 Nov 2009 14:55:28 -0200
X-Google-Sender-Auth: 82589daaf2a91cae
Message-ID: <be7a9f3d0911070855o15abf90ehc014bc55d4e58f5a@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH][geodegx] geodegx: Linux 2.6.31.4
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
X-List-Received-Date: Sat, 07 Nov 2009 16:56:46 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Hello Petr,

2009/11/6 Petr =A9tetiar <ynezz@true.cz>:
>> You don't need to rdepends on the kernel and bootloader. In my case
>> for example, I use a initrd and don't need to have the kernel in the
>> image of rootfs; another issue, I use syslinux.
>
> Ok. I'll make my custom machine file.

Cool ;-)

>> Besides, machine changes are another commit; please use one commit for
>> kernel recipe and other to the machine changes.
>
> True, I'm sorry, it's my local modification. Would you revert/fix it in .=
dev, or
> should I provide patch? Thanks.

Please provide the patches and I can push them to you; maybe you might
get commit access to do it yourself? :-)

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


