Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PY1Et-0002si-Jv
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 19:59:11 +0100
Received: by yxd5 with SMTP id 5so4543851yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Dec 2010 10:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=biqSsvyoYMdMSDbrg1SOanWEeBjBcEhF2C67vbgAsho=;
	b=jZts8NbNlxYEtWxO4XzyVWksG7+nw6PiFLpmZ4K4qh+GAiJivRgD6qVTw6mnIMOxDs
	WfPmIOcWfyo7LSyD0ak1XhPSe8Yo9u0tKKwu6A1khv/BtdqJg19nwUFHC8b2sKZnLeg1
	4HfvpmvHAXMvHAZujwU7wM/Oh87mxLlOUi4Y0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=VOGzLNNjljFoUMtmiMhADgdtItu/eLL+H3rsiUgzds38jF5aUWY2D0Svt/XMHkMDc0
	3P2gjcmWOOGze+uJhLA71NKyaD4qiK6TeLzNYMHFvuz+olsB3XEnsyCUbQSQyM8Vv5q1
	K8829J/cpowdfaUwR2DW7IyfMoqCVZrOIC0iI=
Received: by 10.90.10.31 with SMTP id 31mr5963938agj.85.1293649133532; Wed, 29
	Dec 2010 10:58:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 29 Dec 2010 10:58:33 -0800 (PST)
In-Reply-To: <1293645497-22323-2-git-send-email-Martin.Jansa@gmail.com>
References: <1293644563.4238.7.camel@mattotaupa>
	<1293645497-22323-2-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Dec 2010 10:58:33 -0800
Message-ID: <AANLkTikeVS72ri7GyS5J-B2ZLpvtoYWfM9F0Gj4P3acZ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] util-linux-ng: drop udev dependency to break circular dbus dependency glib->dbus->libsm->util-linux-ng->udev->glib
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
X-List-Received-Date: Wed, 29 Dec 2010 18:59:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 29, 2010 at 9:58 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * see http://comments.gmane.org/gmane.comp.handhelds.openembedded/40368 f=
or details
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/util-linux-ng/util-linux-ng.inc | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux=
-ng/util-linux-ng.inc
> index fa367d9..4ef917f 100644
> --- a/recipes/util-linux-ng/util-linux-ng.inc
> +++ b/recipes/util-linux-ng/util-linux-ng.inc
> @@ -1,7 +1,7 @@
> =C2=A0DESCRIPTION =3D "Util-linux-ng is a suite of essential utilities fo=
r any Linux system."
> =C2=A0SECTION =3D "base"
> =C2=A0LICENSE =3D "GPL"
> -DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)=
} udev =C2=A0zlib ncurses virtual/libintl"
> +DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)=
} zlib ncurses virtual/libintl"
> =C2=A0DEPENDS_virtclass-native =3D "zlib-native ncurses-native lzo-native=
 gettext-native"
>
> =C2=A0inherit autotools gettext
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


