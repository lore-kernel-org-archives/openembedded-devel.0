Received: from mail-fx0-f228.google.com ([209.85.220.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NY2fe-0006zc-Ah
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 20:26:25 +0100
Received: by fxm28 with SMTP id 28so371216fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 11:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=DBtYy1NYWsnKA1AgLV6X5T6n0m5HcEezLn3FiI7sdFk=;
	b=PP04+sbkS+FH/n1ynWovuLb7DTJ7QOHr6w6qBO+KCtX5BPUvcnXPBJ5D/Zkr3c9HGK
	JxtjYMpXC9tyUzdJ5i+CM7k/GbexVl1Fxk6NPdAeQxK8PBCZ7yR4xnhI3zLaCJ/EkP9v
	6pl9dg7gwoNe7bolGpLTaqmEG9jlFYKlZycI0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wvFZ14aRt79WZYrnlmFw4oAywB3zceUn6djt5jCYZfIG7+oYYLlYsb4b6S59qCyVb2
	o2qnXPvi60u0HvSLKGfwrYHrm0GTo+Y5DL6yLGYWJAgvz+Yz/PN5sNMY4aRA9LSueGFQ
	rdKJ41HHuDhYi0uDoZ8PLEep4n0WfaTNfxXLY=
Received: by 10.87.50.38 with SMTP id c38mr1754192fgk.9.1264101844880;
	Thu, 21 Jan 2010 11:24:04 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm829019fxm.8.2010.01.21.11.24.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Jan 2010 11:24:03 -0800 (PST)
Date: Thu, 21 Jan 2010 20:24:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100121192402.GC3208@jama>
References: <4B54CD4F.8080401@dev.rtsoft.ru>
MIME-Version: 1.0
In-Reply-To: <4B54CD4F.8080401@dev.rtsoft.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.228
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix kernel build, version >= 2.6.33-rc1, arch x86
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
X-List-Received-Date: Thu, 21 Jan 2010 19:26:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 19, 2010 at 03:06:23AM +0600, Aleksey Makarov wrote:
> A check was missed in the x86 path of the stage method.  Compare it to the common path.

Pushed thanks!

> ---
>  classes/kernel.bbclass |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 83530b5..53ea252 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -112,7 +112,9 @@ kernel_do_stage() {
>  
>  	# Check for arch/x86 on i386
>  	elif [ -d arch/x86/include/asm/ ]; then
> -		cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/asm-x86/
> +		if [ -e include/asm ] ; then
> +			cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/asm-x86/
> +		fi
>  		install -d ${STAGING_KERNEL_DIR}/arch/x86/include
>  		cp -fR arch/x86/* ${STAGING_KERNEL_DIR}/arch/x86/
>  	fi
> -- 
> 1.6.4.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


