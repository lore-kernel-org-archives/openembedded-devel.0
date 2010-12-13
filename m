Received: from 29.mail-out.ovh.net ([87.98.216.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PS4av-0006mW-5A
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 10:21:23 +0100
Received: (qmail 32318 invoked by uid 503); 13 Dec 2010 09:35:07 -0000
Received: from b9.ovh.net (HELO mail645.ha.ovh.net) (213.186.33.59)
	by 29.mail-out.ovh.net with SMTP; 13 Dec 2010 09:35:07 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Dec 2010 11:24:02 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Dec 2010 11:24:01 +0200
Message-ID: <4D05E531.9050909@eukrea.com>
Date: Mon, 13 Dec 2010 10:19:45 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1292228116-6248-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1292228116-6248-1-git-send-email-Martin.Jansa@gmail.com>
X-Ovh-Tracer-Id: 16587038903341002057
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 87.98.216.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qemu-0.13.0: add D_P -1 for now, some people have segfault with it where 0.12.5 worked ok
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
X-List-Received-Date: Mon, 13 Dec 2010 09:21:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 13/12/2010 09:15, Martin Jansa wrote:
> * I've seen it on one host while building emacs-x11
> * locale generation: http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-December/027723.html
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
Acked-by: Eric Bénard <eric@eukrea.com>
> ---
>   recipes/qemu/qemu_0.13.0.bb |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/qemu/qemu_0.13.0.bb b/recipes/qemu/qemu_0.13.0.bb
> index 9ecfaa9..29ef11d 100644
> --- a/recipes/qemu/qemu_0.13.0.bb
> +++ b/recipes/qemu/qemu_0.13.0.bb
> @@ -1,6 +1,7 @@
>   LICENSE = "GPL"
>   DEPENDS = "zlib ncurses gnutls"
>   PR = "r2"
> +DEFAULT_PREFERENCE = "-1"
>   SRC_URI = "\
>       http://download.savannah.gnu.org/releases/qemu/qemu-${PV}.tar.gz \
>       file://leftover.patch \



