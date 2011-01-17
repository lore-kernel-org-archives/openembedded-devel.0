Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PeuMl-0005i8-3G
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 20:03:47 +0100
Received: by iwn8 with SMTP id 8so5022876iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 11:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=ezv9hPY5afOM4jGFm8PM954ZNfNhT/q7Zrbwddz0q7o=;
	b=fTBfhv/S2G9sb9E8b3/eJGEx9YjDMFJX+qTgt6ytiXb6QVtPfhXM/ZFNdeq7mDvJvX
	0UzprYF9nQzY0bUnTSXa890HMQKK1bi4dZYwGrOHXKYcGz7iTfv8vl1g6DyfITw4dwJn
	JSORU9hv8TJv/zI+n1EhwJNytw9A9tKo0ONBQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NJZUCxIbnB/GeHPx5ZmcRKI7T8GvABdfzz5+UNXmEchwvHh5DrVdhTSOZ2qTteH8I5
	J2dyw8EDhMYtgm8QwT9Y+QfYFVrojScvtGXcWpVm4uKbByfTEPeNPtscgiWbpLxbSLHt
	gkxsKzM6NXLwWrf32zduWkIc//GYf7ZPC/wCw=
MIME-Version: 1.0
Received: by 10.231.11.204 with SMTP id u12mr4703770ibu.109.1295290991025;
	Mon, 17 Jan 2011 11:03:11 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Mon, 17 Jan 2011 11:03:10 -0800 (PST)
In-Reply-To: <1295286639-4901-1-git-send-email-raj.khem@gmail.com>
References: <1295286639-4901-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 17 Jan 2011 20:03:10 +0100
Message-ID: <AANLkTimZ5EO0OjXD668AU-ZC4uQUgOAzjM1gf+MK9Q5u@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] minimal.conf: Prefer perl 5.10.1 and opie 1.2.5
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
X-List-Received-Date: Mon, 17 Jan 2011 19:03:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/17 Khem Raj <raj.khem@gmail.com>:
> * Tested various builds seems to hold fine
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0conf/distro/minimal.conf | =A0 =A05 +++--
> =A01 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index 5a19cbc..f495d13 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -108,7 +108,7 @@ INHERIT +=3D "recipe_sanity"
> =A0# PREFERRED VERSIONS
> =A0######################################################################=
#######
> =A0require conf/distro/include/preferred-e-versions.inc
> -require conf/distro/include/preferred-opie-versions-1.2.4.inc
> +require conf/distro/include/preferred-opie-versions-1.2.5.inc
>
> =A0PREFERRED_PROVIDER_opkg ?=3D "opkg"
> =A0PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg"
> @@ -119,7 +119,8 @@ PREFERRED_VERSION_qt4-embedded =3D "${PREFERRED_QT_VE=
RSION}"
> =A0PREFERRED_VERSION_qt4-embedded-gles =3D "${PREFERRED_QT_VERSION}"
> =A0PREFERRED_VERSION_qt4-x11-free =3D "${PREFERRED_QT_VERSION}"
> =A0PREFERRED_VERSION_qt4-x11-free-gles =3D "${PREFERRED_QT_VERSION}"
> -
> +PREFERRED_VERSION_perl =3D "5.10.1"
> +PREFERRED_VERSION_perl-native =3D "5.10.1"
> =A0######################################################################=
#######
> =A0# CONTENTS
> =A0######################################################################=
#######
> --
> 1.7.2.3

No opinion on the opie stuff, but I'm using perl 5.10.1 for quite a
while, so that part has my ack.
(maybe split into two patches, one for opie, one for perl).

Frans


