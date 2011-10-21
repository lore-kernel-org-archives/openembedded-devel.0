Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHE3g-0000Kj-Eu
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 14:18:44 +0200
Received: by bkat8 with SMTP id t8so5034654bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 05:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kOzRlaZM605udTCX9Q2Xe6vQRZsiAZfO0pJ/McNF9l8=;
	b=bK5K62vG2yATIldxv3NaIufrlxNYluyGf0ZczI+UUhBNZ3tsP/jYdGFhp6/39WmjY2
	nBlwQVHC1zBLHy/wrTgZWtNBU+Cq8uP8U+m0WT0VXLsZC4z+ZaO0ropQHf658MtNfvEB
	C8k7x+PYMcRHX5U+Tvnr5jT8s8UED5EVvz7Pg=
MIME-Version: 1.0
Received: by 10.204.7.138 with SMTP id d10mr10593079bkd.31.1319199169710; Fri,
	21 Oct 2011 05:12:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Fri, 21 Oct 2011 05:12:49 -0700 (PDT)
In-Reply-To: <j7r2ee$7jb$2@dough.gmane.org>
References: <cover.1319168013.git.otavio@ossystems.com.br>
	<f8bb508b661653c11221ac4b6a8ec080d2527569.1319168013.git.otavio@ossystems.com.br>
	<j7r2ee$7jb$2@dough.gmane.org>
Date: Fri, 21 Oct 2011 10:12:49 -0200
X-Google-Sender-Auth: 60l3WeRPH7ZEeFQrLzuSGnKMW7M
Message-ID: <CAP9ODKoyUCjR+shUBoU6btPw3DZ=PK7U7PzNFsN2d=7vj-kA2Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/4] systemd: add systemd-initramfs
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
X-List-Received-Date: Fri, 21 Oct 2011 12:18:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 04:11, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 21-10-11 05:34, Otavio Salvador schreef:
>> Includes a /init that points to ${base_sbin}/init that is called so to
>> avoid having to include post rootfs commands for it.
>
> lrwxrwxrwx 1 root root 12 Jan =A01 =A01970 /sbin/init -> /bin/systemd
>
> So please symlink /init to /bin/systemd directly.

Fixed locally.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


