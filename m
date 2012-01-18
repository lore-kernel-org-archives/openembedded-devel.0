Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RnZYE-00066W-53
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jan 2012 18:43:58 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B440211001B1;
	Wed, 18 Jan 2012 18:36:21 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id EF0D4110018B;
	Wed, 18 Jan 2012 18:36:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g230119221.adsl.alicedsl.de
	[92.230.119.221]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Wed, 18 Jan 2012 18:36:20 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 320023C4B0; Wed, 18 Jan 2012 18:36:20 +0100 (CET)
Date: Wed, 18 Jan 2012 18:36:20 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20120118173619.GB27993@mail.familie-heinold.de>
References: <1326645768-13447-1-git-send-email-eric@eukrea.com>
	<1326645768-13447-2-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1326645768-13447-2-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java 2/2] README: add a note concerning libstdc++-static
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
X-List-Received-Date: Wed, 18 Jan 2012 17:43:58 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2012 at 05:42:48PM +0100, Eric B=E9nard wrote:
> which is required for icedtea6-native
>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  README |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/README b/README
> index 926e5bf..803b4de 100644
> --- a/README
> +++ b/README
> @@ -18,6 +18,8 @@ PREFERRED_VERSION_cacaoh-native =3D "0.99.3"
>  PREFERRED_VERSION_openjdk-6-jre =3D "6b18-1.8.11"
>  PREFERRED_VERSION_icedtea6-native =3D "1.8.11"
> =20
> +Please note that libstdc++ static is needed on your host to compile ic=
edtea6-native
> +(install libstdc++-static on a Fedora).
> =20
>  Send pull requests to openembedded-devel@lists.openembedded.org
> =20
> --=20

I applied this patch. Jamvm and cacao seems to be stable now, so maybe we
can compile the target openjdk with them again.

Bye Henning


