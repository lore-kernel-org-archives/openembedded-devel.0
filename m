Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OAvsq-0006tO-Bg
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 May 2010 04:04:45 +0200
Received: by pvg4 with SMTP id 4so1024285pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 May 2010 19:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=coREo1dzEW4Pi8HugGAFa3p6UXWX8dTAJ8XwwK4lTmY=;
	b=lvuyDSLSCd1hZcodwzRPCSTsZ/GkYVCOzArh6/jQSAuug2LVJYQVXA8HMUteomaCHe
	I0JPzlQ5O2CquRg7qmkr8zim6DxaSMTday0fGxqZkgTsTi7IzwOrRoj1NPro6TqqkwjJ
	pVbSCMpUqUEFSHcjdiCYLWzyUoMAtIQ/7brbo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=qJToy1dhz2ZVJQEsZk+4LjbbtRd+aSyXCuahhlyzQsgiA4Xt8ZnhRXrdQvinZs19ZB
	6n2fKdYSTq/9n1sKxWQTCRyMJedb7GrcBji82NfT2eJpbaoFbRIZo+z2q3/XotIdfi6G
	SRUiHKU+gb0uA60WHB8uo1qMGI9W3YqaOygC0=
Received: by 10.115.28.14 with SMTP id f14mr1601878waj.58.1273370452388;
	Sat, 08 May 2010 19:00:52 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c22sm17586982wam.18.2010.05.08.19.00.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 08 May 2010 19:00:51 -0700 (PDT)
Date: Sat, 8 May 2010 19:00:54 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100509020054.GA7586@gmail.com>
References: <1273368260-12668-1-git-send-email-hvontres@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1273368260-12668-1-git-send-email-hvontres@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] slugos-image: fix opkg-cl hanging on installing device tables
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
X-List-Received-Date: Sun, 09 May 2010 02:04:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (08/05/10 18:24), Henry von Tresckow wrote:
> opkg-cl was hanging during slugos image builds due to opkg-cl waiting for an answer for overwriting the device tables.
> adding " -force-defaults" to IPKG_ARGS allows the image to build
> 
> Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
> ---
>  recipes/images/slugos-image.inc |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/images/slugos-image.inc b/recipes/images/slugos-image.inc
> index 6a4b7b9..809459c 100644
> --- a/recipes/images/slugos-image.inc
> +++ b/recipes/images/slugos-image.inc
> @@ -23,3 +23,5 @@ IMAGE_LINGUAS = ""
>  IMAGE_PREPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/boot/?Image*;"
>  
>  inherit image
> +
> +IPKG_ARGS += " -force-default"

hmm when I look at the sources of opkg in .dev I dont see -force-default option
am I missing something. 

-Khem


