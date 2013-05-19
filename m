Received: from mail-ie0-f177.google.com ([209.85.223.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ue9zc-0002Bo-LZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 22:14:10 +0200
Received: by mail-ie0-f177.google.com with SMTP id 9so12516418iec.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 12:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=0W80hPgSb9cIpUnyxUpTEMNle29PR9aRM2xs5AVsHm0=;
	b=Xh0A8n/ghrOnfPPwb/1TbdZ80j5fT3fy/pUQq8aPh7y+MyaS7/ffl0fkeRQ8idM+oW
	bceio892m6xB2ftCumBgF5v0vTzKenh74PkH9Fv9Ur9ZutZMSXvL8UeC0MRwqYTaqz6m
	bX4QgvTwL/NYnH2FWOl3Ce+taviXHRFAyeRA/gfqmHd7KJyfzlCxcr/hks7i7p1LdZ55
	mR6mmV5NyvGedV0/plhEkZMdMwbUjX4EfEzd6ojxU4qTF6PktRg3a8iVCZHx0hXn+uuv
	zzxduIHqNYKHGZdAPlQSamjMQq3DhL9kuQwphSd8IjOV+xWxEPALH9J9bZu+m9Sqy846
	VodA==
MIME-Version: 1.0
X-Received: by 10.50.30.2 with SMTP id o2mr3406038igh.12.1368993348734; Sun,
	19 May 2013 12:55:48 -0700 (PDT)
Received: by 10.50.109.133 with HTTP; Sun, 19 May 2013 12:55:48 -0700 (PDT)
In-Reply-To: <1368959233-28288-2-git-send-email-schnitzeltony@googlemail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
	<1368959233-28288-2-git-send-email-schnitzeltony@googlemail.com>
Date: Sun, 19 May 2013 12:55:48 -0700
Message-ID: <CAMKF1soJ=_CAZ7BO3NsSLyUSZSaJo8wFdaHuJW+6h9E0xoiVAg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe++/master 01/11] mm-common: update to 0.9.6
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
X-List-Received-Date: Sun, 19 May 2013 20:14:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sunday, May 19, 2013, Andreas M=C3=BCller <schnitzeltony@googlemail.com>
wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb |   10 ----------
>  meta-oe/recipes-core/mm-common/mm-common_0.9.6.bb |   12 ++++++++++++
>  2 files changed, 12 insertions(+), 10 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb
>  create mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.6.bb
>
> diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bbb/meta-oe/r=
ecipes-core/mm-common/
mm-common_0.9.5.bb
> deleted file mode 100644
> index c49b4c8..0000000
> --- a/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -inherit gnomebase
> -
> -SRC_URI[archive.md5sum] =3D "4a4dad67fc8d7e0c529f3a8c6ba4d8b2"
> -SRC_URI[archive.sha256sum] =3D
"9c602dba89d264a4719db996b9b169716df2d4d10bcd24e56fc3572865a5cb8b"
> -
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> -
> -BBCLASSEXTEND =3D "native"
> -
> diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.6.bbb/meta-oe/r=
ecipes-core/mm-common/
mm-common_0.9.6.bb
> new file mode 100644
> index 0000000..f7e2507
> --- /dev/null
> +++ b/meta-oe/recipes-core/mm-common/mm-common_0.9.6.bb
> @@ -0,0 +1,12 @@
> +inherit gnomebase
> +
> +GNOME_COMPRESS_TYPE=3D"xz"

Does this mean you need to add dependency on xz-native ?
> +
> +SRC_URI[archive.md5sum] =3D "3b23749ab39441c392c016ce74632678"
> +SRC_URI[archive.sha256sum] =3D
"7c37158a1f37604705a9b9305d3b335fb8256f5de701c8801269dde4e2ce7dde"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +BBCLASSEXTEND =3D "native"
> +
> --
> 1.7.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

