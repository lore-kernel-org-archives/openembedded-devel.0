Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLQmC-0007d7-JK
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 03:05:22 +0200
Received: by pvh1 with SMTP id 1so768315pvh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 18:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=BG3rhH8Ql1ghdGURxEWsz2Ggfl+2ooYEorgopoLpjM4=;
	b=GmWPEiPTp/TUFzOyzOoCTwFpuQU4BE4WzhOSKyQJDIn/x2VOdfc2KsiACfJMzqG2wW
	qruPwqXJ8jaHbyUicCgqS7K69Ef7aNyvVC6IRZqgJhg2sZYs6eUEcgYTQHM0JsJOXVV0
	e3zs4vP0L1stnCuOMZjCfnUbZ5/W4Lv+FGmSA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=tshZUlrwKHVGLA/Pv3Yqexqf9seL3vuzsv5cMpImCtyd9DT2ECV1Ch7/SNOpD9rq7m
	EHTjJKKq8OMBMo93LPG4pTjYRI/6yyqVZEIU9LahmGNSvVfUTtCT8ZsYbrXBZK1/XUIf
	i70SKU0Fl4b/UbUGIE/TaH1pqGWu/w20wfs9k=
Received: by 10.114.186.39 with SMTP id j39mr11046604waf.80.1275872450995;
	Sun, 06 Jun 2010 18:00:50 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b6sm33776879wam.21.2010.06.06.18.00.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Jun 2010 18:00:50 -0700 (PDT)
Date: Sun, 6 Jun 2010 18:00:52 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100607010052.GC6723@gmail.com>
References: <alpine.DEB.2.00.1006050315240.10247@lynx>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1006050315240.10247@lynx>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Manual: Add missing reference to "ftp" as possible fetch method.
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
X-List-Received-Date: Mon, 07 Jun 2010 01:05:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (05/06/10 03:16), Robert P. J. Day wrote:
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

applied.

thx
-Khem
> ---
> 
> diff --git a/docs/usermanual/reference/var_src_uri.xml b/docs/usermanual/reference/var_src_uri.xml
> index b858e8a..88a0a1a 100644
> --- a/docs/usermanual/reference/var_src_uri.xml
> +++ b/docs/usermanual/reference/var_src_uri.xml
> @@ -43,7 +43,7 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
> 
>    <variablelist>
>      <varlistentry>
> -      <term>http, https, ftps</term>
> +      <term>http, https, ftp, ftps</term>
> 
>        <listitem>
>          <para>Used to download files and source code via the specified URL.
> -- 
> 
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
> 
>             Linux Consulting, Training and Kernel Pedantry.
> 
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


