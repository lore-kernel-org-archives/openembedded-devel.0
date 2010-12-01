Received: from 31.mail-out.ovh.net ([213.186.62.10])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PNgVb-0000vN-17
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 07:49:43 +0100
Received: (qmail 18516 invoked by uid 503); 1 Dec 2010 07:15:28 -0000
Received: from b6.ovh.net (HELO mail171.ha.ovh.net) (213.186.33.56)
	by 31.mail-out.ovh.net with SMTP; 1 Dec 2010 07:15:28 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 1 Dec 2010 08:48:23 +0200
Received: from unknown (HELO ?10.240.226.36?) (ebenard%eukrea.com@92.90.21.8)
	by ns0.ovh.net with SMTP; 1 Dec 2010 08:48:20 +0200
Message-ID: <4CF5EFB1.2010000@eukrea.com>
Date: Wed, 01 Dec 2010 07:48:17 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1291178841-3975-1-git-send-email-jayen@cse.unsw.edu.au>
In-Reply-To: <1291178841-3975-1-git-send-email-jayen@cse.unsw.edu.au>
X-Ovh-Tracer-Id: 17272430472634674506
X-Ovh-Remote: 92.90.21.8 ()
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.10
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_SORBS_WEB autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qwt: QT_LIBINFIX not being resolved when running qmake
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
X-List-Received-Date: Wed, 01 Dec 2010 06:49:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

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


