Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PmWri-0006MH-S4
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 20:35:15 +0100
Received: by gyd8 with SMTP id 8so1894681gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Feb 2011 11:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=B7I2SIsNEygRruM+1mSGESROw4MdLtl8qlrvEOcgiwc=;
	b=Ye+QT10dOKLdEnXJHSixzWwuIAmiLeKDrQuEXVnLCJzkAWhUIJs07QepjA4f5vwVVp
	4c6/SdyfO2z7TbJScvS4gqYosjvwcXNDLla06amoN7E+ukkcDfmYh0NGaPOssWirBKf3
	7SJQm/KCoelPGPeo7VW+VghDnrSzhzViduCaI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=dPGaJb4Ni7EblmVpV9AQU05SasHex2jrv+vnE5Eir1ajCP6HN1hmjXR0vDlodTiVVW
	LHQEYwGU830IIZgVzxex3PKJmRXQoXjkJRuQLF7Cs6M/Ynsrb/i3o9fZLCqUv5+goNqy
	ICn3KN3a+f4tAmtTEkp8zjyV7N6jfBOcZFRys=
Received: by 10.91.160.30 with SMTP id m30mr19822695ago.61.1297107249374; Mon,
	07 Feb 2011 11:34:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Mon, 7 Feb 2011 11:33:49 -0800 (PST)
In-Reply-To: <1297093986-24331-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1297093986-24331-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Feb 2011 11:33:49 -0800
Message-ID: <AANLkTinsSoak9h=B+TQEzoUvWSP+MVELZQkTFRu3PTOQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] cortex-m3: adjusted target cflags
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
X-List-Received-Date: Mon, 07 Feb 2011 19:35:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 7, 2011 at 7:53 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Explicit '-mthumb' is required because Cortex-M3 does not support ARM
> instructions and actual flags cause gcc to fail with 'error: target CPU
> does not support ARM mode'.
>
> The '-mcpu=3Dcortex-m3' is shorter than '-march=3Darmv7-m -mtune=3Dcortex=
-m3'
> and enables workarounds like '-mfix-cortex-m3-ldrd'.

Does -mcpu=3Dcortex-m3 also cause gcc to tune for cortex-m3 ?

>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
> =C2=A0conf/machine/include/tune-cortexm3.inc | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/machine/include/tune-cortexm3.inc b/conf/machine/includ=
e/tune-cortexm3.inc
> index 6da9aee..a66a33c 100644
> --- a/conf/machine/include/tune-cortexm3.inc
> +++ b/conf/machine/include/tune-cortexm3.inc
> @@ -1,4 +1,4 @@
> =C2=A0# valid options for -march: `armv7', `armv7-m'
> -TARGET_CC_ARCH =3D "-march=3Darmv7-m -mtune=3Dcortex-m3 -mfpu=3Dvfp -mfl=
oat-abi=3Dsoftfp"
> +TARGET_CC_ARCH =3D "-mthumb -mcpu=3Dcortex-m3 -mfpu=3Dvfp -mfloat-abi=3D=
softfp"
> =C2=A0FEED_ARCH =3D "armv7"
> =C2=A0BASE_PACKAGE_ARCH =3D "armv7"
> --
> 1.7.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


