Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1ObhEL-0002H2-VI
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 23:53:35 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1ObhEA-0007MM-1X from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 14:53:22 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 21 Jul 2010 14:53:21 -0700
Received: from [172.30.80.5] ([172.30.80.5]) by na2-mail.mgc.mentorg.com with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 21 Jul 2010 15:53:20 -0600
Message-ID: <4C476C49.5010502@mentor.com>
Date: Wed, 21 Jul 2010 14:53:13 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
	<1279735486-7050-5-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1279735486-7050-5-git-send-email-raj.khem@gmail.com>
X-OriginalArrivalTime: 21 Jul 2010 21:53:20.0928 (UTC)
	FILETIME=[22792200:01CB291F]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/4] sanity.bbclass, abi_version.conf: Bump the ABI to inform that cross has died.
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
X-List-Received-Date: Wed, 21 Jul 2010 21:53:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> * tmpdir layout is changed bump ABI version to force a rebuild.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  classes/sanity.bbclass |    2 ++
>  conf/abi_version.conf  |    2 +-
>  2 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
> index 8eb7453..cff415a 100644
> --- a/classes/sanity.bbclass
> +++ b/classes/sanity.bbclass
> @@ -149,6 +149,8 @@ def check_sanity(e):
>  			os.system(bb.data.expand("cd ${TMPDIR}/stamps; for i in */*do_populate_staging; do new=`echo $i | sed -e 's/do_populate_staging/do_populate_sysroot/'`; mv $i $new; done", e.data))
>  			f = file(abifile, "w")
>  			f.write(current_abi)
> +		elif abi == "5" and current_abi != "5":
> +			messages = messages + "Staging layout has changed. The cross directory has been deprecated and cross packages are now built under the native sysroot.\nThis requires a rebuild.\n"
>  		elif (abi != current_abi):
>  			# Code to convert from one ABI to another could go here if possible.
>  			messages = messages + "Error, TMPDIR has changed ABI (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi)
> diff --git a/conf/abi_version.conf b/conf/abi_version.conf
> index 92b6b58..a59abf6 100644
> --- a/conf/abi_version.conf
> +++ b/conf/abi_version.conf
> @@ -4,7 +4,7 @@
>  # that breaks the format and have been previously discussed on the mailing list 
>  # with general agreement from the core team.
>  #
> -OELAYOUT_ABI = "4"
> +OELAYOUT_ABI = "5"
>  
>  #
>  # DISTRO_PR allows us to regenerate all packages when a fundamental change is


-- 
Tom Rini
Mentor Graphics Corporation


