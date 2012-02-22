Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0IHE-00055I-SV
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 20:55:00 +0100
Received: by lahc1 with SMTP id c1so505169lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 11:46:40 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.42.72 as permitted sender) client-ip=10.112.42.72; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.42.72 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.42.72])
	by 10.112.42.72 with SMTP id m8mr12015547lbl.10.1329940000460 (num_hops
	= 1); Wed, 22 Feb 2012 11:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=R5Jq2xxlJKxQYOKpKllSiEvFk94y+aff/lPkOjFtQho=;
	b=w1RUyw3LMO7a3iVHmpfwR6uOgV6PCrtwMeMqJwJPEcZ7x7n4GYIxUGdLWursU0DKFN
	FhDuQtbITq4dkOpsrv6LpFtj4tflVgaFj1Idyu7UC9BZd6hQ22HnzI/wq4MCWJim2+jl
	A/Jr0i7Mk72NFuK//CqDb+gXvQchKvILb5XC4=
Received: by 10.112.42.72 with SMTP id m8mr10087201lbl.10.1329940000362; Wed,
	22 Feb 2012 11:46:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Wed, 22 Feb 2012 11:46:10 -0800 (PST)
In-Reply-To: <ji399r$72u$1@dough.gmane.org>
References: <1329792457-3884-1-git-send-email-raj.khem@gmail.com>
	<ji399r$72u$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Feb 2012 11:46:10 -0800
Message-ID: <CAMKF1sonEX_6Zx-h385OFUT0FS_tn_bx9Ui7cm-nAOo7r_woFQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] udev: Upgrade 180 -> 181
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
X-List-Received-Date: Wed, 22 Feb 2012 19:55:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 9:40 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 21-02-12 03:47, Khem Raj schreef:
>> 180 does not compile with kmod-5
>
> As a precaution: how did you test it?

I booted an image on qemuarm but not on a real hardware
something that I think should be good to be done before
getting this in.

>
> regards,
>
> Koen
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com> ---
>> .../recipes-core/udev/{udev_180.bb =3D> udev_181.bb} | =C2=A0 =C2=A05 ++=
+-- 1 files
>> changed, 3 insertions(+), 2 deletions(-) rename
>> meta-oe/recipes-core/udev/{udev_180.bb =3D> udev_181.bb} (95%)
>>
>> diff --git a/meta-oe/recipes-core/udev/udev_180.bb
>> b/meta-oe/recipes-core/udev/udev_181.bb similarity index 95% rename from
>> meta-oe/recipes-core/udev/udev_180.bb rename to
>> meta-oe/recipes-core/udev/udev_181.bb index 4cabcce..1e0a02a 100644 ---
>> a/meta-oe/recipes-core/udev/udev_180.bb +++
>> b/meta-oe/recipes-core/udev/udev_181.bb @@ -22,8 +22,9 @@ DEPENDS =3D
>> "gperf-native usbutils acl glib-2.0 util-linux kmod" # version specific
>> SRC_URI SRC_URI =3D
>> "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/${P}.tar.gz \
>> file://gtk-doc.make" -SRC_URI[md5sum] =3D
>> "7a74429e5b4d5cc3d389945774807e46" -SRC_URI[sha256sum] =3D
>> "d8f021cc940da7c1f928e2e651c6aa00c5695f3227f560de4a65584e2f089115" +
>> +SRC_URI[md5sum] =3D "86fed9d76060c8157e550ca1b4ee3250" +SRC_URI[sha256s=
um]
>> =3D "b4b0fb6553926bb83ff43b65df44f29a3bce0980a970bcc4a80d5e4f81946f30"
>>
>> # generic SRC_URI SRC_URI +=3D " \
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iEYEARECAAYFAk9FKIQACgkQMkyGM64RGpHcQgCfdh9XbBY2PiWIPan2P9ie0l6x
> uzwAnAkeAaFqawKu1OA57wAaeRSuJP0/
> =3DU/fR
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


