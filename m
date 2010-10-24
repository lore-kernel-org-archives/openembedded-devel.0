Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P9syp-0006c0-I7
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 07:18:52 +0200
Received: by fxm3 with SMTP id 3so1981977fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 22:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=U9N9KXHaqNuGe3t33oaj1rcrQTd8EK9alrzzcWaL2A0=;
	b=L+riHPzGdVrzLZdyIDrNckNYxU91K41Gt2faFGzCaIC3GZRdYroIVnduYlpZaJaVg0
	g2gDwLk6cYddtCB1oMw9KI7RBvcvxvKOmdSiVTekCfD5BsNQEOMgXIc8grsZRhH9dB/J
	Xqj/ui0NmaeO52JsnKNFC5WxAsZZzvKDvp/t4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=AE5e0jX6aomOwfwjegkaFuwjZXquO/mBch1W0hJSLBD7waRpfKrK4ceFWjxmm4S7UN
	4vwdneK47VdFP8x6j+FCJhzLVP7SkQOzjlGLr1RBH8HgAzh4u9DKr/q0mFxV0VmjMVHv
	4a7ZfR2JHtHTXDD39XAJbkN8x/+fJtBYWffqU=
Received: by 10.102.215.17 with SMTP id n17mr6263781mug.99.1287897491010;
	Sat, 23 Oct 2010 22:18:11 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm991922fal.0.2010.10.23.22.18.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Oct 2010 22:18:09 -0700 (PDT)
Date: Sun, 24 Oct 2010 07:18:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101024051815.GB3494@jama>
References: <y>
 <4cc22973.0311650a.0c4d.ffffaf69@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <4cc22973.0311650a.0c4d.ffffaf69@mx.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 14/17] Ecore: Patch to fix attribution in Ecore_Getopt.h
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
X-List-Received-Date: Sun, 24 Oct 2010 05:18:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 22, 2010 at 10:15:54PM -0200, fidencio@profusion.mobi wrote:
> From: Eduardo Lima (Etrunko) <eblima@gmail.com>
> 
> Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>

Where is ecore_getopt_attribution.patch file? and is it worth adding
now with maxrev=51081?

> ---
>  recipes/efl1/ecore_svn.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/efl1/ecore_svn.bb b/recipes/efl1/ecore_svn.bb
> index 934a52f..fcbd244 100644
> --- a/recipes/efl1/ecore_svn.bb
> +++ b/recipes/efl1/ecore_svn.bb
> @@ -1,12 +1,13 @@
>  require ecore.inc
>  SRCREV = "${EFL_SRCREV}"
> -PR = "r12"
> +PR = "r13"
>  
>  SRC_URI += "\
>    file://iconv.patch;maxrev=43996 \
>    file://exit_uclibc_dns.patch;maxrev=47076 \
>    file://exit_uclibc.patch;maxrev=50815 \
>    file://exit_uclibc_newer.patch;minrev=50816 \
> +  file://ecore_getopt_attribution.patch;maxrev=51081 \
>  "
>  
>  ECORE_OECONF = "\
> -- 
> 1.7.3.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


