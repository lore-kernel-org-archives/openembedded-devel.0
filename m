Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SUxjE-0004O5-Vc
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 12:14:41 +0200
Received: by dalh21 with SMTP id h21so1975436dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zlNL+hGB8gfnrzprCC/MF2tjB3IW5BQZ7Lnpd0HALVc=;
	b=LVZQDYU2Y96nhtDTeYgsgfFFoDoVa0CFWCtuk+aujt/1b1SyrUxWCb/2mLTRsJDvAV
	vmQYKManLrTiW7E/45zLrcwLZ32YKHTAlMEwLKto3C0b/GT8zXZWn+LhFjp8mJTW+r6b
	cmIP36uD8w4SV668gt2fgcVSuOWprDNN3TtEWceRWoU9MVYqDW9QupuoIBFqdqauQ5NS
	YbXDTDIjJzJ+u7vXIGOqSTHp82wg3p6taaEH3G1cSOvSX3VzTYuNWAojUnFkvxp0KKKb
	xX/AwcfGsDy5NF+7GWIP+b7KDeHNDludCy6+t0aFJpLCboJ64fbkl0zsFVuV3LWJnUGJ
	lt1g==
MIME-Version: 1.0
Received: by 10.68.136.65 with SMTP id py1mr26019678pbb.81.1337249077344; Thu,
	17 May 2012 03:04:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.25.42 with HTTP; Thu, 17 May 2012 03:04:37 -0700 (PDT)
In-Reply-To: <jp2i06$mvm$1@dough.gmane.org>
References: <1337246639-5192-1-git-send-email-Martin.Jansa@gmail.com>
	<jp2i06$mvm$1@dough.gmane.org>
Date: Thu, 17 May 2012 07:04:37 -0300
X-Google-Sender-Auth: 6HCaKE06wyvxchff1ZQGVIPZs0c
Message-ID: <CAP9ODKrHkHux0KGrKWx8FoVOdTVHwD+RujKB3F91Fxj73QPx8A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] systemd: create /var/run/utmp
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
X-List-Received-Date: Thu, 17 May 2012 10:14:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 6:56 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 17-05-12 11:23, Martin Jansa schreef:
>> * it was created by volatiles before,
>
> If it was done by volatiles before shouldn't it be a tmpfile.d/ snippet
> instead of do_install_append? /var/run gets clean on boot on a lot of sys=
tems.

Agreed.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


