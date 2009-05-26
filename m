Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1M8nef-0003yI-PV
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 05:48:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 71FDC4BFF09
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 23:40:41 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27949-10 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 25 May 2009 23:40:41 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id C6D0D4BFEB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 23:40:40 -0400 (EDT)
Date: Mon, 25 May 2009 23:40:40 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1243308909-9724-1-git-send-email-msmith@cbnco.com>
Message-ID: <Pine.LNX.4.64.0905252339270.6446@juice.ott.cti.com>
References: <1243308909-9724-1-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] busybox: allow building when prefix is "", not "/usr".
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
X-List-Received-Date: Tue, 26 May 2009 03:48:46 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 25 May 2009, Michael Smith wrote:

> +	for i in ${D}${base_bindir} ${D}${base_sbindir} ${prefix:+${D}${prefix}}
> +	do
>  		if [ -d $i ]; then
> -			cp -dPr $i ${D}/busybox/
> +			cp -pPR $i ${D}/busybox/
>  		fi
>  	done

I missed this in the commit message: I changed cp -dPr -> -pPR to match 
the options given a few lines above. -d implies -P, and -r/-R are 
equivalent, so I suspected a typo. I'll resend with a new description.

Mike


