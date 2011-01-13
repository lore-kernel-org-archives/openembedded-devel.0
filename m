Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PdLyS-0000NV-8i
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 13:08:16 +0100
Received: by bwz10 with SMTP id 10so1409387bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 04:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=tPEo9A0I6wnQiPcS+dPPtXSa8shp54zDfNUg5n0bz8I=;
	b=C07RNSNyHMGappGBP4qFg4/0CtfjrbxpZANopnbtOqFDow3LZ/+QVPMv2z+smAckrS
	1WbVStNbHaGTbGNoOGDP5B23lYaopUruV2Y5SShXiO9fSU0Omt7ihLBWePuq32bxq7a7
	7r/kUN4QeFk2EnuJV8OKPjgWfDH6vvuFQ50mc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=WNV0AWLPmNX+SMNXB9gZsA+aIFLFt7NIcZfgjPJRTOmZbNMW1ZlpFzU67kvpgPJpHd
	PHwdUQZjepsqO//+DuN0/KBkF462g6c+G9C3X5ojhUNadSq4ug2/rvFjab0miBXupHss
	y6XaNpW7/S6H7NIRzkuvepPyxJDU/N4W1Refk=
MIME-Version: 1.0
Received: by 10.204.101.81 with SMTP id b17mr1733811bko.126.1294920465276;
	Thu, 13 Jan 2011 04:07:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Thu, 13 Jan 2011 04:07:45 -0800 (PST)
Date: Thu, 13 Jan 2011 10:07:45 -0200
X-Google-Sender-Auth: 4c4QIb8EpunHWpcNYsI6VKLa-M8
Message-ID: <AANLkTi=npHcRdA9ehZLYendfUinkE30X_1L6DOLYGBBB@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Use of 'sem_open' failing
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
X-List-Received-Date: Thu, 13 Jan 2011 12:08:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I am having trouble to use an application (freerdp) that calls sem_open met=
hod.

The application has been converted to use sem_open to fix a
portability issue with MacOS X and it works fine on my Debian but
fails on the OE built image.

Do someone knws what I am missing here?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


