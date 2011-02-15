Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpIc5-0004yG-Gy
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 11:58:33 +0100
Received: by bwz10 with SMTP id 10so287556bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 02:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7Y/yh4bTIUfaPW+A34+/XFBIHxBWjtzuQkviJQkDZgk=;
	b=T1xWLS1prMb8gfJ+s5Rq8p1BFWlNv2BiY5yzDd6rJ+t/2gdJBPHDkyyUuBYPSs6R65
	iGtbzt3+0Y4tdelaPZ062iXmLpH3TlmPduPTsPPwQ+MYWkfwPX83KhKGlntTkizvDKhn
	xO/OpPkoyL2AfY8vx0RVuripdMBd0ST0Zkkpg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Hb6HsE36DM2vCKYwKquwDPD8E6MhBGeMFuaUylOcMbHu9FZxsFOr5G+Qp8HH81PW9i
	Ri5igrv9fdGJZAb0IujRr6l/qMVsv+M2O5ptpHRyL2HPvTyQFKRNkBQv8u9FV3hFvKU2
	P08T/iuE2bd6V1ikxgVgNeXqasJapo18dZ8/o=
MIME-Version: 1.0
Received: by 10.204.47.227 with SMTP id o35mr25981577bkf.132.1297767443429;
	Tue, 15 Feb 2011 02:57:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 15 Feb 2011 02:57:23 -0800 (PST)
In-Reply-To: <4D5A4E56.7040209@eukrea.com>
References: <AANLkTinN1b=egyKPv6N3rHq1HODKDyK15B22=1qBZcMZ@mail.gmail.com>
	<4D5A4E56.7040209@eukrea.com>
Date: Tue, 15 Feb 2011 10:57:23 +0000
X-Google-Sender-Auth: 9rePA08UBBDp-sWQznEZirEFYM8
Message-ID: <AANLkTinHw3SXsx89qis6NeYSxjhKjK278-VgKHXpbw7j@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFH] qt4-tools-sdk not providing right values
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
X-List-Received-Date: Tue, 15 Feb 2011 10:58:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 09:58, Eric B=E9nard <eric@eukrea.com> wrote:
> ok, the path actually reported are wrong ex with angstrom :
> QT_INSTALL_PREFIX:/usr/local/angstrom/arm/
>
> Can you try this :
> create a qt.conf in /usr/local/angstrom/arm/bin
> with the following content :
> [Paths]
> Prefix =3D /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr
>
> cd /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr
> ln -s share/qtopia/mkspecs/
>
> then qmake -query reports correct paths :
> QT_INSTALL_PREFIX:/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr
> QT_INSTALL_HEADERS:/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr=
/include
> QT_INSTALL_LIBS:/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/li=
b
>
> Can you try if that also works with CMake ?

It works for qmake but CMake keep not working.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


