Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P9YDY-00050h-7E
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 09:08:41 +0200
Received: by bwz15 with SMTP id 15so1832893bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 00:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=kvSm4HVdVB9FOHgXUqe5iT88mlxsnhupCv3eV2Dp5ZU=;
	b=dOydxMBbSERuh15/XTBcbVsrKbM5OnIXAjrmVWJhtJzTRS8J44Ya34bdH2kfYgCnSf
	s7ay/lVA14wJMRd1d7SIuNosqMzNeRwhw9nUwNh/ex9AbUt0VD9/hypydDy6KHlDeWLQ
	zIrES9/UinNpG7GdBWqwFFj6DAuqmPsdWPaqE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=S4Hdzwo50fShT3rXLwhkaF0Ce6lZnCemnSN345S/hf7E9LUmF8jpCQZhSyW4cgCRhR
	LhwdbEcsdMBP3q8RUbnUGxeBIBqDlCj6lls6duKQrEL/SiOZUSPTAcNjKeiIiz6Y1gnm
	nSI987fJPezr6aqUXw2DJUqjsTaiZ/ugRQd7o=
Received: by 10.204.67.5 with SMTP id p5mr2944437bki.143.1287817683107;
	Sat, 23 Oct 2010 00:08:03 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d27sm2776304bkw.2.2010.10.23.00.08.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Oct 2010 00:08:02 -0700 (PDT)
Date: Sat, 23 Oct 2010 09:08:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101023070820.GI3527@jama>
References: <y>
 <4cc22971.0311650a.0c4d.ffffaf68@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <4cc22971.0311650a.0c4d.ffffaf68@mx.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 13/17] Ecore: update exit_uclibc.patch
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
X-List-Received-Date: Sat, 23 Oct 2010 07:08:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 22, 2010 at 10:15:53PM -0200, fidencio@profusion.mobi wrote:
> From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Why? exit_uclibc.patch is not used in revisions newer then 50815 and
exit_uclibc_newer.patch does apply OK.

from e-wm recipe:
   file://exit_uclibc.patch;maxrev=50815 \                                                                                                                    
   file://exit_uclibc_newer.patch;minrev=50816 \                                                                                                              

> 
> Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
> ---
>  recipes/efl1/ecore/exit_uclibc.patch |   26 +++++++++++++-------------
>  1 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/recipes/efl1/ecore/exit_uclibc.patch b/recipes/efl1/ecore/exit_uclibc.patch
> index 105aeed..00782f6 100644
> --- a/recipes/efl1/ecore/exit_uclibc.patch
> +++ b/recipes/efl1/ecore/exit_uclibc.patch
> @@ -1,13 +1,13 @@
> -Index: ecore/src/lib/ecore_con/ecore_con_info.c
> -===================================================================
> ---- ecore.orig/src/lib/ecore_con/ecore_con_info.c	2009-11-14 00:14:56.056955719 +0100
> -+++ ecore/src/lib/ecore_con/ecore_con_info.c	2009-11-14 00:16:40.035696191 +0100
> -@@ -243,7 +243,7 @@
> - 	  freeaddrinfo(result);
> - 	err = write(fd[1], "", 1);
> - 	close(fd[1]);
> --# ifdef __USE_ISOC99
> -+# if defined(__USE_ISOC99) && !defined(__UCLIBC__)
> - 	_Exit(0);
> - # else
> - 	_exit(0);
> +diff -upN ecore/src/lib/ecore_con/ecore_con_info.c ecore.new/src/lib/ecore_con/ecore_con_info.c
> +--- ecore/src/lib/ecore_con/ecore_con_info.c	2010-08-12 11:07:48.000000000 -0300
> ++++ ecore.new/src/lib/ecore_con/ecore_con_info.c	2010-08-12 17:16:15.508079579 -0300
> +@@ -283,7 +283,7 @@ on_error:
> +         
> +         err = write(fd[1], "", 1);
> +         close(fd[1]);
> +-#ifdef __USE_ISOC99
> ++#if defined(__USE_ISOC99) && !defined(__UCLIBC__)
> +         _Exit(0);
> + #else
> +         _exit(0);
> +Common subdirectories: ecore/src/lib/ecore_con/.svn and ecore.new/src/lib/ecore_con/.svn
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


