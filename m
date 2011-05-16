Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QLwYV-0004D1-P2
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 14:05:47 +0200
Received: by bwz5 with SMTP id 5so4073459bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 05:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=patLCy31acAmpubI9MlM8IXj7iDM9jhySCCI7dC/bnk=;
	b=hVSGWOtvSWlrRwmfdepXlAT1yDdDEwd9rjnATGP9gQAz5m+TMpZKkuthAMnBjAxGE0
	uoD1ymhBPJBArlKvXCMyNzKVvAeKzpbyODRZ5YEpgPcNsPW0KwBOLDI6Uy6q48aX4Th/
	o8wl/19DWmO278flndfI51R9wkftjm1K5Mzho=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=c8Aobyjk0F6/lwot3aL4ob2jbLpjes3GNMSSHNRNCbLeoJ9ivXKSuQZgnPUJ4p738r
	Jib9IM5ecz9ZnBhSh0qXeK0HRkIx6BJUkm4MElTG5XG369KEvfOjv2Qy3IZmirSR4ZkF
	dhHHaBSb1gsMkrQhgZTF0ioAUmYvpjnqG8ccg=
MIME-Version: 1.0
Received: by 10.204.143.88 with SMTP id t24mr2431224bku.189.1305547372625;
	Mon, 16 May 2011 05:02:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Mon, 16 May 2011 05:02:52 -0700 (PDT)
In-Reply-To: <iqqiu6$5pp$1@dough.gmane.org>
References: <1305495926-21490-1-git-send-email-otavio@ossystems.com.br>
	<1305495926-21490-2-git-send-email-otavio@ossystems.com.br>
	<iqqiu6$5pp$1@dough.gmane.org>
Date: Mon, 16 May 2011 09:02:52 -0300
X-Google-Sender-Auth: -SWjdOryB0vS8iHBVyQZP0yXwv0
Message-ID: <BANLkTinQ5v1e6E+1nG2UWzsfCz79yP_sMQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v1 2/3] libpcsclite: add version 1.7.2
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
X-List-Received-Date: Mon, 16 May 2011 12:05:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 04:15, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 15-05-11 23:45, Otavio Salvador wrote:
>> The recipe name libpcsclite has been choosen since this is the most
>> important and used part of the project. The daemon itself is optional
>> and not always required to be installed.
>
> Wouldn't debian.bbclass already take care of such renaming with proper
> packaging?

It does for soname but not for -dev and -doc that is mostly related to
the library, not the daemon.

>> +++ b/meta-oe/recipes-support/pcsc-lite/libpcsclite_1.7.2.bb
>
>> +INITSCRIPT_PACKAGES =3D "pcscd"
>> +INITSCRIPT_NAME_pcscd =3D "pcscd"
>> +INITSCRIPT_PARAMS_pcscd =3D "defaults"
>
> These should go near the other _pscsd entries
>
>> +
>> +EXTRA_OECONF =3D " \
>> + =A0 =A0 --enable-libusb \
>> + =A0 =A0 --disable-libudev \
>
> Please add the proper libusb to DEPENDS and a comment why udev is in
> DEPENDS, but disabled

Fixed. Will post it again.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


