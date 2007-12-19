Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J4xzQ-0000MK-Nb
	for openembedded-devel@openembedded.org; Wed, 19 Dec 2007 13:25:32 +0100
Received: from Powerbook-2.local (vpn006097.vpn.utwente.nl [130.89.6.97])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBJCKP0k015642 for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2007 13:20:26 +0100
Message-ID: <47690C8A.8090001@student.utwente.nl>
Date: Wed, 19 Dec 2007 13:20:26 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1187652493.20071219133208@gmail.com>
In-Reply-To: <1187652493.20071219133208@gmail.com>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] BogoFeeds reloaded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2007 12:25:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello openembedded-devel,

>   Well, using deploy dir as feed directly is still demolishfully
> practical, and clearing off my tree for NY, I'd finally want to offer
> the solution I've been using since then. Unlike solutions cited, it
> doesn't try to warp world to get familiar flat look, instead it
> rejoices 3D and sails on it, all in 6 lines, why I think it could
> finally get into.
> 
> --- classes/image.bbclass       57e9ee07875e7423b6e199df2c69e55bdcdb8a69
> +++ classes/image.bbclass       a5d924355c51d4ef706a5c60d520aa4dde64d764
> @@ -125,6 +125,13 @@ insert_feed_uris () {
>                 # insert new feed-sources
>                 echo "src/gz $feed_name $feed_uri" >> ${IMAGE_ROOTFS}/etc/ipkg/${feed_name}-feed.conf
>         done
> +
> +       if [ -n "${FEED_LOCAL_BASE_URI}" ]; then
> +           for arch in ${PACKAGE_ARCHS}
> +           do
> +               echo "src/gz local-$arch ${LOCAL_FEED_BASE_URI}/$arch" >> ${IMAGE_ROOTFS}/etc/ipkg/local-$arch-feed.conf
> +           done
> +       fi
>  }
>  
> So, you set FEED_LOCAL_BASE_URI to the root of deploy dir as exported
> by Apache, and - voila - you get nice collection of per-arch local feeds in
> the image.

Could you add a comment in image.bbclass and local.conf.sample on how to
use this, since it looks quite the same as FEED_URI to a new user, but
is quite different? And while you are at it, update the OE usermanual as
well?

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHaQyKMkyGM64RGpERAl5PAJ49efwK4trM3EzqYexrczg1zb9nzACeP9Zk
HMWnYe+hVkyVCtks4K7b62o=
=j0vG
-----END PGP SIGNATURE-----


