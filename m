Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QF8iO-0003PB-3c
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Apr 2011 19:39:52 +0200
Received: by bwz5 with SMTP id 5so1779041bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2011 10:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=JWSL9DwhPtsjZomAOSlsLAsbmLMN/vnP5H/178fhfFY=;
	b=W6b7tsVDuKlNTmedMgsvOdUdEeyXFqDmko+tZL6ReJNhAE/qShHg1ftRufHw7UZAh5
	6lfuj1A2Tyx+gnAgt//mc6PRLep9wrdKbAskU0sLvqbzE01uEmVKJNLIRx+16KMygBqQ
	eIMPb4fnMNBmWZ+L+1s48U0XTOgQgp+Zm1IEk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=gJylcSthrxOn7KtdRyr7YgvA5Ci0DZRE4hJQXQ9mNa5N50Jc/aJW5MbWBXtoJ3XtL4
	N/CZYWSABAWZPjbsvgwOyUVTWBq2cINs4zQ+ocK2jmiA040sbZAyDfNO3NMwII2+JaQr
	qkU0FH7UL1aC8uNm2XKN2vjrl1yssewVgNZEY=
MIME-Version: 1.0
Received: by 10.204.19.83 with SMTP id z19mr1163870bka.191.1303925841249; Wed,
	27 Apr 2011 10:37:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.70.138 with HTTP; Wed, 27 Apr 2011 10:37:21 -0700 (PDT)
In-Reply-To: <1299360603-24687-2-git-send-email-eric@eukrea.com>
References: <1299360603-24687-1-git-send-email-eric@eukrea.com>
	<1299360603-24687-2-git-send-email-eric@eukrea.com>
Date: Wed, 27 Apr 2011 14:37:21 -0300
X-Google-Sender-Auth: JlfsrW010cWIQ6rvuyvFTcMa9As
Message-ID: <BANLkTimdEpdmQTFtscP9rrRSaO5HrGaG6g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [PATCH 2/2] qt4: add 4.7.2
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
X-List-Received-Date: Wed, 27 Apr 2011 17:39:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 5, 2011 at 18:30, Eric B=E9nard <eric@eukrea.com> wrote:
> =A0recipes/qt4/qt-4.7.2.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 72 ++++++++++++++++++++
...
> +do_configure_append() {
> + =A0 =A0sed -e '/QMAKE_TARGET /d' -e '/TARGET /d' -i ${S}/translations/M=
akefile
> +}
...

It seems as a regression from previous qt4 recipes since we used to
have translation support. Eric, can you take a look into that?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


