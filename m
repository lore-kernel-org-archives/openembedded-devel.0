Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVUfR-00060n-DD
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 20:48:09 +0100
Received: by gyh20 with SMTP id 20so2352050gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 11:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=jUz1Ba7GVZqt+DvwVO183MAR439hsbXor8jv6Dq1nzA=;
	b=PDX3S3lZKBU+SE4Op2RpMN8tc0G8fO2tpFIzAQfvejk0lXIUu9+1KnvrXpdVR3ijGw
	RtTs8l11c4TySBlAC5DuXK6da9mNNw3/8UYMxJjWNzDZcngjMjAA2ENEsPXP6miHVE7a
	x/4hdDRaZdgotBpifOUSWh2a/QOS8qdFPDv3w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=FaFQPGhHTKp4ZHXd1YP9hQsbdyIJKYmNI6YrRI7bq/5QcNt636ZGdPFjuiZN0a3bRL
	vQCfbFmmWMusVKsXdXkwOhUInBV5jvsSTUphVAF6WrXog8gDLLJRusl+5o2SWOqH6tR4
	x/8+Oj8ElzbZfBI4FbqPbmKNQYLnfGXGGfp7w=
Received: by 10.91.163.27 with SMTP id q27mr9066220ago.139.1293047280775; Wed,
	22 Dec 2010 11:48:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 22 Dec 2010 11:47:40 -0800 (PST)
In-Reply-To: <1293029561-32081-1-git-send-email-vjensen@gmx.de>
References: <alpine.LNX.2.00.1012221538090.11293@asterix.crazy-teaparty.dyndns.org>
	<1293029561-32081-1-git-send-email-vjensen@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Dec 2010 11:47:40 -0800
Message-ID: <AANLkTinJc-H=8hJ_10QR-Y2=Or=aSehNeHgqp1f6BaCo@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: Re: [PATCH] monit: enable include from /etc/monit.d
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
X-List-Received-Date: Wed, 22 Dec 2010 19:48:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2010 at 6:52 AM, Vitus Jensen <vjensen@gmx.de> wrote:
> ---
> =C2=A0.../enable-include-from-etc-monit.d.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 10 ++++++++++
> =C2=A0recipes/monit/monit_4.10.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 ++-
> =C2=A02 files changed, 12 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 recipes/monit/monit-4.10.1/enable-include-from-e=
tc-monit.d.patch
>
> diff --git a/recipes/monit/monit-4.10.1/enable-include-from-etc-monit.d.p=
atch b/recipes/monit/monit-4.10.1/enable-include-from-etc-monit.d.patch
> new file mode 100644
> index 0000000..3370921
> --- /dev/null
> +++ b/recipes/monit/monit-4.10.1/enable-include-from-etc-monit.d.patch
> @@ -0,0 +1,10 @@
> +--- a/monitrc
> ++++ b/monitrc
> +@@ -212,6 +212,6 @@
> + ## It is possible to include additional configuration parts from other =
files or
> + ## directories.
> + #
> +-# =C2=A0include /etc/monit.d/*
> ++include /etc/monit.d/*
> + #
> + #
> diff --git a/recipes/monit/monit_4.10.1.bb b/recipes/monit/monit_4.10.1.b=
b
> index 4bdeeb8..ebdeb8e 100644
> --- a/recipes/monit/monit_4.10.1.bb
> +++ b/recipes/monit/monit_4.10.1.bb
> @@ -1,9 +1,10 @@
> =C2=A0LICENSE =3D "GPL"
> =C2=A0DEPENDS =3D "openssl"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =C2=A0SRC_URI =3D "http://www.tildeslash.com/monit/dist/monit-${PV}.tar.g=
z\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-strip-in-makefile.patch \
> + =C2=A0 =C2=A0 =C2=A0 file://enable-include-from-etc-monit.d.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://init"
>
> =C2=A0INITSCRIPT_NAME =3D "monit"
> --
> 1.7.2.3

looks ok. Can you also make the lincense more specific which version
of GPL it is ?
and also add yout signed-off-by

Acked-by: Khem Raj <raj.khem@gmail.com>


>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


