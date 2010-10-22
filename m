Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9DPw-0001i2-DN
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 10:56:07 +0200
Received: by mail-iw0-f175.google.com with SMTP id 6so7095iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 01:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3f9TEw32vemXZnvYUNIqF3+J4JaGa3iiNt8sI5QGrSQ=;
	b=IGNlv1KL4Qx4+k+zwBRnyUJHOql15zQUJmwgQG64+SQPPoRXCf1rcCEZrKSx/zo5hU
	qt1GHlkYJIP8I/2PghWnaR4e9PJKvZ/kJMdwOWMwKIXgpIlw/TX55r300rnZWNPQB9Fo
	bDpmqkeKPy9iflQnjQQrruFYnE3sUfuXKyY8E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tv7XebyMSG0pYRHaEWWMDTcPym/BgM5hTKQXEvk2BNPso+GEMug+EmFLhvGo4zKc7H
	lBI0UYUrDPCsZCucb8Wptwq6Kp5A+TCIYaw9FShiScXAZU0C22BMDBjAv88GZv7fkSXh
	lLc4J3YtA6Y3bQgLiVfy9B4jJFkLKQ71J/Uew=
MIME-Version: 1.0
Received: by 10.231.33.129 with SMTP id h1mr94359ibd.158.1287737726183; Fri,
	22 Oct 2010 01:55:26 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 22 Oct 2010 01:55:26 -0700 (PDT)
In-Reply-To: <1287074146-3705-3-git-send-email-fransmeulenbroeks@gmail.com>
References: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-2-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-3-git-send-email-fransmeulenbroeks@gmail.com>
Date: Fri, 22 Oct 2010 10:55:26 +0200
Message-ID: <AANLkTinhp-j=DPqoH=szLxL1ZsJLCkioeOtz9NwBApvZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/7] RDEPENDS_append = ""
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
X-List-Received-Date: Fri, 22 Oct 2010 08:56:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

ping; i know this is a fairly trivial patch but as it is a recipe I am
not familiar with, I would appreciate it if e.g. the recipe maintainer
would send an ack

2010/10/14 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/avahi/avahi.inc | =A0 =A01 -
> =A01 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/avahi/avahi.inc b/recipes/avahi/avahi.inc
> index 4ffb6d5..385450d 100644
> --- a/recipes/avahi/avahi.inc
> +++ b/recipes/avahi/avahi.inc
> @@ -17,7 +17,6 @@ SRC_URI =3D "http://avahi.org/download/avahi-${PV}.tar.=
gz \
> =A0inherit autotools pkgconfig update-rc.d python-dir
> =A0# handle update-rc.d RDEPENDS_${PN} manually, we don't need it on
> =A0# anything but avahi-daemon and avahi-autoipd
> -RDEPENDS_append =3D ""
>
> =A0# TODO: build and enable all the extra stuff avahi offers
> =A0EXTRA_OECONF =3D "--with-distro=3Ddebian =A0--disable-stack-protector =
--disable-nls --disable-gdbm ${AVAHI_GTK} --disable-mono --disable-monodoc =
--disable-qt3 --disable-qt4 ${AVAHI_PYTHON}"
> --
> 1.6.4.2
>
>


