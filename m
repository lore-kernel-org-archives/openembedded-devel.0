Received: from 18.mo3.mail-out.ovh.net ([87.98.172.162]
	helo=mo3.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TdoPn-000415-9S
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 21:39:29 +0100
Received: from mail637.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 9419CFFA1F8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 21:21:11 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 28 Nov 2012 22:10:20 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 28 Nov 2012 22:10:19 +0200
Date: Wed, 28 Nov 2012 21:09:48 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: marcin.juszkiewicz@linaro.org
X-Ovh-Mailout: 178.32.228.3 (mo3.mail-out.ovh.net)
Message-ID: <20121128210948.0f75a586@eb-e6520>
In-Reply-To: <1354114941-14552-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <50B61115.6000008@linaro.org>
	<1354114941-14552-1-git-send-email-marcin.juszkiewicz@linaro.org>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.1 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 8046525159692021065
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehiedrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehiedrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] php: add apache configuration for php-fpm
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
X-List-Received-Date: Wed, 28 Nov 2012 20:39:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Marcin,

Le Wed, 28 Nov 2012 16:02:21 +0100,
Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> a =E9crit :

> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta-oe/recipes-devtools/php/php.inc       | 8 ++++++--
>  meta-oe/recipes-devtools/php/php_5.3.19.bb | 1 +
>  2 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php_5.3.19.bb b/meta-oe/recipes=
-devtools/php/php_5.3.19.bb
> index 27baa1d..8204104 100644
> --- a/meta-oe/recipes-devtools/php/php_5.3.19.bb
> +++ b/meta-oe/recipes-devtools/php/php_5.3.19.bb
> @@ -15,6 +15,7 @@ SRC_URI_append_pn-php +=3D "file://iconv.patch \
>              file://php_exec_native.patch \
>              file://fix-fpm-cross-compile.patch \
>              file://php-fpm.conf \
> +            file://php-fpm-apache.conf \
>              "
the conf file is missing from your patch.

Eric


