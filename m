Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SqrDJ-0007jv-J6
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 21:44:13 +0200
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 3E4CAA6210
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 21:32:52 +0200 (CEST)
Date: Mon, 16 Jul 2012 21:32:51 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120716213251.49a82802@eb-e6520>
In-Reply-To: <1342466698-9473-1-git-send-email-Martin.Jansa@gmail.com>
References: <1342466698-9473-1-git-send-email-Martin.Jansa@gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-browser][PATCH] chromium: restrict COMPATIBLE_MACHINE to any armv6 or armv7a MACHINE
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
X-List-Received-Date: Mon, 16 Jul 2012 19:44:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Mon, 16 Jul 2012 21:24:58 +0200,
Martin Jansa <martin.jansa@gmail.com> a =E9crit :

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-browser/chromium/chromium_19.0.1049.3.bb |    5 +++++
>  recipes-browser/chromium/chromium_20.0.1086.0.bb |    5 +++++
>  2 files changed, 10 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes-browser/chromium/chromium_19.0.1049.3.bb b/recipes-b=
rowser/chromium/chromium_19.0.1049.3.bb
> index 4c9de8e..e657c48 100644
> --- a/recipes-browser/chromium/chromium_19.0.1049.3.bb
> +++ b/recipes-browser/chromium/chromium_19.0.1049.3.bb
> @@ -10,6 +10,11 @@ SRC_URI =3D "http://commondatastorage.googleapis.com/c=
hromium-browser-official/${P
>  	file://softfloat-fix.patch \
>  "
> =20
> +# include.gypi exists only for armv6 and armv7a and there isn't=20

applied thanks, and if anyone want to adapt these recipes to other
archs : feel free to send patches ;-)

Eric


