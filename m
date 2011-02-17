Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PqCUU-0005VL-7Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 23:38:26 +0100
Received: by fxm17 with SMTP id 17so2967502fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 14:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=FiY7jrgxn9EQa+tUxEKfCXtsvpjQhIy+bma01pEqE2U=;
	b=t3sEooLscSjdqyLBEytekS4PrNb1WvZlxJQQ0Orud1l1RbTbuLwanf++yF7bSu1PzF
	VDklFXTuPKLVTQnNRK7CtTmmzmWCFPJYUaz1rBX1him6UCNIrmEQAlSLjh1YoBXm9yJy
	VT/bTLQIu6CuZ8BtczsUJOI9NMXdvxqjvUoq0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=t1E45njkdw30atypH/ios7ZC8Vix5mudu5jngWB6HXGcCSYGQ0NUlx1oqmc15JmqZt
	cRVg+G4nzvv9DCMRuDkM+B8WR6VSZ369lT3frXthJBE6Mz9TXaN6Q5DxOQQSRESwULsv
	U0o0HySreiofZe4W+kJ7+bh+Xr/dje0uaCtrI=
Received: by 10.223.79.74 with SMTP id o10mr3156188fak.63.1297982233606; Thu,
	17 Feb 2011 14:37:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Thu, 17 Feb 2011 14:36:51 -0800 (PST)
In-Reply-To: <1297973356-24903-1-git-send-email-filip.zyzniewski@gmail.com>
References: <AANLkTikjzq=jS=+RTpZ=uxeA_5++CfZT3RetB9et29nS@mail.gmail.com>
	<1297973356-24903-1-git-send-email-filip.zyzniewski@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Feb 2011 14:36:51 -0800
Message-ID: <AANLkTimgvFGYV9CAb4Ats8GG4ikmXK7Dkgu_e4+XntMb@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: fix retrieving dependencies between modules.
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
X-List-Received-Date: Thu, 17 Feb 2011 22:38:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2011 at 12:09 PM, Filip Zyzniewski
<filip.zyzniewski@gmail.com> wrote:
> get_dependencies() searched for a filename key in dependencies
> directory with the /lib/modules/kernel_version prefix while
> the directory had entries stripped of it.
>
> Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0classes/kernel.bbclass | =C2=A0 =C2=A07 ++++++-
> =C2=A01 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index e22211d..3642a53 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -385,7 +385,12 @@ python populate_packages_prepend () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return deps
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0def get_dependencies(file, pattern, format):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file =3D file.replace(=
bb.data.getVar('PKGD', d, 1) or '', '', 1)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D os.path.nor=
mpath(os.path.join(
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 os.path.join(bb.data.getVar('PKGD', d, 1) or ''),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 'lib/modules',
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 bb.data.getVar('KERNEL_VERSION', d, 1)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )) + '/'
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file =3D file.replace(=
prefix, '', 1)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if module_deps.has=
_key(file):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0import re
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


