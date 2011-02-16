Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpqWW-0003vZ-0t
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:11:04 +0100
Received: by pzk12 with SMTP id 12so262644pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=a24lOOj+3oxrqR+yJJbi36s4QtuSCwNgHSdnCZzwDCo=;
	b=dX044stJ71e1eCtuTlv24G8rHe1yE2ht/xe06PdA67gg0C2KSO4I6HFIyjcJgiMql/
	Nb3C5wHM6c8WQ/aOykVVE7iuWxXwYC1ecMFxdjyeWP8FR9X11fstLKtR29mHhxgD/hnM
	R4SNdbM1iLeUok/Q1ejhLmtPgPs20LPOj9tzI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=A5coogH/vD+sCG2Y8sGsaYqAh0Xl8e3AU5ygvJllJjsrBy9/2gSaE6wcjSJrnnHRu8
	2A9CdBvwsMn5exYE8TpYY5JHse8yTOZIgTkKq+BBn1mXdTMwHozsq+KdTpwuN3rlv9U6
	+q3avRSgbLV+oErqyMwPXZbZMnpIJrc4DLEaA=
Received: by 10.142.230.12 with SMTP id c12mr922212wfh.289.1297897791152;
	Wed, 16 Feb 2011 15:09:51 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m10sm73882wfl.11.2011.02.16.15.09.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 15:09:49 -0800 (PST)
Date: Wed, 16 Feb 2011 15:09:53 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216230953.GT14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-9-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1297855134-19216-9-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 09/13] sdk.bbclass: cache ${libdir} as ${target_libdir}
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
X-List-Received-Date: Wed, 16 Feb 2011 23:11:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/02/11 11:18), Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  classes/sdk.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/sdk.bbclass b/classes/sdk.bbclass
> index 4fe17b8..bf77744 100644
> --- a/classes/sdk.bbclass
> +++ b/classes/sdk.bbclass
> @@ -7,6 +7,7 @@
>  # or indirectly via dependency.  No need to be in 'world'.
>  EXCLUDE_FROM_WORLD = "1"
>  target_includedir := "${includedir}"
> +target_libdir := "${libdir}"

could you explain more why this is needed

>  
>  # Save MULTIMACH_ARCH
>  OLD_MULTIMACH_ARCH := "${MULTIMACH_ARCH}"
> -- 
> 1.7.2.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


