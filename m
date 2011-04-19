Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QC8rQ-0004CA-0N
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 13:12:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id A93B0315044B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 13:10:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id dMebef+6nFdW
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 13:10:21 +0200 (CEST)
Received: from [172.22.22.61] (drms-590cf9dc.pool.mediaWays.net
	[89.12.249.220])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 9BFC631502D7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 13:10:21 +0200 (CEST)
Message-ID: <4DAD6D9B.2000909@opendreambox.org>
Date: Tue, 19 Apr 2011 13:10:19 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110411 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1302996215.3122.31.camel@utx.lan>
In-Reply-To: <1302996215.3122.31.camel@utx.lan>
Subject: Re: [PATCH 1/5] binconfig.bbclass: search configs in D instead of S
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
X-List-Received-Date: Tue, 19 Apr 2011 11:12:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/17/2011 01:23 AM, Stanislav Brabec wrote:
> Searching for binconfig in S makes more problems than it
> brings benefits. Searching in the installed root seems to be more logical.
> 
> Fixes following subtle breakages:
> - binconfig are populated with a different name that upstream intended
> - populated binconfig files that were not intended to be populated
> 
> It fixes at least ncurses, which populates ncurses-config instead of
> ncurses5-config and ncursesw5-config, causing secondary breakages.
> 
> Signed-off-by: Stanislav Brabec <utx@penguin.cz>

Acked-by: Andreas Oberritter <obi@opendreambox.org>

> diff --git a/classes/binconfig.bbclass b/classes/binconfig.bbclass
> index b3b2236..3d2bf0f 100644
> --- a/classes/binconfig.bbclass
> +++ b/classes/binconfig.bbclass
> @@ -49,7 +49,7 @@ binconfig_package_preprocess () {
>  SYSROOT_PREPROCESS_FUNCS += "binconfig_sysroot_preprocess"
>  
>  binconfig_sysroot_preprocess () {
> -	for config in `find ${S} -name '${BINCONFIG_GLOB}'`; do
> +	for config in `find ${D} -name '${BINCONFIG_GLOB}'`; do
>  		configname=`basename $config`
>  		install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
>  		cat $config | sed ${@get_binconfig_mangle(d)} > ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$configname
> 


