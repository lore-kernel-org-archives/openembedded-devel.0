Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 036776CC7F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 09:16:52 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id cb5so657766wib.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 02:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=prQuOK/kbPw+BW4amyAqFRCud8lDmh1af6klLmAyR8Y=;
	b=hUyBMn0RxAAGGtAJ4j5XVowB9VPrkvfVyDoK0AE9iGoY/JeesQW74cdrWgSH2NuJOc
	9wVAGwSO+5aAw2kRU9pT4GcxQXmVsi7Eg0k3LLpT1SwKfm/SALxMh/qzLzhuJmk/BF0L
	DDbBNRAhBr7pVeNWZ98B0CwgZDT8eNaPbsBHKHau9533TwVZtI2mW+cFmoyDaGAYkt07
	QuoEqurE3q8N15sjmeN7WW9hG4zRhb4Fd1OmNV/ZfbNr1IR4efP2Ukn6f50rbKcli/17
	jwjkK9ik8lqsAqjKuULyvk5w+pQgdYS/rXT1eEw3ofBPz167p/G1DKV+LqOeCnA73DT+
	TeHg==
X-Gm-Message-State: ALoCoQlyro7yhORC7sfH3XyflU9JIyheX3REEFk3mC7oM08HelvCnU/b6SikH7ITtgwUL27a8DEH
X-Received: by 10.180.160.240 with SMTP id xn16mr2319009wib.62.1381483014075; 
	Fri, 11 Oct 2013 02:16:54 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id gp9sm3752609wib.8.2013.10.11.02.16.52
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Oct 2013 02:16:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1381478940-18836-1-git-send-email-fathi.boudra@linaro.org>
Date: Fri, 11 Oct 2013 11:16:55 +0200
Message-Id: <DBA386E2-0946-4250-A4C0-F626982DFDC9@dominion.thruhere.net>
References: <1381478940-18836-1-git-send-email-fathi.boudra@linaro.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] [meta-oe][PATCH] python-numpy: add config files for armeb architecture
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
X-List-Received-Date: Fri, 11 Oct 2013 09:16:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 okt. 2013, om 10:09 heeft Fathi Boudra <fathi.boudra@linaro.org> =
het volgende geschreven:

> Fix python-numpy build failure on armeb architecture.
>=20
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Acked-by: Koen Kooi <koen.kooi@linaro.org>

> ---
> .../python/python-numpy/armeb/config.h              | 21 =
+++++++++++++++++++++
> .../python/python-numpy/armeb/numpyconfig.h         | 17 =
+++++++++++++++++
> .../recipes-devtools/python/python-numpy_1.7.0.bb   |  5 +++++
> 3 files changed, 43 insertions(+)
> create mode 100644 =
meta-oe/recipes-devtools/python/python-numpy/armeb/config.h
> create mode 100644 =
meta-oe/recipes-devtools/python/python-numpy/armeb/numpyconfig.h
>=20
> diff --git =
a/meta-oe/recipes-devtools/python/python-numpy/armeb/config.h =
b/meta-oe/recipes-devtools/python/python-numpy/armeb/config.h
> new file mode 100644
> index 0000000..17ef186
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-numpy/armeb/config.h
> @@ -0,0 +1,21 @@
> +/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
> +/* #define SIZEOF_SHORT 2 */
> +/* #define SIZEOF_INT 4 */
> +/* #define SIZEOF_LONG 4 */
> +/* #define SIZEOF_FLOAT 4 */
> +/* #define SIZEOF_DOUBLE 8 */
> +#define SIZEOF_LONG_DOUBLE 12
> +#define SIZEOF_PY_INTPTR_T 4
> +/* #define SIZEOF_LONG_LONG 8 */
> +#define SIZEOF_PY_LONG_LONG 8
> +/* #define CHAR_BIT 8 */
> +#define MATHLIB m
> +#define HAVE_FLOAT_FUNCS
> +#define HAVE_LOG1P
> +#define HAVE_EXPM1
> +#define HAVE_INVERSE_HYPERBOLIC
> +#define HAVE_INVERSE_HYPERBOLIC_FLOAT
> +#define HAVE_ISNAN
> +#define HAVE_ISINF
> +#define HAVE_RINT
> +
> diff --git =
a/meta-oe/recipes-devtools/python/python-numpy/armeb/numpyconfig.h =
b/meta-oe/recipes-devtools/python/python-numpy/armeb/numpyconfig.h
> new file mode 100644
> index 0000000..c4bf654
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-numpy/armeb/numpyconfig.h
> @@ -0,0 +1,17 @@
> +/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
> +/*
> + *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT=20
> + *   */
> +#define NPY_SIZEOF_SHORT 2=20
> +#define NPY_SIZEOF_INT 4=20
> +#define NPY_SIZEOF_LONG 4=20
> +#define NPY_SIZEOF_FLOAT 4=20
> +#define NPY_SIZEOF_DOUBLE 8=20
> +#define NPY_SIZEOF_LONGDOUBLE 12=20
> +#define NPY_SIZEOF_PY_INTPTR_T 4=20
> +#define NPY_NO_SMP 0
> +
> +#define NPY_SIZEOF_LONGLONG 8=20
> +#define NPY_SIZEOF_PY_LONG_LONG 8=20
> +/* #define CHAR_BIT 8 */
> +
> diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb =
b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> index 7d2f2e2..e6d328f 100644
> --- a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> +++ b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "A sophisticated Numeric Processing =
Package for Python"
> SECTION =3D "devel/python"
> LICENSE =3D "PSF"
> LIC_FILES_CHKSUM =3D =
"file://LICENSE.txt;md5=3Df87832d854acbade6e9f5c601c8b30b1"
> +PR =3D "r1"
>=20
> SRC_URI =3D "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
>            ${CONFIGFILESURI} "
> @@ -16,6 +17,10 @@ CONFIGFILESURI_arm =3D " \
>     file://config.h \
>     file://numpyconfig.h \
> "
> +CONFIGFILESURI_armeb =3D " \
> +    file://config.h \
> +    file://numpyconfig.h \
> +"
> CONFIGFILESURI_mipsel =3D " \
>     file://config.h \
>     file://numpyconfig.h \
> --=20
> 1.8.1.2
>=20


