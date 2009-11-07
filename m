Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N6ocy-0002xO-AX
	for openembedded-devel@openembedded.org; Sat, 07 Nov 2009 17:59:07 +0100
Received: by bwz2 with SMTP id 2so3016314bwz.20
	for <openembedded-devel@openembedded.org>;
	Sat, 07 Nov 2009 08:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=4BMdPT4iv3FiDS/uMoezpzaUz1Hn+gH7KdiTlrqCqNg=;
	b=BWAz9SDIoRZoJg/3KVxjEYNtoSRkNgSN6P9U+7GFGHXZe/0jtbZ6BQUvmRaMW+X39p
	4zOr3ICruTKblCkHC2DuC7+WC0rzwne6dL0FR/nrbMWpEAuGnrEtY1ivRXdP96yICVX6
	zit0WwCS8fbr+m51QICFQjiWFPiDhBmC+UJrI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=oRgFp9npwy5Y1Sm/93mwZDb0oPE9Bu0gRvVH2WtWmzL8//yO+azb9DM1gQVVSr1WY1
	g1n0ZlpMqKEQvGgfdQD4GzRJZp8KKN6sO9UEZTaxSxCUi8ucBoHn7sswvRTN6e9o6CT6
	X4+HlyyDGGNr0+kKUaw0/vVD/5SBPUF4jgaxc=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.160.131 with SMTP id c3mr30259hbd.82.1257613069069; Sat, 
	07 Nov 2009 08:57:49 -0800 (PST)
In-Reply-To: <20091106140519.GA25214@ibawizard.net>
References: <1257504486-7975-1-git-send-email-ynezz@true.cz>
	<1257504486-7975-2-git-send-email-ynezz@true.cz>
	<be7a9f3d0911060413i778aec0cpf2c618832437665a@mail.gmail.com>
	<20091106140519.GA25214@ibawizard.net>
Date: Sat, 7 Nov 2009 14:57:49 -0200
X-Google-Sender-Auth: c78c07e0fde136f3
Message-ID: <be7a9f3d0911070857t179c5c31o7f066945c5738917@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.210
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
X-List-Received-Date: Sat, 07 Nov 2009 16:59:07 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Hello,

2009/11/6 Petr =A9tetiar <ynezz@true.cz>:
> I build dev and I found this fix on the web using Google, now looking it =
up
> again I found yours and Hrw's conversation on #oe http://pastebin.com/f66=
40d6f7
> It seems, that it's 4.3.3 issue?

Yes; you and hrw are the two persons that found it; maybe it is gcc
related indeed; while you're on it, do you mind to test it?

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


