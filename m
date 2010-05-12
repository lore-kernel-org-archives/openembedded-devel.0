Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OCE73-0002v3-TY
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 17:44:46 +0200
Received: (qmail 19492 invoked by uid 503); 12 May 2010 15:41:15 -0000
Received: from b6.ovh.net (HELO mail612.ha.ovh.net) (213.186.33.56)
	by 26.mail-out.ovh.net with SMTP; 12 May 2010 15:41:15 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 12 May 2010 15:34:13 -0000
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 12 May 2010 15:34:11 -0000
Message-ID: <4BEACA72.5050905@eukrea.com>
Date: Wed, 12 May 2010 17:34:10 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1272921691-6963-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1272921691-6963-1-git-send-email-eric@eukrea.com>
X-Ovh-Tracer-Id: 14588003618750180681
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: k.kooi@student.utwente.nl
Subject: Re: [PATCH] module-base.bbclass: keep PR if MACHINE_KERNEL_PR is not set
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
X-List-Received-Date: Wed, 12 May 2010 15:44:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/05/2010 23:21, Eric Benard a écrit :
> Signed-off-by: Eric Benard<eric@eukrea.com>
> ---
>   classes/module-base.bbclass |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/classes/module-base.bbclass b/classes/module-base.bbclass
> index bc53e1b..9aaaa4e 100644
> --- a/classes/module-base.bbclass
> +++ b/classes/module-base.bbclass
> @@ -7,7 +7,12 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
>
>   # A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
>   # rebuilds for kernel and external modules
> -PR = "${MACHINE_KERNEL_PR}"
> +python __anonymous () {
> +    machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
> +
> +    if machine_kernel_pr:
> +       bb.data.setVar('PR', machine_kernel_pr, d)
> +}
>
>   export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
>   export KERNEL_SOURCE = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-source')}"

Actually, we loose PR if MACHINE_KERNEL_PR is not set.

Is this patch fine to solve this problem or is there another prefered way ?

Thanks,
Eric


