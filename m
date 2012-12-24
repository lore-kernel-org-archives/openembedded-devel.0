Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tn7gP-0007Nm-QG
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Dec 2012 14:03:05 +0100
Received: by mail-ee0-f46.google.com with SMTP id e53so3475858eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2012 04:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=H/fZmmn+MvXmvJu31S+JWvUyyr+I05uEz3QiLuKIHJ0=;
	b=QCvhFh3O5fjHvI0R1AidK7iDwZ4g8uQHaltRzvc/C8/7JGurpFrSD/Cj4lOkjfFYzh
	VHBmJ1AKampG1hpOgGNBTwIaBZjf3VamMECb9Mb+osZu9m4lk1FJHHg2YKeZ9LwIgaGe
	x3L0DWZs1TPb+kJ8ZMl/8LPIUj6vfXy1xkBYpgyV2EtCt5mzrsJQH9qdfRiOI5gg2x18
	dUqWwEhniC+/wrrhnKJlervJWa9vju6FAFyFf9FMJ01x4sfd1sGEeWupoa5rx9q036li
	Xzls0rskfaC9vYeziOTQWN51ZwNQ6zLHShc/jVBtIviIg/p1u19xhIQKZyux2/WqSe7k
	O27A==
X-Received: by 10.14.219.3 with SMTP id l3mr55335733eep.5.1356353295934;
	Mon, 24 Dec 2012 04:48:15 -0800 (PST)
Received: from ?IPv6:2001:610:612::a88f:411:73bb:819b?
	([2001:610:612:0:a88f:411:73bb:819b])
	by mx.google.com with ESMTPS id e2sm41117544eeo.8.2012.12.24.04.48.14
	(version=SSLv3 cipher=OTHER); Mon, 24 Dec 2012 04:48:15 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1356352009-30859-1-git-send-email-eric@eukrea.com>
Date: Mon, 24 Dec 2012 13:48:17 +0100
Message-Id: <8340CE43-A725-4A6F-BB57-C8D4570F97C5@dominion.thruhere.net>
References: <1356352009-30859-1-git-send-email-eric@eukrea.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQlAzyBYcbyYmpYja8Zzrh1UbTUI6glr2HZaHQahlkbplX8R5rQ2XJGT21aYqt2pwl5CGkYU
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH for denzil 1/3] systemd: move _git to _v189
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
X-List-Received-Date: Mon, 24 Dec 2012 13:03:06 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 24 dec. 2012, om 13:26 heeft Eric B=E9nard <eric@eukrea.com> het =
volgende geschreven:

> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>



> ---
> .../recipes-core/systemd/{systemd =3D> systemd-v189}/gtk-doc.make    | =
   0
> .../recipes-core/systemd/{systemd =3D> systemd-v189}/modprobe.rules  | =
   0
> .../systemd-pam-configure-check-uclibc.patch                       |   =
 0
> .../{systemd =3D> systemd-v189}/systemd-pam-fix-execvpe.patch        | =
   0
> .../{systemd =3D> systemd-v189}/systemd-pam-fix-fallocate.patch      | =
   0
> .../{systemd =3D> systemd-v189}/systemd-pam-fix-getty-unit.patch     | =
   0
> .../{systemd =3D> systemd-v189}/systemd-pam-fix-mkostemp.patch       | =
   0
> .../{systemd =3D> systemd-v189}/systemd-pam-fix-msformat.patch       | =
   0
> .../systemd/{systemd =3D> systemd-v189}/touchscreen.rules            | =
   0
> .../systemd/{systemd =3D> systemd-v189}/use-rootlibdir.patch         | =
   0
> meta-oe/recipes-core/systemd/systemd-v189/var-run.conf             |   =
 4 ++++
> meta-oe/recipes-core/systemd/{systemd_git.bb =3D> systemd_v189.bb}   | =
   4 ----
