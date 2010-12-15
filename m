Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PSr0W-0005Nt-Td
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 14:03:03 +0100
Received: by fxm11 with SMTP id 11so1838538fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 05:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=yTkT0qLv7BbFTV1K8TIwDT7b/RdW9kCQIaYTI0kZjfY=;
	b=hzwRL/TQDKm0aUQdmu62tR99DmBg7klOf0BYZuL+/i8VSXgDs1EVdAiw4EDBT+dZHI
	UMlI1NYLFlXcj5vaXFEp5kdE+HGzo0HyOwnQ4NQj1AB5e/XqzaVt24g9ygmzU7zuH13w
	+uIsoVZGZvJpWwkZ+7LcKmv4nh3QprJp1+5+8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=PJmdWaoxxjwtOlrkUQ2iflHGceG1TYADaIxKBXAOYr6AtdLW7CPuo7J8gohfJolE/r
	zlgH6Br0kogqpmOcuYs+qJtL8QKrNFqNy5PPRFcmuxEJkIMaANKy4VedHpUH9jfXrKo3
	zs+fb6D5FKSbivY1DZwUUEqwMGTkK60Jhy16E=
Received: by 10.223.83.200 with SMTP id g8mr3968326fal.98.1292418083139;
	Wed, 15 Dec 2010 05:01:23 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a6sm1475399fak.3.2010.12.15.05.01.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Dec 2010 05:01:22 -0800 (PST)
Date: Wed, 15 Dec 2010 14:01:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101215130120.GB3238@jama>
References: <1292416949-688-1-git-send-email-otavio@ossystems.com.br>
	<1292417425-1328-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1292417425-1328-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.42
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] classes/gitpv.bbclass: use 'git describe' to for package version
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
X-List-Received-Date: Wed, 15 Dec 2010 13:03:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 15, 2010 at 10:50:25AM -0200, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  classes/gitpv.bbclass |   41 +++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 41 insertions(+), 0 deletions(-)
>  create mode 100644 classes/gitpv.bbclass
> 
> diff --git a/classes/gitpv.bbclass b/classes/gitpv.bbclass
> new file mode 100644
> index 0000000..c9496f1
> --- /dev/null
> +++ b/classes/gitpv.bbclass
> @@ -0,0 +1,41 @@
> +# gitpv.bbclass provides a PV variable which is a sortable version
> +# with the output of "git describe".
> +#
> +# It can handle SRCREV = ${AUTOREV}, as well as SRCREV = "<hash>"
> +
> +PV = "${@get_git_pv(d)}"

can you integrate it with
classes/gitpkgv.bbclass ?

get_git_pkgv() there is quite similar
and after improving it with git describe you can use it here as ${GITPKGV}

and maybe assign to PV only ?= as IMHO recipe should be able to say
different base version than 0.0 or use it only in PKGV..

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


