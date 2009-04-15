Received: from [209.85.198.243] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lu9o4-0004OP-0H
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 20:26:19 +0200
Received: by rv-out-0708.google.com with SMTP id k29so24117rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 11:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=4mR7YvtOquFJrJ4FOHE3KZoXV9oNY6L8++gHntnVOMs=;
	b=kEqo/5fzk98GBe4NCu7R4Gj8KaC7+wOLL7UTFU6OOiWrseq5BZaPVGyYRyW7lK0ALR
	RZUgKdLr55olZWqkMn5FZoL6cglRK/dOOfCzWuKFU3w4hVC9QUEpfzn89367VSsOaNBf
	fbpmrZ7hAYWvT83GrJQOQTI49eFaT31LDbXeQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=f46FbOvTd2WUuSYXvTe0oJlURm7fOzSU5UNbqEtnPalYVA8hbegjgHcMWCZJeH0axp
	ITHqkIPFo/Yj8GxHZyXA3428/stsfHNYtKjuSMaHMb+J6cmjPmNPXordn7VJ+InlzXEQ
	0DD9xzUQucq7BhUJn/guNHCZl0GGLw1ePbxnE=
Received: by 10.114.153.18 with SMTP id a18mr202014wae.200.1239819727125;
	Wed, 15 Apr 2009 11:22:07 -0700 (PDT)
Received: from gmail.com (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id k37sm72796waf.42.2009.04.15.11.22.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Apr 2009 11:22:06 -0700 (PDT)
Date: Wed, 15 Apr 2009 11:22:03 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090415182203.GB29606@gmail.com>
References: <1239782395-12413-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
MIME-Version: 1.0
In-Reply-To: <1239782395-12413-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
X-SA-Exim-Connect-IP: 209.85.198.243
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Petri Lehtinen <petri.lehtinen@inoi.fi>
Subject: Re: [PATCH] base.bbclass: Combine all checksum.ini files	found in BBPATH
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
X-List-Received-Date: Wed, 15 Apr 2009 18:26:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/04/09 10:59), petri.lehtinen+openembedded-devel@inoi.fi wrote:
> From: Petri Lehtinen <petri.lehtinen@inoi.fi>
> 
> This makes it possible for overlays to have checksum.ini.
> 
> Signed-off-by: Petri Lehtinen <petri.lehtinen@inoi.fi>
> ---
>  classes/base.bbclass |   22 +++++++++++++---------
>  1 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 9ec705b..e5fd814 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -40,12 +40,11 @@ def base_path_relative(src, dest):
>      return sep.join(relpath)
>  
>  # for MD5/SHA handling
> -def base_chk_load_parser(config_path):
> +def base_chk_load_parser(config_paths):
>      import ConfigParser, os, bb
>      parser = ConfigParser.ConfigParser()
> -    if not len(parser.read(config_path)) == 1:
> -        bb.note("Can not open the '%s' ini file" % config_path)
> -        raise Exception("Can not open the '%s'" % config_path)
> +    if len(parser.read(config_paths)) < 1:
> +        raise ValueError("no ini files could be found")
>  
>      return parser
>  
> @@ -620,13 +619,18 @@ python base_do_fetch() {
>  
>  	# Verify the SHA and MD5 sums we have in OE and check what do
>  	# in
> -	check_sum = bb.which(bb.data.getVar('BBPATH', d, True), "conf/checksums.ini")
> -	if not check_sum:
> -		bb.note("No conf/checksums.ini found, not checking checksums")
> -		return
> +	checksum_paths = bb.data.getVar('BBPATH', d, True).split(":")
> +
> +	# reverse the list to give precedence to directories that
> +	# appear first in BBPATH
> +	checksum_paths.reverse()
>  
> +	checksum_files = ["%s/conf/checksums.ini" % path for path in checksum_paths]
>  	try:
> -		parser = base_chk_load_parser(check_sum)
> +		parser = base_chk_load_parser(checksum_files)
> +	except ValueError:
> +		bb.note("No conf/checksums.ini found, not checking checksums")
> +		return
>  	except:
>  		bb.note("Creating the CheckSum parser failed")
>  		return
> -- 

Looks good to me.

> 1.6.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


