Received: from [209.85.216.204] (helo=mail-px0-f204.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MR8Hw-0001ZH-Al
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 19:29:04 +0200
Received: by pxi42 with SMTP id 42so2839605pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2009 10:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=sRBbQHDE8A4IvEHzpSjRBm8GmNa00i2XRR6dP80GRpM=;
	b=XKJ4NJYrscKiJ2usCsFuBTdIkP2iJSZXyz2eQjl1sD9D2IK/vkiHCgjOWympHURofG
	sHBnrw9HUXkKlUB6f+5CnyVxF1mErfB2SpeQPFaq1odxqxCVWeO+jD6r8jN31iFGt4ew
	QQJCsaPH6iFHLmY7XH1v0RrntNgJa7c6QMQys=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wgAk23Yd058HRCM3+tbb8KckaQre5daK9L+LPRzOU3a+F3dkEUFrrf+n0NlUltMhew
	hi83/3jKEoqMdlNOzsE3yNVje44Nz5Q9jIi/5C3aFeQOj4GezyQFFfDuAJU4Kf2SCvGJ
	qF2hHGmcGMrUaqgrZnGYlM53YbOH5TbW9e1t8=
Received: by 10.140.178.6 with SMTP id a6mr3527326rvf.180.1247678136829;
	Wed, 15 Jul 2009 10:15:36 -0700 (PDT)
Received: from gmail.com (adsl-71-146-11-93.dsl.pltn13.sbcglobal.net
	[71.146.11.93])
	by mx.google.com with ESMTPS id k41sm12059703rvb.47.2009.07.15.10.15.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Jul 2009 10:15:35 -0700 (PDT)
Date: Wed, 15 Jul 2009 10:15:30 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090715171503.GA15057@gmail.com>
References: <1247662361-20485-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1247662361-20485-1-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: [PATCH 1/2] icecc: remove bb.errors on un-built compilers
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
X-List-Received-Date: Wed, 15 Jul 2009 17:29:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/07/09 16:52), Roman I Khimov wrote:
> Building things with icecc and BB_NUMBER_THREADS more then 1 you could see
> a lot of messages:
> 
> ERROR: no cross compiler built yet?
> 
> before gcc-cross would be properly built. There is technically nothing wrong,
> cross compiler is not there yet and it's not needed when bitbake does
> fetch-unpack-patch and other things to prepare package build. But it makes
> people uncomfortable.
> 
> We can safely kill this messages.

provided that this part of code is not executed again when cross
compiler is really needed because then we will not get the warning
where we should get it legitimately.

Thanks

-Khem


> ---
>  classes/icecc.bbclass |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/classes/icecc.bbclass b/classes/icecc.bbclass
> index 0eb2d9f..27e0e56 100644
> --- a/classes/icecc.bbclass
> +++ b/classes/icecc.bbclass
> @@ -62,7 +62,6 @@ def create_cross_env(bb,d):
>          os.stat(os.path.join(ice_dir, target_sys, 'lib', 'libstdc++.so'))
>          os.stat(os.path.join(ice_dir, target_sys, 'bin', 'g++'))
>      except: # no cross compiler built yet
> -        bb.error('no cross compiler built yet?')
>          return ""
>  
>      VERSION = icc_determine_gcc_version( os.path.join(ice_dir,target_sys,"bin","g++") )
> @@ -159,7 +158,6 @@ def create_cross_kernel_env(bb,d):
>      try:
>          os.stat(os.path.join(ice_dir, 'bin', kernel_cc))
>      except: # no cross compiler built yet
> -        bb.error('no kernel cross compiler built yet')
>          return ""
>  
>      VERSION = icc_determine_gcc_version( os.path.join(ice_dir,"bin",kernel_cc) )
> -- 
> 1.6.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


