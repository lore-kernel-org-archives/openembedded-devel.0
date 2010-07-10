Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OXe99-0000QS-W5
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Jul 2010 19:47:43 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OXe4O-0006rK-7K from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Jul 2010 10:42:32 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sat, 10 Jul 2010 10:42:31 -0700
Received: from [172.30.80.244] ([172.30.80.244]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 10 Jul 2010 11:42:30 -0600
Message-ID: <4C38B104.8050700@mentor.com>
Date: Sat, 10 Jul 2010 10:42:28 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1278577398.15825.1.camel@lenovo.internal.reciva.com>
	<1278778757-31330-1-git-send-email-fransmeulenbroeks@gmail.com>
In-Reply-To: <1278778757-31330-1-git-send-email-fransmeulenbroeks@gmail.com>
X-OriginalArrivalTime: 10 Jul 2010 17:42:30.0909 (UTC)
	FILETIME=[456B3AD0:01CB2057]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: introduce COMPATIBLE_TARGET_SYS
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
X-List-Received-Date: Sat, 10 Jul 2010 17:47:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> This patch introduces COMPATIBLE_TARGET_SYS
> It is similar to COMPATIBLE_MACHINE but where COMPATIBLE_MACHINE
> is used to specify that a certain recipe is for a certain machine
> COMPATIBLE_TARGET_SYS can be used to specify that a certain recipe
> is for a certain architecture.
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> 
> ---
> 
> as also discussed on the oe ML in the thread
> [PATCH] classes/base.bbclass: add INCOMPATIBLE_MACHINE
> ---
>  classes/base.bbclass |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index b30310d..f76d03c 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -391,6 +391,13 @@ python () {
>              if this_machine and not re.match(need_machine, this_machine):
>                  raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
>  
> +        need_target = bb.data.getVar('COMPATIBLE_TARGET_SYS', d, 1)
> +        if need_target:
> +            import re
> +            this_target = bb.data.getVar('TARGET_SYS', d, 1)
> +            if this_target and not re.match(need_target, this_target):
> +                raise bb.parse.SkipPackage("incompatible with target system %s" % this_target)
> +
>      pn = bb.data.getVar('PN', d, 1)
>  
>      # OBSOLETE in bitbake 1.7.4


-- 
Tom Rini
Mentor Graphics Corporation


