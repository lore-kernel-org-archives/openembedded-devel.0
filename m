Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1O5Ij5-0003dw-D6
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 15:15:24 +0200
Received: from [192.168.1.9] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 8EC835846E9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Apr 2010 15:16:10 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1078)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <1272026558-6493-1-git-send-email-mchazaux@adeneo-embedded.com>
Date: Fri, 23 Apr 2010 15:11:46 +0200
Message-Id: <EEA73A5C-2112-472C-A4C0-6F12B4D7E198@vanille-media.de>
References: <1272026558-6493-1-git-send-email-mchazaux@adeneo-embedded.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1078)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add error handling to stage-manager
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
X-List-Received-Date: Fri, 23 Apr 2010 13:15:24 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Am 23.04.2010 um 14:42 schrieb Micka=EBl Chazaux:

> 	Add an error message telling the cause of the crash to the user.
> ---
> recipes/stage-manager/files/stage-manager |   14 +++++++++-----
> 1 files changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes/stage-manager/files/stage-manager =
b/recipes/stage-manager/files/stage-manager
> index 536d1af..a2ecebe 100755
> --- a/recipes/stage-manager/files/stage-manager
> +++ b/recipes/stage-manager/files/stage-manager
> @@ -29,11 +29,15 @@ def read_cache(cachefile):
>     lines =3D f.readlines()
>     f.close()
>     for l in lines:
> -        data =3D l.split('|')
> -        cache[data[0]] =3D {}
> -        cache[data[0]]['ts'] =3D int(data[1])
> -        cache[data[0]]['size'] =3D int(data[2])
> -        cache[data[0]]['seen'] =3D False
> +	try:
> +            data =3D l.split('|')
> +            cache[data[0]] =3D {}
> +            cache[data[0]]['ts'] =3D int(data[1])
> +            cache[data[0]]['size'] =3D int(data[2])
> +            cache[data[0]]['seen'] =3D False
> +	except IndexError, e:
> +            print("Corrupted line in cachefile " + cachefile + " : " =
+ l)
> +	    raise e
>     return cache
>=20

Completely unrelated, but this code is slow. The recurring
evaluation of cache[data[0]] is not being cached or optimized,
I suggest something along:

d =3D cache[data[0]] =3D {}
d["ts"] =3D int(data[1])
d["size"] =3D int(data[2])
...

:M:



