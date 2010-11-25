Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PLkRk-0000Gu-St
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 23:37:46 +0100
Received: by pxi17 with SMTP id 17so256395pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 14:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=t3MXbQZEzcCLNo51pWCs9QrnVwaOZAdEOkgkbzkU4o4=;
	b=Kw8R/j0d+3fRxzdDftoCgf7RyHiAtlCLmtdur1xhzYIHmCTHsIkOcaVLGrGBsiFdW5
	DsZBUE6Fxg8Ybe05FQv8wu1DFxvtkCa7mHDK1Vj7fO4VZ94v9xNq5W7ZB39rBLkzfX+P
	C0JuJBl9ZpgkMf/RTdVEWv+FzIGn3G7vitFiI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=vZ8zqsTSfxFLirOWY1xclVcaWUUeUayuwpSyQO9y/X34C2qi6wBmE4nZDchahVHLoo
	RtN4W1DUb2TNAyyK5dxgEI+OAQ2QpRyIsBODpNbFqN/dmUtjiB36m37yAMqmYUgmwJBD
	060QZR5IX1luLJdkGVhgZy/YkUKfJh1ibzjTI=
Received: by 10.142.97.16 with SMTP id u16mr1500323wfb.185.1290724588403;
	Thu, 25 Nov 2010 14:36:28 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x18sm1571125wfa.11.2010.11.25.14.36.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Nov 2010 14:36:27 -0800 (PST)
Date: Thu, 25 Nov 2010 14:35:30 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101125223530.GA26866@gmail.com>
References: <AANLkTi=tM7VYvnfq7+1RHy0mMtvgvxE+Ksc37t4D5vuJ@mail.gmail.com>
	<1290700469-3396-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1290700469-3396-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4x11: set QT_LIBINFIX and QT_DIR_NAME
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
X-List-Received-Date: Thu, 25 Nov 2010 22:37:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (25/11/10 16:54), Eric Bénard wrote:
> this will fix the following issue with qwt 5.2.1 where obj dir is:
> work/armv4t-oe-linux-gnueabi/qwt-5.2.1-r0/qwt-5.2.1/src/obj${QT_LIBINFIX}/
> instead of :
> work/armv4t-oe-linux-gnueabi/qwt-5.2.1-r0/qwt-5.2.1/src/obj/
> 
> From: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Eric Bénard <eric@eukrea.com>

please install

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>  classes/qt4x11.bbclass |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/qt4x11.bbclass b/classes/qt4x11.bbclass
> index 2d56b7e..abb1d9d 100644
> --- a/classes/qt4x11.bbclass
> +++ b/classes/qt4x11.bbclass
> @@ -2,5 +2,8 @@ DEPENDS_prepend = "${@["qt4-x11-free ", ""][(bb.data.getVar('PN', d, 1)[:12] ==
>  
>  inherit qmake2
>  
> +QT_DIR_NAME = "qt4"
> +QT_LIBINFIX = ""
> +
>  # Qt4 uses atomic instructions not supported in thumb mode
>  ARM_INSTRUCTION_SET = "arm"
> -- 
> 1.6.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