> 12 files changed, 4 insertions(+), 4 deletions(-)
> rename meta-oe/recipes-core/systemd/{systemd =3D> =
systemd-v189}/gtk-doc.make (100%)
> rename meta-oe/recipes-core/systemd/{systemd =3D> =
systemd-v189}/modprobe.rules (100%)
> rename meta-oe/recipes-core/systemd/{systemd =3D> =
systemd-v189}/systemd-pam-configure-check-uclibc.patch (100%)
> rename meta-oe/recipes-core/systemd/{systemd =3D> =
systemd-v189}/systemd-pam-fix-execvpe.patch (100%)
> rename meta-oe/recipes-core/systemd/{systemd =3D> =
systemd-v189}/systemd-pam-fix-fallocate.patch (100%)
> rename meta-oe/recipes-core/systemd/{systemd =3D> =
systemd-v189}/systemd-pam-fix-getty-unit.patch (100%)
> rename meta-oe/recipes-core/systemd/{systemd =3D> =
systemd-v189}/systemd-pam-fix-mkostemp.patch (100%)
> rename meta-oe/recipes-core/systemd/{systemd =3D> =
systemd-v189}/systemd-pam-fix-msformat.patch (100%)
> rename meta-oe/recipes-core/systemd/{systemd =3D> =
systemd-v189}/touchscreen.rules (100%)
> rename meta-oe/recipes-core/systemd/{systemd =3D> =
systemd-v189}/use-rootlibdir.patch (100%)
> create mode 100644 =
meta-oe/recipes-core/systemd/systemd-v189/var-run.conf
> rename meta-oe/recipes-core/systemd/{systemd_git.bb =3D> =
systemd_v189.bb} (99%)
>=20
> diff --git a/meta-oe/recipes-core/systemd/systemd/gtk-doc.make =
b/meta-oe/recipes-core/systemd/systemd-v189/gtk-doc.make
> similarity index 100%
> rename from meta-oe/recipes-core/systemd/systemd/gtk-doc.make
> rename to meta-oe/recipes-core/systemd/systemd-v189/gtk-doc.make
> diff --git a/meta-oe/recipes-core/systemd/systemd/modprobe.rules =
b/meta-oe/recipes-core/systemd/systemd-v189/modprobe.rules
> similarity index 100%
> rename from meta-oe/recipes-core/systemd/systemd/modprobe.rules
> rename to meta-oe/recipes-core/systemd/systemd-v189/modprobe.rules
> diff --git =
a/meta-oe/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.=
patch =
b/meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-configure-check-uc=
libc.patch
> similarity index 100%
> rename from =
meta-oe/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.pa=
tch
> rename to =
meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-configure-check-ucli=
bc.patch
> diff --git =
a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch =
b/meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-execvpe.patch
> similarity index 100%
> rename from =
meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
> rename to =
meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-execvpe.patch
> diff --git =
a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch =
b/meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-fallocate.patc=
h
> similarity index 100%
> rename from =
meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
> rename to =
meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-fallocate.patch
> diff --git =
a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch =
b/meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-getty-unit.pat=
ch
> similarity index 100%
> rename from =
meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
> rename to =
meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-getty-unit.patch=

> diff --git =
a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch =
b/meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-mkostemp.patch=

> similarity index 100%
> rename from =
meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
> rename to =
meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-mkostemp.patch
> diff --git =
a/meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch =
b/meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-msformat.patch=

> similarity index 100%
> rename from =
meta-oe/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
> rename to =
meta-oe/recipes-core/systemd/systemd-v189/systemd-pam-fix-msformat.patch
> diff --git a/meta-oe/recipes-core/systemd/systemd/touchscreen.rules =
b/meta-oe/recipes-core/systemd/systemd-v189/touchscreen.rules
> similarity index 100%
> rename from meta-oe/recipes-core/systemd/systemd/touchscreen.rules
> rename to meta-oe/recipes-core/systemd/systemd-v189/touchscreen.rules
> diff --git a/meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch =
b/meta-oe/recipes-core/systemd/systemd-v189/use-rootlibdir.patch
> similarity index 100%
> rename from meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch
> rename to =
meta-oe/recipes-core/systemd/systemd-v189/use-rootlibdir.patch
> diff --git a/meta-oe/recipes-core/systemd/systemd-v189/var-run.conf =
b/meta-oe/recipes-core/systemd/systemd-v189/var-run.conf
> new file mode 100644
> index 0000000..c2c18e2
> --- /dev/null
> +++ b/meta-oe/recipes-core/systemd/systemd-v189/var-run.conf
> @@ -0,0 +1,4 @@
> +# empty /var/run
> +R	/var/run/*	-	-	-	-	-
> +# systemd-update-utmp-runlevel.service fails to start without this
> +f /var/run/utmp 0644 root root - -
> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb =
b/meta-oe/recipes-core/systemd/systemd_v189.bb
> similarity index 99%
> rename from meta-oe/recipes-core/systemd/systemd_git.bb
> rename to meta-oe/recipes-core/systemd/systemd_v189.bb
> index 712ec79..613f703 100644
> --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> +++ b/meta-oe/recipes-core/systemd/systemd_v189.bb
> @@ -15,10 +15,6 @@ SERIAL_CONSOLE ?=3D "115200 /dev/ttyS0"
>=20
> SECTION =3D "base/shell"
>=20
> -inherit gitpkgv
> -PKGV =3D "v${GITPKGVTAG}"
> -
> -PV =3D "git"
> PR =3D "r6"
>=20
> inherit useradd pkgconfig autotools perlnative
> --=20
> 1.7.10.4
>=20



