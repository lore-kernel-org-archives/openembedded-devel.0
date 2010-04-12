Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1O1Erg-0001Ah-SP
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Apr 2010 10:19:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id BA7F42C7F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Apr 2010 08:15:06 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jlkBK4HrIj0t
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Apr 2010 08:15:02 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 586CA2C7DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Apr 2010 08:15:01 +0000 (UTC)
Message-ID: <4BC2D6BD.6080302@gmail.com>
Date: Mon, 12 Apr 2010 10:15:57 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1271059777-31579-1-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1271059777-31579-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] udev 124: disable devcache on BUG 2.0
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
X-List-Received-Date: Mon, 12 Apr 2010 08:19:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz ha scritto, Il 12/04/2010 10:09:
> From: Marcin Juszkiewicz <marcin@buglabs.net>
>=20
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  recipes/udev/udev-124/bug20/default |    4 ++++
>  recipes/udev/udev_124.bb            |    2 +-
>  2 files changed, 5 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/udev/udev-124/bug20/default
>=20
> diff --git a/recipes/udev/udev-124/bug20/default b/recipes/udev/udev-12=
4/bug20/default
> new file mode 100644
> index 0000000..d0050b8
> --- /dev/null
> +++ b/recipes/udev/udev-124/bug20/default
> @@ -0,0 +1,4 @@
> +# Default for /etc/init.d/udev
> +
> +# Comment this out to disable device cache
> +#DEVCACHE=3D"/etc/dev.tar"
> diff --git a/recipes/udev/udev_124.bb b/recipes/udev/udev_124.bb
> index ab391a3..c54dff6 100644
> --- a/recipes/udev/udev_124.bb
> +++ b/recipes/udev/udev_124.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "udev is a daemon which dynamically cre=
ates and removes device nod
>  /dev/, handles hotplug events and loads drivers at boot time. It repla=
ces \
>  the hotplug package and requires a kernel not older than 2.6.12."
>  RPROVIDES_${PN} =3D "hotplug"
> -PR =3D "r16"
> +PR =3D "r19"
> =20
>  SRC_URI =3D "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${P=
V}.tar.gz \
>  	   file://noasmlinkage.patch;patch=3D1 \

Acked-by: Marco Cavallini <m.cavallini@koansoftware.com>


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com


