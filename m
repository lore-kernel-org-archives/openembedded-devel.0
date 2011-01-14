Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PdnXz-0000Np-Q1
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 18:34:47 +0100
Received: by eya28 with SMTP id 28so1451905eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jan 2011 09:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gjhJkhsGx0Ml/RC4hVAJ+TRRHb7nPqHeB3L7Yl01uvE=;
	b=x1sSZHkZxZnCEdLbOwlCeK232Rj9woP33E0dqk1IqIMBiOQ2QMcfsPFoPLikS2yaO0
	bOJZkVjgqBHI8wjHp6PaRAARHzcUrOITkSXClyKxTQklDi810ATCbQYhjZEL8yLvkin+
	yKxck9P8ooxM5eMw7SLl9O0sJIu1s2PVTFjUE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=l7dBUfiVw/2uXoLmtOtwl2UXo5DaYGoimEfjocT/PtW7OfqeHAS7Y49xnaO5NX90cK
	Vwg2cgZA4k61NuggWvRaCf/pBN+STwY4/xgrjTLJMlUA5vnGnWW4KeTLgXXCkgn4bD4i
	lDBpMwVmsJVaMx6zkKsLg7EPZt5bfsdIsVZ7o=
MIME-Version: 1.0
Received: by 10.204.119.133 with SMTP id z5mr812786bkq.72.1295026454227; Fri,
	14 Jan 2011 09:34:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Fri, 14 Jan 2011 09:34:14 -0800 (PST)
In-Reply-To: <AANLkTink4Hrjj0dCqj6j=4wMrrX13VrLmHxZiVNy_Dqw@mail.gmail.com>
References: <AANLkTi=npHcRdA9ehZLYendfUinkE30X_1L6DOLYGBBB@mail.gmail.com>
	<AANLkTi=p4U3CFO1sMP5mW-EKC-R5nHLqC=0QrN4kXnZK@mail.gmail.com>
	<AANLkTink4Hrjj0dCqj6j=4wMrrX13VrLmHxZiVNy_Dqw@mail.gmail.com>
Date: Fri, 14 Jan 2011 15:34:14 -0200
X-Google-Sender-Auth: sDm7ZRqU-U70L_G17JTCG5CAH-w
Message-ID: <AANLkTimF0ftpbOSYa_=93Z5a8cSRJB_4zWLRsWfMeaNr@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Use of 'sem_open' failing
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
X-List-Received-Date: Fri, 14 Jan 2011 17:34:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2011 at 20:02, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> It seems that if OLDEST_KERNEL is older then 2.6.13 eglibc ends not
> enabling sem_open.

This didn't fix the issue.

It seems sem_open is available, as can be see:

otavio@neumann:~/hacking/ossystems/oe/tmp/work/i586-oe-linux/eglibc-2.12-r2=
1.8+svnr12323/packages-split$
LC_ALL=3DC grep sem_open eglibc/lib/*
Binary file eglibc/lib/libpthread.so.0 matches

However the application still fails.

My OLDEST_KERNEL was set to 2.6.31 so more then enough for NPTL
support. Any idea of why it keep failing?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


