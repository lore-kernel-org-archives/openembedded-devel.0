Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1SCoTO-00013f-Hk
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 10:43:18 +0200
Received: by vcbfl13 with SMTP id fl13so633488vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 01:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=FPcnKeLRw1hOzneEefMpsFOrkMRhBQ778avb4tpwAUI=;
	b=neJsr+zLKf1MN5dy2O+m6iZwuAkzOWYC2RdGRnb4evggTCc74dQemvfxeyMXUFdkaa
	Da0VpGjRFsFcFDMRf5GXFaFhjQQ9/fcNvN92fH/z2+ZpXyrR1fhGm9CmLYxaHgkv2XTo
	sHwUI6YJuWnTJ375daYolseUOEO4D0OjLLSo8z4QGmnCPyhaO6fMGgm8dnJWC7JT6dlF
	5h+/dD03CbW72Rqt5SKAHA64y4RiRJRKx0/73ZulO71HykIet56WYpQZ6Nv0xmraKdvj
	bp1ciSwX9fNEKxy+iSDHdwaIUj07nj9r17HkPyUsPxX/bbbmzrvKcWU3U1JOZwwrFK31
	v02g==
MIME-Version: 1.0
Received: by 10.220.147.198 with SMTP id m6mr13656097vcv.14.1332923656174;
	Wed, 28 Mar 2012 01:34:16 -0700 (PDT)
Received: by 10.52.88.228 with HTTP; Wed, 28 Mar 2012 01:34:16 -0700 (PDT)
In-Reply-To: <1332888458-15872-1-git-send-email-ajlennon@dynamicdevices.co.uk>
References: <1332888458-15872-1-git-send-email-ajlennon@dynamicdevices.co.uk>
Date: Wed, 28 Mar 2012 10:34:16 +0200
Message-ID: <CACW_hTZ1Bu7X12=BLq+dfX-xHQzy829_w-fjwDX0VEeSTuBw7Q@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex J Lennon <ajlennon@gmail.com>
Subject: Re: [PATCH] Modified fetch() checksums to be correct for libpng 1.4.28 released 15/3/12 (current) instead of previous 8/3/12 release
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
X-List-Received-Date: Wed, 28 Mar 2012 08:43:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2012/3/28  <ajlennon@dynamicdevices.co.uk>:
> From: Alex J Lennon <ajlennon@gmail.com>
>
> Signed-off-by: Alex J Lennon <ajlennon@gmail.com>
> ---
> =A0recipes/libpng/libpng_1.2.48.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/libpng/libpng_1.2.48.bb b/recipes/libpng/libpng_1.2.=
48.bb
> index 50a3c03..534962d 100644
> --- a/recipes/libpng/libpng_1.2.48.bb
> +++ b/recipes/libpng/libpng_1.2.48.bb
> @@ -2,5 +2,5 @@ require libpng.inc
>
> =A0PR =3D "${INC_PR}.0"
>
> -SRC_URI[libpng.md5sum] =3D "7612af5660cd4b5e8c433ce53bea01a7"
> -SRC_URI[libpng.sha256sum] =3D "f6db51aff81b6920203678b29e8c68a5e3703cf5b=
39ae5e9e56370d17f31b1c4"
> +SRC_URI[libpng.md5sum] =3D "74c8c261bdf9a75274e22875183fda07"
> +SRC_URI[libpng.sha256sum] =3D "b4c92df11eadf3e81705a58253dbffc4b95169186=
899e28abdfc8aada8a20fcc"
> --
> 1.7.5.4
>
You mean upstream changed their source tarball (or whatever) without
updating the version number.
Yuk.

Guess we might want to mirror a version and pull from the mirror.
(changing the checksum alone creates issues because other people might
already have the version with the old checksum in their downloads.

Frans

PS: thinking of it: we might be able to resolve the latter issue by
forcing the removal of a file from downloads (and trigger a refetch)
if the .md5 does not match the md5 in the recipe.


