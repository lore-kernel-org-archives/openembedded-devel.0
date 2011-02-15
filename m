Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpSHt-0003Va-K3
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 22:18:21 +0100
Received: by fxm17 with SMTP id 17so620396fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 13:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=fvoMF9Te255Tj91OmsZrDehfMdrFRlXQNnBgj1O+lyU=;
	b=NJ9D6XVTGr6DlAjnthoTHQS9t2juGjGRkLJcTd9xaKas5XyDoyl/dx+HA9QK41sUZ0
	RYnGbkqpRqPHZ09+bdS+9rEupKvNCsz7Nmv2/dQ4P59gp9KE9zbov4ARrU29qYZGypJW
	ntsIJ/mmJ61TZzaUkLynZeBVYdf72dgnLUVJc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=OL7h/bKYlqiWWAnOKFgnprDn0lCxUfa0QTu8BS+I4zCF4co+e3j6qGKl7EuVMi+aAQ
	WG5FBAtFBUNhGE+sZCz1opim32qpn1AnwVynXXrhcxmc8dkm/UtOLUo4w2P3lDpTm5qa
	r+/kOaiCdfrbrzUzMzXCvuQ38IgTt6ScS0HKY=
Received: by 10.223.83.7 with SMTP id d7mr4002482fal.82.1297804631087; Tue, 15
	Feb 2011 13:17:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Tue, 15 Feb 2011 13:16:38 -0800 (PST)
In-Reply-To: <1297803782-8395-2-git-send-email-Martin.Jansa@gmail.com>
References: <1297803782-8395-1-git-send-email-Martin.Jansa@gmail.com>
	<1297803782-8395-2-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Feb 2011 13:16:38 -0800
Message-ID: <AANLkTi=it6Wcu_=WPSZHm5YpijEUu8kBuSMvR66h2WMk@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/4] SHR: drop P_V for glib-2.0 (upgrades from 2.26.1 to 2.28.0)
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
X-List-Received-Date: Tue, 15 Feb 2011 21:18:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 1:02 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0conf/distro/include/preferred-shr-versions.inc | =C2=A0 =C2=A02 --
> =C2=A01 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro=
/include/preferred-shr-versions.inc
> index 206d270..c0099b8 100644
> --- a/conf/distro/include/preferred-shr-versions.inc
> +++ b/conf/distro/include/preferred-shr-versions.inc
> @@ -21,8 +21,6 @@ PREFERRED_VERSION_xserver-common =3D "1.33"
> =C2=A0PREFERRED_VERSION_xserver-nodm-init =3D "2.0"
> =C2=A0PREFERRED_VERSION_hal =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "0.5.1=
3"
> =C2=A0PREFERRED_VERSION_wpa-supplicant =3D "0.6.9"
> -PREFERRED_VERSION_glib-2.0 =C2=A0 =C2=A0 =C2=A0=3D "2.26.1"
> -PREFERRED_VERSION_glib-2.0-native =3D "2.26.1"
> =C2=A0PREFERRED_VERSION_openssl =3D "1.0.0c"
> =C2=A0PREFERRED_VERSION_openssl-native =3D "1.0.0c"
> =C2=A0PREFERRED_VERSION_perl =3D "5.10.1"
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


