Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PqW6A-0000Zb-MF
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 20:34:38 +0100
Received: by pwj9 with SMTP id 9so22927pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 11:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=RCbZU3ka5Ff5uto0LVEmSGcDo3zTsCjXZzPsmEFWzww=;
	b=d0+YxQQOiCU+9G+svsj0Bsdjjy75CGUPCKiVXHpdfDh/LYwSWHwHV1kqos5WBxCtdM
	Vfm/olAQX4ZHASV/d+XJpVmoG2Oaz+ChBTV1Y96rK1bPBzQhgxtbnjDkbeHYQKCalL30
	rnEP/R+A4MnSimsc8pKM2KZkRLYBYjruD6rx0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=P+3Xx145IbCBi0fNjxAs0PAUMH7rOLlp2cSN+cx3oTu/KV5K0CXckhlJgNHcSKLIwt
	MpEV0T+wQA53C9Xr7Ui6JJDF8Z+VVBW7P25kJtcm8nr9u25MlqhbvFshaMer8a1ZwOmj
	D6OMXNBEhUbuc1lL3KfW0TJzkTdassD9DS5vY=
Received: by 10.142.143.19 with SMTP id q19mr818932wfd.230.1298057603842;
	Fri, 18 Feb 2011 11:33:23 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w32sm4389wfh.19.2011.02.18.11.33.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 11:33:22 -0800 (PST)
Date: Fri, 18 Feb 2011 11:33:18 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110218193318.GA5650@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Fri, 18 Feb 2011 19:34:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/02/11 12:26), Tom Rini wrote:
> In order to make the user experience better we now use bb.warn
> on non-fatal QA errors and bb.error on fatal errors.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

I really would like to get these issues fixed but I guess from grand
scheme of things for now

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  classes/insane.bbclass |   12 +++++++++---
>  1 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/classes/insane.bbclass b/classes/insane.bbclass
> index a846832..3b042c9 100644
> --- a/classes/insane.bbclass
> +++ b/classes/insane.bbclass
> @@ -116,7 +116,7 @@ def package_qa_make_fatal_error(error_class, name, path,d):
>  
>      TODO: Load a whitelist of known errors
>      """
> -    return not error_class in [0, 5, 7]
> +    return not error_class in [0, 1, 5, 7]
>  
>  def package_qa_write_error(error_class, name, path, d):
>      """
> @@ -145,10 +145,16 @@ def package_qa_write_error(error_class, name, path, d):
>               (ERROR_NAMES[error_class], name, package_qa_clean_path(path,d))
>      f.close()
>  
> +# Returns False is there was a fatal problem and True if we did not hit a fatal
> +# error
>  def package_qa_handle_error(error_class, error_msg, name, path, d):
> -    bb.error("QA Issue with %s: %s" % (name, error_msg))
> +    fatal = package_qa_make_fatal_error(error_class, name, path, d)
>      package_qa_write_error(error_class, name, path, d)
> -    return not package_qa_make_fatal_error(error_class, name, path, d)
> +    if fatal:
> +        bb.error("QA Issue with %s: %s" % (name, error_msg))
> +    else:
> +        bb.warn("QA Issue with %s: %s" % (name, error_msg))
> +    return not fatal
>  
>  def package_qa_check_rpath(file,name,d, elf):
>      """
> -- 
> 1.7.3.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


