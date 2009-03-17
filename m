Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LjNgJ-0006dl-0D
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 02:01:25 +0100
Received: by an-out-0708.google.com with SMTP id d40so393147and.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2009 18:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=jJBm8cNiXHjKNi+/9+rj8J9jAvt/Y2thLDwuo+Zb25o=;
	b=Pokb7bYurcvWo0k2IZMMC7SKJ7qSouC2Vr1oNPRdwqA/p/DrjFx3FmVzGWjbgezOuk
	L7ITLeYo4842aQO9Vto27fSHIanfGz0u6Ig9c9NvaZOYWMnWLqYST8cs2+wLO30msa9n
	1kT5sy4jTzu+x9AlNWSOQVCJwGGIPadippqX8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=SZk0HT7Xkxr42J0AL0E1U25jg3/Wltn+fBvpz1goI5z9HkrLZI27GddqzlLto2peOz
	6eYrRxDsaEvUTSqemx9tLOo3BBJ8YaY7BztQZbGqmQqSBV4wgG2bP3PkJcl+0/7Wv4p+
	hTR0/FV3gR+LpNnTOyMZqVb52Ccn5eNXZU3GE=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.41.9 with SMTP id o9mr3214521ano.39.1237251641775; Mon, 16 
	Mar 2009 18:00:41 -0700 (PDT)
In-Reply-To: <1237220171.4020.4.camel@faraday>
References: <1236890935.6250.26.camel@northpole>
	<1237220171.4020.4.camel@faraday>
Date: Mon, 16 Mar 2009 22:00:41 -0300
X-Google-Sender-Auth: b1ca8ddce866c14a
Message-ID: <be7a9f3d0903161800i3f6735c8u7eafe009f2cb0b88@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.241
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: calibrateproto git tag
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
X-List-Received-Date: Tue, 17 Mar 2009 01:01:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/3/16 Marcos Amorim <marcos@2mi.com.br>:
> libxcalibrate_git add tag
>
>
> git diff packages/xorg-lib/libxcalibrate_git.bb
> diff --git a/packages/xorg-lib/libxcalibrate_git.bb
> b/packages/xorg-lib/libxcalibrate_git.bb
> index f9e1587..7f889df 100644
> --- a/packages/xorg-lib/libxcalibrate_git.bb
> +++ b/packages/xorg-lib/libxcalibrate_git.bb
> @@ -6,7 +6,7 @@ DEPENDS =3D "virtual/libx11 calibrateproto libxext"
> =A0PV =3D "0.0+gitr${SRCREV}"
> =A0PE =3D "1"
>
> -SRC_URI =3D
> "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate;protocol=3Dgit"
> +SRC_URI =3D
> "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate;protocol=3Dgit;=
tag=3Dmaster"

Please use AUTOREV in conf/distro/include/insane-srcrevs.inc and a good
one at conf/distro/include/sane-srcrevs.inc. This makes images easier to
be reproducable.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


