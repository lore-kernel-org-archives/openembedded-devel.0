Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PaYGM-0004uj-3I
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 19:39:10 +0100
Received: by wyb40 with SMTP id 40so16019078wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 10:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=f+UwlSHacsFEyu2Nt6Zhdxyo9T4Sz8GGBOSg7BzQ7NE=;
	b=HB8LkzSUcIxnBxXG4T/lT88HLaBGayYqhjIf8VCYe1oaq0b3ei/0v+V6/311VT7jod
	36yRS//woEWHKneUSG3FNWpacpbaN15djBoTYl6YIxU6M7Qq2Ji1hZ45G1aM2EbZCPfZ
	dLOYuVLwTv35jmok/kfD6jZ68t5Z7oGu1j0Lg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=Uyl7vtqcsSM4nQJ6/xmx73Y0ToHIfrI6Y9yaW76Ip/9aNNrEkDf+xrcGNqUacWI4rw
	wbVoucFt762hL92ERDFFz8OidW66N7N8iivy5pySrxCt1DV8mQHksc/6y1gsGVjq4js0
	rt8VfC9agxL0VIxw9iHE+OfGWbvvYKgQVpqn0=
MIME-Version: 1.0
Received: by 10.216.89.71 with SMTP id b49mr23774882wef.28.1294252724624; Wed,
	05 Jan 2011 10:38:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.216.190.15 with HTTP; Wed, 5 Jan 2011 10:38:44 -0800 (PST)
Date: Wed, 5 Jan 2011 16:38:44 -0200
X-Google-Sender-Auth: X-q8Z6znZ3ouOVkO34EStzHO-u8
Message-ID: <AANLkTi=JuR1mCh5CrKoKfUFKWgCikvb9BYKQTSp=syb8@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: busybox.links at postinst
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
X-List-Received-Date: Wed, 05 Jan 2011 18:39:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I am having a problem with busybox providing linuxrc and which was
suppose to have a specific package for it.

Basically, it does not work since linuxrc is a symlink to busybox done
at postinst so the package cannot be splited.

Any reason to not having those links at packaging time?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


