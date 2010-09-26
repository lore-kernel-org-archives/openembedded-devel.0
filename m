Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Ozloy-0003mS-L6
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 09:38:54 +0200
Received: (qmail 20025 invoked by uid 503); 26 Sep 2010 08:03:33 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 26 Sep 2010 08:03:33 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 26 Sep 2010 09:38:45 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 26 Sep 2010 09:38:43 +0200
Message-ID: <4C9EF882.9060407@eukrea.com>
Date: Sun, 26 Sep 2010 09:38:42 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100915 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
	<1285456353-27457-5-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1285456353-27457-5-git-send-email-raj.khem@gmail.com>
X-Ovh-Tracer-Id: 17907156545474440521
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 04/12] distros: Disable gnu-style hash for	mips64/mips64el
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
X-List-Received-Date: Sun, 26 Sep 2010 07:38:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

Le 26/09/2010 01:12, Khem Raj a écrit :
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   conf/distro/include/angstrom-eglibc.inc       |    2 +-
>   conf/distro/include/angstrom-glibc.inc        |    2 +-
>   conf/distro/include/angstrom-uclibc.inc       |    2 +-
>   conf/distro/include/sane-toolchain-eglibc.inc |    3 +--
>   conf/distro/include/sane-toolchain-glibc.inc  |    3 +--
>   conf/distro/include/sane-toolchain-uclibc.inc |    2 +-
>   6 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/conf/distro/include/angstrom-eglibc.inc b/conf/distro/include/angstrom-eglibc.inc
> index 4b059fc..3a62781 100644
> --- a/conf/distro/include/angstrom-eglibc.inc
> +++ b/conf/distro/include/angstrom-eglibc.inc
> @@ -23,7 +23,7 @@ BUILD_OPTIMIZATION = "-O2 -g"
>   BUILD_OPTIMIZATION_pn-perl = "-O1"
>   BUILD_OPTIMIZATION_sparc = "-O2"
>
> -TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel']]}"
> +TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]}"
>
why do you also add avr32 in this patch ?

Eric


