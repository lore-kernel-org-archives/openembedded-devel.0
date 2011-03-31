Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5PCb-0005ho-8r
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 23:14:49 +0200
Received: by fxm19 with SMTP id 19so2487908fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 14:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=rsWYpWpHF3o6X72ugccTtVu31JXnBhVgUp9bPmxw+Xg=;
	b=mgdwuK9luzOYG35m8Mc2xH8FGbypbZ1B4qTMP2FEHPnFak8V5jvF2Phmw967UG8T5+
	QSLQEf0QT89eFxtbmjr9I00mN3N1VfDh0ZOGoikH09Z3enRlRPK/xMANb8e4fAhvJvV2
	ZG+tokS+19W/e7Pb15qzXbyfMuzbD4PDBTEjM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=sefl7b4tf4rcs0Zkzz0zLve5DA0xizswNk1FaBjbzDIYDSWUFqHpZvLoAFbCsrN2KP
	tWidbjzMy5w82GiM5nZ1ZJ83IXqlZYTW9160K6eHlj10IxF08bA4WZBpBD9kmUQtuJvT
	HEX37FckbY1x57+dvb40d2owyHXIlq/QOzxP0=
Received: by 10.223.14.137 with SMTP id g9mr1979908faa.8.1301605969066; Thu,
	31 Mar 2011 14:12:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Thu, 31 Mar 2011 14:12:19 -0700 (PDT)
In-Reply-To: <1301508491-3062-3-git-send-email-Chase.Maupin@ti.com>
References: <1301508491-3062-1-git-send-email-Chase.Maupin@ti.com>
	<1301508491-3062-3-git-send-email-Chase.Maupin@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2011 14:12:19 -0700
Message-ID: <AANLkTinDdEKgOWW0ZHLSc8d_0PRWydOGAQNDCnhbqNXK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 3/6] u-boot: Add PSP version for am387x-evm
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
X-List-Received-Date: Thu, 31 Mar 2011 21:14:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2011 at 11:08 AM, Chase Maupin <chasemaupin03@gmail.com> wr=
ote:
> * Add the TI PSP u-boot version for the am387x-evm machine type
> * Make this version the default preference for ti814x
> =C2=A0SOC_FAMILY devices.
> * Based on u-boot recipe from Arago contributed by Nageswari
> =C2=A0Srinivasan
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
> =C2=A0recipes/u-boot/u-boot_2010.06-psp04.01.00.03.bb | =C2=A0 14 +++++++=
+++++++
> =C2=A01 files changed, 14 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/u-boot/u-boot_2010.06-psp04.01.00.03.bb
>
> diff --git a/recipes/u-boot/u-boot_2010.06-psp04.01.00.03.bb b/recipes/u-=
boot/u-boot_2010.06-psp04.01.00.03.bb
> new file mode 100644
> index 0000000..d4a2afc
> --- /dev/null
> +++ b/recipes/u-boot/u-boot_2010.06-psp04.01.00.03.bb
> @@ -0,0 +1,14 @@
> +require u-boot-omap3.inc
> +
> +COMPATIBLE_MACHINE =3D "ti814x"
> +
> +DEFAULT_PREFERENCE_ti814x =3D "1"
> +BRANCH =3D "master"
> +
> +# Use literal tags in SRCREV, when available, instead of commit IDs
> +SRCREV =3D "v2010.06_TI814XPSP_04.01.00.03"
> +
> +UVER =3D "2010.06"
> +PSPREL =3D "04.01.00.03"
> +
> +PR =3D "r1"

new recipe starts at r0
otherwise ok

> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


