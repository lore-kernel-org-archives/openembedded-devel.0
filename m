Received: from fg-out-1718.google.com ([72.14.220.157])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NhUOb-00067X-Nf
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 21:51:52 +0100
Received: by fg-out-1718.google.com with SMTP id 22so195181fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 12:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=SjKEDc388EMz5JfE0qXTX1LV9hW3MMBWZQwPE6dIHuo=;
	b=Nxi2TjE5LoFwKcl0TKWZejVDS/193XlnTOQn8QFEI11h32N0N98Nivj9zjuUwcL3la
	dwsGlrXmOkZ6rTRiN1K/JNUpW5GgzVzq4KCJ5xlOW15SLgZU4kbrMYEPpmIWQ52zHVjD
	FgNwN0Mr23YEdr08C36tqsceYL4wH8kCg62qY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=X79F+7sIsHfi6IOSVPta6tuPRxUHZA+aU8z2cewvVjmyw5w/yyhajTDp/oUDFi4QWk
	oUqlesL2SxEphF42yMyVeH4itSBWUvBtp5BbEOkt0TOTVRA/RQjDT256CHzEoTLqkR9V
	DbaEG4cuKBirg7FhVF05edWlRKzeLvUR8zm+I=
Received: by 10.86.6.23 with SMTP id 23mr12559190fgf.16.1266353352134;
	Tue, 16 Feb 2010 12:49:12 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm3732541fxm.6.2010.02.16.12.49.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Feb 2010 12:49:11 -0800 (PST)
Date: Tue, 16 Feb 2010 21:49:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100216204900.GH3233@jama>
References: <E1NhUHr-0004E5-VP@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1NhUHr-0004E5-VP@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Koen Kooi : kernel.bbclass: prepare for 2.6. 33 header move and simplify logic a bit
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
X-List-Received-Date: Tue, 16 Feb 2010 20:51:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 16, 2010 at 08:44:51PM +0000, git version control wrote:
> kernel.bbclass: prepare for 2.6.33 header move and simplify logic a bit
> 
> ---
> 
>  classes/kernel.bbclass |   11 +----------
>  1 files changed, 1 insertions(+), 10 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index d4ecf72..3a52a06 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -127,16 +127,7 @@ kernel_do_stage() {
>  	mkdir -p ${STAGING_KERNEL_DIR}/include/asm-generic
>  	cp -fR include/asm-generic/* ${STAGING_KERNEL_DIR}/include/asm-generic/
>  
> -	mkdir -p ${STAGING_KERNEL_DIR}/include/linux
> -	cp -fR include/linux/* ${STAGING_KERNEL_DIR}/include/linux/
> -
> -	mkdir -p ${STAGING_KERNEL_DIR}/include/net
> -	cp -fR include/net/* ${STAGING_KERNEL_DIR}/include/net/
> -
> -	mkdir -p ${STAGING_KERNEL_DIR}/include/pcmcia
> -	cp -fR include/pcmcia/* ${STAGING_KERNEL_DIR}/include/pcmcia/
> -
> -	for entry in drivers/crypto drivers/media include/media include/acpi include/sound include/video include/scsi include/trace; do
> +	for entry in drivers/crypto drivers/media include/generated include/linux include/net include/pcmcia include/media include/acpi include/sound include/video include/scsi include/trace; do
>  		if [ -d $entry ]; then
>  			mkdir -p ${STAGING_KERNEL_DIR}/$entry
>  			cp -fR $entry/* ${STAGING_KERNEL_DIR}/$entry/

Today I noticed that klibc is looking for some asm headers like
asm/signal.h only in asm directory, but if there was only 2.6.33+ kernel
built in staging, then there is no asm directory at all only ie
asm-generic.

Where this should be fixed? Created asm link ie here in kernel.bbclass
or in klibc recipe (maybe newer klibc already looks also for asm-generic
directory)..

Thanks

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


