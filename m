Received: from note.orchestra.cse.unsw.edu.au ([129.94.242.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jayen@cse.unsw.edu.au>) id 1PNulY-0004PF-Gs
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 23:03:11 +0100
Received: From [129.94.172.249] ([129.94.172.249] == tigger.cse.unsw.EDU.AU)
	(auth-user jayen) (cse-authentic-sender jayen)
	By note With Smtp ; Thu, 2 Dec 2010 09:01:38 +1100 
From: Jayen Ashar <jayen@cse.unsw.edu.au>
To: eric@eukrea.com
Date: Thu, 02 Dec 2010 09:06:08 +1100
Message-ID: <4CF6C6D0.5040205@cse.unsw.edu.au>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 129.94.242.24
X-SA-Exim-Mail-From: jayen@cse.unsw.edu.au
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS, SPF_NEUTRAL,
	UNPARSEABLE_RELAY autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qwt: QT_LIBINFIX not being resolved when, running qmake
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
X-List-Received-Date: Wed, 01 Dec 2010 22:03:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I'm using the master branch for qwt, but I'm supporting an old fork of
OE, so I was using a snapshot at
cb429c4b7ae91b538603e771685aa39f020a5b6e (2009-06-24) for qt4-x11-free.

Thanks for that,
Jayen

- -------- Original Message --------
Subject: Openembedded-devel Digest, Vol 53, Issue 3
Date: Wed, 01 Dec 2010 09:55:55 +0100
From: openembedded-devel-request@lists.openembedded.org
Reply-To: openembedded-devel@lists.openembedded.org
To: openembedded-devel@lists.openembedded.org

Message: 2
Date: Wed, 01 Dec 2010 07:48:17 +0100
From: Eric B?nard <eric@eukrea.com>
Subject: Re: [oe] [PATCH] qwt: QT_LIBINFIX not being resolved when
	running qmake
To: openembedded-devel@lists.openembedded.org
Message-ID: <4CF5EFB1.2010000@eukrea.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed

On 01/12/2010 05:47, Jayen Ashar wrote:
> Fixed a problem where qmake would create a directory called 'obj${QT_LIBINFIX}'
> instead of resolving the QT_LIBINFIX variable and creating the appropriately
> resolved directory.
>
> Signed-off-by: Jayen Ashar<jayen@cse.unsw.edu.au>
> ---
>   recipes/qwt/qwt.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/qwt/qwt.inc b/recipes/qwt/qwt.inc
> index 62c8656..89035c1 100644
> --- a/recipes/qwt/qwt.inc
> +++ b/recipes/qwt/qwt.inc
> @@ -10,7 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt"
>   S = "${WORKDIR}/qwt-${PV}"
>
>   do_configure_prepend() {
> -	sed -i -e 's:RELEASE_SUFFIX      = :RELEASE_SUFFIX      = ${QT_LIBINFIX}:' *.pri
> +	sed -i -e 's:RELEASE_SUFFIX      = :RELEASE_SUFFIX      = $\${QT_LIBINFIX}:' *.pri
>   	sed -i -e s:lqwt:lqwt${QT_LIBINFIX}:g -e s:/usr/local/qwt-$\${QwtVersion}:${prefix}:g *.prf
>   	sed -e 's/#CONFIG     += QwtExamples/CONFIG     += QwtExamples/g' -i qwtconfig.pri
>   	sed -i -e s:/usr/local/qwt-${PV}:${D}${prefix}:g ${S}/*.pri

Are you using the release branch ?

this should be fixed in 26002b31b7232ee71249cc39fd8184d80ecb9ec2

Eric
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkz2xs0ACgkQGplE/Ggo/I5OlgCgoOw/af/XFsR/zebOMg4hQ+Ll
OTUAn2RwO/4SsKG6foVJIvvPNt3CCJjU
=O2SL
-----END PGP SIGNATURE-----


