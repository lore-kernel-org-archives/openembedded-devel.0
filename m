Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NxVgH-0002LP-Ag
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 03:28:17 +0200
Received: by gwj21 with SMTP id 21so1097827gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 18:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=nTNc2jIrri0cx7qAhSC848KMb4VOz0fWxlhBFSTRvic=;
	b=pmgGZt2Y2OCZAmXbxKRZC4yBVwvPRpUL64zyVI3g6L+81NRCZjjljCc3wYi5nw8g8e
	f+E4A4GVE4RaEpIfgozeLEJR8ChyVx+t/IkpO1GPU5BwJ90Bg+naSI0wWsc3N5Pxxbso
	lI9iT5DlQ8aOLLLdI5+ZLQ8LQr7pjfWZyfsAs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Sn+Nd/aysc5i9bke1fsS75/UjATmO9QfC+JH/OlsBM39cZM5dBDU8H6torP2Q8ekLo
	v7aP5v/WeSC5XAtvRwOISdzew+7VNVl7TuP+j9jx/TmfIFWYa8u4A26doslwZIr+yldm
	ypE7DiZSTJ0kdS7PJ/JofO3MsCU8UyePEKZqA=
Received: by 10.151.93.17 with SMTP id v17mr2142785ybl.101.1270171499770;
	Thu, 01 Apr 2010 18:24:59 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 22sm7642495iwn.0.2010.04.01.18.24.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Apr 2010 18:24:58 -0700 (PDT)
Date: Thu, 1 Apr 2010 18:25:52 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100402012552.GA6161@gmail.com>
References: <1270170658.7652.0.camel@trini-m4400>
MIME-Version: 1.0
In-Reply-To: <1270170658.7652.0.camel@trini-m4400>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Switch insane.bbclass to endswith() and fix la/pc check
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
X-List-Received-Date: Fri, 02 Apr 2010 01:28:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/04/10 18:10), Tom Rini wrote:
> This changes insane.bbclass to use s.endswith("str") rather than s[-3:]
> == "str".  The primary motivation for this is that we have tests that
> check for 'la' and 'pc' files when we really want '.la' and '.pc' to be
> what we check for.  Also, our -dev symlink test does if test1:  if test2
> and test3: action, when it could just be if test1 and test2 and test3.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>


Acked-by: Khem Raj <raj.khem@gmail.com>

> 
> diff --git a/classes/insane.bbclass b/classes/insane.bbclass
> index c2e8d9c..c85703e 100644
> --- a/classes/insane.bbclass
> +++ b/classes/insane.bbclass
> @@ -263,11 +263,10 @@ def package_qa_check_dev(path, name,d, elf):
>          if bb.data.inherits_class(s, d):
>              return True
>  
> -    if not "-dev" in name:
> -        if path[-3:] == ".so" and os.path.islink(path):
> -            error_msg = "non -dev package contains symlink .so: %s path
> '%s'" % \
> -                     (name, package_qa_clean_path(path,d))
> -            sane = package_qa_handle_error(0, error_msg, name, path, d)
> +    if not name.endswith("-dev") and path.endswith(".so") and
> os.path.islink(path):
> +        error_msg = "non -dev package contains symlink .so: %s path '%
> s'" % \
> +                 (name, package_qa_clean_path(path,d))
> +        sane = package_qa_handle_error(0, error_msg, name, path, d)
>  
>      return sane
>  
> @@ -412,7 +411,7 @@ def package_qa_check_staged(path,d):
>      for root, dirs, files in os.walk(path):
>          for file in files:
>              path = os.path.join(root,file)
> -            if file[-2:] == "la":
> +            if file.endswith(".la"):
>                  file_content = open(path).read()
>                  # Don't check installed status for native/cross
> packages
>                  if not iscrossnative:
> @@ -422,7 +421,7 @@ def package_qa_check_staged(path,d):
>                  if workdir in file_content:
>                      error_msg = "%s failed sanity test (workdir) in
> path %s" % (file,root)
>                      sane = package_qa_handle_error(8, error_msg,
> "staging", path, d)
> -            elif file[-2:] == "pc":
> +            elif file.endswith(".pc"):
>                  file_content = open(path).read()
>                  if pkgconfigcheck in file_content:
>                      error_msg = "%s failed sanity test (tmpdir) in path
> %s" % (file,root)
> 
> 
> -- 
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


