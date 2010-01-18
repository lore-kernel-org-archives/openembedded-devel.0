Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NWxnK-0003wQ-3m
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 21:01:53 +0100
Received: by fxm4 with SMTP id 4so1156260fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2010 11:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=jfF6Ep0vZ5FOkSeMPkxxxK/Hd3tmtPvoRm6MGDa+/AA=;
	b=q3VDFrPWBUFd4AqAIRN/Q3NBzfDbPxnq0c0BEC7peUz6okOj4vPsKjCfnHqg0NHLNR
	BI3RQhMGd4FHAJO6ofP61DTNzUY9le03etBbbu329uPUmUcTmFid45NMG+/44o9nEp8K
	IinwjAO0emnI3KIdgdEnrdvkFJL6d8UwjhjAE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=O/k4nqWto293P+fh/SQEcM70raXBfparEAephaHAuZb2DgVgAHsQJgY2kJIrgEMJC/
	c5Yo+apk5iioeJZXeOBB+NJq6so5DOEFy60tn9OrI0pKYJrI3nsyKrCoykZti4Ingq+h
	OOLWkCYYL0k5sFlJC5rMrFzPL4wgLhPML6sh8=
Received: by 10.102.207.1 with SMTP id e1mr3327245mug.100.1263844775566;
	Mon, 18 Jan 2010 11:59:35 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id y6sm19555725mug.31.2010.01.18.11.59.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 18 Jan 2010 11:59:34 -0800 (PST)
Date: Mon, 18 Jan 2010 11:59:49 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100118195949.GB31712@gmail.com>
References: <1263577018-9627-1-git-send-email-clarson@mvista.com>
MIME-Version: 1.0
In-Reply-To: <1263577018-9627-1-git-send-email-clarson@mvista.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] base.bbclass: in base_contains, check for var existance before using it
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
X-List-Received-Date: Mon, 18 Jan 2010 20:01:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/01/10 10:36), Chris Larson wrote:
> From: Brian Pomerantz <bapper@mvista.com>
> 
> When using base_contains() to check for a string in a variable for a,
> if the variable is not defined an exception occurs.  By checking the
> existance of the variable and returning false if it isn't there,
> a value can be checked for a variable regardless of whether or not it
> is defined.
> 
> Signed-off-by: Brian Pomerantz <bapper@mvista.com>
> Signed-off-by: Chris Larson <clarson@mvista.com>

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
>  classes/base.bbclass |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 384a67d..f67773a 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -226,14 +226,17 @@ def base_version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
>          return falsevalue
>  
>  def base_contains(variable, checkvalues, truevalue, falsevalue, d):
> +	val = bb.data.getVar(variable,d,1)
> +	if not val:
> +		return falsevalue
>  	matches = 0
>  	if type(checkvalues).__name__ == "str":
>  		checkvalues = [checkvalues]
>  	for value in checkvalues:
> -		if bb.data.getVar(variable,d,1).find(value) != -1:	
> +		if val.find(value) != -1:
>  			matches = matches + 1
>  	if matches == len(checkvalues):
> -		return truevalue		
> +		return truevalue
>  	return falsevalue
>  
>  def base_both_contain(variable1, variable2, checkvalue, d):
> -- 
> 1.6.4.339.g527d
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


