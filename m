Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpbqF-0000XS-8H
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 08:58:12 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so3819215iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 23:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=96R5Xqy/S4zhQzijoTDNLKNMto/me/abBny2oYgSkW0=;
	b=t1sic58SI173HNKY+9We1shbRZBDAy06uaT8XUATUl7ZQstr5pfQCulLStNr5s1zHV
	fcvrKWetZDQl9fKKVDXdnEb0904JDxrWyZZssq7IqHfRFWPgZBgx3xPOUTeZnWf8bKE9
	yuI9yNu76hX+G6t7XgQ/71uXx3MyRgi6z+U8A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jbSOsuK6BSmmMkhFK5N+Hlh3BB5cGSieWadVJ+AnYiNJbptjhQCDpIDlViGdHnEjle
	FxB5dZzg3evQFhiucypdLHD04ZCZFAPxJB/4vkYaqpNyFX6tJkm7Fuiub40N5M+Q57Mo
	9fhcYXpxvgT7n1Idwkad95LzBaRUhMkKoPhOc=
MIME-Version: 1.0
Received: by 10.231.60.4 with SMTP id n4mr3548702ibh.18.1283065062776; Sat, 28
	Aug 2010 23:57:42 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sat, 28 Aug 2010 23:57:42 -0700 (PDT)
In-Reply-To: <1283027073-12308-23-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-23-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 08:57:42 +0200
Message-ID: <AANLkTi=a2F2iXTBVniz-aD_EV6hhpjus0oQ0U5W2qCfN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 22/23] task-openprotium.bb: Define missing DISTRO_SSH_DAEMON, DISTRO_DEV_MANAGER, DISTRO_INIT_MANAGER, DISTRO_LOGIN_MANAGER
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
X-List-Received-Date: Sun, 29 Aug 2010 06:58:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.co

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/tasks/task-openprotium.bb | =A0 =A05 ++++-
> =A01 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/tasks/task-openprotium.bb b/recipes/tasks/task-openp=
rotium.bb
> index 2cfe30d..1cfc740 100644
> --- a/recipes/tasks/task-openprotium.bb
> +++ b/recipes/tasks/task-openprotium.bb
> @@ -4,7 +4,10 @@ ALLOW_EMPTY =3D "1"
> =A0PR =3D "r3"
>
> =A0inherit task
> -
> +DISTRO_SSH_DAEMON ?=3D "dropbear"
> +DISTRO_DEV_MANAGER ?=3D ""
> +DISTRO_INIT_MANAGER ?=3D ""
> +DISTRO_LOGIN_MANAGER ?=3D ""
> =A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =A0# be sure to build the kernel:
> =A0DEPENDS =3D "virtual/kernel"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


