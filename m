Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpIwC-0005BJ-Cr
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 12:19:20 +0100
Received: by bwz10 with SMTP id 10so302980bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 03:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HGBjO1PtqhteWFdD/XkZEbcPPtWgD2FRQJgHMje5lbY=;
	b=tsJK440dMYvjrZFGso3sbTpzpobc3vPJ44s0+D/cqBYqM0qtjd4mC54CnJfhAWFgPE
	dQwupbxgRtX2+zprWNHUZIqHMFs4qIKqK8dDlZEJYo1mt0MtDMokQZHZ10eX/LM56P83
	WKc5B3FxpvZ+AchMO63qNYNmWULO2GUOE5NBE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=ieSL0oqv6KT+n4yCHM9x94fDcyqJVFLI/kQOpPsyRhy+qfwelwUVk59EGVYTVb4GkC
	s0Qao+DPfxrAfNEF7/QJjabwWkoUFhFUr7/QLvbD2tKWejb9ZbNGiOi/lvsP9OSAmput
	4Ury04gOU/OcPs5DgwNhkwFPK3gzjDz1U5pyA=
MIME-Version: 1.0
Received: by 10.204.124.6 with SMTP id s6mr4313390bkr.51.1297768690001; Tue,
	15 Feb 2011 03:18:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 15 Feb 2011 03:18:09 -0800 (PST)
In-Reply-To: <AANLkTinHw3SXsx89qis6NeYSxjhKjK278-VgKHXpbw7j@mail.gmail.com>
References: <AANLkTinN1b=egyKPv6N3rHq1HODKDyK15B22=1qBZcMZ@mail.gmail.com>
	<4D5A4E56.7040209@eukrea.com>
	<AANLkTinHw3SXsx89qis6NeYSxjhKjK278-VgKHXpbw7j@mail.gmail.com>
Date: Tue, 15 Feb 2011 11:18:09 +0000
X-Google-Sender-Auth: BQX1RCavfTT9TPfcsN9xWbg9tig
Message-ID: <AANLkTi=OFf7JB6bYsEXCNG1MVNWTP6mFwdj+EhFHLMvb@mail.gmail.com>
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
X-List-Received-Date: Tue, 15 Feb 2011 11:19:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 10:57, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> On Tue, Feb 15, 2011 at 09:58, Eric B=E9nard <eric@eukrea.com> wrote:
...
>> Can you try this :
>> create a qt.conf in /usr/local/angstrom/arm/bin
>> with the following content :
>> [Paths]
>> Prefix =3D /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr
...
>> then qmake -query reports correct paths :
>> QT_INSTALL_PREFIX:/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr
>> QT_INSTALL_HEADERS:/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/us=
r/include
>> QT_INSTALL_LIBS:/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/l=
ib
>>
>> Can you try if that also works with CMake ?
>
> It works for qmake but CMake keep not working.

Comparing with my desktop it shows why it fails. QT_INSTALL_HEADERS is
wrong since it ought to point to '.../include/qtopia/' and so on.

It seems we'll need to have a custom qt.conf  with many values for it to wo=
rk.

The following qt.conf makes things better (but not working yet)

[Paths]
Prefix =3D /opt/sdk/osnetboot-terminal/i586/i586-oe-linux/
Headers =3D include/qt4/
Plugins =3D lib/qt4/plugins/
Binaries =3D ../bin/

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


