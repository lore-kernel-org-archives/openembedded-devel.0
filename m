Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1O2JfU-00009S-6F
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 09:39:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 8A8E22C7F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 07:34:48 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id enjtDxAgXwPN
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 07:34:44 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id D45FA2C7DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 07:34:43 +0000 (UTC)
Message-ID: <4BC6C1D0.5030205@gmail.com>
Date: Thu, 15 Apr 2010 09:35:44 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1271270768-6212-1-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1271270768-6212-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH v3] linux-libc-headers 2.6.23: add newer ARM hwcap flags
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
X-List-Received-Date: Thu, 15 Apr 2010 07:39:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz ha scritto, Il 14/04/2010 20:46:
> From: Marcin Juszkiewicz <marcin@buglabs.net>
>=20
> OpenJDK uses HWCAP_THUMBEE which is not present in 2.6.23 headers.
>=20
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  .../arm-hwcap-add-new-entries.patch                |   21 ++++++++++++=
++++++++
>  .../linux-libc-headers_2.6.23.bb                   |    5 ++-
>  2 files changed, 24 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.6.2=
3/arm-hwcap-add-new-entries.patch
>=20
> diff --git a/recipes/linux-libc-headers/linux-libc-headers-2.6.23/arm-h=
wcap-add-new-entries.patch b/recipes/linux-libc-headers/linux-libc-header=
s-2.6.23/arm-hwcap-add-new-entries.patch
> new file mode 100644
> index 0000000..934db51
> --- /dev/null
> +++ b/recipes/linux-libc-headers/linux-libc-headers-2.6.23/arm-hwcap-ad=
d-new-entries.patch
> @@ -0,0 +1,21 @@
> +---
> + include/asm-arm/hwcap.h |    4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +--- linux-2.6.23.orig/include/asm-arm/hwcap.h
> ++++ linux-2.6.23/include/asm-arm/hwcap.h
> +@@ -13,10 +13,14 @@
> + #define HWCAP_VFP	64
> + #define HWCAP_EDSP	128
> + #define HWCAP_JAVA	256
> + #define HWCAP_IWMMXT	512
> + #define HWCAP_CRUNCH	1024
> ++#define HWCAP_THUMBEE	2048
> ++#define HWCAP_NEON	4096
> ++#define HWCAP_VFPv3	8192
> ++#define HWCAP_VFPv3D16	16384
> +=20
> + #if defined(__KERNEL__) && !defined(__ASSEMBLY__)
> + /*
> +  * This yields a mask that user programs can use to figure out what
> +  * instruction set this cpu supports.
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb b/=
recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> index 95152f1..b4766bc 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> @@ -2,11 +2,12 @@ require linux-libc-headers.inc
> =20
>  INHIBIT_DEFAULT_DEPS =3D "1"
>  DEPENDS +=3D "unifdef-native"
> -PR =3D "r4"
> +PR =3D "r6"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar=
.bz2 \
>             file://procinfo.h \
> -           file://unifdef.patch;patch=3D1"
> +           file://unifdef.patch;patch=3D1 \
> +           file://arm-hwcap-add-new-entries.patch;patch=3D1"
> =20
>  S =3D "${WORKDIR}/linux-${PV}"
> =20

Acked-by: Marco Cavallini <m.cavallini@koansoftware.com>


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com



