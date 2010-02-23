Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nk0pr-0004uB-MV
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 20:54:26 +0100
Received: by iwn9 with SMTP id 9so3655435iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 11:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JpJItydioiQqK0W4eifbLivHExTuPE6gsbAdonTmESw=;
	b=sLZVCDCP0Y8OzFgA7Ue2bP2qQtXf5n8HtcVbZviQr3n2U1qjTH4g6jL3mBJp7QK5rk
	j5D0JM4E/1Ms3SSQh4PTfXenbASTjUjeJ62lSXdKWGHQ2OfHJE0fjNEaKLTycYZytpRn
	2jZF+9N8N8D4mRTpA63TppkDZMuIRxgBjD6+g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CTD+yInX1EZkd8s+tnGyHGAk7dzUBkm9W4F4TWnWOqdGW8t8ovBSQgsKRuNe5cChbO
	DwcZjGhJZ2KnmNIzYCJuhWiXN5DXUkLY5ncdTDrvKXERY+bjwAT8/64uS7lsei0+HqZH
	UGvbCPRMrKUyyZsVJ8xmoAdrr6WfESUyOCI2s=
MIME-Version: 1.0
Received: by 10.231.145.70 with SMTP id c6mr728325ibv.36.1266954698222; Tue, 
	23 Feb 2010 11:51:38 -0800 (PST)
In-Reply-To: <1266951776.18176.47.camel@trini-m4400>
References: <1266951776.18176.47.camel@trini-m4400>
Date: Tue, 23 Feb 2010 11:51:38 -0800
Message-ID: <19c1b8a91002231151g6fbe4a1ck97668729e5cc69d6@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix busybox SUID support
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
X-List-Received-Date: Tue, 23 Feb 2010 19:54:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2010 at 11:02 AM, Tom Rini <tom_rini@mentor.com> wrote:
> I was about to just push this and I noticed that a number of
> distributions (SlugOS, Angstrom, Kaelios, micro) currently set
> FEATURE_SUID=3Dy, but it's not actually install SUID. =A0And since I reca=
ll
> some way-back-when's of "busybox SUID is dangerous / crap!", I thought
> it best to post the patch first and let folks speak up / ask me to drop
> FEATURE_SUID=3Dy when I do this. =A0So, here's the patch:
>
> diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
> index 5f52850..b165d0f 100644
> --- a/recipes/busybox/busybox.inc
> +++ b/recipes/busybox/busybox.inc
> @@ -11,7 +11,7 @@ LICENSE =3D "GPL"
> =A0SECTION =3D "base"
> =A0PRIORITY =3D "required"
>
> -INC_PR =3D "r24"
> +INC_PR =3D "r25"
>
> =A0SRC_URI =3D "\
> =A0 file://busybox-cron \
> @@ -96,7 +96,11 @@ do_install () {
> =A0 =A0 =A0 =A0# Install /bin/busybox, and the /bin/sh link so the postin=
st script
> =A0 =A0 =A0 =A0# can run. Let update-alternatives handle the rest.
> =A0 =A0 =A0 =A0install -d ${D}${base_bindir}
> - =A0 =A0 =A0 install -m 0755 ${S}/busybox ${D}${base_bindir}
> + =A0 =A0 =A0 if grep -q "CONFIG_FEATURE_SUID=3Dy" ${WORKDIR}/defconfig; =
then

may be you should grep it in ${S}/.config because thats what defconfig
turns into finally
and used by busybox build.

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 4755 ${S}/busybox ${D}${base_bin=
dir}

what does 4755 translate to ? (curiosity)

> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0755 ${S}/busybox ${D}${base_bin=
dir}
> + =A0 =A0 =A0 fi
> =A0 =A0 =A0 =A0ln -sf busybox ${D}${base_bindir}/sh
>
> =A0 =A0 =A0 =A0if grep -q "CONFIG_SYSLOGD=3Dy" ${WORKDIR}/defconfig; then
>
>
> --
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


