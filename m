Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3A6F760043
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 09:09:20 +0000 (UTC)
Received: by wief7 with SMTP id f7so81051879wie.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 02:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=MfjUvGp0dqYhkYt3L9Mxsx4TfXxb96yW3sStZxGQo2o=;
	b=QVkgc0qY0OE3B7Mn/jOKmU1b50GAvHR3UlEMFjbh+aQcdIo/oYVWkn6+7r+esdHHxM
	qMgyai5tSTPJl+AHCYk2iqedSH0y9ojcwpFFBooSK9dg0TvLFL+MAPhBzswuPeII15UZ
	rhOBoe1MTmZkB0e2O9hgHDD6YQYqYmPsOQWoIVKHAJX2Dhy/Y80+X1jcurdNNwmX5Vf0
	niOxE/MPWIuR3PVCSUFFybAs9jB8lcpO67Fo1446WwPPfx7omhsch4XSY8IbLLoIXVmM
	BKwLfaQc8g7beLMR9ET61XnmUQONk3lNg5PLrQ4NaCYZf4gnU74AAmm3Cm/GTZgk/GYO
	z93A==
X-Received: by 10.194.58.11 with SMTP id m11mr18709583wjq.92.1431335361508;
	Mon, 11 May 2015 02:09:21 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id n1sm12274898wix.0.2015.05.11.02.09.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 May 2015 02:09:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 May 2015 11:09:52 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150511090952.GF2400@jama>
References: <1430795900-25986-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1430795900-25986-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] networkingmanager: QA warning for rdepends on polkit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 May 2015 09:09:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2015 at 08:18:20PM -0700, Armin Kuster wrote:
> WARNING: QA Issue: networkmanager rdepends on polkit, but it isn't a buil=
d dependency? [build-deps]
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb     |=
 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_0.9.8.10.bb b/meta-networking/recipes-connectivity/networkmanager/ne=
tworkmanager_0.9.8.10.bb
> index 8d37c98..36a4a7e 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
0.9.8.10.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
0.9.8.10.bb
> @@ -37,11 +37,12 @@ PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURE=
S','systemd','systemd','conso
>  PACKAGECONFIG[systemd] =3D " \
>      --with-systemdsystemunitdir=3D${systemd_unitdir}/system --with-sessi=
on-tracking=3Dsystemd --enable-polkit, \
>      --without-systemdsystemunitdir, \
> -    polkit \
> +    polkit, polkit \
>  "
>  # consolekit is not picked by shlibs, so add it to RDEPENDS too
>  PACKAGECONFIG[consolekit] =3D "--with-session-tracking=3Dconsolekit,,con=
solekit,consolekit"
>  PACKAGECONFIG[concheck] =3D "--enable-concheck,--disable-concheck,libsou=
p-2.4"
> +PACKAGECONFIG[polkit] =3D "--enable-polkit, --disable-polkit, , polkit"

Shouldn't it have polkit as build time dependency (3rd argument, not 4th)

Also the subject is wrong, it's networkmanager, not networkingmanager.

> =20
>  # Work around dbus permission problems since we lack a proper at_console
>  do_install_prepend() {
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

